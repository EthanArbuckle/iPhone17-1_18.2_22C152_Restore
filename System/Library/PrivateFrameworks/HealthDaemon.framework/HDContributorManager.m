@interface HDContributorManager
- (HDContributorManager)initWithProfile:(id)a3;
- (id)_imPreferredAccount;
- (id)_primaryAppleAccount;
- (id)contributorForReference:(id)a3 error:(id *)a4;
- (id)defaultContributorReference;
- (id)insertOrLookupContributorEntityWithReference:(id)a3 transaction:(id)a4 error:(id *)a5;
@end

@implementation HDContributorManager

- (HDContributorManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDContributorManager;
  v5 = [(HDContributorManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)contributorForReference:(id)a3 error:(id *)a4
{
  p_profile = &self->_profile;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_super v8 = +[HDContributorEntity contributorForReference:v6 profile:WeakRetained error:a4];

  return v8;
}

- (id)defaultContributorReference
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v3 = [WeakRetained profileType];

  if (v3 == 1) {
    +[HDContributorReference contributorReferenceForNoContributor];
  }
  else {
  id v4 = +[HDContributorReference contributorReferenceForPrimaryUser];
  }

  return v4;
}

- (id)insertOrLookupContributorEntityWithReference:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  switch([v8 contributorType])
  {
    case 1:
      v10 = [v8 persistentID];

      if (!v10)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        v22 = @"Contributor reference for unknown type should have a persistent ID";
        goto LABEL_19;
      }
      v11 = [v8 persistentID];
      self = +[HDSQLiteEntity entityWithPersistentID:v11];

      goto LABEL_21;
    case 2:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v13 = [WeakRetained syncIdentityManager];
      v14 = [v13 currentSyncIdentity];
      v15 = [v14 entity];
      +[HDContributorEntity insertOrLookupContributorEntityForNoContributorWithTransaction:syncIdentity:error:](HDContributorEntity, "insertOrLookupContributorEntityForNoContributorWithTransaction:syncIdentity:error:", v9, [v15 persistentID], a5);
      self = (HDContributorManager *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    case 3:
      if (!self) {
        goto LABEL_21;
      }
      id v16 = v9;
      v17 = [v16 databaseForEntityClass:objc_opt_class()];

      id v31 = 0;
      v18 = +[HDContributorEntity primaryUserContributorInDatabase:v17 error:&v31];
      id v19 = v31;
      id WeakRetained = v19;
      if (v18)
      {
        self = v18;
      }
      else if (v19)
      {
        if (a5)
        {
          self = 0;
          *a5 = v19;
        }
        else
        {
          _HKLogDroppedError();
          self = 0;
        }
      }
      else
      {
        v30 = [(HDContributorManager *)self _primaryAppleAccount];
        v24 = [(HDContributorManager *)self _imPreferredAccount];
        id v29 = objc_loadWeakRetained((id *)&self->_profile);
        v28 = [v29 syncIdentityManager];
        v25 = [v28 currentSyncIdentity];
        v26 = [v25 entity];
        +[HDContributorEntity insertPrimaryUserWithAppleID:callerID:syncIdentity:database:error:](HDContributorEntity, "insertPrimaryUserWithAppleID:callerID:syncIdentity:database:error:", v30, v24, [v26 persistentID], v17, a5);
        self = (HDContributorManager *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_13;
    case 4:
      v20 = [v8 UUID];

      if (v20)
      {
        id WeakRetained = [v8 UUID];
        v13 = objc_loadWeakRetained((id *)&self->_profile);
        self = +[HDContributorEntity contributorEntityWithUUID:WeakRetained profile:v13 includeDeleted:0 error:a5];
LABEL_12:

LABEL_13:
      }
      else
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        v22 = @"Contributor reference for other type should have an UUID";
LABEL_19:
        objc_msgSend(v21, "hk_assignError:code:format:", a5, 100, v22, v27);
LABEL_20:
        self = 0;
      }
LABEL_21:

      return self;
    default:
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 100, @"Contributor reference of invalid type %ld", objc_msgSend(v8, "contributorType"));
      goto LABEL_20;
  }
}

- (id)_primaryAppleAccount
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v4 = objc_msgSend(v3, "aa_primaryAppleAccount");
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = self;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching primary Apple account", (uint8_t *)&v8, 0xCu);
    }
  }
  id v6 = [v4 appleID];

  return v6;
}

- (id)_imPreferredAccount
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v3 = (void *)getIMServiceImplClass_softClass;
  uint64_t v18 = getIMServiceImplClass_softClass;
  if (!getIMServiceImplClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getIMServiceImplClass_block_invoke;
    v20 = &unk_1E62F6B28;
    v21 = &v15;
    __getIMServiceImplClass_block_invoke((uint64_t)buf);
    id v3 = (void *)v16[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v15, 8);
  v5 = [v4 iMessageService];
  if (v5 && IMCoreLibraryCore() && getIMPreferredAccountForServiceSymbolLoc())
  {
    id v6 = v5;
    IMPreferredAccountForServiceSymbolLoc = (void (*)(id))getIMPreferredAccountForServiceSymbolLoc();
    if (!IMPreferredAccountForServiceSymbolLoc)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"IMAccount *getIMPreferredAccountForService(IMService *__strong)"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"HDContributorManager.m", 34, @"%s", dlerror());

      __break(1u);
    }
    int v8 = IMPreferredAccountForServiceSymbolLoc(v6);

    id v9 = [v8 displayName];
    _HKInitializeLogging();
    uint64_t v10 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      v11 = @"non-nil";
      if (!v9) {
        v11 = @"nil";
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v11;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: returned %{public}@ string", buf, 0x16u);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end
@interface HDDataProvenanceManager
- (HDDataProvenanceManager)initWithProfile:(id)a3;
- (NSString)description;
- (id)_localTimeZoneName;
- (id)defaultLocalDataProvenance;
- (id)defaultLocalDataProvenanceWithDeviceEntity:(id)a3;
- (id)deviceIDsForSourceIDs:(id)a3 profile:(id)a4 error:(id *)a5;
- (id)deviceNoneID;
- (id)localDataProvenanceForSourceEntity:(id)a3 version:(id)a4 deviceEntity:(id)a5;
- (id)localDeviceID;
- (id)localSourceID;
- (id)noneContributorReference;
- (id)originProvenanceForPersistentID:(id)a3 transaction:(id)a4 error:(id *)a5;
- (id)primaryUserContributorReference;
- (id)provenanceEntityForProvenance:(id)a3 error:(id *)a4;
- (id)provenanceEntityForProvenance:(id)a3 transaction:(id)a4 error:(id *)a5;
- (void)_loadDefaults;
@end

@implementation HDDataProvenanceManager

- (id)defaultLocalDataProvenanceWithDeviceEntity:(id)a3
{
  return [(HDDataProvenanceManager *)self localDataProvenanceForSourceEntity:0 version:0 deviceEntity:a3];
}

- (id)localDataProvenanceForSourceEntity:(id)a3 version:(id)a4 deviceEntity:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  -[HDDataProvenanceManager _loadDefaults]((uint64_t)self);
  if (v8)
  {
    v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
    if (v9)
    {
LABEL_3:
      v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "persistentID"));
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  v12 = 0;
LABEL_6:
  v13 = -[HDDataProvenanceManager primaryUserContributorReference]((uint64_t)self);
  id v14 = v11;
  v15 = (NSString *)v10;
  id v16 = v12;
  id v17 = v13;
  v18 = v17;
  v46 = v14;
  if (self)
  {
    v19 = v14;
    if (!v14)
    {
      v19 = -[HDDataProvenanceManager localSourceID]((uint64_t)self);
    }
    v20 = v16;
    if (!v16)
    {
      v20 = -[HDDataProvenanceManager deviceNoneID]((uint64_t)self);
    }
    v21 = v18;
    if (!v18)
    {
      v21 = -[HDDataProvenanceManager noneContributorReference]((uint64_t)self);
    }
    if (v19 && v20 && v21)
    {
      memset(buf, 0, sizeof(buf));
      v22 = [MEMORY[0x1E4F28F80] processInfo];
      v23 = v22;
      id v41 = v8;
      v42 = v18;
      id v44 = v16;
      v39 = v19;
      if (v22) {
        [v22 operatingSystemVersion];
      }
      else {
        memset(buf, 0, sizeof(buf));
      }
      id v40 = v9;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      uint64_t v26 = [WeakRetained currentSyncIdentityPersistentID];
      localSystemBuild = self->_localSystemBuild;
      localProductType = self->_localProductType;
      localSourceVersion = v15;
      if (!v15) {
        localSourceVersion = self->_localSourceVersion;
      }
      v30 = -[HDDataProvenanceManager _localTimeZoneName]((uint64_t)self);
      long long v47 = *(_OWORD *)buf;
      uint64_t v48 = *(void *)&buf[16];
      v31 = localProductType;
      v19 = v39;
      self = +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:0 syncIdentity:v26 productType:v31 systemBuild:localSystemBuild operatingSystemVersion:&v47 sourceVersion:localSourceVersion timeZoneName:v30 sourceID:v39 deviceID:v20 contributorReference:v21];

      id v9 = v40;
      id v8 = v41;
      v18 = v42;
      id v16 = v44;
    }
    else
    {
      _HKInitializeLogging();
      v24 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        v33 = v24;
        -[HDDataProvenanceManager localSourceID]((uint64_t)self);
        v34 = id v45 = v16;
        -[HDDataProvenanceManager deviceNoneID]((uint64_t)self);
        v35 = v43 = v18;
        -[HDDataProvenanceManager noneContributorReference]((uint64_t)self);
        v36 = v19;
        v38 = v37 = v15;
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2114;
        v50 = v38;
        _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "Missing local source (%{public}@), device (%{public}@) id or contributor (%{public}@)", buf, 0x20u);

        v15 = v37;
        v19 = v36;

        v18 = v43;
        id v16 = v45;
      }
      self = 0;
    }
  }
  else
  {
    v21 = v17;
    v20 = v16;
    v19 = v14;
  }

  return self;
}

- (void)_loadDefaults
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1 + 72));
  if (v2) {
    return;
  }
  v3 = -[HDDataProvenanceManager noneContributorReference](a1);

  if (!v3)
  {
    v4 = +[HDContributorReference contributorReferenceForNoContributor];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
      v7 = *(void **)(a1 + 24);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __56__HDDataProvenanceManager__setNoneContributorReference___block_invoke;
      v25 = &unk_1E62F31C0;
      uint64_t v26 = a1;
      id v8 = v6;
      id v27 = v8;
      objc_msgSend(v7, "hk_withLock:", buf);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if ([WeakRetained profileType] != 1)
  {
    id v10 = -[HDDataProvenanceManager primaryUserContributorReference](a1);

    if (v10) {
      goto LABEL_10;
    }
    id v17 = +[HDContributorReference contributorReferenceForPrimaryUser];
    if (v17)
    {
      id v18 = v17;
      v19 = *(void **)(a1 + 24);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __63__HDDataProvenanceManager__setPrimaryUserContributorReference___block_invoke;
      v25 = &unk_1E62F31C0;
      uint64_t v26 = a1;
      id WeakRetained = v18;
      id v27 = WeakRetained;
      objc_msgSend(v19, "hk_withLock:", buf);
    }
    else
    {
      id WeakRetained = 0;
    }
  }

LABEL_10:
  id v11 = objc_loadWeakRetained((id *)(a1 + 8));
  v12 = [v11 database];
  v13 = +[HDDatabaseTransactionContext contextForWriting];
  v22[4] = a1;
  id v23 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __40__HDDataProvenanceManager__loadDefaults__block_invoke;
  v22[3] = &unk_1E62F6130;
  char v14 = [v12 performTransactionWithContext:v13 error:&v23 block:v22 inaccessibilityHandler:0];
  id v15 = v23;

  if ((v14 & 1) == 0)
  {
    _HKInitializeLogging();
    id v16 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      v20 = v16;
      uint64_t v21 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%@: Failed to load data provenance default values: %{public}@", buf, 0x16u);
    }
  }
}

- (id)localSourceID
{
  if (a1)
  {
    unsigned __int8 v1 = atomic_load((unsigned __int8 *)(a1 + 72));
    if (v1)
    {
      id v3 = *(id *)(a1 + 32);
    }
    else
    {
      uint64_t v6 = 0;
      v7 = &v6;
      uint64_t v8 = 0x3032000000;
      id v9 = __Block_byref_object_copy__88;
      id v10 = __Block_byref_object_dispose__88;
      id v11 = 0;
      unsigned __int8 v2 = *(void **)(a1 + 24);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __40__HDDataProvenanceManager_localSourceID__block_invoke;
      v5[3] = &unk_1E62F3230;
      v5[4] = a1;
      v5[5] = &v6;
      objc_msgSend(v2, "hk_withLock:", v5);
      id v3 = (id)v7[5];
      _Block_object_dispose(&v6, 8);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)_localTimeZoneName
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    unsigned __int8 v2 = [WeakRetained daemon];
    id v3 = [v2 behavior];
    v4 = [v3 localTimeZone];
    v5 = [v4 name];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)defaultLocalDataProvenance
{
  return [(HDDataProvenanceManager *)self localDataProvenanceForSourceEntity:0 version:0 deviceEntity:0];
}

- (id)deviceNoneID
{
  if (a1)
  {
    unsigned __int8 v1 = atomic_load((unsigned __int8 *)(a1 + 72));
    if (v1)
    {
      id v3 = *(id *)(a1 + 48);
    }
    else
    {
      uint64_t v6 = 0;
      v7 = &v6;
      uint64_t v8 = 0x3032000000;
      id v9 = __Block_byref_object_copy__88;
      id v10 = __Block_byref_object_dispose__88;
      id v11 = 0;
      unsigned __int8 v2 = *(void **)(a1 + 24);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __39__HDDataProvenanceManager_deviceNoneID__block_invoke;
      v5[3] = &unk_1E62F3230;
      v5[4] = a1;
      v5[5] = &v6;
      objc_msgSend(v2, "hk_withLock:", v5);
      id v3 = (id)v7[5];
      _Block_object_dispose(&v6, 8);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (HDDataProvenanceManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HDDataProvenanceManager;
  v5 = [(HDDataProvenanceManager *)&v29 init];
  if (v5)
  {
    uint64_t v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    propertyLock = v5->_propertyLock;
    v5->_propertyLock = v6;

    id v8 = objc_storeWeak((id *)&v5->_profile, v4);
    id v9 = [v4 daemon];
    id v10 = [v9 behavior];

    uint64_t v11 = [v10 currentOSBuild];
    v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = @"UnknownBuild";
    }
    objc_storeStrong((id *)&v5->_localSystemBuild, v13);

    uint64_t v14 = [v10 currentDeviceProductType];
    id v15 = (void *)v14;
    if (v14) {
      id v16 = (__CFString *)v14;
    }
    else {
      id v16 = @"UnknownDevice";
    }
    objc_storeStrong((id *)&v5->_localProductType, v16);

    uint64_t v17 = [v10 currentOSVersion];
    id v18 = (void *)v17;
    if (v17) {
      v19 = (__CFString *)v17;
    }
    else {
      v19 = &stru_1F1728D60;
    }
    objc_storeStrong((id *)&v5->_localSourceVersion, v19);

    v20 = [HDDatabaseValueCache alloc];
    uint64_t v21 = [(HDDataProvenanceManager *)v5 hk_classNameWithTag:@"persistent-ids"];
    uint64_t v22 = [(HDDatabaseValueCache *)v20 initWithName:v21];
    persistentIDsByProvenanceKey = v5->_persistentIDsByProvenanceKey;
    v5->_persistentIDsByProvenanceKey = (HDDatabaseValueCache *)v22;

    v24 = [HDDatabaseValueCache alloc];
    v25 = [(HDDataProvenanceManager *)v5 hk_classNameWithTag:@"provenances"];
    uint64_t v26 = [(HDDatabaseValueCache *)v24 initWithName:v25 cacheScope:2];
    originProvenanceByPersistentID = v5->_originProvenanceByPersistentID;
    v5->_originProvenanceByPersistentID = (HDDatabaseValueCache *)v26;
  }
  return v5;
}

- (id)provenanceEntityForProvenance:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__88;
  v20 = __Block_byref_object_dispose__88;
  id v21 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__HDDataProvenanceManager_provenanceEntityForProvenance_error___block_invoke;
  v13[3] = &unk_1E62F3DD8;
  id v15 = &v16;
  v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v8 error:a4 block:v13];

  if (a4) {
    id v10 = (void *)v17[5];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

BOOL __63__HDDataProvenanceManager_provenanceEntityForProvenance_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 32) provenanceEntityForProvenance:*(void *)(a1 + 40) transaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

- (id)provenanceEntityForProvenance:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self) {
    goto LABEL_21;
  }
  -[HDDataProvenanceManager _loadDefaults]((uint64_t)self);
  id v10 = [v8 sourceVersion];
  uint64_t v11 = [v10 length];

  if (!v11) {
    [v8 setSourceVersion:&stru_1F1728D60];
  }
  v12 = [v8 deviceID];

  if (!v12)
  {
    v13 = -[HDDataProvenanceManager deviceNoneID]((uint64_t)self);
    [v8 setDeviceID:v13];
  }
  id v14 = [v8 contributorReference];

  if (!v14)
  {
    id v15 = -[HDDataProvenanceManager noneContributorReference]((uint64_t)self);
    [v8 setContributorReference:v15];
  }
  uint64_t v16 = [v8 sourceID];
  if (!v16) {
    goto LABEL_14;
  }
  uint64_t v17 = (void *)v16;
  uint64_t v18 = [v8 deviceID];
  if (!v18)
  {

    goto LABEL_14;
  }
  v19 = (void *)v18;
  v20 = [v8 contributorReference];

  if (!v20)
  {
LABEL_14:
    v42 = (void *)MEMORY[0x1E4F28C58];
    v43 = [v8 sourceID];
    id v44 = [v8 deviceID];
    id v45 = [v8 contributorReference];
    objc_msgSend(v42, "hk_assignError:code:format:", a5, 3, @"Missing data provenance source (%@), device (%@) id or contributor (%@)", v43, v44, v45);

    self = 0;
    goto LABEL_21;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v22 = [WeakRetained contributorManager];
  id v23 = [v8 contributorReference];
  id v54 = 0;
  v24 = [v22 insertOrLookupContributorEntityWithReference:v23 transaction:v9 error:&v54];
  id v25 = v54;

  if (!v24)
  {
    v46 = (_HDDataProvenanceKey *)v25;
    v31 = v46;
    if (v46)
    {
      if (a5)
      {
        v31 = v46;
        self = 0;
        *a5 = v31;
        goto LABEL_20;
      }
      _HKLogDroppedError();
    }
    self = 0;
    goto LABEL_20;
  }
  id v49 = v25;
  localSystemBuild = self->_localSystemBuild;
  id v27 = self->_localProductType;
  uint64_t v28 = localSystemBuild;
  objc_super v29 = v27;
  id v30 = v8;
  self;
  v31 = objc_alloc_init(_HDDataProvenanceKey);
  uint64_t v32 = [v30 copy];

  dataProvenance = v31->_dataProvenance;
  v31->_dataProvenance = (HDDataOriginProvenance *)v32;

  uint64_t v34 = [(NSString *)v29 copy];
  localProductType = v31->_localProductType;
  v31->_localProductType = (NSString *)v34;

  uint64_t v36 = [(NSString *)v28 copy];
  v37 = v31->_localSystemBuild;
  v31->_localSystemBuild = (NSString *)v36;

  uint64_t v38 = [(HDDataOriginProvenance *)v31->_dataProvenance hash];
  uint64_t v39 = [(NSString *)v31->_localProductType hash] ^ v38;
  v31->_hash = v39 ^ [(NSString *)v31->_localSystemBuild hash];

  persistentIDsByProvenanceKey = self->_persistentIDsByProvenanceKey;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __71__HDDataProvenanceManager__lookupOrInsertProvenance_transaction_error___block_invoke;
  v50[3] = &unk_1E62FFB28;
  id v51 = v30;
  v52 = self;
  id v53 = v24;
  id v41 = persistentIDsByProvenanceKey;
  id v25 = v49;
  self = [(HDDatabaseValueCache *)v41 fetchObjectForKey:v31 transaction:v9 error:a5 faultHandler:v50];

LABEL_20:
LABEL_21:

  if (self) {
    long long v47 = [(HDSQLiteEntity *)[HDDataProvenanceEntity alloc] initWithPersistentID:[(HDDataProvenanceManager *)self longLongValue]];
  }
  else {
    long long v47 = 0;
  }

  return v47;
}

- (id)noneContributorReference
{
  if (a1)
  {
    unsigned __int8 v1 = atomic_load((unsigned __int8 *)(a1 + 72));
    if (v1)
    {
      id v3 = *(id *)(a1 + 56);
    }
    else
    {
      uint64_t v6 = 0;
      v7 = &v6;
      uint64_t v8 = 0x3032000000;
      id v9 = __Block_byref_object_copy__88;
      id v10 = __Block_byref_object_dispose__88;
      id v11 = 0;
      unsigned __int8 v2 = *(void **)(a1 + 24);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __51__HDDataProvenanceManager_noneContributorReference__block_invoke;
      v5[3] = &unk_1E62F3230;
      v5[4] = a1;
      v5[5] = &v6;
      objc_msgSend(v2, "hk_withLock:", v5);
      id v3 = (id)v7[5];
      _Block_object_dispose(&v6, 8);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id __71__HDDataProvenanceManager__lookupOrInsertProvenance_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) syncProvenance];
  uint64_t v25 = [*(id *)(a1 + 32) syncIdentity];
  uint64_t v7 = [*(id *)(a1 + 32) productType];
  uint64_t v8 = [*(id *)(a1 + 32) systemBuild];
  id v9 = *(void **)(a1 + 32);
  id v27 = (void *)v7;
  uint64_t v28 = (void *)v8;
  uint64_t v26 = a3;
  uint64_t v24 = v6;
  if (v9) {
    [v9 operatingSystemVersion];
  }
  else {
    memset(v29, 0, 24);
  }
  id v10 = v5;
  id v11 = *(void **)(a1 + 40);
  if (v11)
  {
    v13 = v11 + 12;
    id v11 = (void *)v11[12];
    v12 = (void *)v13[1];
  }
  else
  {
    v12 = 0;
  }
  id v14 = *(void **)(a1 + 32);
  id v15 = v11;
  id v23 = v12;
  id v21 = [v14 sourceVersion];
  uint64_t v16 = [*(id *)(a1 + 32) timeZoneName];
  uint64_t v17 = [*(id *)(a1 + 32) sourceID];
  uint64_t v22 = [*(id *)(a1 + 32) deviceID];
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "persistentID"));
  v19 = +[HDDataProvenanceEntity insertOrLookupDataProvenanceForSyncProvenance:v24 syncIdentity:v25 originProductType:v27 originSystemBuild:v28 originOSVersion:v29 localProductType:v23 localSystemBuild:v15 sourceVersion:v21 timeZoneName:v16 sourceID:v17 deviceID:v22 contributorID:v18 transaction:v10 error:v26];

  if (v19) {
    [*(id *)(*(void *)(a1 + 40) + 88) setObject:*(void *)(a1 + 32) forKey:v19 transaction:v10];
  }

  return v19;
}

- (id)primaryUserContributorReference
{
  if (a1)
  {
    unsigned __int8 v1 = atomic_load((unsigned __int8 *)(a1 + 72));
    if (v1)
    {
      id v3 = *(id *)(a1 + 64);
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = &v6;
      uint64_t v8 = 0x3032000000;
      id v9 = __Block_byref_object_copy__88;
      id v10 = __Block_byref_object_dispose__88;
      id v11 = 0;
      unsigned __int8 v2 = *(void **)(a1 + 24);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __58__HDDataProvenanceManager_primaryUserContributorReference__block_invoke;
      v5[3] = &unk_1E62F3230;
      v5[4] = a1;
      v5[5] = &v6;
      objc_msgSend(v2, "hk_withLock:", v5);
      id v3 = (id)v7[5];
      _Block_object_dispose(&v6, 8);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)originProvenanceForPersistentID:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8 = a3;
  originProvenanceByPersistentID = self->_originProvenanceByPersistentID;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__HDDataProvenanceManager_originProvenanceForPersistentID_transaction_error___block_invoke;
  v13[3] = &unk_1E62FFB50;
  id v14 = v8;
  id v10 = v8;
  id v11 = [(HDDatabaseValueCache *)originProvenanceByPersistentID fetchObjectForKey:v10 transaction:a4 error:a5 faultHandler:v13];

  return v11;
}

id __77__HDDataProvenanceManager_originProvenanceForPersistentID_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 databaseForEntityClass:objc_opt_class()];

  uint64_t v7 = +[HDDataProvenanceEntity originProvenanceForPersistentID:database:error:](HDDataProvenanceEntity, "originProvenanceForPersistentID:database:error:", [*(id *)(a1 + 32) longLongValue], v6, a3);

  return v7;
}

- (id)deviceIDsForSourceIDs:(id)a3 profile:(id)a4 error:(id *)a5
{
  return +[HDDataProvenanceEntity deviceIDsForSourceIDs:a3 profile:a4 error:a5];
}

uint64_t __40__HDDataProvenanceManager__loadDefaults__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = -[HDDataProvenanceManager deviceNoneID](*(void *)(a1 + 32));

  if (v4)
  {
    id v5 = 0;
    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v7 = [WeakRetained deviceManager];
  id v46 = 0;
  id v8 = [v7 deviceEntityForNoDeviceWithError:&v46];
  id v5 = v46;

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "persistentID"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v10;
    if (v9)
    {
      v12 = *(void **)(v9 + 24);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __44__HDDataProvenanceManager__setDeviceNoneID___block_invoke;
      uint64_t v48 = &unk_1E62F31C0;
      uint64_t v49 = v9;
      v50 = v10;
      objc_msgSend(v12, "hk_withLock:", buf);
    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E4F29F18];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v11 = v13;
    uint64_t v35 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%@: Failed to get device Entity for no device: %{public}@", buf, 0x16u);
  }

LABEL_9:
LABEL_10:
  id v14 = -[HDDataProvenanceManager localSourceID](*(void *)(a1 + 32));

  if (v14)
  {
    id v15 = v5;
    goto LABEL_19;
  }
  id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v17 = [v16 sourceManager];
  id v45 = v5;
  uint64_t v18 = [v17 localDeviceSourceWithError:&v45];
  id v15 = v45;

  if (v18)
  {
    uint64_t v19 = *(void *)(a1 + 32);
    objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v18, "persistentID"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = v20;
    if (v19)
    {
      uint64_t v22 = *(void **)(v19 + 24);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __45__HDDataProvenanceManager__setLocalSourceID___block_invoke;
      uint64_t v48 = &unk_1E62F31C0;
      uint64_t v49 = v19;
      v50 = v20;
      objc_msgSend(v22, "hk_withLock:", buf);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v23 = (void *)*MEMORY[0x1E4F29F18];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    id v21 = v23;
    uint64_t v36 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%@: Failed to get local device source: %{public}@", buf, 0x16u);
  }

LABEL_18:
LABEL_19:
  uint64_t v24 = -[HDDataProvenanceManager localDeviceID](*(void *)(a1 + 32));

  if (!v24)
  {
    id v26 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v27 = [v26 deviceManager];
    id v44 = v15;
    uint64_t v28 = [v27 currentDeviceEntityWithError:&v44];
    id v25 = v44;

    if (v28)
    {
      uint64_t v29 = *(void *)(a1 + 32);
      objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v28, "persistentID"));
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v29)
      {
        uint64_t v32 = *(void **)(v29 + 24);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __45__HDDataProvenanceManager__setLocalDeviceID___block_invoke;
        uint64_t v48 = &unk_1E62F31C0;
        uint64_t v49 = v29;
        v50 = v30;
        objc_msgSend(v32, "hk_withLock:", buf);
      }
    }
    else
    {
      _HKInitializeLogging();
      v33 = (void *)*MEMORY[0x1E4F29F18];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      v31 = v33;
      uint64_t v37 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v37;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "%@: Failed to get current device entity: %{public}@", buf, 0x16u);
    }

LABEL_27:
    goto LABEL_28;
  }
  id v25 = v15;
LABEL_28:
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __40__HDDataProvenanceManager__loadDefaults__block_invoke_298;
  v42[3] = &unk_1E62F3208;
  uint64_t v43 = *(void *)(a1 + 32);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __40__HDDataProvenanceManager__loadDefaults__block_invoke_2;
  v38[3] = &unk_1E62FFBA0;
  v38[4] = v43;
  BOOL v39 = v4 == 0;
  BOOL v40 = v14 == 0;
  BOOL v41 = v24 == 0;
  [v3 onCommit:v42 orRollback:v38];

  return 1;
}

- (id)localDeviceID
{
  if (a1)
  {
    unsigned __int8 v1 = atomic_load((unsigned __int8 *)(a1 + 72));
    if (v1)
    {
      id v3 = *(id *)(a1 + 40);
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = &v6;
      uint64_t v8 = 0x3032000000;
      uint64_t v9 = __Block_byref_object_copy__88;
      id v10 = __Block_byref_object_dispose__88;
      id v11 = 0;
      unsigned __int8 v2 = *(void **)(a1 + 24);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __40__HDDataProvenanceManager_localDeviceID__block_invoke;
      v5[3] = &unk_1E62F3230;
      v5[4] = a1;
      v5[5] = &v6;
      objc_msgSend(v2, "hk_withLock:", v5);
      id v3 = (id)v7[5];
      _Block_object_dispose(&v6, 8);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __40__HDDataProvenanceManager__loadDefaults__block_invoke_298(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(v1 + 72));
    if ((v2 & 1) == 0)
    {
      v5[0] = 0;
      v5[1] = v5;
      v5[2] = 0x2020000000;
      char v6 = 0;
      id v3 = *(void **)(v1 + 24);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __47__HDDataProvenanceManager__checkDefaultsLoaded__block_invoke;
      v4[3] = &unk_1E62F3230;
      v4[4] = v1;
      v4[5] = v5;
      objc_msgSend(v3, "hk_withLock:", v4);
      _Block_object_dispose(v5, 8);
    }
  }
}

uint64_t __40__HDDataProvenanceManager__loadDefaults__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned __int8 v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__HDDataProvenanceManager__loadDefaults__block_invoke_3;
  v4[3] = &unk_1E62FFB78;
  char v5 = *(unsigned char *)(a1 + 40);
  v4[4] = v1;
  __int16 v6 = *(_WORD *)(a1 + 41);
  return objc_msgSend(v2, "hk_withLock:", v4);
}

void __40__HDDataProvenanceManager__loadDefaults__block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 48);
    *(void *)(v2 + 48) = 0;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;
  }
  if (*(unsigned char *)(a1 + 42))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  char v5 = -[HDDataProvenanceManager localSourceID]((uint64_t)self);
  uint64_t v6 = -[HDDataProvenanceManager localDeviceID]((uint64_t)self);
  long long v14 = *(_OWORD *)&self->_localSystemBuild;
  localSourceVersion = self->_localSourceVersion;
  uint64_t v8 = -[HDDataProvenanceManager _localTimeZoneName]((uint64_t)self);
  uint64_t v9 = -[HDDataProvenanceManager deviceNoneID]((uint64_t)self);
  id v10 = -[HDDataProvenanceManager noneContributorReference]((uint64_t)self);
  id v11 = -[HDDataProvenanceManager primaryUserContributorReference]((uint64_t)self);
  v12 = [v3 stringWithFormat:@"<%@:%p source=%@, device=%@, build=%@, productType=%@, sourceVersion=%@, tz=%@, noneDevice=%@, noneContributor=%@, primaryUserContributor=%@>", v4, self, v5, v6, v14, localSourceVersion, v8, v9, v10, v11];

  return (NSString *)v12;
}

uint64_t __47__HDDataProvenanceManager__checkDefaultsLoaded__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void **)(result + 32);
  BOOL v2 = v1[4] && v1[5] && v1[6] && v1[7] != 0;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v2;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    atomic_store(1u, (unsigned __int8 *)(*(void *)(result + 32) + 72));
  }
  return result;
}

void __40__HDDataProvenanceManager_localSourceID__block_invoke(uint64_t a1)
{
}

void __45__HDDataProvenanceManager__setLocalSourceID___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;
  }
}

void __40__HDDataProvenanceManager_localDeviceID__block_invoke(uint64_t a1)
{
}

void __45__HDDataProvenanceManager__setLocalDeviceID___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

void __39__HDDataProvenanceManager_deviceNoneID__block_invoke(uint64_t a1)
{
}

void __44__HDDataProvenanceManager__setDeviceNoneID___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 48);
    *(void *)(v3 + 48) = v2;
  }
}

void __51__HDDataProvenanceManager_noneContributorReference__block_invoke(uint64_t a1)
{
}

void __56__HDDataProvenanceManager__setNoneContributorReference___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 56))
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = v2;
  }
}

void __58__HDDataProvenanceManager_primaryUserContributorReference__block_invoke(uint64_t a1)
{
}

void __63__HDDataProvenanceManager__setPrimaryUserContributorReference___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v2 = [*(id *)(a1 + 40) copy];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 64);
    *(void *)(v3 + 64) = v2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProductType, 0);
  objc_storeStrong((id *)&self->_localSystemBuild, 0);
  objc_storeStrong((id *)&self->_originProvenanceByPersistentID, 0);
  objc_storeStrong((id *)&self->_persistentIDsByProvenanceKey, 0);
  objc_storeStrong((id *)&self->_propertyLock_primaryUserContributorReference, 0);
  objc_storeStrong((id *)&self->_propertyLock_noneContributorReference, 0);
  objc_storeStrong((id *)&self->_propertyLock_deviceNoneID, 0);
  objc_storeStrong((id *)&self->_propertyLock_localDeviceID, 0);
  objc_storeStrong((id *)&self->_propertyLock_localSourceID, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_localSourceVersion, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end
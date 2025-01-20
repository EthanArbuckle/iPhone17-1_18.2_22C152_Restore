@interface HDAuthorizationBackupSyncEntity
+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7;
+ (BOOL)supportsSyncStore:(id)a3;
+ (id)_backupInfoWithSyncStore:(uint64_t)a1;
+ (id)authorizationBackupPullIdentifierWithSyncStore:(id)a3;
+ (id)authorizationBackupPushIdentifierWithSyncStore:(id)a3;
+ (id)createCodableSourceAuthorizationWithSource:(id)a3 syncSession:(id)a4;
+ (id)excludedSyncIdentitiesForSession:(id)a3;
+ (id)excludedSyncStoresForSession:(id)a3;
+ (id)syncEntityIdentifier;
+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7;
+ (void)_setBackupInfo:(uint64_t)a1;
+ (void)didGenerateCodableSourceAuthorizationsForSyncSession:(id)a3;
+ (void)resetAuthorizationBackupIdentifiers;
+ (void)setAuthorizationBackupPushIdentifier:(id)a3 syncStore:(id)a4;
@end

@implementation HDAuthorizationBackupSyncEntity

+ (id)createCodableSourceAuthorizationWithSource:(id)a3 syncSession:(id)a4
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDAuthorizationBackupSyncEntity;
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSendSuper2(&v11, sel_createCodableSourceAuthorizationWithSource_syncSession_, v6, v5);
  v8 = objc_msgSend(v5, "sessionUUID", v11.receiver, v11.super_class);

  v9 = objc_msgSend(v8, "hk_dataForUUIDBytes");
  [v7 setBackupUUID:v9];

  [v7 setSource:v6];

  return v7;
}

+ (void)setAuthorizationBackupPushIdentifier:(id)a3 syncStore:(id)a4
{
  id v6 = a3;
  v7 = +[HDAuthorizationBackupSyncEntity _backupInfoWithSyncStore:]((uint64_t)a1, a4);
  id v9 = (id)[v7 mutableCopy];

  v8 = [v6 UUIDString];

  [v9 setObject:v8 forKeyedSubscript:@"PushIdentifier"];
  +[HDAuthorizationBackupSyncEntity _setBackupInfo:]((uint64_t)a1, v9);
}

+ (id)_backupInfoWithSyncStore:(uint64_t)a1
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = self;
  v4 = [v2 databaseIdentifier];

  id v5 = [v4 UUIDString];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [v3 backupInfoUserDefaultsKey];
    v8 = [v6 objectForKey:v7];

    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v9 = [v8 objectForKeyedSubscript:@"DatabaseIdentifier"];
      v10 = [v8 objectForKeyedSubscript:@"PushIdentifier"];
      if (v9)
      {
        if ([v9 isEqualToString:v5])
        {
          id v11 = v8;
LABEL_10:
          v16 = v11;

          goto LABEL_12;
        }
        if ([v10 length])
        {
          v20[0] = @"DatabaseIdentifier";
          v20[1] = @"PullIdentifier";
          v21[0] = v5;
          v21[1] = v10;
          v12 = (void *)MEMORY[0x1E4F1C9E8];
          v13 = (void **)v21;
          v14 = (__CFString **)v20;
          uint64_t v15 = 2;
          goto LABEL_9;
        }
      }
    }
    else
    {
      v10 = 0;
      id v9 = 0;
    }
    v18 = @"DatabaseIdentifier";
    v19 = v5;
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = &v19;
    v14 = &v18;
    uint64_t v15 = 1;
LABEL_9:
    id v11 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:v15];
    goto LABEL_10;
  }
  v16 = (void *)MEMORY[0x1E4F1CC08];
LABEL_12:

  return v16;
}

+ (void)_setBackupInfo:(uint64_t)a1
{
  id v5 = a2;
  id v2 = self;
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = [v2 backupInfoUserDefaultsKey];
  if (v5) {
    [v3 setObject:v5 forKey:v4];
  }
  else {
    [v3 removeObjectForKey:v4];
  }
}

+ (id)authorizationBackupPullIdentifierWithSyncStore:(id)a3
{
  v3 = +[HDAuthorizationBackupSyncEntity _backupInfoWithSyncStore:]((uint64_t)a1, a3);
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  id v5 = [v3 objectForKeyedSubscript:@"PullIdentifier"];
  id v6 = (void *)[v4 initWithUUIDString:v5];

  return v6;
}

+ (id)authorizationBackupPushIdentifierWithSyncStore:(id)a3
{
  v3 = +[HDAuthorizationBackupSyncEntity _backupInfoWithSyncStore:]((uint64_t)a1, a3);
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  id v5 = [v3 objectForKeyedSubscript:@"PushIdentifier"];
  id v6 = (void *)[v4 initWithUUIDString:v5];

  return v6;
}

+ (void)resetAuthorizationBackupIdentifiers
{
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:0 entity:48];
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t end = a4.end;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = HDSyncAnchorRangeMake(0, end);
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___HDAuthorizationBackupSyncEntity;
  LOBYTE(a7) = objc_msgSendSuper2(&v18, sel_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error_, v14, v15, v16, v13, v12, a7);

  return (char)a7;
}

+ (void)didGenerateCodableSourceAuthorizationsForSyncSession:(id)a3
{
  id v4 = a3;
  id v6 = [v4 sessionUUID];
  id v5 = [v4 syncStore];

  [a1 setAuthorizationBackupPushIdentifier:v6 syncStore:v5];
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = [a1 authorizationBackupPullIdentifierWithSyncStore:v12];
  if (v14)
  {
    v33 = a7;
    v34 = v13;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v35 = v11;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          v22 = [v21 decodedBackupUUID];
          if ([v22 isEqual:v14]) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v18);
    }

    if ([v15 count])
    {
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x1E4F29FA8];
      id v13 = v34;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        v25 = (void *)[v15 count];
        v26 = objc_opt_class();
        *(_DWORD *)buf = 134218242;
        id v41 = v25;
        __int16 v42 = 2114;
        v43 = v26;
        id v27 = v26;
        _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "Applying %lu objects for %{public}@", buf, 0x16u);
      }
      int64_t v28 = +[HDAuthorizationEntity _insertCodableSourceAuthorizations:overwriteExisting:syncStore:profile:error:]((uint64_t)HDAuthorizationEntity, v15, 0, v12, v34, (uint64_t)v33) ^ 1;
      id v11 = v35;
    }
    else
    {
      int64_t v28 = 0;
      id v13 = v34;
      id v11 = v35;
    }
  }
  else
  {
    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      *(_DWORD *)buf = 138543362;
      id v41 = (id)objc_opt_class();
      id v31 = v41;
      _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring %{public}@ objects (missing pull identifier)", buf, 0xCu);
    }
    int64_t v28 = 0;
  }

  return v28;
}

+ (id)excludedSyncStoresForSession:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

+ (id)excludedSyncIdentitiesForSession:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

+ (BOOL)supportsSyncStore:(id)a3
{
  unint64_t v3 = [a3 syncStoreType];
  return (v3 < 6) & (0x24u >> v3);
}

@end
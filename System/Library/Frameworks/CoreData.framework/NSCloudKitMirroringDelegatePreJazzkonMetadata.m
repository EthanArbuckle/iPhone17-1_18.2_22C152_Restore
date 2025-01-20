@interface NSCloudKitMirroringDelegatePreJazzkonMetadata
+ (uint64_t)allDefaultsKeys;
- (BOOL)hasCheckedCKIdentity;
- (BOOL)hasInitializedDatabaseSubscription;
- (BOOL)hasInitializedZoneSubscription;
- (BOOL)isEqual:(id)a3;
- (NSCloudKitMirroringDelegatePreJazzkonMetadata)initWithStore:(id)a3;
- (__CFString)_keyForDatabaseScope:(uint64_t)a1;
- (id)_keyForZoneName:(uint64_t)a1 owner:(uint64_t)a2 databseScope:(uint64_t)a3;
- (id)ckIdentityRecordName;
- (id)description;
- (uint64_t)changeTokenForDatabaseScope:(uint64_t)result;
- (uint64_t)changeTokenForZoneWithID:(uint64_t)a3 inDatabaseWithScope:;
- (uint64_t)lastHistoryToken;
- (uint64_t)load:(uint64_t)a1;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringDelegatePreJazzkonMetadata

+ (uint64_t)allDefaultsKeys
{
  v1[8] = *MEMORY[0x1E4F143B8];
  self;
  v1[0] = @"NSCloudKitMirroringDelegateInitializedZoneDefaultsKey";
  v1[1] = @"NSCloudKitMirroringDelegateInitializedZoneSubscriptionDefaultsKey";
  v1[2] = @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey";
  v1[3] = @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey";
  v1[4] = @"PFCloudKitServerChangeTokenKey";
  v1[5] = @"NSCloudKitMirroringDelegateLastHistoryTokenKey";
  v1[6] = @"NSCloudKitMirroringDelegateServerChangeTokensKey";
  v1[7] = @"NSCloudKitMirroringDelegateInitializedDatabaseSubscriptionKey";
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:8];
}

- (NSCloudKitMirroringDelegatePreJazzkonMetadata)initWithStore:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSCloudKitMirroringDelegatePreJazzkonMetadata;
  v4 = [(NSCloudKitMirroringDelegatePreJazzkonMetadata *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak((id *)&v4->_store, a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_store, 0);

  self->_ckIdentityRecordName = 0;
  self->_keyToPreviousServerChangeToken = 0;

  self->_lastHistoryToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegatePreJazzkonMetadata;
  [(NSCloudKitMirroringDelegatePreJazzkonMetadata *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
    id v6 = objc_loadWeakRetained((id *)a3 + 1);
    if (self->_loaded != *((unsigned __int8 *)a3 + 16)
      || self->_hasInitializedZone != *((unsigned __int8 *)a3 + 18)
      || self->_hasCheckedCKIdentity != *((unsigned __int8 *)a3 + 32)
      || self->_hasInitializedZoneSubscription != *((unsigned __int8 *)a3 + 19)
      || self->_hasInitializedDatabaseSubscription != *((unsigned __int8 *)a3 + 20))
    {
      goto LABEL_25;
    }
    objc_super v7 = (void *)[WeakRetained identifier];
    uint64_t v8 = [v6 identifier];
    if (v7 != (void *)v8)
    {
      BOOL v9 = 0;
      if (!v7 || !v8) {
        goto LABEL_26;
      }
      if (![v7 isEqualToString:v8]) {
        goto LABEL_25;
      }
    }
    ckIdentityRecordName = self->_ckIdentityRecordName;
    v11 = (NSString *)*((void *)a3 + 3);
    if (ckIdentityRecordName != v11)
    {
      BOOL v9 = 0;
      if (!ckIdentityRecordName || !v11) {
        goto LABEL_26;
      }
      if (!-[NSString isEqualToString:](ckIdentityRecordName, "isEqualToString:")) {
        goto LABEL_25;
      }
    }
    keyToPreviousServerChangeToken = self->_keyToPreviousServerChangeToken;
    v13 = (NSDictionary *)*((void *)a3 + 5);
    if (keyToPreviousServerChangeToken != v13)
    {
      BOOL v9 = 0;
      if (!keyToPreviousServerChangeToken || !v13) {
        goto LABEL_26;
      }
      if (!-[NSDictionary isEqualToDictionary:](keyToPreviousServerChangeToken, "isEqualToDictionary:")) {
        goto LABEL_25;
      }
    }
    lastHistoryToken = self->_lastHistoryToken;
    if (lastHistoryToken == *((NSPersistentHistoryToken **)a3 + 6)
      || -[NSPersistentHistoryToken isEqual:](lastHistoryToken, "isEqual:"))
    {
      BOOL v9 = 1;
    }
    else
    {
LABEL_25:
      BOOL v9 = 0;
    }
LABEL_26:

    return v9;
  }
  v16.receiver = self;
  v16.super_class = (Class)NSCloudKitMirroringDelegatePreJazzkonMetadata;
  return [(NSCloudKitMirroringDelegatePreJazzkonMetadata *)&v16 isEqual:a3];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->_loaded) {
    id v6 = @"loaded";
  }
  else {
    id v6 = @"not-loaded";
  }
  objc_super v7 = (void *)[v3 initWithFormat:@"<%@: %p; %@", v5, self, v6];
  uint64_t v8 = v7;
  if (self->_loaded)
  {
    objc_msgSend(v7, "appendFormat:", @",changed:%d", self->_hasChanges);
    objc_msgSend(v8, "appendFormat:", @",initZone:%d", self->_hasInitializedZone);
    objc_msgSend(v8, "appendFormat:", @",initZoneSub:%d", self->_hasInitializedZoneSubscription);
    objc_msgSend(v8, "appendFormat:", @",initDatabaseSub:%d", self->_hasInitializedDatabaseSubscription);
    [v8 appendFormat:@",identity:%@", self->_ckIdentityRecordName];
    objc_msgSend(v8, "appendFormat:", @",checkedIdentity:%d", self->_hasCheckedCKIdentity);
    [v8 appendString:@",changeTokens:"];
    if ([(NSDictionary *)self->_keyToPreviousServerChangeToken count])
    {
      keyToPreviousServerChangeToken = self->_keyToPreviousServerChangeToken;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __60__NSCloudKitMirroringDelegatePreJazzkonMetadata_description__block_invoke;
      v11[3] = &unk_1E544FCB8;
      v11[4] = v8;
      [(NSDictionary *)keyToPreviousServerChangeToken enumerateKeysAndObjectsUsingBlock:v11];
    }
    else
    {
      [v8 appendString:@"empty"];
    }
    [v8 appendFormat:@"historyToken:%@", self->_lastHistoryToken];
  }
  [v8 appendString:@">"];
  return v8;
}

uint64_t __60__NSCloudKitMirroringDelegatePreJazzkonMetadata_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@",%@:%@", a2, a3];
}

- (BOOL)hasInitializedZoneSubscription
{
  if (result)
  {
    if (!*(unsigned char *)(result + 16))
    {
      v1 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v2 = *MEMORY[0x1E4F1C3B8];
      id v3 = NSString;
      uint64_t v4 = objc_opt_class();
      v5 = (void *)[v1 exceptionWithName:v2, objc_msgSend(v3, "stringWithFormat:", @"%@:%@ called before load.", v4, NSStringFromSelector(sel_hasInitializedZoneSubscription)), 0 reason userInfo];
      objc_exception_throw(v5);
    }
    return *(unsigned char *)(result + 19) != 0;
  }
  return result;
}

- (BOOL)hasInitializedDatabaseSubscription
{
  if (result)
  {
    if (!*(unsigned char *)(result + 16))
    {
      v1 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v2 = *MEMORY[0x1E4F1C3B8];
      id v3 = NSString;
      uint64_t v4 = objc_opt_class();
      v5 = (void *)[v1 exceptionWithName:v2, objc_msgSend(v3, "stringWithFormat:", @"%@:%@ called before load.", v4, NSStringFromSelector(sel_hasInitializedDatabaseSubscription)), 0 reason userInfo];
      objc_exception_throw(v5);
    }
    return *(unsigned char *)(result + 20) != 0;
  }
  return result;
}

- (id)ckIdentityRecordName
{
  if (result)
  {
    if (!*((unsigned char *)result + 16))
    {
      uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v3 = *MEMORY[0x1E4F1C3B8];
      uint64_t v4 = NSString;
      uint64_t v5 = objc_opt_class();
      id v6 = (void *)[v2 exceptionWithName:v3, objc_msgSend(v4, "stringWithFormat:", @"%@:%@ called before load.", v5, NSStringFromSelector(sel_ckIdentityRecordName)), 0 reason userInfo];
      objc_exception_throw(v6);
    }
    id v1 = *((id *)result + 3);
    return v1;
  }
  return result;
}

- (BOOL)hasCheckedCKIdentity
{
  if (result)
  {
    if (!*(unsigned char *)(result + 16))
    {
      id v1 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v2 = *MEMORY[0x1E4F1C3B8];
      uint64_t v3 = NSString;
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = (void *)[v1 exceptionWithName:v2, objc_msgSend(v3, "stringWithFormat:", @"%@:%@ called before load.", v4, NSStringFromSelector(sel_hasCheckedCKIdentity)), 0 reason userInfo];
      objc_exception_throw(v5);
    }
    return *(unsigned char *)(result + 32) != 0;
  }
  return result;
}

- (uint64_t)changeTokenForZoneWithID:(uint64_t)a3 inDatabaseWithScope:
{
  if (result)
  {
    if (!*(unsigned char *)(result + 16))
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C3B8];
      objc_super v7 = NSString;
      uint64_t v8 = objc_opt_class();
      BOOL v9 = (void *)[v5 exceptionWithName:v6, objc_msgSend(v7, "stringWithFormat:", @"%@:%@ called before load.", v8, NSStringFromSelector(sel_changeTokenForZoneWithID_inDatabaseWithScope_)), 0 reason userInfo];
      objc_exception_throw(v9);
    }
    uint64_t v3 = *(void **)(result + 40);
    id v4 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForZoneName:owner:databseScope:]([a2 zoneName], objc_msgSend(a2, "ownerName"), a3);
    return [v3 objectForKey:v4];
  }
  return result;
}

- (id)_keyForZoneName:(uint64_t)a1 owner:(uint64_t)a2 databseScope:(uint64_t)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:-[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForDatabaseScope:](a3)];
  [v5 appendFormat:@".%@.%@", a1, a2];
  id v6 = (id)[v5 copy];

  return v6;
}

- (uint64_t)changeTokenForDatabaseScope:(uint64_t)result
{
  if (result)
  {
    if (!*(unsigned char *)(result + 16))
    {
      id v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3B8];
      id v6 = NSString;
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = (void *)[v4 exceptionWithName:v5, objc_msgSend(v6, "stringWithFormat:", @"%@:%@ called before load.", v7, NSStringFromSelector(sel_changeTokenForDatabaseScope_)), 0 reason userInfo];
      objc_exception_throw(v8);
    }
    uint64_t v2 = *(void **)(result + 40);
    uint64_t v3 = -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForDatabaseScope:](a2);
    return [v2 objectForKey:v3];
  }
  return result;
}

- (__CFString)_keyForDatabaseScope:(uint64_t)a1
{
  if ((unint64_t)(a1 - 1) >= 3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Unknown database scope: %lu", a1), 0 reason userInfo]);
  }
  return off_1E544FCD8[a1 - 1];
}

- (uint64_t)lastHistoryToken
{
  if (result)
  {
    if (!*(unsigned char *)(result + 16))
    {
      id v1 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v2 = *MEMORY[0x1E4F1C3B8];
      uint64_t v3 = NSString;
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = (void *)[v1 exceptionWithName:v2, objc_msgSend(v3, "stringWithFormat:", @"%@:%@ called before load.", v4, NSStringFromSelector(sel_lastHistoryToken)), 0 reason userInfo];
      objc_exception_throw(v5);
    }
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)load:(uint64_t)a1
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 16))
  {
    id Weak = objc_loadWeak((id *)(a1 + 8));
    id v47 = (id)[Weak persistentStoreCoordinator];
    uint64_t v5 = (void *)MEMORY[0x18C127630]();
    id v46 = Weak;
    id v6 = (void *)[Weak metadata];
    *(unsigned char *)(a1 + 18) = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"NSCloudKitMirroringDelegateInitializedZoneDefaultsKey"), "BOOLValue");
    *(unsigned char *)(a1 + 19) = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"NSCloudKitMirroringDelegateInitializedZoneSubscriptionDefaultsKey"), "BOOLValue");
    *(unsigned char *)(a1 + 20) = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"NSCloudKitMirroringDelegateInitializedDatabaseSubscriptionKey"), "BOOLValue");
    *(void *)(a1 + 24) = (id)[v6 objectForKey:@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"];
    *(unsigned char *)(a1 + 32) = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"), "BOOLValue");
    int v7 = 1;
    uint64_t v8 = [v6 objectForKey:@"PFCloudKitServerChangeTokenKey"];
    if (v8)
    {
      *(void *)buf = 0;
      BOOL v9 = (void *)MEMORY[0x1E4F28DC0];
      getCloudKitCKServerChangeTokenClass[0]();
      uint64_t v10 = [v9 unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:buf];
      if (v10
        || [*(id *)buf code] == 4865
        && (v11 = (void *)[*(id *)buf domain],
            ([v11 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) != 0))
      {
        uint64_t v48 = 0;
      }
      else
      {
        uint64_t v12 = [NSString stringWithFormat:@"Failed to deserialize '%@' out of the metadata for store: %@", @"PFCloudKitServerChangeTokenKey", v46];
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v13 setObject:v12 forKey:*MEMORY[0x1E4F28588]];
        if (*(void *)buf) {
          [v13 setObject:*(void *)buf forKey:*MEMORY[0x1E4F28A50]];
        }
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v15 = [v14 initWithDomain:*MEMORY[0x1E4F281F8] code:134402 userInfo:v13];

        uint64_t v48 = v15;
        int v7 = 0;
      }
    }
    else
    {
      uint64_t v48 = 0;
      uint64_t v10 = 0;
    }
    uint64_t v16 = [v6 objectForKey:@"NSCloudKitMirroringDelegateServerChangeTokensKey"];
    if (v16)
    {
      int v44 = v7;
      v17 = v5;
      *(void *)buf = 0;
      v18 = (void *)MEMORY[0x1E4F28DC0];
      v19 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_opt_class();
      getCloudKitCKServerChangeTokenClass[0]();
      v22 = objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0), v16, buf);
      if (v22)
      {
        *(void *)(a1 + 40) = v22;
        uint64_t v5 = v17;
        int v7 = v44;
      }
      else
      {
        uint64_t v25 = [NSString stringWithFormat:@"Failed to deserialize '%@' out of the metadata for store: %@", @"NSCloudKitMirroringDelegateServerChangeTokensKey", v46];
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v5 = v17;
        [v26 setObject:v25 forKey:*MEMORY[0x1E4F28588]];
        if (*(void *)buf) {
          [v26 setObject:*(void *)buf forKey:*MEMORY[0x1E4F28A50]];
        }
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v48 = [v27 initWithDomain:*MEMORY[0x1E4F281F8] code:134402 userInfo:v26];

        int v7 = 0;
      }
    }
    else
    {
      if (v10)
      {
        uint64_t v23 = getCloudKitCKCurrentUserDefaultName[0]();
        id v24 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjectsAndKeys:v10, -[NSCloudKitMirroringDelegatePreJazzkonMetadata _keyForZoneName:owner:databseScope:](@"com.apple.coredata.cloudkit.zone", v23, 2), 0];
      }
      else
      {
        id v24 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      }
      *(void *)(a1 + 40) = v24;
    }
    uint64_t v28 = [v6 objectForKey:@"NSCloudKitMirroringDelegateLastHistoryTokenKey"];
    if (v28)
    {
      *(void *)buf = 0;
      v29 = (void *)v48;
      v30 = (void *)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v28 error:buf];
      if (v30)
      {
        *(void *)(a1 + 48) = v30;
      }
      else
      {
        uint64_t v31 = [NSString stringWithFormat:@"Failed to deserialize '%@' out of the metadata for store: %@", @"NSCloudKitMirroringDelegateLastHistoryTokenKey", v46];
        id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v32 setObject:v31 forKey:*MEMORY[0x1E4F28588]];
        if (*(void *)buf) {
          [v32 setObject:*(void *)buf forKey:*MEMORY[0x1E4F28A50]];
        }
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        v29 = (void *)[v33 initWithDomain:*MEMORY[0x1E4F281F8] code:134402 userInfo:v32];

        int v7 = 0;
      }
    }
    else
    {
      v29 = (void *)v48;
    }
    id v34 = 0;
    if (!v7 && v29) {
      id v34 = v29;
    }

    if (v7)
    {
      uint64_t v3 = 1;
      *(unsigned char *)(a1 + 16) = 1;
LABEL_42:

      return v3;
    }
    if (v34)
    {
      if (a2)
      {
        uint64_t v3 = 0;
        *a2 = v34;
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v35 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v35, v36, v37, v38, v39, v40, v41, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegatePreJazzkonMetadata.m");
      v42 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringDelegatePreJazzkonMetadata.m";
        __int16 v50 = 1024;
        int v51 = 458;
        _os_log_fault_impl(&dword_18AB82000, v42, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    uint64_t v3 = 0;
    goto LABEL_42;
  }
  return 1;
}

- (void).cxx_destruct
{
}

@end
@interface PFCloudKitStoreComparer
+ (id)trimExcessiveValuesForLog:(id)a3;
- (BOOL)compareAttributesOnObject:(id)a3 toObject:(id)a4 error:(id *)a5;
- (BOOL)compareCloudKitMetadataOfStore:(id)a3 toStore:(id)a4 error:(id *)a5;
- (BOOL)compareContentOfStore:(id)a3 toStore:(id)a4 error:(id *)a5;
- (BOOL)compareDatabaseScopeAndIdentityInStore:(id)a3 toStore:(id)a4 error:(id *)a5;
- (BOOL)compareObjectsInStore:(id)a3 toStore:(id)a4 error:(id *)a5;
- (BOOL)compareRelationshipsOfRecordID:(id)a3 withStoreObject:(id)a4 andOtherObject:(id)a5 error:(id *)a6;
- (BOOL)ensureContentsMatch:(id *)a3;
- (BOOL)ensureContentsOfRecordStorageMatchForStorage:(id)a3 andOtherStore:(id)a4 error:(id *)a5;
- (BOOL)ensureContentsOfStore:(id)a3 matchContentsOfStore:(id)a4 error:(id *)a5;
- (BOOL)ensureMirroredRelationshipsMatchForStore:(id)a3 otherStore:(id)a4 error:(id *)a5;
- (BOOL)ensureMoveReceiptsMatchForStore:(id)a3 otherStore:(id)a4 error:(id *)a5;
- (BOOL)ensureRecordMetadataMatchesForRecordID:(id)a3 inStore:(id)a4 andOtherStore:(id)a5 error:(id *)a6;
- (BOOL)ensureStoresAgreeOnCloudKitTables:(id)a3 error:(id *)a4;
- (BOOL)isValue:(id)a3 equalToValue:(id)a4 forAttribute:(id)a5;
- (BOOL)onlyCompareSharedZones;
- (BOOL)validateValue:(id)a3 againstOtherValue:(id)a4 forIgnoredAttribute:(id)a5;
- (PFCloudKitArchivingUtilities)archivingUtilities;
- (PFCloudKitStoreComparer)initWithStore:(id)a3 otherStore:(id)a4;
- (PFCloudKitStoreComparisonCache)cache;
- (id)getObjectMatchingRecordID:(id)a3 fromStore:(id)a4 withManagedObjectContext:(id)a5;
- (id)getRecordIDsForRelationship:(id)a3 onObject:(id)a4;
- (void)dealloc;
- (void)setOnlyCompareSharedZones:(BOOL)a3;
@end

@implementation PFCloudKitStoreComparer

- (PFCloudKitStoreComparer)initWithStore:(id)a3 otherStore:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitStoreComparer;
  v6 = [(PFCloudKitStoreComparer *)&v8 init];
  if (v6)
  {
    v6->_cache = [[PFCloudKitStoreComparisonCache alloc] initWithStore:a3 otherStore:a4];
    v6->_archivingUtilities = objc_alloc_init(PFCloudKitArchivingUtilities);
    v6->_onlyCompareSharedZones = 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitStoreComparer;
  [(PFCloudKitStoreComparer *)&v3 dealloc];
}

- (BOOL)ensureContentsMatch:(id *)a3
{
  v5 = [(PFCloudKitStoreComparisonCache *)self->_cache store];
  v6 = [(PFCloudKitStoreComparisonCache *)self->_cache otherStore];

  return [(PFCloudKitStoreComparer *)self ensureContentsOfStore:v5 matchContentsOfStore:v6 error:a3];
}

- (BOOL)ensureContentsOfStore:(id)a3 matchContentsOfStore:(id)a4 error:(id *)a5
{
  v40[2] = *MEMORY[0x1E4F143B8];
  v31 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "URL"), "isEqual:", objc_msgSend(a4, "URL"))) {
    goto LABEL_2;
  }
  if ([a3 isCloudKitEnabled]) {
    int v10 = 1;
  }
  else {
    int v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKey:", @"NSCloudKitMirroringDelegateReadOnlyOptionKey"), "BOOLValue");
  }
  if ([a4 isCloudKitEnabled]) {
    int v11 = 1;
  }
  else {
    int v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "options"), "objectForKey:", @"NSCloudKitMirroringDelegateReadOnlyOptionKey"), "BOOLValue");
  }
  if (v10 != v11)
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F281F8];
    uint64_t v36 = *MEMORY[0x1E4F28588];
    uint64_t v37 = [NSString stringWithFormat:@"Stores don't match because they do not have the same mirroring options:\n%@ - %@\n%@ - %@", a3, objc_msgSend(a3, "options"), a4, objc_msgSend(a4, "options")];
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v26 = v23;
    uint64_t v27 = v24;
    goto LABEL_19;
  }
  v40[0] = a3;
  v40[1] = a4;
  if (!-[PFCloudKitStoreComparer ensureStoresAgreeOnCloudKitTables:error:](self, "ensureStoresAgreeOnCloudKitTables:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2], &v31)|| !-[PFCloudKitStoreComparer compareContentOfStore:toStore:error:](self, "compareContentOfStore:toStore:error:", a3, a4, &v31))
  {
LABEL_15:
    v14 = v31;
    if (!v31)
    {
LABEL_16:
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v22 = __pflogFaultLog;
      BOOL v9 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v9) {
        return v9;
      }
      *(_DWORD *)buf = 136315394;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
      __int16 v34 = 1024;
      int v35 = 123;
      _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      goto LABEL_22;
    }
LABEL_20:
    if (a5)
    {
      LOBYTE(v9) = 0;
      *a5 = v14;
      return v9;
    }
LABEL_22:
    LOBYTE(v9) = 0;
    return v9;
  }
  uint64_t v12 = [a3 mirroringDelegate];
  uint64_t v13 = [a4 mirroringDelegate];
  if (!v12 || !v13)
  {
    if (!(v12 | v13)) {
      goto LABEL_2;
    }
    v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F281F8];
    uint64_t v38 = *MEMORY[0x1E4F28588];
    uint64_t v39 = [NSString stringWithFormat:@"Stores don't match because they do not have the same mirroring configuration:\n%@ - %@\n%@ - %@", a3, v12, a4, v13];
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v26 = v28;
    uint64_t v27 = v29;
LABEL_19:
    v14 = (void *)[v26 errorWithDomain:v27 code:134060 userInfo:v25];
    v31 = v14;
    if (!v14) {
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  if (![(PFCloudKitStoreComparer *)self compareCloudKitMetadataOfStore:a3 toStore:a4 error:&v31])goto LABEL_15; {
LABEL_2:
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (id)getObjectMatchingRecordID:(id)a3 fromStore:(id)a4 withManagedObjectContext:(id)a5
{
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3052000000;
  int v11 = __Block_byref_object_copy__52;
  uint64_t v12 = __Block_byref_object_dispose__52;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88__PFCloudKitStoreComparer_getObjectMatchingRecordID_fromStore_withManagedObjectContext___block_invoke;
  v7[3] = &unk_1E544C638;
  v7[4] = self;
  v7[5] = a3;
  v7[7] = a5;
  v7[8] = &v8;
  v7[6] = a4;
  [a5 performBlockAndWait:v7];
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __88__PFCloudKitStoreComparer_getObjectMatchingRecordID_fromStore_withManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectIDForRecordID:*(void *)(a1 + 40) inStore:*(void *)(a1 + 48)];
  if (v2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = (id)[*(id *)(a1 + 56) objectWithID:v2];
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "entity"), "attributesByName"), "objectForKey:", @"ckRecordID"))
    {
      objc_super v3 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) valueForKey:@"ckRecordID"];
      if ([v3 length])
      {
        uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectIDForIdentifier:v3 inStore:*(void *)(a1 + 48)];
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "recordName"), "isEqualToString:", v3))
        {
          if ((objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "objectID"), "isEqual:", v4) & 1) == 0)
          {
            uint64_t v5 = [NSString stringWithUTF8String:"Record name appears to point to two different objects: %@ / %@"];
            uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectID];
            _NSCoreDataLog(17, v5, v7, v8, v9, v10, v11, v12, v6);
            uint64_t v13 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectID];
              *(_DWORD *)buf = 138412546;
              uint64_t v28 = v14;
              __int16 v29 = 2112;
              uint64_t v30 = v4;
              uint64_t v15 = "CoreData: Record name appears to point to two different objects: %@ / %@";
              uint64_t v16 = v13;
LABEL_11:
              _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, v15, buf, 0x16u);
            }
          }
        }
        else
        {
          uint64_t v17 = [NSString stringWithUTF8String:"Record name does not match recordID, even though our metadata linked this row with '%@': %@"];
          _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, *(void *)(a1 + 40));
          uint64_t v24 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v25 = *(void *)(a1 + 40);
            uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
            *(_DWORD *)buf = 138412546;
            uint64_t v28 = v25;
            __int16 v29 = 2112;
            uint64_t v30 = v26;
            uint64_t v15 = "CoreData: Record name does not match recordID, even though our metadata linked this row with '%@': %@";
            uint64_t v16 = v24;
            goto LABEL_11;
          }
        }
      }
    }
  }
}

- (BOOL)compareContentOfStore:(id)a3 toStore:(id)a4 error:(id *)a5
{
  v61[1] = *MEMORY[0x1E4F143B8];
  v52 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "URL"), "isEqual:", objc_msgSend(a4, "URL"))) {
    goto LABEL_2;
  }
  if (![(PFCloudKitStoreComparisonCache *)self->_cache populate:&v52]
    || ![(PFCloudKitStoreComparer *)self compareDatabaseScopeAndIdentityInStore:a3 toStore:a4 error:&v52]|| ![(PFCloudKitStoreComparer *)self compareObjectsInStore:a3 toStore:a4 error:&v52])
  {
    goto LABEL_24;
  }
  if (![(PFCloudKitStoreComparisonCache *)self->_cache checkCloudKitMetadata]) {
    goto LABEL_2;
  }
  cache = self->_cache;
  if (!self->_onlyCompareSharedZones)
  {
    id v19 = [(PFCloudKitStoreComparisonCache *)cache mtmKeysForStore:a3];
    id v20 = [(PFCloudKitStoreComparisonCache *)self->_cache mtmKeysForStore:a4];
    if ([v19 isEqualToSet:v20]) {
      goto LABEL_2;
    }
    uint64_t v21 = (void *)[v19 mutableCopy];
    [v21 minusSet:v20];
    uint64_t v22 = (void *)[v20 mutableCopy];
    [v22 minusSet:v19];
    uint64_t v23 = [NSString stringWithFormat:@"Mirrored relationships don't match for stores:\nStore has these extra keys: %@\n%@\nOther Store has these extra keys: %@\n%@", objc_msgSend(a3, "URL"), objc_msgSend((id)objc_msgSend(v21, "allObjects"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_), objc_msgSend(a4, "URL"), objc_msgSend((id)objc_msgSend(v22, "allObjects"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_)];
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F281F8];
    uint64_t v60 = *MEMORY[0x1E4F28588];
    v61[0] = v23;
    uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v27 = v61;
    uint64_t v28 = &v60;
LABEL_23:
    v52 = objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 134060, objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1));

LABEL_24:
    if (v52)
    {
      if (a5)
      {
        LOBYTE(v9) = 0;
        *a5 = v52;
        return v9;
      }
    }
    else
    {
      uint64_t v38 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      v45 = __pflogFaultLog;
      BOOL v9 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v9) {
        return v9;
      }
      *(_DWORD *)buf = 136315394;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
      __int16 v55 = 1024;
      int v56 = 228;
      _os_log_fault_impl(&dword_18AB82000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v9) = 0;
    return v9;
  }
  id v11 = [(PFCloudKitStoreComparisonCache *)cache sharedZoneIDsForStore:a3];
  if (!objc_msgSend(v11, "isEqualToSet:", -[PFCloudKitStoreComparisonCache sharedZoneIDsForStore:](self->_cache, "sharedZoneIDsForStore:", a4)))
  {
    uint64_t v29 = [NSString stringWithUTF8String:"I don't know how to handle skewed shares yet."];
    _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, v47);
    uint64_t v36 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v36, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to handle skewed shares yet.", buf, 2u);
    }
    goto LABEL_2;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (!v12)
  {
LABEL_2:
    LOBYTE(v9) = 1;
    return v9;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v49;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v49 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8 * i);
      id v17 = [(PFCloudKitStoreComparisonCache *)self->_cache mtmKeysForRecordZone:v16 inStore:a3];
      id v18 = [(PFCloudKitStoreComparisonCache *)self->_cache mtmKeysForRecordZone:v16 inStore:a4];
      if (([v17 isEqualToSet:v18] & 1) == 0)
      {
        uint64_t v21 = (void *)[v17 mutableCopy];
        [v21 minusSet:v18];
        uint64_t v22 = (void *)[v18 mutableCopy];
        [v22 minusSet:v17];
        uint64_t v37 = [NSString stringWithFormat:@"Mirrored relationships don't match for stores:\nStore has these extra keys: %@\n%@\nOther Store has these extra keys: %@\n%@", objc_msgSend(a3, "URL"), objc_msgSend((id)objc_msgSend(v21, "allObjects"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_), objc_msgSend(a4, "URL"), objc_msgSend((id)objc_msgSend(v22, "allObjects"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_)];
        uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v25 = *MEMORY[0x1E4F281F8];
        uint64_t v57 = *MEMORY[0x1E4F28588];
        uint64_t v58 = v37;
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v27 = &v58;
        uint64_t v28 = &v57;
        goto LABEL_23;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v48 objects:v59 count:16];
    LOBYTE(v9) = 1;
    if (v13) {
      continue;
    }
    return v9;
  }
}

- (BOOL)compareDatabaseScopeAndIdentityInStore:(id)a3 toStore:(id)a4 error:(id *)a5
{
  v42[3] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = -[PFCloudKitStoreComparisonCache databaseScopeForStoreWithIdentifier:](self->_cache, "databaseScopeForStoreWithIdentifier:", [a3 identifier]);
  int64_t v10 = -[PFCloudKitStoreComparisonCache databaseScopeForStoreWithIdentifier:](self->_cache, "databaseScopeForStoreWithIdentifier:", [a4 identifier]);
  if (!self->_onlyCompareSharedZones && v9 != v10)
  {
    uint64_t v16 = v10;
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    v41[0] = [NSString stringWithFormat:@"%@-scope", objc_msgSend(a3, "identifier")];
    v42[0] = softLinkCKDatabaseScopeString(v9);
    v41[1] = [NSString stringWithFormat:@"%@-scope", objc_msgSend(a4, "identifier")];
    uint64_t v19 = softLinkCKDatabaseScopeString(v16);
    v41[2] = *MEMORY[0x1E4F28588];
    v42[1] = v19;
    v42[2] = @"CloudKit database scope doesn't match.";
    id v20 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v21 = v42;
    uint64_t v22 = v41;
    goto LABEL_11;
  }
  LOBYTE(v12) = 1;
  if (!self->_onlyCompareSharedZones && v9 != 1)
  {
    uint64_t v13 = -[PFCloudKitStoreComparisonCache identityRecordNameForStoreWithIdentifier:](self->_cache, "identityRecordNameForStoreWithIdentifier:", [a3 identifier]);
    uint64_t v14 = -[PFCloudKitStoreComparisonCache identityRecordNameForStoreWithIdentifier:](self->_cache, "identityRecordNameForStoreWithIdentifier:", [a4 identifier]);
    if (v13 != v14)
    {
      uint64_t v15 = v14;
      if (([(__CFString *)v13 isEqualToString:v14] & 1) == 0)
      {
        id v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v18 = *MEMORY[0x1E4F281F8];
        v39[0] = *MEMORY[0x1E4F28588];
        v40[0] = @"Store identity record names do not match.";
        v39[1] = [NSString stringWithFormat:@"%@-identity", objc_msgSend(a3, "identifier")];
        if (v13) {
          uint64_t v32 = v13;
        }
        else {
          uint64_t v32 = @"nil";
        }
        v40[1] = v32;
        v39[2] = [NSString stringWithFormat:@"%@-identity", objc_msgSend(a4, "identifier")];
        if (v15) {
          uint64_t v33 = v15;
        }
        else {
          uint64_t v33 = @"nil";
        }
        v40[2] = v33;
        id v20 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v21 = v40;
        uint64_t v22 = v39;
LABEL_11:
        uint64_t v23 = objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 134060, objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 3));
        if (v23)
        {
          if (a5)
          {
            LOBYTE(v12) = 0;
            *a5 = v23;
            return v12;
          }
        }
        else
        {
          uint64_t v24 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
          uint64_t v31 = __pflogFaultLog;
          BOOL v12 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
          if (!v12) {
            return v12;
          }
          *(_DWORD *)buf = 136315394;
          uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
          __int16 v37 = 1024;
          int v38 = 273;
          _os_log_fault_impl(&dword_18AB82000, v31, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        LOBYTE(v12) = 0;
        return v12;
      }
    }
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)compareObjectsInStore:(id)a3 toStore:(id)a4 error:(id *)a5
{
  v81[3] = *MEMORY[0x1E4F143B8];
  v68 = 0;
  id v9 = -[PFCloudKitStoreComparisonCache identifiersForStore:](self->_cache, "identifiersForStore:");
  id v10 = [(PFCloudKitStoreComparisonCache *)self->_cache identifiersForStore:a4];
  id v11 = [(PFCloudKitStoreComparisonCache *)self->_cache recordIdsForStore:a3];
  id v12 = [(PFCloudKitStoreComparisonCache *)self->_cache recordIdsForStore:a4];
  id v63 = [(PFCloudKitStoreComparisonCache *)self->_cache sharedZoneIDsForStore:a3];
  id v61 = a4;
  id v60 = [(PFCloudKitStoreComparisonCache *)self->_cache sharedZoneIDsForStore:a4];
  id v62 = v11;
  if (!self->_onlyCompareSharedZones)
  {
    uint64_t v36 = [v9 count];
    if (v36 == [v10 count])
    {
      if ([v11 isEqualToSet:v12]) {
        goto LABEL_2;
      }
      __int16 v37 = (void *)[v11 mutableCopy];
      [v37 minusSet:v12];
      id v19 = (id)[v12 mutableCopy];
      [v19 minusSet:v11];
      int v56 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F281F8];
      v80[0] = *MEMORY[0x1E4F28588];
      id v59 = v12;
      v81[0] = [NSString stringWithFormat:@"Stores do not contain the same record names. (%@:%lu / %@:%lu)", objc_msgSend(a3, "identifier"), objc_msgSend(v11, "count"), objc_msgSend(a4, "identifier"), objc_msgSend(v12, "count")];
      v80[1] = [a3 identifier];
      v81[1] = v37;
      v80[2] = [a4 identifier];
      v81[2] = v19;
      v68 = objc_msgSend(v56, "errorWithDomain:code:userInfo:", v54, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v81, v80, 3));
    }
    else
    {
      v53 = (void *)[v9 mutableCopy];
      [v53 minusSet:v10];
      v52 = (void *)[v10 mutableCopy];
      [v52 minusSet:v9];
      int v38 = (void *)[v11 mutableCopy];
      [v38 minusSet:v12];
      id v59 = v12;
      id v19 = (id)[v12 mutableCopy];
      [v19 minusSet:v62];
      uint64_t v57 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = *MEMORY[0x1E4F281F8];
      v78[0] = *MEMORY[0x1E4F28588];
      v79[0] = [NSString stringWithFormat:@"Stores do not contain the same identifiers. (%@:%lu / %@:%lu)", objc_msgSend(a3, "identifier"), objc_msgSend(v9, "count"), objc_msgSend(a4, "identifier"), objc_msgSend(v10, "count")];
      v78[1] = [a3 identifier];
      v79[1] = v53;
      v78[2] = [a4 identifier];
      v79[2] = v52;
      v78[3] = [NSString stringWithFormat:@"%@-RecordIDs", objc_msgSend(a3, "identifier")];
      v79[3] = v38;
      v78[4] = [NSString stringWithFormat:@"%@-RecordIDs", objc_msgSend(a4, "identifier")];
      v79[4] = v19;
      v68 = objc_msgSend(v57, "errorWithDomain:code:userInfo:", v55, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v79, v78, 5));

LABEL_36:
      id v11 = v62;
    }
LABEL_37:

    BOOL v35 = 0;
LABEL_38:
    id v12 = v59;
    goto LABEL_39;
  }
LABEL_2:
  if ([v11 count]
    && (long long v66 = 0u,
        long long v67 = 0u,
        long long v64 = 0u,
        long long v65 = 0u,
        (uint64_t v13 = [v11 countByEnumeratingWithState:&v64 objects:v77 count:16]) != 0))
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v65;
    uint64_t v58 = a5;
    id v59 = v12;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v65 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v64 + 1) + 8 * v16);
        if (!self->_onlyCompareSharedZones
          || objc_msgSend(v63, "containsObject:", objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * v16), "zoneID"))&& objc_msgSend(v60, "containsObject:", objc_msgSend(v17, "zoneID")))
        {
          id v18 = [(PFCloudKitStoreComparer *)self getObjectMatchingRecordID:v17 fromStore:a3 withManagedObjectContext:[(PFCloudKitStoreComparisonCache *)self->_cache storeMoc]];
          id v19 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "entity"), "relationshipsByName"), "allValues");
          if (!v18)
          {
            uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v40 = *MEMORY[0x1E4F281F8];
            uint64_t v69 = *MEMORY[0x1E4F28588];
            uint64_t v70 = [NSString stringWithFormat:@"Failed to retrieve object with recordID '%@' from store %@", v17, a3];
            v68 = objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
            a5 = v58;
            goto LABEL_37;
          }
          id v20 = [(PFCloudKitStoreComparer *)self getObjectMatchingRecordID:v17 fromStore:v61 withManagedObjectContext:[(PFCloudKitStoreComparisonCache *)self->_cache otherStoreMoc]];
          if (!v20)
          {
            uint64_t v41 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v42 = *MEMORY[0x1E4F281F8];
            uint64_t v71 = *MEMORY[0x1E4F28588];
            uint64_t v72 = [NSString stringWithFormat:@"Failed to retrieve object with recordID '%@' from store %@", v17, v61];
            v68 = objc_msgSend(v41, "errorWithDomain:code:userInfo:", v42, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
LABEL_35:

            a5 = v58;
            goto LABEL_36;
          }
          uint64_t v21 = [v18 entity];
          if (v21) {
            uint64_t v22 = *(void *)(v21 + 160);
          }
          else {
            uint64_t v22 = 0;
          }
          uint64_t v23 = [v20 entity];
          if (v23) {
            uint64_t v24 = *(void *)(v23 + 160);
          }
          else {
            uint64_t v24 = 0;
          }
          if (v22 != v24)
          {
            uint64_t v25 = [NSString stringWithUTF8String:"Objects appear to be from different entities:\nStore: %@\nOther Store: %@"];
            _NSCoreDataLog(17, v25, v26, v27, v28, v29, v30, v31, (uint64_t)v18);
            uint64_t v32 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v74 = (const char *)v18;
              __int16 v75 = 2112;
              id v76 = v20;
              _os_log_fault_impl(&dword_18AB82000, v32, OS_LOG_TYPE_FAULT, "CoreData: Objects appear to be from different entities:\nStore: %@\nOther Store: %@", buf, 0x16u);
            }
          }
          if (![(PFCloudKitStoreComparer *)self compareAttributesOnObject:v18 toObject:v20 error:&v68])goto LABEL_35; {
          BOOL v33 = [(PFCloudKitStoreComparer *)self compareRelationshipsOfRecordID:v17 withStoreObject:v18 andOtherObject:v20 error:&v68];
          }

          id v11 = v62;
          if (!v33)
          {
            BOOL v35 = 0;
            a5 = v58;
            goto LABEL_38;
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v34 = [v11 countByEnumeratingWithState:&v64 objects:v77 count:16];
      uint64_t v14 = v34;
      BOOL v35 = 1;
      a5 = v58;
      id v12 = v59;
    }
    while (v34);
  }
  else
  {
    BOOL v35 = 1;
  }
LABEL_39:

  if (!v35)
  {
    if (v68)
    {
      if (a5) {
        *a5 = v68;
      }
    }
    else
    {
      uint64_t v43 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v43, v44, v45, v46, v47, v48, v49, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      long long v50 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v74 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        __int16 v75 = 1024;
        LODWORD(v76) = 403;
        _os_log_fault_impl(&dword_18AB82000, v50, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  return v35;
}

- (BOOL)compareAttributesOnObject:(id)a3 toObject:(id)a4 error:(id *)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3052000000;
  id v59 = __Block_byref_object_copy__52;
  id v60 = __Block_byref_object_dispose__52;
  uint64_t v61 = 0;
  uint64_t v50 = 0;
  long long v51 = &v50;
  uint64_t v52 = 0x3052000000;
  v53 = __Block_byref_object_copy__52;
  uint64_t v54 = __Block_byref_object_dispose__52;
  uint64_t v55 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "entity"), "attributesByName"), "allValues");
  uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v70 count:16];
  if (!v8) {
    goto LABEL_18;
  }
  uint64_t v43 = *(void *)v47;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v47 != v43) {
        objc_enumerationMutation(v7);
      }
      id v10 = *(void **)(*((void *)&v46 + 1) + 8 * v9);
      int v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"), "BOOLValue");
      id v12 = (void *)[a3 managedObjectContext];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __68__PFCloudKitStoreComparer_compareAttributesOnObject_toObject_error___block_invoke;
      v45[3] = &unk_1E544C3F0;
      v45[5] = v10;
      v45[6] = &v56;
      v45[4] = a3;
      [v12 performBlockAndWait:v45];
      uint64_t v13 = (void *)[a4 managedObjectContext];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __68__PFCloudKitStoreComparer_compareAttributesOnObject_toObject_error___block_invoke_2;
      v44[3] = &unk_1E544C3F0;
      v44[5] = v10;
      v44[6] = &v50;
      v44[4] = a4;
      [v13 performBlockAndWait:v44];
      uint64_t v14 = v57[5];
      if (v11)
      {
        if (![(PFCloudKitStoreComparer *)self validateValue:v14 againstOtherValue:v51[5] forIgnoredAttribute:v10])
        {
          uint64_t v24 = NSString;
          uint64_t v25 = objc_msgSend((id)objc_msgSend(v10, "entity"), "name");
          uint64_t v26 = [v10 name];
          id v27 = +[PFCloudKitStoreComparer trimExcessiveValuesForLog:v57[5]];
          uint64_t v28 = [v24 stringWithFormat:@"Ignored attribute (%@:%@) appears to have been synced:\nValue: %@\nOther value: %@", v25, v26, v27, +[PFCloudKitStoreComparer trimExcessiveValuesForLog:](PFCloudKitStoreComparer, "trimExcessiveValuesForLog:", v51[5])];
          uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v68 = *MEMORY[0x1E4F28588];
          uint64_t v69 = v28;
          uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
          uint64_t v31 = [v29 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v30];
LABEL_24:
          id v17 = (void *)v31;
          BOOL v18 = 0;
          goto LABEL_25;
        }
LABEL_12:

        v57[5] = 0;
        v51[5] = 0;
        goto LABEL_13;
      }
      uint64_t v15 = v51[5];
      if (v14)
      {
        if (!v15
          || !-[PFCloudKitStoreComparer isValue:equalToValue:forAttribute:](self, "isValue:equalToValue:forAttribute:"))
        {
LABEL_19:
          id v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v20 = *MEMORY[0x1E4F28588];
          v67[0] = @"Attribute values do not match.";
          v66[0] = v20;
          v66[1] = @"storeObjectID";
          v67[1] = [a3 objectID];
          v66[2] = @"otherStoreObjectID";
          v67[2] = [a4 objectID];
          v66[3] = [NSString stringWithFormat:@"store-%@", objc_msgSend(v10, "name")];
          uint64_t v21 = (__CFString *)v57[5];
          if (!v21) {
            uint64_t v21 = @"nil";
          }
          v67[3] = v21;
          v66[4] = [NSString stringWithFormat:@"otherStore-%@", objc_msgSend(v10, "name")];
          uint64_t v22 = (__CFString *)v51[5];
          if (!v22) {
            uint64_t v22 = @"nil";
          }
          v67[4] = v22;
          uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:5];
          uint64_t v31 = [v19 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v23];
          goto LABEL_24;
        }
        goto LABEL_12;
      }
      if (v15) {
        goto LABEL_19;
      }
LABEL_13:
      ++v9;
    }
    while (v8 != v9);
    uint64_t v16 = [v7 countByEnumeratingWithState:&v46 objects:v70 count:16];
    uint64_t v8 = v16;
  }
  while (v16);
LABEL_18:
  id v17 = 0;
  BOOL v18 = 1;
LABEL_25:

  v57[5] = 0;
  v51[5] = 0;
  if (!v18)
  {
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
    }
    else
    {
      uint64_t v32 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v32, v33, v34, v35, v36, v37, v38, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      uint64_t v39 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v63 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        __int16 v64 = 1024;
        int v65 = 468;
        _os_log_fault_impl(&dword_18AB82000, v39, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);
  return v18;
}

id __68__PFCloudKitStoreComparer_compareAttributesOnObject_toObject_error___block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", objc_msgSend(*(id *)(a1 + 40), "name"));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

id __68__PFCloudKitStoreComparer_compareAttributesOnObject_toObject_error___block_invoke_2(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "valueForKey:", objc_msgSend(*(id *)(a1 + 40), "name"));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (BOOL)isValue:(id)a3 equalToValue:(id)a4 forAttribute:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [a5 attributeType];
  if (v9 <= 699)
  {
    if (v9 <= 299)
    {
      if (!v9)
      {
        uint64_t v24 = [NSString stringWithUTF8String:"Not sure what to do with undefined attributes"];
        _NSCoreDataLog(17, v24, v25, v26, v27, v28, v29, v30, v57);
        uint64_t v31 = __pflogFaultLog;
        int v13 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
        if (!v13) {
          return v13;
        }
        *(_WORD *)buf = 0;
        uint64_t v32 = "CoreData: Not sure what to do with undefined attributes";
        uint64_t v33 = v31;
        uint32_t v34 = 2;
        goto LABEL_57;
      }
      if (v9 != 100 && v9 != 200) {
        goto LABEL_55;
      }
    }
    else if (v9 > 499)
    {
      if (v9 != 500 && v9 != 600) {
        goto LABEL_55;
      }
    }
    else if (v9 != 300 && v9 != 400)
    {
      goto LABEL_55;
    }
    goto LABEL_25;
  }
  if (v9 <= 1099)
  {
    if (v9 <= 899)
    {
      if (v9 != 700)
      {
        if (v9 != 800) {
          goto LABEL_55;
        }
LABEL_25:
        LOBYTE(v13) = [a3 isEqualToNumber:a4];
        return v13;
      }
      goto LABEL_60;
    }
    if (v9 == 900)
    {
      LOBYTE(v13) = [a3 isEqualToDate:a4];
      return v13;
    }
    if (v9 != 1000) {
      goto LABEL_55;
    }
LABEL_52:
    LOBYTE(v13) = [a3 isEqualToData:a4];
    return v13;
  }
  if (v9 <= 1799)
  {
    if (v9 != 1100)
    {
      if (v9 == 1200)
      {
        uint64_t v10 = [a3 absoluteString];
        id v11 = (id)[a4 absoluteString];
        id v12 = (id)v10;
LABEL_61:
        LOBYTE(v13) = [v12 isEqualToString:v11];
        return v13;
      }
LABEL_55:
      uint64_t v35 = [NSString stringWithUTF8String:"Unknown attribute type: %lu"];
      uint64_t v36 = [a5 attributeType];
      _NSCoreDataLog(17, v35, v37, v38, v39, v40, v41, v42, v36);
      uint64_t v43 = __pflogFaultLog;
      int v13 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v13) {
        return v13;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v64 = [a5 attributeType];
      uint64_t v32 = "CoreData: Unknown attribute type: %lu";
      uint64_t v33 = v43;
      uint32_t v34 = 12;
      goto LABEL_57;
    }
    goto LABEL_69;
  }
  if (v9 == 1800)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_52;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_60:
      id v12 = a3;
      id v11 = a4;
      goto LABEL_61;
    }
    getCloudKitCKRecordClass[0]();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v44 = [a3 recordID];
      id v45 = (id)[a4 recordID];
      id v46 = (id)v44;
LABEL_70:
      LOBYTE(v13) = [v46 isEqual:v45];
      return v13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v47 = [NSString stringWithUTF8String:"Unknown value type '%@' for attribute: %@"];
      uint64_t v48 = objc_opt_class();
      _NSCoreDataLog(17, v47, v49, v50, v51, v52, v53, v54, v48);
      uint64_t v55 = __pflogFaultLog;
      int v13 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v13) {
        return v13;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = objc_opt_class();
      __int16 v65 = 2112;
      id v66 = a5;
      uint64_t v32 = "CoreData: Unknown value type '%@' for attribute: %@";
      uint64_t v33 = v55;
      uint32_t v34 = 22;
LABEL_57:
      _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, v32, buf, v34);
LABEL_58:
      LOBYTE(v13) = 0;
      return v13;
    }
LABEL_69:
    id v46 = a3;
    id v45 = a4;
    goto LABEL_70;
  }
  if (v9 != 2100) {
    goto LABEL_55;
  }
  uint64_t v14 = (void *)[a5 elements];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v59 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend(a3, "valueForKey:", objc_msgSend(v19, "name"));
        uint64_t v21 = objc_msgSend(a4, "valueForKey:", objc_msgSend(v19, "name"));
        if (v20) {
          BOOL v22 = v21 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (v22)
        {
          if (v20 | v21) {
            goto LABEL_58;
          }
        }
        else if (![(PFCloudKitStoreComparer *)self isValue:v20 equalToValue:v21 forAttribute:v19])
        {
          goto LABEL_58;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v58 objects:v62 count:16];
      LOBYTE(v13) = 1;
    }
    while (v16);
  }
  else
  {
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (BOOL)validateValue:(id)a3 againstOtherValue:(id)a4 forIgnoredAttribute:(id)a5
{
  BOOL result = 1;
  if (a3)
  {
    if (a4) {
      return !-[PFCloudKitStoreComparer isValue:equalToValue:forAttribute:](self, "isValue:equalToValue:forAttribute:");
    }
  }
  return result;
}

- (BOOL)compareRelationshipsOfRecordID:(id)a3 withStoreObject:(id)a4 andOtherObject:(id)a5 error:(id *)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v45 = objc_msgSend((id)objc_msgSend(a4, "objectID"), "persistentStore");
  id v52 = a5;
  uint64_t v44 = objc_msgSend((id)objc_msgSend(a5, "objectID"), "persistentStore");
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v51 = a4;
  id obj = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "entity"), "relationshipsByName"), "allValues");
  uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v71 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = 0;
    uint64_t v50 = *(void *)v54;
    uint64_t v48 = *MEMORY[0x1E4F281F8];
    uint64_t v47 = *MEMORY[0x1E4F28588];
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v54 != v50) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v53 + 1) + 8 * v13);
      int v15 = (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"), "BOOLValue") & 1) != 0? 1: objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "inverseRelationship"), "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"), "BOOLValue");
      id v16 = [(PFCloudKitStoreComparer *)self getRecordIDsForRelationship:v14 onObject:v51];
      id v17 = [(PFCloudKitStoreComparer *)self getRecordIDsForRelationship:v14 onObject:v52];
      if (![v16 isEqualToSet:v17]) {
        break;
      }
      if (v15)
      {
        uint64_t v33 = [NSString stringWithFormat:@"Ignored relationship (%@:%@) appears to have been synced:\nValue: %@\nOther value: %@", objc_msgSend((id)objc_msgSend(v14, "entity"), "name"), objc_msgSend(v14, "name"), v16, v17];
        uint64_t v69 = v47;
        uint64_t v70 = v33;
        id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v48, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
LABEL_32:
        if (v12)
        {
          if (a6)
          {
            LOBYTE(v32) = 0;
            *a6 = v12;
            return v32;
          }
        }
        else
        {
          uint64_t v34 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
          uint64_t v41 = __pflogFaultLog;
          BOOL v32 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
          if (!v32) {
            return v32;
          }
          *(_DWORD *)buf = 136315394;
          long long v58 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
          __int16 v59 = 1024;
          int v60 = 646;
          _os_log_fault_impl(&dword_18AB82000, v41, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
        LOBYTE(v32) = 0;
        return v32;
      }
      if (![v14 isToMany]
        || !objc_msgSend((id)objc_msgSend(v14, "inverseRelationship"), "isToMany")
        || ![(PFCloudKitStoreComparisonCache *)self->_cache checkCloudKitMetadata])
      {
        int v22 = 1;
        goto LABEL_23;
      }
      uint64_t v43 = v12;
      id v18 = -[PFCloudKitStoreComparisonCache recordIDsRelatedToRecordID:byRelationshipNamed:inStore:](self->_cache, "recordIDsRelatedToRecordID:byRelationshipNamed:inStore:", a3, [v14 name], v45);
      id v19 = -[PFCloudKitStoreComparisonCache recordIDsRelatedToRecordID:byRelationshipNamed:inStore:](self->_cache, "recordIDsRelatedToRecordID:byRelationshipNamed:inStore:", a3, [v14 name], v44);
      uint64_t v20 = [v18 count];
      if (v20 != [v16 count] || (objc_msgSend(v16, "isEqualToSet:", v18) & 1) == 0)
      {
        uint64_t v28 = [NSString stringWithFormat:@"Mirrored relationships don't match actual record for '%@' in %@\nObject: %@\nMirrored Relationships: %@", a3, objc_msgSend(v45, "URL"), objc_msgSend((id)objc_msgSend(v16, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_37), objc_msgSend((id)objc_msgSend(v18, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_37)];
        uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v67 = v47;
        uint64_t v68 = v28;
        uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v68;
        uint64_t v27 = &v67;
        goto LABEL_21;
      }
      uint64_t v21 = [v19 count];
      if (v21 != [v17 count] || (objc_msgSend(v19, "isEqualToSet:", v17) & 1) == 0)
      {
        uint64_t v29 = [NSString stringWithFormat:@"Mirrored relationships don't match actual record for '%@' in %@\nObject: %@\nMirrored Relationships: %@", a3, objc_msgSend(v44, "URL"), objc_msgSend((id)objc_msgSend(v17, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_37), objc_msgSend((id)objc_msgSend(v19, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_37)];
        uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v65 = v47;
        uint64_t v66 = v29;
        uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v66;
        uint64_t v27 = &v65;
        goto LABEL_21;
      }
      if (([v18 isEqualToSet:v19] & 1) == 0)
      {
        uint64_t v30 = [NSString stringWithFormat:@"Mirrored relationships don't match for object with record name (%@): \nStore: %@\nOther Store: %@", a3, objc_msgSend((id)objc_msgSend(v18, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_37), objc_msgSend((id)objc_msgSend(v19, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_37)];
        uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v63 = v47;
        uint64_t v64 = v30;
        uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v64;
        uint64_t v27 = &v63;
        goto LABEL_21;
      }
      int v22 = 1;
      id v12 = v43;
LABEL_23:

      if (!v22) {
        goto LABEL_32;
      }
      if (v11 == ++v13)
      {
        uint64_t v31 = [obj countByEnumeratingWithState:&v53 objects:v71 count:16];
        uint64_t v11 = v31;
        if (v31) {
          goto LABEL_3;
        }
        goto LABEL_30;
      }
    }
    uint64_t v23 = [NSString stringWithFormat:@"Relationship doesn't match for object with record name (%@): %@\nStore: %@\nOther Store: %@", objc_msgSend(v14, "name"), a3, objc_msgSend((id)objc_msgSend(v16, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_37), objc_msgSend((id)objc_msgSend(v17, "allObjects"), "sortedArrayUsingComparator:", &__block_literal_global_37)];
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v61 = v47;
    uint64_t v62 = v23;
    uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v26 = &v62;
    uint64_t v27 = &v61;
LABEL_21:
    id v12 = objc_msgSend(v24, "errorWithDomain:code:userInfo:", v48, 134060, objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1));
    int v22 = 0;
    goto LABEL_23;
  }
LABEL_30:
  LOBYTE(v32) = 1;
  return v32;
}

- (id)getRecordIDsForRelationship:(id)a3 onObject:(id)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v8 = (void *)[a4 managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PFCloudKitStoreComparer_getRecordIDsForRelationship_onObject___block_invoke;
  v10[3] = &unk_1E544C948;
  v10[4] = a4;
  v10[5] = a3;
  v10[6] = v7;
  v10[7] = self;
  [v8 performBlockAndWait:v10];
  return v7;
}

uint64_t __64__PFCloudKitStoreComparer_getRecordIDsForRelationship_onObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:", objc_msgSend(*(id *)(a1 + 40), "name"));
  if ([*(id *)(a1 + 40) isToMany])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__PFCloudKitStoreComparer_getRecordIDsForRelationship_onObject___block_invoke_2;
    v7[3] = &unk_1E544F670;
    int8x16_t v3 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    long long v8 = *(_OWORD *)(a1 + 48);
    int8x16_t v9 = v3;
    return [v2 enumerateObjectsUsingBlock:v7];
  }
  else
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 56) + 16), "recordIDForObjectID:", objc_msgSend(v2, "objectID"));
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void **)(a1 + 48);
      return [v6 addObject:v5];
    }
  }
  return result;
}

void __64__PFCloudKitStoreComparer_getRecordIDsForRelationship_onObject___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "recordIDForObjectID:", objc_msgSend(a2, "objectID")));
  if ([*(id *)(*(void *)(a1 + 40) + 16) checkCloudKitMetadata])
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "inverseRelationship"), "isToMany"))
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 16) mirroredRelationshipForObject:*(void *)(a1 + 56) relatedToObject:a2 byRelationship:*(void *)(a1 + 48)];
      if (v4)
      {
        uint64_t v5 = (void *)v4;
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"), "BOOLValue") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "inverseRelationship"), "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"), "BOOLValue"))
        {
          uint64_t v6 = [NSString stringWithUTF8String:"Found mirrored relationship for ignored relationship: %@"];
          _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
          uint64_t v13 = __pflogFaultLog;
          if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
            return;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = (uint64_t)v5;
          int v22 = "CoreData: Found mirrored relationship for ignored relationship: %@";
          uint64_t v30 = v13;
          uint32_t v31 = 12;
LABEL_19:
          _os_log_fault_impl(&dword_18AB82000, v30, OS_LOG_TYPE_FAULT, v22, buf, v31);
          return;
        }
        if (objc_msgSend((id)objc_msgSend(v5, "isUploaded"), "BOOLValue"))
        {
          if (objc_msgSend((id)objc_msgSend(v5, "needsDelete"), "BOOLValue"))
          {
            uint64_t v14 = [NSString stringWithUTF8String:"Found mirrored relationship that's marked deleted but the objects are linked."];
            _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v43);
            uint64_t v21 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              int v22 = "CoreData: Found mirrored relationship that's marked deleted but the objects are linked.";
LABEL_14:
              uint64_t v30 = v21;
              uint32_t v31 = 2;
              goto LABEL_19;
            }
          }
          else if (objc_msgSend((id)objc_msgSend(v5, "isPending"), "BOOLValue"))
          {
            uint64_t v32 = [NSString stringWithUTF8String:"Found pending mirrored relationship for linked objects (%@).\n%@\n%@"];
            uint64_t v33 = [*(id *)(a1 + 48) name];
            _NSCoreDataLog(17, v32, v34, v35, v36, v37, v38, v39, v33);
            uint64_t v40 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v41 = [*(id *)(a1 + 48) name];
              uint64_t v42 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412802;
              uint64_t v45 = v41;
              __int16 v46 = 2112;
              uint64_t v47 = v42;
              __int16 v48 = 2112;
              uint64_t v49 = a2;
              int v22 = "CoreData: Found pending mirrored relationship for linked objects (%@).\n%@\n%@";
              uint64_t v30 = v40;
              uint32_t v31 = 32;
              goto LABEL_19;
            }
          }
        }
        else
        {
          uint64_t v23 = objc_msgSend(NSString, "stringWithUTF8String:", "Found mirrored relationship not marked uploaded, but this method is supposed to make sure store contents are equal, so shouldn't it be?");
          _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, v43);
          uint64_t v21 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            int v22 = "CoreData: Found mirrored relationship not marked uploaded, but this method is supposed to make sure st"
                  "ore contents are equal, so shouldn't it be?";
            goto LABEL_14;
          }
        }
      }
    }
  }
}

- (BOOL)ensureStoresAgreeOnCloudKitTables:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v41 != v5) {
          objc_enumerationMutation(a3);
        }
        uint64_t v7 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        char v48 = 1;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __67__PFCloudKitStoreComparer_ensureStoresAgreeOnCloudKitTables_error___block_invoke;
        void v39[3] = &unk_1E544D7D0;
        v39[4] = buf;
        uint64_t v8 = [[NSSQLBlockRequestContext alloc] initWithBlock:v39 context:0 sqlCore:v7];
        -[NSSQLCore dispatchRequest:withRetries:]((uint64_t)v7, v8, 0);
        objc_msgSend(v34, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(*(void *)&buf[8] + 24)), objc_msgSend(v7, "identifier"));

        _Block_object_dispose(buf, 8);
      }
      uint64_t v4 = [a3 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v4);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v9 = (void *)[v34 allKeys];
  id v10 = 0;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[v34 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * j)];
        uint64_t v15 = v14;
        if (v10)
        {
          int v16 = [v10 BOOLValue];
          if (v16 != [v15 BOOLValue])
          {
            id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v44 = *MEMORY[0x1E4F28588];
            uint64_t v45 = [NSString stringWithFormat:@"Stores disagree about whether or not CloudKit metadata tables are present: %@\n%@", a3, v34];
            uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
            uint64_t v19 = (void *)[v17 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v18];
            BOOL v20 = 0;
            goto LABEL_20;
          }
        }
        else
        {
          id v10 = v14;
          -[PFCloudKitStoreComparisonCache _setCheckCloudKitMetadata:](self->_cache, "_setCheckCloudKitMetadata:", [v10 BOOLValue]);
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v11);
  }
  uint64_t v19 = 0;
  BOOL v20 = 1;
LABEL_20:

  if (!v20)
  {
    id v21 = v19;
    if (v21)
    {
      if (a4) {
        *a4 = v21;
      }
    }
    else
    {
      uint64_t v22 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      uint64_t v29 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 744;
        _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  return v20;
}

uint64_t __67__PFCloudKitStoreComparer_ensureStoresAgreeOnCloudKitTables_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v4 = *(void **)(a2 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(v4, "ancillarySQLModels"), "objectForKey:", @"NSPersistentStoreMirroringDelegateOptionKey");
  if (result)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = *(void **)(result + 32);
    uint64_t result = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          if (!a2)
          {
            uint64_t result = [v10 tableName];
            goto LABEL_16;
          }
          uint64_t v11 = *(void *)(a2 + 24);
          uint64_t result = [v10 tableName];
          if (!v11) {
            goto LABEL_16;
          }
          uint64_t result = -[NSSQLiteConnection _hasTableWithName:isTemp:](v11, result, 0);
          if (!result) {
            goto LABEL_16;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t result = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        uint64_t v7 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
LABEL_16:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)compareCloudKitMetadataOfStore:(id)a3 toStore:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v21 = 0;
  if (![(PFCloudKitStoreComparer *)self ensureMirroredRelationshipsMatchForStore:a3 otherStore:a4 error:&v21]|| ![(PFCloudKitStoreComparer *)self ensureMoveReceiptsMatchForStore:a3 otherStore:a4 error:&v21])
  {
    id v10 = v21;
    id v11 = v21;
    if (v11)
    {
      if (a5)
      {
        BOOL v9 = 0;
        *a5 = v11;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      uint64_t v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        __int16 v24 = 1024;
        int v25 = 771;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    BOOL v9 = 0;
    goto LABEL_10;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)ensureMoveReceiptsMatchForStore:(id)a3 otherStore:(id)a4 error:(id *)a5
{
  uint64_t v7 = self;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  char v79 = 1;
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x3052000000;
  v73 = __Block_byref_object_copy__52;
  v74 = __Block_byref_object_dispose__52;
  uint64_t v75 = 0;
  id v8 = -[PFCloudKitStoreComparisonCache recordIdsForStore:](self->_cache, "recordIdsForStore:");
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v66 objects:v91 count:16];
  if (v9)
  {
    uint64_t v53 = *(void *)v67;
    uint64_t v51 = *MEMORY[0x1E4F281F8];
    uint64_t v52 = *MEMORY[0x1E4F28588];
    id v49 = a3;
    uint64_t v50 = v7;
    id v47 = a4;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v67 != v53) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v66 + 1) + 8 * v10);
      id v12 = [(PFCloudKitStoreComparisonCache *)v7->_cache metadataForObjectWithID:[(PFCloudKitStoreComparisonCache *)v7->_cache objectIDForRecordID:v11 inStore:a3]];
      id v13 = [(PFCloudKitStoreComparisonCache *)v7->_cache metadataForObjectWithID:[(PFCloudKitStoreComparisonCache *)v7->_cache objectIDForRecordID:v11 inStore:a4]];
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      v88 = __Block_byref_object_copy__52;
      v89 = __Block_byref_object_dispose__52;
      uint64_t v90 = 0;
      uint64_t v15 = (void *)[v12 managedObjectContext];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __76__PFCloudKitStoreComparer_ensureMoveReceiptsMatchForStore_otherStore_error___block_invoke;
      v65[3] = &unk_1E544DDA8;
      v65[4] = v12;
      v65[5] = v14;
      v65[6] = v7;
      v65[7] = buf;
      v65[8] = &v70;
      v65[9] = &v76;
      [v15 performBlockAndWait:v65];
      if (*((unsigned char *)v77 + 24))
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v59 = 0;
        int v60 = &v59;
        uint64_t v61 = 0x3052000000;
        uint64_t v62 = __Block_byref_object_copy__52;
        uint64_t v63 = __Block_byref_object_dispose__52;
        uint64_t v64 = 0;
        uint64_t v17 = (void *)[v13 managedObjectContext];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __76__PFCloudKitStoreComparer_ensureMoveReceiptsMatchForStore_otherStore_error___block_invoke_2;
        v58[3] = &unk_1E544DDA8;
        v58[4] = v13;
        v58[5] = v16;
        v58[6] = v7;
        v58[7] = &v59;
        v58[8] = &v70;
        v58[9] = &v76;
        [v17 performBlockAndWait:v58];
        uint64_t v18 = [v14 count];
        if (v18 == [v16 count])
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          uint64_t v19 = (void *)[v14 allKeys];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v86 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v55;
            while (2)
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v55 != v21) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v23 = *(void *)(*((void *)&v54 + 1) + 8 * i);
                if ((objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", v23), "isEqualToDate:", objc_msgSend(v16, "objectForKeyedSubscript:", v23)) & 1) == 0)
                {
                  *((unsigned char *)v77 + 24) = 0;
                  a4 = v47;
                  id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v84[0] = v52;
                  v84[1] = @"recordID";
                  v85[0] = @"Move receipt dates don't match.";
                  v85[1] = v11;
                  v84[2] = @"movedRecordName";
                  v85[2] = v23;
                  v84[3] = [NSString stringWithFormat:@"%@-receipts", objc_msgSend(v49, "identifier")];
                  v85[3] = v14;
                  v84[4] = [NSString stringWithFormat:@"%@-receipts", objc_msgSend(v47, "identifier")];
                  v85[4] = v16;
                  uint64_t v25 = objc_msgSend(v26, "initWithDomain:code:userInfo:", v51, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v85, v84, 5));
                  a3 = v49;
                  goto LABEL_19;
                }
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v86 count:16];
              a4 = v47;
              a3 = v49;
              if (v20) {
                continue;
              }
              break;
            }
          }
        }
        else
        {
          *((unsigned char *)v77 + 24) = 0;
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          v82[0] = v52;
          v82[1] = @"recordID";
          v83[0] = @"Move receipts don't match.";
          v83[1] = v11;
          v82[2] = [NSString stringWithFormat:@"%@-receipts", objc_msgSend(a3, "identifier")];
          v83[2] = v14;
          v82[3] = [NSString stringWithFormat:@"%@-receipts", objc_msgSend(a4, "identifier")];
          v83[3] = v16;
          uint64_t v25 = objc_msgSend(v24, "initWithDomain:code:userInfo:", v51, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v83, v82, 4));
LABEL_19:
          v71[5] = v25;
        }
        uint64_t v7 = v50;
        if (*((unsigned char *)v77 + 24))
        {
          uint64_t v27 = *(void **)(*(void *)&buf[8] + 40);
          if (v27 != (void *)v60[5])
          {
            uint64_t v28 = objc_msgSend((id)objc_msgSend(v27, "recordID"), "recordName");
            if (!objc_msgSend(v28, "isEqual:", objc_msgSend((id)objc_msgSend((id)v60[5], "recordID"), "recordName"))|| (uint64_t v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "recordID"), "zoneID"), "zoneName"), (objc_msgSend(v29, "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v60[5], "recordID"), "zoneID"), "zoneName")) & 1) == 0))
            {
              *((unsigned char *)v77 + 24) = 0;
              id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
              v80[0] = v52;
              v80[1] = @"recordID";
              v81[0] = @"Shares don't match for record zone.";
              v81[1] = v11;
              v80[2] = [NSString stringWithFormat:@"%@-share", objc_msgSend(a3, "identifier")];
              uint32_t v31 = *(__CFString **)(*(void *)&buf[8] + 40);
              if (!v31) {
                uint32_t v31 = @"nil";
              }
              v81[2] = v31;
              void v80[3] = [NSString stringWithFormat:@"%@-share", objc_msgSend(a4, "identifier")];
              uint64_t v32 = (__CFString *)v60[5];
              if (!v32) {
                uint64_t v32 = @"nil";
              }
              v81[3] = v32;
              uint64_t v33 = objc_msgSend(v30, "initWithDomain:code:userInfo:", v51, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v81, v80, 4));
              v71[5] = v33;
            }
          }
        }

        v60[5] = 0;
        _Block_object_dispose(&v59, 8);
      }

      *(void *)(*(void *)&buf[8] + 40) = 0;
      int v34 = *((unsigned __int8 *)v77 + 24);
      _Block_object_dispose(buf, 8);
      if (!v34) {
        break;
      }
      if (++v10 == v9)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v66 objects:v91 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  if (!*((unsigned char *)v77 + 24))
  {
    id v37 = (id)v71[5];
    if (v37)
    {
      if (a5) {
        *a5 = v37;
      }
    }
    else
    {
      uint64_t v38 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      uint64_t v45 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 881;
        _os_log_fault_impl(&dword_18AB82000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v71[5] = 0;
  char v35 = *((unsigned char *)v77 + 24);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);
  return v35;
}

void __76__PFCloudKitStoreComparer_ensureMoveReceiptsMatchForStore_otherStore_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "moveReceipts", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "movedAt"), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "recordName"));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  uint64_t v7 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID]((void *)[*(id *)(a1 + 32) recordZone]);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](*(void *)(*(void *)(a1 + 48) + 24), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "recordZone"), "encodedShareData"), v7, (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 40));
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v8)
  {
    id v9 = v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
}

void __76__PFCloudKitStoreComparer_ensureMoveReceiptsMatchForStore_otherStore_error___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "moveReceipts", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "movedAt"), objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "recordName"));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  uint64_t v7 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID]((void *)[*(id *)(a1 + 32) recordZone]);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](*(void *)(*(void *)(a1 + 48) + 24), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "recordZone"), "encodedShareData"), v7, (void *)(*(void *)(*(void *)(a1 + 64) + 8)+ 40));
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v8)
  {
    id v9 = v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
}

- (BOOL)ensureMirroredRelationshipsMatchForStore:(id)a3 otherStore:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3052000000;
  uint64_t v43 = __Block_byref_object_copy__52;
  uint64_t v44 = __Block_byref_object_dispose__52;
  uint64_t v45 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 1;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v60[0] = a3;
  v60[1] = a4;
  id v8 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v61 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v33 != v10) {
        objc_enumerationMutation(v8);
      }
      long long v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
      long long v13 = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
      -[NSManagedObjectContext setPersistentStoreCoordinator:](v13, "setPersistentStoreCoordinator:", [v12 _persistentStoreCoordinator]);
      [(NSManagedObjectContext *)v13 _setAllowAncillaryEntities:1];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __85__PFCloudKitStoreComparer_ensureMirroredRelationshipsMatchForStore_otherStore_error___block_invoke;
      v31[3] = &unk_1E544F698;
      v31[4] = v12;
      v31[5] = self;
      v31[6] = v13;
      v31[7] = a3;
      v31[8] = a4;
      v31[9] = &v50;
      v31[10] = &v46;
      v31[11] = &v36;
      v31[12] = &v40;
      [(NSManagedObjectContext *)v13 performBlockAndWait:v31];

      if (!*((unsigned char *)v37 + 24)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v61 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  if (!*((unsigned char *)v37 + 24))
  {
    uint64_t v17 = a5;
    id v18 = (id)v41[5];
    goto LABEL_14;
  }
  uint64_t v14 = v51[3];
  uint64_t v15 = v47[3];
  if (v14 != v15)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v58 = *MEMORY[0x1E4F28588];
    uint64_t v17 = a5;
    uint64_t v59 = objc_msgSend(NSString, "stringWithFormat:", @"Stores don't have the same number of mirrored relationships: %lu / %lu", v14, v15);
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    id v18 = (id)[v19 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v20];
LABEL_14:
    if (v18)
    {
      if (v17)
      {
        BOOL v16 = 0;
        *uint64_t v17 = v18;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      uint64_t v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v55 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
        __int16 v56 = 1024;
        int v57 = 952;
        _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    BOOL v16 = 0;
    goto LABEL_20;
  }
  BOOL v16 = 1;
LABEL_20:

  v41[5] = 0;
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  return v16;
}

id __85__PFCloudKitStoreComparer_ensureMirroredRelationshipsMatchForStore_otherStore_error___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath]);
  v19[0] = *(void *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1]);
  [(NSFetchRequest *)v2 setResultType:4];
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v3 + 8))
  {
    uint64_t v4 = (void *)[*(id *)(v3 + 16) sharedZoneIDsForStore:*(void *)(a1 + 32)];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9++), "zoneName"));
        }
        while (v7 != v9);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
    -[NSFetchRequest setPredicate:](v2, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"recordZone.ckRecordZoneName IN %@", v5]);
  }
  id v13 = 0;
  id result = (id)[*(id *)(a1 + 48) executeFetchRequest:v2 error:&v13];
  if (result)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11 == *(void *)(a1 + 56))
    {
      id result = (id)objc_msgSend((id)objc_msgSend(result, "lastObject"), "unsignedIntegerValue");
      uint64_t v12 = *(void *)(a1 + 72);
    }
    else
    {
      if (v11 != *(void *)(a1 + 64)) {
        return result;
      }
      id result = (id)objc_msgSend((id)objc_msgSend(result, "lastObject"), "unsignedIntegerValue");
      uint64_t v12 = *(void *)(a1 + 80);
    }
    *(void *)(*(void *)(v12 + 8) + 24) = result;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    id result = v13;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)ensureRecordMetadataMatchesForRecordID:(id)a3 inStore:(id)a4 andOtherStore:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v40 = 0;
  unint64_t v10 = [(PFCloudKitStoreComparisonCache *)self->_cache metadataForRecordID:a3 inStore:a4];
  unint64_t v11 = [(PFCloudKitStoreComparisonCache *)self->_cache metadataForRecordID:a3 inStore:a5];
  uint64_t v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (v10 | v11)
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Hmmmm I think something changed around this method because the metadata should have been verified for equivalent entries by now."];
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v37);
      uint64_t v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Hmmmm I think something changed around this method because the metadata should have been verified for equivalent entries by now.", buf, 2u);
      }
    }
    goto LABEL_17;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  uint64_t v42 = __Block_byref_object_copy__52;
  uint64_t v43 = __Block_byref_object_dispose__52;
  uint64_t v44 = 0;
  uint64_t v22 = (void *)[(id)v10 managedObjectContext];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __94__PFCloudKitStoreComparer_ensureRecordMetadataMatchesForRecordID_inStore_andOtherStore_error___block_invoke;
  void v39[3] = &unk_1E544B9B0;
  v39[4] = v10;
  void v39[5] = buf;
  [v22 performBlockAndWait:v39];
  id v23 = -[PFCloudKitArchivingUtilities recordFromEncodedData:error:]((uint64_t)self->_archivingUtilities, *(void **)(*(void *)&buf[8] + 40), &v40);

  *(void *)(*(void *)&buf[8] + 40) = 0;
  if (v23)
  {
    uint64_t v24 = (void *)[v12 managedObjectContext];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __94__PFCloudKitStoreComparer_ensureRecordMetadataMatchesForRecordID_inStore_andOtherStore_error___block_invoke_2;
    v38[3] = &unk_1E544B9B0;
    v38[4] = v12;
    v38[5] = buf;
    [v24 performBlockAndWait:v38];
    id v25 = -[PFCloudKitArchivingUtilities recordFromEncodedData:error:]((uint64_t)self->_archivingUtilities, *(void **)(*(void *)&buf[8] + 40), &v40);

    *(void *)(*(void *)&buf[8] + 40) = 0;
    BOOL v26 = v25
       && -[PFCloudKitStoreComparer ensureContentsOfRecordStorageMatchForStorage:andOtherStore:error:](self, "ensureContentsOfRecordStorageMatchForStorage:andOtherStore:error:", v23, v25, &v40)&& -[PFCloudKitStoreComparer ensureContentsOfRecordStorageMatchForStorage:andOtherStore:error:](self, "ensureContentsOfRecordStorageMatchForStorage:andOtherStore:error:", [v23 encryptedValues], objc_msgSend(v25, "encryptedValues"), &v40);
  }
  else
  {
    BOOL v26 = 0;
  }

  _Block_object_dispose(buf, 8);
  if (v26)
  {
LABEL_17:
    LOBYTE(v27) = 1;
    return v27;
  }
  if (!v40)
  {
    uint64_t v28 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
    long long v35 = __pflogFaultLog;
    BOOL v27 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v27) {
      return v27;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1011;
    _os_log_fault_impl(&dword_18AB82000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_24;
  }
  if (!a6)
  {
LABEL_24:
    LOBYTE(v27) = 0;
    return v27;
  }
  LOBYTE(v27) = 0;
  *a6 = v40;
  return v27;
}

id __94__PFCloudKitStoreComparer_ensureRecordMetadataMatchesForRecordID_inStore_andOtherStore_error___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) encodedRecord];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __94__PFCloudKitStoreComparer_ensureRecordMetadataMatchesForRecordID_inStore_andOtherStore_error___block_invoke_2(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) encodedRecord];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)ensureContentsOfRecordStorageMatchForStorage:(id)a3 andOtherStore:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", objc_msgSend(a3, "allKeys"));
  objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(a4, "allKeys"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v31 = a5;
    uint64_t v11 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(v8);
      }
      BOOL v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
      if (([v13 isEqualToString:@"_PFFakeCKDatabaseAncestorRecordKey"] & 1) == 0)
      {
        uint64_t v14 = (__CFString *)[a3 objectForKeyedSubscript:v13];
        uint64_t v15 = [a4 objectForKeyedSubscript:v13];
        if (v14 != (__CFString *)v15)
        {
          uint64_t v16 = (__CFString *)v15;
          getCloudKitCKAssetClass();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            getCloudKitCKAssetClass();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 && ([(__CFString *)v14 isEqual:v16] & 1) == 0) {
              break;
            }
          }
        }
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    v40[0] = @"mismatchField";
    v40[1] = @"value";
    uint64_t v19 = @"nil";
    if (v14) {
      uint64_t v20 = v14;
    }
    else {
      uint64_t v20 = @"nil";
    }
    v41[0] = v13;
    v41[1] = v20;
    v40[2] = @"oValue";
    if (v16) {
      uint64_t v19 = v16;
    }
    v41[2] = v19;
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v18, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v41, v40, 3));

    if (v21)
    {
      if (v31)
      {
        LOBYTE(v17) = 0;
        id *v31 = (id)v21;
        return v17;
      }
    }
    else
    {
      uint64_t v22 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m");
      uint64_t v29 = __pflogFaultLog;
      BOOL v17 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!v17) {
        return v17;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparer.m";
      __int16 v38 = 1024;
      int v39 = 1075;
      _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    LOBYTE(v17) = 0;
  }
  else
  {
LABEL_13:

    LOBYTE(v17) = 1;
  }
  return v17;
}

+ (id)trimExcessiveValuesForLog:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((unint64_t)[a3 length] >= 0x101)
    {
      uint64_t v4 = NSString;
      uint64_t v5 = [a3 substringToIndex:255];
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((objc_opt_respondsToSelector() & 1) == 0 || [a3 fileURL])
      && (unint64_t)[a3 length] >= 0x101)
    {
      uint64_t v4 = NSString;
      uint64_t v5 = objc_msgSend(a3, "subdataWithRange:", 0, 255);
LABEL_9:
      id result = (id)[v4 stringWithFormat:@"Trimmed: %@", v5];
      if (result) {
        return result;
      }
    }
  }
  id v7 = a3;

  return v7;
}

- (PFCloudKitStoreComparisonCache)cache
{
  return self->_cache;
}

- (PFCloudKitArchivingUtilities)archivingUtilities
{
  return self->_archivingUtilities;
}

- (BOOL)onlyCompareSharedZones
{
  return self->_onlyCompareSharedZones;
}

- (void)setOnlyCompareSharedZones:(BOOL)a3
{
  self->_onlyCompareSharedZones = a3;
}

@end
@interface PFCloudKitStoreComparisonCacheStoreCache
- (BOOL)populateForStore:(void *)a3 inContext:(void *)a4 error:;
- (PFCloudKitStoreComparisonCacheStoreCache)init;
- (uint64_t)createRecordIDForRecordName:(uint64_t)a1 inZoneWithName:(uint64_t)a2 ownerName:(uint64_t)a3 inStore:(void *)a4;
- (uint64_t)createRecordZoneIDForZoneName:(uint64_t)a1 ownerName:(uint64_t)a2 inStore:(void *)a3;
- (void)dealloc;
@end

@implementation PFCloudKitStoreComparisonCacheStoreCache

- (BOOL)populateForStore:(void *)a3 inContext:(void *)a4 error:
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v130 = 0;
  uint64_t v131 = 0;
  v132 = &v131;
  uint64_t v133 = 0x2020000000;
  char v134 = 1;
  uint64_t v125 = 0;
  v126 = &v125;
  uint64_t v127 = 0x3052000000;
  v128 = __Block_byref_object_copy__14;
  v129 = __Block_byref_object_dispose__14;
  if (!*(unsigned char *)(a1 + 120)) {
    goto LABEL_30;
  }
  v4 = (void *)MEMORY[0x18C127630]();
  v5 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey", (uint64_t)a2, a3, (uint64_t)(v126 + 5));
  if (v5)
  {
    *(void *)(a1 + 128) = (id)[v5 stringValue];
  }
  else
  {
    v6 = v126;
    if (v126[5])
    {
      *((unsigned char *)v132 + 24) = 0;
      id v7 = (id)v6[5];
    }
  }
  if (*((unsigned char *)v132 + 24))
  {
    v8 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKDatabaseMetadata entityPath]);
    v9 = (char *)[a3 executeFetchRequest:v8 error:v126 + 5];
    v10 = v9;
    if (v9)
    {
      if ((unint64_t)[v9 count] >= 2)
      {
        uint64_t v11 = [NSString stringWithUTF8String:"Metadata corruption found, store appears to have been used with multiple CloudKit databases: %@"];
        _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);
        v18 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v136 = v10;
          _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Metadata corruption found, store appears to have been used with multiple CloudKit databases: %@", buf, 0xCu);
        }
      }
      v19 = (void *)[v10 lastObject];
      if (v19) {
        *(void *)(a1 + 136) = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v19, "databaseScope"));
      }
    }
    else
    {
      *((unsigned char *)v132 + 24) = 0;
      id v20 = (id)v126[5];
    }
  }
  v21 = v132;
  if (!*((unsigned char *)v132 + 24)) {
    goto LABEL_32;
  }
  v22 = (void *)MEMORY[0x18C127630]();
  v23 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
  [(NSFetchRequest *)v23 setFetchBatchSize:10];
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __77__PFCloudKitStoreComparisonCacheStoreCache_populateForStore_inContext_error___block_invoke;
  v124[3] = &unk_1E544C830;
  v124[4] = a1;
  v124[5] = &v131;
  v124[6] = &v125;
  +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v23, a3, (uint64_t)v124);
  v21 = v132;
  if (!*((unsigned char *)v132 + 24)) {
    goto LABEL_32;
  }
  v24 = (void *)MEMORY[0x18C127630]();
  v25 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath]);
  v26 = (void *)[a3 executeFetchRequest:v25 error:v126 + 5];
  v27 = v26;
  if (v26)
  {
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    uint64_t v28 = [v26 countByEnumeratingWithState:&v120 objects:v143 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v121;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v121 != v29) {
            objc_enumerationMutation(v27);
          }
          v31 = *(void **)(*((void *)&v120 + 1) + 8 * i);
          id v32 = (id)objc_msgSend((id)objc_msgSend(v31, "objectID"), "persistentStore");
          v33 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordZoneIDForZoneName:ownerName:inStore:](a1, [v31 ckRecordZoneName], objc_msgSend(v31, "ckOwnerName"));
          [*(id *)(a1 + 96) addObject:v33];
          if ([v31 encodedShareData]) {
            [*(id *)(a1 + 104) addObject:v33];
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v120 objects:v143 count:16];
      }
      while (v28);
    }
  }
  else
  {
    *((unsigned char *)v132 + 24) = 0;
    id v34 = (id)v126[5];
  }
  v21 = v132;
  if (*((unsigned char *)v132 + 24))
  {
LABEL_30:
    v102 = objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
    if (objc_msgSend((id)objc_msgSend(a2, "configurationName"), "length")) {
      obuint64_t j = (id)objc_msgSend(v102, "entitiesForConfiguration:", objc_msgSend(a2, "configurationName"));
    }
    else {
      obuint64_t j = (id)[v102 entities];
    }
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    uint64_t v36 = [obj countByEnumeratingWithState:&v116 objects:v142 count:16];
    if (v36)
    {
      uint64_t v95 = *(void *)v117;
LABEL_36:
      id v99 = 0;
      id v96 = (id)v36;
      while (1)
      {
        if (*(void *)v117 != v95) {
          objc_enumerationMutation(obj);
        }
        v37 = *(void **)(*((void *)&v116 + 1) + 8 * (void)v99);
        context = (void *)MEMORY[0x18C127630]();
        v38 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", [v37 name]);
        uint64_t v39 = objc_msgSend((id)objc_msgSend(v37, "propertiesByName"), "objectForKey:", @"ckRecordID");
        if (v39)
        {
          v141 = @"ckRecordID";
          -[NSFetchRequest setPropertiesToFetch:](v38, "setPropertiesToFetch:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1]);
          if (objc_msgSend((id)objc_msgSend(v37, "propertiesByName"), "objectForKey:", @"ckRecordSystemFields")) {
            [(NSFetchRequest *)v38 setPropertiesToFetch:[(NSArray *)[(NSFetchRequest *)v38 propertiesToFetch] arrayByAddingObject:@"ckRecordSystemFields"]];
          }
        }
        v40 = (void *)[a3 executeFetchRequest:v38 error:v126 + 5];
        id v41 = v40;
        if (v40)
        {
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          uint64_t v42 = [v40 countByEnumeratingWithState:&v112 objects:v140 count:16];
          if (v42)
          {
            uint64_t v43 = *(void *)v113;
            id v103 = v41;
            do
            {
              for (uint64_t j = 0; j != v42; ++j)
              {
                if (*(void *)v113 != v43) {
                  objc_enumerationMutation(v103);
                }
                v45 = *(void **)(*((void *)&v112 + 1) + 8 * j);
                v46 = (void *)MEMORY[0x18C127630]();
                v47 = (void *)[v45 objectID];
                v48 = v47;
                if (v39)
                {
                  uint64_t v49 = [v45 valueForKey:@"ckRecordID"];
                  if (!v49)
                  {
                    v50 = (void *)[v48 URIRepresentation];
                    uint64_t v49 = [NSString stringWithFormat:@"%@/%@", objc_msgSend((id)objc_msgSend(v50, "URLByDeletingLastPathComponent"), "lastPathComponent"), objc_msgSend(v50, "lastPathComponent")];
                  }
                  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v45, "entity"), "propertiesByName"), "objectForKey:", @"ckRecordSystemFields"))
                  {
                    if ([v45 valueForKey:@"ckRecordSystemFields"])
                    {
                      uint64_t v51 = [NSString stringWithUTF8String:"System fields shouldn't be set anymore: %@"];
                      _NSCoreDataLog(17, v51, v52, v53, v54, v55, v56, v57, (uint64_t)v45);
                      v58 = __pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v136 = (const char *)v45;
                        _os_log_fault_impl(&dword_18AB82000, v58, OS_LOG_TYPE_FAULT, "CoreData: System fields shouldn't be set anymore: %@", buf, 0xCu);
                      }
                    }
                  }
                }
                else
                {
                  v59 = (void *)[v47 URIRepresentation];
                  uint64_t v49 = [NSString stringWithFormat:@"%@/%@", objc_msgSend((id)objc_msgSend(v59, "URLByDeletingLastPathComponent"), "lastPathComponent"), objc_msgSend(v59, "lastPathComponent")];
                }
                [*(id *)(a1 + 16) setObject:v48 forKey:v49];
                [*(id *)(a1 + 8) addObject:v49];
              }
              id v41 = v103;
              uint64_t v42 = [v103 countByEnumeratingWithState:&v112 objects:v140 count:16];
            }
            while (v42);
          }
        }
        else
        {
          *((unsigned char *)v132 + 24) = 0;
          id v60 = (id)v126[5];
        }
        if (!v41) {
          break;
        }
        id v99 = (char *)v99 + 1;
        if (v99 == v96)
        {
          uint64_t v36 = [obj countByEnumeratingWithState:&v116 objects:v142 count:16];
          if (v36) {
            goto LABEL_36;
          }
          break;
        }
      }
    }
    if (*(unsigned char *)(a1 + 120))
    {
      v61 = (void *)+[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingPredicate:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, 0, (uint64_t)a2, a3, (uint64_t)(v126 + 5));
      v62 = v61;
      if (v61)
      {
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        uint64_t v63 = [v61 countByEnumeratingWithState:&v108 objects:v139 count:16];
        if (v63)
        {
          id v100 = v62;
          uint64_t v101 = *(void *)v109;
          do
          {
            id v104 = (id)v63;
            for (k = 0; k != v104; k = (char *)k + 1)
            {
              if (*(void *)v109 != v101) {
                objc_enumerationMutation(v100);
              }
              v65 = *(void **)(*((void *)&v108 + 1) + 8 * (void)k);
              v105 = (void *)MEMORY[0x18C127630]();
              v66 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "entitiesByName"), "objectForKey:", objc_msgSend(v65, "cdEntityName")), "relationshipsByName"), "objectForKey:", objc_msgSend(v65, "relationshipName"));
              if (v66)
              {
                uint64_t v106 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, [v65 recordName], objc_msgSend(v65, "relatedRecordName"), (uint64_t)v66, objc_msgSend(v66, "inverseRelationship"));
                [*(id *)(a1 + 24) setObject:v65 forKey:v106];
                [*(id *)(a1 + 32) addObject:v106];
                uint64_t v67 = [v65 recordName];
                uint64_t v68 = objc_msgSend((id)objc_msgSend(v65, "recordZone"), "ckRecordZoneName");
                v69 = objc_msgSend((id)objc_msgSend(v65, "recordZone"), "ckOwnerName");
                objc_msgSend((id)objc_msgSend(v65, "objectID"), "persistentStore");
                v70 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordIDForRecordName:inZoneWithName:ownerName:inStore:](a1, v67, v68, v69);
                id v71 = (id)[*(id *)(a1 + 48) objectForKey:v70];
                if (!v71)
                {
                  id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  [*(id *)(a1 + 48) setObject:v71 forKey:v70];
                }
                id v72 = (id)objc_msgSend(v71, "objectForKey:", objc_msgSend(v66, "name"));
                if (!v72)
                {
                  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  objc_msgSend(v71, "setObject:forKey:", v72, objc_msgSend(v66, "name"));
                }
                uint64_t v73 = [v65 relatedRecordName];
                uint64_t v74 = objc_msgSend((id)objc_msgSend(v65, "recordZone"), "ckRecordZoneName");
                v75 = objc_msgSend((id)objc_msgSend(v65, "recordZone"), "ckOwnerName");
                objc_msgSend((id)objc_msgSend(v65, "objectID"), "persistentStore");
                v76 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordIDForRecordName:inZoneWithName:ownerName:inStore:](a1, v73, v74, v75);
                [v72 addObject:v76];

                id v77 = (id)[*(id *)(a1 + 48) objectForKey:v76];
                if (!v77)
                {
                  id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  [*(id *)(a1 + 48) setObject:v77 forKey:v76];
                }
                id v78 = (id)objc_msgSend(v77, "objectForKey:", objc_msgSend((id)objc_msgSend(v66, "inverseRelationship"), "name"));
                if (!v78)
                {
                  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  objc_msgSend(v77, "setObject:forKey:", v78, objc_msgSend((id)objc_msgSend(v66, "inverseRelationship"), "name"));
                }
                id v79 = (id)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", objc_msgSend(v70, "zoneID"));
                if (!v79)
                {
                  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v79, objc_msgSend(v70, "zoneID"));
                }
                [v79 addObject:v106];

                [v78 addObject:v70];
              }
            }
            uint64_t v63 = [v100 countByEnumeratingWithState:&v108 objects:v139 count:16];
          }
          while (v63);
        }
      }
      else
      {
        *((unsigned char *)v132 + 24) = 0;
        id v80 = (id)v126[5];
      }
    }
  }
  else
  {
LABEL_32:
    *((unsigned char *)v21 + 24) = 0;
    id v35 = (id)v126[5];
  }
  if (!*((unsigned char *)v132 + 24))
  {
    id v83 = (id)v126[5];
    if (v83)
    {
      if (a4) {
        *a4 = v83;
      }
    }
    else
    {
      uint64_t v84 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v84, v85, v86, v87, v88, v89, v90, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m");
      v91 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v136 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitStoreComparisonCache.m";
        __int16 v137 = 1024;
        int v138 = 495;
        _os_log_fault_impl(&dword_18AB82000, v91, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v126[5] = 0;
  BOOL v81 = *((unsigned char *)v132 + 24) != 0;
  _Block_object_dispose(&v125, 8);
  _Block_object_dispose(&v131, 8);
  return v81;
}

- (PFCloudKitStoreComparisonCacheStoreCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFCloudKitStoreComparisonCacheStoreCache;
  v2 = [(PFCloudKitStoreComparisonCacheStoreCache *)&v4 init];
  if (v2)
  {
    v2->_identifiers = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_identifierToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_mtmKeyToMirroredRelationship = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_mtmKeys = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_recordIDToRelationshipNameToRelatedRecordIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_recordIDToMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_objectIDToRecordMetadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_recordIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_recordIDToObjectID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_objectIDToRecordID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_recordZones = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_sharedRecordZones = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_recordZoneIDToRecordIDs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_zoneIDToMTMKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_checkCloudKitMetadata = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->_identifiers = 0;
  self->_identifierToObjectID = 0;

  self->_mtmKeyToMirroredRelationship = 0;
  self->_mtmKeys = 0;

  self->_recordIDToRelationshipNameToRelatedRecordIDs = 0;
  self->_recordIDToMetadata = 0;

  self->_objectIDToRecordMetadata = 0;
  self->_recordIDs = 0;

  self->_recordIDToObjectID = 0;
  self->_objectIDToRecordID = 0;

  self->_recordZones = 0;
  self->_sharedRecordZones = 0;

  self->_recordZoneIDToRecordIDs = 0;
  self->_zoneIDToMTMKeys = 0;

  self->_identityRecordName = 0;
  self->_databaseScopeNumber = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitStoreComparisonCacheStoreCache;
  [(PFCloudKitStoreComparisonCacheStoreCache *)&v3 dealloc];
}

id __77__PFCloudKitStoreComparisonCacheStoreCache_populateForStore_inContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v4 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id result = (id)[a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
    id v24 = result;
    if (result)
    {
      uint64_t v22 = v4;
      uint64_t v23 = *(void *)v27;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(a2);
          }
          v8 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v7);
          v9 = (void *)MEMORY[0x18C127630]();
          v10 = *(id **)(v4 + 32);
          if (v10)
          {
            context = v9;
            id v11 = (id)objc_msgSend((id)objc_msgSend(v8, "objectID"), "persistentStore");
            uint64_t v12 = [v11 identifier];
            uint64_t v13 = (void *)[v11 _persistentStoreCoordinator];
            uint64_t v14 = [v8 ckRecordName];
            uint64_t v15 = objc_msgSend((id)objc_msgSend(v8, "recordZone"), "ckRecordZoneName");
            uint64_t v16 = objc_msgSend((id)objc_msgSend(v8, "recordZone"), "ckOwnerName");
            objc_msgSend((id)objc_msgSend(v8, "objectID"), "persistentStore");
            uint64_t v17 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordIDForRecordName:inZoneWithName:ownerName:inStore:]((uint64_t)v10, v14, v15, v16);
            v18 = objc_msgSend((id)objc_msgSend(v11, "model"), "entityForID:", objc_msgSend((id)objc_msgSend(v8, "entityId"), "unsignedLongValue"));
            uint64_t v19 = [v13 managedObjectIDForURIRepresentation:objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", objc_msgSend(NSString, "stringWithFormat:", @"x-coredata://%@/%@/p%@", v12, objc_msgSend((id)objc_msgSend(v18, "entityDescription"), "name"), objc_msgSend(v8, "entityPK")))];
            [v10[8] setObject:v8 forKey:v19];
            [v10[11] setObject:v17 forKey:v19];
            [v10[7] setObject:v8 forKey:v17];
            id v20 = (id)objc_msgSend(v10[14], "objectForKey:", objc_msgSend(v17, "zoneID"));
            if (!v20)
            {
              id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              objc_msgSend(v10[14], "setObject:forKey:", v20, objc_msgSend(v17, "zoneID"));
            }
            [v20 addObject:v17];

            [v10[9] addObject:v17];
            [v10[10] setObject:v19 forKey:v17];

            uint64_t v4 = v22;
            v9 = context;
          }
          id v7 = (char *)v7 + 1;
        }
        while (v24 != v7);
        id result = (id)[a2 countByEnumeratingWithState:&v26 objects:v30 count:16];
        id v24 = result;
      }
      while (result);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    id result = a3;
    *(void *)(*(void *)(*(void *)(v4 + 48) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

- (uint64_t)createRecordZoneIDForZoneName:(uint64_t)a1 ownerName:(uint64_t)a2 inStore:(void *)a3
{
  objc_super v3 = a3;
  if ([a3 isEqualToString:getCloudKitCKCurrentUserDefaultName[0]()]
    && *(void *)(a1 + 128))
  {
    objc_super v3 = *(void **)(a1 + 128);
  }
  id v6 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());

  return [v6 initWithZoneName:a2 ownerName:v3];
}

- (uint64_t)createRecordIDForRecordName:(uint64_t)a1 inZoneWithName:(uint64_t)a2 ownerName:(uint64_t)a3 inStore:(void *)a4
{
  v5 = (void *)-[PFCloudKitStoreComparisonCacheStoreCache createRecordZoneIDForZoneName:ownerName:inStore:](a1, a3, a4);
  uint64_t v6 = [objc_alloc((Class)getCloudKitCKRecordIDClass[0]()) initWithRecordName:a2 zoneID:v5];

  return v6;
}

@end
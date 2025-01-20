@interface PFCloudKitMetadataPurger
- (BOOL)deleteZoneMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 forRecordZones:(uint64_t)a5 inDatabaseWithScope:(void *)a6 error:;
- (BOOL)purgeMetadataAfterAccountChangeFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 inDatabaseWithScope:(void *)a5 error:;
- (BOOL)purgeMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 withOptions:(uint64_t)a5 forRecordZones:(uint64_t)a6 inDatabaseWithScope:(__CFString *)a7 andTransactionAuthor:(void *)a8 error:;
- (BOOL)purgeMetadataMatchingObjectIDs:(uint64_t)a3 inRequest:(uint64_t)a4 inStore:(uint64_t)a5 withMonitor:(void *)a6 error:;
- (uint64_t)_purgeBatchOfObjectIDs:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:;
- (uint64_t)_purgeObjectsMatchingFetchRequest:(void *)a3 fromStore:usingContext:error:;
- (uint64_t)_purgeZoneRelatedObjectsInZoneWithID:(uint64_t)a1 inDatabaseWithScope:(void *)a2 withOptions:(char)a3 inStore:(uint64_t)a4 usingContext:(void *)a5 error:(void *)a6;
@end

@implementation PFCloudKitMetadataPurger

- (BOOL)purgeMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 withOptions:(uint64_t)a5 forRecordZones:(uint64_t)a6 inDatabaseWithScope:(__CFString *)a7 andTransactionAuthor:(void *)a8 error:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__31;
  v33 = __Block_byref_object_dispose__31;
  uint64_t v34 = 0;
  v15 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a3);
  if ([(__CFString *)a7 length]) {
    v16 = a7;
  }
  else {
    v16 = @"NSCloudKitMirroringDelegate.reset";
  }
  [(NSManagedObjectContext *)v15 setTransactionAuthor:v16];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __135__PFCloudKitMetadataPurger_purgeMetadataFromStore_inMonitor_withOptions_forRecordZones_inDatabaseWithScope_andTransactionAuthor_error___block_invoke;
  v28[3] = &unk_1E544E2B8;
  v28[4] = a2;
  v28[5] = a5;
  v28[10] = a4;
  v28[11] = a6;
  v28[6] = v15;
  v28[7] = a1;
  v28[8] = &v35;
  v28[9] = &v29;
  [(NSManagedObjectContext *)v15 performBlockAndWait:v28];
  if (!*((unsigned char *)v36 + 24))
  {
    id v19 = (id)v30[5];
    if (v19)
    {
      if (a8) {
        *a8 = v19;
      }
    }
    else
    {
      uint64_t v20 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v41 = 1024;
        int v42 = 245;
        _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v30[5] = 0;
  BOOL v17 = *((unsigned char *)v36 + 24) != 0;
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v17;
}

void __135__PFCloudKitMetadataPurger_purgeMetadataFromStore_inMonitor_withOptions_forRecordZones_inDatabaseWithScope_andTransactionAuthor_error___block_invoke(uint64_t a1)
{
  v200[1] = *MEMORY[0x1E4F143B8];
  id v159 = 0;
  id v124 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v123 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 32), "configurationName"));
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(a1 + 40)];
  uint64_t v130 = a1;
  if ((*(unsigned char *)(a1 + 80) & 4) != 0)
  {
    v3 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(void *)(a1 + 88), *(void *)(a1 + 32), *(void **)(a1 + 48), (uint64_t)&v159);
    if (v3)
    {
      long long v157 = 0u;
      long long v158 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      v4 = (void *)[(NSManagedObject *)v3 recordZones];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v155 objects:v192 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v156;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v156 != v6) {
              objc_enumerationMutation(v4);
            }
            v8 = -[NSCKRecordZoneMetadata createRecordZoneID](*(void **)(*((void *)&v155 + 1) + 8 * i));
            [v2 addObject:v8];
          }
          uint64_t v5 = [v4 countByEnumeratingWithState:&v155 objects:v192 count:16];
        }
        while (v5);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  uint64_t v9 = v130;
  if (*(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24))
  {
    uint64_t v10 = *(void *)(v130 + 80);
    if ((v10 & 1) == 0)
    {
      if ((v10 & 2) != 0)
      {
        if (![v2 count])
        {
          uint64_t v11 = [NSString stringWithUTF8String:"Asked to purge system fields without any zones from which to purge."];
          _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, v122);
          v18 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v160 = 0;
            _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Asked to purge system fields without any zones from which to purge.", v160, 2u);
          }
        }
        long long v149 = 0u;
        long long v150 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        uint64_t v128 = [v2 countByEnumeratingWithState:&v147 objects:v190 count:16];
        if (v128)
        {
          uint64_t v126 = *(void *)v148;
LABEL_20:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v148 != v126) {
              objc_enumerationMutation(v2);
            }
            uint64_t v20 = *(void **)(*((void *)&v147 + 1) + 8 * v19);
            uint64_t v21 = (void *)MEMORY[0x18C127630]();
            uint64_t v22 = (unint64_t)__ckLoggingOverride >= 3 ? 3 : __ckLoggingOverride;
            uint64_t v23 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Purging system fields from data in zone: %@"];
            [*(id *)(v130 + 48) transactionAuthor];
            _NSCoreDataLog(v22, v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:]_block_invoke");
            if (!*(void *)(v130 + 56)) {
              break;
            }
            v30 = *(void **)(v130 + 32);
            uint64_t v31 = *(void **)(v130 + 48);
            uint64_t v182 = 0;
            v183 = &v182;
            uint64_t v184 = 0x2020000000;
            char v185 = 1;
            uint64_t v176 = 0;
            v177 = &v176;
            uint64_t v178 = 0x3052000000;
            v179 = __Block_byref_object_copy__31;
            v180 = __Block_byref_object_dispose__31;
            uint64_t v181 = 0;
            v32 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
            [(NSFetchRequest *)v32 setReturnsObjectsAsFaults:0];
            [(NSFetchRequest *)v32 setFetchBatchSize:250];
            v33 = (void *)MEMORY[0x1E4F28F60];
            uint64_t v122 = [v20 zoneName];
            [v20 ownerName];
            -[NSFetchRequest setPredicate:](v32, "setPredicate:", [v33 predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@"]);
            v200[0] = v30;
            -[NSFetchRequest setAffectedStores:](v32, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:1]);
            *(void *)v160 = MEMORY[0x1E4F143A8];
            uint64_t v161 = 3221225472;
            v162 = __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke;
            v163 = &unk_1E544C830;
            uint64_t v164 = (uint64_t)v31;
            v165 = &v176;
            v166 = &v182;
            +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v32, v31, (uint64_t)v160);
            if (!*((unsigned char *)v183 + 24)) {
              goto LABEL_29;
            }
            uint64_t v34 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath]);
            [(NSFetchRequest *)v34 setReturnsObjectsAsFaults:0];
            [(NSFetchRequest *)v34 setFetchBatchSize:250];
            uint64_t v35 = (void *)MEMORY[0x1E4F28F60];
            uint64_t v122 = [v20 zoneName];
            [v20 ownerName];
            -[NSFetchRequest setPredicate:](v34, "setPredicate:", [v35 predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@"]);
            id v199 = v30;
            -[NSFetchRequest setAffectedStores:](v34, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v199 count:1]);
            uint64_t v169 = MEMORY[0x1E4F143A8];
            uint64_t v170 = 3221225472;
            v171 = __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2;
            v172 = &unk_1E544C830;
            id v173 = v31;
            v174 = &v176;
            v175 = &v182;
            +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v34, v31, (uint64_t)&v169);
            if (!*((unsigned char *)v183 + 24))
            {
LABEL_29:
              id v36 = (id)v177[5];
              if (v36)
              {
                id v159 = v36;
              }
              else
              {
                uint64_t v37 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                _NSCoreDataLog(17, v37, v38, v39, v40, v41, v42, v43, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
                v44 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v196 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
                  __int16 v197 = 1024;
                  int v198 = 615;
                  _os_log_fault_impl(&dword_18AB82000, v44, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                }
              }
            }

            v177[5] = 0;
            int v45 = *((unsigned __int8 *)v183 + 24);
            _Block_object_dispose(&v176, 8);
            _Block_object_dispose(&v182, 8);
            if (!v45) {
              break;
            }
            if (v128 == ++v19)
            {
              uint64_t v128 = [v2 countByEnumeratingWithState:&v147 objects:v190 count:16];
              if (v128) {
                goto LABEL_20;
              }
              goto LABEL_71;
            }
          }
LABEL_70:
          *(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24) = 0;
        }
      }
      goto LABEL_71;
    }
    if (![v2 count])
    {
      uint64_t v46 = [NSString stringWithUTF8String:"Asked to purge user rows without any zones from which to purge."];
      _NSCoreDataLog(17, v46, v47, v48, v49, v50, v51, v52, v122);
      v53 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v160 = 0;
        _os_log_fault_impl(&dword_18AB82000, v53, OS_LOG_TYPE_FAULT, "CoreData: Asked to purge user rows without any zones from which to purge.", v160, 2u);
      }
    }
    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    uint64_t v129 = [v2 countByEnumeratingWithState:&v151 objects:v191 count:16];
    if (!v129)
    {
LABEL_71:
      uint64_t v9 = v130;
      if (*(unsigned char *)(v130 + 81))
      {
        +[NSCKMetadataEntry updateOrInsertMetadataEntryWithKey:BOOLValue:forStore:intoManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateBypassHistoryOnExportKey", 1, *(void *)(v130 + 32), *(void **)(v130 + 48), &v159);
        uint64_t v9 = v130;
        if (v159 || (v90 = [*(id *)(v130 + 48) save:&v159], uint64_t v9 = v130, (v90 & 1) == 0)) {
          *(unsigned char *)(*(void *)(*(void *)(v9 + 64) + 8) + 24) = 0;
        }
      }
      goto LABEL_75;
    }
    uint64_t v125 = *(void *)v152;
LABEL_42:
    uint64_t v54 = 0;
    while (1)
    {
      if (*(void *)v152 != v125) {
        objc_enumerationMutation(v2);
      }
      v55 = *(void **)(*((void *)&v151 + 1) + 8 * v54);
      v56 = (void *)MEMORY[0x18C127630]();
      if ((unint64_t)__ckLoggingOverride >= 3) {
        uint64_t v57 = 3;
      }
      else {
        uint64_t v57 = __ckLoggingOverride;
      }
      uint64_t v58 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Removing cloud metadata and client rows in zone: %@"];
      [*(id *)(v130 + 48) transactionAuthor];
      _NSCoreDataLog(v57, v58, v59, v60, v61, v62, v63, v64, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataFromStore:inMonitor:withOptions:forRecordZones:inDatabaseWithScope:andTransactionAuthor:error:]_block_invoke");
      v65 = *(uint64_t **)(v130 + 56);
      if (!v65) {
        goto LABEL_70;
      }
      uint64_t v127 = *(void *)(v130 + 88);
      uint64_t v66 = *(void *)(v130 + 32);
      v67 = *(void **)(v130 + 48);
      uint64_t v182 = 0;
      v183 = &v182;
      uint64_t v184 = 0x2020000000;
      char v185 = 1;
      uint64_t v176 = 0;
      v177 = &v176;
      uint64_t v178 = 0x3052000000;
      v179 = __Block_byref_object_copy__31;
      v180 = __Block_byref_object_dispose__31;
      uint64_t v181 = 0;
      id v68 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v69 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
      v70 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v122 = [v55 zoneName];
      [v55 ownerName];
      -[NSFetchRequest setPredicate:](v69, "setPredicate:", [v70 predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@ AND entityId != NULL AND entityPK != NULL"]);
      [(NSFetchRequest *)v69 setPropertiesToFetch:&unk_1ED7E98F8];
      v200[0] = v66;
      -[NSFetchRequest setAffectedStores:](v69, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:1]);
      [(NSFetchRequest *)v69 setFetchBatchSize:1000];
      uint64_t v169 = MEMORY[0x1E4F143A8];
      uint64_t v170 = 3221225472;
      v171 = __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke;
      v172 = &unk_1E544C830;
      id v173 = v68;
      v174 = &v182;
      v175 = &v176;
      +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v69, v67, (uint64_t)&v169);
      id v199 = 0;
      v71 = v183;
      if (*((unsigned char *)v183 + 24))
      {
        *(void *)v160 = MEMORY[0x1E4F143A8];
        uint64_t v161 = 3221225472;
        v162 = __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2;
        v163 = &unk_1E544E2E0;
        uint64_t v164 = v66;
        v165 = v65;
        v166 = (uint64_t *)v67;
        v167 = &v182;
        v168 = &v176;
        [v68 enumerateKeysAndObjectsUsingBlock:v160];
        v71 = v183;
        if (*((unsigned char *)v183 + 24))
        {
          v72 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
          [(NSFetchRequest *)v72 setReturnsObjectsAsFaults:0];
          [(NSFetchRequest *)v72 setFetchBatchSize:250];
          v73 = (void *)MEMORY[0x1E4F28F60];
          uint64_t v122 = [v55 zoneName];
          [v55 ownerName];
          -[NSFetchRequest setPredicate:](v72, "setPredicate:", [v73 predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@"]);
          uint64_t v194 = v66;
          -[NSFetchRequest setAffectedStores:](v72, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v194 count:1]);
          if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:](v72, v67, &v199))goto LABEL_56; {
          v74 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath]);
          }
          [(NSFetchRequest *)v74 setReturnsObjectsAsFaults:0];
          [(NSFetchRequest *)v74 setFetchBatchSize:250];
          v75 = (void *)MEMORY[0x1E4F28F60];
          uint64_t v122 = [v55 zoneName];
          [v55 ownerName];
          -[NSFetchRequest setPredicate:](v74, "setPredicate:", [v75 predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@"]);
          uint64_t v193 = v66;
          -[NSFetchRequest setAffectedStores:](v74, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v193 count:1]);
          if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:](v74, v67, &v199))
          {
LABEL_56:
            *((unsigned char *)v183 + 24) = 0;
            id v78 = v199;
            goto LABEL_57;
          }
          v76 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v55, v127, v66, v67, (uint64_t)&v199);
          if (!v76)
          {
            v71 = v183;
LABEL_67:
            *((unsigned char *)v71 + 24) = 0;
            id v78 = v199;
LABEL_57:
            v177[5] = (uint64_t)v78;
            v71 = v183;
            goto LABEL_58;
          }
          [v67 deleteObject:v76];
          char v77 = [v67 save:&v199];
          v71 = v183;
          if ((v77 & 1) == 0) {
            goto LABEL_67;
          }
        }
      }
LABEL_58:
      if (!*((unsigned char *)v71 + 24))
      {
        if (v177[5])
        {
          id v159 = (id)v177[5];
        }
        else
        {
          uint64_t v79 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v79, v80, v81, v82, v83, v84, v85, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
          v86 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v196 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
            __int16 v197 = 1024;
            int v198 = 485;
            _os_log_fault_impl(&dword_18AB82000, v86, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
      }

      id v87 = (id)v177[5];
      v177[5] = 0;
      int v88 = *((unsigned __int8 *)v183 + 24);
      _Block_object_dispose(&v176, 8);
      _Block_object_dispose(&v182, 8);
      if (!v88) {
        goto LABEL_70;
      }
      if (v129 == ++v54)
      {
        uint64_t v89 = [v2 countByEnumeratingWithState:&v151 objects:v191 count:16];
        uint64_t v129 = v89;
        if (v89) {
          goto LABEL_42;
        }
        goto LABEL_71;
      }
    }
  }
LABEL_75:
  if (!*(unsigned char *)(*(void *)(*(void *)(v9 + 64) + 8) + 24)) {
    goto LABEL_139;
  }
  uint64_t v91 = *(void *)(v130 + 80);
  if ((v91 & 0x20) != 0)
  {
    [v124 addObject:@"NSCloudKitMirroringDelegateLastHistoryTokenKey"];
    uint64_t v91 = *(void *)(v130 + 80);
  }
  if ((v91 & 0xC) != 0 && *(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24))
  {
    if ((v91 & 4) == 0)
    {
      if ((v91 & 8) != 0)
      {
        if (![v2 count])
        {
          uint64_t v92 = [NSString stringWithUTF8String:"Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge."];
          _NSCoreDataLog(17, v92, v93, v94, v95, v96, v97, v98, v122);
          v99 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v160 = 0;
            _os_log_fault_impl(&dword_18AB82000, v99, OS_LOG_TYPE_FAULT, "CoreData: Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge.", v160, 2u);
          }
        }
        long long v137 = 0u;
        long long v138 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        uint64_t v100 = [v2 countByEnumeratingWithState:&v135 objects:v187 count:16];
        if (v100)
        {
          uint64_t v101 = *(void *)v136;
          while (1)
          {
            for (uint64_t j = 0; j != v100; ++j)
            {
              if (*(void *)v136 != v101) {
                objc_enumerationMutation(v2);
              }
              v103 = *(void **)(*((void *)&v135 + 1) + 8 * j);
              if (!-[PFCloudKitMetadataPurger _purgeZoneRelatedObjectsInZoneWithID:inDatabaseWithScope:withOptions:inStore:usingContext:error:](*(void *)(v130 + 56), v103, *(void *)(v130 + 80), *(void *)(v130 + 32), *(void **)(v130 + 48), &v159))
              {
                uint64_t v106 = v130;
LABEL_96:
                *(unsigned char *)(*(void *)(*(void *)(v106 + 64) + 8) + 24) = 0;
                goto LABEL_101;
              }
              v104 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:createIfMissing:error:]((uint64_t)NSCKRecordZoneMetadata, v103, *(void *)(v130 + 88), *(void *)(v130 + 32), *(void **)(v130 + 48), 0, (uint64_t)&v159);
              v105 = v104;
              if (v104)
              {
                uint64_t v106 = v130;
                if (*(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24))
                {
                  if (*(unsigned char *)(v130 + 80))
                  {
                    [*(id *)(v130 + 48) deleteObject:v104];
                  }
                  else
                  {
                    [(NSManagedObject *)v104 setCurrentChangeToken:0];
                    [(NSManagedObject *)v105 setHasRecordZone:0];
                    [(NSManagedObject *)v105 setHasSubscription:0];
                  }
                  uint64_t v106 = v130;
                }
              }
              else
              {
                uint64_t v106 = v130;
                if (v159) {
                  goto LABEL_96;
                }
              }
LABEL_101:
              if (!*(unsigned char *)(*(void *)(*(void *)(v106 + 64) + 8) + 24)) {
                goto LABEL_125;
              }
            }
            uint64_t v100 = [v2 countByEnumeratingWithState:&v135 objects:v187 count:16];
            if (!v100) {
              goto LABEL_125;
            }
          }
        }
      }
      goto LABEL_125;
    }
    v107 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(void *)(v130 + 88), *(void *)(v130 + 32), *(void **)(v130 + 48), (uint64_t)&v159);
    v108 = v107;
    if (v107)
    {
      [(NSManagedObject *)v107 setCurrentChangeToken:0];
      [(NSManagedObject *)v108 setHasSubscription:0];
      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      v109 = (void *)[(NSManagedObject *)v108 recordZones];
      uint64_t v110 = [v109 countByEnumeratingWithState:&v143 objects:v189 count:16];
      if (v110)
      {
        uint64_t v111 = *(void *)v144;
        do
        {
          for (uint64_t k = 0; k != v110; ++k)
          {
            if (*(void *)v144 != v111) {
              objc_enumerationMutation(v109);
            }
            v113 = *(void **)(*((void *)&v143 + 1) + 8 * k);
            [v113 setCurrentChangeToken:0];
            [v113 setHasRecordZone:0];
            [v113 setHasSubscription:0];
            [v113 setSupportsFetchChanges:0];
            [v113 setSupportsAtomicChanges:0];
            [v113 setSupportsRecordSharing:0];
          }
          uint64_t v110 = [v109 countByEnumeratingWithState:&v143 objects:v189 count:16];
        }
        while (v110);
      }
      if ([*(id *)(v130 + 48) save:&v159])
      {
        long long v141 = 0u;
        long long v142 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        uint64_t v114 = [v2 countByEnumeratingWithState:&v139 objects:v188 count:16];
        if (!v114) {
          goto LABEL_125;
        }
        uint64_t v115 = *(void *)v140;
LABEL_116:
        uint64_t v116 = 0;
        while (1)
        {
          if (*(void *)v140 != v115) {
            objc_enumerationMutation(v2);
          }
          if (!-[PFCloudKitMetadataPurger _purgeZoneRelatedObjectsInZoneWithID:inDatabaseWithScope:withOptions:inStore:usingContext:error:](*(void *)(v130 + 56), *(void **)(*((void *)&v139 + 1) + 8 * v116), *(void *)(v130 + 80), *(void *)(v130 + 32), *(void **)(v130 + 48), &v159))break; {
          if (v114 == ++v116)
          }
          {
            uint64_t v114 = [v2 countByEnumeratingWithState:&v139 objects:v188 count:16];
            if (!v114) {
              goto LABEL_125;
            }
            goto LABEL_116;
          }
        }
      }
    }
    else if (!v159)
    {
      goto LABEL_125;
    }
    *(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24) = 0;
  }
LABEL_125:
  if (*(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24))
  {
    if ((*(unsigned char *)(v130 + 80) & 0x10) == 0
      || ([v124 addObject:@"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey"],
          [v124 addObject:@"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey"],
          *(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24)))
    {
      if ([v124 count])
      {
        v117 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, [v124 allObjects], *(void *)(v130 + 32), *(void **)(v130 + 48), (uint64_t)&v159);
        if (v117)
        {
          long long v133 = 0u;
          long long v134 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          v118 = (void *)[v117 allValues];
          uint64_t v119 = [v118 countByEnumeratingWithState:&v131 objects:v186 count:16];
          if (v119)
          {
            uint64_t v120 = *(void *)v132;
            do
            {
              for (uint64_t m = 0; m != v119; ++m)
              {
                if (*(void *)v132 != v120) {
                  objc_enumerationMutation(v118);
                }
                [*(id *)(v130 + 48) deleteObject:*(void *)(*((void *)&v131 + 1) + 8 * m)];
              }
              uint64_t v119 = [v118 countByEnumeratingWithState:&v131 objects:v186 count:16];
            }
            while (v119);
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24) = 0;
        }
      }
    }
  }
LABEL_139:
  if (!*(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24)
    || (*(unsigned char *)(*(void *)(*(void *)(v130 + 64) + 8) + 24) = [*(id *)(v130 + 48) save:&v159]) == 0)
  {
    *(void *)(*(void *)(*(void *)(v130 + 72) + 8) + 40) = v159;
  }
}

- (uint64_t)_purgeZoneRelatedObjectsInZoneWithID:(uint64_t)a1 inDatabaseWithScope:(void *)a2 withOptions:(char)a3 inStore:(uint64_t)a4 usingContext:(void *)a5 error:(void *)a6
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v26 = 0;
  if ((a3 & 0x41) != 0)
  {
    uint64_t v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
    [(NSFetchRequest *)v11 setFetchBatchSize:1000];
    -[NSFetchRequest setPredicate:](v11, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@", objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName")]);
    v34[0] = a4;
    -[NSFetchRequest setAffectedStores:](v11, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1]);
    if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:](v11, a5, &v26))goto LABEL_7; {
  }
    }
  if ((a3 & 0x81) == 0) {
    return 1;
  }
  uint64_t v12 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKMirroredRelationship entityPath]);
  [(NSFetchRequest *)v12 setFetchBatchSize:1000];
  -[NSFetchRequest setPredicate:](v12, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"recordZone.ckRecordZoneName = %@ AND recordZone.ckOwnerName = %@", objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName")]);
  uint64_t v33 = a4;
  -[NSFetchRequest setAffectedStores:](v12, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1]);
  if (!-[PFCloudKitMetadataPurger _purgeObjectsMatchingFetchRequest:fromStore:usingContext:error:](v12, a5, &v26))goto LABEL_7; {
  uint64_t v13 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportPendingRelationship entityPath]());
  }
  -[NSFetchRequest setPredicate:](v13, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"recordZoneName = %@ AND recordZoneOwnerName = %@", objc_msgSend(a2, "zoneName"), objc_msgSend(a2, "ownerName")]);
  uint64_t v32 = a4;
  uint64_t v14 = 1;
  -[NSFetchRequest setAffectedStores:](v13, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1]);
  uint64_t v15 = [[NSBatchDeleteRequest alloc] initWithFetchRequest:v13];
  [(NSBatchDeleteRequest *)v15 setResultType:0];
  uint64_t v31 = a4;
  -[NSPersistentStoreRequest setAffectedStores:](v15, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1]);
  [(NSBatchDeleteRequest *)v15 setResultType:0];
  char v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "executeRequest:error:", v15, &v26), "result"), "BOOLValue");

  if ((v16 & 1) == 0)
  {
LABEL_7:
    if (v26)
    {
      if (a6)
      {
        uint64_t v14 = 0;
        *a6 = v26;
        return v14;
      }
    }
    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v24 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v29 = 1024;
        int v30 = 676;
        _os_log_fault_impl(&dword_18AB82000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    return 0;
  }
  return v14;
}

- (BOOL)purgeMetadataMatchingObjectIDs:(uint64_t)a3 inRequest:(uint64_t)a4 inStore:(uint64_t)a5 withMonitor:(void *)a6 error:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v28 = 0;
  __int16 v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = __Block_byref_object_copy__31;
  uint64_t v26 = __Block_byref_object_dispose__31;
  uint64_t v27 = 0;
  uint64_t v9 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a5);
  [(NSManagedObjectContext *)v9 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__PFCloudKitMetadataPurger_purgeMetadataMatchingObjectIDs_inRequest_inStore_withMonitor_error___block_invoke;
  v21[3] = &unk_1E544D598;
  v21[4] = a2;
  v21[5] = a4;
  v21[6] = v9;
  v21[7] = &v28;
  v21[8] = &v22;
  [(NSManagedObjectContext *)v9 performBlockAndWait:v21];

  if (!*((unsigned char *)v29 + 24))
  {
    id v12 = (id)v23[5];
    if (v12)
    {
      if (a6) {
        *a6 = v12;
      }
    }
    else
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v34 = 1024;
        int v35 = 329;
        _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v23[5] = 0;
  BOOL v10 = *((unsigned char *)v29 + 24) != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  return v10;
}

void __95__PFCloudKitMetadataPurger_purgeMetadataMatchingObjectIDs_inRequest_inStore_withMonitor_error___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v2 = +[PFCloudKitMetadataModel createMapOfEntityIDToPrimaryKeySetForObjectIDs:*(void *)(a1 + 32) fromStore:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v2;
  uint64_t v26 = [v2 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v38;
LABEL_3:
    uint64_t v3 = 0;
    while (1)
    {
      if (*(void *)v38 != v25) {
        objc_enumerationMutation(obj);
      }
      uint64_t v4 = *(void *)(*((void *)&v37 + 1) + 8 * v3);
      context = (void *)MEMORY[0x18C127630]();
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v6 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
      -[NSFetchRequest setPredicate:](v6, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"entityId = %@ AND entityPK IN %@", v4, objc_msgSend(obj, "objectForKey:", v4)]);
      [(NSFetchRequest *)v6 setFetchBatchSize:100];
      uint64_t v45 = *(void *)(a1 + 40);
      -[NSFetchRequest setAffectedStores:](v6, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1]);
      v7 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v6 error:*(void *)(*(void *)(a1 + 64) + 8) + 40];
      if (v7)
      {
        v8 = v7;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v34 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              if ([v13 ckRecordName]) {
                objc_msgSend(v5, "addObject:", objc_msgSend(v13, "ckRecordName"));
              }
              objc_msgSend((id)objc_msgSend(v13, "recordZone"), "setCurrentChangeToken:", 0);
              objc_msgSend((id)objc_msgSend(v13, "recordZone"), "setLastFetchDate:", 0);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "recordZone"), "database"), "setCurrentChangeToken:", 0);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "recordZone"), "database"), "setLastFetchDate:", 0);
              [*(id *)(a1 + 48) deleteObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v44 count:16];
          }
          while (v10);
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        id v14 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v42[0] = +[NSCKMirroredRelationship entityPath];
        v42[1] = +[NSCKImportPendingRelationship entityPath]();
        uint64_t v15 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v43 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = +[NSFetchRequest fetchRequestWithEntityName:*(void *)(*((void *)&v29 + 1) + 8 * j)];
              -[NSFetchRequest setPredicate:](v20, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"recordName IN %@ OR relatedRecordName IN %@", v5, v5]);
              uint64_t v21 = [[NSBatchDeleteRequest alloc] initWithFetchRequest:v20];
              [(NSBatchDeleteRequest *)v21 setResultType:0];
              uint64_t v41 = *(void *)(a1 + 40);
              -[NSPersistentStoreRequest setAffectedStores:](v21, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1]);
              [(NSBatchDeleteRequest *)v21 setResultType:0];
              if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v21, *(void *)(*(void *)(a1 + 64) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
              {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
                id v22 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

                goto LABEL_29;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v43 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }
      }
LABEL_29:
      if (([*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 64) + 8) + 40] & 1) == 0)
      {
        id v23 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
      [*(id *)(a1 + 48) reset];

      int v24 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (!v24) {
        break;
      }
      if (++v3 == v26)
      {
        uint64_t v26 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
        if (v26) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a3;
    *a4 = 1;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      id v10 = 0;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(a2);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (!v9
            || (uint64_t v14 = [v9 integerValue],
                v14 != objc_msgSend((id)objc_msgSend(v13, "entityId"), "integerValue")))
          {

            id v9 = (id)[v13 entityId];
            id v15 = (id)[*(id *)(a1 + 32) objectForKey:v9];
            if (v15)
            {
              id v10 = v15;
            }
            else
            {
              id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, objc_msgSend(v13, "entityId"));
            }
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(v13, "entityPK"));
        }
        uint64_t v8 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
      id v10 = 0;
    }
  }
}

void __113__PFCloudKitMetadataPurger__wipeUserRowsAndMetadataForZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)_sqlCoreLookupSQLEntityForEntityID(*(void **)(a1 + 32), [a2 unsignedLongValue]);
  if (v8)
  {
    id v9 = v8;
    long long v39 = a4;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v11 = [a3 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(a3);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
        if ([v15 longValue] < 1)
        {
          uint64_t v17 = [NSString stringWithUTF8String:"Cannot create objectID: got a 0 pk for entity: %@"];
          uint64_t v18 = objc_msgSend((id)objc_msgSend(v9, "entityDescription"), "name");
          _NSCoreDataLog(17, v17, v19, v20, v21, v22, v23, v24, v18);
          uint64_t v25 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v27 = objc_msgSend((id)objc_msgSend(v9, "entityDescription"), "name");
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v27;
            _os_log_fault_impl(&dword_18AB82000, v25, OS_LOG_TYPE_FAULT, "CoreData: Cannot create objectID: got a 0 pk for entity: %@", buf, 0xCu);
          }
        }
        else
        {
          long long v16 = objc_msgSend(*(id *)(a1 + 32), "newObjectIDForEntity:pk:", v9, objc_msgSend(v15, "longValue"));
          [v10 addObject:v16];
        }
        if ((unint64_t)[v10 count] >= 0x1F4)
        {
          uint64_t v26 = (void *)MEMORY[0x18C127630]();
          *(void *)buf = 0;
          if ((-[PFCloudKitMetadataPurger _purgeBatchOfObjectIDs:fromStore:inManagedObjectContext:error:](*(void *)(a1 + 40), v10, *(void *)(a1 + 32), *(void **)(a1 + 48), (uint64_t)buf) & 1) == 0)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = *(id *)buf;
          }
        }
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [a3 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && [v10 count])
    {
      uint64_t v28 = (void *)MEMORY[0x18C127630]();
      *(void *)buf = 0;
      if ((-[PFCloudKitMetadataPurger _purgeBatchOfObjectIDs:fromStore:inManagedObjectContext:error:](*(void *)(a1 + 40), v10, *(void *)(a1 + 32), *(void **)(a1 + 48), (uint64_t)buf) & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = *(id *)buf;
      }
    }

    a4 = v39;
  }
  else
  {
    uint64_t v29 = [NSString stringWithUTF8String:"Cannot create objectID. Unable to find entity with id '%@' in store '%@'\n%@"];
    _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)a2);
    long long v36 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v38 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = a2;
      __int16 v45 = 2112;
      uint64_t v46 = v37;
      __int16 v47 = 2112;
      uint64_t v48 = v38;
      _os_log_fault_impl(&dword_18AB82000, v36, OS_LOG_TYPE_FAULT, "CoreData: Cannot create objectID. Unable to find entity with id '%@' in store '%@'\n%@", buf, 0x20u);
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *a4 = 1;
  }
}

- (uint64_t)_purgeBatchOfObjectIDs:(uint64_t)a3 fromStore:(void *)a4 inManagedObjectContext:(uint64_t)a5 error:
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v9 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "anyObject"), "entity"), "name"));
  -[NSFetchRequest setPredicate:](v9, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", a2]);
  id v10 = [[NSBatchDeleteRequest alloc] initWithFetchRequest:v9];
  [(NSBatchDeleteRequest *)v10 setResultType:0];
  v13[0] = a3;
  -[NSPersistentStoreRequest setAffectedStores:](v10, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1]);
  uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "executeRequest:error:", v10, a5), "result"), "BOOLValue");

  return v11;
}

- (uint64_t)_purgeObjectsMatchingFetchRequest:(void *)a3 fromStore:usingContext:error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__31;
  uint64_t v20 = __Block_byref_object_dispose__31;
  uint64_t v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__PFCloudKitMetadataPurger__purgeObjectsMatchingFetchRequest_fromStore_usingContext_error___block_invoke;
  v15[3] = &unk_1E544C830;
  v15[4] = a2;
  v15[5] = &v16;
  v15[6] = &v22;
  +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, a1, a2, (uint64_t)v15);
  if (!*((unsigned char *)v23 + 24))
  {
    id v6 = (id)v17[5];
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
    }
    else
    {
      uint64_t v7 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v14 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v27 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v28 = 1024;
        int v29 = 542;
        _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v17[5] = 0;
  uint64_t v4 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v4;
}

uint64_t __91__PFCloudKitMetadataPurger__purgeObjectsMatchingFetchRequest_fromStore_usingContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4, unsigned char *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v10 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(a2);
          }
          [*(id *)(a1 + 32) deleteObject:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
    uint64_t result = [*(id *)(a1 + 32) hasChanges];
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 32) save:*(void *)(*(void *)(a1 + 40) + 8) + 40];
      if ((result & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *a4 = 1;
        *a5 = 1;
      }
    }
  }
  return result;
}

uint64_t __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          [v12 setEncodedRecord:0];
          [v12 setCkRecordSystemFields:0];
          [v12 setCkShare:0];
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    uint64_t result = [*(id *)(a1 + 32) hasChanges];
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 32) save:*(void *)(*(void *)(a1 + 40) + 8) + 40];
      if ((result & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *a4 = 1;
      }
    }
  }
  return result;
}

uint64_t __135__PFCloudKitMetadataPurger__wipeSystemFieldsAndResetUploadStateForMetadataInZoneWithID_inDatabaseWithScope_inStore_usingContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      uint64_t v11 = MEMORY[0x1E4F1CC28];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(a2);
          }
          long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v13 setCkRecordSystemFields:0];
          [v13 setIsUploaded:v11];
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    uint64_t result = [*(id *)(a1 + 32) hasChanges];
    if (result)
    {
      uint64_t result = [*(id *)(a1 + 32) save:*(void *)(*(void *)(a1 + 40) + 8) + 40];
      if ((result & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *a4 = 1;
      }
    }
  }
  return result;
}

- (BOOL)purgeMetadataAfterAccountChangeFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 inDatabaseWithScope:(void *)a5 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__31;
  char v25 = __Block_byref_object_dispose__31;
  uint64_t v26 = 0;
  uint64_t v8 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a3);
  [(NSManagedObjectContext *)v8 setTransactionAuthor:@"NSCloudKitMirroringDelegate.reset"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __105__PFCloudKitMetadataPurger_purgeMetadataAfterAccountChangeFromStore_inMonitor_inDatabaseWithScope_error___block_invoke;
  v20[3] = &unk_1E544DCB8;
  v20[4] = a2;
  v20[5] = v8;
  v20[6] = &v27;
  v20[7] = &v21;
  v20[8] = a4;
  [(NSManagedObjectContext *)v8 performBlockAndWait:v20];
  if (!*((unsigned char *)v28 + 24))
  {
    id v11 = (id)v22[5];
    if (v11)
    {
      if (a5) {
        *a5 = v11;
      }
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v33 = 1024;
        int v34 = 795;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v22[5] = 0;
  BOOL v9 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v9;
}

void __105__PFCloudKitMetadataPurger_purgeMetadataAfterAccountChangeFromStore_inMonitor_inDatabaseWithScope_error___block_invoke(uint64_t a1)
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v84 = 0;
  id v2 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 32), "configurationName"));
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v2;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v80 objects:v94 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v81;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v81 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x18C127630]();
        if ((unint64_t)__ckLoggingOverride >= 3) {
          uint64_t v9 = 3;
        }
        else {
          uint64_t v9 = __ckLoggingOverride;
        }
        uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Removing rows after account change: %@"];
        [*(id *)(a1 + 40) transactionAuthor];
        [v7 name];
        _NSCoreDataLog(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataAfterAccountChangeFromStore:inMonitor:inDatabaseWithScope:error:]_block_invoke");
        uint64_t v17 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", [v7 name]));
        uint64_t v93 = *(void *)(a1 + 32);
        -[NSPersistentStoreRequest setAffectedStores:](v17, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1]);
        [(NSBatchDeleteRequest *)v17 setResultType:0];
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "executeRequest:error:", v17, &v84), "result"), "BOOLValue") & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;

          goto LABEL_14;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_14:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    PFBundleVersion = (void *)+[_PFRoutines _getPFBundleVersionNumber]();
    uint64_t v19 = +[PFCloudKitMetadataModel newMetadataModelForFrameworkVersion:]((uint64_t)PFCloudKitMetadataModel, PFBundleVersion);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v21 = (objc_class *)objc_opt_class();
    [v20 addObject:NSStringFromClass(v21)];
    uint64_t v22 = (objc_class *)objc_opt_class();
    [v20 addObject:NSStringFromClass(v22)];
    uint64_t v23 = (objc_class *)objc_opt_class();
    [v20 addObject:NSStringFromClass(v23)];
    uint64_t v24 = (objc_class *)objc_opt_class();
    [v20 addObject:NSStringFromClass(v24)];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v66 = v19;
    uint64_t v25 = [(NSManagedObjectModel *)v19 countByEnumeratingWithState:&v76 objects:v92 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v77;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v77 != v27) {
            objc_enumerationMutation(v66);
          }
          uint64_t v29 = *(void **)(*((void *)&v76 + 1) + 8 * j);
          if ((objc_msgSend(v20, "containsObject:", objc_msgSend(v29, "name")) & 1) == 0)
          {
            char v30 = [[NSBatchDeleteRequest alloc] initWithFetchRequest:+[NSFetchRequest fetchRequestWithEntityName:_PFModelMapPathForEntity(v29)]];
            [(NSBatchDeleteRequest *)v30 setResultType:1];
            uint64_t v91 = *(void *)(a1 + 32);
            -[NSPersistentStoreRequest setAffectedStores:](v30, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1]);
            uint64_t v31 = (void *)[*(id *)(a1 + 40) executeRequest:v30 error:&v84];

            if (![v31 result])
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
              long long v42 = (void *)MEMORY[0x18C127630]();
              BOOL v43 = __ckLoggingOverride != 0;
              uint64_t v44 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to purge cloudkit metadata entity (%@): %@"];
              [v29 name];
              _NSCoreDataLog(v43, v44, v45, v46, v47, v48, v49, v50, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataAfterAccountChangeFromStore:inMonitor:inDatabaseWithScope:error:]_block_invoke");
              goto LABEL_31;
            }
            context = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 3) {
              uint64_t v32 = 3;
            }
            else {
              uint64_t v32 = __ckLoggingOverride;
            }
            uint64_t v33 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ - Removed cloud metadata after account change %@"];
            [*(id *)(a1 + 40) transactionAuthor];
            [v29 name];
            _NSCoreDataLog(v32, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[PFCloudKitMetadataPurger purgeMetadataAfterAccountChangeFromStore:inMonitor:inDatabaseWithScope:error:]_block_invoke");
            long long v40 = (void *)[v31 result];
            if ([v40 count])
            {
              uint64_t v89 = @"deleted";
              char v90 = v40;
              uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
              uint64_t v88 = *(void *)(a1 + 40);
              +[NSManagedObjectContext mergeChangesFromRemoteContextSave:intoContexts:](NSManagedObjectContext, "mergeChangesFromRemoteContextSave:intoContexts:", v41, [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1]);
            }
          }
        }
        uint64_t v26 = [(NSManagedObjectModel *)v66 countByEnumeratingWithState:&v76 objects:v92 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_31:

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v51 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, *(void *)(a1 + 64), *(void *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v84);
      if (v51)
      {
        uint64_t v52 = v51;
        [(NSManagedObject *)v51 setCurrentChangeToken:0];
        [(NSManagedObject *)v52 setHasSubscription:0];
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        v53 = (void *)[(NSManagedObject *)v52 recordZones];
        uint64_t v54 = [v53 countByEnumeratingWithState:&v72 objects:v87 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v73;
          do
          {
            for (uint64_t k = 0; k != v55; ++k)
            {
              if (*(void *)v73 != v56) {
                objc_enumerationMutation(v53);
              }
              uint64_t v58 = *(void **)(*((void *)&v72 + 1) + 8 * k);
              [v58 setCurrentChangeToken:0];
              [v58 setHasRecordZone:0];
              [v58 setHasSubscription:0];
              [v58 setSupportsFetchChanges:0];
              [v58 setSupportsAtomicChanges:0];
              [v58 setSupportsRecordSharing:0];
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v72 objects:v87 count:16];
          }
          while (v55);
        }
      }
      else if (v84)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v86[0] = @"NSCloudKitMirroringDelegateLastHistoryTokenKey";
    v86[1] = @"NSCloudKitMirroringDelegateCheckedCKIdentityDefaultsKey";
    v86[2] = @"NSCloudKitMirroringDelegateCKIdentityRecordNameDefaultsKey";
    uint64_t v59 = +[NSCKMetadataEntry entriesForKeys:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3], *(void *)(a1 + 32), *(void **)(a1 + 40), (uint64_t)&v84);
    if (v59)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      uint64_t v60 = (void *)[v59 allValues];
      uint64_t v61 = [v60 countByEnumeratingWithState:&v68 objects:v85 count:16];
      if (v61)
      {
        uint64_t v62 = v61;
        uint64_t v63 = *(void *)v69;
        do
        {
          for (uint64_t m = 0; m != v62; ++m)
          {
            if (*(void *)v69 != v63) {
              objc_enumerationMutation(v60);
            }
            [*(id *)(a1 + 40) deleteObject:*(void *)(*((void *)&v68 + 1) + 8 * m)];
          }
          uint64_t v62 = [v60 countByEnumeratingWithState:&v68 objects:v85 count:16];
        }
        while (v62);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) save:&v84]) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v84;
  }
}

- (BOOL)deleteZoneMetadataFromStore:(uint64_t)a3 inMonitor:(uint64_t)a4 forRecordZones:(uint64_t)a5 inDatabaseWithScope:(void *)a6 error:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v29 = 0;
  char v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000;
  uint64_t v26 = __Block_byref_object_copy__31;
  uint64_t v27 = __Block_byref_object_dispose__31;
  uint64_t v28 = 0;
  uint64_t v10 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a3);
  [(NSManagedObjectContext *)v10 setTransactionAuthor:@"NSCloudKitMirroringDelegate.reset"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__PFCloudKitMetadataPurger_deleteZoneMetadataFromStore_inMonitor_forRecordZones_inDatabaseWithScope_error___block_invoke;
  v22[3] = &unk_1E544D9F8;
  v22[4] = a4;
  v22[5] = a2;
  v22[6] = v10;
  v22[7] = &v29;
  v22[8] = &v23;
  v22[9] = a5;
  [(NSManagedObjectContext *)v10 performBlockAndWait:v22];
  if (!*((unsigned char *)v30 + 24))
  {
    id v13 = (id)v24[5];
    if (v13)
    {
      if (a6) {
        *a6 = v13;
      }
    }
    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m");
      uint64_t v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitMetadataPurger.m";
        __int16 v35 = 1024;
        int v36 = 849;
        _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v24[5] = 0;
  BOOL v11 = *((unsigned char *)v30 + 24) != 0;
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v11;
}

void __107__PFCloudKitMetadataPurger_deleteZoneMetadataFromStore_inMonitor_forRecordZones_inDatabaseWithScope_error___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v34 = 0;
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(a1 + 32)];
  if (![v2 count])
  {
    uint64_t v3 = [NSString stringWithUTF8String:"Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge."];
    _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, v29);
    uint64_t v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v10, OS_LOG_TYPE_FAULT, "CoreData: Asked to purge zone metadata (trying to recreate after the purge) without any zones from which to purge.", buf, 2u);
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v11 = [v2 countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v2);
      }
      uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
      uint64_t v16 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v15, *(void *)(a1 + 72), *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v34);
      if (v16)
      {
        uint64_t v17 = v16;
        if (objc_msgSend((id)-[NSManagedObject records](v16, "records"), "count"))
        {
          uint64_t v18 = [NSString stringWithUTF8String:"Attempting to delete a zone metadata that has records (%ld): %@ - %@"];
          uint64_t v19 = *(void *)(a1 + 72);
          [*(id *)(a1 + 40) URL];
          _NSCoreDataLog(17, v18, v20, v21, v22, v23, v24, v25, v19);
          uint64_t v26 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v27 = *(void *)(a1 + 72);
            uint64_t v28 = [*(id *)(a1 + 40) URL];
            *(_DWORD *)buf = 134218498;
            uint64_t v36 = v27;
            __int16 v37 = 2112;
            uint64_t v38 = v28;
            __int16 v39 = 2112;
            long long v40 = v15;
            _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: Attempting to delete a zone metadata that has records (%ld): %@ - %@", buf, 0x20u);
          }
        }
        [*(id *)(a1 + 48) deleteObject:v17];
      }
      else if (v34)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v2 countByEnumeratingWithState:&v30 objects:v41 count:16];
        if (v12) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    || (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 48) save:&v34]) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v34;
  }
}

@end
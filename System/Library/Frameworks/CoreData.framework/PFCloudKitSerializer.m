@interface PFCloudKitSerializer
+ (BOOL)shouldTrackAttribute:(uint64_t)a1;
+ (BOOL)shouldTrackProperty:(uint64_t)a1;
+ (id)assetsOnRecord:(uint64_t)a1 withOptions:(void *)a2;
+ (id)createSetOfObjectIDsRelatedToObject:(uint64_t)a1;
+ (id)defaultRecordZoneIDForDatabaseScope:(int64_t)a3;
+ (id)newSetOfRecordKeysForAttribute:(int)a3 includeCKAssetsForFileBackedFutures:;
+ (id)newSetOfRecordKeysForEntitiesInConfiguration:(void *)a3 inManagedObjectModel:(int)a4 includeCKAssetsForFileBackedFutures:;
+ (uint64_t)applyCDPrefixToName:(uint64_t)a1;
+ (uint64_t)assetStorageDirectoryURLForStore:(uint64_t)a1;
+ (uint64_t)estimateByteSizeOfRecordID:(uint64_t)a1;
+ (uint64_t)generateCKAssetFileURLForObjectInStore:(uint64_t)a1;
+ (uint64_t)isMirroredRelationshipRecordType:(uint64_t)a1;
+ (uint64_t)isPrivateAttribute:(uint64_t)a1;
+ (uint64_t)isVariableLengthAttributeType:(uint64_t)a1;
+ (uint64_t)mtmKeyForObjectWithRecordName:(uint64_t)a3 relatedToObjectWithRecordName:(uint64_t)a4 byRelationship:(uint64_t)a5 withInverse:;
+ (uint64_t)oldAssetStorageDirectoryURLForStore:(uint64_t)a1;
+ (uint64_t)recordTypeForEntity:(uint64_t)a1;
+ (uint64_t)sizeOfVariableLengthAttribute:(void *)a3 withValue:;
+ (void)_invalidateStaticCaches;
+ (void)initialize;
- (BOOL)applyUpdatedRecords:(uint64_t)a3 deletedRecordIDs:(uint64_t)a4 toStore:(void *)a5 inManagedObjectContext:(uint64_t)a6 onlyUpdatingAttributes:(uint64_t)a7 andRelationships:(uint64_t)a8 madeChanges:(void *)a9 error:;
- (PFCloudKitSerializer)initWithMirroringOptions:(id)a3 metadataCache:(id)a4 recordNamePrefix:(id)a5;
- (id)getRecordMetadataForObject:(void *)a3 inManagedObjectContext:(void *)a4 error:;
- (id)newCKRecordsFromObject:(int)a3 fullyMaterializeRecords:(int)a4 includeRelationships:(void *)a5 error:;
- (uint64_t)shouldEncryptValueForAttribute:(uint64_t)result;
- (void)dealloc;
@end

@implementation PFCloudKitSerializer

+ (uint64_t)recordTypeForEntity:(uint64_t)a1
{
  self;
  if (a2)
  {
    if ((*(unsigned char *)(a2 + 120) & 4) != 0)
    {
      v3 = *(void **)(a2 + 72);
    }
    else
    {
      do
      {
        v3 = (void *)a2;
        a2 = [(id)a2 superentity];
      }
      while (a2);
    }
  }
  else
  {
    v3 = 0;
  }
  uint64_t v4 = [v3 name];
  self;

  return [@"CD_" stringByAppendingString:v4];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__PFCloudKitSerializer_initialize__block_invoke;
    block[3] = &unk_1E544B868;
    block[4] = a1;
    if (initialize_onceToken != -1) {
      dispatch_once(&initialize_onceToken, block);
    }
  }
}

uint64_t __34__PFCloudKitSerializer_initialize__block_invoke()
{
  return self;
}

- (PFCloudKitSerializer)initWithMirroringOptions:(id)a3 metadataCache:(id)a4 recordNamePrefix:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PFCloudKitSerializer;
  v8 = [(PFCloudKitSerializer *)&v10 init];
  if (v8)
  {
    v8->_manyToManyRecordNameToRecord = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8->_recordNamePrefix = (NSString *)[a5 copy];
    v8->_mirroringOptions = (NSCloudKitMirroringDelegateOptions *)a3;
    v8->_writtenAssetURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8->_metadataCache = (PFCloudKitMetadataCache *)a4;
  }
  return v8;
}

- (void)dealloc
{
  self->_manyToManyRecordNameToRecord = 0;
  self->_recordNamePrefix = 0;

  self->_mirroringOptions = 0;
  self->_writtenAssetURLs = 0;

  self->_metadataCache = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitSerializer;
  [(PFCloudKitSerializer *)&v3 dealloc];
}

- (id)newCKRecordsFromObject:(int)a3 fullyMaterializeRecords:(int)a4 includeRelationships:(void *)a5 error:
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v142 = 0;
  v143 = &v142;
  uint64_t v144 = 0x2020000000;
  char v145 = 1;
  uint64_t v136 = 0;
  v137 = &v136;
  uint64_t v138 = 0x3052000000;
  v139 = __Block_byref_object_copy__36;
  v140 = __Block_byref_object_dispose__36;
  uint64_t v141 = 0;
  id v112 = (id)[a2 managedObjectContext];
  id v114 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v113 = (id)[a2 entity];
  id v111 = (id)objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore");
  v6 = (void *)[a2 managedObjectContext];
  id v7 = -[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:](a1, a2, v6, v137 + 5);
  v115 = v7;
  if (v7)
  {
    v116 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[v7 recordZone]);
    if (objc_msgSend((id)objc_msgSend(v115, "encodedRecord"), "length"))
    {
      uint64_t v8 = *(void *)(a1 + 24);
      if (v8) {
        uint64_t v9 = *(void *)(v8 + 136);
      }
      else {
        uint64_t v9 = 0;
      }
      objc_super v10 = (void *)[v115 encodedRecord];
      id v11 = -[PFCloudKitArchivingUtilities recordFromEncodedData:error:](v9, v10, v137 + 5);
      v119 = v11;
      if (!v11)
      {
        *((unsigned char *)v143 + 24) = 0;
        id v11 = (id)v137[5];
        if (!*((unsigned char *)v143 + 24))
        {
          id v117 = 0;
          v119 = 0;
LABEL_25:
          v121 = 0;
          id obj = 0;
          goto LABEL_59;
        }
        goto LABEL_14;
      }
    }
    else
    {
      id v11 = (id)[v115 createRecordFromSystemFields];
      v119 = v11;
    }
    if (!*((unsigned char *)v143 + 24))
    {
      id v117 = 0;
      goto LABEL_25;
    }
    if (v119)
    {
      id v117 = (id)[v119 recordID];
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v13 = -[NSCKRecordMetadata createRecordID](v115);
    id v14 = objc_alloc((Class)getCloudKitCKRecordClass[0]());
    id v117 = (id)v13;
    v119 = objc_msgSend(v14, "initWithRecordType:recordID:", +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, (uint64_t)v113), v13);
LABEL_15:
    uint64_t v15 = [v113 name];
    self;
    uint64_t v16 = [@"CD_" stringByAppendingString:@"entityName"];
    int v17 = [*(id *)(a1 + 24) useDeviceToDeviceEncryption];
    v18 = v119;
    if (v17) {
      v18 = (void *)[v119 encryptedValues];
    }
    [v18 setObject:v15 forKey:v16];
    if (objc_msgSend((id)objc_msgSend(v115, "moveReceipts"), "count") || a3)
    {
      if (a3)
      {
        v19 = (void *)[@"Some sample move receipt data." dataUsingEncoding:4];
        self;
        uint64_t v20 = [@"CD_" stringByAppendingString:@"moveReceipt"];
        int v21 = [*(id *)(a1 + 24) useDeviceToDeviceEncryption];
        v22 = v119;
        if (v21) {
          v22 = (void *)[v119 encryptedValues];
        }
        [v22 setObject:v19 forKey:v20];
        uint64_t v23 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore"));
        if ([v19 writeToURL:v23 options:0 error:v137 + 5])
        {
          [*(id *)(a1 + 40) addObject:v23];
          id v24 = (id)[objc_alloc(getCloudKitCKAssetClass()) initWithFileURL:v23];
          self;
          v25 = (void *)[@"CD_" stringByAppendingString:@"moveReceipt"];
          self;
          objc_msgSend(v119, "setObject:forKey:", v24, objc_msgSend(v25, "stringByAppendingString:", @"_ckAsset"));
        }
        else
        {
          v32 = (void *)MEMORY[0x18C127630]();
          BOOL v33 = __ckLoggingOverride != 0;
          uint64_t v34 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to write CKAsset data for '%@' on '%@' backing record '%@'.\n%@"];
          [a2 objectID];
          [v119 recordID];
          _NSCoreDataLog(v33, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]");
          *((unsigned char *)v143 + 24) = 0;
          id v41 = (id)v137[5];
        }
      }
      else
      {
        v26 = (void *)[v115 createEncodedMoveReceiptData:v137 + 5];
        if (v26)
        {
          unint64_t v27 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 24), "ckAssetThresholdBytes"), "unsignedIntegerValue");
          self;
          v28 = (void *)[@"CD_" stringByAppendingString:@"moveReceipt"];
          self;
          uint64_t v29 = [v28 stringByAppendingString:@"_ckAsset"];
          if (v27 && [v26 length] > v27
            || (uint64_t v30 = [v26 length], (unint64_t)(objc_msgSend(v119, "size") + v30) >= 0xAAE61))
          {
            uint64_t v31 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, objc_msgSend((id)objc_msgSend(a2, "objectID"), "persistentStore"));
            if ([v26 writeToURL:v31 options:0 error:v137 + 5])
            {
              [*(id *)(a1 + 40) addObject:v31];
              objc_msgSend(v119, "setObject:forKey:", (id)objc_msgSend(objc_alloc(getCloudKitCKAssetClass()), "initWithFileURL:", v31), v29);
            }
            else
            {
              v46 = (void *)MEMORY[0x18C127630]();
              BOOL v47 = __ckLoggingOverride != 0;
              uint64_t v48 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to write CKAsset data for '%@' on '%@' backing record '%@'.\n%@"];
              [a2 objectID];
              [v119 recordID];
              _NSCoreDataLog(v47, v48, v49, v50, v51, v52, v53, v54, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]");
              *((unsigned char *)v143 + 24) = 0;
              id v55 = (id)v137[5];
            }
          }
          else
          {
            self;
            uint64_t v43 = [@"CD_" stringByAppendingString:@"moveReceipt"];
            int v44 = [*(id *)(a1 + 24) useDeviceToDeviceEncryption];
            v45 = v119;
            if (v44) {
              v45 = (void *)[v119 encryptedValues];
            }
            [v45 setObject:v26 forKey:v43];
          }
        }
        else
        {
          *((unsigned char *)v143 + 24) = 0;
          id v42 = (id)v137[5];
        }
      }
    }
    v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", objc_msgSend((id)objc_msgSend(v113, "attributesByName"), "allValues"));
    objc_msgSend(v56, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", &__block_literal_global_23));
    v121 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v56, "count"));
    id obj = v56;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id v11 = (id)[v56 countByEnumeratingWithState:&v132 objects:v151 count:16];
    id v57 = v11;
    if (v11)
    {
      uint64_t v58 = *(void *)v133;
      do
      {
        v59 = 0;
        do
        {
          if (*(void *)v133 != v58) {
            objc_enumerationMutation(obj);
          }
          v60 = *(void **)(*((void *)&v132 + 1) + 8 * (void)v59);
          v61 = (void *)MEMORY[0x18C127630]();
          uint64_t v62 = [v60 name];
          v63 = (__CFString *)[a2 valueForKey:v62];
          if ([v60 attributeType] == 1800 || objc_msgSend(v60, "attributeType") == 2100)
          {
            if (v63)
            {
              v64 = (__CFString *)+[_PFRoutines retainedEncodeObjectValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v63, v60);
            }
            else
            {
              if (!a3) {
                goto LABEL_57;
              }
              v64 = +[PFCloudKitSchemaGenerator representativeValueFor:]((uint64_t)PFCloudKitSchemaGenerator, v60);
            }
          }
          else if ([v60 attributeType] == 1100)
          {
            v64 = (__CFString *)[(__CFString *)v63 UUIDString];
          }
          else
          {
            if ([v60 attributeType] != 1200) {
              goto LABEL_55;
            }
            v64 = (__CFString *)[(__CFString *)v63 absoluteString];
          }
          v63 = v64;
LABEL_55:
          if (v63) {
            [v121 setObject:v63 forKey:v62];
          }
LABEL_57:
          v59 = (char *)v59 + 1;
        }
        while (v57 != v59);
        id v11 = (id)[obj countByEnumeratingWithState:&v132 objects:v151 count:16];
        id v57 = v11;
      }
      while (v11);
    }
LABEL_59:
    if (*((unsigned char *)v143 + 24))
    {
      v131[0] = MEMORY[0x1E4F143A8];
      v131[1] = 3221225472;
      v131[2] = __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_2;
      v131[3] = &unk_1E544E778;
      v131[4] = v121;
      [obj sortUsingComparator:v131];
      long long v129 = 0u;
      long long v130 = 0u;
      long long v127 = 0u;
      long long v128 = 0u;
      id v11 = (id)[obj countByEnumeratingWithState:&v127 objects:v150 count:16];
      id v65 = v11;
      if (v11)
      {
        uint64_t v66 = *(void *)v128;
        do
        {
          v67 = 0;
          do
          {
            if (*(void *)v128 != v66) {
              objc_enumerationMutation(obj);
            }
            v68 = *(void **)(*((void *)&v127 + 1) + 8 * (void)v67);
            if (+[PFCloudKitSerializer shouldTrackAttribute:]((uint64_t)PFCloudKitSerializer, v68))
            {
              v125[0] = MEMORY[0x1E4F143A8];
              v125[1] = 3221225472;
              v125[2] = __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_3;
              v125[3] = &unk_1E544E7A0;
              v125[4] = v68;
              v125[5] = v121;
              char v126 = a3;
              v125[6] = a1;
              v125[7] = v119;
              v125[8] = a2;
              v125[9] = &v142;
              v125[10] = &v136;
              +[_PFRoutines wrapBlockInGuardedAutoreleasePool:v125];
            }
            v67 = (char *)v67 + 1;
          }
          while (v65 != v67);
          id v11 = (id)[obj countByEnumeratingWithState:&v127 objects:v150 count:16];
          id v65 = v11;
        }
        while (v11);
      }
      if (a4)
      {
        v69 = (void *)[v113 relationshipsByName];
        v124[0] = MEMORY[0x1E4F143A8];
        v124[1] = 3221225472;
        v124[2] = __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_4;
        v124[3] = &unk_1E544E7C8;
        v124[4] = a2;
        v124[5] = a1;
        v124[6] = v115;
        v124[7] = v117;
        v124[8] = v116;
        v124[9] = v112;
        v124[12] = &v136;
        v124[13] = &v142;
        v124[10] = v114;
        v124[11] = v119;
        id v11 = (id)[v69 enumerateKeysAndObjectsUsingBlock:v124];
      }
    }
    if (*((unsigned char *)v143 + 24))
    {
      if (v119)
      {
        v70 = (void *)MEMORY[0x18C127630](v11);
        if ((unint64_t)__ckLoggingOverride >= 9) {
          uint64_t v71 = 9;
        }
        else {
          uint64_t v71 = __ckLoggingOverride;
        }
        uint64_t v72 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Serializer has finished creating record: %@\nModified Fields: %@"];
        int v73 = [*(id *)(a1 + 24) useDeviceToDeviceEncryption];
        v74 = v119;
        if (v73) {
          v74 = (void *)[v119 encryptedValueStore];
        }
        v75 = v121;
        v76 = obj;
        [v74 changedKeys];
        _NSCoreDataLog(v71, v72, v77, v78, v79, v80, v81, v82, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]");
        [v114 addObject:v119];
        goto LABEL_83;
      }
      uint64_t v92 = [NSString stringWithUTF8String:"Supposedly serialization succeeded but there's no record: %@"];
      _NSCoreDataLog(17, v92, v93, v94, v95, v96, v97, v98, v137[5]);
      v90 = __pflogFaultLog;
      v75 = v121;
      v76 = obj;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_83:

        goto LABEL_84;
      }
      v109 = (const char *)v137[5];
      *(_DWORD *)buf = 138412290;
      v147 = v109;
      v91 = "CoreData: Supposedly serialization succeeded but there's no record: %@";
    }
    else
    {
      v75 = v121;
      v76 = obj;
      if (v137[5]) {
        goto LABEL_83;
      }
      uint64_t v83 = [NSString stringWithUTF8String:"Object serialization failed but did not set an error: %@"];
      _NSCoreDataLog(17, v83, v84, v85, v86, v87, v88, v89, (uint64_t)a2);
      v90 = __pflogFaultLog;
      v75 = v121;
      v76 = obj;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_83;
      }
      *(_DWORD *)buf = 138412290;
      v147 = (const char *)a2;
      v91 = "CoreData: Object serialization failed but did not set an error: %@";
    }
    _os_log_fault_impl(&dword_18AB82000, v90, OS_LOG_TYPE_FAULT, v91, buf, 0xCu);
    goto LABEL_83;
  }
  *((unsigned char *)v143 + 24) = 0;
  id v12 = (id)v137[5];
LABEL_84:

  if (!*((unsigned char *)v143 + 24))
  {
    id v99 = (id)v137[5];
    if (v99)
    {
      if (a5) {
        *a5 = v99;
      }
    }
    else
    {
      uint64_t v100 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v100, v101, v102, v103, v104, v105, v106, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
      v107 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v147 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
        __int16 v148 = 1024;
        int v149 = 612;
        _os_log_fault_impl(&dword_18AB82000, v107, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }

    id v114 = 0;
  }

  v137[5] = 0;
  _Block_object_dispose(&v136, 8);
  _Block_object_dispose(&v142, 8);
  return v114;
}

- (id)getRecordMetadataForObject:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v29 = 0;
  uint64_t v8 = *(void *)(a1 + 48);
  if (!v8 || (id v9 = (id)objc_msgSend(*(id *)(v8 + 16), "objectForKey:", objc_msgSend(a2, "objectID"))) == 0)
  {
    id v9 = (id)+[NSCKRecordMetadata metadataForObject:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, a2, a3, &v29);
    if (!v9)
    {
      if (v29
        || (v20 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", [*(id *)(a1 + 24) databaseScope]), id v9 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:](NSCKRecordMetadata, "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:", a2, objc_msgSend(*(id *)(a1 + 24), "preserveLegacyRecordMetadataBehavior"), v20, *(void *)(a1 + 16), &v29), objc_msgSend(v9, "setNeedsUpload:", 1), v20, !v9))
      {
        id v11 = (void *)MEMORY[0x18C127630]();
        BOOL v12 = __ckLoggingOverride != 0;
        uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to get a metadata zone: %@"];
        _NSCoreDataLog(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:]");
        if (v29)
        {
          if (a4)
          {
            id v9 = 0;
            *a4 = v29;
            return v9;
          }
        }
        else
        {
          uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
          v28 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
            __int16 v32 = 1024;
            int v33 = 1596;
            _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
        return 0;
      }
    }
    -[PFCloudKitMetadataCache registerRecordMetadata:forObject:](*(void *)(a1 + 48), v9, a2);
  }
  return v9;
}

+ (uint64_t)applyCDPrefixToName:(uint64_t)a1
{
  self;

  return [@"CD_" stringByAppendingString:a2];
}

+ (uint64_t)generateCKAssetFileURLForObjectInStore:(uint64_t)a1
{
  self;
  objc_super v3 = (void *)+[PFCloudKitSerializer assetStorageDirectoryURLForStore:]((uint64_t)PFCloudKitSerializer, a2);
  uint64_t v4 = [NSString stringWithFormat:@"%@.fxd", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString")];

  return [v3 URLByAppendingPathComponent:v4 isDirectory:0];
}

uint64_t __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isTransient]) {
    return 0;
  }
  else {
    return [a2 isReadOnly] ^ 1;
  }
}

uint64_t __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  int v6 = +[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, [a2 attributeType]);
  int v7 = +[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, [a3 attributeType]);
  if (((v6 ^ 1) & 1) == 0 && !v7) {
    return 1;
  }
  if ((v6 & v7) != 1) {
    return (uint64_t)((unint64_t)(v7 & (v6 ^ 1u)) << 63) >> 63;
  }
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[PFCloudKitSerializer sizeOfVariableLengthAttribute:withValue:]((uint64_t)PFCloudKitSerializer, a2, objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a2, "name"))));
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[PFCloudKitSerializer sizeOfVariableLengthAttribute:withValue:]((uint64_t)PFCloudKitSerializer, a3, objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a3, "name"))));

  return [v9 compare:v10];
}

+ (uint64_t)isVariableLengthAttributeType:(uint64_t)a1
{
  self;
  uint64_t result = 1;
  if (a2 > 799)
  {
    if (a2 > 1199)
    {
      if (a2 > 1999)
      {
        if (a2 == 2100) {
          return result;
        }
        return 0;
      }
      if (a2 != 1200 && a2 != 1800) {
        return 0;
      }
    }
    else if (a2 <= 999 || a2 != 1000)
    {
      return 0;
    }
  }
  else if (a2 <= 399 || a2 <= 600 || a2 != 700)
  {
    return 0;
  }
  return result;
}

+ (uint64_t)sizeOfVariableLengthAttribute:(void *)a3 withValue:
{
  self;
  uint64_t v5 = [a2 attributeType];
  if (!a3) {
    return 0;
  }
  if (v5 <= 1199)
  {
    if (v5 == 700) {
      goto LABEL_13;
    }
    if (v5 == 1000) {
      goto LABEL_6;
    }
    return 0;
  }
  if (v5 == 1200) {
    goto LABEL_13;
  }
  if (v5 != 2100 && v5 != 1800) {
    return 0;
  }
LABEL_6:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [a3 fileSize];
  }
LABEL_13:

  return [a3 length];
}

+ (BOOL)shouldTrackAttribute:(uint64_t)a1
{
  self;
  if ((+[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)PFCloudKitSerializer, a2) & 1) != 0
    || ![a2 attributeType])
  {
    return 0;
  }

  return +[PFCloudKitSerializer shouldTrackProperty:]((uint64_t)PFCloudKitSerializer, a2);
}

void __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) name];
  self;
  uint64_t v3 = [@"CD_" stringByAppendingString:v2];
  uint64_t v4 = (void *)[*(id *)(a1 + 40) objectForKey:v2];
  if ([*(id *)(a1 + 32) attributeType] == 1000
    || [*(id *)(a1 + 32) attributeType] == 1800)
  {
    unint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "ckAssetThresholdBytes"), "unsignedIntegerValue");
    self;
    int v6 = (void *)[@"CD_" stringByAppendingString:v2];
    self;
    uint64_t v7 = [v6 stringByAppendingString:@"_ckAsset"];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
      }
      if (([*(id *)(a1 + 32) isFileBackedFuture] & 1) != 0
        || v5
        || *(unsigned char *)(a1 + 88)
        || (uint64_t v8 = [v4 length], (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v8) > 0xAAE60))
      {
        if (([*(id *)(a1 + 32) isFileBackedFuture] & 1) != 0
          || [v4 length] >= v5
          || *(unsigned char *)(a1 + 88)
          || (uint64_t v9 = [v4 length], (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v9) > 0xAAE60))
        {
          if (*(unsigned char *)(a1 + 88))
          {
            uint64_t v10 = *(void *)(a1 + 48);
            int v11 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v10, *(void **)(a1 + 32));
            id v12 = v4;
            if (v10)
            {
              int v13 = v11;
              uint64_t v14 = *(void **)(a1 + 56);
              if (v13) {
                uint64_t v14 = (void *)[v14 encryptedValues];
              }
              [v14 setObject:v4 forKey:v3];
              id v12 = v4;
            }
          }
          else
          {
            id v12 = 0;
          }
          uint64_t v24 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectID"), "persistentStore"));
          id v55 = 0;
          if ([*(id *)(a1 + 32) isFileBackedFuture])
          {
            id v25 = (id)[v4 fileURL];
            if (v25)
            {
              if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "copyItemAtURL:toURL:error:", v25, v24, &v55))
              {
                [*(id *)(*(void *)(a1 + 48) + 40) addObject:v24];
                objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", (id)objc_msgSend(objc_alloc(getCloudKitCKAssetClass()), "initWithFileURL:", v24), v7);
                id v12 = -[_NSDataFileBackedFuture _storeMetadata]((uint64_t)v4);

                goto LABEL_56;
              }
              __int16 v32 = (void *)MEMORY[0x18C127630]();
              BOOL v33 = __ckLoggingOverride != 0;
              uint64_t v34 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to copy CKAsset data for '%@' on '%@' backing record '%@'.\n%@"];
              [*(id *)(a1 + 64) objectID];
              [*(id *)(a1 + 56) recordID];
              _NSCoreDataLog(v33, v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]_block_invoke_3");
            }

            return;
          }
          if ([v4 writeToURL:v24 options:0 error:&v55])
          {
            [*(id *)(*(void *)(a1 + 48) + 40) addObject:v24];
            uint64_t v26 = *(void **)(a1 + 56);
            id v27 = objc_alloc(getCloudKitCKAssetClass());
            uint64_t v28 = v24;
LABEL_54:
            objc_msgSend(v26, "setObject:forKey:", (id)objc_msgSend(v27, "initWithFileURL:", v28), v7);
            goto LABEL_56;
          }
          goto LABEL_55;
        }
      }
      goto LABEL_44;
    }
    uint64_t v15 = *(void **)(a1 + 56);
    goto LABEL_20;
  }
  if ([*(id *)(a1 + 32) attributeType] != 700 && objc_msgSend(*(id *)(a1 + 32), "attributeType") != 1200) {
    goto LABEL_45;
  }
  unint64_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 48) + 24), "ckAssetThresholdBytes"), "unsignedIntegerValue");
  self;
  uint64_t v17 = (void *)[@"CD_" stringByAppendingString:v2];
  self;
  uint64_t v7 = [v17 stringByAppendingString:@"_ckAsset"];
  if (!v4)
  {
    uint64_t v29 = *(void *)(a1 + 48);
    int v30 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v29, *(void **)(a1 + 32));
    if (!v29) {
      goto LABEL_21;
    }
    int v31 = v30;
    uint64_t v15 = *(void **)(a1 + 56);
    if (v31) {
      uint64_t v15 = (void *)[v15 encryptedValues];
    }
LABEL_20:
    [v15 setObject:0 forKey:v7];
LABEL_21:
    id v12 = 0;
    goto LABEL_56;
  }
  if (!v16
    && !*(unsigned char *)(a1 + 88)
    && (uint64_t v18 = [v4 length], (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v18) <= 0xAAE60)
    || [v4 length] < v16
    && !*(unsigned char *)(a1 + 88)
    && (uint64_t v19 = [v4 length], (unint64_t)(objc_msgSend(*(id *)(a1 + 56), "size") + v19) <= 0xAAE60))
  {
LABEL_44:
    [*(id *)(a1 + 56) setObject:0 forKey:v7];
LABEL_45:
    id v12 = v4;
    goto LABEL_56;
  }
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v20 = *(void *)(a1 + 48);
    int v21 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v20, *(void **)(a1 + 32));
    id v12 = v4;
    if (v20)
    {
      int v22 = v21;
      uint64_t v23 = *(void **)(a1 + 56);
      if (v22) {
        uint64_t v23 = (void *)[v23 encryptedValues];
      }
      [v23 setObject:v4 forKey:v3];
      id v12 = v4;
    }
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v41 = +[PFCloudKitSerializer generateCKAssetFileURLForObjectInStore:]((uint64_t)PFCloudKitSerializer, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "objectID"), "persistentStore"));
  id v55 = 0;
  if (objc_msgSend((id)objc_msgSend(v4, "dataUsingEncoding:allowLossyConversion:", 4, 0), "writeToURL:options:error:", v41, 0, &v55))
  {
    [*(id *)(*(void *)(a1 + 48) + 40) addObject:v41];
    uint64_t v26 = *(void **)(a1 + 56);
    id v27 = objc_alloc(getCloudKitCKAssetClass());
    uint64_t v28 = v41;
    goto LABEL_54;
  }
LABEL_55:
  id v42 = (void *)MEMORY[0x18C127630]();
  BOOL v43 = __ckLoggingOverride != 0;
  uint64_t v44 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to write CKAsset data for '%@' on '%@' backing record '%@'.\n%@"];
  [*(id *)(a1 + 64) objectID];
  [*(id *)(a1 + 56) recordID];
  _NSCoreDataLog(v43, v44, v45, v46, v47, v48, v49, v50, (uint64_t)"-[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:]_block_invoke_3");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = v55;
LABEL_56:
  uint64_t v51 = *(void *)(a1 + 48);
  int v52 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v51, *(void **)(a1 + 32));
  if (v51)
  {
    int v53 = v52;
    uint64_t v54 = *(void **)(a1 + 56);
    if (v53) {
      uint64_t v54 = (void *)[v54 encryptedValues];
    }
    [v54 setObject:v12 forKey:v3];
  }
}

- (uint64_t)shouldEncryptValueForAttribute:(uint64_t)result
{
  if (result)
  {
    if ([*(id *)(result + 24) useDeviceToDeviceEncryption])
    {
      return 1;
    }
    else
    {
      uint64_t v3 = objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"NSPersistentCloudKitContainerEncryptedAttributeKey");
      if (v3)
      {
        return [v3 BOOLValue];
      }
      else
      {
        return [a2 allowsCloudEncryption];
      }
    }
  }
  return result;
}

void __98__PFCloudKitSerializer_newCKRecordsFromObject_fullyMaterializeRecords_includeRelationships_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  self;
  if (!+[PFCloudKitSerializer shouldTrackProperty:]((uint64_t)PFCloudKitSerializer, a3)) {
    return;
  }
  id v78 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v84 = (void *)[a3 inverseRelationship];
  if (![a3 isToMany] || !objc_msgSend(v84, "isToMany"))
  {
    if (([a3 isToMany] & 1) == 0)
    {
      uint64_t v62 = (void *)[*(id *)(a1 + 32) valueForKey:a2];
      uint64_t v63 = *(void *)(a1 + 40);
      if (v62)
      {
        id v64 = -[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:](v63, v62, (void *)[v62 managedObjectContext], (void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
        if (!v64)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
          id v75 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
          v61 = 0;
          *a4 = 1;
          goto LABEL_67;
        }
        uint64_t v65 = *(void *)(a1 + 40);
        uint64_t v66 = [v64 ckRecordName];
        self;
        uint64_t v67 = [@"CD_" stringByAppendingString:a2];
        int v68 = [*(id *)(*(void *)(a1 + 40) + 24) useDeviceToDeviceEncryption];
        if (v65)
        {
          int v69 = v68;
          v70 = *(void **)(a1 + 88);
          if (v69) {
            v70 = (void *)[v70 encryptedValues];
          }
          [v70 setObject:v66 forKey:v67];
        }
      }
      else
      {
        self;
        uint64_t v71 = [@"CD_" stringByAppendingString:a2];
        int v72 = [*(id *)(*(void *)(a1 + 40) + 24) useDeviceToDeviceEncryption];
        if (v63)
        {
          int v73 = v72;
          v74 = *(void **)(a1 + 88);
          if (v73) {
            v74 = (void *)[v74 encryptedValues];
          }
          [v74 setObject:0 forKey:v71];
        }
      }
    }
    v61 = 0;
    goto LABEL_67;
  }
  id obj = (id)[*(id *)(a1 + 32) valueForKey:a2];
  id v81 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v76 = a4;
  uint64_t v77 = a2;
  uint64_t v82 = (uint64_t)a3;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v8 = [obj countByEnumeratingWithState:&v90 objects:v101 count:16];
  if (!v8) {
    goto LABEL_36;
  }
  uint64_t v9 = v8;
  uint64_t v83 = *(void *)v91;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v91 != v83) {
        objc_enumerationMutation(obj);
      }
      int v11 = *(void **)(*((void *)&v90 + 1) + 8 * v10);
      context = (void *)MEMORY[0x18C127630]();
      id v12 = -[PFCloudKitSerializer getRecordMetadataForObject:inManagedObjectContext:error:](*(void *)(a1 + 40), v11, (void *)[*(id *)(a1 + 32) managedObjectContext], (void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40));
      if (v12)
      {
        uint64_t v13 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, [*(id *)(a1 + 48) ckRecordName], objc_msgSend(v12, "ckRecordName"), v82, (uint64_t)v84);
        [v81 addObject:v13];
        uint64_t v14 = *(id **)(*(void *)(a1 + 40) + 48);
        uint64_t v15 = [*(id *)(a1 + 56) zoneID];
        if (v14
          && (unint64_t v16 = objc_msgSend((id)objc_msgSend(v14[4], "objectForKey:", v15), "objectForKey:", v13),
              (uint64_t v14 = (id *)v16) != 0))
        {
          if (objc_msgSend((id)objc_msgSend(v16, "isUploaded"), "BOOLValue")) {
            goto LABEL_31;
          }
          int v17 = 0;
        }
        else
        {
          int v17 = 1;
        }
        id v19 = (id)[*(id *)(*(void *)(a1 + 40) + 8) objectForKey:v13];
        if (!v19)
        {
          uint64_t v20 = (void *)[v14 ckRecordID];
          if ([v20 length])
          {
            id v21 = objc_alloc((Class)getCloudKitCKRecordIDClass[0]());
          }
          else
          {
            id v21 = objc_alloc((Class)getCloudKitCKRecordIDClass[0]());
            uint64_t v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
          }
          int v22 = (void *)[v21 initWithRecordName:v20 zoneID:*(void *)(a1 + 64)];
          uint64_t v79 = (void *)-[NSCKRecordMetadata createRecordID](*(void **)(a1 + 48));
          uint64_t v23 = (void *)-[NSCKRecordMetadata createRecordID](v12);
          uint64_t v24 = -[PFMirroredManyToManyRelationshipV2 initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:]([PFMirroredManyToManyRelationshipV2 alloc], "initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:", v22, v79, v23, v82, objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "entity"), "relationshipsByName"), "objectForKeyedSubscript:", objc_msgSend(v84, "name")), 0);
          if (v17)
          {
            id v25 = +[NSCKMirroredRelationship insertMirroredRelationshipForManyToMany:inZoneWithMetadata:inStore:withManagedObjectContext:]((uint64_t)NSCKMirroredRelationship, (uint64_t)v24, [*(id *)(a1 + 48) recordZone], objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectID"), "persistentStore"), *(void **)(a1 + 72));
            [(NSManagedObject *)v25 setIsUploaded:MEMORY[0x1E4F1CC28]];
            [(NSManagedObject *)v25 setNeedsDelete:MEMORY[0x1E4F1CC28]];
            [(NSManagedObject *)v25 setIsPending:MEMORY[0x1E4F1CC28]];
          }
          if (!objc_msgSend((id)objc_msgSend(v22, "zoneID"), "isEqual:", objc_msgSend(*(id *)(a1 + 56), "zoneID"))|| (objc_msgSend((id)objc_msgSend(v22, "zoneID"), "isEqual:", objc_msgSend(v23, "zoneID")) & 1) == 0)
          {
            uint64_t v26 = [NSString stringWithUTF8String:"Serializer is attempting to link relationships across zones: %@ - %@ / %@"];
            _NSCoreDataLog(17, v26, v27, v28, v29, v30, v31, v32, (uint64_t)v22);
            BOOL v33 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              uint64_t v37 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412802;
              uint64_t v96 = (uint64_t)v22;
              __int16 v97 = 2112;
              uint64_t v98 = v37;
              __int16 v99 = 2112;
              uint64_t v100 = v23;
              _os_log_fault_impl(&dword_18AB82000, v33, OS_LOG_TYPE_FAULT, "CoreData: Serializer is attempting to link relationships across zones: %@ - %@ / %@", buf, 0x20u);
            }
          }
          id v19 = (id)[objc_alloc((Class)getCloudKitCKRecordClass[0]()) initWithRecordType:@"CDMR" recordID:v22];
          [*(id *)(a1 + 80) addObject:v19];
          uint64_t v34 = *(void *)(a1 + 40);
          if (v34)
          {
            int v35 = [*(id *)(v34 + 24) useDeviceToDeviceEncryption];
            uint64_t v36 = (uint64_t)v19;
            if (v35) {
              uint64_t v36 = objc_msgSend(v19, "encryptedValueStore", v19);
            }
          }
          else
          {
            uint64_t v36 = 0;
          }
          [(PFMirroredManyToManyRelationshipV2 *)v24 populateRecordValues:v36];
          [*(id *)(*(void *)(a1 + 40) + 8) setObject:v19 forKey:v13];
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
        id v18 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
      }
LABEL_31:
      if (!v12) {
        goto LABEL_36;
      }
      ++v10;
    }
    while (v9 != v10);
    uint64_t v38 = [obj countByEnumeratingWithState:&v90 objects:v101 count:16];
    uint64_t v9 = v38;
  }
  while (v38);
LABEL_36:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)) {
    unsigned char *v76 = 1;
  }
  uint64_t v39 = *(void *)(*(void *)(a1 + 40) + 48);
  uint64_t v40 = [*(id *)(a1 + 32) objectID];
  if (v39) {
    uint64_t v41 = objc_msgSend((id)objc_msgSend(*(id *)(v39 + 40), "objectForKey:", v40), "objectForKey:", v77);
  }
  else {
    uint64_t v41 = 0;
  }
  id v42 = (void *)[v41 mutableCopy];
  [v42 minusSet:v81];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v86 objects:v94 count:16];
  if (v43)
  {
    uint64_t v44 = *(void *)v87;
    uint64_t v45 = MEMORY[0x1E4F1CC38];
    uint64_t v46 = MEMORY[0x1E4F1CC28];
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v87 != v44) {
          objc_enumerationMutation(v42);
        }
        uint64_t v48 = *(void *)(*((void *)&v86 + 1) + 8 * v47);
        uint64_t v49 = *(void *)(*(void *)(a1 + 40) + 48);
        uint64_t v50 = [*(id *)(a1 + 56) zoneID];
        if (v49)
        {
          uint64_t v51 = objc_msgSend((id)objc_msgSend(*(id *)(v49 + 32), "objectForKey:", v50), "objectForKey:", v48);
          if (v51)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_50;
            }
          }
        }
        else
        {
          uint64_t v51 = 0;
        }
        uint64_t v52 = [NSString stringWithUTF8String:"Failed to look up cached mirrored relationship for mtmKey: %@"];
        _NSCoreDataLog(17, v52, v53, v54, v55, v56, v57, v58, v48);
        v59 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v96 = v48;
          _os_log_fault_impl(&dword_18AB82000, v59, OS_LOG_TYPE_FAULT, "CoreData: Failed to look up cached mirrored relationship for mtmKey: %@", buf, 0xCu);
        }
LABEL_50:
        [v51 setNeedsDelete:v45];
        [v51 setIsUploaded:v46];
        [v51 setIsPending:v46];
        ++v47;
      }
      while (v43 != v47);
      uint64_t v60 = [v42 countByEnumeratingWithState:&v86 objects:v94 count:16];
      uint64_t v43 = v60;
    }
    while (v60);
  }

  v61 = v81;
LABEL_67:
}

+ (uint64_t)mtmKeyForObjectWithRecordName:(uint64_t)a3 relatedToObjectWithRecordName:(uint64_t)a4 byRelationship:(uint64_t)a5 withInverse:
{
  v27[2] = *MEMORY[0x1E4F143B8];
  self;
  v27[0] = a4;
  v27[1] = a5;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 2), "sortedArrayUsingComparator:", &__block_literal_global_180);
  uint64_t v10 = NSString;
  uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "entity");
  if (v11)
  {
    if ((*(unsigned char *)(v11 + 120) & 4) != 0)
    {
      id v12 = *(void **)(v11 + 72);
    }
    else
    {
      do
      {
        id v12 = (void *)v11;
        uint64_t v11 = [(id)v11 superentity];
      }
      while (v11);
    }
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = [v10 stringWithFormat:@"%@%@_%@", @"CD_M2M_", objc_msgSend(v12, "name"), objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 0), "name")];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v15 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v9);
        }
        if (*(void *)(*((void *)&v22 + 1) + 8 * v18) == a4) {
          uint64_t v19 = a2;
        }
        else {
          uint64_t v19 = a3;
        }
        [v14 addObject:v19];
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
  uint64_t v20 = [NSString stringWithFormat:@"%@:%@", v13, objc_msgSend(v14, "componentsJoinedByString:", @":"];

  return v20;
}

- (BOOL)applyUpdatedRecords:(uint64_t)a3 deletedRecordIDs:(uint64_t)a4 toStore:(void *)a5 inManagedObjectContext:(uint64_t)a6 onlyUpdatingAttributes:(uint64_t)a7 andRelationships:(uint64_t)a8 madeChanges:(void *)a9 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3052000000;
  long long v24 = __Block_byref_object_copy__36;
  long long v25 = __Block_byref_object_dispose__36;
  uint64_t v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke;
  v20[3] = &unk_1E544E890;
  v20[4] = a5;
  v20[5] = a1;
  v20[6] = a4;
  v20[7] = a2;
  v20[8] = a3;
  v20[9] = a6;
  v20[10] = a7;
  v20[11] = &v21;
  v20[12] = &v27;
  v20[13] = a8;
  [a5 performBlockAndWait:v20];
  if (!*((unsigned char *)v28 + 24))
  {
    id v11 = (id)v22[5];
    if (v11)
    {
      if (a9) {
        *a9 = v11;
      }
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
      uint64_t v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
        __int16 v33 = 1024;
        int v34 = 1225;
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

void __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke(uint64_t a1)
{
  uint64_t v432 = *MEMORY[0x1E4F143B8];
  id v356 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator"), "managedObjectModel");
  id v360 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  uint64_t v376 = a1;
  uint64_t v2 = objc_msgSend(v356, "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 48), "configurationName"));
  v411[0] = MEMORY[0x1E4F143A8];
  v411[1] = 3221225472;
  v411[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2;
  v411[3] = &unk_1E544E7F0;
  v411[4] = v360;
  [v2 enumerateObjectsUsingBlock:v411];
  uint64_t v3 = -[PFCloudKitImportZoneContext initWithUpdatedRecords:deletedRecordTypeToRecordIDs:options:fileBackedFuturesDirectory:]([PFCloudKitImportZoneContext alloc], "initWithUpdatedRecords:deletedRecordTypeToRecordIDs:options:fileBackedFuturesDirectory:", *(void *)(v376 + 56), *(void *)(v376 + 64), *(void *)(*(void *)(v376 + 40) + 24), [*(id *)(v376 + 48) fileBackedFuturesDirectory]);
  uint64_t v370 = (uint64_t)v3;
  if (-[PFCloudKitImportZoneContext initializeCachesWithManagedObjectContext:andObservedStore:error:]((uint64_t)v3, *(void **)(v376 + 32), *(void **)(v376 + 48), (id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40)))
  {
    long long v409 = 0u;
    long long v410 = 0u;
    long long v407 = 0u;
    long long v408 = 0u;
    v354 = v3;
    if (v3) {
      modifiedRecords = v3->_modifiedRecords;
    }
    else {
      modifiedRecords = 0;
    }
    id obj = modifiedRecords;
    uint64_t v359 = [(NSArray *)modifiedRecords countByEnumeratingWithState:&v407 objects:v426 count:16];
    if (v359)
    {
      uint64_t v358 = *(void *)v408;
      do
      {
        uint64_t v366 = 0;
        do
        {
          if (*(void *)v408 != v358) {
            objc_enumerationMutation(obj);
          }
          v371 = *(void **)(*((void *)&v407 + 1) + 8 * v366);
          context = (void *)MEMORY[0x18C127630]();
          int v5 = objc_msgSend((id)objc_msgSend(v371, "recordType"), "hasPrefix:", @"CD_");
          uint64_t v6 = *(void *)(v376 + 40);
          uint64_t v7 = v6;
          uint64_t v8 = @"entityName";
          if (v5)
          {
            self;
            uint64_t v8 = (__CFString *)[@"CD_" stringByAppendingString:@"entityName"];
            uint64_t v7 = *(void *)(v376 + 40);
          }
          int v9 = [*(id *)(v7 + 24) useDeviceToDeviceEncryption];
          if (!v6) {
            goto LABEL_16;
          }
          int v10 = v9;
          id v11 = v371;
          if (v10)
          {
            char v12 = [(__CFString *)v8 hasSuffix:@"_ckAsset"];
            id v11 = v371;
            if ((v12 & 1) == 0) {
              id v11 = (void *)[v371 encryptedValues];
            }
          }
          uint64_t v13 = (void *)[v11 objectForKey:v8];
          if (!v13)
          {
LABEL_16:
            uint64_t v13 = (void *)[v371 recordType];
            self;
            if ([v13 hasPrefix:@"CD_"]) {
              uint64_t v13 = (void *)[v13 substringFromIndex:objc_msgSend(@"CD_", "length")];
            }
          }
          if ([v360 objectForKey:v13])
          {
            uint64_t v14 = +[NSCKRecordMetadata metadataForRecord:inManagedObjectContext:fromStore:error:]((uint64_t)NSCKRecordMetadata, v371, *(void **)(v376 + 32), *(void *)(v376 + 48), (void *)(*(void *)(*(void *)(v376 + 88) + 8) + 40));
            uint64_t v15 = v14;
            if (!v14)
            {
              *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
              id v28 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
              goto LABEL_234;
            }
            if (![(NSManagedObject *)v14 recordZone])
            {
              uint64_t v16 = *(void *)(*(void *)(v376 + 40) + 48);
              uint64_t v17 = objc_msgSend((id)objc_msgSend(v371, "recordID"), "zoneID");
              if (!v16 || (uint64_t v18 = (NSManagedObject *)[*(id *)(v16 + 8) objectForKey:v17]) == 0)
              {
                uint64_t v18 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, objc_msgSend((id)objc_msgSend(v371, "recordID"), "zoneID"), objc_msgSend(*(id *)(*(void *)(v376 + 40) + 24), "databaseScope"), *(void *)(v376 + 48), *(void **)(v376 + 32), *(void *)(*(void *)(v376 + 88) + 8) + 40);
                if (v18)
                {
                  -[PFCloudKitMetadataCache cacheZoneMetadata:](*(void *)(*(void *)(v376 + 40) + 48), v18);
                }
                else
                {
                  *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
                  id v29 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
                  uint64_t v18 = 0;
                }
              }
              if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24)) {
                [(NSManagedObject *)v15 setRecordZone:v18];
              }
            }
            v367 = v15;
            if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
            {
              uint64_t v30 = [v371 recordID];
              if (v370
                && (uint64_t v31 = objc_msgSend((id)objc_msgSend(*(id *)(v370 + 64), "objectForKey:", v13), "objectForKey:", v30)) != 0)
              {
                v375 = (NSManagedObject *)[*(id *)(v376 + 32) objectWithID:v31];
                uint64_t v32 = _sqlEntityForEntityDescription([*(id *)(v376 + 48) model], objc_msgSend(v31, "entity"));
                if (v32) {
                  uint64_t v33 = *(unsigned int *)(v32 + 184);
                }
                else {
                  uint64_t v33 = 0;
                }
                if (objc_msgSend((id)-[NSManagedObject entityId](v15, "entityId"), "longValue") != v33
                  || (uint64_t v34 = [v31 _referenceData64],
                      v34 != objc_msgSend((id)-[NSManagedObject entityPK](v15, "entityPK"), "integerValue")))
                {
                  uint64_t v35 = [NSString stringWithUTF8String:"Record metadata doesn't match row: %@\n%@"];
                  _NSCoreDataLog(17, v35, v36, v37, v38, v39, v40, v41, (uint64_t)v31);
                  id v42 = __pflogFaultLog;
                  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v31;
                    __int16 v429 = 2112;
                    v430 = v15;
                    _os_log_fault_impl(&dword_18AB82000, v42, OS_LOG_TYPE_FAULT, "CoreData: Record metadata doesn't match row: %@\n%@", buf, 0x16u);
                  }
                }
              }
              else
              {
                v375 = +[NSEntityDescription insertNewObjectForEntityForName:v13 inManagedObjectContext:*(void *)(v376 + 32)];
                -[PFCloudKitImportZoneContext registerObject:forInsertedRecord:withMetadata:](v370, v375, v371, v15);
              }
              uint64_t v43 = *(void **)(v376 + 72);
              if (v43)
              {
                uint64_t v44 = objc_msgSend(v43, "objectForKey:", -[NSEntityDescription name](-[NSManagedObject entity](v375, "entity"), "name"));
                if (v44) {
                  uint64_t v45 = (NSArray *)v44;
                }
                else {
                  uint64_t v45 = (NSArray *)MEMORY[0x1E4F1CBF0];
                }
              }
              else
              {
                uint64_t v45 = 0;
              }
              uint64_t v46 = *(void **)(v376 + 80);
              if (v46)
              {
                uint64_t v47 = objc_msgSend(v46, "objectForKey:", -[NSEntityDescription name](-[NSManagedObject entity](v375, "entity"), "name"));
                uint64_t v48 = (NSArray *)MEMORY[0x1E4F1CBF0];
                if (v47) {
                  uint64_t v48 = (NSArray *)v47;
                }
                v372 = v48;
              }
              else
              {
                v372 = 0;
              }
              uint64_t v374 = *(void *)(v376 + 40);
              if (!v374) {
                goto LABEL_220;
              }
              uint64_t v49 = *(void *)(*(void *)(v376 + 88) + 8);
              uint64_t v420 = 0;
              if ([(NSManagedObject *)v375 isInserted]
                && [*(id *)(v374 + 24) preserveLegacyRecordMetadataBehavior]
                && [(NSDictionary *)[(NSEntityDescription *)[(NSManagedObject *)v375 entity] attributesByName] objectForKey:@"ckRecordID"]&& ![(NSManagedObject *)v375 valueForKey:@"ckRecordID"])
              {
                -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", objc_msgSend((id)objc_msgSend(v371, "recordID"), "recordName"), @"ckRecordID");
              }
              uint64_t v50 = *(void *)(v374 + 24);
              if (v50) {
                uint64_t v51 = *(void *)(v50 + 136);
              }
              else {
                uint64_t v51 = 0;
              }
              id v52 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v51, (uint64_t)v371, &v420);
              if (v52)
              {
                [(NSManagedObject *)v367 setEncodedRecord:v52];
                [(NSManagedObject *)v367 setCkRecordSystemFields:0];
              }

              int v368 = objc_msgSend((id)objc_msgSend(v371, "recordType"), "hasPrefix:", @"CD_");
              if (!v52) {
                goto LABEL_216;
              }
              if (!v45) {
                uint64_t v45 = [(NSDictionary *)[(NSEntityDescription *)[(NSManagedObject *)v375 entity] attributesByName] allValues];
              }
              long long v419 = 0u;
              long long v418 = 0u;
              long long v417 = 0u;
              long long v416 = 0u;
              uint64_t v53 = [(NSArray *)v45 countByEnumeratingWithState:&v416 objects:v431 count:16];
              if (!v53) {
                goto LABEL_185;
              }
              uint64_t v355 = v49;
              uint64_t v54 = *(void *)v417;
              char v361 = 1;
              v364 = v45;
              while (2)
              {
                uint64_t v55 = 0;
LABEL_69:
                if (*(void *)v417 != v54) {
                  objc_enumerationMutation(v45);
                }
                uint64_t v56 = *(void **)(*((void *)&v416 + 1) + 8 * v55);
                if ((+[PFCloudKitSerializer isPrivateAttribute:]((uint64_t)PFCloudKitSerializer, v56) & 1) != 0
                  || ([v56 isTransient] & 1) != 0
                  || ([v56 isReadOnly] & 1) != 0
                  || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v56, "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"), "BOOLValue") & 1) != 0)
                {
                  goto LABEL_155;
                }
                uint64_t v57 = [v56 name];
                uint64_t v58 = (void *)v57;
                if (v368)
                {
                  self;
                  uint64_t v58 = (void *)[@"CD_" stringByAppendingString:v57];
                }
                int v59 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v374, v56);
                uint64_t v60 = v371;
                if (v59)
                {
                  char v61 = [v58 hasSuffix:@"_ckAsset"];
                  uint64_t v60 = v371;
                  if ((v61 & 1) == 0) {
                    uint64_t v60 = (void *)[v371 encryptedValues];
                  }
                }
                uint64_t v62 = (void *)[v60 objectForKey:v58];
                id v63 = v62;
                if (!v62)
                {
                  if (!+[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, [v56 attributeType]))goto LABEL_96; {
                  int v69 = (void *)v57;
                  }
                  if (v368)
                  {
                    self;
                    int v69 = (void *)[@"CD_" stringByAppendingString:v57];
                  }
                  self;
                  uint64_t v62 = objc_msgSend(v371, "objectForKey:", objc_msgSend(v69, "stringByAppendingString:", @"_ckAsset"));
                  if (!v62)
                  {
LABEL_96:
                    if (([v56 isTransient] & 1) == 0)
                    {
                      uint64_t v70 = *(void *)(v374 + 48);
                      uint64_t v71 = [(NSManagedObject *)v375 objectID];
                      if (v70
                        && (objc_msgSend((id)objc_msgSend(*(id *)(v70 + 48), "objectForKey:", v71), "containsObject:", v57) & 1) != 0)
                      {
                        int v72 = (void *)MEMORY[0x18C127630]();
                        if ((unint64_t)__ckLoggingOverride >= 0x10) {
                          uint64_t v73 = 16;
                        }
                        else {
                          uint64_t v73 = __ckLoggingOverride;
                        }
                        uint64_t v74 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Importer is rejecting updated value for '%@' on '%@' because there are pending local edits that haven't been exported yet."];
                        [(NSManagedObject *)v375 objectID];
                        _NSCoreDataLog(v73, v74, v75, v76, v77, v78, v79, v80, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                      }
                      else
                      {
                        -[NSManagedObject setValue:forKey:](v375, "setValue:forKey:", [v56 defaultValue], v57);
                      }
                    }
                    id v369 = 0;

                    char v110 = 1;
                    id v63 = 0;
                    goto LABEL_153;
                  }
                }
                id v369 = objc_loadWeakRetained((id *)(v374 + 32));
                if ([v56 attributeType] == 1000
                  || [v56 attributeType] == 1800
                  || [v56 attributeType] == 2100)
                {
                  if ([v56 isFileBackedFuture])
                  {
                    getCloudKitCKAssetClass();
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v64 = v62;
                      uint64_t v65 = (void *)v57;
                      if (v368)
                      {
                        self;
                        uint64_t v65 = (void *)[@"CD_" stringByAppendingString:v57];
                      }
                      int v66 = -[PFCloudKitSerializer shouldEncryptValueForAttribute:](v374, v56);
                      uint64_t v67 = v371;
                      if (v66)
                      {
                        char v68 = [v65 hasSuffix:@"_ckAsset"];
                        uint64_t v67 = v371;
                        if ((v68 & 1) == 0) {
                          uint64_t v67 = (void *)[v371 encryptedValues];
                        }
                      }
                      id v365 = (id)[v67 objectForKey:v65];
                    }
                    else
                    {
                      id v365 = v62;
                      uint64_t v82 = (void *)v57;
                      if (v368)
                      {
                        self;
                        uint64_t v82 = (void *)[@"CD_" stringByAppendingString:v57];
                      }
                      self;
                      id v64 = (id)objc_msgSend(v371, "objectForKey:", objc_msgSend(v82, "stringByAppendingString:", @"_ckAsset"));
                    }
                    if (v365)
                    {
                      if (v64)
                      {
                        uint64_t v83 = [v369 cloudKitSerializer:v374 safeSaveURLForAsset:v64];
                        if (v83)
                        {
                          uint64_t v84 = [_NSCloudKitDataFileBackedFuture alloc];
                          if (v370) {
                            uint64_t v85 = *(void *)(v370 + 104);
                          }
                          else {
                            uint64_t v85 = 0;
                          }
                          uint64_t v86 = [(_NSCloudKitDataFileBackedFuture *)v84 initWithStoreMetadata:v365 directory:v85 originalFileURL:v83];
                          goto LABEL_125;
                        }
                        uint64_t v121 = [NSString stringWithUTF8String:"Delegate didn't return a file url for asset: %@"];
                        _NSCoreDataLog(17, v121, v122, v123, v124, v125, v126, v127, (uint64_t)v64);
                        long long v128 = __pflogFaultLog;
                        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v64;
                          _os_log_fault_impl(&dword_18AB82000, v128, OS_LOG_TYPE_FAULT, "CoreData: Delegate didn't return a file url for asset: %@", buf, 0xCu);
                        }
                        v109 = 0;
                      }
                      else
                      {
                        v107 = [_NSCloudKitDataFileBackedFuture alloc];
                        if (v370) {
                          uint64_t v108 = *(void *)(v370 + 104);
                        }
                        else {
                          uint64_t v108 = 0;
                        }
                        uint64_t v86 = [(_NSDataFileBackedFuture *)v107 initWithStoreMetadata:v365 directory:v108];
LABEL_125:
                        v109 = (void *)v86;
                      }
                      id v129 = -[NSManagedObject valueForKey:](v375, "valueForKey:", [v56 name]);
                      if ([v129 isEqual:v109]
                        && ([v129 fileURL] || !v109 || !objc_getProperty(v109, v130, 16, 1)))
                      {
                      }
                      else
                      {

                        id v129 = v109;
                      }
                      id v63 = v129;
                    }
                  }
                  else
                  {
                    getCloudKitCKAssetClass();
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v81 = -[_PFEvanescentData initWithURL:]([_PFEvanescentData alloc], "initWithURL:", [v369 cloudKitSerializer:v374 safeSaveURLForAsset:v62]);

                      if (v81)
                      {
                        id v63 = v81;
                      }
                      else
                      {
                        id v111 = (void *)MEMORY[0x18C127630]();
                        uint64_t v112 = __ckLoggingOverride;
                        uint64_t v113 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Error attempting to read CKAsset file: %@"];
                        _NSCoreDataLog(v112 != 0, v113, v114, v115, v116, v117, v118, v119, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                        id v63 = 0;
                      }
                    }
                    else
                    {
                      getCloudKitCKEncryptedDataClass();
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {

                        id v87 = (id)[v62 data];
                        long long v88 = (void *)MEMORY[0x18C127630]();
                        uint64_t v89 = __ckLoggingOverride;
                        uint64_t v90 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@ encountered CKEncryptedData blob on record (%@): %@"];
                        _NSCoreDataLog(v89 != 0, v90, v91, v92, v93, v94, v95, v96, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                        id v63 = v87;
                      }
                      else if (([v62 isNSData] & 1) == 0)
                      {
                        uint64_t v98 = (void *)MEMORY[0x18C127630]();
                        BOOL v99 = __ckLoggingOverride != 0;
                        uint64_t v100 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unknown value class (%@) for attribute:\n%@"];
                        objc_opt_class();
                        _NSCoreDataLog(v99, v100, v101, v102, v103, v104, v105, v106, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");

                        id v63 = 0;
                      }
                    }
                    if ([v56 attributeType] == 1800 || objc_msgSend(v56, "attributeType") == 2100)
                    {
                      id v120 = +[_PFRoutines retainedDecodeValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v63, v56);

                      id v63 = v120;
                    }
                  }
LABEL_143:
                  uint64_t v131 = *(void *)(v374 + 48);
                  uint64_t v132 = [(NSManagedObject *)v375 objectID];
                  if (v131
                    && (objc_msgSend((id)objc_msgSend(*(id *)(v131 + 48), "objectForKey:", v132), "containsObject:", v57) & 1) != 0)
                  {
                    int v133 = [v56 usesMergeableStorage];
                    long long v134 = (void *)MEMORY[0x18C127630]();
                    if (v133)
                    {
                      objc_msgSend(v63, "merge:", -[NSManagedObject valueForKey:](v375, "valueForKey:", v57));
                      uint64_t v135 = [v63 copy];

                      [(NSManagedObject *)v375 setValue:v135 forKey:v57];
                      char v110 = v361;
                      id v63 = (id)v135;
                      goto LABEL_153;
                    }
                    if ((unint64_t)__ckLoggingOverride >= 0x10) {
                      uint64_t v136 = 16;
                    }
                    else {
                      uint64_t v136 = __ckLoggingOverride;
                    }
                    uint64_t v137 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Importer is rejecting updated value for '%@' on '%@' because there are pending local edits that haven't been exported yet."];
                    [(NSManagedObject *)v375 objectID];
                    _NSCoreDataLog(v136, v137, v138, v139, v140, v141, v142, v143, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                  }
                  else
                  {
                    [(NSManagedObject *)v375 setValue:v63 forKey:v57];
                  }
                  char v110 = v361;
LABEL_153:

                  if ((v110 & 1) == 0)
                  {
                    uint64_t v49 = v355;
                    if (!v420)
                    {
                      uint64_t v191 = [NSString stringWithUTF8String:"Attribute serialization failed but did not set an error: %@.%@"];
                      uint64_t v192 = objc_msgSend((id)objc_msgSend(v56, "entity"), "name");
                      [v56 name];
                      _NSCoreDataLog(17, v191, v193, v194, v195, v196, v197, v198, v192);
                      v199 = __pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        uint64_t v262 = objc_msgSend((id)objc_msgSend(v56, "entity"), "name");
                        uint64_t v263 = [v56 name];
                        *(_DWORD *)buf = 138412546;
                        *(void *)&uint8_t buf[4] = v262;
                        __int16 v429 = 2112;
                        v430 = (NSManagedObject *)v263;
                        _os_log_fault_impl(&dword_18AB82000, v199, OS_LOG_TYPE_FAULT, "CoreData: Attribute serialization failed but did not set an error: %@.%@", buf, 0x16u);
                      }
                    }
LABEL_184:
                    if (v361)
                    {
LABEL_185:
                      v200 = v372;
                      if (!v372) {
                        v200 = [(NSDictionary *)[(NSEntityDescription *)[(NSManagedObject *)v375 entity] relationshipsByName] allValues];
                      }
                      long long v414 = 0u;
                      long long v415 = 0u;
                      long long v412 = 0u;
                      long long v413 = 0u;
                      v373 = v200;
                      uint64_t v201 = [(NSArray *)v200 countByEnumeratingWithState:&v412 objects:v427 count:16];
                      if (v201)
                      {
                        uint64_t v202 = *(void *)v413;
                        do
                        {
                          for (uint64_t i = 0; i != v201; ++i)
                          {
                            if (*(void *)v413 != v202) {
                              objc_enumerationMutation(v373);
                            }
                            v204 = *(void **)(*((void *)&v412 + 1) + 8 * i);
                            if ((![v204 isToMany]
                               || (objc_msgSend((id)objc_msgSend(v204, "inverseRelationship"), "isToMany") & 1) == 0)
                              && ([v204 isToMany] & 1) == 0)
                            {
                              uint64_t v205 = *(void *)(v374 + 48);
                              uint64_t v206 = [v204 name];
                              uint64_t v207 = [(NSManagedObject *)v375 objectID];
                              if (v205
                                && (objc_msgSend((id)objc_msgSend(*(id *)(v205 + 48), "objectForKey:", v207), "containsObject:", v206) & 1) != 0)
                              {
                                v208 = (void *)MEMORY[0x18C127630]();
                                if ((unint64_t)__ckLoggingOverride >= 0x10) {
                                  uint64_t v209 = 16;
                                }
                                else {
                                  uint64_t v209 = __ckLoggingOverride;
                                }
                                uint64_t v210 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Importer is rejecting updated value for '%@' on '%@' because there are pending local edits that haven't been exported yet."];
                                [v204 name];
                                [(NSManagedObject *)v375 objectID];
                                _NSCoreDataLog(v209, v210, v211, v212, v213, v214, v215, v216, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                              }
                              else
                              {
                                uint64_t v217 = [v204 name];
                                v218 = (void *)v217;
                                if (v368)
                                {
                                  self;
                                  v218 = (void *)[@"CD_" stringByAppendingString:v217];
                                }
                                int v219 = [*(id *)(v374 + 24) useDeviceToDeviceEncryption];
                                v220 = v371;
                                if (v219)
                                {
                                  char v221 = [v218 hasSuffix:@"_ckAsset"];
                                  v220 = v371;
                                  if ((v221 & 1) == 0) {
                                    v220 = (void *)[v371 encryptedValues];
                                  }
                                }
                                uint64_t v222 = [v220 objectForKey:v218];
                                if (v222)
                                {
                                  v223 = (void *)-[NSCKRecordMetadata createRecordID](v367);
                                  v224 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", v222, objc_msgSend(v223, "zoneID"));
                                  v225 = (void *)MEMORY[0x18C127630]();
                                  if ((unint64_t)__ckLoggingOverride >= 9) {
                                    uint64_t v226 = 9;
                                  }
                                  else {
                                    uint64_t v226 = __ckLoggingOverride;
                                  }
                                  uint64_t v227 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Adding mirrored relationship to link for record %@ related to %@ by %@"];
                                  [v204 name];
                                  _NSCoreDataLog(v226, v227, v228, v229, v230, v231, v232, v233, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                                  v234 = +[PFMirroredRelationship mirroredRelationshipWithManagedObject:withRecordID:relatedToObjectWithRecordID:byRelationship:]((uint64_t)PFMirroredRelationship, (uint64_t)v375, (uint64_t)v223, (uint64_t)v224, (uint64_t)v204);
                                  -[PFCloudKitImportZoneContext addMirroredRelationshipToLink:](v370, v234);
                                }
                                else if (([v204 isTransient] & 1) == 0)
                                {
                                  [(NSManagedObject *)v375 setValue:0 forKey:v217];
                                }
                              }
                            }
                          }
                          uint64_t v201 = [(NSArray *)v373 countByEnumeratingWithState:&v412 objects:v427 count:16];
                        }
                        while (v201);
                      }
                      goto LABEL_221;
                    }
LABEL_216:
                    if (v420)
                    {
                      *(void *)(v49 + 40) = v420;
                    }
                    else
                    {
                      uint64_t v235 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
                      _NSCoreDataLog(17, v235, v236, v237, v238, v239, v240, v241, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m");
                      v242 = __pflogFaultLog;
                      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 136315394;
                        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitSerializer.m";
                        __int16 v429 = 1024;
                        LODWORD(v430) = 1519;
                        _os_log_fault_impl(&dword_18AB82000, v242, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
                      }
                    }
LABEL_220:
                    *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
                    id v243 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
                    goto LABEL_221;
                  }
                  uint64_t v45 = v364;
LABEL_155:
                  if (v53 == ++v55)
                  {
                    uint64_t v190 = [(NSArray *)v45 countByEnumeratingWithState:&v416 objects:v431 count:16];
                    uint64_t v53 = v190;
                    if (!v190)
                    {
                      uint64_t v49 = v355;
                      goto LABEL_184;
                    }
                    continue;
                  }
                  goto LABEL_69;
                }
                break;
              }
              if ([v56 attributeType] == 1100)
              {

                uint64_t v97 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v62];
                if (v97) {
                  goto LABEL_119;
                }
                v155 = (void *)MEMORY[0x18C127630]();
                uint64_t v156 = __ckLoggingOverride;
                uint64_t v157 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to initialize NSUUID from CKRecord with value: %@\n%@"];
                _NSCoreDataLog(v156 != 0, v157, v158, v159, v160, v161, v162, v163, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                goto LABEL_167;
              }
              if ([v56 attributeType] != 700 && objc_msgSend(v56, "attributeType") != 1200) {
                goto LABEL_143;
              }
              getCloudKitCKAssetClass();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if ([v56 attributeType] != 1200) {
                  goto LABEL_143;
                }

                uint64_t v97 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v62];
                if (v97)
                {
LABEL_119:
                  id v63 = (id)v97;
                  goto LABEL_143;
                }
                v155 = (void *)MEMORY[0x18C127630]();
                uint64_t v164 = __ckLoggingOverride;
                uint64_t v165 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to initialize NSURL from CKRecord with value: %@\n%@"];
                _NSCoreDataLog(v164 != 0, v165, v166, v167, v168, v169, v170, v171, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
LABEL_167:
                id v63 = 0;
                goto LABEL_143;
              }
              uint64_t v144 = [v369 cloudKitSerializer:v374 safeSaveURLForAsset:v62];
              if (!v144)
              {
                uint64_t v145 = [NSString stringWithUTF8String:"Delegate didn't return a file url for asset: %@"];
                _NSCoreDataLog(17, v145, v146, v147, v148, v149, v150, v151, (uint64_t)v62);
                uint64_t v152 = __pflogFaultLog;
                if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v62;
                  _os_log_fault_impl(&dword_18AB82000, v152, OS_LOG_TYPE_FAULT, "CoreData: Delegate didn't return a file url for asset: %@", buf, 0xCu);
                }
              }
              v153 = (void *)[[NSString alloc] initWithContentsOfURL:v144 encoding:4 error:&v420];
              if (v153)
              {
                if ([v56 attributeType] == 700)
                {

                  id v154 = v153;
                  goto LABEL_174;
                }
                if ([v56 attributeType] == 1200)
                {

                  id v154 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v153];
                  if (v154)
                  {
LABEL_174:
                    id v63 = v154;
                  }
                  else
                  {
                    v181 = (void *)MEMORY[0x18C127630]();
                    uint64_t v182 = __ckLoggingOverride;
                    uint64_t v183 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to initialize NSURL from CKAsset with value: %@\n%@"];
                    _NSCoreDataLog(v182 != 0, v183, v184, v185, v186, v187, v188, v189, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                    id v63 = 0;
                  }
                }
              }
              else
              {
                v172 = (void *)MEMORY[0x18C127630]();
                uint64_t v173 = __ckLoggingOverride;
                uint64_t v174 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to read value from asset at URL: %@\n%@"];
                _NSCoreDataLog(v173 != 0, v174, v175, v176, v177, v178, v179, v180, (uint64_t)"-[PFCloudKitSerializer updateAttributes:andRelationships:onManagedObject:fromRecord:withRecordMetadata:importContext:error:]");
                char v361 = 0;
              }

              goto LABEL_143;
            }
LABEL_221:
            if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
            {
              uint64_t v244 = *(void *)(v376 + 40);
              if (v244)
              {
                v245 = v371;
                if ([*(id *)(v244 + 24) useDeviceToDeviceEncryption]) {
                  v245 = (void *)[v371 encryptedValueStore];
                }
              }
              else
              {
                v245 = 0;
              }
              self;
              id v246 = (id)[v245 objectForKey:objc_msgSend(@"CD_", "stringByAppendingString:", @"moveReceipt"];
              if (v246)
              {
LABEL_226:
                if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24)
                  && ([(NSManagedObject *)v367 mergeMoveReceiptsWithData:v246 error:*(void *)(*(void *)(v376 + 88) + 8) + 40] & 1) == 0)
                {
                  *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
                  id v247 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
                }
              }
              else
              {
                self;
                v248 = (void *)[@"CD_" stringByAppendingString:@"moveReceipt"];
                self;
                uint64_t v249 = objc_msgSend(v371, "objectForKey:", objc_msgSend(v248, "stringByAppendingString:", @"_ckAsset"));
                if (v249)
                {
                  uint64_t v250 = [WeakRetained cloudKitSerializer:*(void *)(v376 + 40) safeSaveURLForAsset:v249];
                  id v246 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v250 options:0 error:*(void *)(*(void *)(v376 + 88) + 8) + 40];
                  if (v246) {
                    goto LABEL_226;
                  }
                  v251 = (void *)MEMORY[0x18C127630]();
                  uint64_t v252 = __ckLoggingOverride;
                  uint64_t v253 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Error attempting to read move receipt CKAsset file: %@"];
                  _NSCoreDataLog(v252 != 0, v253, v254, v255, v256, v257, v258, v259, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
                  *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
                  id v260 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
                }
                id v246 = 0;
              }
            }
          }
          else
          {
            uint64_t v19 = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 3) {
              uint64_t v20 = 3;
            }
            else {
              uint64_t v20 = __ckLoggingOverride;
            }
            uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping record because its entity '%@' is no longer in the managed object model's configured entities: %@\n%@"];
            [v360 allKeys];
            _NSCoreDataLog(v20, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
          }
LABEL_234:
          int v261 = *(unsigned __int8 *)(*(void *)(*(void *)(v376 + 96) + 8) + 24);
          if (!v261) {
            goto LABEL_241;
          }
          ++v366;
        }
        while (v366 != v359);
        uint64_t v264 = [(NSArray *)obj countByEnumeratingWithState:&v407 objects:v426 count:16];
        uint64_t v359 = v264;
      }
      while (v264);
    }
LABEL_241:
    if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
    {
      v265 = (void *)MEMORY[0x18C127630]();
      long long v405 = 0u;
      long long v406 = 0u;
      long long v403 = 0u;
      long long v404 = 0u;
      if (v354) {
        v266 = *(void **)(v370 + 24);
      }
      else {
        v266 = 0;
      }
      uint64_t v267 = [v266 countByEnumeratingWithState:&v403 objects:v425 count:16];
      if (v267)
      {
        uint64_t v268 = *(void *)v404;
        do
        {
          for (uint64_t j = 0; j != v267; ++j)
          {
            if (*(void *)v404 != v268) {
              objc_enumerationMutation(v266);
            }
            objc_msgSend(*(id *)(v376 + 32), "deleteObject:", objc_msgSend(*(id *)(v376 + 32), "objectWithID:", *(void *)(*((void *)&v403 + 1) + 8 * j)));
          }
          uint64_t v267 = [v266 countByEnumeratingWithState:&v403 objects:v425 count:16];
        }
        while (v267);
      }
      v270 = v370 ? *(void **)(v370 + 24) : 0;
      id v271 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, [v270 allObjects], *(void *)(v376 + 48), *(void **)(v376 + 32), (void *)(*(void *)(*(void *)(v376 + 88) + 8) + 40));
      v272 = v271;
      if (v271)
      {
        long long v401 = 0u;
        long long v402 = 0u;
        long long v399 = 0u;
        long long v400 = 0u;
        uint64_t v273 = [v271 countByEnumeratingWithState:&v399 objects:v424 count:16];
        if (v273)
        {
          uint64_t v274 = *(void *)v400;
          do
          {
            for (uint64_t k = 0; k != v273; ++k)
            {
              if (*(void *)v400 != v274) {
                objc_enumerationMutation(v272);
              }
              [*(id *)(v376 + 32) deleteObject:*(void *)(*((void *)&v399 + 1) + 8 * k)];
            }
            uint64_t v273 = [v272 countByEnumeratingWithState:&v399 objects:v424 count:16];
          }
          while (v273);
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
        id v314 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
      }
      if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
      {
        long long v397 = 0u;
        long long v398 = 0u;
        long long v395 = 0u;
        long long v396 = 0u;
        v315 = v370 ? *(void **)(v370 + 112) : 0;
        uint64_t v316 = [v315 countByEnumeratingWithState:&v395 objects:v423 count:16];
        if (v316)
        {
          uint64_t v317 = *(void *)v396;
          while (2)
          {
            for (uint64_t m = 0; m != v316; ++m)
            {
              if (*(void *)v396 != v317) {
                objc_enumerationMutation(v315);
              }
              v319 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, (void *)[*(id *)(*((void *)&v395 + 1) + 8 * m) zoneID], objc_msgSend(*(id *)(*(void *)(v376 + 40) + 24), "databaseScope"), *(void *)(v376 + 48), *(void **)(v376 + 32), *(void *)(*(void *)(v376 + 88) + 8) + 40);
              if (!v319)
              {
                *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
                id v320 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
                goto LABEL_263;
              }
              [(NSManagedObject *)v319 setEncodedShareData:0];
            }
            uint64_t v316 = [v315 countByEnumeratingWithState:&v395 objects:v423 count:16];
            if (v316) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  else
  {
    id v276 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
    *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
  }
LABEL_263:
  uint64_t v277 = *(void *)(v376 + 96);
  if (!*(unsigned char *)(*(void *)(v277 + 8) + 24)) {
    goto LABEL_270;
  }
  BOOL v278 = -[PFCloudKitImportZoneContext linkInsertedObjectsAndMetadataInContext:error:](v370, *(void **)(v376 + 32), (uint64_t *)(*(void *)(*(void *)(v376 + 88) + 8) + 40));
  uint64_t v279 = v376;
  *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = v278;
  if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
  {
    if ([*(id *)(v376 + 32) hasChanges]) {
      **(unsigned char **)(v376 + 104) = 1;
    }
    char v280 = [*(id *)(v376 + 32) save:*(void *)(*(void *)(v376 + 88) + 8) + 40];
    uint64_t v277 = *(void *)(v376 + 96);
    if (v280) {
      goto LABEL_270;
    }
    *(unsigned char *)(*(void *)(v277 + 8) + 24) = 0;
    uint64_t v279 = v376;
  }
  id v281 = *(id *)(*(void *)(*(void *)(v279 + 88) + 8) + 40);
  uint64_t v277 = *(void *)(v376 + 96);
LABEL_270:
  if (*(unsigned char *)(*(void *)(v277 + 8) + 24))
  {
    v282 = v370 ? *(void **)(v370 + 48) : 0;
    v394[0] = MEMORY[0x1E4F143A8];
    v394[1] = 3221225472;
    v394[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2_75;
    v394[3] = &unk_1E544E818;
    uint64_t v283 = *(void *)(v376 + 32);
    uint64_t v284 = *(void *)(v376 + 40);
    v394[4] = v370;
    v394[5] = v283;
    v394[6] = WeakRetained;
    v394[7] = v284;
    [v282 enumerateObjectsUsingBlock:v394];
    if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
    {
      if (!-[PFCloudKitImportZoneContext populateUnresolvedIDsInStore:withManagedObjectContext:error:](v370, *(void *)(v376 + 48), *(void **)(v376 + 32), (void *)(*(void *)(*(void *)(v376 + 88) + 8) + 40)))goto LABEL_354; {
      if (v370)
      }
        id v285 = (id)[*(id *)(v370 + 40) copy];
      else {
        id v285 = 0;
      }
      v388[0] = MEMORY[0x1E4F143A8];
      v388[1] = 3221225472;
      v388[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_3;
      v388[3] = &unk_1E544E840;
      long long v389 = *(_OWORD *)(v376 + 40);
      uint64_t v286 = *(void *)(v376 + 32);
      int8x16_t v393 = vextq_s8(*(int8x16_t *)(v376 + 88), *(int8x16_t *)(v376 + 88), 8uLL);
      uint64_t v390 = v286;
      uint64_t v391 = v370;
      id v392 = WeakRetained;
      [v285 enumerateObjectsUsingBlock:v388];
      if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
      {
        if ([*(id *)(v376 + 32) hasChanges])
        {
          **(unsigned char **)(v376 + 104) = 1;
          if (([*(id *)(v376 + 32) save:*(void *)(*(void *)(v376 + 88) + 8) + 40] & 1) == 0)
          {
            *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
            id v287 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
          }
        }
      }
      if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
      {
        v288 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKImportPendingRelationship entityPath]());
        [(NSFetchRequest *)v288 setFetchBatchSize:200];
        [(NSFetchRequest *)v288 setReturnsObjectsAsFaults:0];
        v289 = *(void **)(v376 + 32);
        v385[0] = MEMORY[0x1E4F143A8];
        v385[1] = 3221225472;
        v385[2] = __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_89;
        v385[3] = &unk_1E544E868;
        v385[4] = v289;
        v385[5] = v370;
        uint64_t v290 = *(void *)(v376 + 48);
        int8x16_t v386 = vextq_s8(*(int8x16_t *)(v376 + 88), *(int8x16_t *)(v376 + 88), 8uLL);
        v385[6] = v290;
        v385[7] = v356;
        uint64_t v387 = *(void *)(v376 + 104);
        +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v288, v289, (uint64_t)v385);
        if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
        {
          v291 = (void *)+[NSCKMirroredRelationship fetchPendingMirroredRelationshipsInStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, *(void *)(v376 + 48), *(void **)(v376 + 32), (void *)(*(void *)(*(void *)(v376 + 88) + 8) + 40));
          v292 = v291;
          if (v291)
          {
            long long v383 = 0u;
            long long v384 = 0u;
            long long v381 = 0u;
            long long v382 = 0u;
            uint64_t v293 = [v291 countByEnumeratingWithState:&v381 objects:v422 count:16];
            if (v293)
            {
              uint64_t v294 = *(void *)v382;
              do
              {
                uint64_t v295 = 0;
                do
                {
                  if (*(void *)v382 != v294) {
                    objc_enumerationMutation(v292);
                  }
                  v296 = *(void **)(*((void *)&v381 + 1) + 8 * v295);
                  v297 = -[NSCKMirroredRelationship createRecordIDForRecord](v296);
                  v298 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v296);
                  uint64_t v299 = [v296 cdEntityName];
                  if (v370) {
                    uint64_t v300 = objc_msgSend((id)objc_msgSend(*(id *)(v370 + 64), "objectForKey:", v299), "objectForKey:", v297);
                  }
                  else {
                    uint64_t v300 = 0;
                  }
                  uint64_t v301 = [v296 relatedEntityName];
                  if (v370) {
                    uint64_t v302 = objc_msgSend((id)objc_msgSend(*(id *)(v370 + 64), "objectForKey:", v301), "objectForKey:", v298);
                  }
                  else {
                    uint64_t v302 = 0;
                  }

                  if (v300 && v302)
                  {
                    *(void *)buf = 0;
                    if (-[NSCKMirroredRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:isDelete:error:]((BOOL)v296, v370, *(void **)(v376 + 32), objc_msgSend((id)objc_msgSend(v296, "needsDelete"), "BOOLValue"), (uint64_t *)buf))
                    {
                      goto LABEL_296;
                    }
                    v303 = (void *)MEMORY[0x18C127630]();
                    unint64_t v304 = __ckLoggingOverride;
                    uint64_t v305 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to resolve pending relationship: %@\n%@"];
                    if (v304 >= 9) {
                      uint64_t v312 = 9;
                    }
                    else {
                      uint64_t v312 = v304;
                    }
                    _NSCoreDataLog(v312, v305, v306, v307, v308, v309, v310, v311, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
                  }
                  else if (objc_msgSend((id)objc_msgSend(v296, "needsDelete"), "BOOLValue"))
                  {
LABEL_296:
                    [v296 setIsPending:MEMORY[0x1E4F1CC28]];
                  }
                  ++v295;
                }
                while (v293 != v295);
                uint64_t v313 = [v292 countByEnumeratingWithState:&v381 objects:v422 count:16];
                uint64_t v293 = v313;
              }
              while (v313);
            }
          }
          else
          {
            *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
            id v321 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
          }
        }
      }
      if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
      {
        long long v379 = 0u;
        long long v380 = 0u;
        long long v377 = 0u;
        long long v378 = 0u;
        v322 = v370 ? *(void **)(v370 + 48) : 0;
        uint64_t v323 = [v322 countByEnumeratingWithState:&v377 objects:v421 count:16];
        if (v323)
        {
          uint64_t v324 = *(void *)v378;
          uint64_t v325 = *MEMORY[0x1E4F281F8];
          uint64_t v326 = MEMORY[0x1E4F1CC38];
          do
          {
            for (uint64_t n = 0; n != v323; ++n)
            {
              if (*(void *)v378 != v324) {
                objc_enumerationMutation(v322);
              }
              uint64_t v328 = *(void *)(*((void *)&v377 + 1) + 8 * n);
              v329 = +[NSCKMirroredRelationship mirroredRelationshipForManyToMany:inStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, v328, *(void *)(v376 + 48), *(void **)(v376 + 32), *(void *)(*(void *)(v376 + 88) + 8) + 40);
              v330 = v329;
              if (v329)
              {
                [v329 setNeedsDelete:v326];
                *(void *)buf = 0;
                if (!-[NSCKMirroredRelationship updateRelationshipValueUsingImportContext:andManagedObjectContext:isDelete:error:]((BOOL)v330, v370, *(void **)(v376 + 32), 1, (uint64_t *)buf))
                {
                  if (objc_msgSend((id)objc_msgSend(*(id *)buf, "domain"), "isEqualToString:", v325)
                    && ([*(id *)buf code] == 134412 || objc_msgSend(*(id *)buf, "code") == 134413))
                  {
                    v331 = (void *)MEMORY[0x18C127630]();
                    unint64_t v332 = __ckLoggingOverride;
                    uint64_t v333 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Marking deleted mirrored relationship fulfilled, one or more of the related objects is missing: %@"];
                    if (v332 >= 9) {
                      uint64_t v340 = 9;
                    }
                    else {
                      uint64_t v340 = v332;
                    }
                    _NSCoreDataLog(v340, v333, v334, v335, v336, v337, v338, v339, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
                    [v330 setNeedsDelete:v326];
                    [v330 setIsPending:MEMORY[0x1E4F1CC28]];
                  }
                  else
                  {
                    [v330 setIsPending:v326];
                    v342 = (void *)MEMORY[0x18C127630]([WeakRetained cloudKitSerializer:*(void *)(v376 + 40) failedToUpdateRelationship:v328 withError:*(void *)buf]);
                    unint64_t v343 = __ckLoggingOverride;
                    uint64_t v344 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to update deleted mirrored relationship: %@\n%@"];
                    if (v343 >= 0x10) {
                      uint64_t v351 = 16;
                    }
                    else {
                      uint64_t v351 = v343;
                    }
                    _NSCoreDataLog(v351, v344, v345, v346, v347, v348, v349, v350, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
                  }
                }
              }
              else if (*(void *)(*(void *)(*(void *)(v376 + 88) + 8) + 40))
              {
                *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
                id v341 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
              }
            }
            uint64_t v323 = [v322 countByEnumeratingWithState:&v377 objects:v421 count:16];
          }
          while (v323);
        }
      }
      if (*(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24))
      {
        v352 = v370 ? *(void **)(v370 + 56) : 0;
        if ((+[NSCKMirroredRelationship purgeMirroredRelationshipsWithRecordIDs:fromStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, (void *)[v352 allObjects], *(void *)(v376 + 48), *(void **)(v376 + 32), (void *)(*(void *)(*(void *)(v376 + 88) + 8) + 40)) & 1) == 0)
        {
LABEL_354:
          *(unsigned char *)(*(void *)(*(void *)(v376 + 96) + 8) + 24) = 0;
          id v353 = *(id *)(*(void *)(*(void *)(v376 + 88) + 8) + 40);
        }
      }
    }
  }
}

uint64_t __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 name];

  return [v3 setObject:a2 forKey:v4];
}

void __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_2_75(uint64_t a1, void *a2)
{
  id v22 = 0;
  if (([a2 updateRelationshipValueUsingImportContext:*(void *)(a1 + 32) andManagedObjectContext:*(void *)(a1 + 40) error:&v22] & 1) == 0)
  {
    uint64_t v4 = (void *)[v22 domain];
    if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]]
      && ([v22 code] == 134412 || objc_msgSend(v22, "code") == 134413))
    {
      int v5 = (void *)MEMORY[0x18C127630]();
      if ((unint64_t)__ckLoggingOverride >= 0x10) {
        uint64_t v6 = 16;
      }
      else {
        uint64_t v6 = __ckLoggingOverride;
      }
      uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Deleted relationship failed to update because one or more of the objects in it is already gone: %@"];
      _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
    }
    else
    {
      int v5 = (void *)MEMORY[0x18C127630]([*(id *)(a1 + 48) cloudKitSerializer:*(void *)(a1 + 56) failedToUpdateRelationship:a2 withError:v22]);
      if ((unint64_t)__ckLoggingOverride >= 0x10) {
        uint64_t v14 = 16;
      }
      else {
        uint64_t v14 = __ckLoggingOverride;
      }
      uint64_t v15 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to update deleted mirrored relationship: %@\n%@"];
      _NSCoreDataLog(v14, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_2");
    }
  }
}

uint64_t __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v42 = 0;
  uint64_t v4 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 9) {
    uint64_t v5 = 9;
  }
  else {
    uint64_t v5 = __ckLoggingOverride;
  }
  uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Updating relationship: %@"];
  _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke_3");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a2)
    {
      uint64_t v13 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, [*(id *)(a2 + 48) recordName], objc_msgSend(*(id *)(a2 + 56), "recordName"), *(void *)(a2 + 16), *(void *)(a2 + 24));
      uint64_t v14 = *(void **)(a2 + 32);
    }
    else
    {
      uint64_t v13 = +[PFCloudKitSerializer mtmKeyForObjectWithRecordName:relatedToObjectWithRecordName:byRelationship:withInverse:]((uint64_t)PFCloudKitSerializer, [0 recordName], objc_msgSend(0, "recordName"), 0, 0);
      uint64_t v14 = 0;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 48);
    uint64_t v16 = [v14 zoneID];
    if (!v15
      || (uint64_t v17 = (NSManagedObject *)objc_msgSend((id)objc_msgSend(*(id *)(v15 + 32), "objectForKey:", v16), "objectForKey:", v13)) == 0)
    {
      uint64_t v23 = (NSManagedObject *)+[NSCKMirroredRelationship mirroredRelationshipForManyToMany:inStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, a2, *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v42);
      uint64_t v24 = v42;
      if (v42)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        uint64_t result = v24;
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = result;
        return result;
      }
      uint64_t v17 = v23;
      if (!v23)
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 48);
        if (a2) {
          uint64_t v26 = *(void **)(a2 + 48);
        }
        else {
          uint64_t v26 = 0;
        }
        uint64_t v27 = [v26 zoneID];
        if (!v25 || (uint64_t v28 = [*(id *)(v25 + 8) objectForKey:v27]) == 0)
        {
          if (a2) {
            id v29 = *(void **)(a2 + 48);
          }
          else {
            id v29 = 0;
          }
          uint64_t v30 = (void *)[v29 zoneID];
          uint64_t v31 = *(void *)(a1 + 56);
          if (v31) {
            uint64_t v32 = *(void **)(v31 + 96);
          }
          else {
            uint64_t v32 = 0;
          }
          uint64_t v33 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v30, [v32 databaseScope], *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)&v42);
          if (v33)
          {
            uint64_t v28 = (uint64_t)v33;
            -[PFCloudKitMetadataCache cacheZoneMetadata:](*(void *)(*(void *)(a1 + 32) + 48), v33);
          }
          else
          {
            uint64_t v34 = [NSString stringWithUTF8String:"Need to handle fetch errors here for the zone and abort serialization. %@"];
            _NSCoreDataLog(17, v34, v35, v36, v37, v38, v39, v40, (uint64_t)v42);
            uint64_t v41 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v44 = (uint64_t)v42;
              _os_log_fault_impl(&dword_18AB82000, v41, OS_LOG_TYPE_FAULT, "CoreData: Need to handle fetch errors here for the zone and abort serialization. %@", buf, 0xCu);
            }
            uint64_t v28 = 0;
          }
        }
        uint64_t v17 = +[NSCKMirroredRelationship insertMirroredRelationshipForManyToMany:inZoneWithMetadata:inStore:withManagedObjectContext:]((uint64_t)NSCKMirroredRelationship, a2, v28, *(void *)(a1 + 40), *(void **)(a1 + 48));
      }
    }
    if ([(id)a2 updateRelationshipValueUsingImportContext:*(void *)(a1 + 56) andManagedObjectContext:*(void *)(a1 + 48) error:&v42])
    {
      uint64_t v18 = MEMORY[0x1E4F1CC28];
      [(NSManagedObject *)v17 setIsPending:MEMORY[0x1E4F1CC28]];
      [(NSManagedObject *)v17 setNeedsDelete:v18];
      uint64_t v19 = MEMORY[0x1E4F1CC38];
      uint64_t v20 = v17;
    }
    else
    {
      uint64_t v22 = MEMORY[0x1E4F1CC38];
      [(NSManagedObject *)v17 setIsPending:MEMORY[0x1E4F1CC38]];
      [(NSManagedObject *)v17 setNeedsDelete:MEMORY[0x1E4F1CC28]];
      uint64_t v20 = v17;
      uint64_t v19 = v22;
    }
    return [(NSManagedObject *)v20 setIsUploaded:v19];
  }
  else
  {
    uint64_t result = [(id)a2 updateRelationshipValueUsingImportContext:*(void *)(a1 + 56) andManagedObjectContext:*(void *)(a1 + 48) error:&v42];
    if ((result & 1) == 0) {
      return [*(id *)(a1 + 64) cloudKitSerializer:*(void *)(a1 + 32) failedToUpdateRelationship:a2 withError:v42];
    }
  }
  return result;
}

uint64_t __150__PFCloudKitSerializer_applyUpdatedRecords_deletedRecordIDs_toStore_inManagedObjectContext_onlyUpdatingAttributes_andRelationships_madeChanges_error___block_invoke_89(uint64_t a1, void *a2, void *a3, unsigned char *a4, unsigned char *a5)
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = result;
    return result;
  }
  uint64_t v6 = a2;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v126 objects:v138 count:16];
  if (!v7) {
    goto LABEL_83;
  }
  uint64_t v8 = v7;
  uint64_t v113 = *(void *)v127;
  uint64_t v109 = *MEMORY[0x1E4F281F8];
  char v110 = v6;
  do
  {
    uint64_t v9 = 0;
    uint64_t v111 = v8;
    do
    {
      if (*(void *)v127 != v113) {
        objc_enumerationMutation(v6);
      }
      uint64_t v115 = v9;
      uint64_t v10 = *(void **)(*((void *)&v126 + 1) + 8 * v9);
      context = (void *)MEMORY[0x18C127630]();
      uint64_t v114 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", objc_msgSend(v10, "cdEntityName")), "relationshipsByName"), "objectForKey:", objc_msgSend(v10, "relationshipName"));
      uint64_t v11 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(v10, "recordZoneName"), objc_msgSend(v10, "recordZoneOwnerName"));
      uint64_t v12 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v10, "recordName"), v11);
      uint64_t v13 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]()), "initWithZoneName:ownerName:", objc_msgSend(v10, "relatedRecordZoneName"), objc_msgSend(v10, "relatedRecordZoneOwnerName"));
      id v120 = objc_msgSend(objc_alloc((Class)getCloudKitCKRecordIDClass[0]()), "initWithRecordName:zoneID:", objc_msgSend(v10, "relatedRecordName"), v13);
      uint64_t v117 = (void *)v13;
      if (([v11 isEqual:v13] & 1) == 0)
      {
        uint64_t v14 = [NSString stringWithUTF8String:"Import is attempting to link objects across zones: %@"];
        _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, (uint64_t)v10);
        uint64_t v21 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Import is attempting to link objects across zones: %@", buf, 0xCu);
        }
      }
      uint64_t v118 = v11;
      uint64_t v22 = a1;
      uint64_t v23 = *(void *)(a1 + 40);
      uint64_t v119 = v10;
      uint64_t v24 = [v10 cdEntityName];
      if (v23) {
        uint64_t v25 = objc_msgSend((id)objc_msgSend(*(id *)(v23 + 64), "objectForKey:", v24), "objectForKey:", v12);
      }
      else {
        uint64_t v25 = 0;
      }
      uint64_t v26 = *(void *)(a1 + 40);
      uint64_t v27 = [v119 relatedEntityName];
      if (v26)
      {
        uint64_t v28 = objc_msgSend((id)objc_msgSend(*(id *)(v26 + 64), "objectForKey:", v27), "objectForKey:", v120);
        id v29 = (void *)v28;
        if (v25 && v28) {
          goto LABEL_41;
        }
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v31 = v30;
        if (v25)
        {
          if (v29) {
            goto LABEL_20;
          }
        }
        else
        {
          [v30 addObject:v12];
          if (v29) {
            goto LABEL_20;
          }
        }
      }
      else
      {
        id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (v25)
        {
          uint64_t v22 = a1;
          uint64_t v31 = v95;
        }
        else
        {
          uint64_t v31 = v95;
          [v95 addObject:v12];
          uint64_t v22 = a1;
        }
      }
      [v31 addObject:v120];
      id v29 = 0;
LABEL_20:
      id v125 = 0;
      uint64_t v112 = v31;
      id v32 = +[NSCKRecordMetadata metadataForRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, v31, *(void **)(v22 + 48), *(void **)(v22 + 32), &v125);
      if (!v32)
      {
        uint64_t v98 = (void *)MEMORY[0x18C127630]();
        BOOL v99 = __ckLoggingOverride != 0;
        uint64_t v100 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Pending relationship Fallback fetch failed (%@ / %@): %@"];
        _NSCoreDataLog(v99, v100, v101, v102, v103, v104, v105, v106, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = v125;
        *a4 = 1;

        goto LABEL_83;
      }
      uint64_t v33 = v32;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      uint64_t v34 = [v32 countByEnumeratingWithState:&v121 objects:v137 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v122;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v122 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void **)(*((void *)&v121 + 1) + 8 * i);
            uint64_t v39 = (void *)-[NSCKRecordMetadata createRecordID](v38);
            if ([v39 isEqual:v12])
            {
              uint64_t v25 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v38);
              uint64_t v40 = *(void *)(a1 + 40);
              if (v40) {
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](v40, v25, *(void **)(v40 + 64), (uint64_t)v39);
              }
            }
            else if ([v39 isEqual:v120])
            {
              id v29 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v38);
              uint64_t v41 = *(void *)(a1 + 40);
              if (v41) {
                -[PFCloudKitImportZoneContext addObjectID:toCache:andRecordID:](v41, v29, *(void **)(v41 + 64), (uint64_t)v39);
              }
            }
            else
            {
              uint64_t v42 = [NSString stringWithUTF8String:"Unknown recordID returned as part of fetch for missing pending relationship objectIDs: %@ - %@ - %@"];
              _NSCoreDataLog(17, v42, v43, v44, v45, v46, v47, v48, (uint64_t)v39);
              uint64_t v49 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v39;
                __int16 v133 = 2112;
                long long v134 = v33;
                __int16 v135 = 2112;
                uint64_t v136 = v119;
                _os_log_fault_impl(&dword_18AB82000, v49, OS_LOG_TYPE_FAULT, "CoreData: Unknown recordID returned as part of fetch for missing pending relationship objectIDs: %@ - %@ - %@", buf, 0x20u);
              }
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v121 objects:v137 count:16];
        }
        while (v35);

        uint64_t v6 = v110;
        uint64_t v8 = v111;
      }
      else
      {
      }
      uint64_t v22 = a1;
      if (!v25)
      {
LABEL_46:
        uint64_t v55 = (void *)MEMORY[0x18C127630]();
        if ((unint64_t)__ckLoggingOverride >= 9) {
          uint64_t v56 = 9;
        }
        else {
          uint64_t v56 = __ckLoggingOverride;
        }
        uint64_t v57 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to find matching objectIDs for %@ / %@ in pending relationship: %@"];
        [v119 objectID];
        _NSCoreDataLog(v56, v57, v58, v59, v60, v61, v62, v63, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");

        uint64_t v65 = v115;
        id v64 = context;
        goto LABEL_73;
      }
LABEL_41:
      if (!v29) {
        goto LABEL_46;
      }
      if ([v114 isToMany]
        && objc_msgSend((id)objc_msgSend(v114, "inverseRelationship"), "isToMany"))
      {
        v131[0] = [v119 recordName];
        v131[1] = [v119 relatedRecordName];
        uint64_t v50 = +[PFMirroredManyToManyRelationship ckRecordNameForOrderedRecordNames:]((uint64_t)PFMirroredManyToManyRelationship, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2]);
        v130[0] = v114;
        v130[1] = [v114 inverseRelationship];
        uint64_t v51 = +[PFMirroredManyToManyRelationship ckRecordTypeForOrderedRelationships:]((uint64_t)PFMirroredManyToManyRelationship, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2]);
        id v52 = v118;
        uint64_t v53 = (void *)[objc_alloc((Class)getCloudKitCKRecordIDClass[0]()) initWithRecordName:v50 zoneID:v118];
        if ([v119 needsDelete]) {
          uint64_t v54 = +[PFMirroredRelationship mirroredRelationshipWithDeletedRecordType:recordID:andManagedObjectModel:]((uint64_t)PFMirroredRelationship, v51, (uint64_t)v53, *(void *)(a1 + 56));
        }
        else {
          uint64_t v54 = [[PFMirroredManyToManyRelationship alloc] initWithRecordID:v53 recordType:v51 managedObjectModel:*(void *)(a1 + 56) andType:0];
        }
        uint64_t v67 = (PFMirroredOneToManyRelationship *)v54;

        uint64_t v6 = v110;
        uint64_t v8 = v111;
        uint64_t v22 = a1;
      }
      else
      {
        *(void *)buf = 0;
        uint64_t v66 = [*(id *)(v22 + 32) existingObjectWithID:v25 error:buf];
        if (v66)
        {
          uint64_t v67 = +[PFMirroredRelationship mirroredRelationshipWithManagedObject:withRecordID:relatedToObjectWithRecordID:byRelationship:]((uint64_t)PFMirroredRelationship, v66, (uint64_t)v12, (uint64_t)v120, (uint64_t)v114);
        }
        else
        {
          if (objc_msgSend((id)objc_msgSend(*(id *)buf, "domain"), "isEqualToString:", v109)
            && [*(id *)buf code] == 133000)
          {
            char v68 = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 3) {
              uint64_t v69 = 3;
            }
            else {
              uint64_t v69 = __ckLoggingOverride;
            }
            uint64_t v70 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping pending relationship because it's destination object has gone missing: %@\n%@"];
            _NSCoreDataLog(v69, v70, v71, v72, v73, v74, v75, v76, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");

            id v120 = 0;
            uint64_t v12 = 0;
          }
          else
          {
            uint64_t v77 = (void *)MEMORY[0x18C127630]();
            if ((unint64_t)__ckLoggingOverride >= 3) {
              uint64_t v78 = 3;
            }
            else {
              uint64_t v78 = __ckLoggingOverride;
            }
            uint64_t v79 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Skipping pending relationship because existingObjectWithID failed: %@\n%@"];
            _NSCoreDataLog(v78, v79, v80, v81, v82, v83, v84, v85, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
          }
          uint64_t v67 = 0;
          uint64_t v22 = a1;
        }
        id v52 = v118;
      }
      *(void *)buf = 0;
      if ([(PFMirroredOneToManyRelationship *)v67 updateRelationshipValueUsingImportContext:*(void *)(v22 + 40) andManagedObjectContext:*(void *)(v22 + 32) error:buf])
      {
        [*(id *)(v22 + 32) deleteObject:v119];
      }
      else
      {
        uint64_t v86 = (void *)MEMORY[0x18C127630]();
        if ((unint64_t)__ckLoggingOverride >= 9) {
          uint64_t v87 = 9;
        }
        else {
          uint64_t v87 = __ckLoggingOverride;
        }
        uint64_t v88 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to resolve pending relationship: %@\n%@"];
        _NSCoreDataLog(v87, v88, v89, v90, v91, v92, v93, v94, (uint64_t)"-[PFCloudKitSerializer applyUpdatedRecords:deletedRecordIDs:toStore:inManagedObjectContext:onlyUpdatingAttributes:andRelationships:madeChanges:error:]_block_invoke");
      }
      uint64_t v65 = v115;
      id v64 = context;

LABEL_73:
      uint64_t v9 = v65 + 1;
    }
    while (v9 != v8);
    uint64_t v96 = [v6 countByEnumeratingWithState:&v126 objects:v138 count:16];
    uint64_t v8 = v96;
  }
  while (v96);
LABEL_83:
  if ([*(id *)(a1 + 32) hasChanges])
  {
    **(unsigned char **)(a1 + 80) = 1;
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deletedObjects"), "count")) {
      *a5 = 1;
    }
  }
  uint64_t result = [*(id *)(a1 + 32) save:*(void *)(*(void *)(a1 + 72) + 8) + 40];
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    return (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  return result;
}

+ (uint64_t)isPrivateAttribute:(uint64_t)a1
{
  self;
  if (objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", @"ckRecordSystemFields")) {
    return 1;
  }
  uint64_t v4 = (void *)[a2 name];

  return [v4 isEqualToString:@"ckRecordID"];
}

+ (uint64_t)assetStorageDirectoryURLForStore:(uint64_t)a1
{
  self;
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, (void *)[a2 URL]))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v4 = -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", [a2 identifier]), "stringByAppendingPathComponent:", @"inMemory_store_ckAssets");
    return [v3 fileURLWithPath:v4];
  }
  else
  {
    uint64_t v6 = (void *)[a2 URL];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "lastPathComponent"), "stringByDeletingPathExtension");
    uint64_t v8 = (void *)[v6 URLByDeletingLastPathComponent];
    uint64_t v9 = [NSString stringWithFormat:@"%@_ckAssets", v7];
    return [v8 URLByAppendingPathComponent:v9];
  }
}

+ (uint64_t)oldAssetStorageDirectoryURLForStore:(uint64_t)a1
{
  self;
  if (+[_PFRoutines _isInMemoryStoreURL:]((uint64_t)_PFRoutines, (void *)[a2 URL]))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v4 = -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", [a2 identifier]), "stringByAppendingPathComponent:", @"ckAssetFiles");
    return [v3 fileURLWithPath:v4];
  }
  else
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "URL"), "URLByDeletingLastPathComponent");
    return [v6 URLByAppendingPathComponent:@"ckAssetFiles" isDirectory:1];
  }
}

+ (uint64_t)isMirroredRelationshipRecordType:(uint64_t)a1
{
  self;
  if ([a2 hasPrefix:@"CD_M2M_"]) {
    return 1;
  }

  return [a2 isEqualToString:@"CDMR"];
}

+ (id)assetsOnRecord:(uint64_t)a1 withOptions:(void *)a2
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = (void *)[a2 allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 hasSuffix:@"_ckAsset"])
        {
          uint64_t v10 = [a2 objectForKey:v9];
          if (v10) {
            [v3 addObject:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  uint64_t v11 = (void *)[v3 copy];

  return v11;
}

+ (uint64_t)estimateByteSizeOfRecordID:(uint64_t)a1
{
  self;
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "zoneID"), "zoneName"), "length");
  return v3 + objc_msgSend((id)objc_msgSend(a2, "recordName"), "length") + 24;
}

+ (id)newSetOfRecordKeysForEntitiesInConfiguration:(void *)a3 inManagedObjectModel:(int)a4 includeCKAssetsForFileBackedFutures:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  self;
  unint64_t v7 = 0x1E4F1C000uLL;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)[a3 entitiesForConfiguration:a2];
  uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v35)
  {
    uint64_t v32 = *(void *)v39;
    int v33 = a4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v8;
        uint64_t v9 = *(void **)(*((void *)&v38 + 1) + 8 * v8);
        context = (void *)MEMORY[0x18C127630]();
        self;
        id v10 = objc_alloc_init(*(Class *)(v7 + 2688));
        self;
        [v10 addObject:objc_msgSend(@"CD_", "stringByAppendingString:", @"entityName"];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v9, "attributesByName"), "allValues");
        uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v47;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v47 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
              uint64_t v17 = (void *)MEMORY[0x18C127630]();
              id v18 = +[PFCloudKitSerializer newSetOfRecordKeysForAttribute:includeCKAssetsForFileBackedFutures:]((uint64_t)PFCloudKitSerializer, v16, a4);
              [v10 unionSet:v18];

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
          }
          while (v13);
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v19 = objc_msgSend((id)objc_msgSend(v9, "relationshipsByName"), "allValues");
        uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
        unint64_t v7 = 0x1E4F1C000uLL;
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v43;
          do
          {
            uint64_t v23 = 0;
            do
            {
              if (*(void *)v43 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v42 + 1) + 8 * v23);
              uint64_t v25 = (void *)MEMORY[0x18C127630]();
              self;
              id v26 = objc_alloc_init(*(Class *)(v7 + 2688));
              if ([v24 isToMany])
              {
                if (!objc_msgSend((id)objc_msgSend(v24, "inverseRelationship"), "isToMany")) {
                  goto LABEL_24;
                }
                [v26 addObject:@"CD_recordNames"];
                [v26 addObject:@"CD_relationships"];
                uint64_t v27 = v26;
                uint64_t v28 = @"CD_entityNames";
              }
              else
              {
                self;
                if (!+[PFCloudKitSerializer shouldTrackProperty:]((uint64_t)PFCloudKitSerializer, v24)) {
                  goto LABEL_24;
                }
                uint64_t v29 = [v24 name];
                unint64_t v7 = 0x1E4F1C000;
                self;
                uint64_t v28 = (__CFString *)[@"CD_" stringByAppendingString:v29];
                uint64_t v27 = v26;
              }
              [v27 addObject:v28];
LABEL_24:
              [v10 unionSet:v26];

              ++v23;
            }
            while (v21 != v23);
            uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v21);
        }
        self;
        [v10 addObject:objc_msgSend(@"CD_", "stringByAppendingString:", @"moveReceipt"];
        [v34 unionSet:v10];

        uint64_t v8 = v37 + 1;
        a4 = v33;
      }
      while (v37 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v35);
  }
  return v34;
}

+ (id)newSetOfRecordKeysForAttribute:(int)a3 includeCKAssetsForFileBackedFutures:
{
  self;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (+[PFCloudKitSerializer shouldTrackAttribute:]((uint64_t)PFCloudKitSerializer, a2))
  {
    uint64_t v6 = [a2 name];
    self;
    [v5 addObject:objc_msgSend(@"CD_", "stringByAppendingString:", v6)];
    if (+[PFCloudKitSerializer isVariableLengthAttributeType:]((uint64_t)PFCloudKitSerializer, [a2 attributeType]))
    {
      if (![a2 isFileBackedFuture] || a3)
      {
        uint64_t v7 = [a2 name];
        self;
        uint64_t v8 = (void *)[@"CD_" stringByAppendingString:v7];
        self;
        objc_msgSend(v5, "addObject:", objc_msgSend(v8, "stringByAppendingString:", @"_ckAsset"));
      }
    }
  }
  return v5;
}

+ (BOOL)shouldTrackProperty:(uint64_t)a1
{
  return ([a2 isTransient] & 1) == 0
      && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", @"NSCloudKitMirroringDelegateIgnoredPropertyKey"), "BOOLValue");
}

uint64_t __111__PFCloudKitSerializer_mtmKeyForObjectWithRecordName_relatedToObjectWithRecordName_byRelationship_withInverse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 entity];
  if (v5)
  {
    if ((*(unsigned char *)(v5 + 120) & 4) != 0)
    {
      uint64_t v6 = *(void **)(v5 + 72);
    }
    else
    {
      do
      {
        uint64_t v6 = (void *)v5;
        uint64_t v5 = [(id)v5 superentity];
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = (void *)[v6 name];
  uint64_t v8 = [a3 entity];
  if (v8)
  {
    if ((*(unsigned char *)(v8 + 120) & 4) != 0)
    {
      uint64_t v9 = *(void **)(v8 + 72);
    }
    else
    {
      do
      {
        uint64_t v9 = (void *)v8;
        uint64_t v8 = [(id)v8 superentity];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t result = objc_msgSend(v7, "compare:options:", objc_msgSend(v9, "name"), 1);
  if (!result)
  {
    uint64_t v11 = (void *)[a2 name];
    uint64_t v12 = [a3 name];
    return [v11 compare:v12 options:1];
  }
  return result;
}

+ (id)createSetOfObjectIDsRelatedToObject:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  self;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", a2, 0);
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", objc_msgSend(a2, "objectID"), 0);
  do
  {
    id v6 = (id)[v4 objectAtIndex:0];
    [v4 removeObjectAtIndex:0];
    context = (void *)MEMORY[0x18C127630](objc_msgSend(v3, "addObject:", objc_msgSend(v6, "objectID")));
    uint64_t v24 = v6;
    uint64_t v7 = (void *)[v6 entity];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v23 = v7;
    id obj = (id)[v7 relationshipsByName];
    uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v25)
    {
      uint64_t v22 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          id v10 = (void *)MEMORY[0x18C127630]();
          int v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "relationshipsByName"), "objectForKey:", v9), "isToMany");
          uint64_t v12 = (void *)[v24 valueForKey:v9];
          uint64_t v13 = v12;
          if (v11)
          {
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v27;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  id v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                  if ((objc_msgSend(v3, "containsObject:", objc_msgSend(v18, "objectID")) & 1) == 0
                    && (objc_msgSend(v5, "containsObject:", objc_msgSend(v18, "objectID")) & 1) == 0)
                  {
                    [v4 addObject:v18];
                    objc_msgSend(v5, "addObject:", objc_msgSend(v18, "objectID"));
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v15);
            }
          }
          else if (v12 {
                 && (objc_msgSend(v3, "containsObject:", objc_msgSend(v12, "objectID")) & 1) == 0
          }
                 && (objc_msgSend(v5, "containsObject:", objc_msgSend(v13, "objectID")) & 1) == 0)
          {
            [v4 addObject:v13];
            objc_msgSend(v5, "addObject:", objc_msgSend(v13, "objectID"));
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v25);
    }
    objc_msgSend((id)objc_msgSend(v24, "managedObjectContext"), "refreshObject:mergeChanges:", v24, objc_msgSend(v24, "hasChanges"));
  }
  while ([v4 count]);

  return v3;
}

+ (id)defaultRecordZoneIDForDatabaseScope:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_83 != -1) {
    dispatch_once(&_MergedGlobals_83, &__block_literal_global_191);
  }
  if (a3 == 1)
  {
    uint64_t v4 = (void *)qword_1EB270788;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    uint64_t v4 = (void *)qword_1EB270780;
LABEL_7:
    return v4;
  }
  uint64_t v6 = [NSString stringWithUTF8String:"Unable to provide a default CKRecordZoneID for database scope: %@"];
  uint64_t v7 = softLinkCKDatabaseScopeString(a3);
  _NSCoreDataLog(17, v6, v8, v9, v10, v11, v12, v13, v7);
  uint64_t v14 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = softLinkCKDatabaseScopeString(a3);
    _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: Unable to provide a default CKRecordZoneID for database scope: %@", buf, 0xCu);
  }
  return 0;
}

uint64_t __60__PFCloudKitSerializer_defaultRecordZoneIDForDatabaseScope___block_invoke()
{
  id v0 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
  qword_1EB270780 = [v0 initWithZoneName:@"com.apple.coredata.cloudkit.zone" ownerName:getCloudKitCKCurrentUserDefaultName[0]()];
  id v1 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
  uint64_t v2 = getCloudKitCKRecordZoneDefaultName[0]();
  uint64_t result = [v1 initWithZoneName:v2 ownerName:getCloudKitCKCurrentUserDefaultName[0]()];
  qword_1EB270788 = result;
  return result;
}

+ (void)_invalidateStaticCaches
{
  qword_1EB270780 = 0;
  qword_1EB270788 = 0;
}

- (void).cxx_destruct
{
}

@end
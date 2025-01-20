@interface NSPersistentCloudKitContainer
+ (id)discoverDefaultContainerIdentifier;
- (BOOL)assignManagedObjects:(id)a3 toCloudKitRecordZone:(id)a4 inPersistentStore:(id)a5 error:(id *)a6;
- (BOOL)canDeleteRecordForManagedObjectWithID:(NSManagedObjectID *)objectID;
- (BOOL)canModifyManagedObjectsInStore:(NSPersistentStore *)store;
- (BOOL)canUpdateRecordForManagedObjectWithID:(NSManagedObjectID *)objectID;
- (BOOL)initializeCloudKitSchemaWithOptions:(NSPersistentCloudKitContainerSchemaInitializationOptions)options error:(NSError *)error;
- (CKRecord)recordForManagedObjectID:(NSManagedObjectID *)managedObjectID;
- (CKRecordID)recordIDForManagedObjectID:(NSManagedObjectID *)managedObjectID;
- (NSArray)fetchSharesInPersistentStore:(NSPersistentStore *)persistentStore error:(NSError *)error;
- (NSDictionary)fetchSharesMatchingObjectIDs:(NSArray *)objectIDs error:(NSError *)error;
- (NSDictionary)recordIDsForManagedObjectIDs:(NSArray *)managedObjectIDs;
- (NSDictionary)recordsForManagedObjectIDs:(NSArray *)managedObjectIDs;
- (NSPersistentCloudKitContainer)initWithName:(id)a3 managedObjectModel:(id)a4;
- (uint64_t)createTimeoutErrorForRequest:(uint64_t)a3 withLabel:;
- (void)_acceptShareInvitationsWithURLs:(void *)a3 shareMetadatas:(void *)a4 forPersistentStore:(uint64_t)a5 completion:;
- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4;
- (void)acceptShareInvitationsFromMetadata:(NSArray *)metadata intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion;
- (void)acceptShareInvitationsFromURLs:(id)a3 intoPersistentStore:(id)a4 completion:(id)a5;
- (void)applyActivityVoucher:(id)a3 toStores:(id)a4;
- (void)dealloc;
- (void)doWorkOnMetadataContext:(uint64_t)a3 withBlock:;
- (void)eventUpdated:(id)a3;
- (void)expireActivityVoucher:(id)a3;
- (void)fetchParticipantsMatchingLookupInfos:(NSArray *)lookupInfos intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion;
- (void)persistUpdatedShare:(CKShare *)share inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion;
- (void)publishActivity:(id)a3;
- (void)purgeObjectsAndRecordsInZoneWithID:(CKRecordZoneID *)zoneID inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion;
- (void)setPersistentStoreDescriptions:(id)a3;
- (void)shareManagedObjects:(NSArray *)managedObjects toShare:(CKShare *)share completion:(void *)completion;
@end

@implementation NSPersistentCloudKitContainer

- (NSPersistentCloudKitContainer)initWithName:(id)a3 managedObjectModel:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NSPersistentCloudKitContainer;
  v4 = [(NSPersistentContainer *)&v10 initWithName:a3 managedObjectModel:a4];
  v5 = v4;
  if (v4)
  {
    v4->_operationTimeout = 30;
    v6 = (void *)MEMORY[0x18C127630]();
    id v7 = +[NSPersistentCloudKitContainer discoverDefaultContainerIdentifier];
    if (v7)
    {
      v8 = [[NSPersistentCloudKitContainerOptions alloc] initWithContainerIdentifier:v7];
      objc_msgSend(-[NSArray lastObject](-[NSPersistentContainer persistentStoreDescriptions](v5, "persistentStoreDescriptions"), "lastObject"), "setCloudKitContainerOptions:", v8);
    }
    v5->_metadataContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
    [(NSManagedObjectContext *)v5->_metadataContext setPersistentStoreCoordinator:[(NSPersistentContainer *)v5 persistentStoreCoordinator]];
    [(NSManagedObjectContext *)v5->_metadataContext _setAllowAncillaryEntities:1];
    [(NSManagedObjectContext *)v5->_metadataContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentCloudKitContainer;
  [(NSPersistentContainer *)&v3 dealloc];
}

- (void)setPersistentStoreDescriptions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_super v10 = objc_msgSend((id)objc_msgSend(v9, "cloudKitContainerOptions"), "containerIdentifier");
        v11 = v10;
        if (v10 && [v10 length])
        {
          v12 = (void *)[v5 objectForKey:v11];
          if (v12)
          {
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "cloudKitContainerOptions"), "databaseScope");
            if (v13 == objc_msgSend((id)objc_msgSend(v9, "cloudKitContainerOptions"), "databaseScope"))
            {
              v14 = (void *)MEMORY[0x1E4F1CA00];
              v21 = @"storeURL";
              uint64_t v22 = [v9 URL];
              uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
              objc_exception_throw((id)[v14 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot assign the same iCloud Container Identifier to multiple persistent stores with the same database scope." userInfo:v15]);
            }
          }
          else
          {
            [v5 setObject:v9 forKey:v11];
          }
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  v16.receiver = self;
  v16.super_class = (Class)NSPersistentCloudKitContainer;
  [(NSPersistentContainer *)&v16 setPersistentStoreDescriptions:a3];
}

- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_super v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v10 cloudKitContainerOptions])
        {
          [v10 cloudKitContainerOptions];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v12 = (void *)[v10 cloudKitContainerOptions];
          if ((isKindOfClass & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v16 = *MEMORY[0x1E4F1C3C8];
              long long v17 = NSString;
              long long v18 = (objc_class *)objc_opt_class();
              long long v19 = NSStringFromClass(v18);
              long long v20 = NSStringFromSelector(sel_cloudKitContainerOptions);
              v21 = (objc_class *)objc_opt_class();
              uint64_t v22 = [v17 stringWithFormat:@"%@.%@ must be of type '%@'", v19, v20, NSStringFromClass(v21)];
              v29 = @"offendingObject";
              uint64_t v30 = [v10 cloudKitContainerOptions];
              objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v22, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1)));
            }
            v12 = (void *)[v10 cloudKitContainerOptions];
          }
          [v12 setProgressProvider:self];
          uint64_t v13 = -[NSCloudKitMirroringDelegate initWithCloudKitContainerOptions:]([NSCloudKitMirroringDelegate alloc], "initWithCloudKitContainerOptions:", [v10 cloudKitContainerOptions]);
          [v10 setMirroringDelegate:v13];
          if (!objc_msgSend((id)objc_msgSend(v10, "options"), "objectForKey:", @"NSPersistentHistoryTrackingKey")) {
            [v10 setOption:MEMORY[0x1E4F1CC38] forKey:@"NSPersistentHistoryTrackingKey"];
          }
LABEL_17:

          continue;
        }
        if ([v10 mirroringDelegate])
        {
          [v10 mirroringDelegate];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = (NSCloudKitMirroringDelegate *)(id)[v10 mirroringDelegate];
            uint64_t v13 = v14;
            if (v14) {
              v14 = (NSCloudKitMirroringDelegate *)v14->_options;
            }
            [(NSCloudKitMirroringDelegate *)v14 setProgressProvider:self];
            goto LABEL_17;
          }
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v7);
  }
  v24.receiver = self;
  v24.super_class = (Class)NSPersistentCloudKitContainer;
  [(NSPersistentContainer *)&v24 _loadStoreDescriptions:a3 withCompletionHandler:a4];
}

+ (id)discoverDefaultContainerIdentifier
{
  [@"com.apple.developer.icloud-container-identifiers" UTF8String];
  uint64_t v2 = xpc_copy_entitlement_for_self();
  if (!v2) {
    return 0;
  }
  objc_super v3 = (void *)v2;
  v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if ([v4 count]) {
    id v5 = (id)[v4 objectAtIndex:0];
  }
  else {
    id v5 = 0;
  }

  xpc_release(v3);
  return v5;
}

- (BOOL)initializeCloudKitSchemaWithOptions:(NSPersistentCloudKitContainerSchemaInitializationOptions)options error:(NSError *)error
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 1;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3052000000;
  v59 = __Block_byref_object_copy__20;
  v60 = __Block_byref_object_dispose__20;
  uint64_t v61 = 0;
  group = dispatch_group_create();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v5 = [(NSPersistentStoreCoordinator *)[(NSPersistentContainer *)self persistentStoreCoordinator] persistentStores];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v52 objects:v78 count:16];
  NSPersistentCloudKitContainerSchemaInitializationOptions v47 = options;
  uint64_t v7 = 0;
  if (v6)
  {
    uint64_t v8 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v52 + 1) + 8 * i) isCloudKitEnabled])
        {
          objc_super v10 = (void *)MEMORY[0x18C127630]();
          unint64_t v11 = __ckLoggingOverride;
          uint64_t v12 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: will initialize cloudkit schema for store: %@"];
          if (v11 >= 3) {
            uint64_t v19 = 3;
          }
          else {
            uint64_t v19 = v11;
          }
          _NSCoreDataLog(v19, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]");
          dispatch_group_enter(group);
          ++v7;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v52 objects:v78 count:16];
    }
    while (v6);
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v7)
  {
    *((unsigned char *)v63 + 24) = 0;
    id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v70 = *MEMORY[0x1E4F28588];
    uint64_t v71 = [NSString stringWithFormat:@"Couldn't initialize CloudKit schema because no stores in the coordinator are configured to use CloudKit: %@", -[NSPersistentStoreCoordinator persistentStores](-[NSPersistentContainer persistentStoreCoordinator](self, "persistentStoreCoordinator"), "persistentStores")];
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    uint64_t v33 = [v31 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v32];
    v57[5] = v33;
    goto LABEL_26;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v22 = [NSCloudKitMirroringInitializeSchemaRequest alloc];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke;
  v51[3] = &unk_1E544D160;
  v51[4] = v20;
  v51[5] = v21;
  v51[7] = &v62;
  v51[6] = group;
  v23 = [(NSCloudKitMirroringRequest *)v22 initWithOptions:0 completionBlock:v51];
  [(NSCloudKitMirroringInitializeSchemaRequest *)v23 setSchemaInitializationOptions:v47];
  objc_super v24 = [(NSPersistentContainer *)self newBackgroundContext];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke_49;
  v50[3] = &unk_1E544BB50;
  v50[4] = v24;
  v50[5] = v23;
  v50[6] = &v62;
  v50[7] = &v56;
  [(NSManagedObjectContext *)v24 performBlockAndWait:v50];
  if (*((unsigned char *)v63 + 24))
  {
    dispatch_time_t v25 = dispatch_time(0, 1000000000 * self->_operationTimeout);
    if (dispatch_group_wait(group, v25))
    {
      *((unsigned char *)v63 + 24) = 0;
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v76 = *MEMORY[0x1E4F28588];
      uint64_t v77 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to initialize CloudKit schema because the requests timed out (a %lds wait failed).", self->_operationTimeout);
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      long long v28 = (void *)[v26 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v27];
      [v21 addObject:v28];
    }
    if (!*((unsigned char *)v63 + 24)) {
      goto LABEL_35;
    }
    if (v7 == [v20 count])
    {
      *((unsigned char *)v63 + 24) = 0;
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      v74[0] = *MEMORY[0x1E4F28588];
      v74[1] = @"NSDetailedErrors";
      v75[0] = @"Couldn't initialize CloudKit schema because no stores were able to succesfully initialize.";
      v75[1] = v20;
      uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
LABEL_24:
      uint64_t v34 = [v29 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v30];
      v57[5] = v34;
      goto LABEL_25;
    }
    if (!*((unsigned char *)v63 + 24))
    {
LABEL_35:
      if ([v21 count])
      {
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        v72 = @"encounteredErrors";
        id v73 = v21;
        uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        goto LABEL_24;
      }
    }
  }
LABEL_25:

LABEL_26:
  if (!*((unsigned char *)v63 + 24))
  {
    v37 = (NSError *)(id)v57[5];
    if (v37)
    {
      if (error) {
        *error = v37;
      }
    }
    else
    {
      uint64_t v38 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      v45 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v67 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        __int16 v68 = 1024;
        int v69 = 307;
        _os_log_fault_impl(&dword_18AB82000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  dispatch_release(group);
  v57[5] = 0;
  char v35 = *((unsigned char *)v63 + 24);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);
  return v35;
}

void __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([a2 success])
  {
    v4 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 0x10) {
      uint64_t v5 = 16;
    }
    else {
      uint64_t v5 = __ckLoggingOverride;
    }
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished initialize schema with result: %@"];
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]_block_invoke");
    goto LABEL_15;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134419)
  {
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = [a2 error];
    goto LABEL_13;
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v15 + 24)) {
    *(unsigned char *)(v15 + 24) = 0;
  }
  uint64_t v16 = (void *)MEMORY[0x18C127630]();
  BOOL v17 = __ckLoggingOverride != 0;
  uint64_t v18 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Initialize schema request failed: %@"];
  _NSCoreDataLog(v17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[NSPersistentCloudKitContainer initializeCloudKitSchemaWithOptions:error:]_block_invoke");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  if ([a2 error])
  {
    dispatch_time_t v25 = objc_msgSend((id)objc_msgSend(a2, "error"), "userInfo");
    uint64_t v26 = *MEMORY[0x1E4F28A50];
    uint64_t v27 = [v25 objectForKey:*MEMORY[0x1E4F28A50]];
    uint64_t v13 = *(void **)(a1 + 40);
    long long v28 = (void *)[a2 error];
    id v29 = v28;
    if (!v27)
    {
LABEL_14:
      [v13 addObject:v29];
      goto LABEL_15;
    }
    uint64_t v14 = objc_msgSend((id)objc_msgSend(v28, "userInfo"), "objectForKey:", v26);
LABEL_13:
    id v29 = (void *)v14;
    goto LABEL_14;
  }
  uint64_t v30 = [NSString stringWithUTF8String:"Initialize schema failed but did not set an error: %@"];
  _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)a2);
  v37 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v39 = a2;
    _os_log_fault_impl(&dword_18AB82000, v37, OS_LOG_TYPE_FAULT, "CoreData: Initialize schema failed but did not set an error: %@", buf, 0xCu);
  }
LABEL_15:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

id __75__NSPersistentCloudKitContainer_initializeCloudKitSchemaWithOptions_error___block_invoke_49(uint64_t a1)
{
  id v3 = 0;
  id result = (id)[*(id *)(a1 + 32) executeRequest:*(void *)(a1 + 40) error:&v3];
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    id result = v3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (CKRecord)recordForManagedObjectID:(NSManagedObjectID *)managedObjectID
{
  uint64_t v36 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3052000000;
  uint64_t v33 = __Block_byref_object_copy__20;
  uint64_t v34 = __Block_byref_object_dispose__20;
  uint64_t v35 = 0;
  v4 = [(NSPersistentContainer *)self newBackgroundContext];
  uint64_t v5 = objc_alloc_init(_PFRequestExecutor);
  uint64_t v6 = [NSCloudKitMirroringDelegateSerializationRequest alloc];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__NSPersistentCloudKitContainer_recordForManagedObjectID___block_invoke;
  v29[3] = &unk_1E544D188;
  v29[5] = v5;
  v29[6] = &v30;
  v29[4] = managedObjectID;
  uint64_t v7 = [(NSCloudKitMirroringDelegateSerializationRequest *)v6 initWithOptions:0 completionBlock:v29];
  [(NSCloudKitMirroringDelegateSerializationRequest *)v7 setResultType:1];
  -[NSCloudKitMirroringDelegateSerializationRequest setObjectIDsToSerialize:](v7, "setObjectIDsToSerialize:", [MEMORY[0x1E4F1CAD0] setWithObject:managedObjectID]);
  if ([(_PFRequestExecutor *)v5 executeRequest:v7 inContext:v4 error:&v36])
  {
    if (![(_PFRequestExecutor *)v5 wait])
    {
      uint64_t v8 = [NSString stringWithUTF8String:"Wait timed out during call to recordForManagedObjectID"];
      _NSCoreDataLog(17, v8, v9, v10, v11, v12, v13, v14, v27);
      uint64_t v15 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v15, OS_LOG_TYPE_FAULT, "CoreData: Wait timed out during call to recordForManagedObjectID", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x18C127630]();
    uint64_t v17 = __ckLoggingOverride;
    uint64_t v18 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to retrieve record for object '%@'\n%@"];
    _NSCoreDataLog(v17 != 0, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[NSPersistentCloudKitContainer recordForManagedObjectID:]");

    v31[5] = 0;
  }

  dispatch_time_t v25 = (CKRecord *)(id)v31[5];
  _Block_object_dispose(&v30, 8);
  return v25;
}

uint64_t __58__NSPersistentCloudKitContainer_recordForManagedObjectID___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 success])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = objc_msgSend((id)objc_msgSend(a2, "serializedObjects"), "objectForKey:", *(void *)(a1 + 32));
      if (v4) {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v4;
      }
    }
    else
    {
      uint64_t v14 = [NSString stringWithUTF8String:"NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializationRequestResult' when asking about the record for a managed object id."];
      _NSCoreDataLog(17, v14, v15, v16, v17, v18, v19, v20, v23);
      uint64_t v21 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializationRequestResult' when asking about the record for a managed object id.", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x18C127630]();
    BOOL v6 = __ckLoggingOverride != 0;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Record serialization failed with error: %@"];
    [a2 error];
    _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[NSPersistentCloudKitContainer recordForManagedObjectID:]_block_invoke");
  }
  return [*(id *)(a1 + 40) requestFinished];
}

- (NSDictionary)recordsForManagedObjectIDs:(NSArray *)managedObjectIDs
{
  uint64_t v31 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v6 = [(NSPersistentContainer *)self newBackgroundContext];
  uint64_t v7 = objc_alloc_init(_PFRequestExecutor);
  uint64_t v8 = [NSCloudKitMirroringDelegateSerializationRequest alloc];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __60__NSPersistentCloudKitContainer_recordsForManagedObjectIDs___block_invoke;
  v30[3] = &unk_1E544D1B0;
  v30[4] = v5;
  v30[5] = v7;
  uint64_t v9 = [(NSCloudKitMirroringDelegateSerializationRequest *)v8 initWithOptions:0 completionBlock:v30];
  [(NSCloudKitMirroringDelegateSerializationRequest *)v9 setResultType:1];
  -[NSCloudKitMirroringDelegateSerializationRequest setObjectIDsToSerialize:](v9, "setObjectIDsToSerialize:", [MEMORY[0x1E4F1CAD0] setWithArray:managedObjectIDs]);
  if ([(_PFRequestExecutor *)v7 executeRequest:v9 inContext:v6 error:&v31])
  {
    if (![(_PFRequestExecutor *)v7 wait])
    {
      uint64_t v10 = [NSString stringWithUTF8String:"Wait timed out during call to recordsForManagedObjectIDs"];
      _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, v28);
      uint64_t v17 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Wait timed out during call to recordsForManagedObjectIDs", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x18C127630]();
    BOOL v19 = __ckLoggingOverride != 0;
    uint64_t v20 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to retrieve records for objects %@"];
    _NSCoreDataLog(v19, v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[NSPersistentCloudKitContainer recordsForManagedObjectIDs:]");

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  return (NSDictionary *)v5;
}

uint64_t __60__NSPersistentCloudKitContainer_recordsForManagedObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([a2 success])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v4 = objc_msgSend((id)objc_msgSend(a2, "request"), "objectIDsToSerialize");
      uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v32 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v10 = objc_msgSend((id)objc_msgSend(a2, "serializedObjects"), "objectForKey:", v9);
            if (v10) {
              [*(id *)(a1 + 32) setObject:v10 forKey:v9];
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v6);
      }
    }
    else
    {
      uint64_t v20 = [NSString stringWithUTF8String:"NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializationRequestResult' when asking about the records for a group of managed object ids."];
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, v29);
      uint64_t v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v27, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainer got a result back that isn't of type 'NSCloudKitMirroringDelegateSerializationRequestResult' when asking about the records for a group of managed object ids.", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x18C127630]();
    BOOL v12 = __ckLoggingOverride != 0;
    uint64_t v13 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Record serialization failed with error: %@"];
    [a2 error];
    _NSCoreDataLog(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[NSPersistentCloudKitContainer recordsForManagedObjectIDs:]_block_invoke");
  }
  return [*(id *)(a1 + 40) requestFinished];
}

- (CKRecordID)recordIDForManagedObjectID:(NSManagedObjectID *)managedObjectID
{
  id v3 = [(NSPersistentCloudKitContainer *)self recordForManagedObjectID:managedObjectID];

  return [(CKRecord *)v3 recordID];
}

- (NSDictionary)recordIDsForManagedObjectIDs:(NSArray *)managedObjectIDs
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSPersistentCloudKitContainer *)self recordsForManagedObjectIDs:managedObjectIDs];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v4, "setObject:forKey:", objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8)), "recordID"), *(void *)(*((void *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return (NSDictionary *)v4;
}

- (BOOL)canUpdateRecordForManagedObjectWithID:(NSManagedObjectID *)objectID
{
  v33[1] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  if (![(NSManagedObjectID *)objectID isTemporaryID])
  {
    uint64_t v6 = [(NSManagedObjectID *)objectID persistentStore];
    uint64_t v7 = v6;
    if (!v6
      || ![(NSString *)[(NSPersistentStore *)v6 type] isEqualToString:@"SQLite"])
    {
      *((unsigned char *)v26 + 24) = 1;
LABEL_20:

      BOOL v5 = *((unsigned char *)v26 + 24) != 0;
      goto LABEL_21;
    }
    uint64_t v8 = [(NSPersistentStore *)v7 mirroringDelegate];
    id v9 = v8;
    if (v8)
    {
      long long v10 = (void *)v8[1];
      if (*((unsigned char *)v9 + 89))
      {
        if ([v10 databaseScope] == 1)
        {
          if (*((void *)v9 + 19))
          {
            if (self) {
              metadataContext = self->_metadataContext;
            }
            else {
              metadataContext = 0;
            }
            long long v12 = metadataContext;
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __71__NSPersistentCloudKitContainer_canUpdateRecordForManagedObjectWithID___block_invoke;
            v24[3] = &unk_1E544D4A8;
            v24[4] = objectID;
            v24[5] = v7;
            v24[6] = v12;
            v24[7] = v9;
            v24[8] = &v25;
            [(NSManagedObjectContext *)v12 performBlockAndWait:v24];
          }
          goto LABEL_19;
        }
        if ([*((id *)v9 + 1) databaseScope] == 3)
        {
          uint64_t v23 = 0;
          v33[0] = objectID;
          id v13 = -[NSDictionary objectForKey:](-[NSPersistentCloudKitContainer fetchSharesMatchingObjectIDs:error:](self, "fetchSharesMatchingObjectIDs:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1], &v23), "objectForKey:", objectID);
          if (!v13)
          {
            uint64_t v15 = [NSString stringWithUTF8String:"Failed to fetch the CKShare for an object in the shared database: %@ - %@"];
            _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)objectID);
            uint64_t v22 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v30 = objectID;
              __int16 v31 = 2112;
              uint64_t v32 = v23;
              _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch the CKShare for an object in the shared database: %@ - %@", buf, 0x16u);
            }
            goto LABEL_19;
          }
          if (objc_msgSend((id)objc_msgSend(v13, "currentUserParticipant"), "permission") != 3)
          {
LABEL_19:

            goto LABEL_20;
          }
        }
      }
      else if ([v10 databaseScope] != 2)
      {
        goto LABEL_19;
      }
    }
    *((unsigned char *)v26 + 24) = 1;
    goto LABEL_19;
  }
  BOOL v5 = 1;
  *((unsigned char *)v26 + 24) = 1;
LABEL_21:
  _Block_object_dispose(&v25, 8);
  return v5;
}

void __71__NSPersistentCloudKitContainer_canUpdateRecordForManagedObjectWithID___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  v23[0] = *(void *)(a1 + 32);
  uint64_t v2 = objc_msgSend(+[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 1), *(void *)(a1 + 40), *(void **)(a1 + 48), &v18), "lastObject");
  if (v2)
  {
    id v3 = (void *)[v2 createRecordFromSystemFields];
    id v4 = v3;
    if (!v3
      || (BOOL v5 = objc_msgSend((id)objc_msgSend(v3, "creatorUserRecordID"), "recordName"),
          ([v5 isEqualToString:getCloudKitCKCurrentUserDefaultName[0]()] & 1) != 0)
      || ((uint64_t v6 = objc_msgSend((id)objc_msgSend(v4, "creatorUserRecordID"), "recordName"),
           (uint64_t v7 = *(void *)(a1 + 56)) == 0)
        ? (uint64_t v8 = 0)
        : (uint64_t v8 = *(void **)(v7 + 152)),
          objc_msgSend(v6, "isEqualToString:", objc_msgSend(v8, "recordName"))))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else if (v18)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"An error occured while fetching record metadata to figure out if an object is mutable: %@\n%@"];
    _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, *(void *)(a1 + 32));
    uint64_t v16 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: An error occured while fetching record metadata to figure out if an object is mutable: %@\n%@", buf, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

- (BOOL)canDeleteRecordForManagedObjectWithID:(NSManagedObjectID *)objectID
{
  v23[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (id *)[(NSPersistentStore *)[(NSManagedObjectID *)objectID persistentStore] mirroringDelegate];
  uint64_t v6 = v5;
  if (!v5)
  {
    if ([0 databaseScope] != 1)
    {
      BOOL v7 = [0 databaseScope] != 3;
      goto LABEL_11;
    }
    goto LABEL_3;
  }
  if ([v5[1] databaseScope] != 1)
  {
    if ([v6[1] databaseScope] == 3)
    {
      if (!*((unsigned char *)v6 + 89)) {
        goto LABEL_3;
      }
      uint64_t v18 = 0;
      v23[0] = objectID;
      id v8 = -[NSDictionary objectForKey:](-[NSPersistentCloudKitContainer fetchSharesMatchingObjectIDs:error:](self, "fetchSharesMatchingObjectIDs:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1], &v18), "objectForKey:", objectID);
      if (v8)
      {
        BOOL v7 = objc_msgSend((id)objc_msgSend(v8, "currentUserParticipant"), "permission") == 3;
        goto LABEL_11;
      }
      uint64_t v9 = [NSString stringWithUTF8String:"Failed to fetch the CKShare for an object in the shared database: %@ - %@"];
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)objectID);
      uint64_t v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = objectID;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Failed to fetch the CKShare for an object in the shared database: %@ - %@", buf, 0x16u);
      }
    }
    BOOL v7 = 1;
    goto LABEL_11;
  }
LABEL_3:
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (BOOL)canModifyManagedObjectsInStore:(NSPersistentStore *)store
{
  if ([(NSString *)[(NSPersistentStore *)store type] isEqualToString:@"SQLite"])
  {
    id v4 = (unsigned __int8 *)[(NSPersistentStore *)store mirroringDelegate];
    BOOL v5 = v4;
    if (!v4) {
      goto LABEL_7;
    }
    int v6 = v4[89];
    uint64_t v7 = [*((id *)v4 + 1) databaseScope];
    if (!v6)
    {
      BOOL v8 = v7 == 2;
      goto LABEL_9;
    }
    if (v7 == 1) {
      BOOL v8 = v5[19] != 0;
    }
    else {
LABEL_7:
    }
      BOOL v8 = 1;
LABEL_9:

    return v8;
  }
  return 1;
}

- (void)eventUpdated:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x18C127630](self, a2);
  int v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = @"event";
  v8[0] = a3;
  objc_msgSend(v6, "postNotificationName:object:userInfo:", @"NSPersistentCloudKitContainerEventChangedNotification", self, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
}

- (void)publishActivity:(id)a3
{
  BOOL v5 = (void *)MEMORY[0x18C127630](self, a2);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = (void *)[a3 createDictionaryRepresentation];
  [v6 setObject:v7 forKey:@"activityDictionary"];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"NSPersistentCloudKitContainerActivityChangedNotificationName", self, v6);
}

- (BOOL)assignManagedObjects:(id)a3 toCloudKitRecordZone:(id)a4 inPersistentStore:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3052000000;
  uint64_t v29 = __Block_byref_object_copy__20;
  uint64_t v30 = __Block_byref_object_dispose__20;
  uint64_t v31 = 0;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = (id)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "managedObjectContext");
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke;
  v25[3] = &unk_1E544D1D8;
  v25[4] = v12;
  v25[5] = a3;
  v25[6] = v10;
  v25[7] = v11;
  v25[8] = &v32;
  v25[9] = &v26;
  [v12 performBlockAndWait:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_94;
  v24[3] = &unk_1E544D250;
  v24[4] = v11;
  v24[5] = a4;
  v24[6] = v10;
  v24[7] = &v32;
  v24[8] = &v26;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v24);

  if (!*((unsigned char *)v33 + 24))
  {
    id v15 = (id)v27[5];
    if (v15)
    {
      if (a6) {
        *a6 = v15;
      }
    }
    else
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      uint64_t v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        __int16 v38 = 1024;
        int v39 = 710;
        _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v27[5] = 0;
  char v13 = *((unsigned char *)v33 + 24);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v13;
}

id __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v31 = 0;
  if ([*(id *)(a1 + 32) obtainPermanentIDsForObjects:*(void *)(a1 + 40) error:&v31])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = *(id *)(a1 + 40);
    id result = (id)[obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    id v25 = result;
    if (result)
    {
      uint64_t v24 = *(void *)v28;
      do
      {
        id v3 = 0;
        do
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(obj);
          }
          id v4 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v3);
          if ([v4 managedObjectContext] != *(void *)(a1 + 32))
          {
            uint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "Client passed in objects from multiple contexts, this should return an error.");
            _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, v22);
            id v12 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_18AB82000, v12, OS_LOG_TYPE_FAULT, "CoreData: Client passed in objects from multiple contexts, this should return an error.", buf, 2u);
            }
          }
          id v13 = (id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "persistentStore");
          id v14 = (id)[v13 identifier];
          id v15 = (id)[v13 mirroringDelegate];
          id v16 = (id)[*(id *)(a1 + 48) objectForKey:v14];
          if (!v16)
          {
            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [*(id *)(a1 + 48) setObject:v16 forKey:v14];
          }
          id v17 = (id)[*(id *)(a1 + 56) objectForKey:v14];
          if (!v17)
          {
            id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [*(id *)(a1 + 56) setObject:v17 forKey:v14];
          }
          objc_msgSend(v16, "addObject:", objc_msgSend(v4, "objectID"));

          uint64_t v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "entity"), "attributesByName"), "objectForKey:", @"ckRecordID");
          if (!v18 || (id v19 = (id)[v4 valueForKey:@"ckRecordID"]) == 0)
          {
            id v19 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
            if (v18)
            {
              if (v15) {
                uint64_t v20 = (void *)v15[1];
              }
              else {
                uint64_t v20 = 0;
              }
              if ([v20 preserveLegacyRecordMetadataBehavior]) {
                [v4 setValue:v19 forKey:@"ckRecordID"];
              }
            }
          }
          uint64_t v21 = -[_PFObjectCKRecordZoneLink initWithObjectID:recordName:]([_PFObjectCKRecordZoneLink alloc], "initWithObjectID:recordName:", [v4 objectID], v19);
          [v17 addObject:v21];

          id v3 = (char *)v3 + 1;
        }
        while (v25 != v3);
        id result = (id)[obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        id v25 = result;
      }
      while (result);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id result = v31;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = result;
  }
  return result;
}

uint64_t __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_94(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_2;
  v4[3] = &unk_1E544D200;
  uint64_t v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  v4[5] = a2;
  long long v5 = *(_OWORD *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __99__NSPersistentCloudKitContainer_assignManagedObjects_toCloudKitRecordZone_inPersistentStore_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[objc_alloc(getCloudKitCKRecordZoneClass()) initWithZoneID:*(void *)(a1 + 32)];
  id v45 = 0;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator"), "persistentStoreForIdentifier:", a2);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (id *)(id)[v7 mirroringDelegate];
    uint64_t v10 = v9;
    if (v9)
    {
      __int16 v38 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(a1 + 32), [v9[1] databaseScope], (uint64_t)v8, *(void **)(a1 + 40), (uint64_t)&v45);
      if (v38)
      {
        id v11 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, (void *)[*(id *)(a1 + 48) objectForKey:a2], v8, *(void **)(a1 + 40), &v45);
        if (!v11) {
          goto LABEL_24;
        }
        char v35 = v10;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v12 = [a3 countByEnumeratingWithState:&v41 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v42;
          uint64_t v37 = *MEMORY[0x1E4F281F8];
          uint64_t v36 = *MEMORY[0x1E4F28578];
LABEL_7:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v42 != v14) {
              objc_enumerationMutation(a3);
            }
            id v16 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
            id v17 = objc_msgSend(v11, "objectForKey:", objc_msgSend(v16, "objectID"));
            if (v17)
            {
              uint64_t v18 = -[NSCKRecordZoneMetadata createRecordZoneID]((void *)[v17 recordZone]);
              if (([v18 isEqual:*(void *)(a1 + 32)] & 1) == 0)
              {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
                id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v50 = v36;
                uint64_t v51 = [NSString stringWithFormat:@"The object %@ is already assigned to the zone '%@' and cannot be moved to '%@'.", objc_msgSend(v16, "objectID"), v18, *(void *)(a1 + 32)];
                *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(v19, "initWithDomain:code:userInfo:", v37, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
                *a4 = 1;
              }
            }
            else
            {
              uint64_t v20 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordMetadata entityPath], *(void *)(a1 + 40));
              [*(id *)(a1 + 40) assignObject:v20 toPersistentStore:v8];
              -[NSManagedObject setCkRecordName:](v20, "setCkRecordName:", [v16 recordName]);
              uint64_t v21 = NSNumber;
              uint64_t v22 = _sqlEntityForEntityDescription([v8 model], objc_msgSend((id)objc_msgSend(v16, "objectID"), "entity"));
              uint64_t v23 = v22 ? *(unsigned int *)(v22 + 184) : 0;
              -[NSManagedObject setEntityId:](v20, "setEntityId:", [v21 numberWithUnsignedInt:v23]);
              -[NSManagedObject setEntityPK:](v20, "setEntityPK:", objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend((id)objc_msgSend(v16, "objectID"), "_referenceData64")));
              [(NSManagedObject *)v20 setRecordZone:v38];
              [(NSManagedObject *)v20 setNeedsUpload:1];
            }
            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
              break;
            }
            if (v13 == ++v15)
            {
              uint64_t v24 = [a3 countByEnumeratingWithState:&v41 objects:v52 count:16];
              uint64_t v13 = v24;
              if (v24) {
                goto LABEL_7;
              }
              break;
            }
          }
        }
        uint64_t v10 = v35;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
        {
          if (([*(id *)(a1 + 40) save:&v45] & 1) == 0)
          {
LABEL_24:
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
            *a4 = 1;
            *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v45;
          }
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v45;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v26 = *MEMORY[0x1E4F281F8];
      uint64_t v48 = *MEMORY[0x1E4F28578];
      v49 = @"Target store has no mirroring delegate.";
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
      uint64_t v27 = [NSString stringWithUTF8String:"Target store has no mirroring delegate: %@"];
      _NSCoreDataLog(17, v27, v28, v29, v30, v31, v32, v33, (uint64_t)v8);
      uint64_t v34 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        NSPersistentCloudKitContainerSchemaInitializationOptions v47 = v8;
        _os_log_fault_impl(&dword_18AB82000, v34, OS_LOG_TYPE_FAULT, "CoreData: Target store has no mirroring delegate: %@", buf, 0xCu);
      }
    }
  }
}

- (void)doWorkOnMetadataContext:(uint64_t)a3 withBlock:
{
  if (a1)
  {
    id v5 = *(id *)(a1 + 48);
    uint64_t v6 = v5;
    if (a2)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke;
      v8[3] = &unk_1E544BD30;
      v8[4] = v5;
      v8[5] = a3;
      [v5 performBlock:v8];
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke_215;
      v7[3] = &unk_1E544BD30;
      v7[4] = v5;
      v7[5] = a3;
      [v5 performBlockAndWait:v7];
    }
  }
}

- (void)acceptShareInvitationsFromMetadata:(NSArray *)metadata intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
}

- (void)_acceptShareInvitationsWithURLs:(void *)a3 shareMetadatas:(void *)a4 forPersistentStore:(uint64_t)a5 completion:
{
  v27[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v9 = (NSPersistentStoreResult *)(id)[a4 mirroringDelegate];
  uint64_t v10 = v9;
  if (!v9)
  {
    id v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F289D0];
    uint64_t v25 = [a4 URL];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v18 = (void *)[v16 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Provided persistent store is not backed by CloudKit." userInfo:v17];
    goto LABEL_11;
  }
  if ([(objc_class *)v9[1].super.isa databaseScope] != 3)
  {
    id v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = [NSString stringWithFormat:@"Provided persistent store is not set to the shared database scope and cannot accept share invitation."];
    v26[0] = *MEMORY[0x1E4F289D0];
    v27[0] = [a4 URL];
    v26[1] = @"databaseScope";
    v27[1] = softLinkCKDatabaseScopeString([(objc_class *)v10[1].super.isa databaseScope]);
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    uint64_t v18 = (void *)[v19 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v20 userInfo:v21];
LABEL_11:
    objc_exception_throw(v18);
  }
  id v11 = [NSCloudKitMirroringAcceptShareInvitationsRequest alloc];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __110__NSPersistentCloudKitContainer__acceptShareInvitationsWithURLs_shareMetadatas_forPersistentStore_completion___block_invoke;
  v23[3] = &unk_1E544D228;
  v23[4] = a5;
  uint64_t v12 = [(NSCloudKitMirroringAcceptShareInvitationsRequest *)v11 initWithOptions:0 completionBlock:v23];
  uint64_t v14 = v12;
  if (v12)
  {
    v12->super._isContainerRequest = 1;
    objc_setProperty_nonatomic_copy(v12, v13, a2, 80);
    objc_setProperty_nonatomic_copy(v14, v15, a3, 88);
  }
  uint64_t v22 = 0;
  if (!-[NSCloudKitMirroringDelegate executeMirroringRequest:error:](v10, v14, &v22)) {
    (*(void (**)(uint64_t, void, uint64_t))(a5 + 16))(a5, 0, v22);
  }
}

- (void)acceptShareInvitationsFromURLs:(id)a3 intoPersistentStore:(id)a4 completion:(id)a5
{
}

void __110__NSPersistentCloudKitContainer__acceptShareInvitationsWithURLs_shareMetadatas_forPersistentStore_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![a2 success])
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (!v11) {
      return;
    }
    uint64_t v12 = [a2 error];
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    uint64_t v8 = v12;
    uint64_t v9 = v11;
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      return;
    }
    uint64_t v5 = [a2 acceptedShareMetadatas];
    uint64_t v6 = [a2 error];
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    uint64_t v8 = v6;
    uint64_t v9 = v4;
    uint64_t v10 = v5;
LABEL_7:
    v7(v9, v10, v8);
    return;
  }
  uint64_t v13 = [NSString stringWithUTF8String:"Share acceptance succeeded but did not return NSCloudKitMirroringAcceptShareInvitationsResult: %@"];
  uint64_t v14 = [a2 request];
  _NSCoreDataLog(17, v13, v15, v16, v17, v18, v19, v20, v14);
  uint64_t v21 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = [a2 request];
    _os_log_fault_impl(&dword_18AB82000, v21, OS_LOG_TYPE_FAULT, "CoreData: Share acceptance succeeded but did not return NSCloudKitMirroringAcceptShareInvitationsResult: %@", buf, 0xCu);
  }
  uint64_t v22 = *(void *)(a1 + 32);
  if (v22)
  {
    uint64_t v23 = *MEMORY[0x1E4F281F8];
    uint64_t v24 = *MEMORY[0x1E4F28588];
    uint64_t v25 = @"Share acceptance succeeded but did not return an acceptance result.";
    (*(void (**)(uint64_t, void, uint64_t))(v22 + 16))(v22, 0, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v23, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1)));
  }
}

- (void)persistUpdatedShare:(CKShare *)share inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  uint64_t v34 = 0;
  char v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3052000000;
  uint64_t v31 = __Block_byref_object_copy__20;
  uint64_t v32 = __Block_byref_object_dispose__20;
  uint64_t v33 = 0;
  id v7 = [(NSPersistentStore *)persistentStore mirroringDelegate];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke;
  void v27[3] = &unk_1E544D250;
  v27[4] = share;
  v27[5] = persistentStore;
  v27[6] = v7;
  v27[7] = &v28;
  v27[8] = &v34;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v27);
  if (completion && *((unsigned char *)v35 + 24))
  {
    unint64_t v8 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    do
    {
      *((unsigned char *)v35 + 24) = 1;
      uint64_t v9 = (void *)v29[5];
      if (v9)
      {

        v29[5] = 0;
      }
      id v22 = 0;
      uint64_t v10 = objc_alloc_init(_PFRequestExecutor);
      objc_initWeak(&location, self);
      uint64_t v11 = [(NSPersistentStore *)persistentStore identifier];
      uint64_t v12 = [(CKShare *)share recordID];
      uint64_t v13 = [NSCloudKitMirroringExportRequest alloc];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke_2;
      v19[3] = &unk_1E544D278;
      v19[4] = v11;
      objc_copyWeak(&v20, &location);
      v19[7] = completion;
      v19[8] = &v23;
      v19[5] = v12;
      v19[6] = v10;
      uint64_t v14 = [(NSCloudKitMirroringRequest *)v13 initWithOptions:0 completionBlock:v19];
      uint64_t v15 = (void *)v14;
      if (v14) {
        *(unsigned char *)(v14 + 56) = 1;
      }
      if (*((unsigned char *)v35 + 24))
      {
        if ([(_PFRequestExecutor *)v10 executeRequest:v14 inContext:self->_metadataContext error:&v22])
        {
          if (![(_PFRequestExecutor *)v10 wait])
          {
            *((unsigned char *)v24 + 24) = 1;
            id v22 = (id)-[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:]((uint64_t)self, (uint64_t)v15, @"Persist-Share-Export");
            (*((void (**)(void *, void, id))completion + 2))(completion, 0, v22);

            id v22 = 0;
          }
        }
        else
        {
          *((unsigned char *)v35 + 24) = 0;
          (*((void (**)(void *, void, id))completion + 2))(completion, 0, v22);
          *((unsigned char *)v24 + 24) = 1;
        }
      }

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      if (*((unsigned char *)v24 + 24)) {
        break;
      }
    }
    while (v8++ < 9);
    _Block_object_dispose(&v23, 8);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

void __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "recordID"), "zoneID");
  uint64_t v5 = (void *)[*(id *)(a1 + 40) mirroringDelegate];
  if (v5) {
    uint64_t v5 = (void *)v5[7];
  }
  uint64_t v6 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v4, [v5 databaseScope], *(void *)(a1 + 40), a2, *(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7
      && (uint64_t v8 = *(void *)(v7 + 8)) != 0
      && (v9 = v6, (uint64_t v10 = *(void *)(v8 + 136)) != 0)
      && (id v11 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v10, *(void *)(a1 + 32), (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))) != 0)
    {
      id v15 = v11;
      [(NSManagedObject *)v9 setEncodedShareData:v11];
      [(NSManagedObject *)v9 setNeedsShareUpdate:1];
      if ([a2 save:*(void *)(*(void *)(a1 + 56) + 8) + 40]) {
        goto LABEL_15;
      }
    }
    else
    {
      id v15 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v14 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
LABEL_15:

    return;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);

  id v13 = v12;
}

uint64_t __82__NSPersistentCloudKitContainer_persistUpdatedShare_inPersistentStore_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend((id)objc_msgSend(a2, "storeIdentifier"), "isEqualToString:", *(void *)(a1 + 32)))
  {
    if ([a2 success])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      uint64_t v5 = WeakRetained;
      if (WeakRetained)
      {
        uint64_t v6 = *(void *)(a1 + 56);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __123__NSPersistentCloudKitContainer__finishPersistShareRequestForShareWithRecordID_inPersistentStoreWithIdentifier_completion___block_invoke;
        v10[3] = &unk_1E544D2A0;
        long long v11 = *(_OWORD *)(a1 + 32);
        uint64_t v12 = v6;
        -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)WeakRetained, 0, (uint64_t)v10);
      }
    }
    else
    {
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "error"), "domain");
      if ([v7 isEqual:*MEMORY[0x1E4F281F8]]
        && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134409)
      {
        char v8 = 0;
LABEL_11:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v8;
        return [*(id *)(a1 + 48) requestFinished];
      }
      (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, [a2 error]);
    }
    char v8 = 1;
    goto LABEL_11;
  }
  return [*(id *)(a1 + 48) requestFinished];
}

- (uint64_t)createTimeoutErrorForRequest:(uint64_t)a3 withLabel:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"NSPersistentCloudKitContainer timed out waiting for request: %@ - %@"];
    _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a3);
    uint64_t v12 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = a3;
      __int16 v19 = 2112;
      uint64_t v20 = a2;
      _os_log_fault_impl(&dword_18AB82000, v12, OS_LOG_TYPE_FAULT, "CoreData: NSPersistentCloudKitContainer timed out waiting for request: %@ - %@", buf, 0x16u);
    }
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F281F8];
    v15[0] = @"request";
    v15[1] = @"label";
    v16[0] = a2;
    v16[1] = a3;
    return objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v16, v15, 2));
  }
  return result;
}

void __123__NSPersistentCloudKitContainer__finishPersistShareRequestForShareWithRecordID_inPersistentStoreWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "persistentStoreForIdentifier:", *(void *)(a1 + 32));
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [NSString stringWithUTF8String:"Unsupported store type for CloudKit request %@"];
      _NSCoreDataLog(17, v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
      id v13 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_fault_impl(&dword_18AB82000, v13, OS_LOG_TYPE_FAULT, "CoreData: Unsupported store type for CloudKit request %@", buf, 0xCu);
      }
    }
    uint64_t v14 = [v5 mirroringDelegate];
    if (!v14)
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Store is not mirrored %@"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v5);
      id v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Store is not mirrored %@", buf, 0xCu);
      }
    }
    *(void *)buf = 0;
    uint64_t v23 = (void *)[*(id *)(a1 + 40) zoneID];
    uint64_t v24 = (void *)[v5 mirroringDelegate];
    if (v24) {
      uint64_t v24 = (void *)v24[1];
    }
    uint64_t v25 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v23, [v24 databaseScope], (uint64_t)v5, a2, (uint64_t)buf);
    if (v25)
    {
      if (v14 && (uint64_t v26 = *(void *)(v14 + 8)) != 0) {
        uint64_t v27 = *(void *)(v26 + 136);
      }
      else {
        uint64_t v27 = 0;
      }
      uint64_t v28 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v27, (void *)-[NSManagedObject encodedShareData](v25, "encodedShareData"), (char *)[*(id *)(a1 + 40) zoneID], buf);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void)fetchParticipantsMatchingLookupInfos:(NSArray *)lookupInfos intoPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)lookupInfos count])
  {
    id v8 = [(NSPersistentStore *)persistentStore mirroringDelegate];
    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v10 = (void *)[objc_alloc(getCloudKitCKFetchShareParticipantsOperationClass()) initWithUserIdentityLookupInfos:lookupInfos];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke;
      v17[3] = &unk_1E544D2C8;
      v17[4] = v9;
      [v10 setPerShareParticipantCompletionBlock:v17];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke_2;
      v16[3] = &unk_1E544D2F0;
      v16[4] = v9;
      v16[5] = completion;
      [v10 setFetchShareParticipantsCompletionBlock:v16];
      uint64_t v11 = [(NSPersistentStore *)persistentStore mirroringDelegate];
      if (v11) {
        uint64_t v11 = (void *)v11[6];
      }
      [v11 addOperation:v10];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F281F8];
      uint64_t v19 = @"NSAffectedStoresErrorKey";
      if (!persistentStore) {
        persistentStore = (NSPersistentStore *)[MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v18 = persistentStore;
      v20[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      (*((void (**)(void *, void, uint64_t))completion + 2))(completion, 0, objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 134091, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1)));
    }
  }
  else
  {
    uint64_t v12 = (void (*)(void *, uint64_t, void))*((void *)completion + 2);
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
    v12(completion, v13, 0);
  }
}

void __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "addObject:");
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x18C127630]();
    BOOL v5 = __ckLoggingOverride != 0;
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch participant with lookup info: %@\n%@"];
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[NSPersistentCloudKitContainer fetchParticipantsMatchingLookupInfos:intoPersistentStore:completion:]_block_invoke");
  }
}

uint64_t __101__NSPersistentCloudKitContainer_fetchParticipantsMatchingLookupInfos_intoPersistentStore_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)purgeObjectsAndRecordsInZoneWithID:(CKRecordZoneID *)zoneID inPersistentStore:(NSPersistentStore *)persistentStore completion:(void *)completion
{
  v34[4] = *MEMORY[0x1E4F143B8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = [(CKRecordZoneID *)zoneID ownerName];
  if ([(NSString *)v10 isEqualToString:getCloudKitCKCurrentUserDefaultName[0]()]) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 3;
  }
  if (persistentStore)
  {
    if ([(NSPersistentStore *)persistentStore mirroringDelegate])
    {
      uint64_t v12 = [(NSPersistentStore *)persistentStore mirroringDelegate];
      if (v12) {
        uint64_t v12 = (void *)v12[1];
      }
      if (v11 == [v12 databaseScope])
      {
        [v9 addObject:persistentStore];
        goto LABEL_22;
      }
      uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
      v33[0] = @"storeURL";
      v34[0] = [(NSPersistentStore *)persistentStore URL];
      v33[1] = @"databaseScope";
      uint64_t v23 = NSNumber;
      uint64_t v24 = [(NSPersistentStore *)persistentStore mirroringDelegate];
      if (v24) {
        uint64_t v24 = (void *)v24[1];
      }
      v34[1] = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "databaseScope"));
      void v33[2] = @"requiredDatabaseScope";
      v33[3] = @"zoneID";
      v34[2] = softLinkCKDatabaseScopeString(v11);
      v34[3] = zoneID;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];
      uint64_t v21 = *MEMORY[0x1E4F1C3C8];
      id v22 = @"Illegal attempt to purge a zone from the wrong store";
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v31 = *MEMORY[0x1E4F289D0];
      uint64_t v32 = [(NSPersistentStore *)persistentStore URL];
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      uint64_t v21 = *MEMORY[0x1E4F1C3C8];
      id v22 = @"Provided persistent store is not backed by CloudKit.";
    }
    objc_exception_throw((id)[v19 exceptionWithName:v21 reason:v22 userInfo:v20]);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v13 = [(NSPersistentStoreCoordinator *)[(NSPersistentContainer *)self persistentStoreCoordinator] persistentStores];
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v17 mirroringDelegate])
        {
          uint64_t v18 = (void *)[v17 mirroringDelegate];
          if (v18) {
            uint64_t v18 = (void *)v18[1];
          }
          if (v11 == [v18 databaseScope]) {
            [v9 addObject:v17];
          }
        }
      }
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }
LABEL_22:
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __97__NSPersistentCloudKitContainer_purgeObjectsAndRecordsInZoneWithID_inPersistentStore_completion___block_invoke;
  v25[3] = &unk_1E544D318;
  v25[4] = v9;
  v25[5] = self;
  v25[6] = zoneID;
  v25[7] = completion;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 1, (uint64_t)v25);
}

uint64_t __97__NSPersistentCloudKitContainer_purgeObjectsAndRecordsInZoneWithID_inPersistentStore_completion___block_invoke(void *a1, void *a2)
{
  v83[1] = *MEMORY[0x1E4F143B8];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = (id)a1[4];
  uint64_t v3 = [obj countByEnumeratingWithState:&v57 objects:v76 count:16];
  if (v3)
  {
    id v55 = 0;
    uint64_t v56 = *(void *)v58;
    uint64_t v51 = *MEMORY[0x1E4F281F8];
    uint64_t v52 = *MEMORY[0x1E4F28A50];
LABEL_3:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v58 != v56) {
        objc_enumerationMutation(obj);
      }
      uint64_t v5 = a1[5];
      if (!v5)
      {
LABEL_49:
        uint64_t result = a1[7];
        if (result) {
          return (*(uint64_t (**)(uint64_t, void, id))(result + 16))(result, 0, v55);
        }
        return result;
      }
      uint64_t v6 = *(void **)(*((void *)&v57 + 1) + 8 * v4);
      uint64_t v7 = (void *)a1[6];
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2020000000;
      char v74 = 1;
      uint64_t v65 = 0;
      v66 = &v65;
      uint64_t v67 = 0x3052000000;
      __int16 v68 = __Block_byref_object_copy__20;
      int v69 = __Block_byref_object_dispose__20;
      uint64_t v70 = 0;
      uint64_t v8 = (id *)(id)[v6 mirroringDelegate];
      if (v8) {
        break;
      }
      uint64_t v15 = [NSString stringWithUTF8String:"Persistente store has no mirroring delegate, this should have been validated before invoking this method: %@"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v6);
      id v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Persistente store has no mirroring delegate, this should have been validated before invoking this method: %@", buf, 0xCu);
      }
      char v23 = 0;
      BOOL v75 = *((unsigned char *)v72 + 24) != 0;
LABEL_35:

      if (v23)
      {
        if (*((unsigned char *)v72 + 24)) {
          goto LABEL_37;
        }
        id v39 = (id)v66[5];
        if (!v39)
        {
          uint64_t v41 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
          _NSCoreDataLog(17, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
          uint64_t v48 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
            __int16 v78 = 1024;
            int v79 = 1134;
            _os_log_fault_impl(&dword_18AB82000, v48, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
LABEL_37:
          id v39 = v55;
        }

        v66[5] = 0;
        BOOL v40 = *((unsigned char *)v72 + 24) != 0;
        id v55 = v39;
        goto LABEL_41;
      }
      BOOL v40 = v75;
LABEL_41:
      _Block_object_dispose(&v65, 8);
      _Block_object_dispose(&v71, 8);
      if (!v40) {
        goto LABEL_49;
      }
      if (v3 == ++v4)
      {
        uint64_t v49 = [obj countByEnumeratingWithState:&v57 objects:v76 count:16];
        uint64_t v3 = v49;
        if (v49) {
          goto LABEL_3;
        }
        goto LABEL_47;
      }
    }
    id v9 = objc_alloc_init(_PFRequestExecutor);
    if ([v8[1] databaseScope] != 3)
    {
      uint64_t v24 = [NSCloudKitMirroringResetZoneRequest alloc];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_3;
      v61[3] = &unk_1E544D340;
      v61[6] = &v65;
      v61[4] = v9;
      v61[5] = &v71;
      uint64_t v11 = [(NSCloudKitMirroringResetZoneRequest *)v24 initWithOptions:0 completionBlock:v61];
      v80 = v7;
      -[NSCloudKitMirroringResetZoneRequest setRecordZoneIDsToReset:]((uint64_t)v11, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1]);
      *(void *)buf = 0;
      if ([(_PFRequestExecutor *)v9 executeRequest:v11 onMirroringDelegate:v8 error:buf])
      {
        if ([(_PFRequestExecutor *)v9 wait]) {
          goto LABEL_33;
        }
        *((unsigned char *)v72 + 24) = 0;
        id v25 = (id)-[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:](v5, (uint64_t)v11, @"Zone-Purge-Reset");
      }
      else
      {
        *((unsigned char *)v72 + 24) = 0;
        id v25 = *(id *)buf;
      }
      v66[5] = (uint64_t)v25;
      goto LABEL_33;
    }
    *(void *)buf = 0;
    -[NSManagedObject setNeedsShareDelete:](+[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v7, [v8[1] databaseScope], (uint64_t)v6, a2, (uint64_t)buf), "setNeedsShareDelete:", 1);
    if (![a2 save:buf])
    {
      long long v26 = (void *)MEMORY[0x18C127630]();
      uint64_t v27 = __ckLoggingOverride;
      uint64_t v28 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Encountered an error trying to update the store metadata while attempting to purge zone '%@': %@"];
      _NSCoreDataLog(v27 != 0, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[NSPersistentCloudKitContainer _doPurgeForObjectsAndRecordsInZoneWithID:inPersistentStore:withContext:error:]");
      *((unsigned char *)v72 + 24) = 0;
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v81 = v52;
      uint64_t v36 = *(void *)buf;
      if (!*(void *)buf) {
        uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v82 = v36;
      uint64_t v37 = objc_msgSend(v35, "initWithDomain:code:userInfo:", v51, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1));
      v66[5] = v37;
      goto LABEL_34;
    }
    uint64_t v10 = [NSCloudKitMirroringExportRequest alloc];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke;
    v64[3] = &unk_1E544D340;
    v64[6] = &v65;
    v64[4] = v9;
    v64[5] = &v71;
    uint64_t v11 = [(NSCloudKitMirroringRequest *)v10 initWithOptions:0 completionBlock:v64];
    id v63 = 0;
    if ([(_PFRequestExecutor *)v9 executeRequest:v11 onMirroringDelegate:v8 error:&v63])
    {
      if ([(_PFRequestExecutor *)v9 wait])
      {
        uint64_t v12 = [NSCloudKitMirroringResetZoneRequest alloc];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_2;
        v62[3] = &unk_1E544D340;
        v62[6] = &v65;
        v62[4] = v9;
        v62[5] = &v71;
        uint64_t v13 = [(NSCloudKitMirroringResetZoneRequest *)v12 initWithOptions:0 completionBlock:v62];
        v83[0] = v7;
        -[NSCloudKitMirroringResetZoneRequest setRecordZoneIDsToReset:]((uint64_t)v13, (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1]);
        if ([(_PFRequestExecutor *)v9 executeRequest:v13 onMirroringDelegate:v8 error:&v63])
        {
          if ([(_PFRequestExecutor *)v9 wait])
          {
LABEL_32:

            goto LABEL_33;
          }
          *((unsigned char *)v72 + 24) = 0;
          id v14 = (id)-[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:](v5, (uint64_t)v13, @"Zone-Purge-PostExportReset");
        }
        else
        {
          *((unsigned char *)v72 + 24) = 0;
          id v14 = v63;
        }
        v66[5] = (uint64_t)v14;
        goto LABEL_32;
      }
      *((unsigned char *)v72 + 24) = 0;
      id v38 = (id)-[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:](v5, (uint64_t)v11, @"Zone-Purge-Export");
    }
    else
    {
      *((unsigned char *)v72 + 24) = 0;
      id v38 = v63;
    }
    v66[5] = (uint64_t)v38;
LABEL_33:

LABEL_34:
    char v23 = 1;
    goto LABEL_35;
  }
LABEL_47:
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[6], 0);
  }
  return result;
}

uint64_t __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke(void *a1, void *a2)
{
  if (([a2 success] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[a2 error];
  }
  uint64_t v4 = (void *)a1[4];

  return [v4 requestFinished];
}

uint64_t __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_2(void *a1, void *a2)
{
  if (([a2 success] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[a2 error];
  }
  uint64_t v4 = (void *)a1[4];

  return [v4 requestFinished];
}

uint64_t __110__NSPersistentCloudKitContainer__doPurgeForObjectsAndRecordsInZoneWithID_inPersistentStore_withContext_error___block_invoke_3(void *a1, void *a2)
{
  if (([a2 success] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
    *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[a2 error];
  }
  uint64_t v4 = (void *)a1[4];

  return [v4 requestFinished];
}

- (NSDictionary)fetchSharesMatchingObjectIDs:(NSArray *)objectIDs error:(NSError *)error
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3052000000;
  uint64_t v50 = __Block_byref_object_copy__20;
  uint64_t v51 = __Block_byref_object_dispose__20;
  uint64_t v52 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3052000000;
  uint64_t v44 = __Block_byref_object_copy__20;
  uint64_t v45 = __Block_byref_object_dispose__20;
  uint64_t v46 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v6 = [(NSArray *)objectIDs countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(objectIDs);
        }
        id v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v10 = (id)[v9 persistentStore];
        if (objc_msgSend((id)objc_msgSend(v10, "type"), "isEqualToString:", @"SQLite"))
        {
          if (objc_msgSend((id)objc_msgSend(v10, "ancillaryModels"), "objectForKey:", @"NSPersistentStoreMirroringDelegateOptionKey"))
          {
            uint64_t v11 = [v10 mirroringDelegate];
            if (v11)
            {
              if (*(unsigned char *)(v11 + 144))
              {
                id v12 = (id)objc_msgSend(v5, "objectForKey:", objc_msgSend(v10, "identifier"));
                if (!v12)
                {
                  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  objc_msgSend(v5, "setObject:forKey:", v12, objc_msgSend(v10, "identifier"));
                }
                [v12 addObject:v9];
              }
            }
          }
        }
      }
      uint64_t v6 = [(NSArray *)objectIDs countByEnumeratingWithState:&v37 objects:v57 count:16];
    }
    while (v6);
  }
  if ([v5 count])
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __68__NSPersistentCloudKitContainer_fetchSharesMatchingObjectIDs_error___block_invoke;
    v36[3] = &unk_1E544D368;
    v36[4] = v5;
    v36[5] = &v41;
    v36[6] = &v47;
    -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v36);
    id v13 = (id)v48[5];
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    v48[5] = (uint64_t)v13;
  }
  if (!v13)
  {
    id v14 = (NSError *)(id)v42[5];
    if (v14)
    {
      if (error) {
        *error = v14;
      }
    }
    else
    {
      uint64_t v15 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      id v22 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v54 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        __int16 v55 = 1024;
        int v56 = 1218;
        _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
    if (!v42[5])
    {
      uint64_t v23 = [NSString stringWithUTF8String:"fetchSharesMatchingObjectIDs failed but did not set an error."];
      _NSCoreDataLog(17, v23, v24, v25, v26, v27, v28, v29, v33);
      uint64_t v30 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18AB82000, v30, OS_LOG_TYPE_FAULT, "CoreData: fetchSharesMatchingObjectIDs failed but did not set an error.", buf, 2u);
      }
    }
  }

  v42[5] = 0;
  uint64_t v31 = (NSDictionary *)(id)v48[5];
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);
  return v31;
}

void __68__NSPersistentCloudKitContainer_fetchSharesMatchingObjectIDs_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v38;
LABEL_3:
    uint64_t v4 = 0;
    while (1)
    {
      if (*(void *)v38 != v29) {
        objc_enumerationMutation(obj);
      }
      uint64_t v32 = v4;
      uint64_t v5 = *(void *)(*((void *)&v37 + 1) + 8 * v4);
      uint64_t v6 = [*(id *)(a1 + 32) objectForKey:v5];
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "persistentStoreForIdentifier:", v5);
      id v8 = +[NSCKRecordMetadata metadataForObjectIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, v6, (uint64_t)v7, a2, (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      if (v8)
      {
        id v9 = v8;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v34;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
              uint64_t v15 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID]((void *)[v14 recordZone]);
              uint64_t v16 = objc_msgSend((id)objc_msgSend(v14, "recordZone"), "encodedShareData");
              if (v16)
              {
                uint64_t v17 = (void *)v16;
                uint64_t v18 = [v7 mirroringDelegate];
                if (v18)
                {
                  uint64_t v19 = *(void *)(v18 + 8);
                  if (v19) {
                    uint64_t v18 = *(void *)(v19 + 136);
                  }
                  else {
                    uint64_t v18 = 0;
                  }
                }
                uint64_t v20 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v18, v17, v15, (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
                if (v20)
                {
                  uint64_t v21 = v20;
                  id v22 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v14);
                  [v3 setObject:v21 forKey:v22];
                }
                else
                {
                  uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
                  if (v23)
                  {
                    id v27 = v23;

                    goto LABEL_27;
                  }
                }
              }

              ++v13;
            }
            while (v11 != v13);
            uint64_t v24 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
            uint64_t v11 = v24;
          }
          while (v24);
        }
      }
      else
      {
        uint64_t v25 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        if (v25) {
          id v26 = v25;
        }
      }
LABEL_27:
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
        break;
      }
      uint64_t v4 = v32 + 1;
      if (v32 + 1 == v30)
      {
        uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v30) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [v3 copy];
  }
}

- (NSArray)fetchSharesInPersistentStore:(NSPersistentStore *)persistentStore error:(NSError *)error
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3052000000;
  uint64_t v47 = __Block_byref_object_copy__20;
  uint64_t v48 = __Block_byref_object_dispose__20;
  uint64_t v49 = 0;
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3052000000;
  uint64_t v41 = __Block_byref_object_copy__20;
  uint64_t v42 = __Block_byref_object_dispose__20;
  uint64_t v43 = 0;
  if (persistentStore) {
    uint64_t v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", persistentStore, 0);
  }
  else {
    uint64_t v6 = [(NSPersistentStoreCoordinator *)[(NSPersistentContainer *)self persistentStoreCoordinator] persistentStores];
  }
  uint64_t v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v34 objects:v54 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "type"), "isEqualToString:", @"SQLite"))
        {
          if (objc_msgSend((id)objc_msgSend(v12, "ancillaryModels"), "objectForKey:", @"NSPersistentStoreMirroringDelegateOptionKey"))
          {
            uint64_t v13 = [v12 mirroringDelegate];
            if (v13)
            {
              if (*(unsigned char *)(v13 + 144)) {
                [v8 addObject:v12];
              }
            }
          }
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v34 objects:v54 count:16];
    }
    while (v9);
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3052000000;
  uint64_t v31 = __Block_byref_object_copy__20;
  uint64_t v32 = __Block_byref_object_dispose__20;
  uint64_t v33 = 0;
  if ([v8 count])
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __68__NSPersistentCloudKitContainer_fetchSharesInPersistentStore_error___block_invoke;
    void v27[3] = &unk_1E544D390;
    v27[4] = v8;
    v27[5] = &v38;
    v27[6] = &v44;
    v27[7] = &v28;
    -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v27);
    if (v45[5]) {
      goto LABEL_21;
    }
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v45[5] = (uint64_t)v14;
    if (v14) {
      goto LABEL_21;
    }
  }
  if (!v29[5])
  {
    uint64_t v18 = (NSError *)(id)v39[5];
    if (v18)
    {
      if (error) {
        *error = v18;
      }
    }
    else
    {
      uint64_t v19 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      id v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v51 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        __int16 v52 = 1024;
        int v53 = 1303;
        _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
LABEL_21:

  v39[5] = 0;
  uint64_t v15 = (void *)v45[5];
  if (v29[5])
  {

    v45[5] = 0;
    objc_exception_throw((id)v29[5]);
  }
  uint64_t v16 = v15;
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  return v16;
}

void __68__NSPersistentCloudKitContainer_fetchSharesInPersistentStore_error___block_invoke(void *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath]);
  -[NSFetchRequest setPredicate:](v4, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"encodedShareData != nil"]);
  [(NSFetchRequest *)v4 setAffectedStores:a1[4]];
  uint64_t v5 = (void *)[a2 executeFetchRequest:v4 error:*(void *)(a1[5] + 8) + 40];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
          uint64_t v11 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID](v10);
          id v12 = (id)objc_msgSend((id)objc_msgSend(v10, "objectID"), "persistentStore");
          uint64_t v13 = [v12 mirroringDelegate];
          if (v13)
          {
            id v14 = *(void **)(v13 + 8);
            if (v14) {
              id v14 = (void *)v14[17];
            }
          }
          else
          {
            id v14 = 0;
          }
          uint64_t v15 = v14;
          if (!v15)
          {
            uint64_t v16 = [NSString stringWithUTF8String:"Fetched a zone metadata with an encoded share but can't unarchive it because it doesn't have an associated mirroring delegate: %@ - %@"];
            _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v12);
            uint64_t v23 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v35 = v12;
              __int16 v36 = 2112;
              long long v37 = v10;
              _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Fetched a zone metadata with an encoded share but can't unarchive it because it doesn't have an associated mirroring delegate: %@ - %@", buf, 0x16u);
            }
          }
          uint64_t v24 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:]((uint64_t)v15, (void *)[v10 encodedShareData], v11, (void *)(*(void *)(a1[5] + 8) + 40));

          if (v24)
          {
            [v29 addObject:v24];
          }
          else
          {
            uint64_t v25 = *(void **)(*(void *)(a1[5] + 8) + 40);
            if (v25)
            {
              id v28 = v25;
              goto LABEL_23;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v26 = [v6 countByEnumeratingWithState:&v30 objects:v38 count:16];
        uint64_t v7 = v26;
      }
      while (v26);
    }
LABEL_23:
    if (!*(void *)(*(void *)(a1[5] + 8) + 40)) {
      *(void *)(*(void *)(a1[6] + 8) + 40) = [v29 copy];
    }
  }
  else
  {
    id v27 = *(id *)(*(void *)(a1[5] + 8) + 40);
  }
}

- (void)shareManagedObjects:(NSArray *)managedObjects toShare:(CKShare *)share completion:(void *)completion
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v65 = (id)objc_msgSend(-[NSArray lastObject](managedObjects, "lastObject"), "managedObjectContext");
  if (share)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend((id)-[CKShare recordID](share, "recordID"), "zoneID"), "ownerName");
    int v9 = [v8 isEqualToString:getCloudKitCKCurrentUserDefaultName[0]()];
    uint64_t v10 = 2;
    if (!v9) {
      uint64_t v10 = 3;
    }
  }
  else
  {
    uint64_t v10 = 2;
  }
  uint64_t v67 = v10;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v11 = [(NSPersistentStoreCoordinator *)[(NSPersistentContainer *)self persistentStoreCoordinator] persistentStores];
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v106 objects:v112 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v107;
LABEL_8:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v107 != v13) {
        objc_enumerationMutation(v11);
      }
      uint64_t v15 = *(void **)(*((void *)&v106 + 1) + 8 * v14);
      uint64_t v16 = (void *)[v15 mirroringDelegate];
      if (v16) {
        uint64_t v16 = (void *)v16[1];
      }
      if ([v16 databaseScope] == v67) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v106 objects:v112 count:16];
        if (v12) {
          goto LABEL_8;
        }
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_16:
    uint64_t v15 = 0;
  }
  uint64_t v17 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 0x10) {
    uint64_t v18 = 16;
  }
  else {
    uint64_t v18 = __ckLoggingOverride;
  }
  uint64_t v19 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Sharing %lu objects from store: %@ to share: %@"];
  uint64_t v62 = share;
  NSUInteger v61 = [(NSArray *)managedObjects count];
  _NSCoreDataLog(v18, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]");
  id v26 = (id)[v15 mirroringDelegate];
  id v27 = v26;
  if (v26) {
    id v28 = (void *)*((void *)v26 + 6);
  }
  else {
    id v28 = 0;
  }
  id v29 = v28;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3052000000;
  v103 = __Block_byref_object_copy__20;
  v104 = __Block_byref_object_dispose__20;
  uint64_t v105 = 0;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x2020000000;
  char v99 = 1;
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x3052000000;
  v93 = __Block_byref_object_copy__20;
  v94 = __Block_byref_object_dispose__20;
  uint64_t v95 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3052000000;
  v87 = __Block_byref_object_copy__20;
  v88 = __Block_byref_object_dispose__20;
  uint64_t v89 = 0;
  uint64_t v78 = 0;
  int v79 = &v78;
  uint64_t v80 = 0x3052000000;
  uint64_t v81 = __Block_byref_object_copy__20;
  uint64_t v82 = __Block_byref_object_dispose__20;
  uint64_t v83 = 0;
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (!v15)
  {
    *((unsigned char *)v97 + 24) = 0;
    id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v110 = *MEMORY[0x1E4F28588];
    v111 = @"Could not locate private store in which to share.";
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    uint64_t v37 = [v35 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v36];
    v101[5] = v37;
    goto LABEL_38;
  }
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke;
  v77[3] = &unk_1E544D480;
  v77[4] = managedObjects;
  v77[5] = v65;
  v77[6] = v31;
  v77[7] = v15;
  v77[8] = v30;
  v77[9] = &v96;
  v77[10] = &v100;
  [v65 performBlockAndWait:v77];
  if (*((unsigned char *)v97 + 24))
  {
    if (share)
    {
      long long v32 = share;
      v85[5] = (uint64_t)v32;
      id v33 = (id)objc_msgSend((id)-[CKShare recordID](v32, "recordID"), "zoneID");
      long long v34 = v79;
    }
    else
    {
      if ([v30 count])
      {
        uint64_t v38 = [v30 allObjects];
        uint64_t v39 = [(NSPersistentCloudKitContainer *)self fetchSharesMatchingObjectIDs:v38 error:v101 + 5];
        uint64_t v40 = v39;
        if (v39)
        {
          if ([(NSDictionary *)v39 count])
          {
            id v41 = [(NSDictionary *)v40 objectForKey:[(NSArray *)[(NSDictionary *)v40 allKeys] lastObject]];
            v85[5] = (uint64_t)v41;
            id v42 = (id)objc_msgSend((id)objc_msgSend(v41, "recordID"), "zoneID");
            v79[5] = (uint64_t)v42;
          }
        }
        else
        {
          *((unsigned char *)v97 + 24) = 0;
          id v43 = (id)v101[5];
        }
        if (*((unsigned char *)v97 + 24) && !v79[5])
        {
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_184;
          v76[3] = &unk_1E544D3B8;
          v76[4] = v30;
          v76[5] = v15;
          v76[6] = &v78;
          v76[7] = &v84;
          v76[8] = &v96;
          v76[9] = &v100;
          -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v76);
        }
      }
      if (v85[5]) {
        goto LABEL_37;
      }
      id v57 = objc_alloc((Class)getCloudKitCKRecordZoneIDClass[0]());
      uint64_t v58 = [NSString stringWithFormat:@"%@%@", @"com.apple.coredata.cloudkit.share.", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), self, v61, v15, v62];
      uint64_t v59 = [v57 initWithZoneName:v58 ownerName:getCloudKitCKCurrentUserDefaultName[0]()];
      v79[5] = v59;
      id v60 = objc_alloc((Class)getCloudKitCKShareClass[0]());
      id v33 = (id)[v60 initWithRecordZoneID:v79[5]];
      long long v34 = v85;
    }
    v34[5] = (uint64_t)v33;
  }
LABEL_37:

  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  void v75[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_2;
  v75[3] = &unk_1E544D3E0;
  v75[4] = self;
  v75[5] = v31;
  v75[9] = v65;
  v75[10] = &v96;
  v75[11] = &v84;
  v75[6] = v15;
  v75[7] = managedObjects;
  v75[12] = &v100;
  v75[8] = v7;
  [v65 performBlockAndWait:v75];

  if (!*((unsigned char *)v97 + 24)) {
    goto LABEL_57;
  }
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  void v74[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_3;
  v74[3] = &unk_1E544D408;
  v74[4] = v15;
  v74[5] = v7;
  v74[6] = self;
  v74[7] = v64;
  v74[9] = &v84;
  v74[10] = &v96;
  v74[11] = &v100;
  v74[12] = v67;
  v74[8] = v27;
  -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v74);
  if (!*((unsigned char *)v97 + 24)) {
    goto LABEL_57;
  }
LABEL_38:
  unint64_t v44 = 0;
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  do
  {
    *((unsigned char *)v97 + 24) = 1;
    uint64_t v45 = (void *)v101[5];
    if (v45)
    {

      v101[5] = 0;
    }
    uint64_t v46 = objc_alloc_init(_PFRequestExecutor);
    uint64_t v47 = [NSCloudKitMirroringExportRequest alloc];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_4;
    v69[3] = &unk_1E544D430;
    v69[4] = v15;
    v69[5] = self;
    v69[9] = &v100;
    v69[10] = v44 + 1;
    v69[7] = &v70;
    v69[8] = &v96;
    v69[6] = v46;
    uint64_t v48 = [(NSCloudKitMirroringRequest *)v47 initWithOptions:0 completionBlock:v69];
    uint64_t v49 = (void *)v48;
    if (v48) {
      *(unsigned char *)(v48 + 56) = 1;
    }
    if (*((unsigned char *)v97 + 24))
    {
      if ([(_PFRequestExecutor *)v46 executeRequest:v48 inContext:v65 error:v101 + 5])
      {
        if ([(_PFRequestExecutor *)v46 wait])
        {
          if (*((unsigned char *)v97 + 24))
          {
            v68[0] = MEMORY[0x1E4F143A8];
            v68[1] = 3221225472;
            v68[2] = __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_5;
            v68[3] = &unk_1E544D458;
            v68[9] = &v100;
            v68[10] = v67;
            v68[6] = &v78;
            v68[7] = &v90;
            v68[8] = &v96;
            v68[4] = v15;
            v68[5] = v27;
            -[NSPersistentCloudKitContainer doWorkOnMetadataContext:withBlock:]((uint64_t)self, 0, (uint64_t)v68);
          }
        }
        else
        {
          *((unsigned char *)v97 + 24) = 0;
          uint64_t v51 = -[NSPersistentCloudKitContainer createTimeoutErrorForRequest:withLabel:]((uint64_t)self, (uint64_t)v49, @"Share-Export");
          v101[5] = v51;
          *((unsigned char *)v71 + 24) = 1;
        }
      }
      else
      {
        *((unsigned char *)v97 + 24) = 0;
        id v50 = (id)v101[5];
      }
    }

    if (*((unsigned char *)v71 + 24)) {
      break;
    }
  }
  while (v44++ < 9);
  _Block_object_dispose(&v70, 8);
  if (*((unsigned char *)v97 + 24))
  {
    id v53 = 0;
    uint64_t v54 = v91[5];
    id v55 = v64;
    id v56 = v29;
  }
  else
  {
LABEL_57:
    id v53 = (id)v101[5];
    id v55 = 0;
    uint64_t v54 = 0;
    id v56 = 0;
  }
  (*((void (**)(void *, id, uint64_t, id, id))completion + 2))(completion, v55, v54, v56, v53);

  v91[5] = 0;
  v101[5] = 0;

  v85[5] = 0;
  v79[5] = 0;

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v84, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(&v100, 8);
}

uint64_t __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t result = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v40;
    uint64_t v31 = *MEMORY[0x1E4F28588];
    uint64_t v32 = *MEMORY[0x1E4F281F8];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v40 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v39 + 1) + 8 * v5);
        if ([v6 managedObjectContext] != *(void *)(a1 + 40))
        {
          uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "Client attempting to share objects from multiple contexts, this should return an error.");
          _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, v30);
          uint64_t v14 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_18AB82000, v14, OS_LOG_TYPE_FAULT, "CoreData: Client attempting to share objects from multiple contexts, this should return an error.", buf, 2u);
          }
        }
        if (objc_msgSend((id)objc_msgSend(v6, "objectID"), "isTemporaryID"))
        {
          [*(id *)(a1 + 48) addObject:v6];
          [*(id *)(a1 + 40) assignObject:v6 toPersistentStore:*(void *)(a1 + 56)];
          id v15 = +[PFCloudKitSerializer createSetOfObjectIDsRelatedToObject:]((uint64_t)PFCloudKitSerializer, v6);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v45 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v35;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v35 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                if (([v20 isTemporaryID] & 1) == 0) {
                  [*(id *)(a1 + 64) addObject:v20];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v45 count:16];
            }
            while (v17);
          }
        }
        else
        {
          uint64_t v21 = *(void *)(a1 + 56);
          if (v21 == objc_msgSend((id)objc_msgSend(v6, "objectID"), "persistentStore"))
          {
            objc_msgSend(*(id *)(a1 + 64), "addObject:", objc_msgSend(v6, "objectID"));
          }
          else
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
            uint64_t v22 = NSString;
            uint64_t v23 = (objc_class *)objc_opt_class();
            uint64_t v24 = NSStringFromClass(v23);
            NSStringFromSelector(sel_shareManagedObjects_toShare_completion_);
            NSStringFromSelector(sel_shareManagedObjects_toShare_completion_);
            NSStringFromSelector(sel_assignObject_toPersistentStore_);
            uint64_t v30 = (uint64_t)v24;
            uint64_t v25 = [v22 stringWithFormat:@"%@ does not support sharing objects across persistent stores. %@ needs to be called with objects that are either inserted (with temporary objectIDs) or objects assigned to the correct desination store. Objects that exist in the 'wrong' store must be cloned (and their originals deleted) after which they can be assigned to the correct store by %@ or %@."];
            id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
            v44[0] = v25;
            v43[0] = v31;
            v43[1] = @"offendingObject";
            if ([v6 objectID]) {
              id v27 = (__CFString *)[v6 objectID];
            }
            else {
              id v27 = @"nil";
            }
            v44[1] = v27;
            v43[2] = @"destinationStoreURL";
            if ([*(id *)(a1 + 56) URL]) {
              id v28 = (__CFString *)[*(id *)(a1 + 56) URL];
            }
            else {
              id v28 = @"nil";
            }
            v44[2] = v28;
            v43[3] = @"storeURL";
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "persistentStore"), "URL")) {
              id v29 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "persistentStore"), "URL");
            }
            else {
              id v29 = @"nil";
            }
            v44[3] = v29;
            *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = objc_msgSend(v26, "initWithDomain:code:userInfo:", v32, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v44, v43, 4));
          }
        }
        ++v5;
      }
      while (v5 != v3);
      uint64_t result = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

void __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_184(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v16 = 0;
  id v3 = +[NSCKRecordZoneMetadata fetchZoneIDsAssignedToObjectsWithIDs:a1[4] fromStore:a1[5] inContext:a2 error:&v16];
  uint64_t v4 = v3;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v9, "zoneName"), "hasPrefix:", @"com.apple.coredata.cloudkit.share."))
          {
            *(void *)(*(void *)(a1[6] + 8) + 40) = v9;
            id v10 = (id)[objc_alloc((Class)getCloudKitCKShareClass[0]()) initWithRecordZoneID:v9];
            uint64_t v11 = a1[7];
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
    id v10 = v16;
    uint64_t v11 = a1[9];
LABEL_13:
    *(void *)(*(void *)(v11 + 8) + 40) = v10;
  }
}

void __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    uint64_t v2 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 9) {
      uint64_t v3 = 9;
    }
    else {
      uint64_t v3 = __ckLoggingOverride;
    }
    uint64_t v4 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Found %lu inserted objects to share."];
    [*(id *)(a1 + 40) count];
    _NSCoreDataLog(v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]_block_invoke_2");
    if (objc_msgSend(*(id *)(a1 + 32), "assignManagedObjects:toCloudKitRecordZone:inPersistentStore:error:", *(void *)(a1 + 40), objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), "recordID"), "zoneID"), *(void *)(a1 + 48), &v23))
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v12 = *(void **)(a1 + 56);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v11, "containsObject:", objc_msgSend(v17, "objectID")) & 1) == 0)
            {
              id v18 = +[PFCloudKitSerializer createSetOfObjectIDsRelatedToObject:]((uint64_t)PFCloudKitSerializer, v17);
              [v11 unionSet:v18];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v14);
      }
      objc_msgSend(*(id *)(a1 + 64), "addObjectsFromArray:", objc_msgSend(v11, "allObjects"));
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) = v23;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
    && [*(id *)(a1 + 72) hasChanges]
    && ([*(id *)(a1 + 72) save:&v23] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) = v23;
  }
}

void __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v49 = 0;
  uint64_t v38 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "recordID"), "zoneID"), *(void *)(a1 + 96), *(void *)(a1 + 32), a2, (uint64_t)&v49);
  if (!v38)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = v49;
    goto LABEL_43;
  }
  id v4 = +[NSCKRecordMetadata createMapOfMetadataMatchingObjectIDs:inStore:inManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(a1 + 40), *(void **)(a1 + 32), v2, &v49);
  if (!v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = v49;
    goto LABEL_42;
  }
  long long v40 = v2;
  uint64_t v5 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 9) {
    uint64_t v6 = 9;
  }
  else {
    uint64_t v6 = __ckLoggingOverride;
  }
  uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Got zone and metadatas: %@\n%@"];
  _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]_block_invoke_3");
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        long long v19 = (void *)[v4 objectForKey:v18];
        [*(id *)(a1 + 56) addObject:v18];
        if (v19)
        {
          long long v20 = (void *)-[NSCKRecordMetadata createRecordID](v19);
          if ((objc_msgSend((id)objc_msgSend(v20, "zoneID"), "isEqual:", objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "recordID"), "zoneID")) & 1) == 0)
          {
            [v19 setNeedsCloudDelete:0];
            [v19 setNeedsLocalDelete:0];
            [v19 setNeedsUpload:1];
            [v19 setCkRecordSystemFields:0];
            [v19 setEncodedRecord:0];
            long long v21 = (void *)[v19 recordZone];
            long long v22 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", +[NSCKRecordZoneMoveReceipt entityPath], v40);
            [v40 assignObject:v22 toPersistentStore:*(void *)(a1 + 32)];
            [(NSManagedObject *)v22 setRecordMetadata:v19];
            -[NSManagedObject setMovedAt:](v22, "setMovedAt:", [MEMORY[0x1E4F1C9C8] date]);
            [(NSManagedObject *)v22 setNeedsCloudDelete:1];
            -[NSManagedObject setZoneName:](v22, "setZoneName:", [v21 ckRecordZoneName]);
            -[NSManagedObject setOwnerName:](v22, "setOwnerName:", [v21 ckOwnerName]);
            -[NSManagedObject setRecordName:](v22, "setRecordName:", [v19 ckRecordName]);
            [v19 setRecordZone:v38];
            [v37 addObject:v20];
          }
        }
        else
        {
          uint64_t v23 = [v40 existingObjectWithID:v18 error:&v49];
          if (!v23
            || (id v24 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:](NSCKRecordMetadata, "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:", v23, 1, objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "recordID"), "zoneID"), 0, &v49)) == 0)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
            *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = v49;
            goto LABEL_23;
          }
          [v24 setNeedsUpload:1];
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_23:
  uint64_t v25 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v2 = v40;
  if (*(unsigned char *)(v25 + 24))
  {
    uint64_t v26 = *(void *)(a1 + 64);
    if (v26 && (uint64_t v27 = *(void *)(v26 + 8)) != 0 && (v28 = *(void *)(v27 + 136)) != 0)
    {
      id v29 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v28, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), &v49);
      if (v29)
      {
        [(NSManagedObject *)v38 setEncodedShareData:v29];
        [(NSManagedObject *)v38 setNeedsShareUpdate:1];
        id v30 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, MEMORY[0x1E4F1CBF0], v37, *(void *)(a1 + 32), v40, &v49);
        if (v30)
        {
          uint64_t v31 = v30;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          uint64_t v32 = [v30 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v42;
            uint64_t v35 = MEMORY[0x1E4F1CC38];
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v42 != v34) {
                  objc_enumerationMutation(v31);
                }
                [*(id *)(*((void *)&v41 + 1) + 8 * j) setNeedsDelete:v35];
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }
            while (v33);
          }
          uint64_t v2 = v40;
          if ([v40 save:&v49]) {
            goto LABEL_39;
          }
        }
      }
      uint64_t v25 = *(void *)(*(void *)(a1 + 80) + 8);
    }
    else
    {
      id v29 = 0;
    }
    *(unsigned char *)(v25 + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = v49;
LABEL_39:
  }
LABEL_42:

LABEL_43:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    [v2 reset];
  }
}

uint64_t __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_4(uint64_t a1, void *a2)
{
  if (objc_msgSend((id)objc_msgSend(a2, "storeIdentifier"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "identifier")))
  {
    char v4 = [a2 success];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if ((v4 & 1) == 0)
    {
      uint64_t v5 = (void *)MEMORY[0x18C127630]();
      BOOL v6 = __ckLoggingOverride != 0;
      uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Failed to export for share (%lu): %@"];
      [a2 error];
      _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[NSPersistentCloudKitContainer shareManagedObjects:toShare:completion:]_block_invoke_4");
      uint64_t v14 = objc_msgSend((id)objc_msgSend(a2, "error"), "domain");
      if ([v14 isEqualToString:*MEMORY[0x1E4F281F8]]
        && objc_msgSend((id)objc_msgSend(a2, "error"), "code") == 134409)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = (id)[a2 error];
    }
  }
  uint64_t v15 = *(void **)(a1 + 48);

  return [v15 requestFinished];
}

id __72__NSPersistentCloudKitContainer_shareManagedObjects_toShare_completion___block_invoke_5(uint64_t *a1, void *a2)
{
  id v8 = 0;
  uint64_t v3 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, *(void **)(*(void *)(a1[6] + 8) + 40), a1[10], a1[4], a2, (uint64_t)&v8);
  if (!v3
    || ((v4 = a1[5]) == 0 || (v5 = *(void *)(v4 + 8)) == 0 ? (uint64_t v6 = 0) : (uint64_t v6 = *(void *)(v5 + 136)),
        id result = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v6, (void *)[(NSManagedObject *)v3 encodedShareData], *(char **)(*(void *)(a1[6] + 8) + 40), &v8), (*(void *)(*(void *)(a1[7] + 8) + 40) = result) == 0))
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
    id result = v8;
    *(void *)(*(void *)(a1[9] + 8) + 40) = result;
  }
  return result;
}

- (void)applyActivityVoucher:(id)a3 toStores:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(NSPersistentStoreCoordinator *)[(NSPersistentContainer *)self persistentStoreCoordinator] persistentStores];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "mirroringDelegate"), "addActivityVoucher:", a3);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)expireActivityVoucher:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(NSPersistentStoreCoordinator *)[(NSPersistentContainer *)self persistentStoreCoordinator] persistentStores];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "mirroringDelegate"), "expireActivityVoucher:", a3);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

uint64_t __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "registeredObjects"), "count"))
  {
    uint64_t v2 = [NSString stringWithUTF8String:"An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@"];
    uint64_t v3 = [*(id *)(a1 + 32) registeredObjects];
    _NSCoreDataLog(17, v2, v4, v5, v6, v7, v8, v9, v3);
    long long v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = [*(id *)(a1 + 32) registeredObjects];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v20;
      _os_log_fault_impl(&dword_18AB82000, v10, OS_LOG_TYPE_FAULT, "CoreData: An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v11 = [NSString stringWithUTF8String:"An operation left NSPersistentCloudKitContainer's metadata context dirty: %@"];
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, *(void *)(a1 + 32));
    uint64_t v18 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v21;
      _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: An operation left NSPersistentCloudKitContainer's metadata context dirty: %@", buf, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) reset];
}

uint64_t __67__NSPersistentCloudKitContainer_doWorkOnMetadataContext_withBlock___block_invoke_215(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "registeredObjects"), "count"))
  {
    uint64_t v2 = [NSString stringWithUTF8String:"An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@"];
    uint64_t v3 = [*(id *)(a1 + 32) registeredObjects];
    _NSCoreDataLog(17, v2, v4, v5, v6, v7, v8, v9, v3);
    long long v10 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v20 = [*(id *)(a1 + 32) registeredObjects];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v20;
      _os_log_fault_impl(&dword_18AB82000, v10, OS_LOG_TYPE_FAULT, "CoreData: An operation left registered objects in NSPersistentCloudKitContainer's metadata context: %@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v11 = [NSString stringWithUTF8String:"An operation left NSPersistentCloudKitContainer's metadata context dirty: %@"];
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, *(void *)(a1 + 32));
    uint64_t v18 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v21;
      _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: An operation left NSPersistentCloudKitContainer's metadata context dirty: %@", buf, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) reset];
}

@end
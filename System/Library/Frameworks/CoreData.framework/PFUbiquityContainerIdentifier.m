@interface PFUbiquityContainerIdentifier
- (NSOperationQueue)presentedItemOperationQueue;
- (NSString)description;
- (NSURL)presentedItemURL;
- (PFUbiquityContainerIdentifier)init;
- (PFUbiquityContainerIdentifier)initWithLocalPeerID:(id)a3 storeName:(id)a4 andUbiquityRootLocation:(id)a5;
- (uint64_t)identifyContainer:(uint64_t)a1;
- (uint64_t)replaceIdentifierWithUUID:(void *)a3 error:;
- (uint64_t)writeToDisk:(uint64_t)a1;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)dealloc;
@end

@implementation PFUbiquityContainerIdentifier

- (PFUbiquityContainerIdentifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerIdentifier;
  result = [(PFUbiquityContainerIdentifier *)&v3 init];
  if (result)
  {
    result->_usedExistingUUIDFile = 0;
    *(_OWORD *)&result->_uuidFileLocation = 0u;
    *(_OWORD *)&result->_ubiquityRootLocation = 0u;
    *(_OWORD *)&result->_storeName = 0u;
  }
  return result;
}

- (PFUbiquityContainerIdentifier)initWithLocalPeerID:(id)a3 storeName:(id)a4 andUbiquityRootLocation:(id)a5
{
  v8 = [(PFUbiquityContainerIdentifier *)self init];
  if (v8)
  {
    v8->_localPeerID = (NSString *)a3;
    v8->_storeName = (NSString *)a4;
    v8->_ubiquityRootLocation = (PFUbiquityLocation *)a5;
  }
  return v8;
}

- (void)dealloc
{
  self->_localPeerID = 0;
  self->_storeName = 0;

  self->_ubiquityRootLocation = 0;
  self->_uuidString = 0;

  self->_uuidFileLocation = 0;
  self->_presentedItemURL = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerIdentifier;
  [(PFUbiquityContainerIdentifier *)&v3 dealloc];
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityContainerIdentifier;
  return (NSString *)[NSString stringWithFormat:@"%@: %@", -[PFUbiquityContainerIdentifier description](&v3, sel_description), self->_uuidFileLocation];
}

- (uint64_t)writeToDisk:(uint64_t)a1
{
  v4 = (void *)-[PFUbiquityLocation createFullURL](*(void *)(a1 + 40));
  v5 = (void *)[v4 URLByDeletingLastPathComponent];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v5, "path")) & 1) != 0|| objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, a2))
  {
    uint64_t v6 = [*(id *)(a1 + 32) writeToURL:v4 atomically:0 encoding:4 error:a2];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)identifyContainer:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v3 = 0;
    return v3 & 1;
  }
  uint64_t v31 = 0;
  if (*(void *)(a1 + 40))
  {
    char v3 = 1;
    return v3 & 1;
  }
  v4 = *(void **)(a1 + 24);
  if (!v4)
  {
    v5 = 0;
    v7 = 0;
LABEL_22:
    int v16 = 1;
    char v15 = 1;
    goto LABEL_24;
  }
  v5 = +[PFUbiquityLocation createMetadataPeerStoreLocationForLocalPeerID:storeName:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 16), *(void *)(a1 + 8), v4);
  id v6 = +[PFUbiquityLocation createArrayOfSubLocationsAtLocation:error:]((uint64_t)PFUbiquityLocation, (uint64_t)v5, (uint64_t)&v31);
  v7 = v6;
  if (!v6)
  {
    int v16 = 0;
    char v15 = 0;
    char v32 = 0;
    goto LABEL_24;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (v11 && *(_DWORD *)(v11 + 24) == 33)
        {

          *(void *)(a1 + 32) = 0;
          if (*(_DWORD *)(v11 + 24) == 33)
          {
            v12 = (void *)[*(id *)(v11 + 56) componentsSeparatedByString:@"."];
            if ([v12 count] == 2) {
              *(void *)(a1 + 32) = objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", 0), "copy");
            }
          }
          *(void *)(a1 + 40) = (id)v11;
          *(unsigned char *)(a1 + 56) = 1;
          *(void *)(a1 + 48) = -[PFUbiquityLocation createFullURL](v11);
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v8);
  }
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_22;
  }
  uint64_t v13 = [(__CFString *)+[_PFRoutines _getUUID]() copy];
  *(void *)(a1 + 32) = v13;
  v14 = +[PFUbiquityLocation createMetadataUUIDLocationForLocalPeerID:storeName:UUID:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(a1 + 16), *(void *)(a1 + 8), v13, *(void **)(a1 + 24));
  *(void *)(a1 + 40) = v14;
  *(void *)(a1 + 48) = -[PFUbiquityLocation createFullURL]((uint64_t)v14);
  char v15 = -[PFUbiquityContainerIdentifier writeToDisk:](a1, (uint64_t)&v31);
  int v16 = 1;
LABEL_24:

  if ((v15 & 1) == 0)
  {
    if (v31)
    {
      if (a2) {
        *a2 = v31;
      }
    }
    else
    {
      uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityContainerIdentifier.m");
      v24 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityContainerIdentifier.m";
        __int16 v35 = 1024;
        int v36 = 157;
        _os_log_fault_impl(&dword_18AB82000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  char v3 = v32;
  if (v16) {
    char v3 = v15;
  }
  return v3 & 1;
}

- (uint64_t)replaceIdentifierWithUUID:(void *)a3 error:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  uint64_t v19 = 0;
  uint64_t v6 = *(void *)(result + 40);
  if (!v6) {
    goto LABEL_7;
  }
  v7 = -[PFUbiquityLocation createFullPath](v6);
  uint64_t v8 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if (([v8 fileExistsAtPath:v7] & 1) == 0)
  {

LABEL_7:
    *(void *)(v5 + 40) = 0;

    id v10 = a2;
    *(void *)(v5 + 32) = v10;
    *(void *)(v5 + 40) = +[PFUbiquityLocation createMetadataUUIDLocationForLocalPeerID:storeName:UUID:andUbiquityRootLocation:]((uint64_t)PFUbiquityLocation, *(void *)(v5 + 16), *(void *)(v5 + 8), (uint64_t)v10, *(void **)(v5 + 24));
    if (-[PFUbiquityContainerIdentifier writeToDisk:](v5, (uint64_t)&v19)) {
      return 1;
    }
    goto LABEL_9;
  }
  int v9 = [v8 removeItemAtPath:v7 error:&v19];

  if (v9) {
    goto LABEL_7;
  }
LABEL_9:
  if (v19)
  {
    if (a3)
    {
      result = 0;
      *a3 = v19;
      return result;
    }
  }
  else
  {
    uint64_t v11 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v11, v12, v13, v14, v15, v16, v17, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityContainerIdentifier.m");
    uint64_t v18 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/Persistence/Classes/Persistency/Ubiquity/Metadata/PFUbiquityContainerIdentifier.m";
    __int16 v22 = 1024;
    int v23 = 190;
    _os_log_fault_impl(&dword_18AB82000, v18, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy__66;
  uint64_t v13 = __Block_byref_object_dispose__66;
  id v14 = 0;
  self;
  id v14 = -[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, (uint64_t)self->_storeName, (uint64_t)self->_localPeerID);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__PFUbiquityContainerIdentifier_accommodatePresentedItemDeletionWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E544B4A8;
  v8[4] = self;
  v8[5] = &v9;
  (*((void (**)(id, void))a3 + 2))(a3, 0);
  uint64_t v5 = v10[5];
  if (v5)
  {
    -[PFUbiquitySwitchboardEntry afterDelay:executeBlockOnPrivateQueue:](v5, (uint64_t)v8, 30.0);
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, 30000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_after(v6, global_queue, v8);
  }
  _Block_object_dispose(&v9, 8);
}

uint64_t __87__PFUbiquityContainerIdentifier_accommodatePresentedItemDeletionWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"PFUbiquityContainerIdentifierDeleteNotificaton" object:*(void *)(a1 + 32) userInfo:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v3);

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;

  return [v2 drain];
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)_privateQueue;
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

@end
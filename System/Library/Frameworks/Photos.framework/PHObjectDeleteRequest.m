@interface PHObjectDeleteRequest
+ (id)_deleteRequestsForObjects:(id)a3;
+ (id)deleteRequestForObject:(id)a3;
+ (id)deleteRequestsForObjects:(id)a3 ofType:(Class)a4 forSelector:(SEL)a5;
- (BOOL)isClientEntitled;
- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4;
- (NSManagedObjectID)objectID;
- (NSString)clientBundleID;
- (NSString)clientName;
- (NSString)managedEntityName;
- (PHObjectDeleteRequest)init;
- (PHObjectDeleteRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHObjectDeleteRequest)initWithUUID:(id)a3 request:(id)a4 objectID:(id)a5;
- (PHObjectDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (id)initForNewObject;
- (id)uuid;
- (void)encodeToXPCDict:(id)a3;
@end

@implementation PHObjectDeleteRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_objectID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (BOOL)isClientEntitled
{
  return self->_clientEntitled;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (id)uuid
{
  return self->_uuid;
}

- (NSString)managedEntityName
{
  v2 = [(NSManagedObjectID *)self->_objectID entity];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (BOOL)validateForDeleteManagedObject:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  v5 = [(PHObjectDeleteRequest *)self uuid];
  PLXPCDictionarySetString();

  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  PLXPCDictionarySetString();

  id v8 = [(PHObjectDeleteRequest *)self objectID];
  PLXPCDictionarySetManagedObjectID();
}

- (PHObjectDeleteRequest)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-[PHObjectDeleteRequest init] unsupported" userInfo:0];
  objc_exception_throw(v2);
}

- (PHObjectDeleteRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v10 persistentStoreCoordinator];
  v12 = xpc_dictionary_get_value(v8, "objectID");
  if (v12)
  {
    v13 = PLManagedObjectIDFromXPCValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = PLStringFromXPCDictionary();
  v15 = [(PHObjectDeleteRequest *)self initWithUUID:v14 request:v10 objectID:v13];

  if (v15)
  {
    v15->_clientEntitled = [v9 photoKitEntitled];
    uint64_t v16 = [v9 trustedCallerDisplayName];
    clientName = v15->_clientName;
    v15->_clientName = (NSString *)v16;

    uint64_t v18 = [v9 trustedCallerBundleID];
    clientBundleID = v15->_clientBundleID;
    v15->_clientBundleID = (NSString *)v18;
  }
  return v15;
}

- (id)initForNewObject
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-[PHObjectDeleteRequest initForNewObject] unsupported" userInfo:0];
  objc_exception_throw(v2);
}

- (PHObjectDeleteRequest)initWithUUID:(id)a3 request:(id)a4 objectID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHObjectDeleteRequest;
  v12 = [(PHChangeRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeStrong((id *)&v13->_objectID, a5);
    [v10 recordDeleteRequest:v13];
  }

  return v13;
}

- (PHObjectDeleteRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PHPhotoLibrary photoLibraryForCurrentTransaction];
  id v9 = [(PHObjectDeleteRequest *)self initWithUUID:v7 request:v8 objectID:v6];

  return v9;
}

+ (id)_deleteRequestsForObjects:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(a1, "deleteRequestForObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        objc_msgSend(v5, "_pl_addNonNilObject:", v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)deleteRequestsForObjects:(id)a3 ofType:(Class)a4 forSelector:(SEL)a5
{
  id v8 = a3;
  +[PHPhotoLibrary assertTransaction];
  +[PHObject assertAllObjects:v8 forSelector:a2 areOfType:a4];
  uint64_t v9 = [a1 _deleteRequestsForObjects:v8];

  return v9;
}

+ (id)deleteRequestForObject:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 uuid];
  uint64_t v7 = [v4 objectID];

  id v8 = (void *)[v5 initWithUUID:v6 objectID:v7];

  return v8;
}

@end
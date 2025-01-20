@interface NSBatchInsertRequest
+ (NSBatchInsertRequest)batchInsertRequestWithEntityName:(NSString *)entityName dictionaryHandler:(void *)handler;
+ (NSBatchInsertRequest)batchInsertRequestWithEntityName:(NSString *)entityName managedObjectHandler:(void *)handler;
+ (NSBatchInsertRequest)batchInsertRequestWithEntityName:(NSString *)entityName objects:(NSArray *)dictionaries;
+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5;
- (BOOL)_secureOperation;
- (NSArray)objectsToInsert;
- (NSBatchInsertRequest)init;
- (NSBatchInsertRequest)initWithEntity:(NSEntityDescription *)entity dictionaryHandler:(void *)handler;
- (NSBatchInsertRequest)initWithEntity:(NSEntityDescription *)entity managedObjectHandler:(void *)handler;
- (NSBatchInsertRequest)initWithEntity:(NSEntityDescription *)entity objects:(NSArray *)dictionaries;
- (NSBatchInsertRequest)initWithEntityName:(NSString *)entityName dictionaryHandler:(void *)handler;
- (NSBatchInsertRequest)initWithEntityName:(NSString *)entityName managedObjectHandler:(void *)handler;
- (NSBatchInsertRequest)initWithEntityName:(NSString *)entityName objects:(NSArray *)dictionaries;
- (NSBatchInsertRequestResultType)resultType;
- (NSEntityDescription)entity;
- (NSString)entityName;
- (id)description;
- (id)encodeForXPC;
- (unint64_t)requestType;
- (void)_resolveEntityWithContext:(id)a3;
- (void)_resolveEntityWithSQLCore:(uint64_t)a1;
- (void)_setSecureOperation:(BOOL)a3;
- (void)dealloc;
- (void)dictionaryHandler;
- (void)managedObjectHandler;
- (void)setDictionaryHandler:(void *)dictionaryHandler;
- (void)setManagedObjectHandler:(void *)managedObjectHandler;
- (void)setObjectsToInsert:(NSArray *)objectsToInsert;
- (void)setResultType:(NSBatchInsertRequestResultType)resultType;
@end

@implementation NSBatchInsertRequest

- (id)encodeForXPC
{
  id v2 = [[NSBatchInsertRequestEncodingToken alloc] initForRequest:self];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 setDelegate:objc_opt_class()];
  [v3 encodeObject:v2 forKey:@"root"];
  [v3 finishEncoding];
  id v4 = (id)[v3 encodedData];

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:0];
  [v7 setDelegate:a4];
  v8 = (void *)[MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  if (a5) {
    v8 = objc_msgSend(v8, "setByAddingObjectsFromSet:", objc_msgSend(a5, "allowableClassesForClientWithContext:", a4));
  }
  v9 = (void *)[v7 decodeObjectOfClasses:v8 forKey:@"root"];

  id result = (id)[v9 objectsToInsert];
  if (result)
  {
    v11 = -[NSBatchInsertRequest initWithEntityName:objects:]([NSBatchInsertRequest alloc], "initWithEntityName:objects:", [v9 entityName], objc_msgSend(v9, "objectsToInsert"));
    -[NSBatchInsertRequest setResultType:](v11, "setResultType:", [v9 resultType]);
    -[NSBatchInsertRequest _setSecureOperation:](v11, "_setSecureOperation:", [v9 secure]);
    return v11;
  }
  return result;
}

+ (NSBatchInsertRequest)batchInsertRequestWithEntityName:(NSString *)entityName objects:(NSArray *)dictionaries
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEntityName:entityName objects:dictionaries];

  return (NSBatchInsertRequest *)v4;
}

+ (NSBatchInsertRequest)batchInsertRequestWithEntityName:(NSString *)entityName dictionaryHandler:(void *)handler
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEntityName:entityName dictionaryHandler:handler];

  return (NSBatchInsertRequest *)v4;
}

+ (NSBatchInsertRequest)batchInsertRequestWithEntityName:(NSString *)entityName managedObjectHandler:(void *)handler
{
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEntityName:entityName managedObjectHandler:handler];

  return (NSBatchInsertRequest *)v4;
}

- (NSBatchInsertRequest)init
{
  if ((_BYTE)dword_1EB270AB8) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"-init results in undefined behavior for NSBatchInsertRequest" userInfo:0]);
  }
  uint64_t v2 = [NSString stringWithUTF8String:"-init results in undefined behavior for NSBatchInsertRequest"];
  _NSCoreDataLog(17, v2, v3, v4, v5, v6, v7, v8, v11);
  v9 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v11) = 0;
    _os_log_fault_impl(&dword_18AB82000, v9, OS_LOG_TYPE_FAULT, "CoreData: -init results in undefined behavior for NSBatchInsertRequest", (uint8_t *)&v11, 2u);
  }
  return 0;
}

- (NSBatchInsertRequest)initWithEntityName:(NSString *)entityName objects:(NSArray *)dictionaries
{
  v8.receiver = self;
  v8.super_class = (Class)NSBatchInsertRequest;
  uint64_t v6 = [(NSBatchInsertRequest *)&v8 init];
  if (v6)
  {
    if ([(NSArray *)dictionaries count])
    {
      v6->_objectsToInsert = (NSArray *)[(NSArray *)dictionaries copy];
      v6->_entity = (id)[(NSString *)entityName copy];
      v6->_flags = (_insertRequestFlags)(*(_DWORD *)&v6->_flags & 0xFFFFFFF8 | 4);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (NSBatchInsertRequest)initWithEntity:(NSEntityDescription *)entity objects:(NSArray *)dictionaries
{
  v8.receiver = self;
  v8.super_class = (Class)NSBatchInsertRequest;
  uint64_t v6 = [(NSBatchInsertRequest *)&v8 init];
  if (v6)
  {
    if ([(NSArray *)dictionaries count])
    {
      v6->_objectsToInsert = (NSArray *)[(NSArray *)dictionaries copy];
      v6->_entity = entity;
      *(_DWORD *)&v6->_flags &= 0xFFFFFFFC;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (NSBatchInsertRequest)initWithEntity:(NSEntityDescription *)entity dictionaryHandler:(void *)handler
{
  v9.receiver = self;
  v9.super_class = (Class)NSBatchInsertRequest;
  uint64_t v6 = [(NSBatchInsertRequest *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    if (handler)
    {
      v6->_insertDictionaryHandler = _Block_copy(handler);
      v7->_entity = entity;
      *(_DWORD *)&v7->_flags &= 0xFFFFFFFC;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (NSBatchInsertRequest)initWithEntity:(NSEntityDescription *)entity managedObjectHandler:(void *)handler
{
  v9.receiver = self;
  v9.super_class = (Class)NSBatchInsertRequest;
  uint64_t v6 = [(NSBatchInsertRequest *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    if (handler)
    {
      v6->_insertManagedObjectHandler = _Block_copy(handler);
      v7->_entity = entity;
      *(_DWORD *)&v7->_flags &= 0xFFFFFFFC;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (NSBatchInsertRequest)initWithEntityName:(NSString *)entityName dictionaryHandler:(void *)handler
{
  v9.receiver = self;
  v9.super_class = (Class)NSBatchInsertRequest;
  uint64_t v6 = [(NSBatchInsertRequest *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    if (handler)
    {
      v6->_insertDictionaryHandler = _Block_copy(handler);
      v7->_entity = entityName;
      v7->_flags = (_insertRequestFlags)(*(_DWORD *)&v7->_flags & 0xFFFFFFF8 | 4);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (NSBatchInsertRequest)initWithEntityName:(NSString *)entityName managedObjectHandler:(void *)handler
{
  v9.receiver = self;
  v9.super_class = (Class)NSBatchInsertRequest;
  uint64_t v6 = [(NSBatchInsertRequest *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    if (handler)
    {
      v6->_insertManagedObjectHandler = _Block_copy(handler);
      v7->_entity = entityName;
      v7->_flags = (_insertRequestFlags)(*(_DWORD *)&v7->_flags & 0xFFFFFFF8 | 4);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  self->_entity = 0;
  self->_objectsToInsert = 0;
  id insertDictionaryHandler = self->_insertDictionaryHandler;
  if (insertDictionaryHandler)
  {
    _Block_release(insertDictionaryHandler);
    self->_id insertDictionaryHandler = 0;
  }
  id insertManagedObjectHandler = self->_insertManagedObjectHandler;
  if (insertManagedObjectHandler)
  {
    _Block_release(insertManagedObjectHandler);
    self->_id insertManagedObjectHandler = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NSBatchInsertRequest;
  [(NSPersistentStoreRequest *)&v5 dealloc];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(NSBatchInsertRequest *)self entityName];
  NSBatchInsertRequestResultType v5 = [(NSBatchInsertRequest *)self resultType];
  self;
  if (v5 >= (NSBatchInsertRequestResultTypeCount|NSBatchInsertRequestResultTypeObjectIDs)) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"'%ld' is an unknown NSBatchInsertRequestResultType value", v5), 0 reason userInfo]);
  }
  uint64_t v6 = off_1E544CA48[v5];
  if (self->_objectsToInsert) {
    uint64_t v7 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%lu objects", -[NSArray count](-[NSBatchInsertRequest objectsToInsert](self, "objectsToInsert"), "count"));
  }
  else {
    uint64_t v7 = @"handler provided";
  }
  return (id)[v3 stringWithFormat:@"<NSBatchInsertRequest : entity = %@ resultType = %@ and %@>", v4, v6, v7];
}

- (NSString)entityName
{
  id result = (NSString *)self->_entity;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return (NSString *)[(NSString *)result name];
  }
  return result;
}

- (NSEntityDescription)entity
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F28778], objc_msgSend(NSString, "stringWithFormat:", @"This batch insert request (%p) was created with a string name (%@), and cannot respond to -entity until used by an NSManagedObjectContext", self, self->_entity, 0), 0 reason userInfo]);
  }
  return (NSEntityDescription *)self->_entity;
}

- (unint64_t)requestType
{
  return 5;
}

- (NSBatchInsertRequestResultType)resultType
{
  return *(_DWORD *)&self->_flags & 3;
}

- (void)setResultType:(NSBatchInsertRequestResultType)resultType
{
  self->_flags = (_insertRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFC | resultType & 3);
}

- (void)_setSecureOperation:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_flags = (_insertRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)_secureOperation
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (void)_resolveEntityWithContext:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3052000000;
    v24 = __Block_byref_object_copy__17;
    v25 = __Block_byref_object_dispose__17;
    uint64_t v26 = 0;
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
    if (v5) {
      uint64_t v5 = [*(id *)(v5 + 32) objectForKey:self->_entity];
    }
    uint64_t v26 = v5;
    if (!v22[5])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "persistentStores");
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v18 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = (void *)[*(id *)(*((void *)&v17 + 1) + 8 * i) ancillaryModels];
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __50__NSBatchInsertRequest__resolveEntityWithContext___block_invoke;
            v16[3] = &unk_1E544CA28;
            v16[4] = self;
            v16[5] = &v21;
            [v10 enumerateKeysAndObjectsUsingBlock:v16];
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v27 count:16];
        }
        while (v7);
      }
    }
    uint64_t v11 = (void *)v22[5];
    if (!v11)
    {
      v14 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v15 = [NSString stringWithFormat:@"Can't find entity for batch insert (%@)", self->_entity];
      objc_exception_throw((id)[v14 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v15 userInfo:0]);
    }
    id v12 = v11;
    id entity = self->_entity;
    self->_id entity = (id)v22[5];
    *(_DWORD *)&self->_flags &= ~4u;

    _Block_object_dispose(&v21, 8);
  }
}

uint64_t __50__NSBatchInsertRequest__resolveEntityWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a3) {
    uint64_t result = [*(id *)(a3 + 32) objectForKey:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  else {
    uint64_t result = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
  return result;
}

- (void)_resolveEntityWithSQLCore:(uint64_t)a1
{
  if (a1 && (*(unsigned char *)(a1 + 48) & 4) != 0)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3052000000;
    uint64_t v15 = __Block_byref_object_copy__17;
    v16 = __Block_byref_object_dispose__17;
    uint64_t v17 = 0;
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "persistentStoreCoordinator"), "managedObjectModel");
    if (v4) {
      uint64_t v4 = [*(id *)(v4 + 32) objectForKey:*(void *)(a1 + 16)];
    }
    uint64_t v17 = v4;
    uint64_t v5 = (void *)v13[5];
    if (!v5)
    {
      uint64_t v6 = (void *)[a2 ancillaryModels];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __50__NSBatchInsertRequest__resolveEntityWithSQLCore___block_invoke;
      v11[3] = &unk_1E544CA28;
      v11[4] = a1;
      v11[5] = &v12;
      [v6 enumerateKeysAndObjectsUsingBlock:v11];
      uint64_t v5 = (void *)v13[5];
      if (!v5)
      {
        objc_super v9 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v10 = [NSString stringWithFormat:@"Can't find entity for batch insert (%@)", *(void *)(a1 + 16)];
        objc_exception_throw((id)[v9 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v10 userInfo:0]);
      }
    }
    id v7 = v5;
    uint64_t v8 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v13[5];
    *(_DWORD *)(a1 + 48) &= ~4u;

    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __50__NSBatchInsertRequest__resolveEntityWithSQLCore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a3) {
    uint64_t result = [*(id *)(a3 + 32) objectForKey:*(void *)(*(void *)(a1 + 32) + 16)];
  }
  else {
    uint64_t result = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
  return result;
}

- (void)dictionaryHandler
{
  return self->_insertDictionaryHandler;
}

- (void)setDictionaryHandler:(void *)dictionaryHandler
{
  id insertDictionaryHandler = self->_insertDictionaryHandler;
  if (insertDictionaryHandler)
  {
    _Block_release(insertDictionaryHandler);
    self->_id insertDictionaryHandler = 0;
  }
  self->_id insertDictionaryHandler = _Block_copy(dictionaryHandler);
}

- (void)managedObjectHandler
{
  return self->_insertManagedObjectHandler;
}

- (void)setManagedObjectHandler:(void *)managedObjectHandler
{
  id insertManagedObjectHandler = self->_insertManagedObjectHandler;
  if (insertManagedObjectHandler)
  {
    _Block_release(insertManagedObjectHandler);
    self->_id insertManagedObjectHandler = 0;
  }
  self->_id insertManagedObjectHandler = _Block_copy(managedObjectHandler);
}

- (NSArray)objectsToInsert
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setObjectsToInsert:(NSArray *)objectsToInsert
{
}

@end
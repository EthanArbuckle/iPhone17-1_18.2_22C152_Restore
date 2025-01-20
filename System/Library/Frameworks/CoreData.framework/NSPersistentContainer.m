@interface NSPersistentContainer
+ (Class)persistentStoreDescriptionClass;
+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name;
+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model;
+ (NSPersistentContainer)persistentContainerWithPath:(id)a3;
+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 managedObjectModel:(id)a4;
+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 modelNamed:(id)a4;
+ (NSURL)defaultDirectoryURL;
+ (id)_newModelForName:(id)a3;
+ (id)persistentContainerUsingCachedModelWithPath:(id)a3;
- (BOOL)load:(id *)a3;
- (NSArray)persistentStoreDescriptions;
- (NSManagedObjectContext)newBackgroundContext;
- (NSManagedObjectContext)viewContext;
- (NSManagedObjectModel)managedObjectModel;
- (NSPersistentContainer)init;
- (NSPersistentContainer)initWithName:(NSString *)name;
- (NSPersistentContainer)initWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)name;
- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)loadPersistentStoresWithCompletionHandler:(void *)block;
- (void)performBackgroundTask:(void *)block;
- (void)setPersistentStoreDescriptions:(NSArray *)persistentStoreDescriptions;
@end

@implementation NSPersistentContainer

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return (NSPersistentStoreCoordinator *)objc_getProperty(self, a2, 32, 1);
}

- (NSManagedObjectContext)newBackgroundContext
{
  if (![(NSArray *)[(NSPersistentStoreCoordinator *)self->_storeCoordinator persistentStores] count])
  {
    v3 = [(NSPersistentContainer *)self name];
    _NSCoreDataLog(2, @" Background context created for persistent container %@ with no stores loaded", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  }
  v10 = [[NSManagedObjectContext alloc] initWithConcurrencyType:1];
  if ([(NSManagedObjectContext *)self->_viewContext parentContext]) {
    [(NSManagedObjectContext *)v10 setParentContext:[(NSManagedObjectContext *)self->_viewContext parentContext]];
  }
  else {
    [(NSManagedObjectContext *)v10 setPersistentStoreCoordinator:self->_storeCoordinator];
  }
  return v10;
}

- (NSManagedObjectContext)viewContext
{
  if (!self->_viewContext)
  {
    v3 = [[NSManagedObjectContext alloc] initWithConcurrencyType:2];
    -[NSManagedObjectContext _setPersistentStoreCoordinator:]((uint64_t)v3, self->_storeCoordinator);
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_viewContext, (unint64_t *)&v4, (unint64_t)v3);
    if (v4) {
  }
    }
  uint64_t v5 = self->_viewContext;

  return v5;
}

- (void)setPersistentStoreDescriptions:(NSArray *)persistentStoreDescriptions
{
  objc_sync_enter(self);
  storeDescriptions = self->_storeDescriptions;
  if (storeDescriptions != persistentStoreDescriptions)
  {

    self->_storeDescriptions = 0;
    self->_storeDescriptions = (NSArray *)[(NSArray *)persistentStoreDescriptions copy];
  }

  objc_sync_exit(self);
}

void __44__NSPersistentContainer_defaultDirectoryURL__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v29 = xmmword_18AE54A88;
  uint64_t v30 = 0;
  uint64_t v8 = &v29;
  while (1)
  {
    uint64_t v10 = *(void *)v8;
    uint64_t v8 = (long long *)((char *)v8 + 8);
    uint64_t v9 = v10;
    if (!v10)
    {
      _NSCoreDataLog(1, @" Found no possible URLs for directory type %lu", a3, a4, a5, a6, a7, a8, (uint64_t)&v29);
      return;
    }
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "URLsForDirectory:inDomains:", v9, 1);
    if ([v11 count])
    {
      v12 = (void *)[v11 objectAtIndex:0];
      if (v12) {
        break;
      }
    }
  }
  v13 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  char v28 = 0;
  char v14 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", objc_msgSend(v12, "path"), &v28);
  if (v14)
  {
    if (!v28)
    {
      _NSCoreDataLog(1, @" File %@ already exists and is not a directory!", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
      return;
    }
    goto LABEL_12;
  }
  id v27 = 0;
  if ([v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v27])
  {
LABEL_12:
    _MergedGlobals_85 = v12;
    return;
  }
  [v27 domain];
  [v27 code];
  _NSCoreDataLog(1, @" Failed to create directory %@: %@ (%d)", v21, v22, v23, v24, v25, v26, (uint64_t)v12);
}

- (BOOL)load:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  uint64_t v21 = __Block_byref_object_copy__40;
  uint64_t v22 = __Block_byref_object_dispose__40;
  uint64_t v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3020000000;
  int v17 = 0;
  int v5 = [(NSArray *)[(NSPersistentContainer *)self persistentStoreDescriptions] count];
  uint64_t v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__NSPersistentContainer_CoreDataSPI__load___block_invoke;
  v13[3] = &unk_1E544EA18;
  v13[6] = &v14;
  v13[4] = v6;
  v13[5] = &v18;
  [(NSPersistentContainer *)self loadPersistentStoresWithCompletionHandler:v13];
  while (*((_DWORD *)v15 + 10) != v5)
  {
    dispatch_time_t v7 = dispatch_time(0, 120000000000);
    dispatch_semaphore_wait(v6, v7);
    __dmb(0xBu);
  }
  dispatch_release(v6);
  id v8 = (id)v19[5];
  uint64_t v9 = v19;
  if (a3)
  {
    uint64_t v10 = (void *)v19[5];
    if (v10) {
      *a3 = v10;
    }
  }
  BOOL v11 = v9[5] == 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)loadPersistentStoresWithCompletionHandler:(void *)block
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(NSPersistentContainer *)self persistentStoreDescriptions];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v10) copy];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  [(NSPersistentContainer *)self _loadStoreDescriptions:v5 withCompletionHandler:block];
}

- (NSArray)persistentStoreDescriptions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  storeDescriptions = self->_storeDescriptions;
  if (storeDescriptions)
  {
    uint64_t v4 = storeDescriptions;
    objc_sync_exit(self);
    if (v4) {
      goto LABEL_16;
    }
  }
  else
  {
    objc_sync_exit(self);
  }
  int v5 = (void *)[(id)objc_opt_class() defaultDirectoryURL];
  if (!v5)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = NSString;
    uint64_t v10 = (objc_class *)objc_opt_class();
    BOOL v11 = NSStringFromClass(v10);
    long long v12 = (void *)[v8 exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(v9, "stringWithFormat:", @"+[%@ %@] Could not conjure up a useful location for writing persistent stores.", v11, NSStringFromSelector(sel__createDefaultStoreDescriptions)), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  uint64_t v6 = [v5 URLByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"%@.sqlite", self->_name), 0 isDirectory];
  if (v6)
  {
    *(void *)buf = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "persistentStoreDescriptionClass"), "persistentStoreDescriptionWithURL:", v6);
    uint64_t v7 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v4 = v7;
  objc_sync_enter(self);
  if (self->_storeDescriptions)
  {

    uint64_t v4 = self->_storeDescriptions;
  }
  else
  {
    long long v13 = (NSArray *)MEMORY[0x1E4F1CBF0];
    if (v4) {
      long long v13 = v4;
    }
    self->_storeDescriptions = v13;
  }
  objc_sync_exit(self);
  if (!v4) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
LABEL_16:

  return v4;
}

- (void)_loadStoreDescriptions:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![a3 count]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"-[NSPersistentContainer loadPersistentStoresWithCompletionHandler:] called on an instance with no store descriptions" userInfo:0]);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(a3);
        }
        BOOL v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v11 shouldAddStoreAsynchronously] & 1) == 0) {
          [(NSPersistentStoreCoordinator *)self->_storeCoordinator addPersistentStoreWithDescription:v11 completionHandler:a4];
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(a3);
        }
        uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        if ([v16 shouldAddStoreAsynchronously]) {
          [(NSPersistentStoreCoordinator *)self->_storeCoordinator addPersistentStoreWithDescription:v16 completionHandler:a4];
        }
      }
      uint64_t v13 = [a3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

+ (Class)persistentStoreDescriptionClass
{
  return (Class)objc_opt_class();
}

+ (NSURL)defaultDirectoryURL
{
  if (qword_1EB2707A8 != -1) {
    dispatch_once(&qword_1EB2707A8, &__block_literal_global_30);
  }
  result = (NSURL *)_MergedGlobals_85;
  if (!_MergedGlobals_85)
  {
    int v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    uint64_t v7 = NSString;
    uint64_t v8 = NSStringFromClass((Class)a1);
    uint64_t v9 = (void *)[v5 exceptionWithName:v6, objc_msgSend(v7, "stringWithFormat:", @"+[%@ %@] Could not conjure up a useful location for writing persistent stores.", v8, NSStringFromSelector(a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  return result;
}

intptr_t __43__NSPersistentContainer_CoreDataSPI__load___block_invoke(void *a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    [a3 userInfo];
    _NSCoreDataLog(1, @"Store failed to load.  %@ with error = %@ with userInfo %@", v5, v6, v7, v8, v9, v10, a2);
    *(void *)(*(void *)(a1[5] + 8) + 40) = a3;
  }
  atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 40), 1u, memory_order_relaxed);
  BOOL v11 = a1[4];

  return dispatch_semaphore_signal(v11);
}

- (NSPersistentContainer)initWithName:(NSString *)name
{
  uint64_t v5 = [(id)objc_opt_class() _newModelForName:name];
  if (v5)
  {
    uint64_t v12 = (void *)v5;
    uint64_t v13 = [(NSPersistentContainer *)self initWithName:name managedObjectModel:v5];

    return v13;
  }
  else
  {
    _NSCoreDataLog(1, @" Failed to load model named %@", v6, v7, v8, v9, v10, v11, (uint64_t)name);

    return 0;
  }
}

+ (id)_newModelForName:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v4;
  if (v5 != objc_opt_class())
  {
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (v7) {
      uint64_t v6 = (void *)v7;
    }
    else {
      uint64_t v6 = v4;
    }
  }
  id v8 = (id)[v6 URLForResource:a3 withExtension:@"momd"];
  if (v8) {
    goto LABEL_7;
  }
  id v8 = (id)[v6 URLForResource:a3 withExtension:@"mom"];
  if (v8) {
    goto LABEL_7;
  }
  if (v6 == v4) {
    return 0;
  }
  id v8 = (id)[v4 URLForResource:a3 withExtension:@"momd"];
  if (v8 || (result = (id)[v4 URLForResource:a3 withExtension:@"mom"], (id v8 = result) != 0))
  {
LABEL_7:
    id result = [[NSManagedObjectModel alloc] initWithContentsOfURL:v8];
    if (result) {
      return result;
    }
    uint64_t v10 = [v8 path];
    _NSCoreDataLog(1, @" Failed to load model at path: %@", v11, v12, v13, v14, v15, v16, v10);
    return 0;
  }
  return result;
}

- (NSPersistentContainer)initWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)NSPersistentContainer;
  uint64_t v6 = [(NSPersistentContainer *)&v28 init];
  if (v6)
  {
    if ([(NSString *)name length])
    {
      if ([(NSString *)name isEqual:[[(NSString *)name stringByStandardizingPath] lastPathComponent]])goto LABEL_7; {
      uint64_t v7 = [NSString stringWithUTF8String:"-[NSPersistentContainer initWithName:managedObjectModel:] called with invalid container name '%@'"];
      }
      _NSCoreDataLog(17, v7, v8, v9, v10, v11, v12, v13, (uint64_t)name);
      uint64_t v14 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_7;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v30 = name;
      uint64_t v15 = "CoreData: -[NSPersistentContainer initWithName:managedObjectModel:] called with invalid container name '%@'";
      uint64_t v16 = v14;
      uint32_t v17 = 12;
    }
    else
    {
      uint64_t v18 = [NSString stringWithUTF8String:"-[NSPersistentContainer initWithName:managedObjectModel:] called with the empty string as its container name"];
      _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, v27);
      uint64_t v25 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
LABEL_7:
        v6->_name = (NSString *)[(NSString *)name copy];
        v6->_storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        v6->_storeDescriptions = 0;
        return v6;
      }
      *(_WORD *)buf = 0;
      uint64_t v15 = "CoreData: -[NSPersistentContainer initWithName:managedObjectModel:] called with the empty string as its container name";
      uint64_t v16 = v25;
      uint32_t v17 = 2;
    }
    _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, v15, buf, v17);
    goto LABEL_7;
  }
  return v6;
}

- (NSManagedObjectModel)managedObjectModel
{
  v2 = [(NSPersistentStoreCoordinator *)self->_storeCoordinator managedObjectModel];

  return v2;
}

+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name
{
  v3 = (void *)[objc_alloc((Class)a1) initWithName:name];

  return (NSPersistentContainer *)v3;
}

+ (NSPersistentContainer)persistentContainerWithName:(NSString *)name managedObjectModel:(NSManagedObjectModel *)model
{
  uint64_t v4 = (void *)[objc_alloc((Class)a1) initWithName:name managedObjectModel:model];

  return (NSPersistentContainer *)v4;
}

- (NSPersistentContainer)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3A8];
  uint64_t v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = (void *)[v2 exceptionWithName:v3, objc_msgSend(v4, "stringWithFormat:", @"Failed to call designated initializer on '%@' \n", NSStringFromClass(v5)), 0 reason userInfo];
  objc_exception_throw(v6);
}

- (void)dealloc
{
  name = self->_name;
  if (name) {

  }
  viewContext = self->_viewContext;
  if (viewContext) {

  }
  storeCoordinator = self->_storeCoordinator;
  if (storeCoordinator) {

  }
  storeDescriptions = self->_storeDescriptions;
  if (storeDescriptions) {

  }
  v7.receiver = self;
  v7.super_class = (Class)NSPersistentContainer;
  [(NSPersistentContainer *)&v7 dealloc];
}

- (void)performBackgroundTask:(void *)block
{
  uint64_t v4 = [(NSPersistentContainer *)self newBackgroundContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__NSPersistentContainer_performBackgroundTask___block_invoke;
  v5[3] = &unk_1E544CA00;
  v5[4] = v4;
  v5[5] = block;
  [(NSManagedObjectContext *)v4 performBlock:v5];
}

void __47__NSPersistentContainer_performBackgroundTask___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (NSPersistentContainer)persistentContainerWithPath:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSPersistentContainer *)objc_msgSend(a1, "persistentContainerWithName:", objc_msgSend(a3, "lastPathComponent"));
  uint64_t v6 = (void *)[a1 persistentStoreDescriptionClass];
  v8[0] = objc_msgSend(v6, "persistentStoreDescriptionWithURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", a3));
  -[NSPersistentContainer setPersistentStoreDescriptions:](v5, "setPersistentStoreDescriptions:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1]);
  return v5;
}

+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 modelNamed:(id)a4
{
  uint64_t v6 = (void *)[a1 _newModelForName:a4];
  objc_super v7 = (NSPersistentContainer *)[a1 persistentContainerWithPath:a3 managedObjectModel:v6];

  return v7;
}

+ (NSPersistentContainer)persistentContainerWithPath:(id)a3 managedObjectModel:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSPersistentContainer *)objc_msgSend(a1, "persistentContainerWithName:managedObjectModel:", objc_msgSend(a3, "lastPathComponent"), a4);
  objc_super v7 = (void *)[a1 persistentStoreDescriptionClass];
  v9[0] = objc_msgSend(v7, "persistentStoreDescriptionWithURL:", objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", a3));
  -[NSPersistentContainer setPersistentStoreDescriptions:](v6, "setPersistentStoreDescriptions:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]);
  return v6;
}

+ (id)persistentContainerUsingCachedModelWithPath:(id)a3
{
  id v15 = 0;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
  id v6 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", v5, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "persistentStoreDescriptionClass"), "persistentStoreDescriptionWithURL:", v5), "options"), &v15);
  if (v6) {
    return (id)[a1 persistentContainerWithPath:a3 managedObjectModel:v6];
  }
  uint64_t v8 = (uint64_t)v15;
  [v15 userInfo];
  _NSCoreDataLog(1, @"cachedModelForPersistentStoreWithURL failed with error %@ and userInfo of %@", v9, v10, v11, v12, v13, v14, v8);
  return 0;
}

@end
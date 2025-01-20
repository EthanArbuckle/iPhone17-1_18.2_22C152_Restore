@interface HMMCoreDataCounterStorage
- (BOOL)loadPersistentStoreWithError:(id *)a3;
- (HMMCoreDataCounterStorage)initWithModelName:(id)a3 atPath:(id)a4;
- (NSManagedObjectContext)currentContext;
- (NSPersistentContainer)persistentContainer;
- (NSString)dataModelName;
- (NSString)path;
- (void)executeWithManagedObjectContext:(id)a3;
- (void)executeWithManagedObjectContextAndWait:(id)a3;
- (void)save;
@end

@implementation HMMCoreDataCounterStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_dataModelName, 0);
}

- (NSManagedObjectContext)currentContext
{
  return self->_currentContext;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)dataModelName
{
  return self->_dataModelName;
}

- (void)save
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__HMMCoreDataCounterStorage_save__block_invoke;
  v2[3] = &unk_1E69FD848;
  v2[4] = self;
  [(HMMCoreDataCounterStorage *)self executeWithManagedObjectContextAndWait:v2];
}

void __33__HMMCoreDataCounterStorage_save__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 hasChanges])
  {
    id v10 = 0;
    char v4 = [v3 save:&v10];
    id v5 = v10;
    if ((v4 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1D944E970]();
      id v7 = *(id *)(a1 + 32);
      v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v12 = v9;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_impl(&dword_1D4999000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to save context: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
}

- (void)executeWithManagedObjectContextAndWait:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMCoreDataCounterStorage *)self currentContext];
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__HMMCoreDataCounterStorage_executeWithManagedObjectContextAndWait___block_invoke;
    v9[3] = &unk_1E69FD520;
    id v10 = v5;
    id v11 = v4;
    id v6 = v5;
    id v7 = v4;
    [v6 performBlockAndWait:v9];
  }
  else
  {
    uint64_t v8 = _HMFPreconditionFailure();
    __68__HMMCoreDataCounterStorage_executeWithManagedObjectContextAndWait___block_invoke(v8);
  }
}

uint64_t __68__HMMCoreDataCounterStorage_executeWithManagedObjectContextAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)executeWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = [(HMMCoreDataCounterStorage *)self currentContext];
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__HMMCoreDataCounterStorage_executeWithManagedObjectContext___block_invoke;
    v9[3] = &unk_1E69FD520;
    id v10 = v5;
    id v11 = v4;
    id v6 = v5;
    id v7 = v4;
    [v6 performBlock:v9];
  }
  else
  {
    uint64_t v8 = _HMFPreconditionFailure();
    __61__HMMCoreDataCounterStorage_executeWithManagedObjectContext___block_invoke(v8);
  }
}

uint64_t __61__HMMCoreDataCounterStorage_executeWithManagedObjectContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)loadPersistentStoreWithError:(id *)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [(HMMCoreDataCounterStorage *)self dataModelName];
  id v7 = [v5 URLForResource:v6 withExtension:@"momd"];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v7];
  id v9 = objc_alloc(MEMORY[0x1E4F1C150]);
  id v10 = [(HMMCoreDataCounterStorage *)self dataModelName];
  id v11 = (NSPersistentContainer *)[v9 initWithName:v10 managedObjectModel:v8];
  persistentContainer = self->_persistentContainer;
  self->_persistentContainer = v11;

  __int16 v13 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", -[NSString UTF8String](self->_path, "UTF8String"), 0, 0);
  id v14 = [MEMORY[0x1E4F1C190] persistentStoreDescriptionWithURL:v13];
  v29[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  [(NSPersistentContainer *)self->_persistentContainer setPersistentStoreDescriptions:v15];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  v16 = self->_persistentContainer;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__HMMCoreDataCounterStorage_loadPersistentStoreWithError___block_invoke;
  v22[3] = &unk_1E69FD4F8;
  v22[4] = self;
  v22[5] = &v23;
  [(NSPersistentContainer *)v16 loadPersistentStoresWithCompletionHandler:v22];
  v17 = (void *)v24[5];
  if (v17)
  {
    if (a3) {
      *a3 = v17;
    }
  }
  else
  {
    v18 = [(NSPersistentContainer *)self->_persistentContainer newBackgroundContext];
    currentContext = self->_currentContext;
    self->_currentContext = v18;

    v20 = [MEMORY[0x1E4F1C130] mergeByPropertyObjectTrumpMergePolicy];
    [(NSManagedObjectContext *)self->_currentContext setMergePolicy:v20];
  }
  _Block_object_dispose(&v23, 8);

  return v17 == 0;
}

void __58__HMMCoreDataCounterStorage_loadPersistentStoreWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D944E970]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1D4999000, v9, OS_LOG_TYPE_ERROR, "%{public}@Error loading persistent store: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (HMMCoreDataCounterStorage)initWithModelName:(id)a3 atPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMMCoreDataCounterStorage;
  id v8 = [(HMMCoreDataCounterStorage *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    dataModelName = v8->_dataModelName;
    v8->_dataModelName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    path = v8->_path;
    v8->_path = (NSString *)v11;
  }
  return v8;
}

@end
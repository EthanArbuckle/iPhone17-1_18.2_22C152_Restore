@interface SLDatabase
- (BOOL)save:(id *)a3;
- (SLDatabase)initWithStoreName:(id)a3 modelPath:(id)a4;
- (id)_managedObjectModel;
- (id)_persistentStoreCoordinator;
- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4;
- (id)newObjectForEntityNamed:(id)a3;
- (void)_persistentStoreCoordinator;
- (void)_removeFilesAtURL:(id)a3 forStoreCoordinator:(id)a4;
- (void)_setUpManagedObjectContext;
@end

@implementation SLDatabase

- (SLDatabase)initWithStoreName:(id)a3 modelPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDatabase;
  v8 = [(SLDatabase *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelPath, a4);
    v10 = SLUserDataDirectory();
    uint64_t v11 = [v10 stringByAppendingPathComponent:v6];
    storePath = v9->_storePath;
    v9->_storePath = (NSString *)v11;

    [(SLDatabase *)v9 _setUpManagedObjectContext];
  }

  return v9;
}

- (id)fetchObjectsForEntityNamed:(id)a3 withPredicate:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C0A8] entityForName:a3 inManagedObjectContext:self->_managedObjectContext];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  [v8 setEntity:v7];
  if (v6) {
    [v8 setPredicate:v6];
  }
  v9 = [(NSManagedObjectContext *)self->_managedObjectContext executeFetchRequest:v8 error:0];

  return v9;
}

- (id)newObjectForEntityNamed:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)save:(id *)a3
{
  return [(NSManagedObjectContext *)self->_managedObjectContext save:a3];
}

- (void)_setUpManagedObjectContext
{
  if (!self->_managedObjectContext)
  {
    id v5 = [(SLDatabase *)self _persistentStoreCoordinator];
    if (v5)
    {
      v3 = (NSManagedObjectContext *)objc_alloc_init(MEMORY[0x1E4F1C110]);
      managedObjectContext = self->_managedObjectContext;
      self->_managedObjectContext = v3;

      [(NSManagedObjectContext *)self->_managedObjectContext setPersistentStoreCoordinator:v5];
    }
  }
}

- (id)_persistentStoreCoordinator
{
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  if (persistentStoreCoordinator)
  {
    v4 = persistentStoreCoordinator;
  }
  else
  {
    SLUserDataDirectory();
    CPFileBuildDirectoriesToPath();
    id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_storePath];
    id v7 = objc_alloc(MEMORY[0x1E4F1C188]);
    id v8 = [(SLDatabase *)self _managedObjectModel];
    v9 = (NSPersistentStoreCoordinator *)[v7 initWithManagedObjectModel:v8];
    v10 = self->_persistentStoreCoordinator;
    self->_persistentStoreCoordinator = v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
    v12 = [NSNumber numberWithBool:1];
    uint64_t v13 = *MEMORY[0x1E4F1BE50];
    objc_super v14 = [NSNumber numberWithBool:1];
    v15 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, v13, v14, *MEMORY[0x1E4F1BDE8], 0);

    [v15 setObject:*MEMORY[0x1E4F28358] forKey:*MEMORY[0x1E4F1BEC0]];
    v16 = self->_persistentStoreCoordinator;
    uint64_t v17 = *MEMORY[0x1E4F1BF70];
    id v25 = 0;
    v18 = [(NSPersistentStoreCoordinator *)v16 addPersistentStoreWithType:v17 configuration:0 URL:v6 options:v15 error:&v25];
    id v19 = v25;

    if (!v18)
    {
      v23 = [v19 userInfo];
      _SLLog(v2, 3, @"Error while opening database %@, %@\n\nCreating new database...");

      -[SLDatabase _removeFilesAtURL:forStoreCoordinator:](self, "_removeFilesAtURL:forStoreCoordinator:", v6, self->_persistentStoreCoordinator, v19, v23);
      v20 = self->_persistentStoreCoordinator;
      id v24 = 0;
      v21 = [(NSPersistentStoreCoordinator *)v20 addPersistentStoreWithType:v17 configuration:0 URL:v6 options:v15 error:&v24];
      id v19 = v24;

      if (!v21) {
        [(SLDatabase *)v19 _persistentStoreCoordinator];
      }
      _SLLog(v2, 3, @"Created new database successfully.");
    }
    v4 = self->_persistentStoreCoordinator;
  }

  return v4;
}

- (id)_managedObjectModel
{
  managedObjectModel = self->_managedObjectModel;
  if (managedObjectModel)
  {
    v3 = managedObjectModel;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_modelPath];
    id v6 = (NSManagedObjectModel *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:v5];
    id v7 = self->_managedObjectModel;
    self->_managedObjectModel = v6;

    v3 = self->_managedObjectModel;
  }

  return v3;
}

- (void)_removeFilesAtURL:(id)a3 forStoreCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C188]);
    v9 = [(SLDatabase *)self _managedObjectModel];
    id v7 = (id)[v8 initWithManagedObjectModel:v9];
  }
  uint64_t v10 = *MEMORY[0x1E4F1BF70];
  id v13 = 0;
  char v11 = [v7 _destroyPersistentStoreAtURL:v6 withType:v10 options:0 error:&v13];
  id v12 = v13;
  if ((v11 & 1) == 0) {
    -[SLDatabase _removeFilesAtURL:forStoreCoordinator:](v12);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_storePath, 0);

  objc_storeStrong((id *)&self->_modelPath, 0);
}

- (void)_persistentStoreCoordinator
{
  v3 = [a1 userInfo];
  _SLLog(a2, 3, @"Second Error while creating new database %@, %@\n\n");

  abort();
}

- (void)_removeFilesAtURL:(void *)a1 forStoreCoordinator:.cold.1(void *a1)
{
  uint64_t v2 = [a1 userInfo];
  _SLLog(v1, 3, @"Unable to recover by deleting old database! %@, %@\n\n");

  abort();
}

@end
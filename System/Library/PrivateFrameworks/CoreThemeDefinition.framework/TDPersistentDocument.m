@interface TDPersistentDocument
+ (id)_fileModificationDateForURL:(id)a3;
- (BOOL)configurePersistentStoreCoordinatorForURL:(id)a3 ofType:(id)a4 modelConfiguration:(id)a5 storeOptions:(id)a6 error:(id *)a7;
- (BOOL)readFromURL:(id)a3 ofType:(id)a4 error:(id *)a5;
- (NSString)fileType;
- (NSURL)fileURL;
- (NSURL)temporaryFileURL;
- (TDPersistentDocument)initWithContentsOfURL:(id)a3 ofType:(id)a4 error:(id *)a5;
- (TDPersistentDocument)initWithType:(id)a3 error:(id *)a4;
- (id)_persistentStoreCoordinator;
- (id)displayName;
- (id)managedObjectContext;
- (id)managedObjectModel;
- (id)persistentStoreTypeForFileType:(id)a3;
- (id)undoManager;
- (void)close;
- (void)dealloc;
- (void)saveDocument:(id)a3;
- (void)setFileType:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setTemporaryFileURL:(id)a3;
@end

@implementation TDPersistentDocument

- (id)displayName
{
  return @"BOGUS BOGUS";
}

- (id)undoManager
{
  return 0;
}

- (TDPersistentDocument)initWithContentsOfURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  v8 = [(TDPersistentDocument *)self init];
  if (v8)
  {
    v9 = (NSURL *)a3;
    v8->_fileURL = v9;
    if (![(TDPersistentDocument *)v8 readFromURL:v9 ofType:a4 error:a5])
    {

      return 0;
    }
  }
  return v8;
}

- (TDPersistentDocument)initWithType:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v6 = [(TDPersistentDocument *)self init];
  if (v6)
  {
    v6->_fileType = (NSString *)[a3 copy];
    [(NSString *)NSTemporaryDirectory() getFileSystemRepresentation:v11 maxLength:1024];
    __strcat_chk();
    int v7 = mkstemps(v11, 10);
    uint64_t v8 = [objc_alloc(NSURL) initFileURLWithFileSystemRepresentation:v11 isDirectory:0 relativeToURL:0];
    v6->_temporaryFileURL = (NSURL *)v8;
    BOOL v9 = [(TDPersistentDocument *)v6 configurePersistentStoreCoordinatorForURL:v8 ofType:a3 modelConfiguration:0 storeOptions:0 error:a4];
    close(v7);
    if (!v9)
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  self->_fileURL = 0;
  [(TDPersistentDocument *)self setManagedObjectContext:0];

  v3.receiver = self;
  v3.super_class = (Class)TDPersistentDocument;
  [(TDPersistentDocument *)&v3 dealloc];
}

- (BOOL)readFromURL:(id)a3 ofType:(id)a4 error:(id *)a5
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")))
  {
    if (objc_msgSend(-[TDPersistentDocument _persistentStoreCoordinator](self, "_persistentStoreCoordinator"), "persistentStoreForURL:", a3))
    {
      return 1;
    }
    else
    {
      return [(TDPersistentDocument *)self configurePersistentStoreCoordinatorForURL:a3 ofType:a4 modelConfiguration:0 storeOptions:0 error:a5];
    }
  }
  else if (a5)
  {
    v10 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:260 userInfo:0];
    BOOL result = 0;
    *a5 = v10;
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)saveDocument:(id)a3
{
  uint64_t v3 = 0;
  [(NSManagedObjectContext *)self->_managedObjectContext save:&v3];
}

- (id)managedObjectModel
{
  id result = self->_managedObjectModel;
  if (!result)
  {
    id result = (id)[MEMORY[0x263EFF298] mergedModelFromBundles:0];
    self->_managedObjectModel = (NSManagedObjectModel *)result;
  }
  return result;
}

- (void)setManagedObjectContext:(id)a3
{
  managedObjectContext = self->_managedObjectContext;
  if (managedObjectContext != a3)
  {

    self->_managedObjectContext = (NSManagedObjectContext *)a3;
  }
}

- (id)managedObjectContext
{
  id result = self->_managedObjectContext;
  if (!result)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF320]), "initWithManagedObjectModel:", -[TDPersistentDocument managedObjectModel](self, "managedObjectModel"));
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:2];
    [v5 setPersistentStoreCoordinator:v4];
    [(TDPersistentDocument *)self setManagedObjectContext:v5];

    return self->_managedObjectContext;
  }
  return result;
}

- (id)_persistentStoreCoordinator
{
  id v2 = [(TDPersistentDocument *)self managedObjectContext];
  if (!v2)
  {
    v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF498];
    v6 = @"Couldn't create managed object context";
    goto LABEL_6;
  }
  id result = (id)[v2 persistentStoreCoordinator];
  if (!result)
  {
    v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF498];
    v6 = @"Couldn't access persistent store coordinator";
LABEL_6:
    objc_exception_throw((id)[v4 exceptionWithName:v5 reason:v6 userInfo:0]);
  }
  return result;
}

+ (id)_fileModificationDateForURL:(id)a3
{
  v4 = 0;
  [a3 getResourceValue:&v4 forKey:*MEMORY[0x263EFF5F8] error:0];
  return v4;
}

- (void)setFileURL:(id)a3
{
  fileURL = self->_fileURL;
  if (fileURL != a3)
  {

    int v7 = (NSURL *)[a3 copy];
    self->_fileURL = v7;
    temporaryFileURL = self->_temporaryFileURL;
    if (temporaryFileURL && v7 != 0)
    {
      uint64_t v14 = 0;
      v10 = temporaryFileURL;
      [(TDPersistentDocument *)self saveDocument:0];
      v11 = objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator");
      uint64_t v12 = (void *)[v11 persistentStores];
      if ([v12 count] != 1) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDPersistentDocument.m", 174, @"-[TDPersistentDocument setFileURL:] expects exactly one persistent store.");
      }
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", 0), "options");
      if (([v11 _replacePersistentStoreAtURL:self->_fileURL destinationOptions:v13 withPersistentStoreFromURL:v10 sourceOptions:v13 storeType:*MEMORY[0x263EFF168] error:&v14] & 1) == 0)NSLog(&cfstr_Tdpersistentdo_1.isa, v10, self->_fileURL, v14); {
    }
      }
  }
}

- (void)close
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator"), "persistentStores"), "copy");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend((id)objc_msgSend(-[TDPersistentDocument managedObjectContext](self, "managedObjectContext"), "persistentStoreCoordinator"), "removePersistentStore:error:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(TDPersistentDocument *)self temporaryFileURL];
  if (v8)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", v8, 0);
    [(TDPersistentDocument *)self setTemporaryFileURL:0];
  }
}

- (BOOL)configurePersistentStoreCoordinatorForURL:(id)a3 ofType:(id)a4 modelConfiguration:(id)a5 storeOptions:(id)a6 error:(id *)a7
{
  id v22 = [(TDPersistentDocument *)self _persistentStoreCoordinator];
  long long v10 = [(TDPersistentDocument *)self fileURL];
  int v21 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", *MEMORY[0x263EFF070]), "BOOLValue");
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (a3 && v10)
  {
    uint64_t v14 = objc_msgSend(NSURL, "fileURLWithPath:", -[NSURL path](v10, "path"));
    uint64_t v15 = objc_msgSend(NSURL, "fileURLWithPath:", objc_msgSend(a3, "path"));
    uint64_t v11 = [(id)objc_opt_class() _fileModificationDateForURL:a3];
    uint64_t v12 = v14;
    uint64_t v13 = v15;
  }
  if (a6) {
    id v16 = (id)[a6 mutableCopy];
  }
  else {
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v17 = v16;
  objc_msgSend(v16, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"NSPersistentStoreRemoveStoreOnCleanup");
  [v17 setObject:&unk_26E8769E8 forKey:*MEMORY[0x263EFF160]];
  BOOL v18 = objc_msgSend(v22, "addPersistentStoreWithType:configuration:URL:options:error:", -[TDPersistentDocument persistentStoreTypeForFileType:](self, "persistentStoreTypeForFileType:", a4), a5, a3, v17, a7) != 0;

  if (v11) {
    BOOL v19 = v18;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19
    && (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fileModificationDateForURL:", v13), "isEqualToDate:", v11) & 1) == 0
    && ((v21 ^ 1) & 1) == 0)
  {
    [(TDPersistentDocument *)self setFileURL:v12];
  }
  return v18;
}

- (id)persistentStoreTypeForFileType:(id)a3
{
  return (id)*MEMORY[0x263EFF168];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
}

- (NSURL)temporaryFileURL
{
  return self->_temporaryFileURL;
}

- (void)setTemporaryFileURL:(id)a3
{
}

@end
@interface VSPersistentContainer
+ (id)directoryURL;
+ (id)legacyDirectoryURL;
+ (void)directoryURL;
- (NSManagedObjectContext)viewContext;
- (NSPersistentContainer)persistentContainer;
- (VSPersistentContainer)init;
- (VSPersistentContainer)initWithModelVersion:(int64_t)a3;
- (id)developerIdentityProviderFetchRequest;
- (id)insertDeveloperIdentityProviderInContext:(id)a3;
- (int64_t)modelVersion;
- (void)migrateContainerIfNecessary;
- (void)performBlock:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setViewContext:(id)a3;
@end

@implementation VSPersistentContainer

+ (id)legacyDirectoryURL
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v3 = [v2 URLsForDirectory:9 inDomains:1];
  v4 = [v3 firstObject];

  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];

  if (v6)
  {
    v7 = [v4 URLByAppendingPathComponent:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)directoryURL
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v3 = [v2 URLsForDirectory:5 inDomains:1];
  v4 = [v3 firstObject];

  if (!v4)
  {
    v8 = 0;
    goto LABEL_22;
  }
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];

  if (!v6)
  {
    v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[VSPersistentContainer directoryURL]();
    }
    v8 = 0;
    goto LABEL_21;
  }
  v7 = [v4 URLByAppendingPathComponent:v6];
  v8 = v7;
  if (!v7)
  {
    v10 = VSErrorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[VSPersistentContainer directoryURL]();
    }
    goto LABEL_21;
  }
  v9 = [v7 path];

  if (!v9) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [directoryURL path] parameter must not be nil."];
  }
  v10 = [v8 path];
  id v18 = 0;
  char v11 = [v2 createDirectoryAtPath:v10 withIntermediateDirectories:0 attributes:0 error:&v18];
  id v12 = v18;
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    v14 = [v12 domain];
    if ([v14 isEqual:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v15 = [v13 code];

      if (v15 == 516) {
        goto LABEL_20;
      }
    }
    else
    {
    }
    v16 = VSErrorLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[VSPersistentContainer directoryURL]();
    }
  }
LABEL_20:

LABEL_21:
LABEL_22:

  return v8;
}

- (void)migrateContainerIfNecessary
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error migrating legacy developer store: %@", v2, v3, v4, v5, v6);
}

- (VSPersistentContainer)initWithModelVersion:(int64_t)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)VSPersistentContainer;
  uint64_t v4 = [(VSPersistentContainer *)&v21 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(VSPersistentContainer *)v4 migrateContainerIfNecessary];
    v5->_modelVersion = a3;
    uint8_t v6 = objc_msgSend(MEMORY[0x1E4F1C120], "vs_developerModeModelForVersion:", a3);
    v7 = [(id)objc_opt_class() directoryURL];
    v8 = [v7 URLByAppendingPathComponent:@"DeveloperIdentityProviders.sqlite"];
    id v9 = (id)*MEMORY[0x1E4F1BF70];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1C150]) initWithName:@"Developer Identity Providers" managedObjectModel:v6];
    persistentContainer = v5->_persistentContainer;
    v5->_persistentContainer = (NSPersistentContainer *)v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1C190]);
    [v12 setURL:v8];
    [v12 setType:v9];
    [v12 setConfiguration:0];
    [v12 setShouldAddStoreAsynchronously:0];
    [v12 setShouldMigrateStoreAutomatically:1];
    [v12 setShouldInferMappingModelAutomatically:1];
    v13 = v5->_persistentContainer;
    v22[0] = v12;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [(NSPersistentContainer *)v13 setPersistentStoreDescriptions:v14];

    uint64_t v15 = VSDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1DA674000, v15, OS_LOG_TYPE_DEFAULT, "Will load persistent stores for developer identity providers.", v20, 2u);
    }

    [(NSPersistentContainer *)v5->_persistentContainer loadPersistentStoresWithCompletionHandler:&__block_literal_global_7];
    uint64_t v16 = [(NSPersistentContainer *)v5->_persistentContainer viewContext];
    viewContext = v5->_viewContext;
    v5->_viewContext = (NSManagedObjectContext *)v16;

    id v18 = [(VSPersistentContainer *)v5 viewContext];
    [v18 setMergePolicy:*MEMORY[0x1E4F1BE58]];
  }
  return v5;
}

void __46__VSPersistentContainer_initWithModelVersion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Did load persistent stores for developer identity providers.", v6, 2u);
  }

  if (v3)
  {
    uint64_t v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __46__VSPersistentContainer_initWithModelVersion___block_invoke_cold_1();
    }
  }
}

- (VSPersistentContainer)init
{
  return [(VSPersistentContainer *)self initWithModelVersion:3];
}

- (id)insertDeveloperIdentityProviderInContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[VSDeveloperIdentityProvider alloc] initWithContext:v3];

  return v4;
}

- (id)developerIdentityProviderFetchRequest
{
  return (id)+[VSDeveloperIdentityProvider fetchRequest];
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VSPersistentContainer *)self viewContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__VSPersistentContainer_performBlock___block_invoke;
  v8[3] = &unk_1E6BD2C88;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  id v7 = v4;
  [v6 performBlock:v8];
}

uint64_t __38__VSPersistentContainer_performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (int64_t)modelVersion
{
  return self->_modelVersion;
}

- (NSManagedObjectContext)viewContext
{
  return self->_viewContext;
}

- (void)setViewContext:(id)a3
{
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);

  objc_storeStrong((id *)&self->_viewContext, 0);
}

+ (void)directoryURL
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error creating container directory: %@", v2, v3, v4, v5, v6);
}

void __46__VSPersistentContainer_initWithModelVersion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error loading persistent stores: %@", v2, v3, v4, v5, v6);
}

@end
@interface DEDCloudKitBaseModel
- (CKRecord)cloudKitModel;
- (NSMutableArray)dependencies;
- (NSString)modelName;
- (OS_os_log)log;
- (id)initModelWithDictionary:(id)a3;
- (void)addDependency:(id)a3;
- (void)addReferenceForModel:(id)a3 referenceKey:(id)a4;
- (void)modelName;
- (void)setCloudKitModel:(id)a3;
- (void)setDependencies:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation DEDCloudKitBaseModel

- (id)initModelWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)DEDCloudKitBaseModel;
  v5 = [(DEDCloudKitBaseModel *)&v30 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFD7C8]);
    v7 = [(DEDCloudKitBaseModel *)v5 modelName];
    v8 = (void *)[v6 initWithRecordType:v7];
    [(DEDCloudKitBaseModel *)v5 setCloudKitModel:v8];

    v9 = +[DEDConfiguration sharedInstance];
    os_log_t v10 = os_log_create((const char *)[v9 loggingSubsystem], "ded-cloudkit-model");
    [(DEDCloudKitBaseModel *)v5 setLog:v10];

    v11 = objc_opt_new();
    [(DEDCloudKitBaseModel *)v5 setDependencies:v11];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v25 = v4;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (!v13) {
      goto LABEL_14;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
        v18 = [(DEDCloudKitBaseModel *)v5 cloudKitModel];
        uint64_t v19 = [v18 objectForKey:v17];
        if (v19)
        {
          v20 = (void *)v19;
        }
        else
        {
          v21 = [MEMORY[0x263F08708] letterCharacterSet];
          v22 = [v17 stringByTrimmingCharactersInSet:v21];
          int v23 = [v22 isEqualToString:&stru_26D197018];

          if (!v23) {
            goto LABEL_12;
          }
          v18 = [v12 objectForKeyedSubscript:v17];
          v20 = [(DEDCloudKitBaseModel *)v5 cloudKitModel];
          [v20 setObject:v18 forKeyedSubscript:v17];
        }

LABEL_12:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (!v14)
      {
LABEL_14:

        id v4 = v25;
        break;
      }
    }
  }

  return v5;
}

- (void)addReferenceForModel:(id)a3 referenceKey:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFD820];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v12 = [v8 cloudKitModel];

  os_log_t v10 = (void *)[v9 initWithRecord:v12 action:1];
  v11 = [(DEDCloudKitBaseModel *)self cloudKitModel];
  [v11 setObject:v10 forKeyedSubscript:v7];
}

- (void)addDependency:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDCloudKitBaseModel *)self dependencies];
  [v5 addObject:v4];
}

- (NSString)modelName
{
  v2 = [(DEDCloudKitBaseModel *)self log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    -[DEDCloudKitBaseModel modelName](v2);
  }

  return (NSString *)&stru_26D197018;
}

- (CKRecord)cloudKitModel
{
  return self->_cloudKitModel;
}

- (void)setCloudKitModel:(id)a3
{
}

- (NSMutableArray)dependencies
{
  return self->_dependencies;
}

- (void)setDependencies:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_cloudKitModel, 0);
}

- (void)modelName
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FE04000, log, OS_LOG_TYPE_ERROR, "No DEDCloudKitModel name is defined", v1, 2u);
}

@end
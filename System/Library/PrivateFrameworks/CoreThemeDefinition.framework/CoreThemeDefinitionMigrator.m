@interface CoreThemeDefinitionMigrator
- (BOOL)_checkDiskSpace:(id *)a3;
- (BOOL)_updateMetadata:(id *)a3;
- (BOOL)migrateWithError:(id *)a3;
- (CoreThemeDefinitionMigrator)initWithURL:(id)a3 oldVersion:(int64_t)a4 newVersion:(int64_t)a5;
- (NSString)temporaryMigrationPath;
- (id)mappingModelForMigrationWithError:(id *)a3;
- (void)dealloc;
- (void)setTemporaryMigrationPath:(id)a3;
@end

@implementation CoreThemeDefinitionMigrator

- (BOOL)_checkDiskSpace:(id *)a3
{
  v5 = (void *)[MEMORY[0x263F08850] defaultManager];
  v6 = objc_msgSend(v5, "attributesOfItemAtPath:error:", -[NSURL path](self->_documentURL, "path"), 0);
  v7 = (void *)[v6 objectForKey:*MEMORY[0x263F080B8]];
  v8 = objc_msgSend(v5, "attributesOfFileSystemForPath:error:", -[NSString stringByDeletingLastPathComponent](-[CoreThemeDefinitionMigrator temporaryMigrationPath](self, "temporaryMigrationPath"), "stringByDeletingLastPathComponent"), a3);
  if (v8)
  {
    uint64_t v9 = *MEMORY[0x263F080C8];
    objc_msgSend((id)objc_msgSend(v8, "objectForKey:", *MEMORY[0x263F080C8]), "doubleValue");
    double v11 = v10 * 0.5;
    [v7 doubleValue];
    if (v11 >= v12)
    {
      v19 = objc_msgSend((id)objc_msgSend(v5, "attributesOfFileSystemForPath:error:", -[NSURL path](self->_documentURL, "path"), 0), "objectForKey:", v9);
      unint64_t v20 = [v7 unsignedLongLongValue];
      if (v20 <= [v19 unsignedLongLongValue])
      {
        LOBYTE(v8) = 1;
        return (char)v8;
      }
      if (a3)
      {
        v21 = (void *)MEMORY[0x263F087E8];
        v22 = CoreThemeDefinitionErrorDomain[0];
        v23 = NSDictionary;
        uint64_t v24 = [NSString stringWithFormat:@"Space too tight for migration on %@'s volume", -[NSString lastPathComponent](-[NSURL path](self->_documentURL, "path"), "lastPathComponent")];
        uint64_t v15 = objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, *MEMORY[0x263F08338], 0);
        v16 = v21;
        v17 = v22;
        uint64_t v18 = 9;
        goto LABEL_8;
      }
    }
    else if (a3)
    {
      v13 = (void *)MEMORY[0x263F087E8];
      v14 = CoreThemeDefinitionErrorDomain[0];
      uint64_t v15 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Space too tight for migration on startup volume", *MEMORY[0x263F08338], 0);
      v16 = v13;
      v17 = v14;
      uint64_t v18 = 8;
LABEL_8:
      v25 = (void *)[v16 errorWithDomain:v17 code:v18 userInfo:v15];
      LOBYTE(v8) = 0;
      *a3 = v25;
      return (char)v8;
    }
    LOBYTE(v8) = 0;
  }
  return (char)v8;
}

- (BOOL)_updateMetadata:(id *)a3
{
  uint64_t v5 = objc_msgSend(NSURL, "fileURLWithPath:", -[CoreThemeDefinitionMigrator temporaryMigrationPath](self, "temporaryMigrationPath"));
  uint64_t v6 = *MEMORY[0x263EFF168];
  v7 = (void *)[MEMORY[0x263EFF320] metadataForPersistentStoreOfType:*MEMORY[0x263EFF168] URL:v5 options:0 error:a3];
  if (v7)
  {
    v8 = (void *)[v7 mutableCopy];
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_oldVersion), @"PreviousCoreThemeDefinitionDataModelKey");
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", self->_newVersion), @"CoreThemeDefinitionDataModelKey");
    id v9 = objc_alloc_init(MEMORY[0x263F08C38]);
    objc_msgSend(v8, "setObject:forKey:", objc_msgSend(v9, "UUIDString"), @"uuid");

    char v10 = [MEMORY[0x263EFF320] setMetadata:v8 forPersistentStoreOfType:v6 URL:v5 options:0 error:a3];
    LOBYTE(v7) = v10;
  }
  return (char)v7;
}

- (CoreThemeDefinitionMigrator)initWithURL:(id)a3 oldVersion:(int64_t)a4 newVersion:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)CoreThemeDefinitionMigrator;
  v8 = [(CoreThemeDefinitionMigrator *)&v19 init];
  id v9 = v8;
  if (v8)
  {
    v8->_oldVersion = a4;
    v8->_newVersion = a5;
    v8->_documentURL = (NSURL *)a3;
    char v10 = (void *)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CoreThemeDefinition"];
    uint64_t v11 = objc_msgSend(v10, "pathForResource:ofType:", +[CoreThemeDocument dataModelNameForVersion:](CoreThemeDocument, "dataModelNameForVersion:", a4), @"mom");
    uint64_t v12 = objc_msgSend(v10, "pathForResource:ofType:", +[CoreThemeDocument dataModelNameForVersion:](CoreThemeDocument, "dataModelNameForVersion:", a5), @"mom");
    v13 = (void *)v12;
    if (v11)
    {
      id v14 = objc_alloc(MEMORY[0x263EFF298]);
      uint64_t v15 = objc_msgSend(v14, "initWithContentsOfURL:", objc_msgSend(NSURL, "fileURLWithPath:", v11));
      if (!v13) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v15 = 0;
      if (!v12)
      {
LABEL_9:

        return 0;
      }
    }
    id v16 = objc_alloc(MEMORY[0x263EFF298]);
    uint64_t v17 = objc_msgSend(v16, "initWithContentsOfURL:", objc_msgSend(NSURL, "fileURLWithPath:", v13));
    v13 = (void *)v17;
    if (!v15 || !v17) {
      goto LABEL_9;
    }
    v9->_migrationManager = (NSMigrationManager *)[objc_alloc(MEMORY[0x263EFF2B8]) initWithSourceModel:v15 destinationModel:v17];

    [[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"CoreThemeDefinitionMigrationXXXXXX"] getFileSystemRepresentation:__s maxLength:1024];
    mktemp(__s);
    -[CoreThemeDefinitionMigrator setTemporaryMigrationPath:](v9, "setTemporaryMigrationPath:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "stringWithFileSystemRepresentation:length:", __s, strlen(__s)), "stringByAppendingPathExtension:", objc_msgSend(a3, "pathExtension")));
  }
  return v9;
}

- (void)dealloc
{
  [(CoreThemeDefinitionMigrator *)self setTemporaryMigrationPath:0];
  v3.receiver = self;
  v3.super_class = (Class)CoreThemeDefinitionMigrator;
  [(CoreThemeDefinitionMigrator *)&v3 dealloc];
}

- (id)mappingModelForMigrationWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263EFF2A8], "inferredMappingModelForSourceModel:destinationModel:error:", -[NSMigrationManager sourceModel](self->_migrationManager, "sourceModel"), -[NSMigrationManager destinationModel](self->_migrationManager, "destinationModel"), a3);
  id v5 = [(NSDictionary *)[(NSManagedObjectModel *)[(NSMigrationManager *)self->_migrationManager sourceModel] entitiesByName] objectForKey:@"SimpleArtworkRenditionSpec"];
  id v6 = [(NSDictionary *)[(NSManagedObjectModel *)[(NSMigrationManager *)self->_migrationManager sourceModel] entitiesByName] objectForKey:@"SimpleArtworkElementProduction"];
  id v7 = [(NSDictionary *)[(NSManagedObjectModel *)[(NSMigrationManager *)self->_migrationManager sourceModel] entitiesByName] objectForKey:@"Asset"];
  int64_t oldVersion = self->_oldVersion;
  if (oldVersion <= 21)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = (id)[v4 entityMappings];
    uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v15, "destinationEntityName"), "isEqualToString:", @"Slice"))uint64_t v12 = v15; {
          if ([(NSEntityDescription *)[(NSMigrationManager *)self->_migrationManager sourceEntityForEntityMapping:v15] isKindOfEntity:v5])
          }
          {
            uint64_t v11 = v15;
          }
          if ([(NSEntityDescription *)[(NSMigrationManager *)self->_migrationManager sourceEntityForEntityMapping:v15] isKindOfEntity:v6])
          {
            id v16 = (objc_class *)objc_opt_class();
            [v15 setEntityMigrationPolicyClassName:NSStringFromClass(v16)];
            [v15 setName:objc_msgSend(@"POH_", "stringByAppendingString:", objc_msgSend(v15, "name"))];
          }
          if ([(NSEntityDescription *)[(NSMigrationManager *)self->_migrationManager sourceEntityForEntityMapping:v15] isKindOfEntity:v7])
          {
            uint64_t v17 = (objc_class *)objc_opt_class();
            [v15 setEntityMigrationPolicyClassName:NSStringFromClass(v17)];
            [v15 setName:objc_msgSend(@"POH_", "stringByAppendingString:", objc_msgSend(v15, "name"))];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    v28 = (objc_class *)objc_opt_class();
    [v12 setEntityMigrationPolicyClassName:NSStringFromClass(v28)];
    [v12 setName:objc_msgSend(@"POH_", "stringByAppendingString:", objc_msgSend(v12, "name"))];
    v29 = (objc_class *)objc_opt_class();
    [v11 setEntityMigrationPolicyClassName:NSStringFromClass(v29)];
    [v11 setName:objc_msgSend(@"POH_", "stringByAppendingString:", objc_msgSend(v11, "name"))];
    id v26 = objc_alloc_init(MEMORY[0x263EFF2A8]);
    v4 = v26;
    id v27 = obj;
LABEL_33:
    [v26 setEntityMappings:v27];
    return v4;
  }
  if (oldVersion == 22)
  {
    uint64_t v18 = (void *)[v4 entityMappings];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          if ([(NSEntityDescription *)[(NSMigrationManager *)self->_migrationManager sourceEntityForEntityMapping:v23] isKindOfEntity:v6])
          {
            uint64_t v24 = (objc_class *)objc_opt_class();
            [v23 setEntityMigrationPolicyClassName:NSStringFromClass(v24)];
            [v23 setName:objc_msgSend(@"POH_", "stringByAppendingString:", objc_msgSend(v23, "name"))];
          }
          if ([(NSEntityDescription *)[(NSMigrationManager *)self->_migrationManager sourceEntityForEntityMapping:v23] isKindOfEntity:v7])
          {
            v25 = (objc_class *)objc_opt_class();
            [v23 setEntityMigrationPolicyClassName:NSStringFromClass(v25)];
            [v23 setName:objc_msgSend(@"POH_", "stringByAppendingString:", objc_msgSend(v23, "name"))];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v20);
    }
    id v26 = objc_alloc_init(MEMORY[0x263EFF2A8]);
    v4 = v26;
    id v27 = v18;
    goto LABEL_33;
  }
  return v4;
}

- (BOOL)migrateWithError:(id *)a3
{
  int64_t oldVersion = self->_oldVersion;
  int64_t newVersion = self->_newVersion;
  if (oldVersion == newVersion) {
    goto LABEL_2;
  }
  if (oldVersion >= newVersion)
  {
    if (a3)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", CoreThemeDefinitionErrorDomain[0], 2, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Migration code not written yet.", *MEMORY[0x263F08338], 0));
      LOBYTE(v5) = 0;
      *a3 = v10;
      return (char)v5;
    }
    goto LABEL_12;
  }
  LODWORD(v5) = [(CoreThemeDefinitionMigrator *)self _checkDiskSpace:a3];
  if (v5)
  {
    id v5 = [(CoreThemeDefinitionMigrator *)self mappingModelForMigrationWithError:a3];
    if (v5)
    {
      id v8 = v5;
      uint64_t v9 = objc_msgSend(NSURL, "fileURLWithPath:", -[CoreThemeDefinitionMigrator temporaryMigrationPath](self, "temporaryMigrationPath"));
      LODWORD(v5) = [(NSMigrationManager *)self->_migrationManager migrateStoreFromURL:self->_documentURL type:*MEMORY[0x263EFF168] options:0 withMappingModel:v8 toDestinationURL:v9 destinationType:*MEMORY[0x263EFF168] destinationOptions:0 error:a3];
      if (v5)
      {
        if ([(CoreThemeDefinitionMigrator *)self _updateMetadata:a3])
        {
LABEL_2:
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        uint64_t v12 = 0;
        if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", v9, &v12) & 1) == 0) {
          NSLog(&cfstr_FailedToRemove.isa, v9, v12);
        }
LABEL_12:
        LOBYTE(v5) = 0;
      }
    }
  }
  return (char)v5;
}

- (NSString)temporaryMigrationPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTemporaryMigrationPath:(id)a3
{
}

@end
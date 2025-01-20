@interface _KSFileDirectory
+ (BOOL)supportsSecureCoding;
- (NSArray)contents;
- (_KSFileDirectory)initWithCoder:(id)a3;
- (_KSFileDirectory)initWithDirectory:(id)a3 captureContents:(BOOL)a4 storeRoot:(BOOL)a5;
- (_KSFileDirectory)initWithName:(id)a3;
- (id)description;
- (id)entryForName:(id)a3;
- (id)findEntryWithComparison:(id)a3 recursively:(BOOL)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addEntry:(id)a3;
- (void)consistencyCheck;
- (void)encodeWithCoder:(id)a3;
- (void)performOnEverything:(id)a3;
- (void)removeEntryWithName:(id)a3;
- (void)restoreToPath:(id)a3;
@end

@implementation _KSFileDirectory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_KSFileDirectory)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_KSFileDirectory;
  v5 = [(_KSFileEntry *)&v15 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"contents"];
    uint64_t v12 = [v11 mutableCopy];
    contents = v5->_contents;
    v5->_contents = (NSMutableDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_KSFileDirectory;
  id v4 = a3;
  [(_KSFileEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contents, @"contents", v5.receiver, v5.super_class);
}

- (_KSFileDirectory)initWithName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_KSFileDirectory;
  v3 = [(_KSFileEntry *)&v7 initWithName:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    contents = v3->_contents;
    v3->_contents = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (_KSFileDirectory)initWithDirectory:(id)a3 captureContents:(BOOL)a4 storeRoot:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v5)
  {
    v10 = [v8 lastPathComponent];
  }
  else
  {
    v10 = &stru_26DE8B7B0;
  }
  v25.receiver = self;
  v25.super_class = (Class)_KSFileDirectory;
  v11 = [(_KSFileEntry *)&v25 initWithName:v10];
  if (v5) {

  }
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    contents = v11->_contents;
    v11->_contents = (NSMutableDictionary *)v12;

    [(_KSFileEntry *)v11 loadAttributesFromURL:v9];
    if (v6)
    {
      id v14 = v9;
      objc_super v15 = opendir((const char *)[v14 fileSystemRepresentation]);
      if (v15)
      {
        v16 = v15;
        v17 = readdir(v15);
        if (v17)
        {
          v18 = v17;
          while (1)
          {
            if (!strcmp(v18->d_name, ".") || !strcmp(v18->d_name, "..")) {
              goto LABEL_19;
            }
            v19 = [NSString stringWithUTF8String:v18->d_name];
            v20 = [v14 URLByAppendingPathComponent:v19];

            int d_type = v18->d_type;
            if (d_type == 8) {
              break;
            }
            if (d_type == 4)
            {
              v22 = [[_KSFileDirectory alloc] initWithDirectory:v20 captureContents:1 storeRoot:1];
LABEL_17:
              v23 = v22;
              [(_KSFileDirectory *)v11 addEntry:v22];
            }
LABEL_19:
            v18 = readdir(v16);
            if (!v18) {
              goto LABEL_20;
            }
          }
          v22 = [[_KSFileFile alloc] initWithURL:v20];
          goto LABEL_17;
        }
LABEL_20:
        closedir(v16);
      }
    }
  }

  return v11;
}

- (void)addEntry:(id)a3
{
  contents = self->_contents;
  id v4 = a3;
  id v5 = [v4 name];
  [(NSMutableDictionary *)contents setObject:v4 forKey:v5];
}

- (void)removeEntryWithName:(id)a3
{
}

- (id)entryForName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_contents objectForKey:a3];
}

- (NSArray)contents
{
  return (NSArray *)[(NSMutableDictionary *)self->_contents allKeys];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(NSMutableDictionary *)self->_contents allValues];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void)performOnEverything:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_KSFileDirectory;
  [(_KSFileEntry *)&v14 performOnEverything:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self;
  uint64_t v6 = [(_KSFileDirectory *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "performOnEverything:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(_KSFileDirectory *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_KSFileDirectory;
  id v4 = [(_KSFileEntry *)&v7 description];
  id v5 = [v3 stringWithFormat:@"<%@; %@>", v4, self->_contents];

  return v5;
}

- (void)consistencyCheck
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)_KSFileDirectory;
  [(_KSFileEntry *)&v12 consistencyCheck];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(NSMutableDictionary *)self->_contents allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) consistencyCheck];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)restoreToPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(_KSFileEntry *)self name];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(_KSFileEntry *)self name],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:&stru_26DE8B7B0],
        v7,
        v6,
        !v8))
  {
    objc_super v15 = [(_KSFileEntry *)self name];
    id v9 = [v4 URLByAppendingPathComponent:v15];

    if (([v9 checkResourceIsReachableAndReturnError:0] & 1) == 0)
    {
      id v9 = v9;
      mkdir((const char *)[v9 fileSystemRepresentation], 0x1EDu);
    }
  }
  else
  {
    id v9 = v4;
  }
  [(_KSFileEntry *)self saveAttributesToURL:v9];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v10 = [(NSMutableDictionary *)self->_contents allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v14++) restoreToPath:v9];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (id)findEntryWithComparison:(id)a3 recursively:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t (**)(id, void *))a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = self;
  uint64_t v8 = [(_KSFileDirectory *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "name", (void)v18);
        int v14 = v6[2](v6, v13);

        if (v14)
        {
          id v15 = v12;
LABEL_14:
          long long v16 = v15;
          goto LABEL_15;
        }
        if (v4)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [v12 findEntryWithComparison:v6 recursively:1];
            if (v15) {
              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v9 = [(_KSFileDirectory *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  long long v16 = 0;
LABEL_15:

  return v16;
}

- (void).cxx_destruct
{
}

@end
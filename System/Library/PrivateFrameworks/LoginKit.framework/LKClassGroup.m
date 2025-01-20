@interface LKClassGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLKClassGroup:(id)a3;
- (LKClassGroup)initWithClassGroupDictionary:(id)a3 classesDictionaryByClassID:(id)a4;
- (LKClassGroup)initWithCoder:(id)a3;
- (LKClassGroup)initWithGroupName:(id)a3 classes:(id)a4;
- (NSArray)classes;
- (NSString)classGroupName;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LKClassGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKClassGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LKClassGroup;
  v5 = [(LKClassGroup *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classGroupName"];
    classGroupName = v5->_classGroupName;
    v5->_classGroupName = (NSString *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"classes"];
    classes = v5->_classes;
    v5->_classes = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  classGroupName = self->_classGroupName;
  id v5 = a3;
  [v5 encodeObject:classGroupName forKey:@"classGroupName"];
  [v5 encodeObject:self->_classes forKey:@"classes"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LKClassGroup *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(LKClassGroup *)self isEqualToLKClassGroup:v5];

  return v6;
}

- (BOOL)isEqualToLKClassGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(LKClassGroup *)self classGroupName];
  BOOL v6 = [v4 classGroupName];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = [(LKClassGroup *)self classes];
    uint64_t v9 = [v4 classes];
    char v10 = [v8 isEqualToArray:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (LKClassGroup)initWithGroupName:(id)a3 classes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LKClassGroup;
  uint64_t v9 = [(LKClassGroup *)&v12 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_classGroupName, a3);
    objc_storeStrong((id *)&v10->_classes, a4);
  }

  return v10;
}

- (LKClassGroup)initWithClassGroupDictionary:(id)a3 classesDictionaryByClassID:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  LKRegisterLoginKitLogging();
  v30.receiver = self;
  v30.super_class = (Class)LKClassGroup;
  id v8 = [(LKClassGroup *)&v30 init];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKey:@"Name"];
    classGroupName = v8->_classGroupName;
    v24 = v8;
    v8->_classGroupName = (NSString *)v9;

    uint64_t v11 = (NSArray *)objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v6;
    objc_super v12 = [v6 objectForKeyedSubscript:@"GroupBeaconIDs"];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (!v13) {
      goto LABEL_14;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v18 = objc_msgSend(v7, "objectForKey:", v17, v24);
        if (v18)
        {
          v19 = [v7 objectForKey:v17];
          [(NSArray *)v11 addObject:v19];
        }
        else
        {
          v20 = (void *)LKLogParsing;
          if (!os_log_type_enabled((os_log_t)LKLogParsing, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_12;
          }
          v19 = v20;
          v21 = [v17 stringValue];
          *(_DWORD *)buf = 138412290;
          v32 = v21;
          _os_log_impl(&dword_2221A9000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring the classID %@ because there is no class with that id.", buf, 0xCu);
        }
LABEL_12:
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (!v14)
      {
LABEL_14:

        id v8 = v24;
        classes = v24->_classes;
        v24->_classes = v11;

        id v6 = v25;
        break;
      }
    }
  }

  return v8;
}

- (NSString)classGroupName
{
  return self->_classGroupName;
}

- (NSArray)classes
{
  return self->_classes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_classGroupName, 0);
}

@end
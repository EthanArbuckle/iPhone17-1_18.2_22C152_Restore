@interface BMDSLMultiKeyPathsTransform
+ (BOOL)supportsSecureCoding;
+ (id)withKeyPaths:(id)a3;
- (BMDSLMultiKeyPathsTransform)initWithCoder:(id)a3;
- (BMDSLMultiKeyPathsTransform)initWithKeyPaths:(id)a3;
- (BMDSLMultiKeyPathsTransform)initWithKeyPaths:(id)a3 name:(id)a4 version:(unsigned int)a5;
- (NSArray)keyPaths;
- (id)transformInput:(id)a3 combinedState:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLMultiKeyPathsTransform

- (BMDSLMultiKeyPathsTransform)initWithKeyPaths:(id)a3 name:(id)a4 version:(unsigned int)a5
{
  id v8 = a3;
  if (a5 == 1)
  {
    v15.receiver = self;
    v15.super_class = (Class)BMDSLMultiKeyPathsTransform;
    v9 = [(BMDSLBaseCodable *)&v15 initWithName:a4 version:1];
    if (v9)
    {
      uint64_t v10 = [v8 copy];
      keyPaths = v9->_keyPaths;
      v9->_keyPaths = (NSArray *)v10;
    }
    self = v9;
    v12 = self;
  }
  else
  {
    v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMDSLKeyPathTransform initWithKeyPath:name:version:](a5, v13);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)withKeyPaths:(id)a3
{
  id v3 = a3;
  v4 = [[BMDSLMultiKeyPathsTransform alloc] initWithKeyPaths:v3];

  return v4;
}

- (BMDSLMultiKeyPathsTransform)initWithKeyPaths:(id)a3
{
  return [(BMDSLMultiKeyPathsTransform *)self initWithKeyPaths:a3 name:@"multiKeyPaths" version:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BMDSLMultiKeyPathsTransform;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v6 encodeWithCoder:v4];
  v5 = [(BMDSLMultiKeyPathsTransform *)self keyPaths];
  [v4 encodeObject:v5 forKey:@"keyPaths"];
}

- (BMDSLMultiKeyPathsTransform)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLMultiKeyPathsTransform;
  v5 = [(BMDSLBaseCodable *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"keyPaths"];

    uint64_t v10 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLMultiKeyPathsTransform *)v5 initWithKeyPaths:v9 name:v10 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = [(BMDSLMultiKeyPathsTransform *)self keyPaths];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_super v15 = BMDSLValueForKeyPath(v7, v14);
        if (v15)
        {
          [v8 setObject:v15 forKeyedSubscript:v14];
        }
        else
        {
          v16 = BMDSLValueForKeyPath(v6, v14);
          if (v16) {
            [v8 setObject:v16 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (void).cxx_destruct
{
}

@end
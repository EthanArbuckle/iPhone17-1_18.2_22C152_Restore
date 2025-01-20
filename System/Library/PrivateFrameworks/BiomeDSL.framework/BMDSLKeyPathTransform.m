@interface BMDSLKeyPathTransform
+ (BOOL)supportsSecureCoding;
+ (id)withKeyPath:(id)a3;
- (BMDSLKeyPathTransform)initWithCoder:(id)a3;
- (BMDSLKeyPathTransform)initWithKeyPath:(id)a3;
- (BMDSLKeyPathTransform)initWithKeyPath:(id)a3 name:(id)a4 version:(unsigned int)a5;
- (NSString)keyPath;
- (id)transformInput:(id)a3 combinedState:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLKeyPathTransform

- (BMDSLKeyPathTransform)initWithKeyPath:(id)a3 name:(id)a4 version:(unsigned int)a5
{
  id v8 = a3;
  if (a5 == 1)
  {
    v15.receiver = self;
    v15.super_class = (Class)BMDSLKeyPathTransform;
    v9 = [(BMDSLBaseCodable *)&v15 initWithName:a4 version:1];
    if (v9)
    {
      uint64_t v10 = [v8 copy];
      keyPath = v9->_keyPath;
      v9->_keyPath = (NSString *)v10;
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

+ (id)withKeyPath:(id)a3
{
  id v3 = a3;
  v4 = [[BMDSLKeyPathTransform alloc] initWithKeyPath:v3];

  return v4;
}

- (BMDSLKeyPathTransform)initWithKeyPath:(id)a3
{
  return [(BMDSLKeyPathTransform *)self initWithKeyPath:a3 name:@"keyPath" version:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BMDSLKeyPathTransform;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v6 encodeWithCoder:v4];
  v5 = [(BMDSLKeyPathTransform *)self keyPath];
  [v4 encodeObject:v5 forKey:@"keyPath"];
}

- (BMDSLKeyPathTransform)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDSLKeyPathTransform;
  v5 = [(BMDSLBaseCodable *)&v9 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyPath"];
    v7 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLKeyPathTransform *)v5 initWithKeyPath:v6 name:v7 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BMDSLKeyPathTransform *)self keyPath];
  objc_super v9 = BMDSLValueForKeyPath(v7, v8);

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v11 = [(BMDSLKeyPathTransform *)self keyPath];
    BMDSLValueForKeyPath(v6, v11);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
}

- (void)initWithKeyPath:(int)a1 name:(NSObject *)a2 version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B3086000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLKeyPathTransform", (uint8_t *)v2, 8u);
}

@end
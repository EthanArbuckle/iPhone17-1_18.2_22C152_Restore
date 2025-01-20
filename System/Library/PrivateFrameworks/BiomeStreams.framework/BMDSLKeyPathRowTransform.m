@interface BMDSLKeyPathRowTransform
+ (BOOL)supportsSecureCoding;
- (BMDSLKeyPathRowTransform)initWithCoder:(id)a3;
- (BMDSLKeyPathRowTransform)initWithKeyPaths:(id)a3 columnNames:(id)a4;
- (BMDSLKeyPathRowTransform)initWithKeyPaths:(id)a3 columnNames:(id)a4 name:(id)a5 version:(unsigned int)a6;
- (NSArray)columnNames;
- (NSArray)keyPaths;
- (id)rowFromInput:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setColumnNames:(id)a3;
- (void)setKeyPaths:(id)a3;
@end

@implementation BMDSLKeyPathRowTransform

- (BMDSLKeyPathRowTransform)initWithKeyPaths:(id)a3 columnNames:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  if (a6 == 1)
  {
    v18.receiver = self;
    v18.super_class = (Class)BMDSLKeyPathRowTransform;
    v13 = [(BMDSLBaseCodable *)&v18 initWithName:a5 version:1];
    p_isa = (id *)&v13->super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_keyPaths, a3);
      objc_storeStrong(p_isa + 4, a4);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BMDSLKeyPathRowTransform initWithKeyPaths:columnNames:name:version:](a6, v16);
    }

    v15 = 0;
  }

  return v15;
}

- (BMDSLKeyPathRowTransform)initWithKeyPaths:(id)a3 columnNames:(id)a4
{
  return [(BMDSLKeyPathRowTransform *)self initWithKeyPaths:a3 columnNames:a4 name:@"keyPathRowTransform" version:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BMDSLKeyPathRowTransform;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v7 encodeWithCoder:v4];
  v5 = [(BMDSLKeyPathRowTransform *)self keyPaths];
  [v4 encodeObject:v5 forKey:@"keyPaths"];

  v6 = [(BMDSLKeyPathRowTransform *)self columnNames];
  [v4 encodeObject:v6 forKey:@"columnNames"];
}

- (BMDSLKeyPathRowTransform)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMDSLKeyPathRowTransform;
  v5 = [(BMDSLBaseCodable *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"keyPaths"];
    v10 = [v4 decodeObjectOfClasses:v8 forKey:@"columnNames"];
    id v11 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLKeyPathRowTransform *)v5 initWithKeyPaths:v9 columnNames:v10 name:v11 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (id)rowFromInput:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4FA50];
  id v5 = a3;
  v6 = [(BMDSLKeyPathRowTransform *)self keyPaths];
  uint64_t v7 = [v4 withKeyPaths:v6];

  v8 = [MEMORY[0x1E4F4FA18] withSelector:v7];
  v9 = [v8 transformInput:v5 combinedState:0];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F4FA80]) initWithValues:v9];

  return v10;
}

- (NSArray)keyPaths
{
  return self->_keyPaths;
}

- (void)setKeyPaths:(id)a3
{
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);

  objc_storeStrong((id *)&self->_keyPaths, 0);
}

- (void)initWithKeyPaths:(int)a1 columnNames:(NSObject *)a2 name:version:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLKeyPathRowTransform", (uint8_t *)v2, 8u);
}

@end
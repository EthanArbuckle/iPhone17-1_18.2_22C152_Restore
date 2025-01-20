@interface BMDSLTableTransform
+ (BOOL)supportsSecureCoding;
- (BMDSLRowTransform)rowTransform;
- (BMDSLTableTransform)initWithCoder:(id)a3;
- (BMDSLTableTransform)initWithRowTransform:(id)a3 schema:(id)a4 tableName:(id)a5;
- (BMDSLTableTransform)initWithRowTransform:(id)a3 schema:(id)a4 tableName:(id)a5 name:(id)a6 version:(unsigned int)a7;
- (BMTableSchema)schema;
- (NSString)tableName;
- (void)encodeWithCoder:(id)a3;
- (void)setRowTransform:(id)a3;
- (void)setSchema:(id)a3;
@end

@implementation BMDSLTableTransform

- (BMDSLTableTransform)initWithRowTransform:(id)a3 schema:(id)a4 tableName:(id)a5 name:(id)a6 version:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)BMDSLTableTransform;
  v16 = [(BMDSLBaseCodable *)&v21 initWithName:a6 version:v7];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_rowTransform, a3);
    objc_storeStrong((id *)&v17->_schema, a4);
    uint64_t v18 = [v15 copy];
    tableName = v17->_tableName;
    v17->_tableName = (NSString *)v18;
  }
  return v17;
}

- (BMDSLTableTransform)initWithRowTransform:(id)a3 schema:(id)a4 tableName:(id)a5
{
  return [(BMDSLTableTransform *)self initWithRowTransform:a3 schema:a4 tableName:a5 name:@"tableTransform" version:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BMDSLTableTransform;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v8 encodeWithCoder:v4];
  v5 = [(BMDSLTableTransform *)self rowTransform];
  [v4 encodeObject:v5 forKey:@"rowTransform"];

  v6 = [(BMDSLTableTransform *)self schema];
  [v4 encodeObject:v6 forKey:@"schema"];

  uint64_t v7 = [(BMDSLTableTransform *)self tableName];
  [v4 encodeObject:v7 forKey:@"tableName"];
}

- (BMDSLTableTransform)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLTableTransform;
  v5 = [(BMDSLBaseCodable *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F4FA28] allowed];
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"rowTransform"];

    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schema"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tableName"];
    v10 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLTableTransform *)v5 initWithRowTransform:v7 schema:v8 tableName:v9 name:v10 version:[(BMDSLBaseCodable *)v5 version]];
  }
  return v5;
}

- (BMDSLRowTransform)rowTransform
{
  return self->_rowTransform;
}

- (void)setRowTransform:(id)a3
{
}

- (BMTableSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_schema, 0);

  objc_storeStrong((id *)&self->_rowTransform, 0);
}

@end
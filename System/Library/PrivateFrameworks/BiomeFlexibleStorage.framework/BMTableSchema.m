@interface BMTableSchema
+ (BOOL)supportsSecureCoding;
- (BMTableSchema)initWithCoder:(id)a3;
- (BMTableSchema)initWithColumnNames:(id)a3;
- (NSArray)columnNames;
- (void)encodeWithCoder:(id)a3;
- (void)setColumnNames:(id)a3;
@end

@implementation BMTableSchema

- (BMTableSchema)initWithColumnNames:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMTableSchema;
  v6 = [(BMTableSchema *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_columnNames, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMTableSchema *)self columnNames];
  [v4 encodeObject:v5 forKey:@"columns"];
}

- (BMTableSchema)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"columns"];

  objc_super v9 = [(BMTableSchema *)self initWithColumnNames:v8];
  return v9;
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
}

@end
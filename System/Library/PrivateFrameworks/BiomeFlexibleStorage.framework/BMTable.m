@interface BMTable
- (BMTable)initWithRows:(id)a3 schema:(id)a4;
- (BMTableSchema)schema;
- (NSArray)rows;
- (id)description;
- (void)setRows:(id)a3;
- (void)setSchema:(id)a3;
@end

@implementation BMTable

- (BMTable)initWithRows:(id)a3 schema:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMTable;
  v8 = [(BMTable *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    rows = v8->_rows;
    v8->_rows = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_schema, a4);
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(BMTable *)self schema];
  v5 = [(BMTable *)self rows];
  id v6 = [v3 stringWithFormat:@"Schema: %@  | Rows: %@", v4, v5];

  return v6;
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (BMTableSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
@interface EFSQLIndexedColumnSchema
- (EFSQLExpressable)expression;
- (EFSQLIndexedColumnSchema)initWithColumnName:(id)a3;
- (EFSQLIndexedColumnSchema)initWithColumnName:(id)a3 collation:(unint64_t)a4 orderDirection:(unint64_t)a5;
- (EFSQLIndexedColumnSchema)initWithColumnName:(id)a3 orderDirection:(unint64_t)a4;
- (EFSQLIndexedColumnSchema)initWithExpression:(id)a3;
- (EFSQLIndexedColumnSchema)initWithExpression:(id)a3 collation:(unint64_t)a4 orderDirection:(unint64_t)a5;
- (EFSQLIndexedColumnSchema)initWithExpression:(id)a3 orderDirection:(unint64_t)a4;
- (NSString)definition;
- (NSString)name;
- (unint64_t)collation;
- (unint64_t)orderDirection;
@end

@implementation EFSQLIndexedColumnSchema

- (EFSQLIndexedColumnSchema)initWithExpression:(id)a3 collation:(unint64_t)a4 orderDirection:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EFSQLIndexedColumnSchema;
  v10 = [(EFSQLIndexedColumnSchema *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_expression, a3);
    v11->_collation = a4;
    v11->_orderDirection = a5;
  }

  return v11;
}

- (EFSQLIndexedColumnSchema)initWithExpression:(id)a3 orderDirection:(unint64_t)a4
{
  return [(EFSQLIndexedColumnSchema *)self initWithExpression:a3 collation:0 orderDirection:a4];
}

- (EFSQLIndexedColumnSchema)initWithExpression:(id)a3
{
  return [(EFSQLIndexedColumnSchema *)self initWithExpression:a3 orderDirection:0];
}

- (EFSQLIndexedColumnSchema)initWithColumnName:(id)a3 collation:(unint64_t)a4 orderDirection:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [[EFSQLColumnExpression alloc] initWithName:v8];
  v10 = [(EFSQLIndexedColumnSchema *)self initWithExpression:v9 collation:a4 orderDirection:a5];

  return v10;
}

- (EFSQLIndexedColumnSchema)initWithColumnName:(id)a3 orderDirection:(unint64_t)a4
{
  return [(EFSQLIndexedColumnSchema *)self initWithColumnName:a3 collation:0 orderDirection:a4];
}

- (EFSQLIndexedColumnSchema)initWithColumnName:(id)a3
{
  return [(EFSQLIndexedColumnSchema *)self initWithColumnName:a3 orderDirection:0];
}

- (NSString)name
{
  v2 = [(EFSQLIndexedColumnSchema *)self expression];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 name];
  }
  else
  {
    if (name_onceToken != -1) {
      dispatch_once(&name_onceToken, &__block_literal_global_32);
    }
    v4 = objc_msgSend(v2, "ef_SQLExpression");
    v3 = objc_msgSend(v4, "ef_stringByRemovingCharactersInSet:", name_sInvalidCharacters);
  }
  v5 = [v3 lowercaseString];

  return (NSString *)v5;
}

void __32__EFSQLIndexedColumnSchema_name__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F28B88], "ef_asciiAlphaNumericCharacterSet");
  id v3 = (id)[v0 mutableCopy];

  [v3 addCharactersInString:@"_"];
  uint64_t v1 = [v3 invertedSet];
  v2 = (void *)name_sInvalidCharacters;
  name_sInvalidCharacters = v1;
}

- (NSString)definition
{
  id v3 = [(EFSQLIndexedColumnSchema *)self collation];
  if (v3)
  {
    id v4 = [NSString alloc];
    v5 = EFSQLStringForCollation((uint64_t)v3);
    uint64_t v6 = [v4 initWithFormat:@" %@", v5];

    id v3 = (__CFString *)v6;
  }
  uint64_t v7 = [(EFSQLIndexedColumnSchema *)self orderDirection];
  if (v7)
  {
    id v8 = [NSString alloc];
    id v9 = EFSQLStringForOrderDirection(v7);
    v10 = (__CFString *)[v8 initWithFormat:@" %@", v9];
  }
  else
  {
    v10 = 0;
  }
  id v11 = [NSString alloc];
  v12 = [(EFSQLIndexedColumnSchema *)self expression];
  uint64_t v13 = objc_msgSend(v12, "ef_SQLExpression");
  v14 = (void *)v13;
  v15 = &stru_1F0EAE5A8;
  if (v3) {
    v16 = v3;
  }
  else {
    v16 = &stru_1F0EAE5A8;
  }
  if (v10) {
    v15 = v10;
  }
  v17 = (void *)[v11 initWithFormat:@"%@%@%@", v13, v16, v15];

  return (NSString *)v17;
}

- (EFSQLExpressable)expression
{
  return self->_expression;
}

- (unint64_t)collation
{
  return self->_collation;
}

- (unint64_t)orderDirection
{
  return self->_orderDirection;
}

- (void).cxx_destruct
{
}

@end
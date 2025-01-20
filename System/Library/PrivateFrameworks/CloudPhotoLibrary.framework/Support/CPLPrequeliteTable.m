@interface CPLPrequeliteTable
+ (CPLPrequeliteTable)tableWithName:(id)a3;
- (CPLPrequeliteTable)initWithName:(id)a3;
- (NSData)sql;
- (NSString)description;
- (NSString)injectedTableName;
- (NSString)tableName;
- (id)redactedDescription;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation CPLPrequeliteTable

+ (CPLPrequeliteTable)tableWithName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithName:v4];

  return (CPLPrequeliteTable *)v5;
}

- (CPLPrequeliteTable)initWithName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLPrequeliteTable;
  id v5 = [(CPLPrequeliteTable *)&v11 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    tableName = v5->_tableName;
    v5->_tableName = v6;

    uint64_t v8 = +[PQLNameInjection nameWithString:v4];
    injection = v5->_injection;
    v5->_injection = (PQLNameInjection *)v8;
  }
  return v5;
}

- (NSData)sql
{
  return (NSData *)[(PQLNameInjection *)self->_injection sql];
}

- (NSString)injectedTableName
{
  injectedTableName = self->_injectedTableName;
  if (!injectedTableName)
  {
    id v4 = objc_alloc((Class)NSString);
    id v5 = [(PQLNameInjection *)self->_injection sql];
    v6 = (NSString *)[v4 initWithData:v5 encoding:4];
    v7 = self->_injectedTableName;
    self->_injectedTableName = v6;

    injectedTableName = self->_injectedTableName;
  }
  return injectedTableName;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return [(PQLNameInjection *)self->_injection bindWithStatement:a3 startingAtIndex:*(void *)&a4];
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<SQLTable %@>", self->_tableName];
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:@"<SQLTable %@>", self->_tableName];
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injection, 0);
  objc_storeStrong((id *)&self->_injectedTableName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
}

@end
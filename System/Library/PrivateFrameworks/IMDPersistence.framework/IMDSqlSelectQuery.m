@interface IMDSqlSelectQuery
+ (id)selectQueryForTable:(id)a3;
+ (id)selectQueryForTable:(id)a3 withColumns:(id)a4;
+ (id)selectQueryForTable:(id)a3 withColumns:(id)a4 where:(id)a5;
- (IMDSqlSelectQuery)initWithTableName:(id)a3;
- (id)createQueryString;
@end

@implementation IMDSqlSelectQuery

- (IMDSqlSelectQuery)initWithTableName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMDSqlSelectQuery;
  v3 = [(IMDSqlQuery *)&v6 initWithTableName:a3];
  v4 = v3;
  if (v3) {
    [(IMDSqlQuery *)v3 setColumns:@"*"];
  }
  return v4;
}

- (id)createQueryString
{
  v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"SELECT %@ FROM %@", -[IMDSqlQuery columns](self, "columns"), -[IMDSqlQuery tableName](self, "tableName")];
  v4 = [(IMDSqlQuery *)self where];
  if (v4) {
    [v3 appendFormat:@" WHERE %@", v4];
  }
  if ([(IMDSqlQuery *)self limit]) {
    objc_msgSend(v3, "appendFormat:", @" LIMIT %lld", -[IMDSqlQuery limit](self, "limit"));
  }
  [v3 appendString:@";"];
  return v3;
}

+ (id)selectQueryForTable:(id)a3
{
  return (id)MEMORY[0x1F4181798](a1, sel_databaseQuery_);
}

+ (id)selectQueryForTable:(id)a3 withColumns:(id)a4
{
  v5 = (void *)[a1 selectQueryForTable:a3];
  [v5 setColumns:a4];
  return v5;
}

+ (id)selectQueryForTable:(id)a3 withColumns:(id)a4 where:(id)a5
{
  v7 = (void *)[a1 selectQueryForTable:a3];
  [v7 setColumns:a4];
  [v7 setWhere:a5];
  return v7;
}

@end
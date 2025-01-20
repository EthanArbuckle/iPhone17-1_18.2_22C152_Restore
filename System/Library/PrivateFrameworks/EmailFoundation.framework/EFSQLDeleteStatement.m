@interface EFSQLDeleteStatement
- (EFSQLDeleteStatement)initWithTable:(id)a3;
- (EFSQLDeleteStatement)initWithTable:(id)a3 where:(id)a4;
- (EFSQLValueExpressable)where;
- (NSString)queryString;
- (unint64_t)limit;
- (void)orderBy:(id)a3 ascending:(BOOL)a4;
- (void)orderByColumn:(id)a3 ascending:(BOOL)a4;
- (void)setLimit:(unint64_t)a3;
- (void)setWhere:(id)a3;
@end

@implementation EFSQLDeleteStatement

- (NSString)queryString
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"DELETE FROM %@", self->_table];
  v4 = v3;
  if (self->_where)
  {
    [v3 appendString:@" WHERE "];
    [(EFSQLValueExpressable *)self->_where ef_renderSQLExpressionInto:v4];
  }
  if ([(NSMutableArray *)self->_orderExpressions count])
  {
    [v4 appendString:@" ORDER BY "];
    [(NSMutableArray *)self->_orderExpressions ef_renderSQLExpressionInto:v4];
  }
  if (self->_limit) {
    objc_msgSend(v4, "appendFormat:", @" LIMIT %llu", self->_limit);
  }
  return (NSString *)v4;
}

- (EFSQLDeleteStatement)initWithTable:(id)a3 where:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EFSQLDeleteStatement;
  v9 = [(EFSQLDeleteStatement *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_table, a3);
    objc_storeStrong((id *)&v10->_where, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderExpressions = v10->_orderExpressions;
    v10->_orderExpressions = v11;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderExpressions, 0);
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_where, 0);
}

- (EFSQLDeleteStatement)initWithTable:(id)a3
{
  return [(EFSQLDeleteStatement *)self initWithTable:a3 where:0];
}

- (void)orderBy:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  v6 = [[EFSQLOrderExpression alloc] initWithExpression:v8 ascending:v4];
  if (self) {
    orderExpressions = self->_orderExpressions;
  }
  else {
    orderExpressions = 0;
  }
  [(NSMutableArray *)orderExpressions addObject:v6];
}

- (void)orderByColumn:(id)a3 ascending:(BOOL)a4
{
  id v5 = +[EFSQLColumnExpression column:a3];
  -[EFSQLDeleteStatement orderBy:ascending:](self, "orderBy:ascending:");
}

- (EFSQLValueExpressable)where
{
  return self->_where;
}

- (void)setWhere:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

@end
@interface EFSQLUpsertStatement
- (BOOL)isEmpty;
- (EFSQLInsertStatementValue)insertValue;
- (EFSQLUpdateStatementValue)updateValue;
- (EFSQLUpsertStatement)initWithTable:(id)a3 conflictTarget:(id)a4;
- (EFSQLValueExpressable)whereClause;
- (NSString)queryString;
- (id)excludedColumnExpressionForColumnName:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)enumerateBindingNamesAndValuesUsingBlock:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setWhereClause:(id)a3;
@end

@implementation EFSQLUpsertStatement

- (EFSQLUpsertStatement)initWithTable:(id)a3 conflictTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EFSQLUpsertStatement;
  v8 = [(EFSQLUpsertStatement *)&v16 init];
  if (v8)
  {
    v9 = [[EFSQLInsertStatement alloc] initWithTable:v6];
    insertStatement = v8->_insertStatement;
    v8->_insertStatement = v9;

    v11 = [[EFSQLUpdateStatement alloc] initWithTable:v6];
    updateStatement = v8->_updateStatement;
    v8->_updateStatement = v11;

    uint64_t v13 = [v7 copy];
    conflictTarget = v8->_conflictTarget;
    v8->_conflictTarget = (NSArray *)v13;
  }
  return v8;
}

- (EFSQLInsertStatementValue)insertValue
{
  if (self) {
    self = (EFSQLUpsertStatement *)self->_insertStatement;
  }
  return (EFSQLInsertStatementValue *)self;
}

- (EFSQLUpdateStatementValue)updateValue
{
  if (self) {
    self = (EFSQLUpsertStatement *)self->_updateStatement;
  }
  return (EFSQLUpdateStatementValue *)self;
}

- (EFSQLValueExpressable)whereClause
{
  if (self) {
    self = (EFSQLUpsertStatement *)self->_updateStatement;
  }
  v2 = [(EFSQLUpsertStatement *)self whereClause];
  return (EFSQLValueExpressable *)v2;
}

- (void)setWhereClause:(id)a3
{
  id v4 = a3;
  if (self) {
    updateStatement = self->_updateStatement;
  }
  else {
    updateStatement = 0;
  }
  id v6 = v4;
  [(EFSQLUpdateStatement *)updateStatement setWhereClause:v4];
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  if (self) {
    insertStatement = self->_insertStatement;
  }
  else {
    insertStatement = 0;
  }
  id v6 = [(EFSQLInsertStatement *)insertStatement objectForKeyedSubscript:v4];

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (self) {
    insertStatement = self->_insertStatement;
  }
  else {
    insertStatement = 0;
  }
  [(EFSQLInsertStatement *)insertStatement setObject:v11 forKeyedSubscript:v6];
  if (self) {
    conflictTarget = self->_conflictTarget;
  }
  else {
    conflictTarget = 0;
  }
  if (![(NSArray *)conflictTarget containsObject:v6])
  {
    v9 = [(EFSQLUpsertStatement *)self excludedColumnExpressionForColumnName:v6];
    if (self) {
      updateStatement = self->_updateStatement;
    }
    else {
      updateStatement = 0;
    }
    [(EFSQLUpdateStatement *)updateStatement setObject:v9 forKeyedSubscript:v6];
  }
}

- (void)enumerateBindingNamesAndValuesUsingBlock:(id)a3
{
  id v4 = a3;
  if (self) {
    insertStatement = self->_insertStatement;
  }
  else {
    insertStatement = 0;
  }
  id v7 = v4;
  [(EFSQLInsertStatement *)insertStatement enumerateBindingNamesAndValuesUsingBlock:v4];
  if (self) {
    updateStatement = self->_updateStatement;
  }
  else {
    updateStatement = 0;
  }
  [(EFSQLUpdateStatement *)updateStatement enumerateBindingNamesAndValuesUsingBlock:v7];
}

- (BOOL)isEmpty
{
  if (self) {
    self = (EFSQLUpsertStatement *)self->_insertStatement;
  }
  return [(EFSQLUpsertStatement *)self isEmpty];
}

- (NSString)queryString
{
  if (self) {
    conflictTarget = self->_conflictTarget;
  }
  else {
    conflictTarget = 0;
  }
  v5 = conflictTarget;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __35__EFSQLUpsertStatement_queryString__block_invoke;
  v18[3] = &unk_1E6123650;
  v18[4] = self;
  BOOL v6 = [(NSArray *)v5 ef_all:v18];

  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"EFSQLUpsertStatement.m" lineNumber:81 description:@"Must have insertion values for all conflict target columns"];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (self) {
    insertStatement = self->_insertStatement;
  }
  else {
    insertStatement = 0;
  }
  [(EFSQLInsertStatement *)insertStatement renderStatementWithNamedBindingsInto:v7];
  objc_msgSend(v7, "appendString:", @" ON CONFLICT (");
  v9 = self->_conflictTarget;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __35__EFSQLUpsertStatement_queryString__block_invoke_2;
  objc_super v16 = &unk_1E6123230;
  id v10 = v7;
  id v17 = v10;
  [(NSArray *)v9 enumerateObjectsUsingBlock:&v13];
  [v10 appendString:@" DO "], v13, v14, v15, v16);
  -[EFSQLUpdateStatement renderStatementForUpsertInto:]((uint64_t)self->_updateStatement, v10);

  return (NSString *)v10;
}

BOOL __35__EFSQLUpsertStatement_queryString__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 8);
  }
  else {
    v5 = 0;
  }
  BOOL v6 = [v5 objectForKeyedSubscript:v3];
  BOOL v7 = v6 != 0;

  return v7;
}

void __35__EFSQLUpsertStatement_queryString__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [*(id *)(a1 + 32) appendString:v5];
}

- (id)excludedColumnExpressionForColumnName:(id)a3
{
  id v5 = a3;
  if (self) {
    insertStatement = self->_insertStatement;
  }
  else {
    insertStatement = 0;
  }
  BOOL v7 = [(EFSQLInsertStatement *)insertStatement objectForKeyedSubscript:v5];

  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"EFSQLUpsertStatement.m" lineNumber:101 description:@"Cannot generate excluded expression for column that was not inserted"];
  }
  v8 = +[EFSQLColumnExpression table:@"excluded" column:v5];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictTarget, 0);
  objc_storeStrong((id *)&self->_updateStatement, 0);
  objc_storeStrong((id *)&self->_insertStatement, 0);
}

@end
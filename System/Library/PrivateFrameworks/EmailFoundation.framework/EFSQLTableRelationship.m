@interface EFSQLTableRelationship
- (BOOL)isProtectedTable;
- (BOOL)useLeftOuterJoin;
- (EFSQLColumnSchema)destinationColumn;
- (EFSQLColumnSchema)sourceColumn;
- (EFSQLTableRelationship)initWithSourceColumn:(id)a3 destinationColumn:(id)a4 useLeftOuterJoin:(BOOL)a5;
- (EFSQLTableRelationship)initWithSourceColumn:(id)a3 destinationColumn:(id)a4 useLeftOuterJoin:(BOOL)a5 tableAlias:(id)a6 isProtectedTable:(BOOL)a7;
- (NSString)ef_publicDescription;
- (NSString)tableAlias;
@end

@implementation EFSQLTableRelationship

- (NSString)tableAlias
{
  return self->_tableAlias;
}

- (EFSQLColumnSchema)sourceColumn
{
  return self->_sourceColumn;
}

- (EFSQLColumnSchema)destinationColumn
{
  return self->_destinationColumn;
}

- (BOOL)useLeftOuterJoin
{
  return self->_useLeftOuterJoin;
}

- (EFSQLTableRelationship)initWithSourceColumn:(id)a3 destinationColumn:(id)a4 useLeftOuterJoin:(BOOL)a5
{
  return [(EFSQLTableRelationship *)self initWithSourceColumn:a3 destinationColumn:a4 useLeftOuterJoin:a5 tableAlias:0 isProtectedTable:0];
}

- (EFSQLTableRelationship)initWithSourceColumn:(id)a3 destinationColumn:(id)a4 useLeftOuterJoin:(BOOL)a5 tableAlias:(id)a6 isProtectedTable:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)EFSQLTableRelationship;
  v16 = [(EFSQLTableRelationship *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sourceColumn, a3);
    objc_storeStrong((id *)&v17->_destinationColumn, a4);
    v17->_useLeftOuterJoin = a5;
    objc_storeStrong((id *)&v17->_tableAlias, a6);
    v17->_isProtectedTable = a7;
  }

  return v17;
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v16 = [(EFSQLTableRelationship *)self sourceColumn];
  id v15 = [v16 table];
  id v14 = [v15 name];
  id v13 = [(EFSQLTableRelationship *)self sourceColumn];
  v5 = [v13 name];
  v6 = [(EFSQLTableRelationship *)self destinationColumn];
  v7 = [v6 table];
  v8 = [v7 name];
  v9 = [(EFSQLTableRelationship *)self destinationColumn];
  v10 = [v9 name];
  v11 = [v3 stringWithFormat:@"%@ <%p>: source: %@[%@] destination: %@[%@]", v4, self, v14, v5, v8, v10];

  return (NSString *)v11;
}

- (BOOL)isProtectedTable
{
  return self->_isProtectedTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableAlias, 0);
  objc_storeStrong((id *)&self->_destinationColumn, 0);
  objc_storeStrong((id *)&self->_sourceColumn, 0);
}

@end
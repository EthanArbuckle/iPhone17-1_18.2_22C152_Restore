@interface EFSQLObjectPropertyMapper
- (EFSQLObjectPropertyMapper)initWithTable:(id)a3 keyPathMappers:(id)a4 tableRelationships:(id)a5 additionalColumns:(id)a6 additionalSelectExpressions:(id)a7;
- (EFSQLTableSchema)mainTable;
- (NSArray)additionalColumns;
- (NSDictionary)additionalSelectExpressions;
- (NSDictionary)keyPathMappers;
- (NSDictionary)tableRelationships;
@end

@implementation EFSQLObjectPropertyMapper

- (NSDictionary)tableRelationships
{
  return self->_tableRelationships;
}

- (NSDictionary)keyPathMappers
{
  return self->_keyPathMappers;
}

- (EFSQLTableSchema)mainTable
{
  return self->_mainTable;
}

- (NSArray)additionalColumns
{
  return self->_additionalColumns;
}

- (EFSQLObjectPropertyMapper)initWithTable:(id)a3 keyPathMappers:(id)a4 tableRelationships:(id)a5 additionalColumns:(id)a6 additionalSelectExpressions:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)EFSQLObjectPropertyMapper;
  v17 = [(EFSQLObjectPropertyMapper *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_mainTable, a3);
    objc_storeStrong((id *)&v18->_keyPathMappers, a4);
    objc_storeStrong((id *)&v18->_tableRelationships, a5);
    objc_storeStrong((id *)&v18->_additionalColumns, a6);
    objc_storeStrong((id *)&v18->_additionalSelectExpressions, a7);
  }

  return v18;
}

- (NSDictionary)additionalSelectExpressions
{
  return self->_additionalSelectExpressions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalSelectExpressions, 0);
  objc_storeStrong((id *)&self->_additionalColumns, 0);
  objc_storeStrong((id *)&self->_tableRelationships, 0);
  objc_storeStrong((id *)&self->_keyPathMappers, 0);
  objc_storeStrong((id *)&self->_mainTable, 0);
}

@end
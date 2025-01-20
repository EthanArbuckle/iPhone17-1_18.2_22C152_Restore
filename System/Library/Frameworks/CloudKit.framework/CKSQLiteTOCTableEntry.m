@interface CKSQLiteTOCTableEntry
- (NSDictionary)propertyData;
- (NSNumber)dbVersion;
- (NSNumber)groupID;
- (NSNumber)tableID;
- (NSString)creatingClass;
- (NSString)creator;
- (NSString)dbTableName;
- (NSString)logicalTableName;
- (NSString)schema;
- (void)setCreatingClass:(id)a3;
- (void)setCreator:(id)a3;
- (void)setDbTableName:(id)a3;
- (void)setDbVersion:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setLogicalTableName:(id)a3;
- (void)setPropertyData:(id)a3;
- (void)setSchema:(id)a3;
- (void)setTableID:(id)a3;
@end

@implementation CKSQLiteTOCTableEntry

- (NSNumber)tableID
{
  return self->_tableID;
}

- (void)setTableID:(id)a3
{
}

- (NSString)logicalTableName
{
  return self->_logicalTableName;
}

- (void)setLogicalTableName:(id)a3
{
}

- (NSString)dbTableName
{
  return self->_dbTableName;
}

- (void)setDbTableName:(id)a3
{
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (NSNumber)dbVersion
{
  return self->_dbVersion;
}

- (void)setDbVersion:(id)a3
{
}

- (NSString)creatingClass
{
  return self->_creatingClass;
}

- (void)setCreatingClass:(id)a3
{
}

- (NSDictionary)propertyData
{
  return self->_propertyData;
}

- (void)setPropertyData:(id)a3
{
}

- (NSString)creator
{
  return self->_creator;
}

- (void)setCreator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_propertyData, 0);
  objc_storeStrong((id *)&self->_creatingClass, 0);
  objc_storeStrong((id *)&self->_dbVersion, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_dbTableName, 0);
  objc_storeStrong((id *)&self->_logicalTableName, 0);

  objc_storeStrong((id *)&self->_tableID, 0);
}

@end
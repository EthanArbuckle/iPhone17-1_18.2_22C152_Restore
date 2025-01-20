@interface SQLiteDatabaseStoreDescriptor
@end

@implementation SQLiteDatabaseStoreDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_schemaName, 0);
}

@end
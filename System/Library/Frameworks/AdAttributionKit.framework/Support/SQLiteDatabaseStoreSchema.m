@interface SQLiteDatabaseStoreSchema
@end

@implementation SQLiteDatabaseStoreSchema

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaName, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end
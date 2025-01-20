@interface SQLiteDatabaseStoreMigrator
@end

@implementation SQLiteDatabaseStoreMigrator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
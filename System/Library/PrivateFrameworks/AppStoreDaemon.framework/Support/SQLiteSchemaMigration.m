@interface SQLiteSchemaMigration
@end

@implementation SQLiteSchemaMigration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
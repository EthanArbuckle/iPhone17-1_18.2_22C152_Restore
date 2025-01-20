@interface SQLiteTransporter
@end

@implementation SQLiteTransporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
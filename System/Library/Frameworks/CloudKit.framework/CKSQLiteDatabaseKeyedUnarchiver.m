@interface CKSQLiteDatabaseKeyedUnarchiver
- (BOOL)ck_isDecodingForCKSQLiteDatabase;
@end

@implementation CKSQLiteDatabaseKeyedUnarchiver

- (BOOL)ck_isDecodingForCKSQLiteDatabase
{
  return 1;
}

@end
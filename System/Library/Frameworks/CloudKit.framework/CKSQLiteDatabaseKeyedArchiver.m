@interface CKSQLiteDatabaseKeyedArchiver
- (BOOL)ck_isCodingForCKSQLiteDatabase;
@end

@implementation CKSQLiteDatabaseKeyedArchiver

- (BOOL)ck_isCodingForCKSQLiteDatabase
{
  return 1;
}

@end
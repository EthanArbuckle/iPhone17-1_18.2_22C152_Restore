@interface _DKFetchDatabaseChangesOperation
+ (BOOL)_removesDependenciesAfterFinish;
@end

@implementation _DKFetchDatabaseChangesOperation

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

@end
@interface _DKFetchRecordZoneChangesOperation
+ (BOOL)_removesDependenciesAfterFinish;
@end

@implementation _DKFetchRecordZoneChangesOperation

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

@end
@interface _DKFetchRecordZonesOperation
+ (BOOL)_removesDependenciesAfterFinish;
@end

@implementation _DKFetchRecordZonesOperation

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

@end
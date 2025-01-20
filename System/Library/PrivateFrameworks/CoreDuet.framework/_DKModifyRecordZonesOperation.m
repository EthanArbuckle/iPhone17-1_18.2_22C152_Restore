@interface _DKModifyRecordZonesOperation
+ (BOOL)_removesDependenciesAfterFinish;
@end

@implementation _DKModifyRecordZonesOperation

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

@end
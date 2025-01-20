@interface _DKModifyRecordsOperation
+ (BOOL)_removesDependenciesAfterFinish;
@end

@implementation _DKModifyRecordsOperation

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

@end
@interface FPCopyOperation
- (BOOL)byCopy;
- (unint64_t)defaultLastUsedDatePolicy;
@end

@implementation FPCopyOperation

- (BOOL)byCopy
{
  return 1;
}

- (unint64_t)defaultLastUsedDatePolicy
{
  return 0;
}

@end
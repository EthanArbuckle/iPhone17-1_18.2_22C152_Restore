@interface NSCompletionCheckingResult
- (unint64_t)resultType;
@end

@implementation NSCompletionCheckingResult

- (unint64_t)resultType
{
  return 0x2000;
}

@end
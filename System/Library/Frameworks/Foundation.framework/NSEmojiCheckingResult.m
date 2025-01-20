@interface NSEmojiCheckingResult
- (unint64_t)resultType;
@end

@implementation NSEmojiCheckingResult

- (unint64_t)resultType
{
  return 0x4000;
}

@end
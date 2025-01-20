@interface NSCharacterSet(EMFEmojiExtras)
+ (id)_emojiCharacterSet;
@end

@implementation NSCharacterSet(EMFEmojiExtras)

+ (id)_emojiCharacterSet
{
  if (_emojiCharacterSet___onceToken != -1) {
    dispatch_once(&_emojiCharacterSet___onceToken, &__block_literal_global_10);
  }
  v0 = (void *)_emojiCharacterSet___emojiCharacterSet;
  return v0;
}

@end
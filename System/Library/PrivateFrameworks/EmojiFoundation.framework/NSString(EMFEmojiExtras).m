@interface NSString(EMFEmojiExtras)
- (BOOL)_containsEmoji;
- (BOOL)_isSingleEmoji;
- (void)_enumerateEmojiTokensInRange:()EMFEmojiExtras block:;
@end

@implementation NSString(EMFEmojiExtras)

- (BOOL)_isSingleEmoji
{
  return CEMStringIsSingleEmoji() != 0;
}

- (BOOL)_containsEmoji
{
  v2 = [MEMORY[0x1E4F28B88] _emojiCharacterSet];
  if (v2) {
    BOOL v3 = [a1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_enumerateEmojiTokensInRange:()EMFEmojiExtras block:
{
  id v5 = a5;
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    CEMEnumerateEmojiTokensInStringWithBlock();
  }
}

@end
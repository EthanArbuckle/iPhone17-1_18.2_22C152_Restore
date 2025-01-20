@interface NSString
@end

@implementation NSString

void __63__NSString_EMFEmojiExtras___enumerateEmojiTokensInRange_block___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    a2 = +[EMFEmojiToken emojiTokenWithCEMEmojiToken:a2];
  }
  id v3 = (id)a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end
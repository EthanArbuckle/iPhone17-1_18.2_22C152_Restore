@interface ABStringContainsEmojiCharacters
@end

@implementation ABStringContainsEmojiCharacters

void ___ABStringContainsEmojiCharacters_block_invoke()
{
  __handle = 0;
  +[ABDynamicLoader loadFrameworkAtPath:@"/System/Library/Frameworks/CoreText.framework/CoreText" andStoreHandle:&__handle bundle:0];
  v0 = (uint64_t (*)(__CFString *, void, double))dlsym(__handle, "CTFontCreateWithName");
  v1 = (uint64_t (*)(void))dlsym(__handle, "CTFontCopyCharacterSet");
  uint64_t v2 = v0(@"AppleColorEmoji", 0, 0.0);
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = (void *)v1();
    v5 = (void *)[v4 mutableCopy];
    objc_msgSend(v5, "removeCharactersInRange:", 0, 128);

    CFRelease(v3);
    _ABStringContainsEmojiCharacters___emojiSet = (uint64_t)v5;
  }
}

@end
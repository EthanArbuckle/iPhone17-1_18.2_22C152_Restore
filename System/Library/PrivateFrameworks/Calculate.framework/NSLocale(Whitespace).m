@interface NSLocale(Whitespace)
- (uint64_t)usesWhitespace;
@end

@implementation NSLocale(Whitespace)

- (uint64_t)usesWhitespace
{
  if (usesWhitespace_onceToken != -1) {
    dispatch_once(&usesWhitespace_onceToken, &__block_literal_global_70);
  }
  v2 = (void *)usesWhitespace_nonWhitespaceLanguages;
  v3 = [a1 languageCode];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

@end
@interface DKEventStatsUtilities
@end

@implementation DKEventStatsUtilities

void __47___DKEventStatsUtilities_safeStringWithString___block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz01234567890"];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)safeStringWithString__nonPermittedCharacterSet;
  safeStringWithString__nonPermittedCharacterSet = v0;
}

@end
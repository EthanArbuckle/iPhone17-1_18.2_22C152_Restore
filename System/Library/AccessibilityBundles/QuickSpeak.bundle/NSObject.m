@interface NSObject
@end

@implementation NSObject

void __58__NSObject_QSExtras__accessibilitySpeakLanguageSelection___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) specificLanguageID];
  [v1 speakAction:v2 withPreferredLanguage:v3];
}

uint64_t __64__NSObject_QSExtras__accessibilitySystemShouldShowSpeakSpellOut__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isEqualToString:*MEMORY[0x263F082F8]];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

@end
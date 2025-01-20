@interface NSError
@end

@implementation NSError

uint64_t __56__NSError_FSKitAdditions__fskit_initLocalizationStrings__block_invoke()
{
  return [MEMORY[0x263F087E8] setUserInfoValueProviderForDomain:@"FSKitErrorDomain" provider:&__block_literal_global_25];
}

uint64_t __56__NSError_FSKitAdditions__fskit_initLocalizationStrings__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fskit_userInfoValueForKey:");
}

@end
@interface MDImportExtensionLoader
@end

@implementation MDImportExtensionLoader

void __44___MDImportExtensionLoader__matchDictionary__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F282B0];
  v3[0] = @"com.apple.spotlight.import";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)_matchDictionary_sMatchDictionary_21;
  _matchDictionary_sMatchDictionary_21 = v0;
}

@end
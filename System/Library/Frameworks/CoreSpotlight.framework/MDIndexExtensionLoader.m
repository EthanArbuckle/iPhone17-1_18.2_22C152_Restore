@interface MDIndexExtensionLoader
@end

@implementation MDIndexExtensionLoader

void __43___MDIndexExtensionLoader__matchDictionary__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F282B0];
  v3[0] = &unk_1EDBD6208;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)_matchDictionary_sMatchDictionary;
  _matchDictionary_sMatchDictionary = v0;
}

@end
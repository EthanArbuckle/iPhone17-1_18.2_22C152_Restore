@interface AppleTVAllowedKeysFilter
@end

@implementation AppleTVAllowedKeysFilter

void ___AppleTVAllowedKeysFilter_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  MCGetBaseResourcePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 stringByAppendingPathComponent:@"AppleTVRestrictionPayloadKeysFilter.plist"];
  uint64_t v2 = [v0 dictionaryWithContentsOfFile:v1];
  v3 = (void *)_AppleTVAllowedKeysFilter_dict;
  _AppleTVAllowedKeysFilter_dict = v2;
}

@end
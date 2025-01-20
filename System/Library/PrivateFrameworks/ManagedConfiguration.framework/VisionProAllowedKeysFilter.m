@interface VisionProAllowedKeysFilter
@end

@implementation VisionProAllowedKeysFilter

void ___VisionProAllowedKeysFilter_block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  MCGetBaseResourcePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 stringByAppendingPathComponent:@"VisionProRestrictionPayloadKeysFilter.plist"];
  uint64_t v2 = [v0 dictionaryWithContentsOfFile:v1];
  v3 = (void *)_VisionProAllowedKeysFilter_dict;
  _VisionProAllowedKeysFilter_dict = v2;
}

@end
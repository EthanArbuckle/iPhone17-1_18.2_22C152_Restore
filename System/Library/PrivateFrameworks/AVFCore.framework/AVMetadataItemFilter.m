@interface AVMetadataItemFilter
+ (AVMetadataItemFilter)metadataItemFilterForSharing;
- (NSDictionary)whitelist;
@end

@implementation AVMetadataItemFilter

+ (AVMetadataItemFilter)metadataItemFilterForSharing
{
  if (metadataItemFilterForSharing_onceToken != -1) {
    dispatch_once(&metadataItemFilterForSharing_onceToken, &__block_literal_global_414);
  }
  return (AVMetadataItemFilter *)metadataItemFilterForSharing_sSharingFilter;
}

AVMetadataItemFilterForSharing *__52__AVMetadataItemFilter_metadataItemFilterForSharing__block_invoke()
{
  result = objc_alloc_init(AVMetadataItemFilterForSharing);
  metadataItemFilterForSharing_sSharingFilter = (uint64_t)result;
  return result;
}

- (NSDictionary)whitelist
{
  return 0;
}

@end
@interface NSDictionary(IDSMetadataFileURLType)
- (uint64_t)idsMetadataFileKey;
- (uint64_t)idsMetadataFileURLType;
@end

@implementation NSDictionary(IDSMetadataFileURLType)

- (uint64_t)idsMetadataFileURLType
{
  v1 = [a1 objectForKeyedSubscript:@"BLTFileURLType"];
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (uint64_t)idsMetadataFileKey
{
  return [a1 objectForKeyedSubscript:@"BLTFileURLKey"];
}

@end
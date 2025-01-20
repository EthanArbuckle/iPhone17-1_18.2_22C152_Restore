@interface NSMutableDictionary(IDSMetadataURLType)
- (void)setIdsMetadataFileKey:()IDSMetadataURLType;
- (void)setIdsMetadataFileURLType:()IDSMetadataURLType;
@end

@implementation NSMutableDictionary(IDSMetadataURLType)

- (void)setIdsMetadataFileURLType:()IDSMetadataURLType
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"BLTFileURLType"];
}

- (void)setIdsMetadataFileKey:()IDSMetadataURLType
{
  if (a3)
  {
    id v4 = (id)[a3 copy];
    [a1 setObject:v4 forKeyedSubscript:@"BLTFileURLKey"];
  }
}

@end
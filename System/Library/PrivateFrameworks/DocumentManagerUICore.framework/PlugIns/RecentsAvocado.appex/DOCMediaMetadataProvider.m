@interface DOCMediaMetadataProvider
- (NSArray)displaySortOrder;
- (NSDictionary)metadataValues;
@end

@implementation DOCMediaMetadataProvider

- (NSDictionary)metadataValues
{
  swift_retain();
  sub_10035F034();
  swift_release();
  v2.super.isa = sub_1004CD990().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (NSArray)displaySortOrder
{
  sub_100365B1C();
  v2.super.isa = sub_1004CDE10().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

@end
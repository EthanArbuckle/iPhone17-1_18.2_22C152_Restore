@interface DOCMediaMetadataProvider
- (NSArray)displaySortOrder;
- (NSDictionary)metadataValues;
@end

@implementation DOCMediaMetadataProvider

- (NSDictionary)metadataValues
{
  swift_retain();
  sub_100379C60();
  swift_release();
  v2.super.isa = sub_1004F4330().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (NSArray)displaySortOrder
{
  sub_100380748();
  v2.super.isa = sub_1004F47D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

@end
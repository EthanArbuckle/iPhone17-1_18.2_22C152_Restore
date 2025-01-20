@interface DOCMediaMetadataProvider
- (NSArray)displaySortOrder;
- (NSDictionary)metadataValues;
@end

@implementation DOCMediaMetadataProvider

- (NSDictionary)metadataValues
{
  swift_retain();
  sub_1001C835C();
  swift_release();
  v2.super.isa = sub_1004D1080().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (NSArray)displaySortOrder
{
  sub_1001CEE44();
  v2.super.isa = sub_1004D14F0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

@end
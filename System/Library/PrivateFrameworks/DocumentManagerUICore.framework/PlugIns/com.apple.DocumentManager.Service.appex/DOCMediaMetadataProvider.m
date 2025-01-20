@interface DOCMediaMetadataProvider
- (NSArray)displaySortOrder;
- (NSDictionary)metadataValues;
@end

@implementation DOCMediaMetadataProvider

- (NSDictionary)metadataValues
{
  swift_retain();
  sub_100429DA4();
  swift_release();
  v2.super.isa = sub_1004CD130().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (NSArray)displaySortOrder
{
  sub_10043088C();
  v2.super.isa = sub_1004CD5A0().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

@end
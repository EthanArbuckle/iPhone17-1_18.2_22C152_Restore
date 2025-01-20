@interface ArcadeDownloadPackData
- (NSArray)apps;
- (NSString)subscriptionStatus;
- (_TtC19AppStoreKitInternal22ArcadeDownloadPackData)init;
@end

@implementation ArcadeDownloadPackData

- (NSArray)apps
{
  type metadata accessor for ArcadeDownloadPackApp();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E1D5C238();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)subscriptionStatus
{
  return (NSString *)sub_1E1AAF108();
}

- (_TtC19AppStoreKitInternal22ArcadeDownloadPackData)init
{
  result = (_TtC19AppStoreKitInternal22ArcadeDownloadPackData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
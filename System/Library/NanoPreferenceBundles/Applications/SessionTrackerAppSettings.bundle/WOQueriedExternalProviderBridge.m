@interface WOQueriedExternalProviderBridge
- (BOOL)isEnabled;
- (NSData)sourceImageData;
- (NSString)sourceName;
- (WOQueriedExternalProviderBridge)init;
@end

@implementation WOQueriedExternalProviderBridge

- (NSString)sourceName
{
  v2 = self;
  sub_20030();
  sub_1FF20();

  swift_release();
  NSString v3 = sub_20280();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSData)sourceImageData
{
  v2 = self;
  sub_20030();
  uint64_t v3 = sub_1FF30();
  unint64_t v5 = v4;

  swift_release();
  v6.super.isa = sub_1FD50().super.isa;
  sub_1A184(v3, v5);

  return (NSData *)v6.super.isa;
}

- (BOOL)isEnabled
{
  v2 = self;
  uint64_t v3 = sub_20040();

  return v3 == 2;
}

- (WOQueriedExternalProviderBridge)init
{
  result = (WOQueriedExternalProviderBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
@interface SenderKeyDistributionManager.SenderKeyURIMismatchMetric
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (_TtCC17identityservicesd28SenderKeyDistributionManagerP33_E220278C37BF7A52CA212AA0DEF6BDED26SenderKeyURIMismatchMetric)init;
@end

@implementation SenderKeyDistributionManager.SenderKeyURIMismatchMetric

- (NSDictionary)dictionaryRepresentation
{
  sub_100431F80(&qword_100A46CD0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100794E30;
  *(void *)(inited + 32) = 0x476567617373656DLL;
  *(void *)(inited + 40) = 0xEB00000000444955;
  v4 = self;
  swift_bridgeObjectRetain();
  NSString v5 = sub_100726420();
  swift_bridgeObjectRelease();
  *(void *)(inited + 48) = v5;
  sub_1004ABAA0(inited);

  sub_100431F80(&qword_100A46CD8);
  v6.super.isa = sub_100726380().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v6.super.isa;
}

- (NSString)name
{
  NSString v2 = sub_100726420();

  return (NSString *)v2;
}

- (_TtCC17identityservicesd28SenderKeyDistributionManagerP33_E220278C37BF7A52CA212AA0DEF6BDED26SenderKeyURIMismatchMetric)init
{
  result = (_TtCC17identityservicesd28SenderKeyDistributionManagerP33_E220278C37BF7A52CA212AA0DEF6BDED26SenderKeyURIMismatchMetric *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
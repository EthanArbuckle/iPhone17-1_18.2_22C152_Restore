@interface FPFSServicerExtender
- (NSString)prettyDescription;
- (_TtC9libfssync20FPFSServicerExtender)init;
- (int)requestEffectivePID;
@end

@implementation FPFSServicerExtender

- (int)requestEffectivePID
{
  return [*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPFSServicerExtender_request) pid];
}

- (NSString)prettyDescription
{
  v2 = self;
  sub_10020FB68();

  NSString v3 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC9libfssync20FPFSServicerExtender)init
{
  result = (_TtC9libfssync20FPFSServicerExtender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
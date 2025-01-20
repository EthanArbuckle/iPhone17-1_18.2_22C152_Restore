@interface FPFSServicerExtender
- (NSString)prettyDescription;
- (_TtC9libfssync20FPFSServicerExtender)init;
- (int)requestEffectivePID;
@end

@implementation FPFSServicerExtender

- (void).cxx_destruct
{
}

- (int)requestEffectivePID
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPFSServicerExtender_request), sel_pid);
}

- (NSString)prettyDescription
{
  v2 = self;
  sub_24D5A4858();

  v3 = (void *)sub_24DCC97B8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC9libfssync20FPFSServicerExtender)init
{
  result = (_TtC9libfssync20FPFSServicerExtender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
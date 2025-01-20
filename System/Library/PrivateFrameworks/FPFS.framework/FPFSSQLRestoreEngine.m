@interface FPFSSQLRestoreEngine
- (_TtC9libfssync20FPFSSQLRestoreEngine)init;
- (_TtC9libfssync20FPFSSQLRestoreEngine)initWithUserURL:(id)a3;
- (void)restoreWithCleanupOnSuccess:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation FPFSSQLRestoreEngine

- (_TtC9libfssync20FPFSSQLRestoreEngine)initWithUserURL:(id)a3
{
  uint64_t v3 = sub_24DCC8A58();
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24DCC89E8();
  return (_TtC9libfssync20FPFSSQLRestoreEngine *)sub_24DC1D6F0(v5);
}

- (void)restoreWithCleanupOnSuccess:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_24DC28330(v4, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC9libfssync20FPFSSQLRestoreEngine)init
{
  result = (_TtC9libfssync20FPFSSQLRestoreEngine *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC9libfssync20FPFSSQLRestoreEngine_userURL;
  uint64_t v3 = sub_24DCC8A58();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end
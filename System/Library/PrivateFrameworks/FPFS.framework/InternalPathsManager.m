@interface InternalPathsManager
+ (NSString)purgatoryPrefix;
- (_TtC9libfssync20InternalPathsManager)init;
@end

@implementation InternalPathsManager

+ (NSString)purgatoryPrefix
{
  v2 = (void *)sub_24DCC97B8();

  return (NSString *)v2;
}

- (_TtC9libfssync20InternalPathsManager)init
{
  result = (_TtC9libfssync20InternalPathsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_24D415F74((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_appSupportURL, (uint64_t *)&unk_26B199050);
  sub_24D415F74((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_wharfDirectoryURL, (uint64_t *)&unk_26B199050);
  sub_24D415F74((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_dbDirectoryURL, (uint64_t *)&unk_26B199050);
  sub_24D415F74((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_dbURL, (uint64_t *)&unk_26B199050);
  sub_24D415F74((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_temporaryDirectoryURL, (uint64_t *)&unk_26B199050);
  sub_24D415F74((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_stateDirectoryURL, (uint64_t *)&unk_26B199050);
}

@end
@interface InternalPathsManager
+ (NSString)purgatoryPrefix;
- (_TtC9libfssync20InternalPathsManager)init;
@end

@implementation InternalPathsManager

+ (NSString)purgatoryPrefix
{
  NSString v2 = sub_10096BC00();

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
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_appSupportURL, &qword_100ACA8C0);
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_wharfDirectoryURL, &qword_100ACA8C0);
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_dbDirectoryURL, &qword_100ACA8C0);
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_dbURL, &qword_100ACA8C0);
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_temporaryDirectoryURL, &qword_100ACA8C0);
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync20InternalPathsManager_stateDirectoryURL, &qword_100ACA8C0);
}

@end
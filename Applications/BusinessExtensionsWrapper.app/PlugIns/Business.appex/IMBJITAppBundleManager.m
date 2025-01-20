@interface IMBJITAppBundleManager
+ (id)sharedBundleManager;
+ (void)setSharedBundleManager:(id)a3;
- (_TtC8Business22IMBJITAppBundleManager)init;
- (int64_t)bundleState;
- (void)setBundleState:(int64_t)a3;
@end

@implementation IMBJITAppBundleManager

+ (void)setSharedBundleManager:(id)a3
{
  uint64_t v3 = qword_1000FBCF0;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_100100850;
  qword_100100850 = (uint64_t)v4;
}

- (int64_t)bundleState
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState);
  swift_beginAccess();
  return *v2;
}

- (void)setBundleState:(int64_t)a3
{
  v5 = (int64_t *)((char *)self + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_bundleState);
  swift_beginAccess();
  int64_t *v5 = a3;
  if (swift_unknownObjectWeakLoadStrong())
  {
    v6 = self;
    sub_1000757B0();

    swift_unknownObjectRelease();
  }
}

+ (id)sharedBundleManager
{
  if (qword_1000FBCF0 != -1) {
    swift_once();
  }
  v0 = (void *)qword_100100850;

  return v0;
}

- (_TtC8Business22IMBJITAppBundleManager)init
{
  return (_TtC8Business22IMBJITAppBundleManager *)IMBJITAppBundleManager.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___containerID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___container));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager____lazy_storage___database));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8Business22IMBJITAppBundleManager_delegate;

  sub_100010D28((uint64_t)v3);
}

@end
@interface HomeManager
- (_TtC16HomeEnergyDaemon11HomeManager)init;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation HomeManager

- (_TtC16HomeEnergyDaemon11HomeManager)init
{
  result = (_TtC16HomeEnergyDaemon11HomeManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_2520B582C((uint64_t)self + OBJC_IVAR____TtC16HomeEnergyDaemon11HomeManager_homeManagerDelegate);

  swift_release();
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2520B50D4(v4);
}

@end
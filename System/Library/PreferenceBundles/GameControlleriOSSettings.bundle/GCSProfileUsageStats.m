@interface GCSProfileUsageStats
- (BOOL)isActive;
- (NSSet)controllerIdentifiers;
- (NSSet)gameIdentifiers;
- (NSString)description;
- (_TtC25GameControlleriOSSettings20GCSProfileUsageStats)init;
- (int64_t)controllersCount;
- (int64_t)gamesCount;
- (void)setControllerIdentifiers:(id)a3;
- (void)setGameIdentifiers:(id)a3;
@end

@implementation GCSProfileUsageStats

- (NSString)description
{
  v2 = self;
  sub_99C1C();

  NSString v3 = sub_E70D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSSet)controllerIdentifiers
{
  return (NSSet *)sub_99E40();
}

- (void)setControllerIdentifiers:(id)a3
{
}

- (NSSet)gameIdentifiers
{
  return (NSSet *)sub_99E40();
}

- (void)setGameIdentifiers:(id)a3
{
}

- (int64_t)controllersCount
{
  v2 = *(uint64_t (**)(void))((char *)&stru_20.nsects + (swift_isaMask & (uint64_t)self->super.isa));
  NSString v3 = self;
  int64_t v4 = *(void *)(v2() + 16);

  swift_bridgeObjectRelease();
  return v4;
}

- (int64_t)gamesCount
{
  v2 = *(uint64_t (**)(void))&stru_68.segname[swift_isaMask & (uint64_t)self->super.isa];
  NSString v3 = self;
  int64_t v4 = *(void *)(v2() + 16);

  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)isActive
{
  v2 = *(uint64_t (**)(void))((char *)&stru_68.size + (swift_isaMask & (uint64_t)self->super.isa));
  NSString v3 = self;
  if (v2() < 1)
  {
    uint64_t v5 = (*(uint64_t (**)(void))((char *)&stru_68.offset + (swift_isaMask & (uint64_t)v3->super.isa)))();

    return v5 > 0;
  }
  else
  {

    return 1;
  }
}

- (_TtC25GameControlleriOSSettings20GCSProfileUsageStats)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC25GameControlleriOSSettings20GCSProfileUsageStats_controllerIdentifiers) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC25GameControlleriOSSettings20GCSProfileUsageStats_gameIdentifiers) = (Class)&_swiftEmptySetSingleton;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GCSProfileUsageStats();
  return [(GCSProfileUsageStats *)&v3 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
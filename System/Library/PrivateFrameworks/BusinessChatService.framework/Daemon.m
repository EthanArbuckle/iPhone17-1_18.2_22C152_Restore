@interface Daemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC17businessservicesd6Daemon)init;
@end

@implementation Daemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10000FCDC(v7);

  return v9 & 1;
}

- (_TtC17businessservicesd6Daemon)init
{
  return (_TtC17businessservicesd6Daemon *)sub_10000F7D8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___domainShardStore));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___userDefaults));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___queryOperationFactory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___cacheManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___measurementFactory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___metricFactory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___bloomFilterExtractor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___operationGroupFactory));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100010240(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___queryController));
  sub_100010250((uint64_t)self + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___businessConnectAssetDataSource);
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17businessservicesd6Daemon____lazy_storage___xpcListener);
}

@end
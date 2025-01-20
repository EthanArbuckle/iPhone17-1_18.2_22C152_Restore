@interface iOSDaemon
- (_TtC17businessservicesd9iOSDaemon)init;
@end

@implementation iOSDaemon

- (_TtC17businessservicesd9iOSDaemon)init
{
  v3 = (char *)self + OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___rcsChatbotAssetDataSource;
  uint64_t v4 = type metadata accessor for BrandAssetNetworkFetcher();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___brandService) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for iOSDaemon();
  return [(Daemon *)&v6 init];
}

- (void).cxx_destruct
{
  sub_100003D38((uint64_t)self + OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___rcsChatbotAssetDataSource, (uint64_t *)&unk_100022640);
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC17businessservicesd9iOSDaemon____lazy_storage___brandService);
}

@end
@interface EVChargerAvailabilityDownloader
- (BOOL)isActive;
- (_TtC6MapsUI31EVChargerAvailabilityDownloader)init;
- (_TtC6MapsUI31EVChargerAvailabilityDownloader)initWithMapItemIdentifier:(id)a3;
- (_TtP6MapsUI39EVChargerAvailabilityDownloaderDelegate_)delegate;
- (void)setDelegate:(id)a3;
- (void)setIsActive:(BOOL)a3;
@end

@implementation EVChargerAvailabilityDownloader

- (_TtP6MapsUI39EVChargerAvailabilityDownloaderDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1996FC540](v2);
  return (_TtP6MapsUI39EVChargerAvailabilityDownloaderDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_isActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsActive:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_isActive;
  swift_beginAccess();
  BOOL *v5 = a3;
  v6 = self;
  sub_193260AD8();
}

- (_TtC6MapsUI31EVChargerAvailabilityDownloader)initWithMapItemIdentifier:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_isActive) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_timer) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_isDownloadInProgress) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_mapItemIdentifier) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(EVChargerAvailabilityDownloader *)&v8 init];
}

- (_TtC6MapsUI31EVChargerAvailabilityDownloader)init
{
  result = (_TtC6MapsUI31EVChargerAvailabilityDownloader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1931F0EAC((uint64_t)self + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_mapItemIdentifier));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6MapsUI31EVChargerAvailabilityDownloader_timer);
}

@end
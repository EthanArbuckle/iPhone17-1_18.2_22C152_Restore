@interface BannerController
- (_TtC13MediaRemoteUI16BannerController)init;
- (void)dealloc;
@end

@implementation BannerController

- (void)dealloc
{
  v2 = self;
  sub_10002FF94();
}

- (void).cxx_destruct
{
  sub_100008C10((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___groupSessionPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI16BannerController____lazy_storage___suggestedRoutePresenter));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI16BannerController_source);
}

- (_TtC13MediaRemoteUI16BannerController)init
{
  return (_TtC13MediaRemoteUI16BannerController *)sub_100030480();
}

@end
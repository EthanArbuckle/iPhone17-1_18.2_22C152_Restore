@interface AirTagMovieViewController
- (_TtC18SharingViewService25AirTagMovieViewController)initWithContentView:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AirTagMovieViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10009F208(a3);
}

- (_TtC18SharingViewService25AirTagMovieViewController)initWithContentView:(id)a3
{
  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagMovieViewController_movie];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagMovieViewController_shouldSkipEngageMovie] = 0;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AirTagMovieViewController();
  return [(AirTagMovieViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
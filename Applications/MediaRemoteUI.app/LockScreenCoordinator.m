@interface LockScreenCoordinator
+ (_TtC13MediaRemoteUI21LockScreenCoordinator)shared;
- (BOOL)canBeExpanded;
- (BOOL)handlePlatterTap;
- (BOOL)isCurrentOrientationSupported;
- (MRUArtwork)artwork;
- (MRULockscreenViewController)platterContainer;
- (_TtC13MediaRemoteUI21LockScreenCoordinator)init;
- (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController)backgroundContainer;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)dealloc;
- (void)handleBackgroundTapAt:(CGPoint)a3;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5;
- (void)setArtwork:(id)a3;
- (void)setBackgroundContainer:(id)a3;
- (void)setPlatterContainer:(id)a3;
- (void)updateExpandedArtworkFrameFor:(CGSize)a3;
@end

@implementation LockScreenCoordinator

+ (_TtC13MediaRemoteUI21LockScreenCoordinator)shared
{
  if (qword_10005C1C0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_10005E808;

  return (_TtC13MediaRemoteUI21LockScreenCoordinator *)v2;
}

- (MRULockscreenViewController)platterContainer
{
  return (MRULockscreenViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer));
}

- (void)setPlatterContainer:(id)a3
{
}

- (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController)backgroundContainer
{
  return (_TtC13MediaRemoteUI34CoverSheetBackgroundViewController *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer);
}

- (void)setBackgroundContainer:(id)a3
{
}

- (MRUArtwork)artwork
{
  return (MRUArtwork *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artwork));
}

- (void)setArtwork:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_10002C358(a3);
}

- (BOOL)isCurrentOrientationSupported
{
  v3 = self;
  v4 = self;
  id v5 = [v3 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)1)
  {

    return 1;
  }
  else
  {
    id v8 = [self sharedApplication];
    id v9 = [v8 activeInterfaceOrientation];

    return sub_10002C538((uint64_t)v9);
  }
}

- (BOOL)canBeExpanded
{
  v2 = self;
  char v3 = sub_100029578();

  return v3 & 1;
}

- (_TtC13MediaRemoteUI21LockScreenCoordinator)init
{
  return (_TtC13MediaRemoteUI21LockScreenCoordinator *)sub_1000298C4();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_wallpaperService);
  char v3 = self;
  [v2 invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LockScreenCoordinator();
  [(LockScreenCoordinator *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContentAssertion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_artworkCatalogTimer));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_backgroundContainer));

  char v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_ambientLifecycleCancellable;

  sub_10001015C((uint64_t)v3);
}

- (void)updateExpandedArtworkFrameFor:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_10002A024(width, height);
}

- (void)handleBackgroundTapAt:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v5 = self;
  sub_10002A250(x, y);
}

- (BOOL)handlePlatterTap
{
  v2 = self;
  char v3 = sub_10002A384();

  return v3 & 1;
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10002C420(v10);
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  objc_super v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13MediaRemoteUI21LockScreenCoordinator_platterContainer);
  if (v4)
  {
    swift_unknownObjectRetain();
    id v7 = a4;
    id v8 = self;
    id v9 = v4;
    NSString v10 = String._bridgeToObjectiveC()();
    [v9 invalidateAllTimelinesForReason:v10];
    swift_unknownObjectRelease();
  }
}

@end
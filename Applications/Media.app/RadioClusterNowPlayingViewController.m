@interface RadioClusterNowPlayingViewController
- (_TtC5Media36RadioClusterNowPlayingViewController)initWithCoder:(id)a3;
- (_TtC5Media36RadioClusterNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)invalidate;
- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4;
- (void)viewDidLoad;
@end

@implementation RadioClusterNowPlayingViewController

- (_TtC5Media36RadioClusterNowPlayingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001EDC4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001BF38();
}

- (void)invalidate
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_cancelSet);
  swift_beginAccess();
  void *v2 = &_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
}

- (_TtC5Media36RadioClusterNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Media36RadioClusterNowPlayingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_carSession));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_lastSnapshot));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_song));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_lastCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_tertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_titleStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_multicastLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController____lazy_storage___backgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController____lazy_storage___visualEffectView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController____lazy_storage___progressView);
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_lastSnapshot);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_lastSnapshot) = (Class)a4;
  id v7 = a4;
  id v9 = a3;
  v8 = self;

  if (*((unsigned char *)&v8->super.super.super.isa
       + OBJC_IVAR____TtC5Media36RadioClusterNowPlayingViewController_iOSOwnsMainAudio) == 1)
    sub_10001C768();
}

@end
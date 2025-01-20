@interface AssetMovieViewController
- (_TtC16ProductKitViewer24AssetMovieViewController)initWithCoder:(id)a3;
- (_TtC16ProductKitViewer24AssetMovieViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation AssetMovieViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10000D8B4();
}

- (_TtC16ProductKitViewer24AssetMovieViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC16ProductKitViewer24AssetMovieViewController_mode) = 1;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC16ProductKitViewer24AssetMovieViewController_mode) = 1;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AssetMovieViewController();
  v9 = [(AssetMovieViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC16ProductKitViewer24AssetMovieViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC16ProductKitViewer24AssetMovieViewController_mode) = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AssetMovieViewController();
  return [(AssetMovieViewController *)&v5 initWithCoder:a3];
}

@end
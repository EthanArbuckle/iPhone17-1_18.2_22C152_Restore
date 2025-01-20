@interface SRAssetsDownloadBannerViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIEdgeInsets)bannerContentOutsets;
- (_TtC4Siri36SRAssetsDownloadBannerViewController)init;
- (_TtC4Siri36SRAssetsDownloadBannerViewController)initWithCoder:(id)a3;
- (_TtC4Siri36SRAssetsDownloadBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)openSettings:(id)a3;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)showBannerFor:(double)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SRAssetsDownloadBannerViewController

- (_TtC4Siri36SRAssetsDownloadBannerViewController)init
{
  sub_1000B477C();
  return result;
}

- (_TtC4Siri36SRAssetsDownloadBannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000B64B0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000B4DE0();
}

- (void)viewDidLayoutSubviews
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_pillView);
  id v3 = self;
  id v14 = v2;
  id v4 = [(SRAssetsDownloadBannerViewController *)v3 view];
  if (v4)
  {
    v5 = v4;
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    [v14 setFrame:v7, v9, v11, v13];
  }
  else
  {
    __break(1u);
  }
}

- (void)showBannerFor:(double)a3
{
  id v4 = self;
  sub_1000B4FD4(a3);
}

- (void)openSettings:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000B6694();
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_isBannerPresent) = 1;
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_isBannerPresent) = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC4Siri36SRAssetsDownloadBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Siri36SRAssetsDownloadBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_pillView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_bannerSource);
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_1000B6334();
}

- (NSString)requesterIdentifier
{
  return (NSString *)sub_1000B6334();
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_pillView) systemLayoutSizeFittingSize:a3.width, a3.height, a4.width, a4.height];
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIEdgeInsets)bannerContentOutsets
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Siri36SRAssetsDownloadBannerViewController_pillView) shadowOutsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end
@interface GroupSessionBannerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BNPresentableContext)presentableContext;
- (BOOL)_canShowWhileLocked;
- (BOOL)providesHostedContent;
- (UIEdgeInsets)bannerContentOutsets;
- (_TtC13MediaRemoteUI32GroupSessionBannerViewController)initWithCoder:(id)a3;
- (void)loadView;
- (void)setPresentableContext:(id)a3;
@end

@implementation GroupSessionBannerViewController

- (_TtC13MediaRemoteUI32GroupSessionBannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001A148();
}

- (void)loadView
{
  v2 = self;
  id v3 = sub_100019A2C();
  [(GroupSessionBannerViewController *)v2 setView:v3];
}

- (UIEdgeInsets)bannerContentOutsets
{
  v2 = self;
  id v3 = sub_100019A2C();
  [v3 shadowOutsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BNPresentableContext)presentableContext
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BNPresentableContext *)Strong;
}

- (void)setPresentableContext:(id)a3
{
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___routeIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_trailingIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___titleContentItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController____lazy_storage___pillView));
  id v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI32GroupSessionBannerViewController_presentableContext;

  sub_100008C10((uint64_t)v3);
}

@end
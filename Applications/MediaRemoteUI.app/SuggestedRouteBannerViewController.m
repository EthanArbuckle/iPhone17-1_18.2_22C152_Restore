@interface SuggestedRouteBannerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BNPresentableContext)presentableContext;
- (BOOL)_canShowWhileLocked;
- (BOOL)providesHostedContent;
- (UIEdgeInsets)bannerContentOutsets;
- (_TtC13MediaRemoteUI34SuggestedRouteBannerViewController)initWithCoder:(id)a3;
- (void)loadView;
- (void)setPresentableContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SuggestedRouteBannerViewController

- (void)loadView
{
  v2 = self;
  v3 = sub_100013698();
  [(SuggestedRouteBannerViewController *)v2 setView:v3];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100013820();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100013C0C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SuggestedRouteBannerViewController();
  v4 = v5.receiver;
  [(BannerBaseViewController *)&v5 viewDidAppear:v3];
  v4[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen] = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SuggestedRouteBannerViewController();
  v4 = v6.receiver;
  [(BannerBaseViewController *)&v6 viewDidDisappear:v3];
  if (*(void *)&v4[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_userInterfaceStyleTraitChangeRegistration])
  {
    swift_unknownObjectRetain();
    objc_super v5 = sub_100013698();
    UIView.unregisterForTraitChanges(_:)();
    swift_unknownObjectRelease();
  }
  v4[OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_isOnScreen] = 0;
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

- (UIEdgeInsets)bannerContentOutsets
{
  v2 = self;
  BOOL v3 = sub_100013698();
  id v4 = *(id *)&v3[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView];

  [v4 shadowOutsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (_TtC13MediaRemoteUI34SuggestedRouteBannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100014378();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController____lazy_storage___bannerView));
  id v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI34SuggestedRouteBannerViewController_presentableContext;

  sub_100008C10((uint64_t)v3);
}

@end
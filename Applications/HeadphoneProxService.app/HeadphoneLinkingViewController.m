@interface HeadphoneLinkingViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService30HeadphoneLinkingViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneLinkingViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeadphoneLinkingViewController();
  id v2 = v3.receiver;
  [(HeadphoneLinkingViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService30HeadphoneLinkingViewController)initWithContentView:(id)a3
{
  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_appleIDInfo];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(void *)&self->appleIDInfo[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_type] = 26;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HeadphoneLinkingViewController();
  return [(HeadphoneLinkingViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->appleIDInfo[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_appleIDInfo
                                  + 8];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v4 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneLinkingViewController_presenter];

  sub_100008F00((uint64_t)v4);
}

@end
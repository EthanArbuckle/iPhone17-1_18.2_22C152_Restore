@interface HeadphoneWhatsNewUpsellViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneWhatsNewUpsellViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006C6E8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  [(HeadphoneWhatsNewUpsellViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10008F420(v4[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController_type]);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  objc_super v5 = (_TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController *)sub_10006E6DC((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_10001A2AC((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController_model], &qword_1000D4CC0);
  swift_bridgeObjectRelease();
  BOOL v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end
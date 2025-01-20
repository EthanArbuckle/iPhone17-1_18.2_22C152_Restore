@interface HeadphoneMuteCallUpsellViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService37HeadphoneMuteCallUpsellViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneMuteCallUpsellViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10004381C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  [(HeadphoneMuteCallUpsellViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10008F420(v4[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneMuteCallUpsellViewController_type]);

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

- (_TtC20HeadphoneProxService37HeadphoneMuteCallUpsellViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneMuteCallUpsellViewController_tintColor] = 0;
  *(void *)&self->tintColor[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneMuteCallUpsellViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneMuteCallUpsellViewController_type] = 7;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(HeadphoneMuteCallUpsellViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
  BOOL v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneMuteCallUpsellViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end
@interface HeadphoneAdaptiveControlsUpsellViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService45HeadphoneAdaptiveControlsUpsellViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneAdaptiveControlsUpsellViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100006D08();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  [(HeadphoneAdaptiveControlsUpsellViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10008F420(v4[OBJC_IVAR____TtC20HeadphoneProxService45HeadphoneAdaptiveControlsUpsellViewController_type]);

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

- (_TtC20HeadphoneProxService45HeadphoneAdaptiveControlsUpsellViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService45HeadphoneAdaptiveControlsUpsellViewController_sectionWidth] = 0x4074000000000000;
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService45HeadphoneAdaptiveControlsUpsellViewController_estimatedSectionHeight] = 0x4056800000000000;
  *(void *)&self->sectionWidth[OBJC_IVAR____TtC20HeadphoneProxService45HeadphoneAdaptiveControlsUpsellViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService45HeadphoneAdaptiveControlsUpsellViewController_type] = 8;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(HeadphoneAdaptiveControlsUpsellViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end
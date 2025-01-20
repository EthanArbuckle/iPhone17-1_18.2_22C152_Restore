@interface HeadphoneControlCenterTrainingViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneControlCenterTrainingViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100083484();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(HeadphoneControlCenterTrainingViewController *)&v5 viewDidAppear:v3];
  sub_100083890();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_trainingView] = 0;
  *(void *)&self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_horizontalConstraint] = 0;
  *(void *)&self->trainingView[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_type] = 4;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(HeadphoneControlCenterTrainingViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
  BOOL v3 = &self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService44HeadphoneControlCenterTrainingViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end
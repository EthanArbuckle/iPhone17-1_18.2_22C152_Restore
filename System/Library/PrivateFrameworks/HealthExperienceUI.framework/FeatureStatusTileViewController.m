@interface FeatureStatusTileViewController
- (_TtC18HealthExperienceUI31FeatureStatusTileViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31FeatureStatusTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didSelectCell:(id)a3 in:(id)a4;
- (void)viewDidLoad;
@end

@implementation FeatureStatusTileViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FeatureStatusTileViewController();
  id v2 = v8.receiver;
  [(FeatureStatusTileViewController *)&v8 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v8.receiver, v8.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = sub_1AD6C7958();
    objc_msgSend(v4, sel_addSubview_, v5);

    id v6 = sub_1AD6C7958();
    id v7 = objc_msgSend(v2, sel_view);
    objc_msgSend(v6, sel_hk_alignConstraintsWithView_, v7);
  }
  else
  {
    __break(1u);
  }
}

- (void)didSelectCell:(id)a3 in:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  id v9 = sub_1AD6C7958();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

  id v10 = sub_1AD6C7958();
  sub_1AD357738();
}

- (_TtC18HealthExperienceUI31FeatureStatusTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    id v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController_context;
    *(_OWORD *)id v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((void *)v6 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController____lazy_storage___featureStatusPlatformView) = 0;
    id v7 = a4;
    objc_super v8 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController_context;
    *(_OWORD *)id v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((void *)v9 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController____lazy_storage___featureStatusPlatformView) = 0;
    id v10 = a4;
    objc_super v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FeatureStatusTileViewController();
  v11 = [(FeatureStatusTileViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC18HealthExperienceUI31FeatureStatusTileViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController____lazy_storage___featureStatusPlatformView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FeatureStatusTileViewController();
  return [(FeatureStatusTileViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1AD353CB0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController_context);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI31FeatureStatusTileViewController____lazy_storage___featureStatusPlatformView);
}

@end
@interface PLBUIChartViewController
+ (NSString)chartIdentifier10Days;
+ (NSString)chartIdentifier24Hrs;
+ (double)graphHeightWithTraitCollection:(id)a3;
+ (void)reloadLocale;
- (_TtC14BatteryUsageUI24PLBUIChartViewController)initWithCoder:(id)a3;
- (_TtC14BatteryUsageUI24PLBUIChartViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP14BatteryUsageUI32PLBUIChartViewControllerDelegate_)delegate;
- (void)beginUpdate;
- (void)endUpdate;
- (void)setActiveChart:(id)a3;
- (void)setContainerBackgroundColor:(id)a3;
- (void)setDataset:(id)a3 endOfDay:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMarginWithTop:(double)a3 bottom:(double)a4;
- (void)setTappedIndex:(id)a3;
@end

@implementation PLBUIChartViewController

+ (double)graphHeightWithTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = sub_54628();
  swift_beginAccess();
  v6 = *(void (**)(id))(*(void *)*v5 + 528);
  swift_retain();
  v6(a3);
  swift_release();
  double v7 = sub_5E5D4();

  return v7;
}

+ (NSString)chartIdentifier24Hrs
{
  NSString v2 = sub_90010();

  return (NSString *)v2;
}

+ (NSString)chartIdentifier10Days
{
  NSString v2 = sub_90010();

  return (NSString *)v2;
}

- (_TtP14BatteryUsageUI32PLBUIChartViewControllerDelegate_)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP14BatteryUsageUI32PLBUIChartViewControllerDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

+ (void)reloadLocale
{
  NSString v2 = sub_54628();
  type metadata accessor for BUIChartViewConfig(0);
  uint64_t v3 = sub_537C0();
  swift_beginAccess();
  *NSString v2 = v3;
  swift_release();
}

- (void)beginUpdate
{
  NSString v2 = *(void (**)(uint64_t))((char *)&stru_B8.size + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  uint64_t v3 = self;
  v2(1);
}

- (void)endUpdate
{
  NSString v2 = *(void (**)(void))((char *)&stru_B8.size + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  uint64_t v3 = self;
  v2(0);
  (*(void (**)(void))&stru_108.segname[(swift_isaMask & (uint64_t)v3->super.super.super.isa) + 16])();
}

- (void)setActiveChart:(id)a3
{
  uint64_t v4 = sub_90020();
  v6 = v5;
  double v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  PLBUIChartViewController.setActiveChart(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)setTappedIndex:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  PLBUIChartViewController.setTappedIndex(_:)(v9);
}

- (void)setDataset:(id)a3 endOfDay:(id)a4
{
  uint64_t v6 = sub_8F150();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  NSNumber_optional v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_8F130();
  id v10 = a3;
  v11 = self;
  PLBUIChartViewController.setDataset(_:endOfDay:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)setMarginWithTop:(double)a3 bottom:(double)a4
{
  uint64_t v6 = *(uint64_t (**)(void))((char *)&stru_68.flags + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  uint64_t v7 = self;
  uint64_t v8 = v6();
  if (!v8)
  {
    __break(1u);
    goto LABEL_7;
  }
  (*(void (**)(uint64_t, double))(*(void *)v8 + 296))(v8, a3);
  uint64_t v9 = swift_release();
  uint64_t v10 = ((uint64_t (*)(uint64_t))v6)(v9);
  if (!v10)
  {
LABEL_7:
    __break(1u);
    return;
  }
  (*(void (**)(uint64_t, double))(*(void *)v10 + 344))(v10, a4);

  swift_release();
}

- (void)setContainerBackgroundColor:(id)a3
{
  uint64_t v4 = *(uint64_t (**)(void))((char *)&stru_68.flags + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = v4();
  if (v7)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)v7 + 392);
    id v9 = v5;
    v8();

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (_TtC14BatteryUsageUI24PLBUIChartViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_90020();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC14BatteryUsageUI24PLBUIChartViewController *)PLBUIChartViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC14BatteryUsageUI24PLBUIChartViewController)initWithCoder:(id)a3
{
  return (_TtC14BatteryUsageUI24PLBUIChartViewController *)PLBUIChartViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_822E4((uint64_t)self + OBJC_IVAR____TtC14BatteryUsageUI24PLBUIChartViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14BatteryUsageUI24PLBUIChartViewController_hostingController));
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14BatteryUsageUI24PLBUIChartViewController_receiver;

  sub_6E9A0((uint64_t)v3);
}

@end
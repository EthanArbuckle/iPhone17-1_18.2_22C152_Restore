@interface SummarySharingAlertsSelectionViewController
- (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController)initWithCollectionViewLayout:(id)a3;
- (void)done;
- (void)viewDidLoad;
@end

@implementation SummarySharingAlertsSelectionViewController

- (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController_cancellables) = (Class)MEMORY[0x1E4FBC860];
  id v5 = a3;

  result = (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD5F3824();
}

- (void)done
{
  v2 = self;
  sub_1AD5F39D4();
}

- (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1AD24D3D8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI43SummarySharingAlertsSelectionViewController_delegate);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
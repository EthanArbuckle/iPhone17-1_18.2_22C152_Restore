@interface AllTrendsViewController
- (_TtC18HealthExperienceUI23AllTrendsViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI23AllTrendsViewController)initWithCollectionViewLayout:(id)a3;
- (void)restoreUserActivityState:(id)a3;
- (void)viewDidLoad;
@end

@implementation AllTrendsViewController

- (_TtC18HealthExperienceUI23AllTrendsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI23AllTrendsViewController_cancellables) = (Class)MEMORY[0x1E4FBC870];
  id v4 = a3;

  result = (_TtC18HealthExperienceUI23AllTrendsViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD61AC3C();
}

- (void)restoreUserActivityState:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AllTrendsViewController();
  [(AllTrendsViewController *)&v4 restoreUserActivityState:a3];
}

- (_TtC18HealthExperienceUI23AllTrendsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI23AllTrendsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23AllTrendsViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23AllTrendsViewController_healthExperienceStore);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
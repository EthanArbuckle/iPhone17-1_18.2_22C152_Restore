@interface AllHighlightsForDataTypeViewController
- (_TtC18HealthExperienceUI38AllHighlightsForDataTypeViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI38AllHighlightsForDataTypeViewController)initWithCollectionViewLayout:(id)a3;
- (void)viewDidLoad;
@end

@implementation AllHighlightsForDataTypeViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD4D4A44();
}

- (_TtC18HealthExperienceUI38AllHighlightsForDataTypeViewController)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI38AllHighlightsForDataTypeViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI38AllHighlightsForDataTypeViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI38AllHighlightsForDataTypeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38AllHighlightsForDataTypeViewController_hkType));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38AllHighlightsForDataTypeViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI38AllHighlightsForDataTypeViewController_healthExperienceStore);
  swift_bridgeObjectRelease();
}

@end
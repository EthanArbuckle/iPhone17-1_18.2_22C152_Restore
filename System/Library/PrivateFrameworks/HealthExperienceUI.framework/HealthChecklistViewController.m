@interface HealthChecklistViewController
- (_TtC18HealthExperienceUI29HealthChecklistViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29HealthChecklistViewController)initWithCollectionViewLayout:(id)a3;
- (void)dismissProfile:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HealthChecklistViewController

- (_TtC18HealthExperienceUI29HealthChecklistViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController____lazy_storage___mainStore;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController____lazy_storage___dataSources) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI29HealthChecklistViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD34B100();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AD34B26C(a3);
}

- (void)dismissProfile:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  id v5 = (_TtC18HealthExperienceUI29HealthChecklistViewController *)[(HealthChecklistViewController *)v4 navigationController];
  if (v5)
  {
    v6 = v5;
    [(HealthChecklistViewController *)v5 dismissViewControllerAnimated:1 completion:0];

    v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

- (_TtC18HealthExperienceUI29HealthChecklistViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI29HealthChecklistViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD34C09C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController____lazy_storage___mainStore);
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController_analyticsSource);
  unint64_t v4 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC18HealthExperienceUI29HealthChecklistViewController_analyticsSource);
  sub_1AD34C110(v3, v4);
}

@end
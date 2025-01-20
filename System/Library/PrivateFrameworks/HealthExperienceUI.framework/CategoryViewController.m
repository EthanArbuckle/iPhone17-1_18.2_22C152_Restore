@interface CategoryViewController
- (NSString)sidebarSelectionIdentifier;
- (_TtC18HealthExperienceUI22CategoryViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI22CategoryViewController)initWithCollectionViewLayout:(id)a3;
- (void)observedTraitsDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
- (void)restoreUserActivityState:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CategoryViewController

- (NSString)sidebarSelectionIdentifier
{
  v2 = self;
  sub_1AD58AE0C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC18HealthExperienceUI22CategoryViewController)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientView);
  type metadata accessor for CategoryGradientView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  void *v5 = objc_msgSend(v6, sel_init);
  v5[1] = &protocol witness table for CategoryGradientView;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientSubscriber) = 0;

  result = (_TtC18HealthExperienceUI22CategoryViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD58B6BC();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CategoryViewController();
  id v4 = v9.receiver;
  [(CompoundDataSourceCollectionViewController *)&v9 viewIsAppearing:v3];
  uint64_t v5 = (uint64_t)v4 + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientColorProvider;
  swift_beginAccess();
  sub_1AD1FFE38(v5, (uint64_t)v8);
  uint64_t v6 = v8[4];
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  id v7 = objc_msgSend(v4, sel_traitCollection);
  (*(void (**)(void))(v6 + 16))();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1AD58B940();
}

- (void)observedTraitsDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  sub_1AD1BA2A4(a3, (uint64_t)v7);
  swift_unknownObjectRelease();
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = (void (**)(char *, uint64_t))a3;
  uint64_t v5 = self;
  sub_1AD58C35C(v4);
}

- (_TtC18HealthExperienceUI22CategoryViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI22CategoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_pinnedContentManager);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientColorProvider);
  swift_release();
}

@end
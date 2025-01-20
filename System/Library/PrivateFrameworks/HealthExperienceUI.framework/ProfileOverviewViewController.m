@interface ProfileOverviewViewController
- (_TtC18HealthExperienceUI29ProfileOverviewViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29ProfileOverviewViewController)initWithCollectionViewLayout:(id)a3;
- (void)backButtonTapped:(id)a3;
- (void)restoreUserActivityState:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ProfileOverviewViewController

- (_TtC18HealthExperienceUI29ProfileOverviewViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD423338();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD41F8DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD42010C((uint64_t)a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ProfileOverviewViewController();
  id v4 = v8.receiver;
  [(ProfileOverviewViewController *)&v8 viewWillDisappear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel_navigationBar);

    objc_msgSend(v7, sel__setBackgroundOpacity_, 1.0);
    id v4 = v7;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ProfileOverviewViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(CompoundDataSourceCollectionViewController *)&v6 scrollViewDidScroll:v4];
  sub_1AD42221C();
}

- (void)backButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  id v5 = (_TtC18HealthExperienceUI29ProfileOverviewViewController *)[(ProfileOverviewViewController *)v4 navigationController];
  if (v5)
  {
    objc_super v6 = v5;
    id v7 = [(ProfileOverviewViewController *)v5 popViewControllerAnimated:1];

    id v4 = v6;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = (char *)a3;
  id v5 = self;
  sub_1AD420764(v4);
}

- (_TtC18HealthExperienceUI29ProfileOverviewViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI29ProfileOverviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_providedHealthExperienceStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_pinnedContentManager);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_navigationBarTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29ProfileOverviewViewController_gradientColorProvider);
}

@end
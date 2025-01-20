@interface SummarySharingRelationshipDetailsViewController
- (_TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController)initWithCollectionViewLayout:(id)a3;
- (void)didTapCancel;
- (void)doneButtonTapped;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation SummarySharingRelationshipDetailsViewController

- (_TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD320260();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD315E74();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD3162E8((uint64_t)a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AD316588((uint64_t)v4);
}

- (void)didTapCancel
{
}

- (_TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_navigationBarTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_healthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_healthExperienceStore);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_sharingEntryStore));
  id v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_sharingProfileInformation;
  uint64_t v4 = sub_1AD73C130();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1AD31BD28((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController_flow, type metadata accessor for SummarySharingSelectionFlow);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController____lazy_storage___doneButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingRelationshipDetailsViewController____lazy_storage___activitySpinnerItem));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)doneButtonTapped
{
  v2 = self;
  sub_1AD317F38();
}

@end
@interface ConceptFeedItemValueView
- (_TtC15HealthRecordsUI24ConceptFeedItemValueView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI24ConceptFeedItemValueView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation ConceptFeedItemValueView

- (_TtC15HealthRecordsUI24ConceptFeedItemValueView)initWithFrame:(CGRect)a3
{
  return (_TtC15HealthRecordsUI24ConceptFeedItemValueView *)ConceptFeedItemValueView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15HealthRecordsUI24ConceptFeedItemValueView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C23189F8();
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConceptFeedItemValueView();
  id v2 = v3.receiver;
  [(ConceptFeedItemValueView *)&v3 didMoveToSuperview];
  sub_1C2318150();
}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1C2318AC0(a4);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  sub_1C22AC064(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(void **)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(void **)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData), *(void **)((char *)&self->super._traitChangeRegistry+ OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView_viewData));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView____lazy_storage___textualValueView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI24ConceptFeedItemValueView____lazy_storage___referenceRangeView);
}

@end
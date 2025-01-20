@interface HRExpandedRangeValueView
- (HRExpandedRangeValueView)initWithCoder:(id)a3;
- (HRExpandedRangeValueView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)updateWithData:(id)a3;
@end

@implementation HRExpandedRangeValueView

- (HRExpandedRangeValueView)initWithFrame:(CGRect)a3
{
  return (HRExpandedRangeValueView *)_s15HealthRecordsUI22ExpandedRangeValueViewC5frameACSo6CGRectV_tcfc_0();
}

- (void)updateWithData:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C22C284C(a3);
}

- (HRExpandedRangeValueView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C22C3654();
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExpandedRangeValueView();
  id v2 = v3.receiver;
  [(HRExpandedRangeValueView *)&v3 didMoveToSuperview];
  sub_1C22C3080();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HRExpandedRangeValueView____lazy_storage___valueLabel));

  sub_1C22AC064(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR___HRExpandedRangeValueView_viewData), *(void **)((char *)&self->super._cachedTraitCollection + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(void **)((char *)&self->super._swiftAnimationInfo + OBJC_IVAR___HRExpandedRangeValueView_viewData), *(void **)((char *)&self->super._traitChangeRegistry + OBJC_IVAR___HRExpandedRangeValueView_viewData));
  swift_bridgeObjectRelease();
}

@end
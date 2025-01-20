@interface FMR1DistanceView
- (NSString)description;
- (UILabel)accessibilityDirectionLabel;
- (UILabel)accessibilityDistanceLabel;
- (_TtC11FMFindingUI16FMR1DistanceView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI16FMR1DistanceView)initWithFrame:(CGRect)a3;
@end

@implementation FMR1DistanceView

- (_TtC11FMFindingUI16FMR1DistanceView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D368158();
}

- (NSString)description
{
  v2 = self;
  sub_24D3636D0();

  id v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11FMFindingUI16FMR1DistanceView)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI16FMR1DistanceView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_style);
  v4 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_style);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_style);
  v6 = *(NSMutableArray **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_style);
  v7 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_style);
  v8 = *(_UITraitChangeRegistry **)((char *)&self->super._traitChangeRegistry
                                  + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_style);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_styleDistanceLabelFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_styleDirectionLabelFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_distanceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_directionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_directionLabelFont));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_distanceLabelHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_distanceLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_distanceSpring));
  swift_bridgeObjectRelease();
}

- (UILabel)accessibilityDistanceLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_distanceLabel));
}

- (UILabel)accessibilityDirectionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC11FMFindingUI16FMR1DistanceView_directionLabel));
}

@end
@interface CoreTextView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18HealthExperienceUI12CoreTextView)init;
- (_TtC18HealthExperienceUI12CoreTextView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI12CoreTextView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)onLinkTap:(id)a3;
@end

@implementation CoreTextView

- (_TtC18HealthExperienceUI12CoreTextView)init
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for CoreTextView());
  CoreTextView.init(frame:columns:)(1, 0, 0.0, 0.0, 0.0, 0.0);
  v4 = v3;
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (_TtC18HealthExperienceUI12CoreTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD4CD650();
}

- (void)drawRect:(CGRect)a3
{
  id v3 = self;
  sub_1AD4CD898();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  sub_1AD4CC628(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)onLinkTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD4CC910(v4);
}

- (_TtC18HealthExperienceUI12CoreTextView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18HealthExperienceUI12CoreTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD24D3D8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_attributedText));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_linkColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView____lazy_storage___tapRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult);
  uint64_t v4 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult);
  uint64_t v6 = *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult);
  uint64_t v7 = *(uint64_t *)((char *)&self->super._cachedTraitCollection
                  + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult);
  uint64_t v8 = *(uint64_t *)((char *)&self->super._swiftAnimationInfo
                  + OBJC_IVAR____TtC18HealthExperienceUI12CoreTextView_lastTypesettingResult);
  sub_1AD4CE684(v3, v4, v5, v6, v7, v8);
}

@end
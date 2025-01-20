@interface VisualAreaImageView
- (BOOL)hasContent;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC27AppleMediaServicesUIDynamic19VisualAreaImageView)init;
- (_TtC27AppleMediaServicesUIDynamic19VisualAreaImageView)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic19VisualAreaImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VisualAreaImageView

- (_TtC27AppleMediaServicesUIDynamic19VisualAreaImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF45ED6C();
}

- (void)layoutSubviews
{
  v2 = self;
  VisualAreaImageView.layoutSubviews()();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double width = a3.width;
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = VisualAreaImageView.measurements(fitting:in:)(width);
  double v9 = v8;
  double v11 = v10;
  swift_unknownObjectRelease();

  double v12 = 0.0;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.var3 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = VisualAreaImageView.hasContent.getter();

  return v3 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = self;
  CGSize v6 = VisualAreaImageView.sizeThatFits(_:)((CGSize)__PAIR128__(v5, *(unint64_t *)&width));

  double v7 = v6.width;
  double height = v6.height;
  result.double height = height;
  result.CGFloat width = v7;
  return result;
}

- (_TtC27AppleMediaServicesUIDynamic19VisualAreaImageView)init
{
}

- (_TtC27AppleMediaServicesUIDynamic19VisualAreaImageView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_artworkImageView));
  __swift_destroy_boxed_opaque_existential_2((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_sizeConstraints);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic19VisualAreaImageView_applyCachedArtwork);

  sub_1BF3CBCFC(v3);
}

@end
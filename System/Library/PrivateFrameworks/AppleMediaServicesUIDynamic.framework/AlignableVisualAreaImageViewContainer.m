@interface AlignableVisualAreaImageViewContainer
- (BOOL)hasContent;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer)init;
- (_TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AlignableVisualAreaImageViewContainer

- (_TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF45E20C();
}

- (void)layoutSubviews
{
  v2 = self;
  AlignableVisualAreaImageViewContainer.layoutSubviews()();
}

- (BOOL)hasContent
{
  v2 = self;
  unsigned __int8 v3 = AlignableVisualAreaImageViewContainer.hasContent.getter();

  return v3 & 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = AlignableVisualAreaImageViewContainer.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  AlignableVisualAreaImageViewContainer.measurements(fitting:in:)((uint64_t)a4, width, height);
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (_TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer)init
{
}

- (_TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic37AlignableVisualAreaImageViewContainer_visualAreaImageView));
}

@end
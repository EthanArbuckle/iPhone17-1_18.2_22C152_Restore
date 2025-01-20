@interface WidgetNamedImageView
- (BOOL)usesLegibility;
- (CLKImageProvider)imageProvider;
- (UIColor)color;
- (UIColor)overrideColor;
- (_TtC19ComplicationDisplay20WidgetNamedImageView)initWithCoder:(id)a3;
- (_TtC19ComplicationDisplay20WidgetNamedImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setOverrideColor:(id)a3;
- (void)setUsesLegibility:(BOOL)a3;
@end

@implementation WidgetNamedImageView

- (_TtC19ComplicationDisplay20WidgetNamedImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21E41D2A0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21E41B808();
}

- (CLKImageProvider)imageProvider
{
  return (CLKImageProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider));
}

- (void)setImageProvider:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_21E41B978(v4);
}

- (UIColor)color
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color));
}

- (void)setColor:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_21E41D348(a3);
}

- (BOOL)usesLegibility
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_usesLegibility);
}

- (void)setUsesLegibility:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_usesLegibility) = a3;
}

- (UIColor)overrideColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor));
}

- (void)setOverrideColor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor) = (Class)a3;
  id v3 = a3;
}

- (_TtC19ComplicationDisplay20WidgetNamedImageView)initWithFrame:(CGRect)a3
{
  result = (_TtC19ComplicationDisplay20WidgetNamedImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_hostingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_imageProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_color));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19ComplicationDisplay20WidgetNamedImageView_overrideColor);
}

@end
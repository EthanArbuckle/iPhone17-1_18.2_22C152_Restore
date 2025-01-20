@interface WidgetNamedImageProvider
- (CGSize)maxSize;
- (UIFont)font;
- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)init;
- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)initWithCoder:(id)a3;
- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)initWithForegroundAccentImage:(id)a3;
- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4;
- (id)copyWithZone:(void *)a3;
- (id)initPrivate;
- (int64_t)scale;
- (void)setFont:(id)a3;
- (void)setScale:(int64_t)a3;
@end

@implementation WidgetNamedImageProvider

- (UIFont)font
{
  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  return (UIFont *)*v2;
}

- (void)setFont:(id)a3
{
  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (int64_t)scale
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  swift_beginAccess();
  return *v2;
}

- (void)setScale:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_scale) = (Class)2;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_finalized) = 0;
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
  type metadata accessor for WidgetNamedImageProvider(0);
  void *v3 = 0;
  v3[1] = 0;
  swift_deallocPartialClassInstance();
  return 0;
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_21E41A374(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_21E41F950();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (CGSize)maxSize
{
  double v2 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
  double v3 = *(double *)(&self->super._finalized + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider__maxSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)init
{
  CGSize result = (_TtC19ComplicationDisplay24WidgetNamedImageProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)initWithJSONObjectRepresentation:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC19ComplicationDisplay24WidgetNamedImageProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initPrivate
{
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19ComplicationDisplay24WidgetNamedImageProvider)initWithForegroundAccentImage:(id)a3
{
  id v3 = a3;
  id result = (_TtC19ComplicationDisplay24WidgetNamedImageProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_named;
  uint64_t v4 = sub_21E41F3F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC19ComplicationDisplay24WidgetNamedImageProvider_font);
}

@end
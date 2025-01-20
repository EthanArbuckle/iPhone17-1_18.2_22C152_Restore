@interface BackdropHostView
- (BOOL)accessibilityIgnoresInvertColors;
- (_TtC11MediaCoreUI16BackdropHostView)initWithCoder:(id)a3;
- (_TtC11MediaCoreUI16BackdropHostView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BackdropHostView

- (_TtC11MediaCoreUI16BackdropHostView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_255BC6FCC();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(BackdropHostView *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC11MediaCoreUI16BackdropHostView_contentView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (_TtC11MediaCoreUI16BackdropHostView)initWithFrame:(CGRect)a3
{
  result = (_TtC11MediaCoreUI16BackdropHostView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MediaCoreUI16BackdropHostView_image);
}

@end
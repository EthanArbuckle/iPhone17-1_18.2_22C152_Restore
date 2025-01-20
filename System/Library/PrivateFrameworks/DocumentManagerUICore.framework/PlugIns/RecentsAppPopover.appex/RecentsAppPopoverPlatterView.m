@interface RecentsAppPopoverPlatterView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3;
- (_TtC17RecentsAppPopover28RecentsAppPopoverPlatterView)initWithFrame:(CGRect)a3;
- (_TtC17RecentsAppPopover28RecentsAppPopoverPlatterView)initWithRecipe:(int64_t)a3;
- (_TtC17RecentsAppPopover28RecentsAppPopoverPlatterView)initWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4;
- (void)layoutSubviews;
@end

@implementation RecentsAppPopoverPlatterView

- (_TtC17RecentsAppPopover28RecentsAppPopoverPlatterView)initWithRecipe:(int64_t)a3
{
  return (_TtC17RecentsAppPopover28RecentsAppPopoverPlatterView *)sub_100119148(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_100119390(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  CGFloat v3 = sub_100119520();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  id v5 = v15.receiver;
  -[RecentsAppPopoverPlatterView sizeThatFitsContentWithSize:](&v15, "sizeThatFitsContentWithSize:", width, height);
  double v7 = v6;
  double v9 = v8;
  id v10 = sub_100118668();
  objc_msgSend(v10, "sizeThatFits:", v7, v9, v15.receiver, v15.super_class);
  double v12 = v11;

  double v13 = v9 + ceil(v12);
  double v14 = v7;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001196DC();
}

- (_TtC17RecentsAppPopover28RecentsAppPopoverPlatterView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC17RecentsAppPopover28RecentsAppPopoverPlatterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC17RecentsAppPopover28RecentsAppPopoverPlatterView)initWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC17RecentsAppPopover28RecentsAppPopoverPlatterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  CGFloat v3 = &self->PLPlatterView_opaque[OBJC_IVAR____TtC17RecentsAppPopover28RecentsAppPopoverPlatterView_delegate];
  sub_10003CC04((uint64_t)v3);
}

@end
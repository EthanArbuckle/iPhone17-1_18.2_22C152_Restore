@interface BrickPlaceholderView
- (_TtC20ProductPageExtension20BrickPlaceholderView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension20BrickPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrickPlaceholderView

- (_TtC20ProductPageExtension20BrickPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20BrickPlaceholderView *)sub_10065D908(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20BrickPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10065DE88();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10065DA74();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20BrickPlaceholderView_artworkPlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension20BrickPlaceholderView_supplementaryTextPlaceholder);
}

@end
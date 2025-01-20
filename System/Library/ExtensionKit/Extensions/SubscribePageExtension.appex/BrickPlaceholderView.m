@interface BrickPlaceholderView
- (_TtC22SubscribePageExtension20BrickPlaceholderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20BrickPlaceholderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrickPlaceholderView

- (_TtC22SubscribePageExtension20BrickPlaceholderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20BrickPlaceholderView *)sub_1006351C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20BrickPlaceholderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100635740();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10063532C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20BrickPlaceholderView_artworkPlaceholder));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension20BrickPlaceholderView_supplementaryTextPlaceholder);
}

@end
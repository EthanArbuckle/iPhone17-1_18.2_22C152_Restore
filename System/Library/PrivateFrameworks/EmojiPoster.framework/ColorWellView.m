@interface ColorWellView
- (_TtC11EmojiPoster13ColorWellView)initWithCoder:(id)a3;
- (_TtC11EmojiPoster13ColorWellView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ColorWellView

- (_TtC11EmojiPoster13ColorWellView)initWithFrame:(CGRect)a3
{
  return (_TtC11EmojiPoster13ColorWellView *)sub_20B8F7D00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11EmojiPoster13ColorWellView)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster13ColorWellView *)sub_20B8F7E48(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  id v4 = [(ColorWellView *)v2 layer];
  [(ColorWellView *)v2 bounds];
  objc_msgSend(v4, sel_setCornerRadius_, v3 * 0.5);
}

@end
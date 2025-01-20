@interface ColorButton
- (_TtC11EmojiPoster11ColorButton)initWithCoder:(id)a3;
- (_TtC11EmojiPoster11ColorButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ColorButton

- (void)layoutSubviews
{
  v2 = self;
  sub_20B8FEB18();
}

- (_TtC11EmojiPoster11ColorButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ColorButton();
  return -[ColorButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11EmojiPoster11ColorButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ColorButton();
  return [(ColorButton *)&v5 initWithCoder:a3];
}

@end
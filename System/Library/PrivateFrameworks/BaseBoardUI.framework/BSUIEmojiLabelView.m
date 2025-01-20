@interface BSUIEmojiLabelView
- (BSUIEmojiLabelView)initWithFrame:(CGRect)a3;
@end

@implementation BSUIEmojiLabelView

- (BSUIEmojiLabelView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(BSUIPartialStylingLabelView *)self initWithTokenType:0];
  v8 = v7;
  if (v7) {
    -[BSUIEmojiLabelView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

@end
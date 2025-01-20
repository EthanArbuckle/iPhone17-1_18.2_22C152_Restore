@interface AAUIButton
- (CGSize)intrinsicContentSize;
- (void)layoutSubviews;
@end

@implementation AAUIButton

- (CGSize)intrinsicContentSize
{
  v2 = [(AAUIButton *)self titleLabel];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  [(AAUIButton *)self bounds];
  double Width = CGRectGetWidth(v6);
  double v4 = [(AAUIButton *)self titleLabel];
  [v4 setPreferredMaxLayoutWidth:Width];

  v5.receiver = self;
  v5.super_class = (Class)AAUIButton;
  [(AAUIButton *)&v5 layoutSubviews];
}

@end
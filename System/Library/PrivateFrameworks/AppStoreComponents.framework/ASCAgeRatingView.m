@interface ASCAgeRatingView
- (ASCAgeRatingView)initWithCoder:(id)a3;
- (ASCAgeRatingView)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCAgeRatingView

- (ASCAgeRatingView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASCAgeRatingView;
  v3 = -[ASCAgeRatingView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(ASCAgeRatingView *)v3 setTextColor:v4];

    [(ASCAgeRatingView *)v3 setAdjustsFontForContentSizeCategory:1];
    id v5 = objc_alloc_init(MEMORY[0x1E4F24388]);
    v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v5 setColor:v6];

    [(ASCAgeRatingView *)v3 _setTextEncapsulation:v5];
  }
  return v3;
}

- (ASCAgeRatingView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = NSString;
  v4 = ASCLocalizedFormatString(@"AX_AGE_RATING");
  id v5 = [(ASCAgeRatingView *)self text];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  return v6;
}

@end
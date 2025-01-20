@interface AVTGroupListCollectionViewCell
+ (double)estimatedLabelWidthForContainerWidth:(double)a3;
+ (id)cellIdentifier;
+ (id)defaultSymbolImageName;
+ (id)highlightedBackgroundColor;
- (AVTGroupListCollectionViewCell)initWithFrame:(CGRect)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSString)symbolName;
- (NSString)title;
- (UIImageView)imageView;
- (UILabel)label;
- (UIVisualEffectView)visualEffectView;
- (double)estimatedLabelWidth;
- (void)setSelected:(BOOL)a3;
- (void)setSymbolName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setupContent;
@end

@implementation AVTGroupListCollectionViewCell

+ (id)cellIdentifier
{
  return @"AVTGroupListCollectionViewCell";
}

+ (id)defaultSymbolImageName
{
  return @"suit.diamond.fill";
}

- (AVTGroupListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVTGroupListCollectionViewCell;
  v3 = -[AVTGroupListCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AVTGroupListCollectionViewCell *)v3 setupContent];
    v5 = [(AVTGroupListCollectionViewCell *)v4 layer];
    [v5 setMasksToBounds:1];

    v6 = [(AVTGroupListCollectionViewCell *)v4 layer];
    [v6 setCornerRadius:5.0];
  }
  return v4;
}

- (void)setupContent
{
  v34[2] = *MEMORY[0x263EF8340];
  v3 = [(AVTGroupListCollectionViewCell *)self contentView];
  id v4 = objc_alloc(MEMORY[0x263F1C768]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  label = self->_label;
  self->_label = v9;

  v11 = +[AVTUIFontRepository groupListLabelFont];
  [(UILabel *)self->_label setFont:v11];

  v12 = [MEMORY[0x263F1C550] clearColor];
  [(UILabel *)self->_label setBackgroundColor:v12];

  [(UILabel *)self->_label setNumberOfLines:2];
  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_label];
  v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v5, v6, v7, v8);
  imageView = self->_imageView;
  self->_imageView = v13;

  v15 = [MEMORY[0x263F1C550] grayColor];
  [(UIImageView *)self->_imageView setTintColor:v15];

  v16 = [MEMORY[0x263F1C550] clearColor];
  [(UIImageView *)self->_imageView setBackgroundColor:v16];

  v31 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D260]];
  [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v31];
  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_imageView];
  v17 = (void *)MEMORY[0x263F08938];
  v18 = self->_imageView;
  v33[0] = @"image";
  v33[1] = @"label";
  v19 = self->_label;
  v34[0] = v18;
  v34[1] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  v21 = [v17 constraintsWithVisualFormat:@"H:|-(imageL)-[image(imageLength)]-(spacing)-[label]-|" options:0 metrics:&unk_26BF4D648 views:v20];
  [v3 addConstraints:v21];

  v22 = [(UIImageView *)self->_imageView heightAnchor];
  v23 = [v22 constraintEqualToConstant:18.0];
  v32[0] = v23;
  v24 = [(UIImageView *)self->_imageView centerYAnchor];
  v25 = [v3 centerYAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v32[1] = v26;
  v27 = [(UILabel *)self->_label centerYAnchor];
  v28 = [v3 centerYAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v32[2] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
  [v3 addConstraints:v30];
}

+ (double)estimatedLabelWidthForContainerWidth:(double)a3
{
  return a3 + -26.0 + -5.0;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width = a3.width;
  [(id)objc_opt_class() estimatedLabelWidthForContainerWidth:a3.width];
  double v8 = v7;
  v9 = [(AVTGroupListCollectionViewCell *)self label];
  [v9 setPreferredMaxLayoutWidth:v8];

  v10 = [(AVTGroupListCollectionViewCell *)self contentView];
  objc_msgSend(v10, "systemLayoutSizeFittingSize:", width, 1.0);
  double v12 = v11;

  [(AVTGroupListCollectionViewCell *)self estimatedLabelWidth];
  double v14 = v13;
  v15 = [(AVTGroupListCollectionViewCell *)self label];
  [v15 preferredMaxLayoutWidth];
  if (v14 <= v16) {
    double v17 = 0.0;
  }
  else {
    double v17 = 10.0;
  }

  [(AVTGroupListCollectionViewCell *)self bounds];
  double v19 = v18;
  double v20 = 48.0;
  if (v12 >= 48.0) {
    double v20 = v12;
  }
  double v21 = v20 + v17;
  result.height = v21;
  result.double width = v19;
  return result;
}

- (double)estimatedLabelWidth
{
  v14[1] = *MEMORY[0x263EF8340];
  v3 = [(AVTGroupListCollectionViewCell *)self label];
  id v4 = [v3 text];

  if (!v4) {
    return 0.0;
  }
  uint64_t v13 = *MEMORY[0x263F1C238];
  double v5 = [(AVTGroupListCollectionViewCell *)self label];
  double v6 = [v5 font];
  v14[0] = v6;
  double v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

  double v8 = [(AVTGroupListCollectionViewCell *)self label];
  v9 = [v8 text];
  [v9 sizeWithAttributes:v7];
  double v11 = v10;

  return v11;
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    double v5 = [(AVTGroupListCollectionViewCell *)self label];
    [v5 setText:v6];
  }
}

- (void)setSymbolName:(id)a3
{
  p_symbolName = (id *)&self->_symbolName;
  id v12 = a3;
  if ((objc_msgSend(*p_symbolName, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_symbolName, a3);
    double v7 = [MEMORY[0x263F1C6B0] _systemImageNamed:v12];
    double v8 = v7;
    if (!v7)
    {
      v9 = (void *)MEMORY[0x263F1C6B0];
      p_symbolName = [(id)objc_opt_class() defaultSymbolImageName];
      v3 = [v9 _systemImageNamed:p_symbolName];
      double v8 = [v3 imageWithRenderingMode:2];
    }
    double v10 = [(AVTGroupListCollectionViewCell *)self imageView];
    [v10 setImage:v8];

    if (!v7)
    {
    }
    double v11 = [(AVTGroupListCollectionViewCell *)self imageView];
    [v11 setContentMode:1];
  }
}

+ (id)highlightedBackgroundColor
{
  v2 = [MEMORY[0x263F1C550] blackColor];
  v3 = [MEMORY[0x263F1C550] whiteColor];
  id v4 = +[AVTUIColorRepository dynamicColorWithLightColor:v2 darkColor:v3];
  double v5 = [v4 colorWithAlphaComponent:0.1];

  return v5;
}

- (void)setSelected:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVTGroupListCollectionViewCell;
  -[AVTGroupListCollectionViewCell setSelected:](&v6, sel_setSelected_);
  if (a3) {
    +[AVTUIColorRepository groupSidePickerCellSelectedBackgroundColor];
  }
  else {
  double v5 = [MEMORY[0x263F1C550] clearColor];
  }
  [(AVTGroupListCollectionViewCell *)self setBackgroundColor:v5];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (UILabel)label
{
  return self->_label;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
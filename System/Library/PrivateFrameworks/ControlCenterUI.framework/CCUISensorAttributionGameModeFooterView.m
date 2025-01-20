@interface CCUISensorAttributionGameModeFooterView
- (CCUISensorAttributionGameModeFooterView)initWithLabel:(id)a3;
- (CGRect)cachedExpandedRect;
- (UILabel)label;
- (void)setBlurRadius:(double)a3;
- (void)setCachedExpandedRect:(CGRect)a3;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
@end

@implementation CCUISensorAttributionGameModeFooterView

- (CCUISensorAttributionGameModeFooterView)initWithLabel:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CCUISensorAttributionGameModeFooterView;
  v5 = [(CCUISensorAttributionGameModeFooterView *)&v31 init];
  if (v5)
  {
    v29 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    v6 = [(CCUISensorAttributionGameModeFooterView *)v5 layer];
    v33[0] = v29;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [v6 setFilters:v7];

    [(SBFView *)v5 setAnimatedLayerProperties:&unk_1F2F4B788];
    [(CCUISensorAttributionGameModeFooterView *)v5 setClipsToBounds:0];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    v28 = [v9 preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] hiFontStyle:4];

    [(UILabel *)v8 setFont:v28];
    [(UILabel *)v8 setLineBreakMode:0];
    [(UILabel *)v8 setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v8 setAdjustsFontSizeToFitWidth:0];
    [(UILabel *)v8 setNumberOfLines:0];
    [(UILabel *)v8 setMaximumContentSizeCategory:*MEMORY[0x1E4FB2798]];
    [(UILabel *)v8 setMinimumScaleFactor:0.5];
    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v8 setTextColor:v10];

    [(UILabel *)v8 setText:v4];
    [(CCUISensorAttributionGameModeFooterView *)v5 addSubview:v8];
    label = v5->_label;
    v5->_label = v8;
    v12 = v8;

    v22 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(UILabel *)v12 topAnchor];
    v26 = [(CCUISensorAttributionGameModeFooterView *)v5 topAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v32[0] = v25;
    v24 = [(UILabel *)v12 bottomAnchor];
    v23 = [(CCUISensorAttributionGameModeFooterView *)v5 bottomAnchor];
    v13 = [v24 constraintEqualToAnchor:v23];
    v32[1] = v13;
    [(UILabel *)v12 leadingAnchor];
    v14 = id v30 = v4;
    v15 = [(CCUISensorAttributionGameModeFooterView *)v5 leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v32[2] = v16;
    v17 = [(UILabel *)v12 trailingAnchor];
    v18 = [(CCUISensorAttributionGameModeFooterView *)v5 trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v32[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    [v22 activateConstraints:v20];

    id v4 = v30;
  }

  return v5;
}

- (void)setText:(id)a3
{
}

- (void)setBlurRadius:(double)a3
{
  id v5 = [(CCUISensorAttributionGameModeFooterView *)self layer];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

- (CGRect)cachedExpandedRect
{
  double x = self->cachedExpandedRect.origin.x;
  double y = self->cachedExpandedRect.origin.y;
  double width = self->cachedExpandedRect.size.width;
  double height = self->cachedExpandedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->cachedExpandedRect = a3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
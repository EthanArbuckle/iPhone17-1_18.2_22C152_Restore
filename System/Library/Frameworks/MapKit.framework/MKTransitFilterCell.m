@interface MKTransitFilterCell
- (MKTransitFilterCell)initWithFrame:(CGRect)a3;
- (NSString)titleText;
- (void)_contentSizeDidChange;
- (void)_setupLabel;
- (void)setSelected:(BOOL)a3;
- (void)setTitleText:(id)a3;
@end

@implementation MKTransitFilterCell

- (MKTransitFilterCell)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MKTransitFilterCell;
  v3 = -[MKTransitFilterCell initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MKTransitFilterCell *)v3 _setupLabel];
    v5 = +[MKFontManager sharedManager];
    v6 = [v5 sectionHeaderFont];
    objc_msgSend(v6, "_mapkit_scaledValueForValue:", 32.0);
    double v8 = v7 * 0.5;
    v9 = [(MKTransitFilterCell *)v4 contentView];
    [v9 _setContinuousCornerRadius:v8];

    v10 = [(MKTransitFilterCell *)v4 contentView];
    v11 = [v10 layer];
    [v11 setMasksToBounds:1];

    v12 = [(MKTransitFilterCell *)v4 contentView];
    v13 = [v12 layer];
    [v13 setBorderWidth:1.0];

    id v14 = [MEMORY[0x1E4F428B8] lightGrayColor];
    uint64_t v15 = [v14 CGColor];
    v16 = [(MKTransitFilterCell *)v4 contentView];
    v17 = [v16 layer];
    [v17 setBorderColor:v15];

    v18 = [MEMORY[0x1E4F428B8] clearColor];
    v19 = [(MKTransitFilterCell *)v4 contentView];
    [v19 setBackgroundColor:v18];
  }
  return v4;
}

- (void)_setupLabel
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F42B38]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  label = self->_label;
  self->_label = v4;

  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_label setTextAlignment:1];
  [(UILabel *)self->_label setNumberOfLines:1];
  v6 = +[MKFontManager sharedManager];
  double v7 = [v6 sectionHeaderFont];
  [(UILabel *)self->_label setFont:v7];

  double v8 = [(MKTransitFilterCell *)self contentView];
  [v8 addSubview:self->_label];
  v18 = (void *)MEMORY[0x1E4F28DC8];
  v23 = [(UILabel *)self->_label leadingAnchor];
  v22 = [v8 leadingAnchor];
  objc_super v21 = [v23 constraintEqualToAnchor:v22];
  v24[0] = v21;
  v20 = [(UILabel *)self->_label trailingAnchor];
  v19 = [v8 trailingAnchor];
  v9 = [v20 constraintEqualToAnchor:v19];
  v24[1] = v9;
  v10 = [(UILabel *)self->_label topAnchor];
  v11 = [v8 topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v24[2] = v12;
  v13 = [(UILabel *)self->_label bottomAnchor];
  id v14 = [v8 bottomAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14];
  v24[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  [v18 activateConstraints:v16];

  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
}

- (void)setTitleText:(id)a3
{
}

- (NSString)titleText
{
  return [(UILabel *)self->_label text];
}

- (void)_contentSizeDidChange
{
  id v3 = +[MKFontManager sharedManager];
  v4 = [v3 sectionHeaderFont];
  [(UILabel *)self->_label setFont:v4];

  id v9 = +[MKFontManager sharedManager];
  v5 = [v9 sectionHeaderFont];
  objc_msgSend(v5, "_mapkit_scaledValueForValue:", 32.0);
  double v7 = v6 * 0.5;
  double v8 = [(MKTransitFilterCell *)self contentView];
  [v8 _setContinuousCornerRadius:v7];
}

- (void)setSelected:(BOOL)a3
{
  if (a3)
  {
    v4 = [MEMORY[0x1E4F428B8] systemBlueColor];
    v5 = [(MKTransitFilterCell *)self contentView];
    [v5 setBackgroundColor:v4];

    double v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UILabel *)self->_label setTextColor:v6];

    [MEMORY[0x1E4F428B8] systemBlueColor];
  }
  else
  {
    double v7 = [MEMORY[0x1E4F428B8] clearColor];
    double v8 = [(MKTransitFilterCell *)self contentView];
    [v8 setBackgroundColor:v7];

    id v9 = [MEMORY[0x1E4F428B8] labelColor];
    [(UILabel *)self->_label setTextColor:v9];

    [MEMORY[0x1E4F428B8] lightGrayColor];
  }
  id v13 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v13 CGColor];
  v11 = [(MKTransitFilterCell *)self contentView];
  v12 = [v11 layer];
  [v12 setBorderColor:v10];
}

- (void).cxx_destruct
{
}

@end
@interface DMCEnrollmentNameItemCell
+ (id)_titleFont;
- (DMCEnrollmentNameItemCell)initWithFrame:(CGRect)a3;
- (UILabel)textLabel;
- (void)layoutSubviews;
- (void)setTextLabel:(id)a3;
@end

@implementation DMCEnrollmentNameItemCell

- (DMCEnrollmentNameItemCell)initWithFrame:(CGRect)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)DMCEnrollmentNameItemCell;
  v3 = -[DMCEnrollmentNameItemCell initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v4;

    [(UILabel *)v3->_textLabel setNumberOfLines:1];
    [(UILabel *)v3->_textLabel setTextAlignment:1];
    v6 = +[DMCEnrollmentNameItemCell _titleFont];
    [(UILabel *)v3->_textLabel setFont:v6];

    v7 = [(DMCEnrollmentNameItemCell *)v3 contentView];
    [v7 addSubview:v3->_textLabel];

    objc_initWeak(&location, v3);
    v15[0] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __43__DMCEnrollmentNameItemCell_initWithFrame___block_invoke;
    v11[3] = &unk_2645E8EB0;
    objc_copyWeak(&v12, &location);
    id v9 = (id)[(DMCEnrollmentNameItemCell *)v3 registerForTraitChanges:v8 withHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__DMCEnrollmentNameItemCell_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[DMCEnrollmentNameItemCell _titleFont];
  v2 = [WeakRetained textLabel];
  [v2 setFont:v1];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)DMCEnrollmentNameItemCell;
  [(DMCEnrollmentNameItemCell *)&v13 layoutSubviews];
  v3 = [(DMCEnrollmentNameItemCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(DMCEnrollmentNameItemCell *)self textLabel];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

+ (id)_titleFont
{
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260]];
  v3 = (void *)MEMORY[0x263F81708];
  double v4 = [v2 fontDescriptorWithSymbolicTraits:2];
  double v5 = [v3 fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
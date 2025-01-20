@interface DMCEnrollmentTableViewTitleCell
- (DMCEnrollmentTableViewTitleCell)initWithTitle:(id)a3;
- (NSString)title;
- (UILabel)label;
- (double)cellHeight;
- (double)estimatedCellHeight;
- (id)_fontForTitle;
- (void)layoutSubviews;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation DMCEnrollmentTableViewTitleCell

- (DMCEnrollmentTableViewTitleCell)initWithTitle:(id)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v29.receiver = self;
  v29.super_class = (Class)DMCEnrollmentTableViewTitleCell;
  v7 = [(DMCEnrollmentTableViewTitleCell *)&v29 initWithStyle:0 reuseIdentifier:v6];

  if (v7)
  {
    v8 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [(DMCEnrollmentTableViewTitleCell *)v7 setBackgroundColor:v8];

    [(DMCEnrollmentTableViewTitleCell *)v7 setSelectionStyle:0];
    v9 = objc_opt_new();
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setNumberOfLines:0];
    v10 = [(DMCEnrollmentTableViewTitleCell *)v7 _fontForTitle];
    [v9 setFont:v10];

    [v9 setTextAlignment:1];
    [v9 setText:v4];
    [v9 sizeToFit];
    v11 = [(DMCEnrollmentTableViewTitleCell *)v7 contentView];
    [v11 addSubview:v9];

    v31 = @"label";
    v32[0] = v9;
    v12 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v13 = (void *)MEMORY[0x263F08938];
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"|-%f-[label]-%f-|", 0x4014000000000000, 0x4014000000000000);
    v15 = [v13 constraintsWithVisualFormat:v14 options:0 metrics:0 views:v12];

    v16 = (void *)MEMORY[0x263F08938];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"V:|-%f-[label]-%f-|", 0x4014000000000000, 0x4014000000000000);
    v18 = [v16 constraintsWithVisualFormat:v17 options:0 metrics:0 views:v12];

    v19 = [(DMCEnrollmentTableViewTitleCell *)v7 contentView];
    [v19 addConstraints:v15];

    v20 = [(DMCEnrollmentTableViewTitleCell *)v7 contentView];
    [v20 addConstraints:v18];

    uint64_t v21 = [v4 copy];
    title = v7->_title;
    v7->_title = (NSString *)v21;

    objc_storeStrong((id *)&v7->_label, v9);
    objc_initWeak(&location, v7);
    uint64_t v30 = objc_opt_class();
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __49__DMCEnrollmentTableViewTitleCell_initWithTitle___block_invoke;
    v26[3] = &unk_2645E8EB0;
    objc_copyWeak(&v27, &location);
    id v24 = (id)[(DMCEnrollmentTableViewTitleCell *)v7 registerForTraitChanges:v23 withHandler:v26];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __49__DMCEnrollmentTableViewTitleCell_initWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained _fontForTitle];
  v2 = [WeakRetained label];
  [v2 setFont:v1];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DMCEnrollmentTableViewTitleCell;
  [(DMCEnrollmentTableViewTitleCell *)&v3 layoutSubviews];
  [(DMCEnrollmentTableViewTitleCell *)self setUserInteractionEnabled:0];
  [(DMCEnrollmentTableViewTitleCell *)self bounds];
  -[DMCEnrollmentTableViewTitleCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v4), 0.0, 0.0);
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    CGRect v4 = (NSString *)[v7 copy];
    title = self->_title;
    self->_title = v4;

    v6 = [(DMCEnrollmentTableViewTitleCell *)self label];
    [v6 setText:v7];

    [(DMCEnrollmentTableViewTitleCell *)self setNeedsDisplay];
  }
}

- (double)cellHeight
{
  return *MEMORY[0x263F1D600];
}

- (double)estimatedCellHeight
{
  return 50.0;
}

- (id)_fontForTitle
{
  int v2 = MGGetSInt32Answer();
  objc_super v3 = (void *)MEMORY[0x263F1D2B0];
  if (v2 == 5) {
    objc_super v3 = (void *)MEMORY[0x263F1D2F8];
  }
  CGRect v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*v3];
  v5 = (void *)MEMORY[0x263F81708];
  v6 = [v4 fontDescriptorWithSymbolicTraits:2];
  id v7 = [v5 fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (NSString)title
{
  return self->_title;
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
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
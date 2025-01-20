@interface DMCEnrollmentTableViewPromotionCell
- (DMCEnrollmentTableViewPromotionCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)icon;
- (double)cellHeight;
- (double)estimatedCellHeight;
- (double)gapToNextSection;
- (id)_subtitleFont;
- (id)_titleFont;
- (void)_setupContentConfigurationWithIcon:(id)a3 title:(id)a4 subtitle:(id)a5;
- (void)layoutSubviews;
- (void)setIcon:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation DMCEnrollmentTableViewPromotionCell

- (DMCEnrollmentTableViewPromotionCell)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v25.receiver = self;
  v25.super_class = (Class)DMCEnrollmentTableViewPromotionCell;
  v13 = [(DMCEnrollmentTableViewPromotionCell *)&v25 initWithStyle:0 reuseIdentifier:v12];

  if (v13)
  {
    [(DMCEnrollmentTableViewPromotionCell *)v13 setSelectionStyle:0];
    [(DMCEnrollmentTableViewPromotionCell *)v13 setUserInteractionEnabled:0];
    v14 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    [(DMCEnrollmentTableViewPromotionCell *)v13 setBackgroundColor:v14];

    [(DMCEnrollmentTableViewPromotionCell *)v13 _setupContentConfigurationWithIcon:v10 title:v8 subtitle:v9];
    objc_storeStrong((id *)&v13->_icon, a5);
    uint64_t v15 = [v8 copy];
    title = v13->_title;
    v13->_title = (NSString *)v15;

    uint64_t v17 = [v9 copy];
    subtitle = v13->_subtitle;
    v13->_subtitle = (NSString *)v17;

    objc_initWeak(&location, v13);
    v26[0] = objc_opt_class();
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __67__DMCEnrollmentTableViewPromotionCell_initWithTitle_subtitle_icon___block_invoke;
    v22[3] = &unk_2645E8EB0;
    objc_copyWeak(&v23, &location);
    id v20 = (id)[(DMCEnrollmentTableViewPromotionCell *)v13 registerForTraitChanges:v19 withHandler:v22];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __67__DMCEnrollmentTableViewPromotionCell_initWithTitle_subtitle_icon___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained icon];
  v2 = [WeakRetained title];
  v3 = [WeakRetained subtitle];
  [WeakRetained _setupContentConfigurationWithIcon:v1 title:v2 subtitle:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DMCEnrollmentTableViewPromotionCell;
  [(DMCEnrollmentTableViewPromotionCell *)&v3 layoutSubviews];
  [(DMCEnrollmentTableViewPromotionCell *)self bounds];
  -[DMCEnrollmentTableViewPromotionCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v4), 0.0, 0.0);
}

- (double)cellHeight
{
  return *MEMORY[0x263F1D600];
}

- (double)estimatedCellHeight
{
  return 64.0;
}

- (double)gapToNextSection
{
  return 12.0;
}

- (void)_setupContentConfigurationWithIcon:(id)a3 title:(id)a4 subtitle:(id)a5
{
  v35[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F1C780];
  id v10 = a4;
  id v31 = a3;
  v11 = [v9 cellConfiguration];
  id v12 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v13 = *MEMORY[0x263F814F0];
  v34[0] = *MEMORY[0x263F814F0];
  v14 = self;
  uint64_t v15 = [(DMCEnrollmentTableViewPromotionCell *)self _titleFont];
  v35[0] = v15;
  uint64_t v16 = *MEMORY[0x263F81500];
  v34[1] = *MEMORY[0x263F81500];
  uint64_t v17 = [MEMORY[0x263F1C550] labelColor];
  v35[1] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  v19 = (void *)[v12 initWithString:v10 attributes:v18];

  if (v8)
  {
    id v20 = objc_alloc(MEMORY[0x263F086A0]);
    v32[0] = v13;
    v21 = [(DMCEnrollmentTableViewPromotionCell *)v14 _subtitleFont];
    v32[1] = v16;
    v33[0] = v21;
    v22 = [MEMORY[0x263F1C550] secondaryLabelColor];
    v33[1] = v22;
    id v23 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    v24 = (void *)[v20 initWithString:v8 attributes:v23];
  }
  else
  {
    v24 = 0;
  }
  objc_super v25 = v14;
  [v11 directionalLayoutMargins];
  double v27 = v26;
  double v29 = v28;
  [v11 setImage:v31];

  v30 = [v11 imageProperties];
  objc_msgSend(v30, "setMaximumSize:", 32.0, 32.0);

  [v11 setAttributedText:v19];
  [v11 setSecondaryAttributedText:v24];
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 13.0, v27, 13.0, v29);
  [(DMCEnrollmentTableViewPromotionCell *)v25 setContentConfiguration:v11];
}

- (id)_titleFont
{
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280]];
  objc_super v3 = (void *)MEMORY[0x263F81708];
  CGRect v4 = [v2 fontDescriptorWithSymbolicTraits:2];
  v5 = [v3 fontWithDescriptor:v4 size:0.0];

  return v5;
}

- (id)_subtitleFont
{
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D270]];
  objc_super v3 = [MEMORY[0x263F81708] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
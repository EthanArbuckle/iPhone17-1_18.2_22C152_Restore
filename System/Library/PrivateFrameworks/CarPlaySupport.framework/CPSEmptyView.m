@interface CPSEmptyView
- (CPSAbridgableLabel)subtitleLabel;
- (CPSAbridgableLabel)titleLabel;
- (CPSEmptyView)initWithFrame:(CGRect)a3;
- (NSArray)subtitleVariants;
- (NSArray)titleVariants;
- (void)_updateLabelTraits;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleVariants:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleVariants:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPSEmptyView

- (CPSEmptyView)initWithFrame:(CGRect)a3
{
  v39[6] = *MEMORY[0x263EF8340];
  CGRect v38 = a3;
  SEL v36 = a2;
  v37 = 0;
  v35.receiver = self;
  v35.super_class = (Class)CPSEmptyView;
  v32 = -[CPSEmptyView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v37 = v32;
  objc_storeStrong((id *)&v37, v32);
  if (v32)
  {
    [(CPSEmptyView *)v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    v3 = [CPSAbridgableLabel alloc];
    v7 = (double *)MEMORY[0x263F001A8];
    v34 = -[CPSAbridgableLabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(CPSAbridgableLabel *)v34 setTranslatesAutoresizingMaskIntoConstraints:0];
    -[CPSAbridgableLabel setTextAlignment:](v34, "setTextAlignment:");
    id v6 = (id)[MEMORY[0x263F1C550] labelColor];
    -[CPSAbridgableLabel setTextColor:](v34, "setTextColor:");

    [(CPSAbridgableLabel *)v34 setNumberOfLines:1];
    [(CPSEmptyView *)v37 addSubview:v34];
    [(CPSEmptyView *)v37 setTitleLabel:v34];
    v33 = -[CPSAbridgableLabel initWithFrame:]([CPSAbridgableLabel alloc], "initWithFrame:", *v7, v7[1], v7[2], v7[3]);
    [(CPSAbridgableLabel *)v33 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CPSAbridgableLabel *)v33 setTextAlignment:1];
    id v8 = (id)[MEMORY[0x263F1C550] labelColor];
    -[CPSAbridgableLabel setTextColor:](v33, "setTextColor:");

    [(CPSAbridgableLabel *)v33 setNumberOfLines:2];
    [(CPSEmptyView *)v37 addSubview:v33];
    [(CPSEmptyView *)v37 setSubtitleLabel:v33];
    v9 = (void *)MEMORY[0x263F08938];
    id v31 = (id)[(CPSAbridgableLabel *)v34 topAnchor];
    id v30 = (id)[(CPSEmptyView *)v37 safeAreaLayoutGuide];
    id v29 = (id)[v30 topAnchor];
    id v28 = (id)objc_msgSend(v31, "constraintEqualToAnchor:constant:", 5.0);
    v39[0] = v28;
    id v27 = (id)[(CPSAbridgableLabel *)v34 leftAnchor];
    id v26 = (id)[(CPSEmptyView *)v37 safeAreaLayoutGuide];
    id v25 = (id)[v26 leftAnchor];
    id v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:constant:", 12.0);
    v39[1] = v24;
    id v23 = (id)[(CPSAbridgableLabel *)v34 rightAnchor];
    id v22 = (id)[(CPSEmptyView *)v37 safeAreaLayoutGuide];
    id v21 = (id)[v22 rightAnchor];
    id v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", -12.0);
    v39[2] = v20;
    id v19 = (id)[(CPSAbridgableLabel *)v33 firstBaselineAnchor];
    id v18 = (id)[(CPSAbridgableLabel *)v34 bottomAnchor];
    id v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:constant:", 30.0);
    v39[3] = v17;
    id v16 = (id)[(CPSAbridgableLabel *)v33 leftAnchor];
    id v15 = (id)[(CPSAbridgableLabel *)v34 leftAnchor];
    id v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
    v39[4] = v14;
    id v13 = (id)[(CPSAbridgableLabel *)v33 rightAnchor];
    id v12 = (id)[(CPSAbridgableLabel *)v34 rightAnchor];
    id v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
    v39[5] = v11;
    id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:6];
    objc_msgSend(v9, "activateConstraints:");

    [(CPSEmptyView *)v37 _updateLabelTraits];
    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong((id *)&v34, 0);
  }
  v5 = v37;
  objc_storeStrong((id *)&v37, 0);
  return v5;
}

- (void)setTitleVariants:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSEmptyView *)v5 titleLabel];
  [(CPSAbridgableLabel *)v3 setTextVariants:location[0]];

  objc_storeStrong(location, 0);
}

- (NSArray)titleVariants
{
  v3 = [(CPSEmptyView *)self titleLabel];
  v4 = [(CPSAbridgableLabel *)v3 textVariants];

  return v4;
}

- (void)setSubtitleVariants:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [(CPSEmptyView *)v5 subtitleLabel];
  [(CPSAbridgableLabel *)v3 setTextVariants:location[0]];

  objc_storeStrong(location, 0);
}

- (NSArray)subtitleVariants
{
  v3 = [(CPSEmptyView *)self subtitleLabel];
  v4 = [(CPSAbridgableLabel *)v3 textVariants];

  return v4;
}

- (void)_updateLabelTraits
{
  v23[1] = *MEMORY[0x263EF8340];
  id v19 = self;
  v18[1] = (id)a2;
  v5 = (void *)MEMORY[0x263F1C660];
  uint64_t v4 = *MEMORY[0x263F1D300];
  id v6 = (id)[(CPSEmptyView *)self traitCollection];
  v18[0] = (id)objc_msgSend(v5, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v4);

  uint64_t v22 = *MEMORY[0x263F1D350];
  id v7 = (id)[NSNumber numberWithDouble:*MEMORY[0x263F1D318]];
  v23[0] = v7;
  id v17 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, &v22);

  id v8 = v18[0];
  uint64_t v20 = *MEMORY[0x263F1D210];
  id v21 = v17;
  id v9 = (id)[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v2 = (id)objc_msgSend(v8, "fontDescriptorByAddingAttributes:");
  id v3 = v18[0];
  v18[0] = v2;

  id v11 = (id)[MEMORY[0x263F1C658] fontWithDescriptor:v18[0] size:0.0];
  id v10 = [(CPSEmptyView *)v19 titleLabel];
  [(CPSAbridgableLabel *)v10 setFont:v11];

  id v13 = (void *)MEMORY[0x263F1C658];
  uint64_t v12 = *MEMORY[0x263F1D268];
  id v16 = (id)[(CPSEmptyView *)v19 traitCollection];
  id v15 = (id)objc_msgSend(v13, "preferredFontForTextStyle:compatibleWithTraitCollection:", v12);
  id v14 = [(CPSEmptyView *)v19 subtitleLabel];
  [(CPSAbridgableLabel *)v14 setFont:v15];

  [(CPSEmptyView *)v19 setNeedsDisplay];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSEmptyView;
  [(CPSEmptyView *)&v3 traitCollectionDidChange:location[0]];
  [(CPSEmptyView *)v5 _updateLabelTraits];
  objc_storeStrong(location, 0);
}

- (CPSAbridgableLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (CPSAbridgableLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
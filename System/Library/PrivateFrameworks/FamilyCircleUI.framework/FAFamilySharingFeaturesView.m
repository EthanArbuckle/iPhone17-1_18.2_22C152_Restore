@interface FAFamilySharingFeaturesView
+ (id)rowForIcon:(id)a3 andLabel:(id)a4;
- (FAFamilySharingFeaturesView)initWithContext:(int64_t)a3 hideLocationSharing:(BOOL)a4;
- (id)_contextSensitiveLocalizedStringWithKey:(id)a3;
- (id)_imageViewWithIconNamed:(id)a3 addBorder:(BOOL)a4;
- (id)_labelWithStringAtKey:(id)a3;
- (void)_learnMoreButtonTapped:(id)a3;
- (void)_updateFonts;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FAFamilySharingFeaturesView

- (FAFamilySharingFeaturesView)initWithContext:(int64_t)a3 hideLocationSharing:(BOOL)a4
{
  v56[1] = *MEMORY[0x263EF8340];
  v54.receiver = self;
  v54.super_class = (Class)FAFamilySharingFeaturesView;
  v6 = -[FAFamilySharingFeaturesView initWithFrame:](&v54, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_context = a3;
    v6->_shouldHideLocationSharing = a4;
    uint64_t v8 = objc_opt_new();
    stack = v7->_stack;
    v7->_stack = (UIStackView *)v8;

    [(UIStackView *)v7->_stack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v7->_stack setAxis:1];
    [(UIStackView *)v7->_stack setAlignment:0];
    [(UIStackView *)v7->_stack setDistribution:0];
    [(UIStackView *)v7->_stack setSpacing:16.0];
    v10 = v7->_stack;
    v11 = [(FAFamilySharingFeaturesView *)v7 _imageViewWithIconNamed:@"StoreIcon" addBorder:0];
    v12 = [(FAFamilySharingFeaturesView *)v7 _labelWithStringAtKey:@"FAMILY_SHARE_PURCHASES_DESCRIPTION"];
    v13 = +[FAFamilySharingFeaturesView rowForIcon:v11 andLabel:v12];
    [(UIStackView *)v10 addArrangedSubview:v13];

    v14 = v7->_stack;
    v15 = [(FAFamilySharingFeaturesView *)v7 _imageViewWithIconNamed:@"MusicIcon" addBorder:1];
    v16 = [(FAFamilySharingFeaturesView *)v7 _labelWithStringAtKey:@"FAMILY_SHARE_MUSIC_DESCRIPTION"];
    v17 = +[FAFamilySharingFeaturesView rowForIcon:v15 andLabel:v16];
    [(UIStackView *)v14 addArrangedSubview:v17];

    v18 = v7->_stack;
    v19 = [(FAFamilySharingFeaturesView *)v7 _imageViewWithIconNamed:@"PhotosIcon" addBorder:1];
    v20 = [(FAFamilySharingFeaturesView *)v7 _labelWithStringAtKey:@"FAMILY_SHARE_PHOTOS_DESCRIPTION"];
    v21 = +[FAFamilySharingFeaturesView rowForIcon:v19 andLabel:v20];
    [(UIStackView *)v18 addArrangedSubview:v21];

    v22 = v7->_stack;
    v23 = [(FAFamilySharingFeaturesView *)v7 _imageViewWithIconNamed:@"CalendarIcon" addBorder:1];
    v24 = [(FAFamilySharingFeaturesView *)v7 _labelWithStringAtKey:@"FAMILY_SHARE_CALENDAR_DESCRIPTION"];
    v25 = +[FAFamilySharingFeaturesView rowForIcon:v23 andLabel:v24];
    [(UIStackView *)v22 addArrangedSubview:v25];

    if (!v7->_shouldHideLocationSharing)
    {
      v26 = v7->_stack;
      v27 = [(FAFamilySharingFeaturesView *)v7 _imageViewWithIconNamed:@"FMFIcon" addBorder:0];
      v28 = [(FAFamilySharingFeaturesView *)v7 _labelWithStringAtKey:@"FAMILY_SHARE_LOCATION_DESCRIPTION"];
      v29 = +[FAFamilySharingFeaturesView rowForIcon:v27 andLabel:v28];
      [(UIStackView *)v26 addArrangedSubview:v29];
    }
    v30 = v7->_stack;
    v31 = [(FAFamilySharingFeaturesView *)v7 _imageViewWithIconNamed:@"FMIPIcon" addBorder:1];
    v32 = [(FAFamilySharingFeaturesView *)v7 _labelWithStringAtKey:@"FAMILY_HELP_LOCATE_DEVICES_DESCRIPTION"];
    v33 = +[FAFamilySharingFeaturesView rowForIcon:v31 andLabel:v32];
    [(UIStackView *)v30 addArrangedSubview:v33];

    [(FAFamilySharingFeaturesView *)v7 addSubview:v7->_stack];
    uint64_t v34 = [MEMORY[0x263F824E8] buttonWithType:1];
    learnMoreButton = v7->_learnMoreButton;
    v7->_learnMoreButton = (UIButton *)v34;

    v36 = v7->_learnMoreButton;
    v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v38 = [v37 localizedStringForKey:@"FAMILY_SHARING_LEARN_MORE_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];
    [(UIButton *)v36 setTitle:v38 forState:0];

    v39 = [(UIButton *)v7->_learnMoreButton titleLabel];
    [v39 setTextAlignment:1];

    [(UIButton *)v7->_learnMoreButton addTarget:v7 action:sel__learnMoreButtonTapped_ forControlEvents:64];
    v40 = [(UIButton *)v7->_learnMoreButton titleLabel];
    v41 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    [v40 setFont:v41];

    v42 = [(UIButton *)v7->_learnMoreButton titleLabel];
    [v42 setNumberOfLines:0];

    [(UIButton *)v7->_learnMoreButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FAFamilySharingFeaturesView *)v7 addSubview:v7->_learnMoreButton];
    v43 = _NSDictionaryOfVariableBindings(&cfstr_StackLearnmore.isa, v7->_stack, v7->_learnMoreButton, 0);
    v44 = (void *)MEMORY[0x263F08938];
    v45 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_stack]|" options:0 metrics:0 views:v43];
    [v44 activateConstraints:v45];

    v46 = (void *)MEMORY[0x263F08938];
    v47 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_learnMoreButton]|" options:0 metrics:0 views:v43];
    [v46 activateConstraints:v47];

    v48 = (void *)MEMORY[0x263F08938];
    v55 = @"learnMoreSpacing";
    v49 = NSNumber;
    UIRoundToViewScale();
    v50 = objc_msgSend(v49, "numberWithDouble:");
    v56[0] = v50;
    v51 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];
    v52 = [v48 constraintsWithVisualFormat:@"V:|[_stack]-(learnMoreSpacing)-[_learnMoreButton]|" options:0 metrics:v51 views:v43];
    [v48 activateConstraints:v52];
  }
  return v7;
}

+ (id)rowForIcon:(id)a3 andLabel:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v6];
  [v7 addSubview:v5];
  uint64_t v8 = _NSDictionaryOfVariableBindings(&cfstr_ImageText.isa, v6, v5, 0);
  v9 = [MEMORY[0x263EFF980] array];
  v10 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[image(iconSize)]-(iconToLabelSpace)-[text]|" options:0 metrics:&unk_26CA525C8 views:v8];
  [v9 addObjectsFromArray:v10];

  v11 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-(>=0)-[image(iconSize)]" options:0 metrics:&unk_26CA525C8 views:v8];
  [v9 addObjectsFromArray:v11];

  v12 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[text]|" options:0 metrics:&unk_26CA525C8 views:v8];
  [v9 addObjectsFromArray:v12];

  v13 = [MEMORY[0x263F08938] constraintWithItem:v7 attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0];
  [v9 addObject:v13];

  v14 = [MEMORY[0x263F08938] constraintWithItem:v5 attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0];

  [v9 addObject:v14];
  [MEMORY[0x263F08938] activateConstraints:v9];

  return v7;
}

- (id)_labelWithStringAtKey:(id)a3
{
  v3 = [(FAFamilySharingFeaturesView *)self _contextSensitiveLocalizedStringWithKey:a3];
  id v4 = objc_alloc(MEMORY[0x263F828E0]);
  id v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v5 setText:v3];
  [v5 setNumberOfLines:0];
  id v6 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPrimaryInformationLabel");
  [v5 setFont:v6];

  return v5;
}

- (id)_imageViewWithIconNamed:(id)a3 addBorder:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (void *)MEMORY[0x263F827E8];
  id v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a3;
  uint64_t v8 = [v6 bundleForClass:objc_opt_class()];
  v9 = [v5 imageNamed:v7 inBundle:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v9];
  v11 = v10;
  if (v4)
  {
    v12 = [v10 layer];
    id v13 = [MEMORY[0x263F825C8] systemMidGrayColor];
    objc_msgSend(v12, "setBorderColor:", objc_msgSend(v13, "CGColor"));

    v14 = [v11 layer];
    PSRoundToPixel();
    objc_msgSend(v14, "setBorderWidth:");

    v15 = [v11 layer];
    [v15 setCornerRadius:8.0];
  }
  return v11;
}

- (void)_learnMoreButtonTapped:(id)a3
{
  id v3 = (id)objc_opt_new();
  [v3 fetchAAURLConfigurationWithCompletion:&__block_literal_global_18];
}

void __54__FAFamilySharingFeaturesView__learnMoreButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 urlForEndpoint:*MEMORY[0x263F3BE70]];
  if (v3)
  {
    v2 = [MEMORY[0x263F01880] defaultWorkspace];
    [v2 openURL:v3 configuration:0 completionHandler:0];
  }
}

- (id)_contextSensitiveLocalizedStringWithKey:(id)a3
{
  if (self->_context == 1)
  {
    id v3 = NSString;
    id v4 = a3;
    id v5 = [v3 stringWithFormat:@"%@_INVITE_CONTEXT", v4];

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = v6;
    id v8 = v5;
  }
  else
  {
    v9 = (void *)MEMORY[0x263F086E0];
    id v7 = a3;
    id v6 = [v9 bundleForClass:objc_opt_class()];
    id v5 = v6;
    id v8 = v7;
  }
  v10 = [v6 localizedStringForKey:v8 value:&stru_26CA2C800 table:@"Localizable"];

  return v10;
}

- (void)_updateFonts
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(UIStackView *)self->_stack arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v13 + 1) + 8 * v7) subviews];
        v9 = [v8 lastObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = objc_msgSend(MEMORY[0x263F81708], "aa_fontForPrimaryInformationLabel");
          [v9 setFont:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v11 = [(UIButton *)self->_learnMoreButton titleLabel];
  v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  [v11 setFont:v12];

  [(FAFamilySharingFeaturesView *)self setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FAFamilySharingFeaturesView;
  id v4 = a3;
  [(FAFamilySharingFeaturesView *)&v9 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);

  uint64_t v6 = [(FAFamilySharingFeaturesView *)self traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];
  char v8 = [v5 isEqualToString:v7];

  if ((v8 & 1) == 0) {
    [(FAFamilySharingFeaturesView *)self _updateFonts];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_learnMoreButton, 0);
}

@end
@interface MUAmenityListSectionView
- (BOOL)isExpanded;
- (MUAmenityListSectionView)initWithAmenityListConfiguration:(id)a3;
- (void)_performExpansion;
- (void)_setupSubviews;
- (void)setExpanded:(BOOL)a3;
@end

@implementation MUAmenityListSectionView

- (MUAmenityListSectionView)initWithAmenityListConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUAmenityListSectionView;
  v6 = [(MUPlaceVerticalCardContainerView *)&v9 initWithShowsSeparators:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(MUAmenityListSectionView *)v7 setAccessibilityIdentifier:@"AmenityList"];
    [(MUAmenityListSectionView *)v7 _setupSubviews];
  }

  return v7;
}

- (void)_setupSubviews
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  val = self;
  v4 = [(MUAmenityListSectionConfiguration *)self->_configuration viewModels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v63 count:16];
  char v6 = 0;
  if (v5)
  {
    uint64_t v7 = *(void *)v59;
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v59 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v58 + 1) + 8 * v12);
        v14 = -[MUAmenityItemView initWithFrame:]([MUAmenityItemView alloc], "initWithFrame:", v8, v9, v10, v11);
        [(MUAmenityItemView *)v14 setViewModel:v13];
        [v3 addObject:v14];
        unint64_t v15 = [v3 count];
        if (v15 > [(MUAmenityListSectionConfiguration *)val->_configuration numberInlineAmenities])
        {
          [(MUAmenityItemView *)v14 setHidden:1];
          char v6 = 1;
        }

        ++v12;
      }
      while (v5 != v12);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v5);
  }

  v16 = [(MUAmenityListSectionConfiguration *)val->_configuration applePayConfiguration];
  v17 = [v16 applePayRowAmenity];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    v19 = [MUAmenityItemView alloc];
    v20 = -[MUAmenityItemView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v21 = [(MUAmenityListSectionConfiguration *)val->_configuration applePayConfiguration];
    v22 = [v21 applePayRowAmenity];
    [(MUAmenityItemView *)v20 setViewModel:v22];

    applePayAmenityRowView = val->_applePayAmenityRowView;
    val->_applePayAmenityRowView = &v20->super.super;
    v24 = v20;

    [(UIView *)val->_applePayAmenityRowView setAccessibilityIdentifier:@"ApplePayAmenityRow"];
    [v3 addObject:v24];
  }
  v25 = [(MUAmenityListSectionConfiguration *)val->_configuration applePayConfiguration];
  int v26 = [v25 showApplePayIcons];

  if (v26)
  {
    v27 = [MUAmenityItemImageView alloc];
    v28 = -[MUAmenityItemImageView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    applePayImageView = val->_applePayImageView;
    val->_applePayImageView = &v28->super.super;
    v30 = v28;

    [(UIView *)val->_applePayImageView setAccessibilityIdentifier:@"ApplePayImage"];
    [v3 addObject:v30];
  }
  if (v6)
  {
    v53 = objc_msgSend(MEMORY[0x1E4FB14D8], "_mapsui_textButtonConfiguration");
    v31 = _MULocalizedStringFromThisBundle(@"More [Amenities]");
    [v53 setTitle:v31];

    objc_initWeak(&location, val);
    v32 = (void *)MEMORY[0x1E4FB14D0];
    v33 = (void *)MEMORY[0x1E4FB13F0];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __42__MUAmenityListSectionView__setupSubviews__block_invoke;
    v55[3] = &unk_1E574FCE0;
    objc_copyWeak(&v56, &location);
    v34 = [v33 actionWithHandler:v55];
    uint64_t v35 = [v32 buttonWithConfiguration:v53 primaryAction:v34];
    moreButton = val->_moreButton;
    val->_moreButton = (UIButton *)v35;

    [(UIButton *)val->_moreButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)val->_moreButton setPreferredBehavioralStyle:1];
    id v37 = objc_alloc(MEMORY[0x1E4F310B8]);
    v38 = objc_msgSend(v37, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v38 setAccessibilityIdentifier:@"AmenityListMoreButtonButtonContainer"];
    [(UIButton *)val->_moreButton setAccessibilityIdentifier:@"AmenityListMoreButton"];
    [v38 addSubview:val->_moreButton];
    v47 = (void *)MEMORY[0x1E4F28DC8];
    v39 = [(UIButton *)val->_moreButton leadingAnchor];
    v52 = [v38 leadingAnchor];
    v51 = [v39 constraintEqualToAnchor:v52];
    v62[0] = v51;
    v50 = [(UIButton *)val->_moreButton topAnchor];
    v49 = [v38 topAnchor];
    v48 = [v50 constraintEqualToAnchor:v49 constant:3.0];
    v62[1] = v48;
    v40 = [(UIButton *)val->_moreButton bottomAnchor];
    v41 = [v38 bottomAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v62[2] = v42;
    v43 = [(UIButton *)val->_moreButton trailingAnchor];
    v44 = [v38 trailingAnchor];
    v45 = [v43 constraintLessThanOrEqualToAnchor:v44];
    v62[3] = v45;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
    [v47 activateConstraints:v46];

    [v3 addObject:v38];
    objc_destroyWeak(&v56);
    objc_destroyWeak(&location);
  }
  [(MUPlaceVerticalCardContainerView *)val setRowViews:v3];
}

void __42__MUAmenityListSectionView__setupSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _performExpansion];
    id WeakRetained = v2;
  }
}

- (void)_performExpansion
{
  if (![(MUAmenityListSectionView *)self isExpanded])
  {
    objc_initWeak(&location, self);
    id v3 = (void *)MEMORY[0x1E4FB1EB0];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__MUAmenityListSectionView__performExpansion__block_invoke;
    v4[3] = &unk_1E574F3A8;
    objc_copyWeak(&v5, &location);
    [v3 animateWithDuration:v4 animations:0.200000003];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __45__MUAmenityListSectionView__performExpansion__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = objc_msgSend(WeakRetained, "arrangedSubviews", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v7++) setHidden:0];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    double v8 = [v2[58] superview];
    [v8 setHidden:1];
  }
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applePayImageView, 0);
  objc_storeStrong((id *)&self->_applePayAmenityRowView, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
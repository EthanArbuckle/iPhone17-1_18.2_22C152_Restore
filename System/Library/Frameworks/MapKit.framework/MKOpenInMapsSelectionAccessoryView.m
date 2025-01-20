@interface MKOpenInMapsSelectionAccessoryView
- (MKOpenInMapsSelectionAccessoryView)initWithURL:(id)a3;
- (id)_createButton;
- (void)_handlePress;
- (void)layoutSubviews;
@end

@implementation MKOpenInMapsSelectionAccessoryView

- (MKOpenInMapsSelectionAccessoryView)initWithURL:(id)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MKOpenInMapsSelectionAccessoryView;
  v6 = -[MKSelectionAccessoryView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    id v35 = v5;
    objc_storeStrong((id *)&v6->_url, a3);
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"DeveloperPlaceCardCaptionBackgroundColor");
    bgColor = v7->_bgColor;
    v7->_bgColor = (UIColor *)v8;

    [(MKOpenInMapsSelectionAccessoryView *)v7 setBackgroundColor:v7->_bgColor];
    double v10 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v12 = [(MKOpenInMapsSelectionAccessoryView *)v7 layer];
    objc_msgSend(v12, "setShadowOffset:", v10, v11);

    v13 = [(MKOpenInMapsSelectionAccessoryView *)v7 layer];
    [v13 setShadowRadius:15.0];

    id v14 = [MEMORY[0x1E4F428B8] blackColor];
    uint64_t v15 = [v14 CGColor];
    v16 = [(MKOpenInMapsSelectionAccessoryView *)v7 layer];
    [v16 setShadowColor:v15];

    v17 = [(MKOpenInMapsSelectionAccessoryView *)v7 layer];
    LODWORD(v18) = 1047904911;
    [v17 setShadowOpacity:v18];

    v19 = [(MKOpenInMapsSelectionAccessoryView *)v7 _createButton];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKOpenInMapsSelectionAccessoryView *)v7 addSubview:v19];
    v29 = (void *)MEMORY[0x1E4F28DC8];
    v34 = [v19 topAnchor];
    v33 = [(MKOpenInMapsSelectionAccessoryView *)v7 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v37[0] = v32;
    v31 = [v19 leadingAnchor];
    v30 = [(MKOpenInMapsSelectionAccessoryView *)v7 leadingAnchor];
    v20 = [v31 constraintEqualToAnchor:v30];
    v37[1] = v20;
    v21 = [(MKOpenInMapsSelectionAccessoryView *)v7 trailingAnchor];
    v22 = [v19 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v37[2] = v23;
    v24 = [(MKOpenInMapsSelectionAccessoryView *)v7 bottomAnchor];
    v25 = [v19 bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v37[3] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v29 activateConstraints:v27];

    id v5 = v35;
  }

  return v7;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MKOpenInMapsSelectionAccessoryView;
  [(MKOpenInMapsSelectionAccessoryView *)&v6 layoutSubviews];
  [(MKOpenInMapsSelectionAccessoryView *)self bounds];
  double v4 = v3 * 0.5;
  id v5 = [(MKOpenInMapsSelectionAccessoryView *)self layer];
  [v5 setCornerRadius:v4];
}

- (id)_createButton
{
  double v3 = _MKLocalizedStringFromThisBundle(@"[Developer Selection Accessory] Open in Apple Maps");
  objc_initWeak(&location, self);
  double v4 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __51__MKOpenInMapsSelectionAccessoryView__createButton__block_invoke;
  v12 = &unk_1E54B93D8;
  objc_copyWeak(&v13, &location);
  id v5 = [v4 actionWithTitle:v3 image:0 identifier:0 handler:&v9];
  objc_super v6 = objc_msgSend(MEMORY[0x1E4F427E8], "borderlessButtonConfiguration", v9, v10, v11, v12);
  objc_msgSend(v6, "setContentInsets:", 4.0, 8.0, 4.0, 8.0);
  [v6 setTitleTextAttributesTransformer:&__block_literal_global_49];
  v7 = [MEMORY[0x1E4F427E0] buttonWithConfiguration:v6 primaryAction:v5];
  [v7 setPreferredBehavioralStyle:1];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __51__MKOpenInMapsSelectionAccessoryView__createButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePress];
}

id __51__MKOpenInMapsSelectionAccessoryView__createButton__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  double v3 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43890]];
  double v4 = objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43930]);
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F42508]];

  return v2;
}

- (void)_handlePress
{
  id v3 = +[MKSystemController sharedInstance];
  [v3 openURL:self->_url completionHandler:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgColor, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end
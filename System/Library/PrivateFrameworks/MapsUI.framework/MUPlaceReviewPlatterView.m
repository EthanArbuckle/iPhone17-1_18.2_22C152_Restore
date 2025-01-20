@interface MUPlaceReviewPlatterView
- (CGSize)intrinsicContentSize;
- (MUPlaceReviewPlatterView)initWithFrame:(CGRect)a3;
- (MUPlaceReviewViewModel)viewModel;
- (NSAttributedString)starString;
- (NSAttributedString)userLabelString;
- (id)_attributesWithFont:(id)a3 color:(id)a4;
- (id)actionHandler;
- (void)_contentSizeDidChange;
- (void)_platterTapped;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)setActionHandler:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPlaceReviewPlatterView

- (MUPlaceReviewPlatterView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUPlaceReviewPlatterView;
  v3 = -[MUPlaceReviewPlatterView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MUPlaceReviewPlatterView *)v3 setAccessibilityIdentifier:@"PlaceReviewPlatter"];
    [(MUPlaceReviewPlatterView *)v4 _setupSubviews];
    [(MUPlaceReviewPlatterView *)v4 _setupConstraints];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v4;
}

- (void)_setupSubviews
{
  v3 = +[MUInfoCardStyle labelForProminence:0];
  reviewTextView = self->_reviewTextView;
  self->_reviewTextView = v3;

  [(MULabelViewProtocol *)self->_reviewTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MULabelViewProtocol *)self->_reviewTextView setNumberOfLines:4];
  v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(MULabelViewProtocol *)self->_reviewTextView setFont:v5];

  [(MULabelViewProtocol *)self->_reviewTextView setAccessibilityIdentifier:@"PlaceReviewPlatterReviewText"];
  [(MUPlaceReviewPlatterView *)self addSubview:self->_reviewTextView];
  objc_msgSend(MEMORY[0x1E4FB1930], "_mapsui_defaultLabel");
  v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
  starLabel = self->_starLabel;
  self->_starLabel = v6;

  [(UILabel *)self->_starLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_starLabel set_mapsui_numberOfLines:1];
  [(UILabel *)self->_starLabel setAccessibilityIdentifier:@"PlaceReviewPlatterStarLabel"];
  [(MUPlaceReviewPlatterView *)self addSubview:self->_starLabel];
  v8 = +[MUInfoCardStyle labelForProminence:1];
  userLabel = self->_userLabel;
  self->_userLabel = v8;

  [(MULabelViewProtocol *)self->_userLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MULabelViewProtocol *)self->_userLabel setNumberOfLines:1];
  [(MULabelViewProtocol *)self->_userLabel setAccessibilityIdentifier:@"PlaceReviewPlatterUserLabel"];
  [(MUPlaceReviewPlatterView *)self addSubview:self->_userLabel];
  id v10 = objc_alloc(MEMORY[0x1E4FB1838]);
  v11 = (UIImageView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  userAvatarImageView = self->_userAvatarImageView;
  self->_userAvatarImageView = v11;

  [(UIImageView *)self->_userAvatarImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_userAvatarImageView setAccessibilityIgnoresInvertColors:1];
  [(UIImageView *)self->_userAvatarImageView setContentMode:2];
  [(UIImageView *)self->_userAvatarImageView setClipsToBounds:1];
  [(UIImageView *)self->_userAvatarImageView _setCornerRadius:18.0];
  [(UIImageView *)self->_userAvatarImageView setAccessibilityIdentifier:@"PlaceReviewPlatterUserAvatar"];
  [(MUPlaceReviewPlatterView *)self addSubview:self->_userAvatarImageView];
  v13 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
  userLabelLayoutGuide = self->_userLabelLayoutGuide;
  self->_userLabelLayoutGuide = v13;

  [(MUPlaceReviewPlatterView *)self addLayoutGuide:self->_userLabelLayoutGuide];
  v15 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v15;

  [(MUPlaceReviewPlatterView *)self addGestureRecognizer:self->_tapGestureRecognizer];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer addTarget:self action:sel__platterTapped];
  [(UIView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:sel__platterTapped];
}

- (void)_setupConstraints
{
  v63[20] = *MEMORY[0x1E4F143B8];
  v41 = (void *)MEMORY[0x1E4F28DC8];
  v62 = [(MULabelViewProtocol *)self->_reviewTextView topAnchor];
  v61 = [(MUPlaceReviewPlatterView *)self topAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:14.0];
  v63[0] = v60;
  v59 = [(MULabelViewProtocol *)self->_reviewTextView leadingAnchor];
  v58 = [(MUPlaceReviewPlatterView *)self leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:16.0];
  v63[1] = v57;
  v56 = [(MULabelViewProtocol *)self->_reviewTextView trailingAnchor];
  v55 = [(MUPlaceReviewPlatterView *)self trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:-16.0];
  v63[2] = v54;
  v53 = [(MULabelViewProtocol *)self->_reviewTextView bottomAnchor];
  v52 = [(UILayoutGuide *)self->_userLabelLayoutGuide topAnchor];
  v51 = [v53 constraintLessThanOrEqualToAnchor:v52 constant:-12.0];
  v63[3] = v51;
  v50 = [(UIImageView *)self->_userAvatarImageView leadingAnchor];
  v49 = [(MUPlaceReviewPlatterView *)self leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:16.0];
  v63[4] = v48;
  v47 = [(UIImageView *)self->_userAvatarImageView topAnchor];
  v46 = [(MULabelViewProtocol *)self->_reviewTextView bottomAnchor];
  v45 = [v47 constraintGreaterThanOrEqualToAnchor:v46 constant:16.0];
  v63[5] = v45;
  v44 = [(UIImageView *)self->_userAvatarImageView centerYAnchor];
  v43 = [(UILayoutGuide *)self->_userLabelLayoutGuide centerYAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v63[6] = v42;
  v40 = [(UIImageView *)self->_userAvatarImageView bottomAnchor];
  v39 = [(MUPlaceReviewPlatterView *)self bottomAnchor];
  v38 = [v40 constraintLessThanOrEqualToAnchor:v39 constant:-14.0];
  v63[7] = v38;
  v37 = [(UIImageView *)self->_userAvatarImageView widthAnchor];
  v36 = [v37 constraintEqualToConstant:36.0];
  v63[8] = v36;
  v35 = [(UIImageView *)self->_userAvatarImageView heightAnchor];
  v34 = [v35 constraintEqualToConstant:36.0];
  v63[9] = v34;
  v33 = [(UIImageView *)self->_userAvatarImageView trailingAnchor];
  v32 = [(UILayoutGuide *)self->_userLabelLayoutGuide leadingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:-8.0];
  v63[10] = v31;
  v30 = [(UILabel *)self->_starLabel leadingAnchor];
  v29 = [(UILayoutGuide *)self->_userLabelLayoutGuide leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v63[11] = v28;
  v27 = [(UILabel *)self->_starLabel trailingAnchor];
  v26 = [(UILayoutGuide *)self->_userLabelLayoutGuide trailingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v63[12] = v25;
  v24 = [(UILabel *)self->_starLabel topAnchor];
  v23 = [(UILayoutGuide *)self->_userLabelLayoutGuide topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v63[13] = v22;
  v21 = [(MULabelViewProtocol *)self->_userLabel leadingAnchor];
  v20 = [(UILayoutGuide *)self->_userLabelLayoutGuide leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v63[14] = v19;
  v18 = [(MULabelViewProtocol *)self->_userLabel trailingAnchor];
  v17 = [(UILayoutGuide *)self->_userLabelLayoutGuide trailingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v63[15] = v16;
  v15 = [(MULabelViewProtocol *)self->_userLabel topAnchor];
  v14 = [(UILabel *)self->_starLabel bottomAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v63[16] = v13;
  v3 = [(MULabelViewProtocol *)self->_userLabel bottomAnchor];
  v4 = [(UILayoutGuide *)self->_userLabelLayoutGuide bottomAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  v63[17] = v5;
  v6 = [(UILayoutGuide *)self->_userLabelLayoutGuide trailingAnchor];
  objc_super v7 = [(MUPlaceReviewPlatterView *)self trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:-16.0];
  v63[18] = v8;
  v9 = [(UILayoutGuide *)self->_userLabelLayoutGuide bottomAnchor];
  id v10 = [(MUPlaceReviewPlatterView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:-14.0];
  v63[19] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:20];
  [v41 activateConstraints:v12];
}

- (void)_platterTapped
{
  v3 = [(MUPlaceReviewPlatterView *)self actionHandler];

  if (v3)
  {
    v4 = [(MUPlaceReviewPlatterView *)self actionHandler];
    v4[2]();
  }
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[MUPlaceReviewViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MUPlaceReviewPlatterView *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  v3 = [(MUPlaceReviewViewModel *)self->_viewModel reviewText];
  [(MULabelViewProtocol *)self->_reviewTextView setText:v3];

  v4 = [(MUPlaceReviewPlatterView *)self userLabelString];
  [(MULabelViewProtocol *)self->_userLabel setAttributedText:v4];

  id v5 = [(MUPlaceReviewPlatterView *)self starString];
  [(UILabel *)self->_starLabel setAttributedText:v5];

  objc_initWeak(&location, self);
  viewModel = self->_viewModel;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MUPlaceReviewPlatterView__updateAppearance__block_invoke;
  v7[3] = &unk_1E574F998;
  objc_copyWeak(&v8, &location);
  -[MUPlaceReviewViewModel loadUserIconWithPointSize:completion:](viewModel, "loadUserIconWithPointSize:completion:", v7, 36.0, 36.0);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__MUPlaceReviewPlatterView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((void *)WeakRetained + 54);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__MUPlaceReviewPlatterView__updateAppearance__block_invoke_2;
    v7[3] = &unk_1E574EE08;
    void v7[4] = WeakRetained;
    id v8 = v3;
    objc_msgSend(v6, "_mapsui_performImageLoadingTransitionWithAnimations:completion:", v7, 0);
  }
}

uint64_t __45__MUPlaceReviewPlatterView__updateAppearance__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setImage:*(void *)(a1 + 40)];
}

- (NSAttributedString)userLabelString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v5 = [(MUPlaceReviewViewModel *)self->_viewModel authorText];
  v6 = (void *)[v4 initWithString:v5];

  uint64_t v7 = *MEMORY[0x1E4FB28F0];
  id v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v9 = +[MUInfoCardStyle textColor];
  id v10 = [(MUPlaceReviewPlatterView *)self _attributesWithFont:v8 color:v9];
  v11 = [(MUPlaceReviewViewModel *)self->_viewModel authorText];
  objc_msgSend(v6, "addAttributes:range:", v10, 0, objc_msgSend(v11, "length"));

  if ([v6 length])
  {
    v12 = (void *)[v6 copy];
    [v3 addObject:v12];
  }
  if (qword_1EB4F72C8 != -1) {
    dispatch_once(&qword_1EB4F72C8, &__block_literal_global_13);
  }
  v13 = (void *)_MergedGlobals_9;
  v14 = [(MUPlaceReviewViewModel *)self->_viewModel reviewDate];
  v15 = objc_msgSend(v13, "_mapkit_roundedPastUnitsStringFromDate:", v14);

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v15];
  v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v7];
  v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.470588237 alpha:1.0];
  v19 = [(MUPlaceReviewPlatterView *)self _attributesWithFont:v17 color:v18];
  objc_msgSend(v16, "addAttributes:range:", v19, 0, objc_msgSend(v15, "length"));

  if ([v3 count] && objc_msgSend(v15, "length"))
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@" · "];
    v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v7];
    v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.470588237 alpha:1.0];
    v23 = [(MUPlaceReviewPlatterView *)self _attributesWithFont:v21 color:v22];
    objc_msgSend(v20, "addAttributes:range:", v23, 0, objc_msgSend(v20, "length"));

    [v3 addObject:v20];
  }
  if ([v15 length])
  {
    v24 = (void *)[v16 copy];
    [v3 addObject:v24];
  }
  v25 = (void *)[v3 copy];
  v26 = +[MapsUILayout buildAttributedDisplayStringForComponents:v25 forContainingView:self->_userLabel];

  return (NSAttributedString *)v26;
}

void __43__MUPlaceReviewPlatterView_userLabelString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = (uint64_t)v0;

  [(id)_MergedGlobals_9 setTimeStyle:0];
  [(id)_MergedGlobals_9 setDateStyle:1];
  [(id)_MergedGlobals_9 setDoesRelativeDateFormatting:1];
  v2 = (void *)_MergedGlobals_9;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];
}

- (NSAttributedString)starString
{
  id v3 = (void *)MEMORY[0x1E4F31030];
  [(MUPlaceReviewViewModel *)self->_viewModel normalizedScore];
  double v5 = v4;
  v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v7 = [(MUPlaceReviewPlatterView *)self mk_theme];
  id v8 = [v3 ratingAsAttributedString:v6 baseFont:2 style:v7 theme:v5];

  return (NSAttributedString *)v8;
}

- (id)_attributesWithFont:(id)a3 color:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB0700];
  v11[0] = *MEMORY[0x1E4FB06F8];
  v11[1] = v5;
  v12[0] = a3;
  v12[1] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void)_contentSizeDidChange
{
  id v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(MULabelViewProtocol *)self->_reviewTextView setFont:v3];

  double v4 = [(MUPlaceReviewPlatterView *)self userLabelString];
  [(MULabelViewProtocol *)self->_userLabel setAttributedText:v4];

  id v5 = [(MUPlaceReviewPlatterView *)self starString];
  [(UILabel *)self->_starLabel setAttributedText:v5];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double v3 = 307.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (MUPlaceReviewViewModel)viewModel
{
  return self->_viewModel;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_userLabelLayoutGuide, 0);
  objc_storeStrong((id *)&self->_userAvatarImageView, 0);
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_starLabel, 0);
  objc_storeStrong((id *)&self->_reviewTextView, 0);
}

@end
@interface MUAppleRatingRowView
+ (id)_numberOfPeopleMonospacedFont;
+ (id)ratingSymbolStringWithFont:(id)a3 symbolScale:(int64_t)a4 attributes:(id)a5;
+ (int64_t)_ratingsValueAnimationFromViewModel:(id)a3 toViewModel:(id)a4;
- (MUAppleRatingRowView)initWithFrame:(CGRect)a3 ratingsCountAnimationEnabled:(BOOL)a4;
- (MURatingPercentageViewModel)viewModel;
- (id)_attributesWithFont:(id)a3 color:(id)a4;
- (id)_percentageStringComponentsFromCurrentViewModel;
- (id)_ratingSubtitleAttributedString;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updateAppearanceAnimatingFromPreviousViewModel:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUAppleRatingRowView

- (MUAppleRatingRowView)initWithFrame:(CGRect)a3 ratingsCountAnimationEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUAppleRatingRowView;
  v5 = -[MKViewWithHairline initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(MUAppleRatingRowView *)v5 effectiveUserInterfaceLayoutDirection];
    if (v4)
    {
      uint64_t v8 = v7;
      if (GEOConfigGetBOOL()) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9) {
        v6->_ratingsCountAnimationEnabled = 1;
      }
    }
    [(MUAppleRatingRowView *)v6 setAccessibilityIdentifier:@"AppleRatingRow"];
    [(MUAppleRatingRowView *)v6 _setupSubviews];
    [(MUAppleRatingRowView *)v6 _setupConstraints];
  }
  return v6;
}

- (void)_setupSubviews
{
  -[MUAppleRatingRowView setLayoutMargins:](self, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v5 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v4, v7, v6);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_titleLabel setFont:v10];

  objc_super v11 = +[MUInfoCardStyle textColor];
  [(UILabel *)self->_titleLabel setTextColor:v11];

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:@"AppleRatingTitle"];
  [(MUAppleRatingRowView *)self addSubview:self->_titleLabel];
  if (self->_ratingsCountAnimationEnabled)
  {
    v12 = -[MUAppleRatingRowSubtitleView initWithFrame:]([MUAppleRatingRowSubtitleView alloc], "initWithFrame:", v5, v4, v7, v6);
    p_subtitleView = (id *)&self->_subtitleView;
    subtitleView = self->_subtitleView;
    self->_subtitleView = v12;

    v15 = @"AppleRatingSubtitleView";
  }
  else
  {
    v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v4, v7, v6);
    p_subtitleView = (id *)&self->_subtitleLabel;
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v16;

    [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
    v15 = @"AppleRatingSubtitle";
  }
  [*p_subtitleView setAccessibilityIdentifier:v15];
  [(MUAppleRatingRowView *)self addSubview:*p_subtitleView];
  id v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)_setupConstraints
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MUStackLayout alloc];
  double v4 = [(MUAppleRatingRowView *)self layoutMarginsGuide];
  double v5 = [(MUStackLayout *)v3 initWithContainer:v4 axis:1];
  stackLayout = self->_stackLayout;
  self->_stackLayout = v5;

  if (self->_ratingsCountAnimationEnabled)
  {
    subtitleView = self->_subtitleView;
    v12[0] = self->_titleLabel;
    v12[1] = subtitleView;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [(MUStackLayout *)self->_stackLayout setArrangedLayoutItems:v8];

    [(MUStackLayout *)self->_stackLayout setAlignment:1];
    [(MUStackLayout *)self->_stackLayout setAlignmentBoundsContent:1];
  }
  else
  {
    subtitleLabel = self->_subtitleLabel;
    v11[0] = self->_titleLabel;
    v11[1] = subtitleLabel;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [(MUStackLayout *)self->_stackLayout setArrangedLayoutItems:v10];
  }
  [(MUStackLayout *)self->_stackLayout setSpacing:2.0];
  [(MUConstraintLayout *)self->_stackLayout activate];
}

- (void)setViewModel:(id)a3
{
  double v5 = (MURatingPercentageViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    uint64_t v8 = v5;
    viewModel = (MURatingPercentageViewModel *)[(MURatingPercentageViewModel *)viewModel isEqual:v5];
    double v5 = v8;
    if ((viewModel & 1) == 0)
    {
      double v7 = self->_viewModel;
      objc_storeStrong((id *)&self->_viewModel, a3);
      if (self->_ratingsCountAnimationEnabled) {
        [(MUAppleRatingRowView *)self _updateAppearanceAnimatingFromPreviousViewModel:v7];
      }
      else {
        [(MUAppleRatingRowView *)self _updateAppearance];
      }

      double v5 = v8;
    }
  }
  MEMORY[0x1F41817F8](viewModel, v5);
}

- (void)_updateAppearance
{
  id v3 = [(MURatingPercentageViewModel *)self->_viewModel categoryTitle];
  [(UILabel *)self->_titleLabel setText:v3];

  if ([(MURatingPercentageViewModel *)self->_viewModel hasSubtitle])
  {
    double v4 = [(MUAppleRatingRowView *)self _ratingSubtitleAttributedString];
    [(UILabel *)self->_subtitleLabel setAttributedText:v4];

    [(MUAppleRatingRowView *)self addSubview:self->_subtitleLabel];
    stackLayout = self->_stackLayout;
    subtitleLabel = self->_subtitleLabel;
    [(MUStackLayout *)stackLayout addArrangedLayoutItem:subtitleLabel];
  }
  else
  {
    [(UILabel *)self->_subtitleLabel removeFromSuperview];
    double v7 = self->_stackLayout;
    uint64_t v8 = self->_subtitleLabel;
    [(MUStackLayout *)v7 removeArrangedLayoutItem:v8];
  }
}

- (void)_updateAppearanceAnimatingFromPreviousViewModel:(id)a3
{
  id v42 = a3;
  double v4 = [(MURatingPercentageViewModel *)self->_viewModel categoryTitle];
  [(UILabel *)self->_titleLabel setText:v4];

  double v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)self->_titleLabel setFont:v5];

  viewModel = self->_viewModel;
  if (viewModel && ([(MURatingPercentageViewModel *)viewModel hasSubtitle] & 1) != 0)
  {
    uint64_t v7 = [(MURatingPercentageViewModel *)self->_viewModel numberOfRatingsUsedForScore];
    subtitleView = self->_subtitleView;
    if (v7)
    {
      uint64_t v9 = v7;
      v10 = [(MUAppleRatingRowSubtitleView *)self->_subtitleView superview];

      [(MUAppleRatingRowView *)self addSubview:self->_subtitleView];
      [(MUStackLayout *)self->_stackLayout addArrangedLayoutItem:self->_subtitleView];
      if (v10) {
        uint64_t v11 = [(id)objc_opt_class() _ratingsValueAnimationFromViewModel:v42 toViewModel:self->_viewModel];
      }
      else {
        uint64_t v11 = 0;
      }
      id v18 = [(MUAppleRatingRowView *)self _percentageStringComponentsFromCurrentViewModel];
      v41 = v18;
      if (v18)
      {
        v19 = (void *)[v18 copy];
        v20 = +[MapsUILayout buildAttributedDisplayStringForComponents:v19 forContainingView:self->_subtitleView];
      }
      else
      {
        v20 = 0;
      }
      v21 = [MEMORY[0x1E4F30E98] stringFromCount:v9];
      v22 = _MULocalizedStringFromThisBundle(@"<num> ratings");
      v23 = [NSString localizedStringWithValidatedFormat:v22, @"%d %@", 0, v9, v21 validFormatSpecifiers error];
      if ([v23 rangeOfString:v21])
      {
        v24 = self->_subtitleView;
        id v25 = objc_alloc(MEMORY[0x1E4F28E48]);
        v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
        v27 = +[MUInfoCardStyle secondaryTextColor];
        v28 = [(MUAppleRatingRowView *)self _attributesWithFont:v26 color:v27];
        v29 = (void *)[v25 initWithString:v23 attributes:v28];
        [(MUAppleRatingRowSubtitleView *)v24 setPercentageString:v20 ratingsValueString:0 ratingsValueAnimation:0 ratingsString:v29];
      }
      else
      {
        uint64_t v39 = [v23 stringByReplacingOccurrencesOfString:v21 withString:&stru_1EE3BF360];

        v40 = v20;
        id v30 = objc_alloc(MEMORY[0x1E4F28E48]);
        v31 = +[MUAppleRatingRowView _numberOfPeopleMonospacedFont];
        v32 = +[MUInfoCardStyle secondaryTextColor];
        [(MUAppleRatingRowView *)self _attributesWithFont:v31 color:v32];
        v33 = uint64_t v38 = v11;
        v26 = (void *)[v30 initWithString:v21 attributes:v33];

        id v34 = objc_alloc(MEMORY[0x1E4F28E48]);
        v35 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
        v36 = +[MUInfoCardStyle secondaryTextColor];
        v37 = [(MUAppleRatingRowView *)self _attributesWithFont:v35 color:v36];
        v27 = (void *)[v34 initWithString:v39 attributes:v37];

        v20 = v40;
        [(MUAppleRatingRowSubtitleView *)self->_subtitleView setPercentageString:v40 ratingsValueString:v26 ratingsValueAnimation:v38 ratingsString:v27];
        v23 = (void *)v39;
      }
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
      v13 = _MULocalizedStringFromThisBundle(@"No Ratings [Placecard]");
      v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
      v15 = +[MUInfoCardStyle secondaryTextColor];
      v16 = [(MUAppleRatingRowView *)self _attributesWithFont:v14 color:v15];
      v17 = (void *)[v12 initWithString:v13 attributes:v16];
      [(MUAppleRatingRowSubtitleView *)subtitleView setPercentageString:0 ratingsValueString:0 ratingsValueAnimation:0 ratingsString:v17];
    }
  }
  else
  {
    [(MUAppleRatingRowSubtitleView *)self->_subtitleView removeFromSuperview];
    [(MUStackLayout *)self->_stackLayout removeArrangedLayoutItem:self->_subtitleView];
  }
}

+ (int64_t)_ratingsValueAnimationFromViewModel:(id)a3 toViewModel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  int64_t v8 = 0;
  if (v5 && v6)
  {
    if ([v5 numberOfRatingsUsedForScore]
      && [v7 numberOfRatingsUsedForScore]
      && (uint64_t v9 = [v5 numberOfRatingsUsedForScore], v9 != objc_msgSend(v7, "numberOfRatingsUsedForScore")))
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F30E98], "stringFromCount:", objc_msgSend(v5, "numberOfRatingsUsedForScore"));
      id v12 = objc_msgSend(MEMORY[0x1E4F30E98], "stringFromCount:", objc_msgSend(v7, "numberOfRatingsUsedForScore"));
      if ([v11 isEqualToString:v12])
      {
        int64_t v8 = 0;
      }
      else
      {
        unint64_t v13 = [v7 numberOfRatingsUsedForScore];
        if (v13 <= [v5 numberOfRatingsUsedForScore])
        {
          unint64_t v14 = [v7 numberOfRatingsUsedForScore];
          int64_t v8 = 2 * (v14 < [v5 numberOfRatingsUsedForScore]);
        }
        else
        {
          int64_t v8 = 1;
        }
      }
    }
    else
    {
      int64_t v8 = 0;
    }
  }

  return v8;
}

- (id)_ratingSubtitleAttributedString
{
  uint64_t v3 = [(MURatingPercentageViewModel *)self->_viewModel numberOfRatingsUsedForScore];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = [(MUAppleRatingRowView *)self _percentageStringComponentsFromCurrentViewModel];
    if (v6) {
      [v5 addObjectsFromArray:v6];
    }
    uint64_t v7 = [MEMORY[0x1E4F30E98] stringFromCount:v4];
    int64_t v8 = _MULocalizedStringFromThisBundle(@"<num> ratings");
    uint64_t v9 = [NSString localizedStringWithValidatedFormat:v8, @"%d %@", 0, v4, v7 validFormatSpecifiers error];
    id v10 = objc_alloc(MEMORY[0x1E4F28E48]);
    uint64_t v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    id v12 = +[MUInfoCardStyle secondaryTextColor];
    unint64_t v13 = [(MUAppleRatingRowView *)self _attributesWithFont:v11 color:v12];
    unint64_t v14 = (void *)[v10 initWithString:v9 attributes:v13];

    [v5 addObject:v14];
    v15 = (void *)[v5 copy];
    v16 = +[MapsUILayout buildAttributedDisplayStringForComponents:v15 forContainingView:self->_subtitleLabel];
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
    _MULocalizedStringFromThisBundle(@"No Ratings [Placecard]");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    uint64_t v7 = +[MUInfoCardStyle secondaryTextColor];
    int64_t v8 = [(MUAppleRatingRowView *)self _attributesWithFont:v6 color:v7];
    v16 = (void *)[v17 initWithString:v5 attributes:v8];
  }

  return v16;
}

+ (id)ratingSymbolStringWithFont:(id)a3 symbolScale:(int64_t)a4 attributes:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4FB1818];
  int64_t v8 = (void *)MEMORY[0x1E4F30EA0];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v8 ratingSymbolName];
  id v12 = [v7 systemImageNamed:v11];

  unint64_t v13 = [MEMORY[0x1E4FB1830] configurationWithFont:v10 scale:a4];

  unint64_t v14 = [v12 imageWithConfiguration:v13];
  v15 = [v14 imageWithRenderingMode:2];

  id v16 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v16 setImage:v15];
  id v17 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v16 attributes:v9];

  return v17;
}

- (id)_percentageStringComponentsFromCurrentViewModel
{
  v32[1] = *MEMORY[0x1E4F143B8];
  if ([(MURatingPercentageViewModel *)self->_viewModel hasPercentage])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *MEMORY[0x1E4FB2950];
    id v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E4FB2950], *MEMORY[0x1E4FB09D8]);
    uint64_t v31 = *MEMORY[0x1E4FB0700];
    uint64_t v7 = +[MUInfoCardStyle secondaryTextColor];
    v32[0] = v7;
    int64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    id v9 = [v4 ratingSymbolStringWithFont:v6 symbolScale:1 attributes:v8];
    v28 = (void *)[v9 mutableCopy];

    id v10 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%lu%%", -[MURatingPercentageViewModel displayPercentage](self->_viewModel, "displayPercentage"));
    id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
    double v12 = *MEMORY[0x1E4FB09B8];
    unint64_t v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v5, *MEMORY[0x1E4FB09B8]);
    unint64_t v14 = +[MUInfoCardStyle secondaryTextColor];
    v15 = [(MUAppleRatingRowView *)self _attributesWithFont:v13 color:v14];
    id v16 = (void *)[v11 initWithString:v10 attributes:v15];

    [v3 addObject:v28];
    id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v29 = *MEMORY[0x1E4FB06F8];
    id v18 = objc_msgSend(MEMORY[0x1E4FB08E0], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v5, v12);
    id v30 = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v20 = (void *)[v17 initWithString:@" " attributes:v19];
    [v3 addObject:v20];

    [v3 addObject:v16];
    id v21 = objc_alloc(MEMORY[0x1E4F28B18]);
    v22 = _MULocalizedStringFromThisBundle(@"Delimiter");
    v23 = objc_msgSend(MEMORY[0x1E4FB08E0], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v5, v12);
    v24 = +[MUInfoCardStyle secondaryTextColor];
    id v25 = [(MUAppleRatingRowView *)self _attributesWithFont:v23 color:v24];
    v26 = (void *)[v21 initWithString:v22 attributes:v25];
    [v3 addObject:v26];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_attributesWithFont:(id)a3 color:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB0700];
  v11[0] = *MEMORY[0x1E4FB06F8];
  v11[1] = v5;
  v12[0] = a3;
  v12[1] = a4;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void)_contentSizeDidChange
{
  if (self->_ratingsCountAnimationEnabled) {
    [(MUAppleRatingRowView *)self _updateAppearanceAnimatingFromPreviousViewModel:0];
  }
  else {
    [(MUAppleRatingRowView *)self _updateAppearance];
  }
}

+ (id)_numberOfPeopleMonospacedFont
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = *MEMORY[0x1E4FB09F0];
  v2 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
  v24[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

  uint64_t v5 = *MEMORY[0x1E4FB0960];
  v21[0] = *MEMORY[0x1E4FB0968];
  uint64_t v4 = v21[0];
  v21[1] = v5;
  v22[0] = &unk_1EE404B08;
  v22[1] = &unk_1EE404B20;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v19[0] = v4;
  v19[1] = v5;
  v20[0] = &unk_1EE404B38;
  v20[1] = &unk_1EE404B50;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v17[0] = v4;
  v17[1] = v5;
  v18[0] = &unk_1EE404B08;
  v18[1] = &unk_1EE404B20;
  v17[2] = v4;
  v17[3] = v5;
  v18[2] = &unk_1EE404B38;
  v18[3] = &unk_1EE404B50;
  v17[4] = *MEMORY[0x1E4FB0910];
  v16[0] = v6;
  v16[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v17[5] = *MEMORY[0x1E4FB0950];
  v18[4] = v8;
  v18[5] = v3;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:6];

  id v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  id v11 = [v10 fontDescriptor];
  double v12 = [v11 fontDescriptorByAddingAttributes:v9];

  unint64_t v13 = (void *)MEMORY[0x1E4FB08E0];
  [v12 pointSize];
  unint64_t v14 = objc_msgSend(v13, "fontWithDescriptor:size:", v12);

  return v14;
}

- (MURatingPercentageViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_stackLayout, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
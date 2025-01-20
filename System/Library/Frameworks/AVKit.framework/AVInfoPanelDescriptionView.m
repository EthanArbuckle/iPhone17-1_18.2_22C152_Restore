@interface AVInfoPanelDescriptionView
+ (CGSize)layoutSize;
+ (UIImage)closedCaptioningBadgeImage;
- (AVInfoPanelDescriptionView)initWithFrame:(CGRect)a3;
- (AVTomatoRatingView)tomatoRatingView;
- (NSArray)actions;
- (NSLayoutConstraint)actionButtonsStackViewWidthConstraint;
- (NSLayoutConstraint)posterViewHeightConstraint;
- (NSLayoutConstraint)posterViewWidthConstraint;
- (NSLayoutConstraint)viewingModeBadgeWidthConstraint;
- (NSString)summaryText;
- (UIColor)textColor;
- (UIColor)titleTextColor;
- (UIFont)textFont;
- (UIFont)titleFont;
- (UIImage)posterImage;
- (UIImageView)closedCaptionBadge;
- (UIImageView)mediaContentRatingImageView;
- (UIImageView)posterView;
- (UIImageView)viewingModeBadgeImageView;
- (UILabel)dateLabel;
- (UILabel)durationLabel;
- (UILabel)genreLabel;
- (UILabel)mediaContentRatingLabel;
- (UILabel)seasonEpisodeLabel;
- (UILabel)subtitleLabel;
- (UILabel)summaryView;
- (UILabel)titleLabel;
- (UIStackView)actionButtonsStackView;
- (UIStackView)nextToPosterStackView;
- (UITapGestureRecognizer)summaryOverflowGestureRecognizer;
- (double)contentBottomMargin;
- (double)contentTopMargin;
- (void)_updateActionButtons;
- (void)setActions:(id)a3;
- (void)setClosedCaptionBadgeHidden:(BOOL)a3;
- (void)setContentBottomMargin:(double)a3;
- (void)setContentMediaRatingText:(id)a3 image:(id)a4;
- (void)setContentTopMargin:(double)a3;
- (void)setDateText:(id)a3;
- (void)setDurationText:(id)a3;
- (void)setGenreText:(id)a3;
- (void)setPosterImage:(id)a3;
- (void)setPosterViewHidden:(BOOL)a3;
- (void)setSeasonEpisodeText:(id)a3;
- (void)setSecondaryTitleText:(id)a3;
- (void)setSummaryText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextFont:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleTextColor:(id)a3;
- (void)setTomatoFreshness:(unint64_t)a3 rating:(float)a4 hidden:(BOOL)a5;
- (void)setViewingModeBadge:(int64_t)a3;
@end

@implementation AVInfoPanelDescriptionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonsStackViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_viewingModeBadgeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_posterViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_posterViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_summaryOverflowGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_summaryView, 0);
  objc_storeStrong((id *)&self->_tomatoRatingView, 0);
  objc_storeStrong((id *)&self->_closedCaptionBadge, 0);
  objc_storeStrong((id *)&self->_viewingModeBadgeImageView, 0);
  objc_storeStrong((id *)&self->_mediaContentRatingImageView, 0);
  objc_storeStrong((id *)&self->_mediaContentRatingLabel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_genreLabel, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_seasonEpisodeLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_actionButtonsStackView, 0);
  objc_storeStrong((id *)&self->_nextToPosterStackView, 0);
  objc_storeStrong((id *)&self->_posterView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_textFont, 0);
}

- (NSLayoutConstraint)actionButtonsStackViewWidthConstraint
{
  return self->_actionButtonsStackViewWidthConstraint;
}

- (NSLayoutConstraint)viewingModeBadgeWidthConstraint
{
  return self->_viewingModeBadgeWidthConstraint;
}

- (NSLayoutConstraint)posterViewHeightConstraint
{
  return self->_posterViewHeightConstraint;
}

- (NSLayoutConstraint)posterViewWidthConstraint
{
  return self->_posterViewWidthConstraint;
}

- (UITapGestureRecognizer)summaryOverflowGestureRecognizer
{
  return self->_summaryOverflowGestureRecognizer;
}

- (UILabel)summaryView
{
  return self->_summaryView;
}

- (AVTomatoRatingView)tomatoRatingView
{
  return self->_tomatoRatingView;
}

- (UIImageView)closedCaptionBadge
{
  return self->_closedCaptionBadge;
}

- (UIImageView)viewingModeBadgeImageView
{
  return self->_viewingModeBadgeImageView;
}

- (UIImageView)mediaContentRatingImageView
{
  return self->_mediaContentRatingImageView;
}

- (UILabel)mediaContentRatingLabel
{
  return self->_mediaContentRatingLabel;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (UILabel)genreLabel
{
  return self->_genreLabel;
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (UILabel)seasonEpisodeLabel
{
  return self->_seasonEpisodeLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIStackView)actionButtonsStackView
{
  return self->_actionButtonsStackView;
}

- (UIStackView)nextToPosterStackView
{
  return self->_nextToPosterStackView;
}

- (UIImageView)posterView
{
  return self->_posterView;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setContentBottomMargin:(double)a3
{
  self->_contentBottomMargin = a3;
}

- (double)contentBottomMargin
{
  return self->_contentBottomMargin;
}

- (void)setContentTopMargin:(double)a3
{
  self->_contentTopMargin = a3;
}

- (double)contentTopMargin
{
  return self->_contentTopMargin;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (void)_updateActionButtons
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v3 = [(UIStackView *)self->_actionButtonsStackView arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [(UIStackView *)self->_actionButtonsStackView removeArrangedSubview:v8];
        [v8 removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [(AVInfoPanelDescriptionView *)self actions];
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        v15 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
        [v15 setImagePadding:8.0];
        v16 = [MEMORY[0x1E4FB1618] whiteColor];
        [v15 setBaseForegroundColor:v16];

        v17 = [v15 background];
        [v17 setCornerRadius:16.0];

        [v15 setCornerStyle:3];
        objc_msgSend(v15, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
        [v15 setButtonSize:1];
        v18 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v15 primaryAction:v14];
        [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v18 sizeToFit];
        v19 = [v18 widthAnchor];
        v20 = [v19 constraintEqualToConstant:180.0];
        [v9 addObject:v20];

        [(UIStackView *)self->_actionButtonsStackView addArrangedSubview:v18];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v11);
  }

  v21 = [(AVInfoPanelDescriptionView *)self actions];
  uint64_t v22 = [v21 count];

  actionButtonsStackViewWidthConstraint = self->_actionButtonsStackViewWidthConstraint;
  if (v22)
  {
    [(NSLayoutConstraint *)actionButtonsStackViewWidthConstraint setConstant:196.0];
    [MEMORY[0x1E4F28DC8] activateConstraints:v9];
  }
  else
  {
    [(NSLayoutConstraint *)actionButtonsStackViewWidthConstraint setConstant:0.0];
  }
}

- (void)setActions:(id)a3
{
  if (self->_actions != a3)
  {
    uint64_t v4 = (NSArray *)[a3 copy];
    actions = self->_actions;
    self->_actions = v4;

    [(AVInfoPanelDescriptionView *)self _updateActionButtons];
  }
}

- (void)setTitleFont:(id)a3
{
  uint64_t v5 = (UIFont *)a3;
  if (self->_titleFont != v5)
  {
    objc_storeStrong((id *)&self->_titleFont, a3);
    [(UILabel *)self->_titleLabel setFont:v5];
  }
}

- (void)setTextFont:(id)a3
{
  uint64_t v5 = (UIFont *)a3;
  if (self->_textFont != v5)
  {
    objc_storeStrong((id *)&self->_textFont, a3);
    [(UILabel *)self->_subtitleLabel setFont:v5];
    [(UILabel *)self->_seasonEpisodeLabel setFont:v5];
    [(AVTomatoRatingView *)self->_tomatoRatingView setFont:v5];
    [(UILabel *)self->_durationLabel setFont:v5];
    [(UILabel *)self->_genreLabel setFont:v5];
    [(UILabel *)self->_dateLabel setFont:v5];
    [(UILabel *)self->_mediaContentRatingLabel setFont:v5];
    [(UILabel *)self->_summaryView setFont:v5];
  }
}

- (void)setTitleTextColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_titleTextColor != v5)
  {
    objc_storeStrong((id *)&self->_titleTextColor, a3);
    [(UILabel *)self->_titleLabel setTextColor:v5];
  }
}

- (void)setTextColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(UILabel *)self->_subtitleLabel setTextColor:v5];
    [(UILabel *)self->_seasonEpisodeLabel setTextColor:v5];
    [(AVTomatoRatingView *)self->_tomatoRatingView setTextColor:v5];
    [(UILabel *)self->_durationLabel setTextColor:v5];
    [(UILabel *)self->_genreLabel setTextColor:v5];
    [(UILabel *)self->_dateLabel setTextColor:v5];
    [(UILabel *)self->_mediaContentRatingLabel setTextColor:v5];
    [(UIImageView *)self->_mediaContentRatingImageView setTintColor:v5];
    [(UIImageView *)self->_viewingModeBadgeImageView setTintColor:v5];
    [(UIImageView *)self->_closedCaptionBadge setTintColor:v5];
    [(UILabel *)self->_summaryView setTextColor:v5];
  }
}

- (AVInfoPanelDescriptionView)initWithFrame:(CGRect)a3
{
  v105.receiver = self;
  v105.super_class = (Class)AVInfoPanelDescriptionView;
  v3 = -[AVInfoPanelDescriptionView initWithFrame:](&v105, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v4 setAlignment:3];
    [v4 setAxis:0];
    [v4 setDistribution:3];
    [v4 setSpacing:20.0];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v101 = v4;
    [(AVInfoPanelDescriptionView *)v3 addSubview:v4];
    uint64_t v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    textFont = v3->_textFont;
    v3->_textFont = (UIFont *)v5;

    uint64_t v7 = [MEMORY[0x1E4FB1618] blackColor];
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v7;

    uint64_t v9 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] variant:1024];
    titleFont = v3->_titleFont;
    v3->_titleFont = (UIFont *)v9;

    uint64_t v11 = [MEMORY[0x1E4FB1618] whiteColor];
    titleTextColor = v3->_titleTextColor;
    v3->_titleTextColor = (UIColor *)v11;

    objc_initWeak(&location, v3);
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __44__AVInfoPanelDescriptionView_initWithFrame___block_invoke;
    v102[3] = &unk_1E5FC3298;
    objc_copyWeak(&v103, &location);
    v13 = (void (**)(void))MEMORY[0x1B3E963E0](v102);
    uint64_t v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    posterView = v3->_posterView;
    v3->_posterView = v14;

    v16 = v3->_posterView;
    v17 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)v16 setBackgroundColor:v17];

    [(UIImageView *)v3->_posterView setContentMode:1];
    [(UIImageView *)v3->_posterView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_posterView setAccessibilityIdentifier:@"AVPoster"];
    v18 = [(UIImageView *)v3->_posterView layer];
    [v18 setCornerRadius:8.0];

    [(UIImageView *)v3->_posterView setClipsToBounds:1];
    [v101 addArrangedSubview:v3->_posterView];
    v19 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    nextToPosterStackView = v3->_nextToPosterStackView;
    v3->_nextToPosterStackView = v19;

    [(UIStackView *)v3->_nextToPosterStackView setAlignment:1];
    [(UIStackView *)v3->_nextToPosterStackView setAxis:1];
    [(UIStackView *)v3->_nextToPosterStackView setDistribution:3];
    [(UIStackView *)v3->_nextToPosterStackView setSpacing:8.0];
    [(UIStackView *)v3->_nextToPosterStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v101 addArrangedSubview:v3->_nextToPosterStackView];
    uint64_t v21 = v13[2](v13);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v21;

    v23 = v3->_titleLabel;
    v24 = [(AVInfoPanelDescriptionView *)v3 titleFont];
    [(UILabel *)v23 setFont:v24];

    long long v25 = v3->_titleLabel;
    long long v26 = [(AVInfoPanelDescriptionView *)v3 titleTextColor];
    [(UILabel *)v25 setTextColor:v26];

    [(UILabel *)v3->_titleLabel setLineBreakMode:4];
    [(UILabel *)v3->_titleLabel setAccessibilityIdentifier:@"AVTitle"];
    [(UILabel *)v3->_titleLabel _setTextAlignmentFollowsWritingDirection:1];
    [(UIStackView *)v3->_nextToPosterStackView addArrangedSubview:v3->_titleLabel];
    uint64_t v27 = v13[2](v13);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v27;

    [(UILabel *)v3->_subtitleLabel setAccessibilityIdentifier:@"AVSubtitle"];
    [(UILabel *)v3->_subtitleLabel _setTextAlignmentFollowsWritingDirection:1];
    [(UIStackView *)v3->_nextToPosterStackView addArrangedSubview:v3->_subtitleLabel];
    id v29 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    [v29 setAlignment:3];
    [v29 setAxis:0];
    [v29 setDistribution:3];
    [v29 setSpacing:12.0];
    uint64_t v30 = v13[2](v13);
    seasonEpisodeLabel = v3->_seasonEpisodeLabel;
    v3->_seasonEpisodeLabel = (UILabel *)v30;

    [(UILabel *)v3->_seasonEpisodeLabel setAccessibilityIdentifier:@"AVSeasonEpisode"];
    [v29 addArrangedSubview:v3->_seasonEpisodeLabel];
    long long v32 = objc_alloc_init(AVTomatoRatingView);
    tomatoRatingView = v3->_tomatoRatingView;
    v3->_tomatoRatingView = v32;

    v34 = v3->_tomatoRatingView;
    uint64_t v35 = [(AVInfoPanelDescriptionView *)v3 textFont];
    [(AVTomatoRatingView *)v34 setFont:v35];

    v36 = v3->_tomatoRatingView;
    v37 = [(AVInfoPanelDescriptionView *)v3 textColor];
    [(AVTomatoRatingView *)v36 setTextColor:v37];

    [v29 addArrangedSubview:v3->_tomatoRatingView];
    uint64_t v38 = v13[2](v13);
    durationLabel = v3->_durationLabel;
    v3->_durationLabel = (UILabel *)v38;

    [(UILabel *)v3->_durationLabel setAccessibilityIdentifier:@"AVDuration"];
    [v29 addArrangedSubview:v3->_durationLabel];
    uint64_t v40 = v13[2](v13);
    genreLabel = v3->_genreLabel;
    v3->_genreLabel = (UILabel *)v40;

    [(UILabel *)v3->_genreLabel setAccessibilityIdentifier:@"AVGenre"];
    [v29 addArrangedSubview:v3->_genreLabel];
    uint64_t v42 = v13[2](v13);
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = (UILabel *)v42;

    [(UILabel *)v3->_dateLabel setAccessibilityIdentifier:@"AVDate"];
    [v29 addArrangedSubview:v3->_dateLabel];
    uint64_t v44 = v13[2](v13);
    mediaContentRatingLabel = v3->_mediaContentRatingLabel;
    v3->_mediaContentRatingLabel = (UILabel *)v44;

    [(UILabel *)v3->_mediaContentRatingLabel setAccessibilityIdentifier:@"AVMediaContentRatingLabel"];
    [v29 addArrangedSubview:v3->_mediaContentRatingLabel];
    v46 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    mediaContentRatingImageView = v3->_mediaContentRatingImageView;
    v3->_mediaContentRatingImageView = v46;

    v48 = v3->_mediaContentRatingImageView;
    v49 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)v48 setBackgroundColor:v49];

    [(UIImageView *)v3->_mediaContentRatingImageView setContentMode:1];
    v50 = v3->_mediaContentRatingImageView;
    v51 = [(AVInfoPanelDescriptionView *)v3 textColor];
    [(UIImageView *)v50 setTintColor:v51];

    [(UIImageView *)v3->_mediaContentRatingImageView setAccessibilityIdentifier:@"AVMediaContentRatingImage"];
    [v29 addArrangedSubview:v3->_mediaContentRatingImageView];
    v52 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    viewingModeBadgeImageView = v3->_viewingModeBadgeImageView;
    v3->_viewingModeBadgeImageView = v52;

    v54 = v3->_viewingModeBadgeImageView;
    v55 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)v54 setBackgroundColor:v55];

    [(UIImageView *)v3->_viewingModeBadgeImageView setContentMode:1];
    v56 = v3->_viewingModeBadgeImageView;
    v57 = [(AVInfoPanelDescriptionView *)v3 textColor];
    [(UIImageView *)v56 setTintColor:v57];

    [(UIImageView *)v3->_viewingModeBadgeImageView setAccessibilityIdentifier:@"AVViewingModeImage"];
    [v29 addArrangedSubview:v3->_viewingModeBadgeImageView];
    v58 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    closedCaptionBadge = v3->_closedCaptionBadge;
    v3->_closedCaptionBadge = v58;

    v60 = v3->_closedCaptionBadge;
    v61 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIImageView *)v60 setBackgroundColor:v61];

    [(UIImageView *)v3->_closedCaptionBadge setContentMode:1];
    v62 = v3->_closedCaptionBadge;
    v63 = [(id)objc_opt_class() closedCaptioningBadgeImage];
    [(UIImageView *)v62 setImage:v63];

    v64 = v3->_closedCaptionBadge;
    v65 = [(AVInfoPanelDescriptionView *)v3 textColor];
    [(UIImageView *)v64 setTintColor:v65];

    [(UIImageView *)v3->_closedCaptionBadge setAccessibilityIdentifier:@"AVClosedCaptions"];
    [v29 addArrangedSubview:v3->_closedCaptionBadge];
    uint64_t v66 = v13[2](v13);
    summaryView = v3->_summaryView;
    v3->_summaryView = (UILabel *)v66;

    [(UILabel *)v3->_summaryView setNumberOfLines:5];
    [(UILabel *)v3->_summaryView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_summaryView setAccessibilityIdentifier:@"AVSummary"];
    [(UIStackView *)v3->_nextToPosterStackView addArrangedSubview:v3->_summaryView];
    [(UIStackView *)v3->_nextToPosterStackView addArrangedSubview:v29];
    v68 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    actionButtonsStackView = v3->_actionButtonsStackView;
    v3->_actionButtonsStackView = v68;

    [(UIStackView *)v3->_actionButtonsStackView setAlignment:1];
    [(UIStackView *)v3->_actionButtonsStackView setAxis:1];
    [(UIStackView *)v3->_actionButtonsStackView setDistribution:3];
    [(UIStackView *)v3->_actionButtonsStackView setSpacing:8.0];
    [(UIStackView *)v3->_actionButtonsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    v70 = [(UIStackView *)v3->_actionButtonsStackView widthAnchor];
    uint64_t v71 = [v70 constraintEqualToConstant:0.0];
    actionButtonsStackViewWidthConstraint = v3->_actionButtonsStackViewWidthConstraint;
    v3->_actionButtonsStackViewWidthConstraint = (NSLayoutConstraint *)v71;

    [v101 addArrangedSubview:v3->_actionButtonsStackView];
    v73 = [MEMORY[0x1E4F1CA48] array];
    v74 = [v101 centerXAnchor];
    v75 = [(AVInfoPanelDescriptionView *)v3 centerXAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    [v73 addObject:v76];

    v77 = [v101 centerYAnchor];
    v78 = [(AVInfoPanelDescriptionView *)v3 centerYAnchor];
    v79 = [v77 constraintEqualToAnchor:v78];
    [v73 addObject:v79];

    [(id)objc_opt_class() layoutSize];
    double v81 = v80;
    v82 = [v101 widthAnchor];
    v83 = [v82 constraintLessThanOrEqualToConstant:v81];
    [v73 addObject:v83];

    v84 = [(AVInfoPanelDescriptionView *)v3 heightAnchor];
    v85 = [v101 heightAnchor];
    v86 = [v84 constraintEqualToAnchor:v85];
    [v73 addObject:v86];

    v87 = [(AVInfoPanelDescriptionView *)v3 widthAnchor];
    v88 = [v101 widthAnchor];
    v89 = [v87 constraintEqualToAnchor:v88];
    [v73 addObject:v89];

    [v73 addObject:v3->_actionButtonsStackViewWidthConstraint];
    v90 = [(AVInfoPanelDescriptionView *)v3 textFont];
    [v90 lineHeight];
    double v92 = v91;

    v93 = [(UIImageView *)v3->_viewingModeBadgeImageView heightAnchor];
    v94 = [v93 constraintEqualToConstant:v92];
    [v73 addObject:v94];

    v95 = [(UIImageView *)v3->_viewingModeBadgeImageView widthAnchor];
    uint64_t v96 = [v95 constraintEqualToConstant:0.0];
    viewingModeBadgeWidthConstraint = v3->_viewingModeBadgeWidthConstraint;
    v3->_viewingModeBadgeWidthConstraint = (NSLayoutConstraint *)v96;

    [v73 addObject:v3->_viewingModeBadgeWidthConstraint];
    v98 = [(UIImageView *)v3->_mediaContentRatingImageView heightAnchor];
    v99 = [v98 constraintEqualToConstant:v92];
    [v73 addObject:v99];

    [MEMORY[0x1E4F28DC8] activateConstraints:v73];
    [(AVInfoPanelDescriptionView *)v3 _updateActionButtons];

    objc_destroyWeak(&v103);
    objc_destroyWeak(&location);
  }
  return v3;
}

AVDarkModeCompatibleLabel *__44__AVInfoPanelDescriptionView_initWithFrame___block_invoke(id *a1)
{
  v2 = objc_alloc_init(AVDarkModeCompatibleLabel);
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  id v4 = [WeakRetained textFont];
  [(AVDarkModeCompatibleLabel *)v2 setFont:v4];

  id v5 = objc_loadWeakRetained(a1);
  uint64_t v6 = [v5 textColor];
  [(AVDarkModeCompatibleLabel *)v2 setTextColor:v6];

  [(AVDarkModeCompatibleLabel *)v2 setOpaque:0];
  [(AVDarkModeCompatibleLabel *)v2 setLineBreakMode:4];

  return v2;
}

+ (CGSize)layoutSize
{
  double v2 = 800.0;
  double v3 = 148.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIImage)closedCaptioningBadgeImage
{
  double v2 = (void *)MEMORY[0x1E4FB1818];
  double v3 = AVBundle();
  id v4 = [v2 imageNamed:@"cc_mask" inBundle:v3 compatibleWithTraitCollection:0];

  id v5 = [v4 imageWithBaselineOffsetFromBottom:1.0];

  uint64_t v6 = [v5 imageWithRenderingMode:2];

  return (UIImage *)v6;
}

- (void)setViewingModeBadge:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    char v5 = 0;
    uint64_t v6 = @"Badge2";
  }
  else if (a3 == 1)
  {
    char v5 = 0;
    uint64_t v6 = @"Badge1";
  }
  else
  {
    uint64_t v6 = 0;
    char v5 = 1;
  }
  uint64_t v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315650;
    uint64_t v21 = "-[AVInfoPanelDescriptionView(Facade) setViewingModeBadge:]";
    __int16 v22 = 2048;
    int64_t v23 = a3;
    __int16 v24 = 2114;
    long long v25 = v6;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s viewingModeBadge %ld ==> image %{public}@", (uint8_t *)&v20, 0x20u);
  }

  if (v5)
  {
    v8 = 0;
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v10 = AVBundle();
    uint64_t v11 = [v9 imageNamed:v6 inBundle:v10 compatibleWithTraitCollection:0];
    v8 = [v11 imageWithRenderingMode:2];
  }
  [(UIImageView *)self->_viewingModeBadgeImageView setImage:v8];
  if (v8)
  {
    [v8 size];
    double v14 = v12 / v13;
    v15 = [(AVInfoPanelDescriptionView *)self textFont];
    [v15 lineHeight];
    double v17 = v16;

    viewingModeBadgeWidthConstraint = self->_viewingModeBadgeWidthConstraint;
    double v19 = v14 * v17;
  }
  else
  {
    viewingModeBadgeWidthConstraint = self->_viewingModeBadgeWidthConstraint;
    double v19 = 0.0;
  }
  [(NSLayoutConstraint *)viewingModeBadgeWidthConstraint setConstant:v19];
  [(UIImageView *)self->_viewingModeBadgeImageView setHidden:v8 == 0];
}

- (void)setContentMediaRatingText:(id)a3 image:(id)a4
{
  mediaContentRatingLabel = self->_mediaContentRatingLabel;
  id v7 = a4;
  [(UILabel *)mediaContentRatingLabel setText:a3];
  [(UIImageView *)self->_mediaContentRatingImageView setImage:v7];

  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = a3 == 0;
  }
  [(UIImageView *)self->_mediaContentRatingImageView setHidden:v7 == 0];
  uint64_t v9 = self->_mediaContentRatingLabel;

  [(UILabel *)v9 setHidden:v8];
}

- (void)setTomatoFreshness:(unint64_t)a3 rating:(float)a4 hidden:(BOOL)a5
{
  BOOL v5 = a5;
  [(AVTomatoRatingView *)self->_tomatoRatingView setTomatoFreshness:a3];
  *(float *)&double v8 = a4;
  [(AVTomatoRatingView *)self->_tomatoRatingView setTomatoRating:v8];
  tomatoRatingView = self->_tomatoRatingView;

  [(AVTomatoRatingView *)tomatoRatingView setHidden:v5];
}

- (void)setClosedCaptionBadgeHidden:(BOOL)a3
{
}

- (void)setPosterViewHidden:(BOOL)a3
{
}

- (void)setDateText:(id)a3
{
  id v5 = a3;
  id v4 = self->_dateLabel;
  [(UILabel *)v4 setText:v5];
  -[UILabel setHidden:](v4, "setHidden:", [v5 length] == 0);
}

- (void)setGenreText:(id)a3
{
  id v5 = a3;
  id v4 = self->_genreLabel;
  [(UILabel *)v4 setText:v5];
  -[UILabel setHidden:](v4, "setHidden:", [v5 length] == 0);
}

- (void)setDurationText:(id)a3
{
  id v5 = a3;
  id v4 = self->_durationLabel;
  [(UILabel *)v4 setText:v5];
  -[UILabel setHidden:](v4, "setHidden:", [v5 length] == 0);
}

- (void)setSeasonEpisodeText:(id)a3
{
  id v5 = a3;
  id v4 = self->_seasonEpisodeLabel;
  [(UILabel *)v4 setText:v5];
  -[UILabel setHidden:](v4, "setHidden:", [v5 length] == 0);
}

- (void)setSecondaryTitleText:(id)a3
{
  id v5 = a3;
  id v4 = self->_subtitleLabel;
  [(UILabel *)v4 setText:v5];
  -[UILabel setHidden:](v4, "setHidden:", [v5 length] == 0);
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  id v4 = self->_titleLabel;
  [(UILabel *)v4 setText:v5];
  -[UILabel setHidden:](v4, "setHidden:", [v5 length] == 0);
}

- (void)setSummaryText:(id)a3
{
  summaryView = self->_summaryView;
  id v5 = a3;
  [(UILabel *)summaryView setText:v5];
  uint64_t v6 = [v5 length];

  id v7 = self->_summaryView;

  [(UILabel *)v7 setHidden:v6 == 0];
}

- (NSString)summaryText
{
  return [(UILabel *)self->_summaryView text];
}

- (void)setPosterImage:(id)a3
{
  id v26 = a3;
  if (self->_posterViewHeightConstraint)
  {
    posterViewWidthConstraint = self->_posterViewWidthConstraint;
    if (posterViewWidthConstraint)
    {
      [(NSLayoutConstraint *)posterViewWidthConstraint setActive:0];
      [(NSLayoutConstraint *)self->_posterViewHeightConstraint setActive:0];
    }
  }
  -[UIStackView systemLayoutSizeFittingSize:](self->_nextToPosterStackView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v6 = v5;
  id v7 = [(AVInfoPanelDescriptionView *)self textFont];
  [v7 lineHeight];
  double v9 = v8;

  uint64_t v10 = [(AVInfoPanelDescriptionView *)self textFont];
  [v10 lineHeight];
  double v12 = v11;

  if (v26 && v6 > v12 * 3.0)
  {
    if (v9 * 5.0 >= v6) {
      double v6 = v9 * 5.0;
    }
    [(UIImageView *)self->_posterView setImage:v26];
    double v13 = [(UIImageView *)self->_posterView image];
    [v13 size];
    double v15 = v14;
    double v16 = [(UIImageView *)self->_posterView image];
    [v16 size];
    double v18 = v15 / v17;

    double v19 = [(UIImageView *)self->_posterView heightAnchor];
    int v20 = [v19 constraintEqualToConstant:v6];
    posterViewHeightConstraint = self->_posterViewHeightConstraint;
    self->_posterViewHeightConstraint = v20;

    __int16 v22 = [(UIImageView *)self->_posterView widthAnchor];
    int64_t v23 = [(UIImageView *)self->_posterView heightAnchor];
    __int16 v24 = [v22 constraintEqualToAnchor:v23 multiplier:v18];
    long long v25 = self->_posterViewWidthConstraint;
    self->_posterViewWidthConstraint = v24;

    [(NSLayoutConstraint *)self->_posterViewHeightConstraint setActive:1];
    [(NSLayoutConstraint *)self->_posterViewWidthConstraint setActive:1];
  }
  else
  {
    [(UIImageView *)self->_posterView setImage:0];
    [(UIImageView *)self->_posterView setHidden:1];
  }
}

- (UIImage)posterImage
{
  return [(UIImageView *)self->_posterView image];
}

@end
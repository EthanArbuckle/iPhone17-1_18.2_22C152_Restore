@interface AVTStickerRecentsOverlayView
+ (id)disclosureOverlayView;
+ (id)overlayViewForMemojiCreation;
+ (id)standardOverlayView;
+ (id)stickerButtonImage;
- (AVTStickerRecentsOverlayDelegate)delegate;
- (AVTStickerRecentsOverlayView)initWithFrame:(CGRect)a3 title:(id)a4 subtitle:(id)a5 buttonTitle:(id)a6 image:(id)a7;
- (AVTStickerRecentsOverlayViewLayout)currentLayout;
- (AVTStickerRecentsOverlayViewLayout)landscapeLayout;
- (AVTStickerRecentsOverlayViewLayout)portraitLayout;
- (NSArray)layoutConstraints;
- (NSLayoutConstraint)containerLeadingConstraint;
- (NSLayoutConstraint)containerTopConstraint;
- (NSLayoutConstraint)containerTrailingConstraint;
- (NSLayoutConstraint)hideSubtitleConstraint;
- (NSLayoutConstraint)imageHeightConstraint;
- (NSLayoutConstraint)imageToTitleConstraint;
- (NSLayoutConstraint)titleToSubtitleConstraint;
- (NSString)subtitle;
- (NSString)title;
- (UIButton)closeButton;
- (UIButton)continueButton;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)centeredContainerView;
- (id)appropriateLayout;
- (void)didTapCloseButton:(id)a3;
- (void)didTapContentView:(id)a3;
- (void)didTapContinueButton:(id)a3;
- (void)dismissAnimatedWithDuration:(double)a3;
- (void)layoutSubviews;
- (void)setCenteredContainerView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setContainerLeadingConstraint:(id)a3;
- (void)setContainerTopConstraint:(id)a3;
- (void)setContainerTrailingConstraint:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setCurrentLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHideSubtitleConstraint:(id)a3;
- (void)setImageHeightConstraint:(id)a3;
- (void)setImageToTitleConstraint:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLandscapeLayout:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setPortraitLayout:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleToSubtitleConstraint:(id)a3;
- (void)setupConstraints;
- (void)updateConstraints;
@end

@implementation AVTStickerRecentsOverlayView

+ (id)stickerButtonImage
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v2 imageNamed:@"stickers_button" inBundle:v3 compatibleWithTraitCollection:0];

  return v4;
}

+ (id)overlayViewForMemojiCreation
{
  id v3 = objc_alloc((Class)a1);
  v4 = AVTAvatarUIBundle();
  v5 = [v4 localizedStringForKey:@"STICKER_RECENTS_SPLASH_TITLE" value:&stru_26BF058D0 table:@"Localized"];
  v6 = AVTAvatarUIBundle();
  v7 = [v6 localizedStringForKey:@"STICKER_RECENTS_SPLASH_MESSAGE" value:&stru_26BF058D0 table:@"Localized"];
  v8 = AVTAvatarUIBundle();
  v9 = [v8 localizedStringForKey:@"STICKER_RECENTS_SPLASH_CONTINUE_BUTTON_TITLE" value:&stru_26BF058D0 table:@"Localized"];
  v10 = [a1 stickerButtonImage];
  v11 = objc_msgSend(v3, "initWithFrame:title:subtitle:buttonTitle:image:", v5, v7, v9, v10, 0.0, 0.0, 50.0, 50.0);

  return v11;
}

+ (id)standardOverlayView
{
  id v3 = objc_alloc((Class)a1);
  v4 = AVTAvatarUIBundle();
  v5 = [v4 localizedStringForKey:@"STICKER_RECENTS_SPLASH_TITLE" value:&stru_26BF058D0 table:@"Localized"];
  v6 = AVTAvatarUIBundle();
  v7 = [v6 localizedStringForKey:@"STICKER_RECENTS_SPLASH_MESSAGE" value:&stru_26BF058D0 table:@"Localized"];
  v8 = [a1 stickerButtonImage];
  v9 = objc_msgSend(v3, "initWithFrame:title:subtitle:buttonTitle:image:", v5, v7, 0, v8, 0.0, 0.0, 50.0, 50.0);

  return v9;
}

+ (id)disclosureOverlayView
{
  id v3 = objc_alloc((Class)a1);
  v4 = [a1 stickerButtonImage];
  v5 = objc_msgSend(v3, "initWithFrame:title:subtitle:buttonTitle:image:", @"Warning", @"Only send to disclosed individuals", 0, v4, 0.0, 0.0, 50.0, 50.0);

  return v5;
}

- (AVTStickerRecentsOverlayView)initWithFrame:(CGRect)a3 title:(id)a4 subtitle:(id)a5 buttonTitle:(id)a6 image:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v74[1] = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v18 = [MEMORY[0x263F1C480] effectWithBlurRadius:6.0];
  v73.receiver = self;
  v73.super_class = (Class)AVTStickerRecentsOverlayView;
  v19 = [(AVTStickerRecentsOverlayView *)&v73 initWithEffect:v18];
  v20 = v19;
  if (v19)
  {
    -[AVTStickerRecentsOverlayView setFrame:](v19, "setFrame:", x, y, width, height);
    uint64_t v21 = [v15 copy];
    title = v20->_title;
    v20->_title = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    subtitle = v20->_subtitle;
    v20->_subtitle = (NSString *)v23;

    objc_storeStrong((id *)&v20->_image, a7);
    id v25 = objc_alloc(MEMORY[0x263F1CB60]);
    double v26 = *MEMORY[0x263F001A8];
    double v27 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v28 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v29 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v30 = objc_msgSend(v25, "initWithFrame:", *MEMORY[0x263F001A8], v27, v28, v29);
    centeredContainerView = v20->_centeredContainerView;
    v20->_centeredContainerView = (UIView *)v30;

    [(UIView *)v20->_centeredContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = [(AVTStickerRecentsOverlayView *)v20 contentView];
    [v32 addSubview:v20->_centeredContainerView];

    uint64_t v33 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v17];
    imageView = v20->_imageView;
    v20->_imageView = (UIImageView *)v33;

    [(UIImageView *)v20->_imageView setAccessibilityIgnoresInvertColors:1];
    [(UIImageView *)v20->_imageView setContentMode:1];
    [(UIImageView *)v20->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v20->_centeredContainerView addSubview:v20->_imageView];
    uint64_t v35 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v26, v27, v28, v29);
    titleLabel = v20->_titleLabel;
    v20->_titleLabel = (UILabel *)v35;

    v37 = +[AVTUIFontRepository keyboardRecentsSplashTitleFont];
    [(UILabel *)v20->_titleLabel setFont:v37];

    [(UILabel *)v20->_titleLabel setTextAlignment:1];
    v38 = (void *)[v15 copy];
    [(UILabel *)v20->_titleLabel setText:v38];

    [(UILabel *)v20->_titleLabel setMinimumScaleFactor:0.5];
    [(UILabel *)v20->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v20->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v20->_centeredContainerView addSubview:v20->_titleLabel];
    uint64_t v39 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v26, v27, v28, v29);
    subtitleLabel = v20->_subtitleLabel;
    v20->_subtitleLabel = (UILabel *)v39;

    v41 = +[AVTUIFontRepository keyboardRecentsSplashSubtitleFont];
    [(UILabel *)v20->_subtitleLabel setFont:v41];

    [(UILabel *)v20->_subtitleLabel setTextAlignment:1];
    v42 = (void *)[v16 copy];
    [(UILabel *)v20->_subtitleLabel setText:v42];

    [(UILabel *)v20->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v20->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v20->_subtitleLabel setMinimumScaleFactor:0.5];
    [(UILabel *)v20->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
    LODWORD(v43) = 1144766464;
    [(UILabel *)v20->_subtitleLabel setContentCompressionResistancePriority:1 forAxis:v43];
    LODWORD(v44) = 1148846080;
    [(UILabel *)v20->_subtitleLabel setContentHuggingPriority:1 forAxis:v44];
    [(UIView *)v20->_centeredContainerView addSubview:v20->_subtitleLabel];
    if (a6)
    {
      uint64_t v45 = [MEMORY[0x263F1C488] buttonWithType:1];
      continueButton = v20->_continueButton;
      v20->_continueButton = (UIButton *)v45;

      v47 = +[AVTUIFontRepository keyboardRecentsSplashContinueButtonFont];
      v48 = [(UIButton *)v20->_continueButton titleLabel];
      [v48 setFont:v47];

      [(UIButton *)v20->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
      v49 = v20->_continueButton;
      v50 = AVTAvatarUIBundle();
      v51 = [v50 localizedStringForKey:@"STICKER_RECENTS_SPLASH_CONTINUE_BUTTON_TITLE" value:&stru_26BF058D0 table:@"Localized"];
      [(UIButton *)v49 setTitle:v51 forState:0];

      [(UIButton *)v20->_continueButton addTarget:v20 action:sel_didTapContinueButton_ forControlEvents:64];
      [(UIView *)v20->_centeredContainerView addSubview:v20->_continueButton];
      v52 = (UIButton *)objc_alloc_init(MEMORY[0x263F1C488]);
      closeButton = v20->_closeButton;
      v20->_closeButton = v52;

      [(UIButton *)v20->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
      v54 = [MEMORY[0x263F1C6C8] configurationWithTextStyle:*MEMORY[0x263F1D2F8] scale:2];
      v55 = (void *)MEMORY[0x263F1C6C8];
      v56 = [MEMORY[0x263F1C550] secondaryLabelColor];
      v74[0] = v56;
      v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:1];
      v58 = [v55 _configurationWithHierarchicalColors:v57];

      v59 = [v58 configurationByApplyingConfiguration:v54];
      v60 = [MEMORY[0x263F1C6B0] systemImageNamed:@"xmark.circle.fill"];
      [(UIButton *)v20->_closeButton setImage:v60 forState:0];
      [(UIButton *)v20->_closeButton setPreferredSymbolConfiguration:v59 forImageInState:0];
      [(UIButton *)v20->_closeButton addTarget:v20 action:sel_didTapCloseButton_ forControlEvents:64];
      v61 = [(AVTStickerRecentsOverlayView *)v20 contentView];
      [v61 addSubview:v20->_closeButton];

      uint64_t v62 = +[AVTStickerRecentsOverlayViewLayout buttonsPortraitLayout];
      portraitLayout = v20->_portraitLayout;
      v20->_portraitLayout = (AVTStickerRecentsOverlayViewLayout *)v62;

      uint64_t v64 = +[AVTStickerRecentsOverlayViewLayout buttonsLandscapeLayout];
      landscapeLayout = v20->_landscapeLayout;
      v20->_landscapeLayout = (AVTStickerRecentsOverlayViewLayout *)v64;
    }
    else
    {
      uint64_t v66 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v20 action:sel_didTapContentView_];
      tapGestureRecognizer = v20->_tapGestureRecognizer;
      v20->_tapGestureRecognizer = (UITapGestureRecognizer *)v66;

      v68 = [(AVTStickerRecentsOverlayView *)v20 contentView];
      [v68 addGestureRecognizer:v20->_tapGestureRecognizer];

      uint64_t v69 = +[AVTStickerRecentsOverlayViewLayout standardPortraitLayout];
      v70 = v20->_portraitLayout;
      v20->_portraitLayout = (AVTStickerRecentsOverlayViewLayout *)v69;

      uint64_t v71 = +[AVTStickerRecentsOverlayViewLayout standardLandscapeLayout];
      v54 = v20->_landscapeLayout;
      v20->_landscapeLayout = (AVTStickerRecentsOverlayViewLayout *)v71;
    }

    [(AVTStickerRecentsOverlayView *)v20 setupConstraints];
  }

  return v20;
}

- (void)didTapContentView:(id)a3
{
  id v4 = [(AVTStickerRecentsOverlayView *)self delegate];
  [v4 overlayDidTapContentView:self];
}

- (void)didTapContinueButton:(id)a3
{
  id v4 = [(AVTStickerRecentsOverlayView *)self delegate];
  [v4 overlayDidTapContinueButton:self];
}

- (void)didTapCloseButton:(id)a3
{
  id v4 = [(AVTStickerRecentsOverlayView *)self delegate];
  [v4 overlayDidTapCloseButton:self];
}

- (id)appropriateLayout
{
  [(AVTStickerRecentsOverlayView *)self bounds];
  double v4 = v3;
  [(AVTStickerRecentsOverlayView *)self bounds];
  v5 = &OBJC_IVAR___AVTStickerRecentsOverlayView__portraitLayout;
  if (v4 > v6) {
    v5 = &OBJC_IVAR___AVTStickerRecentsOverlayView__landscapeLayout;
  }
  v7 = *(Class *)((char *)&self->super.super.super.super.isa + *v5);
  return v7;
}

- (void)setupConstraints
{
  v114[16] = *MEMORY[0x263EF8340];
  double v3 = [(AVTStickerRecentsOverlayView *)self appropriateLayout];
  double v4 = self->_centeredContainerView;
  v5 = [(UIView *)v4 topAnchor];
  double v6 = [(AVTStickerRecentsOverlayView *)self contentView];
  v7 = [v6 topAnchor];
  [v3 imageToTopPadding];
  objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:constant:", v7);
  v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  containerTopConstraint = self->_containerTopConstraint;
  self->_containerTopConstraint = v8;

  v10 = [(UIView *)v4 leadingAnchor];
  v11 = [(AVTStickerRecentsOverlayView *)self contentView];
  v12 = [v11 leadingAnchor];
  [v3 horizontalEdgePadding];
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  containerLeadingConstraint = self->_containerLeadingConstraint;
  self->_containerLeadingConstraint = v13;

  id v15 = [(UIView *)v4 trailingAnchor];
  id v16 = [(AVTStickerRecentsOverlayView *)self contentView];
  id v17 = [v16 trailingAnchor];
  [v3 horizontalEdgePadding];
  v19 = [v15 constraintEqualToAnchor:v17 constant:-v18];
  containerTrailingConstraint = self->_containerTrailingConstraint;
  self->_containerTrailingConstraint = v19;

  uint64_t v21 = [(UIImageView *)self->_imageView heightAnchor];
  [v3 imageHeight];
  objc_msgSend(v21, "constraintEqualToConstant:");
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageHeightConstraint = self->_imageHeightConstraint;
  self->_imageHeightConstraint = v22;

  v24 = [(UILabel *)self->_titleLabel topAnchor];
  id v25 = [(UIImageView *)self->_imageView bottomAnchor];
  [v3 imageToTitlePadding];
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25);
  double v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageToTitleConstraint = self->_imageToTitleConstraint;
  self->_imageToTitleConstraint = v26;

  double v28 = [(UILabel *)self->_subtitleLabel topAnchor];
  double v29 = [(UILabel *)self->_titleLabel bottomAnchor];
  v108 = v3;
  [v3 titleToSubtitlePadding];
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
  uint64_t v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleToSubtitleConstraint = self->_titleToSubtitleConstraint;
  self->_titleToSubtitleConstraint = v30;

  v32 = self->_containerLeadingConstraint;
  v110 = (void *)MEMORY[0x263EFF980];
  v114[0] = self->_containerTopConstraint;
  v114[1] = v32;
  v114[2] = self->_containerTrailingConstraint;
  v104 = [(UIView *)v4 bottomAnchor];
  v106 = [(AVTStickerRecentsOverlayView *)self contentView];
  v102 = [v106 bottomAnchor];
  v100 = [v104 constraintLessThanOrEqualToAnchor:v102];
  v114[3] = v100;
  v96 = [(UIView *)v4 centerYAnchor];
  v98 = [(AVTStickerRecentsOverlayView *)self contentView];
  v94 = [v98 centerYAnchor];
  v92 = [v96 constraintEqualToAnchor:v94];
  uint64_t v33 = self->_imageHeightConstraint;
  v114[4] = v92;
  v114[5] = v33;
  v90 = [(UIImageView *)self->_imageView topAnchor];
  v88 = [(UIView *)v4 topAnchor];
  v86 = [v90 constraintEqualToAnchor:v88];
  v114[6] = v86;
  v84 = [(UIImageView *)self->_imageView centerXAnchor];
  v82 = [(UIView *)v4 centerXAnchor];
  v80 = [v84 constraintEqualToAnchor:v82];
  v114[7] = v80;
  v78 = [(UIImageView *)self->_imageView widthAnchor];
  v76 = [(UIView *)v4 widthAnchor];
  v74 = [v78 constraintEqualToAnchor:v76];
  v34 = self->_imageToTitleConstraint;
  v114[8] = v74;
  v114[9] = v34;
  v72 = [(UILabel *)self->_titleLabel leadingAnchor];
  v70 = [(UIView *)v4 leadingAnchor];
  uint64_t v69 = [v72 constraintEqualToAnchor:v70];
  v114[10] = v69;
  v68 = [(UILabel *)self->_titleLabel trailingAnchor];
  v67 = [(UIView *)v4 trailingAnchor];
  uint64_t v66 = [v68 constraintEqualToAnchor:v67];
  v114[11] = v66;
  uint64_t v35 = [(UILabel *)self->_titleLabel heightAnchor];
  v36 = [v35 constraintEqualToConstant:30.0];
  v37 = self->_titleToSubtitleConstraint;
  v114[12] = v36;
  v114[13] = v37;
  v38 = [(UILabel *)self->_subtitleLabel leadingAnchor];
  uint64_t v39 = [(UIView *)v4 leadingAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  v114[14] = v40;
  v41 = [(UILabel *)self->_subtitleLabel trailingAnchor];
  v112 = v4;
  v42 = [(UIView *)v4 trailingAnchor];
  double v43 = [v41 constraintEqualToAnchor:v42];
  v114[15] = v43;
  double v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:16];
  v111 = [v110 arrayWithArray:v44];

  subtitleLabel = self->_subtitleLabel;
  if (self->_continueButton)
  {
    v46 = [(UILabel *)subtitleLabel heightAnchor];
    v47 = [v46 constraintEqualToConstant:0.0];
    hideSubtitleConstraint = self->_hideSubtitleConstraint;
    self->_hideSubtitleConstraint = v47;

    [(NSLayoutConstraint *)self->_hideSubtitleConstraint setActive:0];
    v49 = [(UIButton *)self->_continueButton topAnchor];
    v50 = [(UILabel *)self->_subtitleLabel bottomAnchor];
    [v108 subtitleToButtonPadding];
    v51 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", v50);

    LODWORD(v52) = 1144750080;
    v75 = v51;
    [v51 setPriority:v52];
    v107 = [(UIButton *)self->_closeButton widthAnchor];
    v105 = [v107 constraintEqualToConstant:30.0];
    v113[0] = v105;
    v103 = [(UIButton *)self->_closeButton heightAnchor];
    v101 = [v103 constraintEqualToConstant:30.0];
    v113[1] = v101;
    v97 = [(UIButton *)self->_closeButton trailingAnchor];
    v99 = [(AVTStickerRecentsOverlayView *)self contentView];
    v95 = [v99 trailingAnchor];
    v93 = [v97 constraintEqualToAnchor:v95];
    v113[2] = v93;
    v89 = [(UIButton *)self->_closeButton topAnchor];
    v91 = [(AVTStickerRecentsOverlayView *)self contentView];
    v87 = [v91 topAnchor];
    v85 = [v89 constraintEqualToAnchor:v87];
    v113[3] = v85;
    v113[4] = v51;
    v83 = [(UIButton *)self->_continueButton topAnchor];
    v109 = [(UILabel *)self->_subtitleLabel bottomAnchor];
    v81 = [v83 constraintGreaterThanOrEqualToAnchor:v109];
    v113[5] = v81;
    v79 = [(UIButton *)self->_continueButton leadingAnchor];
    v77 = [(UIView *)v112 leadingAnchor];
    objc_super v73 = [v79 constraintEqualToAnchor:v77];
    v113[6] = v73;
    uint64_t v71 = [(UIButton *)self->_continueButton trailingAnchor];
    v53 = [(UIView *)v112 trailingAnchor];
    v54 = [v71 constraintEqualToAnchor:v53];
    v113[7] = v54;
    v55 = [(UIButton *)self->_continueButton heightAnchor];
    v56 = [(UIImageView *)self->_imageView heightAnchor];
    v57 = [v55 constraintEqualToAnchor:v56];
    v113[8] = v57;
    v58 = [(UIButton *)self->_continueButton bottomAnchor];
    v59 = [(UIView *)v112 bottomAnchor];
    v60 = [v58 constraintLessThanOrEqualToAnchor:v59];
    v113[9] = v60;
    v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:10];
    [v111 addObjectsFromArray:v61];

    uint64_t v62 = v75;
  }
  else
  {
    v63 = [(UILabel *)subtitleLabel bottomAnchor];
    uint64_t v64 = [(UIView *)v112 bottomAnchor];
    uint64_t v62 = [v63 constraintLessThanOrEqualToAnchor:v64];

    LODWORD(v65) = 1148846080;
    [v62 setPriority:v65];
    [v111 addObject:v62];
  }

  [MEMORY[0x263F08938] activateConstraints:v111];
  [(AVTStickerRecentsOverlayView *)self setLayoutConstraints:v111];
}

- (void)updateConstraints
{
  v7.receiver = self;
  v7.super_class = (Class)AVTStickerRecentsOverlayView;
  [(AVTStickerRecentsOverlayView *)&v7 updateConstraints];
  double v3 = [(AVTStickerRecentsOverlayView *)self currentLayout];
  [v3 imageToTopPadding];
  -[NSLayoutConstraint setConstant:](self->_containerTopConstraint, "setConstant:");
  [v3 horizontalEdgePadding];
  -[NSLayoutConstraint setConstant:](self->_containerLeadingConstraint, "setConstant:");
  [v3 horizontalEdgePadding];
  [(NSLayoutConstraint *)self->_containerTrailingConstraint setConstant:-v4];
  [v3 imageHeight];
  -[NSLayoutConstraint setConstant:](self->_imageHeightConstraint, "setConstant:");
  [v3 imageToTitlePadding];
  -[NSLayoutConstraint setConstant:](self->_imageToTitleConstraint, "setConstant:");
  [v3 titleToSubtitlePadding];
  -[NSLayoutConstraint setConstant:](self->_titleToSubtitleConstraint, "setConstant:");
  if (self->_hideSubtitleConstraint)
  {
    v5 = [(AVTStickerRecentsOverlayView *)self contentView];
    [v5 bounds];
    [(NSLayoutConstraint *)self->_hideSubtitleConstraint setActive:v6 < 130.0];
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AVTStickerRecentsOverlayView;
  [(AVTStickerRecentsOverlayView *)&v6 layoutSubviews];
  double v3 = [(AVTStickerRecentsOverlayView *)self appropriateLayout];
  [(AVTStickerRecentsOverlayView *)self bounds];
  if (v4 > 0.0)
  {
    v5 = [(AVTStickerRecentsOverlayView *)self currentLayout];

    if (v3 != v5)
    {
      [(AVTStickerRecentsOverlayView *)self setCurrentLayout:v3];
      [(AVTStickerRecentsOverlayView *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)dismissAnimatedWithDuration:(double)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__AVTStickerRecentsOverlayView_dismissAnimatedWithDuration___block_invoke;
  v3[3] = &unk_263FF03D8;
  v3[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:0 completion:a3];
}

uint64_t __60__AVTStickerRecentsOverlayView_dismissAnimatedWithDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (AVTStickerRecentsOverlayDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTStickerRecentsOverlayDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)centeredContainerView
{
  return self->_centeredContainerView;
}

- (void)setCenteredContainerView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (AVTStickerRecentsOverlayViewLayout)portraitLayout
{
  return self->_portraitLayout;
}

- (void)setPortraitLayout:(id)a3
{
}

- (AVTStickerRecentsOverlayViewLayout)landscapeLayout
{
  return self->_landscapeLayout;
}

- (void)setLandscapeLayout:(id)a3
{
}

- (AVTStickerRecentsOverlayViewLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setCurrentLayout:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (NSLayoutConstraint)containerTopConstraint
{
  return self->_containerTopConstraint;
}

- (void)setContainerTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)containerLeadingConstraint
{
  return self->_containerLeadingConstraint;
}

- (void)setContainerLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)containerTrailingConstraint
{
  return self->_containerTrailingConstraint;
}

- (void)setContainerTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageToTitleConstraint
{
  return self->_imageToTitleConstraint;
}

- (void)setImageToTitleConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleToSubtitleConstraint
{
  return self->_titleToSubtitleConstraint;
}

- (void)setTitleToSubtitleConstraint:(id)a3
{
}

- (NSLayoutConstraint)hideSubtitleConstraint
{
  return self->_hideSubtitleConstraint;
}

- (void)setHideSubtitleConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideSubtitleConstraint, 0);
  objc_storeStrong((id *)&self->_titleToSubtitleConstraint, 0);
  objc_storeStrong((id *)&self->_imageToTitleConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_containerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_containerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_containerTopConstraint, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_landscapeLayout, 0);
  objc_storeStrong((id *)&self->_portraitLayout, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_centeredContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
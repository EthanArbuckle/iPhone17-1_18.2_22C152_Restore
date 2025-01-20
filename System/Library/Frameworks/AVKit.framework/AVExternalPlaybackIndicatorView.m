@interface AVExternalPlaybackIndicatorView
- (id)_labelWithFontSize:(double)a1;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setTitleString:(id)a3 subtitleString:(id)a4;
@end

@implementation AVExternalPlaybackIndicatorView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)setTitleString:(id)a3 subtitleString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_titleString, a3);
  objc_storeStrong((id *)&self->_subtitleString, a4);
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;
  self->_shouldShowIndicator = v10;
  if (!v9)
  {
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      if (self->_subtitleLabel)
      {
        [(UILabel *)titleLabel setText:v7];
        [(UILabel *)self->_subtitleLabel setText:v8];
      }
    }
  }
  if (self->_containerView)
  {
    if (self->_shouldShowIndicator) {
      double v12 = 1.0;
    }
    else {
      double v12 = 0.0;
    }
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__AVExternalPlaybackIndicatorView_setTitleString_subtitleString___block_invoke;
    v14[3] = &unk_1E5FC41D0;
    objc_copyWeak(v15, &location);
    v15[1] = *(id *)&v12;
    [v13 animateWithDuration:v14 animations:0.2];
    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
}

void __65__AVExternalPlaybackIndicatorView_setTitleString_subtitleString___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[54] setAlpha:*(double *)(a1 + 40)];
    WeakRetained = v3;
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)AVExternalPlaybackIndicatorView;
  [(AVExternalPlaybackIndicatorView *)&v14 layoutSubviews];
  v3 = [(AVExternalPlaybackIndicatorView *)self layoutMarginsGuide];
  [v3 layoutFrame];
  double Height = CGRectGetHeight(v15);

  v5 = [(AVExternalPlaybackIndicatorView *)self layoutMarginsGuide];
  [v5 layoutFrame];
  double Width = CGRectGetWidth(v16);

  [(UILabel *)self->_titleLabel frame];
  double v7 = CGRectGetHeight(v17);
  [(UILabel *)self->_subtitleLabel frame];
  double v8 = v7 + CGRectGetHeight(v18) + 3.0 + 16.0;
  [(UILabel *)self->_subtitleLabel frame];
  double v9 = CGRectGetHeight(v19);
  BOOL v10 = Width < 86.0 || Height - v8 < 56.0;
  if (v10 != [(UIImageView *)self->_imageView isHidden]) {
    [(UIImageView *)self->_imageView setHidden:v10];
  }
  double v11 = v9 + 16.0;
  BOOL v12 = Width < 64.0 || Height - v8 < 0.0;
  if (v12 != [(UILabel *)self->_titleLabel isHidden]) {
    [(UILabel *)self->_titleLabel setHidden:v12];
  }
  BOOL v13 = Width < 86.0 || Height - v11 < 0.0;
  if (v13 != [(UILabel *)self->_subtitleLabel isHidden]) {
    [(UILabel *)self->_subtitleLabel setHidden:v13];
  }
}

- (void)didMoveToWindow
{
  v80[15] = *MEMORY[0x1E4F143B8];
  v79.receiver = self;
  v79.super_class = (Class)AVExternalPlaybackIndicatorView;
  [(AVExternalPlaybackIndicatorView *)&v79 didMoveToWindow];
  if (self && !self->_containerView)
  {
    v3 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorBackgroundColor");
    [(AVExternalPlaybackIndicatorView *)self setBackgroundColor:v3];

    v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = (void *)MEMORY[0x1E4FB1830];
    v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:110.0];
    double v7 = [v5 configurationWithFont:v6];
    v78 = [v4 systemImageNamed:@"tv" withConfiguration:v7];

    double v8 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v78];
    imageView = self->_imageView;
    self->_imageView = v8;

    LODWORD(v10) = 1132068864;
    [(UIImageView *)self->_imageView setContentCompressionResistancePriority:1 forAxis:v10];
    LODWORD(v11) = *(_DWORD *)"";
    [(UIImageView *)self->_imageView setContentHuggingPriority:1 forAxis:v11];
    [(UIImageView *)self->_imageView setContentMode:1];
    BOOL v12 = self->_imageView;
    BOOL v13 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorForegroundColor");
    [(UIImageView *)v12 setTintColor:v13];

    [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    -[AVExternalPlaybackIndicatorView _labelWithFontSize:](17.0);
    objc_super v14 = (UILabel *)objc_claimAutoreleasedReturnValue();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v14;

    [(UILabel *)self->_titleLabel setText:self->_titleString];
    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    -[AVExternalPlaybackIndicatorView _labelWithFontSize:](13.0);
    CGRect v16 = (UILabel *)objc_claimAutoreleasedReturnValue();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v16;

    [(UILabel *)self->_subtitleLabel setNumberOfLines:2];
    [(UILabel *)self->_subtitleLabel setText:self->_subtitleString];
    [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    CGRect v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = self->_containerView;
    self->_containerView = v18;

    double v20 = 1.0;
    if (!self->_shouldShowIndicator) {
      double v20 = 0.0;
    }
    [(UIView *)self->_containerView setAlpha:v20];
    [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_containerView addSubview:self->_imageView];
    [(UIView *)self->_containerView addSubview:self->_titleLabel];
    [(UIView *)self->_containerView addSubview:self->_subtitleLabel];
    [(AVExternalPlaybackIndicatorView *)self addSubview:self->_containerView];
    v77 = [(UIImageView *)self->_imageView topAnchor];
    v76 = [(UIView *)self->_containerView topAnchor];
    LODWORD(v21) = 1148829696;
    v75 = objc_msgSend(v77, "avkit_constraintEqualToAnchor:priority:", v76, v21);
    v80[0] = v75;
    v74 = [(UILabel *)self->_titleLabel topAnchor];
    v73 = [(UIImageView *)self->_imageView bottomAnchor];
    LODWORD(v22) = 1148829696;
    v72 = objc_msgSend(v74, "avkit_constraintEqualToAnchor:priority:", v73, v22);
    v80[1] = v72;
    v71 = [(UILabel *)self->_subtitleLabel topAnchor];
    v70 = [(UILabel *)self->_titleLabel bottomAnchor];
    v69 = [v71 constraintEqualToAnchor:v70 constant:3.0];
    v80[2] = v69;
    v68 = [(UILabel *)self->_subtitleLabel bottomAnchor];
    v67 = [(UIView *)self->_containerView bottomAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v80[3] = v66;
    v65 = [(UIImageView *)self->_imageView widthAnchor];
    v64 = [(UIView *)self->_containerView widthAnchor];
    v63 = [v65 constraintLessThanOrEqualToAnchor:v64];
    v80[4] = v63;
    v62 = [(UILabel *)self->_titleLabel widthAnchor];
    v61 = [(UIView *)self->_containerView widthAnchor];
    v60 = [v62 constraintLessThanOrEqualToAnchor:v61];
    v80[5] = v60;
    v59 = [(UILabel *)self->_subtitleLabel widthAnchor];
    v58 = [(UIView *)self->_containerView widthAnchor];
    v57 = [v59 constraintLessThanOrEqualToAnchor:v58];
    v80[6] = v57;
    v56 = [(UIImageView *)self->_imageView centerXAnchor];
    v55 = [(UIView *)self->_containerView centerXAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v80[7] = v54;
    v53 = [(UILabel *)self->_titleLabel centerXAnchor];
    v52 = [(UIView *)self->_containerView centerXAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v80[8] = v51;
    v50 = [(UILabel *)self->_subtitleLabel centerXAnchor];
    v49 = [(UIView *)self->_containerView centerXAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v80[9] = v48;
    v45 = [(UIImageView *)self->_imageView widthAnchor];
    v44 = [(UIImageView *)self->_imageView heightAnchor];
    v47 = [(UIImageView *)self->_imageView image];
    [v47 size];
    double v24 = v23;
    v43 = [(UIImageView *)self->_imageView image];
    [v43 size];
    v42 = [v45 constraintEqualToAnchor:v44 multiplier:v24 / v25];
    v80[10] = v42;
    v40 = [(UIView *)self->_containerView widthAnchor];
    v41 = [(AVExternalPlaybackIndicatorView *)self layoutMarginsGuide];
    v39 = [v41 widthAnchor];
    v38 = [v40 constraintLessThanOrEqualToAnchor:v39 constant:-16.0];
    v80[11] = v38;
    v36 = [(UIView *)self->_containerView heightAnchor];
    v37 = [(AVExternalPlaybackIndicatorView *)self layoutMarginsGuide];
    v26 = [v37 heightAnchor];
    v27 = [v36 constraintLessThanOrEqualToAnchor:v26 constant:-16.0];
    v80[12] = v27;
    v28 = [(UIView *)self->_containerView centerXAnchor];
    v29 = [(AVExternalPlaybackIndicatorView *)self layoutMarginsGuide];
    v30 = [v29 centerXAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    v80[13] = v31;
    v32 = [(UIView *)self->_containerView centerYAnchor];
    v33 = [(AVExternalPlaybackIndicatorView *)self layoutMarginsGuide];
    v34 = [v33 centerYAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    v80[14] = v35;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:15];

    [MEMORY[0x1E4F28DC8] activateConstraints:v46];
  }
}

- (id)_labelWithFontSize:(double)a1
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  LODWORD(v3) = 1148846080;
  [v2 setContentCompressionResistancePriority:1 forAxis:v3];
  v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:a1];
  [v2 setFont:v4];

  [v2 setLineBreakMode:5];
  [v2 setTextAlignment:1];
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorForegroundColor");
  [v2 setTextColor:v5];

  return v2;
}

@end
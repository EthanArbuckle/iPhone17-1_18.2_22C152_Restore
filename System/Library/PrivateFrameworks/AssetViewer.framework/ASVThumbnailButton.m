@interface ASVThumbnailButton
+ (id)thumbnailButton;
- (NSError)error;
- (UIImage)thumbnail;
- (void)_setupButton;
- (void)_updateSubviewVisibility;
- (void)layoutSubviews;
- (void)setError:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation ASVThumbnailButton

+ (id)thumbnailButton
{
  v2 = AssetViewerLogHandleForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E2840000, v2, OS_LOG_TYPE_DEFAULT, "ARQL thumbnailButton() called", v5, 2u);
  }

  v3 = +[ASVThumbnailButton buttonWithType:0];
  [v3 _setupButton];
  return v3;
}

- (void)_setupButton
{
  v44[9] = *MEMORY[0x1E4F143B8];
  v3 = AssetViewerLogHandleForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2840000, v3, OS_LOG_TYPE_DEFAULT, "ARQL Setting up ASVThumbnailButton", buf, 2u);
  }

  v4 = (ASVLoadingView *)objc_opt_new();
  loadingView = self->_loadingView;
  self->_loadingView = v4;

  v6 = (UIImageView *)objc_opt_new();
  imageView = self->_imageView;
  self->_imageView = v6;

  [(UIImageView *)self->_imageView setContentMode:1];
  v8 = +[ASVBadgeView badgeView];
  badgeView = self->_badgeView;
  self->_badgeView = v8;

  v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [(ASVThumbnailButton *)self setBackgroundColor:v10];

  [(ASVThumbnailButton *)self addSubview:self->_loadingView];
  [(ASVThumbnailButton *)self addSubview:self->_imageView];
  [(ASVThumbnailButton *)self addSubview:self->_badgeView];
  [(ASVLoadingView *)self->_loadingView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ASVBadgeView *)self->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(ASVBadgeView *)self->_badgeView topAnchor];
  v12 = [(ASVThumbnailButton *)self topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  badgeTopConstraint = self->_badgeTopConstraint;
  self->_badgeTopConstraint = v13;

  v15 = [(ASVBadgeView *)self->_badgeView trailingAnchor];
  v16 = [(ASVThumbnailButton *)self trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  badgeTrailingConstraint = self->_badgeTrailingConstraint;
  self->_badgeTrailingConstraint = v17;

  v33 = (void *)MEMORY[0x1E4F28DC8];
  v42 = [(ASVLoadingView *)self->_loadingView centerXAnchor];
  v41 = [(ASVThumbnailButton *)self centerXAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v44[0] = v40;
  v39 = [(ASVLoadingView *)self->_loadingView centerYAnchor];
  v38 = [(ASVThumbnailButton *)self centerYAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v44[1] = v37;
  v36 = [(ASVLoadingView *)self->_loadingView widthAnchor];
  v35 = [(ASVThumbnailButton *)self widthAnchor];
  v34 = [v36 constraintLessThanOrEqualToAnchor:v35];
  v44[2] = v34;
  v32 = [(UIImageView *)self->_imageView leadingAnchor];
  v31 = [(ASVThumbnailButton *)self leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v44[3] = v30;
  v29 = [(UIImageView *)self->_imageView trailingAnchor];
  v19 = [(ASVThumbnailButton *)self trailingAnchor];
  v20 = [v29 constraintEqualToAnchor:v19];
  v44[4] = v20;
  v21 = [(UIImageView *)self->_imageView topAnchor];
  v22 = [(ASVThumbnailButton *)self topAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v44[5] = v23;
  v24 = [(UIImageView *)self->_imageView bottomAnchor];
  v25 = [(ASVThumbnailButton *)self bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v27 = self->_badgeTopConstraint;
  v44[6] = v26;
  v44[7] = v27;
  v44[8] = self->_badgeTrailingConstraint;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:9];
  [v33 activateConstraints:v28];

  [(ASVThumbnailButton *)self _updateSubviewVisibility];
  [(ASVThumbnailButton *)self setAccessibilityIgnoresInvertColors:1];
}

- (UIImage)thumbnail
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setThumbnail:(id)a3
{
  [(UIImageView *)self->_imageView setImage:a3];
  [(ASVThumbnailButton *)self _updateSubviewVisibility];
}

- (void)setError:(id)a3
{
  [(ASVLoadingView *)self->_loadingView setLoadingError:a3];
  [(ASVThumbnailButton *)self _updateSubviewVisibility];
}

- (NSError)error
{
  return [(ASVLoadingView *)self->_loadingView loadingError];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASVThumbnailButton;
  -[ASVThumbnailButton setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
  {
    v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.7 alpha:1.0];
    uint64_t v6 = 3;
  }
  else
  {
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v6 = 0;
  }
  [(ASVThumbnailButton *)self setBackgroundColor:v5];

  [(ASVBadgeView *)self->_badgeView setHighlighted:v3];
  [(UIImageView *)self->_imageView setDrawMode:v6];
}

- (void)_updateSubviewVisibility
{
  BOOL v3 = [(ASVThumbnailButton *)self thumbnail];
  double v4 = 0.0;
  if (v3)
  {
    v5 = [(ASVThumbnailButton *)self error];
    if (v5) {
      double v4 = 0.0;
    }
    else {
      double v4 = 1.0;
    }
  }
  uint64_t v6 = [(ASVThumbnailButton *)self thumbnail];

  [(UIImageView *)self->_imageView setAlpha:v4];
  double v7 = 1.0;
  if (v6) {
    double v7 = 0.0;
  }
  loadingView = self->_loadingView;
  [(ASVLoadingView *)loadingView setAlpha:v7];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)ASVThumbnailButton;
  [(ASVThumbnailButton *)&v16 layoutSubviews];
  [(ASVBadgeView *)self->_badgeView thumbnailSize];
  double v4 = v3;
  double v6 = v5;
  [(ASVThumbnailButton *)self bounds];
  if (v4 != v8 || v6 != v7)
  {
    [(ASVThumbnailButton *)self bounds];
    -[ASVBadgeView setThumbnailSize:](self->_badgeView, "setThumbnailSize:", v10, v11);
    v12 = [(ASVBadgeView *)self->_badgeView badgeDescription];
    [v12 badgeOffset];
    [(NSLayoutConstraint *)self->_badgeTopConstraint setConstant:v13];

    v14 = [(ASVBadgeView *)self->_badgeView badgeDescription];
    [v14 badgeOffset];
    [(NSLayoutConstraint *)self->_badgeTrailingConstraint setConstant:-v15];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_badgeTopConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end
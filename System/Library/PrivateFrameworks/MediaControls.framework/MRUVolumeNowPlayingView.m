@interface MRUVolumeNowPlayingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeNowPlayingView)initWithFrame:(CGRect)a3;
- (NSString)title;
- (UIImage)icon;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (int64_t)axis;
- (void)layoutSubviews;
- (void)setAxis:(int64_t)a3;
- (void)setIcon:(id)a3;
- (void)setImageView:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateVisualStyling;
@end

@implementation MRUVolumeNowPlayingView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = 20.0;
  v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_volumeButtonSubtitleFont");
  [v7 lineHeight];
  UICeilToViewScale();
  double v9 = v8;

  int64_t axis = self->_axis;
  if (axis == 1)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height - 8.0);
    double v16 = MRUSizeCeilToViewScale(self);
    if (v16 < 20.0) {
      double v16 = 20.0;
    }
    double v6 = v9 + 20.0 + 8.0;
  }
  else if (axis)
  {
    double v16 = 20.0;
  }
  else
  {
    NSUInteger v11 = [(NSString *)self->_title length];
    double v12 = 8.0;
    double v13 = 0.0;
    if (v11) {
      double v13 = 8.0;
    }
    double v14 = width - v13;
    if (!v11) {
      double v12 = -0.0;
    }
    double v15 = v12 + 20.0;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v14, height);
    double v16 = v15 + MRUSizeCeilToViewScale(self);
    if (v9 >= 20.0) {
      double v6 = v9;
    }
  }
  if (v16 >= width) {
    double v16 = width;
  }
  if (v6 >= height) {
    double v17 = height;
  }
  else {
    double v17 = v6;
  }
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)setAxis:(int64_t)a3
{
  self->_int64_t axis = a3;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
  id v5 = a3;
  [(UIImageView *)self->_imageView setImage:v5];

  [(MRUVolumeNowPlayingView *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];

  [(MRUVolumeNowPlayingView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)MRUVolumeNowPlayingView;
  [(MRUVolumeNowPlayingView *)&v37 layoutSubviews];
  [(MRUVolumeNowPlayingView *)self bounds];
  int64_t axis = self->_axis;
  if (axis == 1)
  {
    UIRectCenteredXInRect();
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
    v40.origin.x = v22;
    v40.origin.y = v24;
    v40.size.double width = v26;
    v40.size.double height = v28;
    CGRectGetHeight(v40);
    UIRectInset();
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    p_titleLabel = &self->_titleLabel;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v33, v35);
    MRUSizeCeilToViewScale(self);
    v41.origin.x = v30;
    v41.origin.y = v32;
    v41.size.double width = v34;
    v41.size.double height = v36;
    CGRectGetMinY(v41);
    UIRectCenteredYInRect();
  }
  else
  {
    if (axis) {
      return;
    }
    UIRectCenteredYInRect();
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(MRUVolumeNowPlayingView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
    v38.origin.x = v5;
    v38.origin.y = v7;
    v38.size.double width = v9;
    v38.size.double height = v11;
    CGRectGetWidth(v38);
    UIRectInset();
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    p_titleLabel = &self->_titleLabel;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v16, v18);
    MRUSizeCeilToViewScale(self);
    v39.origin.x = v13;
    v39.origin.y = v15;
    v39.size.double width = v17;
    v39.size.double height = v19;
    CGRectGetMinX(v39);
    UIRectCenteredYInRect();
    [(MRUVolumeNowPlayingView *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  }
  -[UILabel setFrame:](*p_titleLabel, "setFrame:");
}

- (MRUVolumeNowPlayingView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MRUVolumeNowPlayingView;
  v3 = -[MRUVolumeNowPlayingView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(UIImageView *)v3->_imageView setUserInteractionEnabled:0];
    [(MRUVolumeNowPlayingView *)v3 addSubview:v3->_imageView];
    double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v6;

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel controlCenterApplyPrimaryContentShadow];
    [(MRUVolumeNowPlayingView *)v3 addSubview:v3->_titleLabel];
    double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUVolumeNowPlayingView *)v3 updateContentSizeCategory];
  }
  return v3;
}

- (void)setStylingProvider:(id)a3
{
  CGFloat v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    CGFloat v7 = v5;
    [(MRUVisualStylingProvider *)stylingProvider removeObserver:self];
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
    [(MRUVolumeNowPlayingView *)self updateVisualStyling];
    CGFloat v5 = v7;
  }
}

- (void)updateVisualStyling
{
}

- (void)updateContentSizeCategory
{
  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_volumeButtonSubtitleFont");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_titleLabel setFont:v3];
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)axis
{
  return self->_axis;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

@end
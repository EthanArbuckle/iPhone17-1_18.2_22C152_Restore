@interface CPUIListSectionHeaderView
- (BOOL)showsButton;
- (CGSize)imageSize;
- (CPUIListSectionHeaderView)initWithReuseIdentifier:(id)a3;
- (CPUIMediaButton)mediaButton;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)image;
- (UIImageView)artworkImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (id)artworkImage;
- (void)configureButton:(id)a3;
- (void)layoutSubviews;
- (void)setArtworkImageView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setMediaButton:(id)a3;
- (void)setShowsButton:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTemplateImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CPUIListSectionHeaderView

- (CPUIListSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CPUIListSectionHeaderView;
  v3 = [(CPUIListSectionHeaderView *)&v28 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82828]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    artworkImageView = v3->_artworkImageView;
    v3->_artworkImageView = (UIImageView *)v9;

    [(UIImageView *)v3->_artworkImageView setContentMode:1];
    v11 = [(CPUIListSectionHeaderView *)v3 contentView];
    [v11 addSubview:v3->_artworkImageView];

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v12;

    v14 = [MEMORY[0x263F81708] boldSystemFontOfSize:16.0];
    [(UILabel *)v3->_titleLabel setFont:v14];

    v15 = [MEMORY[0x263F825C8] _carSystemPrimaryColor];
    [(UILabel *)v3->_titleLabel setTextColor:v15];

    v16 = [MEMORY[0x263F825C8] _carSystemFocusPrimaryColor];
    [(UILabel *)v3->_titleLabel setHighlightedTextColor:v16];

    v17 = [(CPUIListSectionHeaderView *)v3 contentView];
    [v17 addSubview:v3->_titleLabel];

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v18;

    v20 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    [(UILabel *)v3->_subtitleLabel setFont:v20];

    v21 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
    [(UILabel *)v3->_subtitleLabel setTextColor:v21];

    v22 = [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
    [(UILabel *)v3->_subtitleLabel setHighlightedTextColor:v22];

    v23 = [(CPUIListSectionHeaderView *)v3 contentView];
    [v23 addSubview:v3->_subtitleLabel];

    [(CPUIListSectionHeaderView *)v3 setShowsButton:0];
    uint64_t v24 = +[CPUIMediaButton buttonWithType:0];
    mediaButton = v3->_mediaButton;
    v3->_mediaButton = (CPUIMediaButton *)v24;

    v26 = [(CPUIListSectionHeaderView *)v3 contentView];
    [v26 addSubview:v3->_mediaButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  *(void *)&rect.size.height = self;
  v63 = CPUIListSectionHeaderView;
  [(CGFloat *)(objc_super *)&rect.size.height layoutSubviews];
  v3 = [(CPUIListSectionHeaderView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  artworkImageView = self->_artworkImageView;
  MPURectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIImageView setFrame:](artworkImageView, "setFrame:");
  v13 = self->_artworkImageView;
  v14 = [(UIImageView *)v13 image];
  [(UIImageView *)v13 setHidden:v14 == 0];

  BOOL v15 = [(CPUIListSectionHeaderView *)self showsButton];
  v16 = (double *)MEMORY[0x263F001B0];
  if (v15) {
    -[CPUIMediaButton sizeThatFits:](self->_mediaButton, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
  UIRectCenteredYInRect();
  CGFloat v17 = v5;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  v64.origin.CGFloat x = v17;
  v64.origin.CGFloat y = v7;
  v64.size.width = v9;
  v64.size.height = v11;
  rect.size.width = v11;
  double Width = CGRectGetWidth(v64);
  v65.origin.CGFloat x = v19;
  v65.origin.CGFloat y = v21;
  v65.size.width = v23;
  v65.size.height = v25;
  double v27 = Width - CGRectGetWidth(v65);
  CGFloat v28 = rect.size.width;
  MPURectByApplyingUserInterfaceLayoutDirectionInRect();
  -[CPUIMediaButton setFrame:](self->_mediaButton, "setFrame:");
  [(CPUIMediaButton *)self->_mediaButton setHidden:[(CPUIListSectionHeaderView *)self showsButton] ^ 1];
  v29 = [(UIImageView *)self->_artworkImageView image];

  rect.origin.CGFloat y = v17;
  if (v29)
  {
    v66.origin.CGFloat x = 0.0;
    v66.origin.CGFloat y = 4.0;
    v66.size.width = 36.0;
    v66.size.height = 36.0;
    CGFloat MaxX = CGRectGetMaxX(v66);
    v67.size.width = v9;
    double v59 = MaxX + 9.0;
    v67.origin.CGFloat x = v17;
    v67.origin.CGFloat y = v7;
    v67.size.height = rect.size.width;
    CGFloat MinY = CGRectGetMinY(v67);
    v68.origin.CGFloat x = v27;
    v68.origin.CGFloat y = v21;
    v68.size.width = v23;
    v68.size.height = v25;
    double MinX = CGRectGetMinX(v68);
    v69.origin.CGFloat x = 0.0;
    v69.origin.CGFloat y = 4.0;
    v69.size.width = 36.0;
    v69.size.height = 36.0;
    CGFloat v28 = rect.size.width;
    CGFloat v32 = CGRectGetMaxX(v69);
    CGFloat v33 = v7;
    double v34 = MinX - v32 + -18.0;
  }
  else
  {
    v70.origin.CGFloat x = v17;
    v70.origin.CGFloat y = v7;
    v70.size.width = v9;
    v70.size.height = rect.size.width;
    CGFloat MinY = CGRectGetMinY(v70);
    v71.origin.CGFloat x = v27;
    v71.origin.CGFloat y = v21;
    v71.size.width = v23;
    v71.size.height = v25;
    CGFloat v35 = CGRectGetMinX(v71);
    CGFloat v33 = v7;
    double v34 = v35 + -9.0;
    double v59 = 0.0;
  }
  CGFloat y = rect.origin.y;
  CGFloat v37 = v9;
  CGFloat v38 = v28;
  CGFloat Height = CGRectGetHeight(*(CGRect *)(&v33 - 1));
  v72.origin.CGFloat x = v59;
  v72.origin.CGFloat y = MinY;
  v72.size.width = v34;
  v72.size.height = Height;
  rect.origin.CGFloat x = CGRectGetMinX(v72);
  double v40 = *v16;
  double v41 = v16[1];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", *v16, v41);
  v73.size.width = v42;
  v73.size.height = v43;
  CGFloat v61 = v43;
  v73.origin.CGFloat y = 0.0;
  v73.origin.CGFloat x = rect.origin.x;
  double v44 = CGRectGetWidth(v73);
  v74.origin.CGFloat x = v59;
  v74.origin.CGFloat y = MinY;
  v74.size.width = v34;
  v74.size.height = Height;
  double v45 = CGRectGetWidth(v74);
  if (v44 >= v45) {
    CGFloat v46 = v45;
  }
  else {
    CGFloat v46 = v44;
  }
  v75.origin.CGFloat x = v59;
  v75.origin.CGFloat y = MinY;
  v75.size.width = v34;
  v75.size.height = Height;
  CGFloat v47 = CGRectGetMinX(v75);
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v40, v41);
  v76.size.width = v48;
  v76.size.height = v49;
  v76.origin.CGFloat y = 0.0;
  v76.origin.CGFloat x = v47;
  CGFloat v50 = v47;
  CGFloat v51 = v76.size.height;
  double v52 = CGRectGetWidth(v76);
  v77.origin.CGFloat x = v59;
  v77.origin.CGFloat y = MinY;
  v77.size.width = v34;
  v77.size.height = Height;
  double v53 = CGRectGetWidth(v77);
  if (v52 >= v53) {
    CGFloat v54 = v53;
  }
  else {
    CGFloat v54 = v52;
  }
  v78.origin.CGFloat y = 0.0;
  v78.origin.CGFloat x = rect.origin.x;
  v78.size.width = v46;
  v78.size.height = v61;
  CGRectGetHeight(v78);
  v79.origin.CGFloat y = 0.0;
  v79.origin.CGFloat x = v50;
  v79.size.width = v54;
  v79.size.height = v51;
  CGRectGetHeight(v79);
  UIRectCenteredYInRect();
  CGFloat x = v80.origin.x;
  CGFloat v56 = v80.origin.y;
  CGFloat v57 = v80.size.width;
  CGFloat v58 = v80.size.height;
  CGRectGetMinY(v80);
  v81.origin.CGFloat x = x;
  v81.origin.CGFloat y = v56;
  v81.size.width = v57;
  v81.size.height = v58;
  CGRectGetMaxY(v81);
  v82.origin.CGFloat y = 0.0;
  v82.origin.CGFloat x = v50;
  v82.size.width = v54;
  v82.size.height = v51;
  CGRectGetHeight(v82);
  MPURectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  MPURectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
}

- (id)artworkImage
{
  return [(UIImageView *)self->_artworkImageView image];
}

- (void)setImage:(id)a3
{
  id v8 = a3;
  id v5 = [(CPUIListSectionHeaderView *)self artworkImage];

  if (v5 != v8)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(UIImageView *)self->_artworkImageView setImage:v8];
    [(UIImageView *)self->_artworkImageView setTintColor:0];
    [(UIImageView *)self->_artworkImageView setClipsToBounds:1];
    uint64_t v6 = [v8 renderingMode];
    double v7 = 3.0;
    if (v6 == 2) {
      double v7 = 0.0;
    }
    [(UIImageView *)self->_artworkImageView _setContinuousCornerRadius:v7];
    [(CPUIListSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setTemplateImage:(id)a3
{
  [(CPUIListSectionHeaderView *)self setImage:a3];
  id v4 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  [(UIImageView *)self->_artworkImageView setTintColor:v4];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  id v4 = [(CPUIListSectionHeaderView *)self title];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_titleLabel setText:v6];
  }
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
  id v6 = a3;
  id v4 = [(CPUIListSectionHeaderView *)self subtitle];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_subtitleLabel setText:v6];
  }
}

- (void)configureButton:(id)a3
{
  if (a3) {
    (*((void (**)(id, CPUIMediaButton *))a3 + 2))(a3, self->_mediaButton);
  }
  id v4 = [(CPUIMediaButton *)self->_mediaButton currentImage];
  [(CPUIListSectionHeaderView *)self setShowsButton:v4 != 0];

  mediaButton = self->_mediaButton;
  LODWORD(v6) = -1097229926;
  [(CPUIMediaButton *)mediaButton setCharge:v6];
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)artworkImageView
{
  return self->_artworkImageView;
}

- (void)setArtworkImageView:(id)a3
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

- (CPUIMediaButton)mediaButton
{
  return self->_mediaButton;
}

- (void)setMediaButton:(id)a3
{
}

- (BOOL)showsButton
{
  return self->_showsButton;
}

- (void)setShowsButton:(BOOL)a3
{
  self->_showsButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
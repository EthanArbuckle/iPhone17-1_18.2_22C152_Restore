@interface _CertInfoTrustSummaryHeaderCell
- (BOOL)isTrusted;
- (NSString)trustSubtitle;
- (NSString)trustTitle;
- (_CertInfoActionButton)actionButton;
- (_CertInfoTrustSummaryHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)rowHeight;
- (id)_subtitleLabel;
- (id)_titleLabel;
- (id)_trustedLabel;
- (void)_layoutSubviewsWithActionButtonSize:(CGSize)a3;
- (void)layoutSubviews;
- (void)setActionButtonTitle:(id)a3 destructive:(BOOL)a4 animated:(BOOL)a5;
- (void)setExpired:(BOOL)a3;
- (void)setTrustSubtitle:(id)a3;
- (void)setTrustTitle:(id)a3;
- (void)setTrusted:(BOOL)a3;
@end

@implementation _CertInfoTrustSummaryHeaderCell

- (_CertInfoTrustSummaryHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)_CertInfoTrustSummaryHeaderCell;
  v4 = [(_CertInfoTrustSummaryHeaderCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(_CertInfoTrustSummaryHeaderCell *)v4 imageView];
    v7 = [MEMORY[0x263F1C920] mainScreen];
    [v7 scale];
    double v9 = v8;

    v10 = (void *)MEMORY[0x263F1C6B0];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v10 imageNamed:@"profile-icon" inBundle:v11];
    v13 = [v12 _applicationIconImageForFormat:2 precomposed:1 scale:v9];

    [v6 setImage:v13];
    [v6 sizeToFit];
    [(_CertInfoTrustSummaryHeaderCell *)v5 setAutoresizesSubviews:0];
  }
  return v5;
}

- (_CertInfoActionButton)actionButton
{
  actionButton = self->_actionButton;
  if (!actionButton)
  {
    v4 = [[_CertInfoActionButton alloc] initWithTitle:0 isDestructive:0];
    v5 = self->_actionButton;
    self->_actionButton = v4;

    [(_CertInfoActionButton *)self->_actionButton setHidden:1];
    v6 = [(_CertInfoTrustSummaryHeaderCell *)self contentView];
    [v6 addSubview:self->_actionButton];

    actionButton = self->_actionButton;
  }
  return actionButton;
}

- (void)setTrustTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(_CertInfoTrustSummaryHeaderCell *)self _titleLabel];
  [v5 setText:v4];

  [v5 sizeToFit];
}

- (NSString)trustTitle
{
  v2 = [(_CertInfoTrustSummaryHeaderCell *)self _titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTrustSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(_CertInfoTrustSummaryHeaderCell *)self _subtitleLabel];
  [v5 setText:v4];

  [v5 sizeToFit];
}

- (NSString)trustSubtitle
{
  v2 = [(_CertInfoTrustSummaryHeaderCell *)self _subtitleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setExpired:(BOOL)a3
{
  id v5 = [(_CertInfoTrustSummaryHeaderCell *)self _subtitleLabel];
  if (a3) {
    [MEMORY[0x263F1C550] redColor];
  }
  else {
  id v4 = [MEMORY[0x263F1C550] grayColor];
  }
  [v5 setTextColor:v4];
}

- (double)rowHeight
{
  v2 = [(_CertInfoTrustSummaryHeaderCell *)self imageView];
  [v2 frame];
  double v4 = v3 + 5.0 + 6.0;

  return v4;
}

- (void)setActionButtonTitle:(id)a3 destructive:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = [(_CertInfoTrustSummaryHeaderCell *)self actionButton];
  v10 = v9;
  if (v8)
  {
    [v9 setHidden:0];
    [v10 setTitle:v8 destructive:v6];
    if (v5)
    {
      objc_msgSend(v10, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      uint64_t v12 = v11;
      uint64_t v14 = v13;
      [v10 setTitle:&stru_26C9B5AF8 destructive:v6];
      objc_super v15 = (void *)MEMORY[0x263F1CB60];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __77___CertInfoTrustSummaryHeaderCell_setActionButtonTitle_destructive_animated___block_invoke;
      v20[3] = &unk_26432C380;
      v20[4] = self;
      v20[5] = v12;
      v20[6] = v14;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __77___CertInfoTrustSummaryHeaderCell_setActionButtonTitle_destructive_animated___block_invoke_2;
      v16[3] = &unk_26432C3A8;
      id v17 = v10;
      id v18 = v8;
      BOOL v19 = v6;
      [v15 animateWithDuration:v20 animations:v16 completion:0.200000003];
    }
    else
    {
      [(_CertInfoTrustSummaryHeaderCell *)self setNeedsLayout];
    }
  }
  else
  {
    [v9 setHidden:1];
  }
}

- (void)layoutSubviews
{
  double v3 = [(_CertInfoTrustSummaryHeaderCell *)self actionButton];
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v5 = v4;
  double v7 = v6;

  -[_CertInfoTrustSummaryHeaderCell _layoutSubviewsWithActionButtonSize:](self, "_layoutSubviewsWithActionButtonSize:", v5, v7);
}

- (void)_layoutSubviewsWithActionButtonSize:(CGSize)a3
{
  double rect_24 = a3.height;
  double width = a3.width;
  v73.receiver = self;
  v73.super_class = (Class)_CertInfoTrustSummaryHeaderCell;
  [(_CertInfoTrustSummaryHeaderCell *)&v73 layoutSubviews];
  double v4 = [(_CertInfoTrustSummaryHeaderCell *)self imageView];
  double v5 = [(_CertInfoTrustSummaryHeaderCell *)self _trustedLabel];
  double v6 = [(_CertInfoTrustSummaryHeaderCell *)self contentView];
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  [v4 frame];
  double v16 = v15;
  double v18 = v17;
  [v5 frame];
  CGFloat rect = v19;
  CGFloat v71 = v20;
  CGFloat v72 = v21;
  CGFloat v70 = v22;
  objc_msgSend(v4, "setFrame:", 5.0, 5.0, v16, v18);
  v74.origin.x = 5.0;
  v74.origin.y = 5.0;
  v74.size.double width = v16;
  v74.size.height = v18;
  double v23 = CGRectGetMaxX(v74) + 10.0;
  CGFloat v61 = v10;
  CGFloat v62 = v8;
  v75.origin.x = v8;
  v75.origin.y = v10;
  CGFloat v60 = v12;
  v75.size.double width = v12;
  CGFloat v24 = v14;
  v75.size.height = v14;
  double v25 = CGRectGetMaxX(v75) + -20.0;
  v26 = [(_CertInfoTrustSummaryHeaderCell *)self _titleLabel];
  [v26 frame];
  double v28 = v27;
  double v30 = v29;
  v76.origin.x = 5.0;
  v76.origin.y = 5.0;
  v76.size.double width = v16;
  v76.size.height = v18;
  double MinY = CGRectGetMinY(v76);
  v32 = [v26 text];
  double v65 = v25;
  if (v32)
  {
    v33 = [v26 font];
    objc_msgSend(v32, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v33, objc_msgSend(v26, "lineBreakMode"), v25 - v23);
    double v28 = v34;
    double v30 = v35;
  }
  CGFloat rect_8 = v30;
  CGFloat rect_16 = v28;
  objc_msgSend(v26, "setFrame:", v23, MinY, v28, v30);
  v36 = [(_CertInfoTrustSummaryHeaderCell *)self actionButton];
  if ([v36 isHidden])
  {
    v77.origin.x = 5.0;
    v77.origin.y = 5.0;
    v77.size.double width = v16;
    v77.size.height = v18;
    double MaxY = CGRectGetMaxY(v77);
    v78.origin.x = rect;
    v78.origin.y = v71;
    double v38 = v72;
    v78.size.double width = v72;
    double v39 = v70;
    v78.size.height = v70;
    double v40 = MaxY - CGRectGetHeight(v78);
  }
  else
  {
    double v59 = MinY;
    [v36 frame];
    v79.origin.x = v62;
    v79.origin.y = v61;
    v79.size.double width = v60;
    v79.size.height = v24;
    double v41 = CGRectGetWidth(v79) + -5.0 - width;
    v80.origin.x = v62;
    v80.origin.y = v61;
    v80.size.double width = v60;
    v80.size.height = v24;
    double v42 = CGRectGetHeight(v80) + -6.0 - rect_24;
    objc_msgSend(v36, "setFrame:", v41, v42, width, rect_24);
    v81.origin.x = rect;
    v81.origin.y = v71;
    v81.size.double width = v72;
    v81.size.height = v70;
    double v43 = CGRectGetWidth(v81);
    v82.origin.x = v41;
    v82.origin.y = v42;
    v82.size.double width = width;
    v82.size.height = rect_24;
    CGFloat v44 = CGRectGetMinX(v82) - v23 + -5.0;
    v83.origin.x = v41;
    v83.origin.y = v42;
    v83.size.double width = width;
    v83.size.height = rect_24;
    double v63 = CGRectGetMinY(v83);
    if (v43 >= v44)
    {
      v86.origin.x = rect;
      v86.origin.y = v71;
      double v38 = v72;
      v86.size.double width = v72;
      v86.size.height = v70;
      double v40 = v63 - CGRectGetHeight(v86) + -4.0;
    }
    else
    {
      v84.origin.x = v41;
      v84.origin.y = v42;
      v84.size.double width = width;
      v84.size.height = rect_24;
      double Height = CGRectGetHeight(v84);
      v85.origin.x = rect;
      v85.origin.y = v71;
      double v38 = v72;
      v85.size.double width = v72;
      v85.size.height = v70;
      float v46 = (Height - CGRectGetHeight(v85)) * 0.5;
      double v40 = v63 + floorf(v46);
    }
    double v39 = v70;
    double MinY = v59;
  }
  objc_msgSend(v5, "setFrame:", v23, v40, v38, v39);
  v47 = [(_CertInfoTrustSummaryHeaderCell *)self _subtitleLabel];

  [v47 frame];
  double v49 = v48;
  double v51 = v50;
  v87.origin.x = v23;
  v87.origin.y = MinY;
  v87.size.height = rect_8;
  v87.size.double width = rect_16;
  double v52 = CGRectGetMaxY(v87);
  v53 = [v47 text];

  if (v53)
  {
    v88.size.height = v39;
    v88.origin.x = v23;
    v88.origin.y = v40;
    v88.size.double width = v38;
    double v54 = CGRectGetMinY(v88);
    v89.origin.x = v23;
    v89.origin.y = v52;
    v89.size.double width = v49;
    v89.size.height = v51;
    double v55 = v54 - CGRectGetMinY(v89);
    v56 = [v47 font];
    objc_msgSend(v53, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v56, objc_msgSend(v47, "lineBreakMode"), v65 - v23, v55);
    double v49 = v57;
    double v51 = v58;
  }
  objc_msgSend(v47, "setFrame:", v23, v52, v49, v51);
}

- (id)_titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v6 = self->_titleLabel;
    self->_titleLabel = v5;

    [(UILabel *)self->_titleLabel setBackgroundColor:0];
    [(UILabel *)self->_titleLabel setOpaque:0];
    double v7 = self->_titleLabel;
    CGFloat v8 = [MEMORY[0x263F1C658] boldSystemFontOfSize:18.0];
    [(UILabel *)v7 setFont:v8];

    [(UILabel *)self->_titleLabel setNumberOfLines:1];
    double v9 = [(_CertInfoTrustSummaryHeaderCell *)self contentView];
    [v9 addSubview:self->_titleLabel];

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (id)_subtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    double v6 = self->_subtitleLabel;
    self->_subtitleLabel = v5;

    [(UILabel *)self->_subtitleLabel setBackgroundColor:0];
    [(UILabel *)self->_subtitleLabel setOpaque:0];
    double v7 = self->_subtitleLabel;
    CGFloat v8 = [MEMORY[0x263F1C658] systemFontOfSize:14.0];
    [(UILabel *)v7 setFont:v8];

    double v9 = self->_subtitleLabel;
    CGFloat v10 = [MEMORY[0x263F1C550] grayColor];
    [(UILabel *)v9 setTextColor:v10];

    [(UILabel *)self->_subtitleLabel setNumberOfLines:2];
    double v11 = [(_CertInfoTrustSummaryHeaderCell *)self contentView];
    [v11 addSubview:self->_subtitleLabel];

    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

- (id)_trustedLabel
{
  trustedLabel = self->_trustedLabel;
  if (!trustedLabel)
  {
    id v4 = [[_CertInfoGradientLabel alloc] initWithTrusted:self->_trusted];
    double v5 = self->_trustedLabel;
    self->_trustedLabel = v4;

    [(_CertInfoGradientLabel *)self->_trustedLabel sizeToFit];
    double v6 = [(_CertInfoTrustSummaryHeaderCell *)self contentView];
    [v6 addSubview:self->_trustedLabel];

    trustedLabel = self->_trustedLabel;
  }
  return trustedLabel;
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (void)setTrusted:(BOOL)a3
{
  self->_trusted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_notTrustedGradient, 0);
  objc_storeStrong((id *)&self->_certificateImage, 0);
}

@end
@interface CKDetailsLocationStringCell
- (CKDetailsLocationStringCell)initWithFrame:(CGRect)a3;
- (NSString)locationString;
- (UIImageView)locationImageView;
- (UILabel)locationLabel;
- (UIVisualEffectView)blurView;
- (void)layoutSubviews;
- (void)setBlurView:(id)a3;
- (void)setLocationImageView:(id)a3;
- (void)setLocationLabel:(id)a3;
- (void)setLocationString:(id)a3;
@end

@implementation CKDetailsLocationStringCell

- (CKDetailsLocationStringCell)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CKDetailsLocationStringCell;
  v3 = -[CKDetailsLocationStringCell initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(CKDetailsLocationStringCell *)v3 setLocationImageView:v9];

    v10 = [(CKDetailsLocationStringCell *)v3 locationImageView];
    v11 = [MEMORY[0x1E4F42A80] systemImageNamed:@"location.fill"];
    v12 = [MEMORY[0x1E4F42A98] configurationWithScale:1];
    v13 = [v11 imageWithConfiguration:v12];
    [v10 setImage:v13];

    v14 = [(CKDetailsLocationStringCell *)v3 locationImageView];
    v15 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v14 setTintColor:v15];

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v5, v6, v7, v8);
    [(CKDetailsLocationStringCell *)v3 setLocationLabel:v16];

    v17 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v18 = [(CKDetailsLocationStringCell *)v3 locationLabel];
    [v18 setTextColor:v17];

    id v19 = objc_alloc(MEMORY[0x1E4F43028]);
    v20 = [MEMORY[0x1E4F427D8] effectWithStyle:6];
    v21 = (void *)[v19 initWithEffect:v20];

    [(CKDetailsLocationStringCell *)v3 setBlurView:v21];
    [(CKDetailsLocationStringCell *)v3 addSubview:v21];
    v22 = [(CKDetailsLocationStringCell *)v3 locationLabel];
    [(CKDetailsLocationStringCell *)v3 addSubview:v22];

    v23 = [(CKDetailsLocationStringCell *)v3 locationImageView];
    [(CKDetailsLocationStringCell *)v3 addSubview:v23];

    if (CKIsRunningInMacCatalyst())
    {
      v24 = [(CKDetailsLocationStringCell *)v3 layer];
      [v24 setMaskedCorners:12];

      v25 = [(CKDetailsLocationStringCell *)v3 layer];
      [v25 setCornerRadius:4.0];

      v26 = [(CKDetailsLocationStringCell *)v3 layer];
      [v26 setMasksToBounds:1];
    }
  }
  return v3;
}

- (void)layoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)CKDetailsLocationStringCell;
  [(CKDetailsLocationStringCell *)&v49 layoutSubviews];
  v3 = [(CKDetailsLocationStringCell *)self locationImageView];
  [v3 sizeToFit];

  id v4 = [(CKDetailsLocationStringCell *)self locationImageView];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [(CKDetailsLocationStringCell *)self layoutMargins];
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
  [(CKDetailsLocationStringCell *)self bounds];
  if (v17)
  {
    double v20 = v18 - v16;
    v50.origin.x = v6;
    v50.origin.y = v8;
    v50.size.width = v10;
    v50.size.height = v12;
    double v21 = v20 - CGRectGetWidth(v50);
    [(CKDetailsLocationStringCell *)self bounds];
    double v23 = v22;
    v51.origin.x = v6;
    v51.origin.y = v8;
    v51.size.width = v10;
    v51.size.height = v12;
    double v24 = (v23 - CGRectGetHeight(v51)) * 0.5;
    if (CKMainScreenScale_once_76 != -1) {
      dispatch_once(&CKMainScreenScale_once_76, &__block_literal_global_192);
    }
    double v25 = *(double *)&CKMainScreenScale_sMainScreenScale_76;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_76 == 0.0) {
      double v25 = 1.0;
    }
    double v26 = v21 * v25;
  }
  else
  {
    double v27 = v19;
    v52.origin.x = v6;
    v52.origin.y = v8;
    v52.size.width = v10;
    v52.size.height = v12;
    double v24 = (v27 - CGRectGetHeight(v52)) * 0.5;
    if (CKMainScreenScale_once_76 != -1) {
      dispatch_once(&CKMainScreenScale_once_76, &__block_literal_global_192);
    }
    double v25 = *(double *)&CKMainScreenScale_sMainScreenScale_76;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_76 == 0.0) {
      double v25 = 1.0;
    }
    double v26 = v14 * v25;
  }
  double v28 = floor(v26) / v25;
  double v29 = floor(v24 * v25) / v25;
  v30 = [(CKDetailsLocationStringCell *)self locationImageView];
  objc_msgSend(v30, "setFrame:", v28, v29, v10, v12);

  [(CKDetailsLocationStringCell *)self bounds];
  double v33 = v32;
  double v35 = v34;
  if (v17)
  {
    double v36 = v31;
    v53.origin.x = v28;
    v53.origin.y = v29;
    v53.size.width = v10;
    v53.size.height = v12;
    double v37 = CGRectGetMinX(v53) + -3.0;
  }
  else
  {
    v54.origin.x = v28;
    v54.origin.y = v29;
    v54.size.width = v10;
    v54.size.height = v12;
    double v36 = CGRectGetMaxX(v54) + 3.0;
    [(CKDetailsLocationStringCell *)self bounds];
    double v37 = v38 - v36;
  }
  v39 = [(CKDetailsLocationStringCell *)self locationLabel];
  objc_msgSend(v39, "setFrame:", v36, v33, v37, v35);

  [(CKDetailsLocationStringCell *)self bounds];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v48 = [(CKDetailsLocationStringCell *)self blurView];
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);
}

- (void)setLocationString:(id)a3
{
  if (self->_locationString != a3)
  {
    -[UILabel setText:](self->_locationLabel, "setText:");
    [(CKDetailsLocationStringCell *)self setNeedsLayout];
  }
}

- (NSString)locationString
{
  return self->_locationString;
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
}

- (UIImageView)locationImageView
{
  return self->_locationImageView;
}

- (void)setLocationImageView:(id)a3
{
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_locationImageView, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);

  objc_storeStrong((id *)&self->_locationString, 0);
}

@end
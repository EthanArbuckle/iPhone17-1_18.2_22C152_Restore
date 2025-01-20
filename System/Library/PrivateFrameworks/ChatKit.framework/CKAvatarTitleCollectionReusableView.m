@interface CKAvatarTitleCollectionReusableView
+ (id)reuseIdentifier;
+ (id)supplementaryViewKind;
- (BOOL)isAvatarPickerActive;
- (BOOL)isChevronHidden;
- (BOOL)isLTR;
- (BOOL)wantsOpaqueChevron;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAvatarTitleCollectionReusableView)initWithFrame:(CGRect)a3;
- (CKAvatarTitleCollectionReusableViewDelegate)delegate;
- (CKLabel)titleLabel;
- (NSMutableArray)pendingTitles;
- (UIImageView)chevronImageView;
- (UIImageView)statusIndicatorImageView;
- (UILabel)locationLabel;
- (int64_t)avatarTitleAccessoryImageType;
- (int64_t)statusIndicatorType;
- (int64_t)style;
- (void)_animateFromQueue;
- (void)_rotateChevronImageView;
- (void)configureChevronImageView;
- (void)configureWithTitle:(id)a3;
- (void)layoutSubviews;
- (void)setAvatarPickerActive:(BOOL)a3;
- (void)setAvatarTitleAccessoryImageType:(int64_t)a3;
- (void)setChevronHidden:(BOOL)a3;
- (void)setChevronImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationLabel:(id)a3;
- (void)setPendingTitles:(id)a3;
- (void)setStatusIndicatorImageView:(id)a3;
- (void)setStatusIndicatorType:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3 animated:(BOOL)a4;
- (void)setTitleLabel:(id)a3;
- (void)setWantsOpaqueChevron:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKAvatarTitleCollectionReusableView

+ (id)reuseIdentifier
{
  return @"CKAvatarTitleCollectionReusableView_reuseIdentifier";
}

+ (id)supplementaryViewKind
{
  return @"CKAvatarTitleCollectionReusableView_supplementaryViewKind";
}

- (CKAvatarTitleCollectionReusableView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)CKAvatarTitleCollectionReusableView;
  v6 = -[CKAvatarTitleCollectionReusableView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  -[CKAvatarTitleCollectionReusableView setFrame:](v6, "setFrame:", x, 54.0, width, height);
  if (v6)
  {
    [(CKAvatarTitleCollectionReusableView *)v6 setClipsToBounds:0];
    v7 = -[CKLabel initWithFrame:]([CKLabel alloc], "initWithFrame:", 0.0, 0.0, width, height);
    [(CKAvatarTitleCollectionReusableView *)v6 setTitleLabel:v7];

    v8 = +[CKUIBehavior sharedBehaviors];
    v9 = [v8 avatarStackTitleFont];
    v10 = [(CKAvatarTitleCollectionReusableView *)v6 titleLabel];
    [v10 setFont:v9];

    v11 = +[CKUIBehavior sharedBehaviors];
    v12 = [v11 theme];
    v13 = [v12 primaryLabelColor];
    v14 = [(CKAvatarTitleCollectionReusableView *)v6 titleLabel];
    [v14 setTextColor:v13];

    v15 = [(CKAvatarTitleCollectionReusableView *)v6 titleLabel];
    [v15 setTextAlignment:1];

    [(CKAvatarTitleCollectionReusableView *)v6 setClipsToBounds:0];
    v16 = [(CKAvatarTitleCollectionReusableView *)v6 titleLabel];
    [(CKAvatarTitleCollectionReusableView *)v6 addSubview:v16];

    v17 = [(CKAvatarTitleCollectionReusableView *)v6 layer];
    [v17 setAllowsGroupBlending:0];
  }
  return v6;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style == a3) {
    return;
  }
  self->_style = a3;
  if ((unint64_t)(a3 - 2) < 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] whiteColor];
LABEL_8:
    v4 = (void *)v6;
    v5 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
    [v5 setTextColor:v4];
    goto LABEL_11;
  }
  if (a3 == 5)
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] blackColor];
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    v5 = [v4 theme];
    [v5 entryFieldDarkEffectButtonColor];
  }
  else
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    v5 = [v4 theme];
    [v5 primaryLabelColor];
  v7 = };
  v8 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  [v8 setTextColor:v7];

LABEL_11:
  v9 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  v10 = [v9 titleIconImageView];
  v11 = [v10 image];
  v12 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  v13 = [v12 textColor];
  v14 = [v11 _flatImageWithColor:v13];
  v15 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  v16 = [v15 titleIconImageView];
  [v16 setImage:v14];

  if (![(CKAvatarTitleCollectionReusableView *)self isChevronHidden])
  {
    [(CKAvatarTitleCollectionReusableView *)self configureChevronImageView];
  }
}

- (void)setWantsOpaqueChevron:(BOOL)a3
{
  if (self->_wantsOpaqueChevron != a3)
  {
    self->_wantsOpaqueChevron = a3;
    if (![(CKAvatarTitleCollectionReusableView *)self isChevronHidden])
    {
      [(CKAvatarTitleCollectionReusableView *)self configureChevronImageView];
    }
  }
}

- (BOOL)isChevronHidden
{
  return self->_chevronHidden;
}

- (void)setChevronHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_chevronHidden = a3;
  v5 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];

  if (!v5 && !v3) {
    [(CKAvatarTitleCollectionReusableView *)self setAvatarPickerActive:self->_avatarPickerActive];
  }
  uint64_t v6 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];

  if (v6 && v3)
  {
    v7 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
    [v7 removeFromSuperview];

    [(CKAvatarTitleCollectionReusableView *)self setChevronImageView:0];
    [(CKAvatarTitleCollectionReusableView *)self layoutIfNeeded];
  }
}

- (void)setLocationLabel:(id)a3
{
  id v8 = a3;
  p_locationLabel = (id *)&self->_locationLabel;
  locationLabel = self->_locationLabel;
  if (locationLabel)
  {
    [(UILabel *)locationLabel removeFromSuperview];
    id v7 = *p_locationLabel;
    id *p_locationLabel = 0;
  }
  if (v8)
  {
    objc_storeStrong((id *)&self->_locationLabel, a3);
    [*p_locationLabel sizeToFit];
    [(CKAvatarTitleCollectionReusableView *)self addSubview:*p_locationLabel];
  }
  [(CKAvatarTitleCollectionReusableView *)self setNeedsLayout];
}

- (void)setAvatarTitleAccessoryImageType:(int64_t)a3
{
  self->_avatarTitleAccessoryImageType = a3;
  switch(a3)
  {
    case 0:
      v4 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
      v5 = v4;
      uint64_t v6 = 0;
      break;
    case 1:
      v4 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
      v5 = v4;
      uint64_t v6 = 1;
      break;
    case 2:
      id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v8 = [v7 isKeyTransparencyEnabled];

      if (!v8) {
        goto LABEL_9;
      }
      v4 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
      v5 = v4;
      uint64_t v6 = 4;
      break;
    case 3:
      v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v10 = [v9 isKeyTransparencyEnabled];

      if (!v10) {
        goto LABEL_9;
      }
      v4 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
      v5 = v4;
      uint64_t v6 = 5;
      break;
    default:
      goto LABEL_9;
  }
  [v4 setTitleIconImageType:v6];

LABEL_9:

  [(CKAvatarTitleCollectionReusableView *)self setNeedsLayout];
}

- (void)setAvatarPickerActive:(BOOL)a3
{
  if (self->_avatarPickerActive != a3
    || ([(CKAvatarTitleCollectionReusableView *)self chevronImageView],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_avatarPickerActive = a3;
    if (!self->_chevronHidden)
    {
      if (!self->_chevronImageView) {
        [(CKAvatarTitleCollectionReusableView *)self configureChevronImageView];
      }
      [(CKAvatarTitleCollectionReusableView *)self layoutIfNeeded];
      uint64_t v6 = +[CKUIBehavior sharedBehaviors];
      [v6 transcriptHeaderChevronRotationAnimationSpeed];
      double v8 = v7;

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __61__CKAvatarTitleCollectionReusableView_setAvatarPickerActive___block_invoke;
      v9[3] = &unk_1E5620C40;
      v9[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:0x20000 delay:v9 options:0 animations:v8 completion:0.0];
    }
  }
}

uint64_t __61__CKAvatarTitleCollectionReusableView_setAvatarPickerActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rotateChevronImageView];
}

- (void)configureChevronImageView
{
  if (!self->_chevronImageView)
  {
    BOOL v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    chevronImageView = self->_chevronImageView;
    self->_chevronImageView = v3;

    [(CKAvatarTitleCollectionReusableView *)self addSubview:self->_chevronImageView];
  }
  BOOL v5 = [(CKAvatarTitleCollectionReusableView *)self wantsOpaqueChevron];
  uint64_t v6 = +[CKUIBehavior sharedBehaviors];
  double v7 = v6;
  if (v5)
  {
    double v8 = [v6 navBarHeaderOpaqueChevronImage];
    [(UIImageView *)self->_chevronImageView setImage:v8];

    if ((self->_style & 0xFFFFFFFFFFFFFFFELL) == 2) {
      [MEMORY[0x1E4F428B8] whiteColor];
    }
    else {
    double v7 = [MEMORY[0x1E4F428B8] blackColor];
    }
    v9 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
    [v9 setTintColor:v7];
  }
  else
  {
    v9 = [v6 navBarHeaderChevronImage];
    [(UIImageView *)self->_chevronImageView setImage:v9];
  }

  [(UIImageView *)self->_chevronImageView sizeToFit];
  int v10 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  v15 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
  [v15 setContentMode:4];

  id v16 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
  objc_msgSend(v16, "setBounds:", 0.0, 0.0, v12, v14);
}

- (void)_rotateChevronImageView
{
  memset(&v11, 0, sizeof(v11));
  if ([(CKAvatarTitleCollectionReusableView *)self isAvatarPickerActive])
  {
    BOOL v3 = [(CKAvatarTitleCollectionReusableView *)self isLTR];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v10.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v10.c = v4;
    *(_OWORD *)&v10.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (v3) {
      CGFloat v5 = 1.57079633;
    }
    else {
      CGFloat v5 = -1.57079633;
    }
    CGAffineTransformRotate(&v11, &v10, v5);
  }
  else
  {
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v11.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v11.c = v6;
    *(_OWORD *)&v11.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  CGAffineTransform v9 = v11;
  double v7 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
  CGAffineTransform v8 = v9;
  [v7 setTransform:&v8];
}

- (void)setTitle:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    if (a4)
    {
      double v7 = [(CKAvatarTitleCollectionReusableView *)self pendingTitles];

      if (!v7)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(CKAvatarTitleCollectionReusableView *)self setPendingTitles:v8];
      }
      CGAffineTransform v9 = [(CKAvatarTitleCollectionReusableView *)self pendingTitles];
      CGAffineTransform v10 = [v9 lastObject];
      char v11 = [v10 isEqualToString:v6];

      if ((v11 & 1) == 0)
      {
        double v12 = [(CKAvatarTitleCollectionReusableView *)self pendingTitles];
        [v12 addObject:v6];
      }
      double v13 = [(CKAvatarTitleCollectionReusableView *)self pendingTitles];
      uint64_t v14 = [v13 count];

      if (v14 == 1) {
        [(CKAvatarTitleCollectionReusableView *)self _animateFromQueue];
      }
    }
    else
    {
      id v16 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
      [v16 setText:v6];

      [(CKAvatarTitleCollectionReusableView *)self setNeedsLayout];
    }
  }
  else
  {
    v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CKAvatarTitleCollectionReusableView setTitle:animated:](v15);
    }
  }
}

- (void)_animateFromQueue
{
  BOOL v3 = [(CKAvatarTitleCollectionReusableView *)self pendingTitles];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    CGFloat v5 = [(CKAvatarTitleCollectionReusableView *)self pendingTitles];
    id v6 = [v5 firstObject];

    double v7 = [(CKAvatarTitleCollectionReusableView *)self pendingTitles];
    [v7 removeFirstObject];

    id v8 = (void *)MEMORY[0x1E4F42FF0];
    CGAffineTransform v9 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__CKAvatarTitleCollectionReusableView__animateFromQueue__block_invoke;
    v12[3] = &unk_1E5620AF8;
    v12[4] = self;
    id v13 = v6;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__CKAvatarTitleCollectionReusableView__animateFromQueue__block_invoke_2;
    v11[3] = &unk_1E5620BF0;
    v11[4] = self;
    id v10 = v6;
    [v8 transitionWithView:v9 duration:5242880 options:v12 animations:v11 completion:0.35];
  }
}

void __56__CKAvatarTitleCollectionReusableView__animateFromQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) titleLabel];
  [v2 setText:v1];
}

uint64_t __56__CKAvatarTitleCollectionReusableView__animateFromQueue__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _animateFromQueue];
}

- (void)configureWithTitle:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  [v5 setText:v4];

  [(CKAvatarTitleCollectionReusableView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v97.receiver = self;
  v97.super_class = (Class)CKAvatarTitleCollectionReusableView;
  [(CKAvatarTitleCollectionReusableView *)&v97 layoutSubviews];
  BOOL v3 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
  if (v3)
  {
    id v4 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
    [v4 frame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
  }
  else
  {
    CGFloat v6 = *MEMORY[0x1E4F1DB28];
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  id v13 = [(CKAvatarTitleCollectionReusableView *)self statusIndicatorImageView];
  if (v13)
  {
    uint64_t v14 = [(CKAvatarTitleCollectionReusableView *)self statusIndicatorImageView];
    [v14 frame];
    rect.origin.y = v15;
    rect.size.CGFloat width = v16;
  }
  else
  {
    rect.origin.y = *(CGFloat *)MEMORY[0x1E4F1DB28];
    rect.size.CGFloat width = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
  }

  [(CKAvatarTitleCollectionReusableView *)self bounds];
  double v18 = v17;
  double v20 = v19;
  v21 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  [v21 sizeToFit];

  v22 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  [v22 _firstLineBaseline];
  double v24 = v23;

  v25 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
  rect.origin.double x = v6;
  if (v25)
  {
    v98.origin.double x = v6;
    CGFloat v26 = v8;
    v98.origin.y = v8;
    CGFloat v27 = v10;
    v98.size.CGFloat width = v10;
    v98.size.double height = v12;
    double v28 = CGRectGetWidth(v98) + 1.5;
  }
  else
  {
    CGFloat v26 = v8;
    CGFloat v27 = v10;
    double v28 = 0.0;
  }

  [(CKAvatarTitleCollectionReusableView *)self bounds];
  double v30 = v29 - v28;
  v31 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  objc_msgSend(v31, "sizeThatFits:", v18 - v28, v20);
  double v33 = v32;
  uint64_t v35 = v34;

  if (v33 >= v30) {
    double v33 = v30;
  }
  [(CKAvatarTitleCollectionReusableView *)self bounds];
  double v37 = (v36 - (v28 + v33)) * 0.5;
  v38 = +[CKUIBehavior sharedBehaviors];
  [v38 avatarTitleOffset];
  *(float *)&double v39 = v39 - v24;
  double v40 = fmaxf(*(float *)&v39, 0.0);

  v41 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];

  if (v41)
  {
    BOOL v42 = [(CKAvatarTitleCollectionReusableView *)self isLTR];
    double v43 = v37;
    double v44 = v40;
    double v45 = v33;
    uint64_t v46 = v35;
    if (v42)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v43);
      double v48 = 1.5;
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v43);
      v99.origin.double x = rect.origin.x;
      v99.origin.y = v26;
      v99.size.CGFloat width = v27;
      v99.size.double height = v12;
      double MaxX = MinX - CGRectGetWidth(v99);
      double v48 = -1.5;
    }
    double v50 = MaxX + v48;
    v51 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
    v52 = [v51 font];
    [v52 ascender];
    double v54 = v53 + v40 - v12;
    v55 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
    v56 = [v55 image];
    [v56 baselineOffsetFromBottom];
    double v58 = v54 + v57;

    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke;
    v96[3] = &unk_1E5621968;
    v96[4] = self;
    *(double *)&v96[5] = v50;
    *(double *)&v96[6] = v58;
    *(CGFloat *)&v96[7] = v27;
    *(double *)&v96[8] = v12;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v96];
  }
  v59 = [(CKAvatarTitleCollectionReusableView *)self statusIndicatorImageView];

  if (v59)
  {
    BOOL v60 = [(CKAvatarTitleCollectionReusableView *)self isLTR];
    double v61 = v37;
    double v62 = v40;
    double v63 = v33;
    uint64_t v64 = v35;
    if (v60)
    {
      double v65 = CGRectGetMinX(*(CGRect *)&v61);
      v100.size.CGFloat width = 16.0;
      v100.size.double height = 9.0;
      v100.origin.double x = rect.origin.y;
      CGFloat width = rect.size.width;
      v100.origin.y = rect.size.width;
      double v67 = v65 - CGRectGetWidth(v100) + -1.5;
    }
    else
    {
      double v67 = CGRectGetMaxX(*(CGRect *)&v61) + 1.5;
      CGFloat width = rect.size.width;
    }
    v68 = +[CKUIBehavior sharedBehaviors];
    [v68 avatarTitleOffset];
    double v70 = v69 + 1.0;
    v101.size.CGFloat width = 16.0;
    v101.size.double height = 9.0;
    v101.origin.double x = v67;
    v101.origin.y = width;
    double v71 = v70 - CGRectGetHeight(v101);

    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke_2;
    v94[3] = &unk_1E5621968;
    v94[4] = self;
    *(double *)&v94[5] = v67;
    *(double *)&v94[6] = v71;
    long long v95 = xmmword_18F81CCD0;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v94];
  }
  *(void *)&rect.size.double height = MEMORY[0x1E4F143A8];
  uint64_t v86 = 3221225472;
  v87 = __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke_3;
  v88 = &unk_1E5621968;
  v89 = self;
  double v90 = v37;
  double v91 = v40;
  double v92 = v33;
  uint64_t v93 = v35;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:&rect.size.height];
  v72 = [(CKAvatarTitleCollectionReusableView *)self locationLabel];

  if (v72)
  {
    v73 = [(CKAvatarTitleCollectionReusableView *)self locationLabel];
    [v73 sizeToFit];

    v74 = [(CKAvatarTitleCollectionReusableView *)self locationLabel];
    [(CKAvatarTitleCollectionReusableView *)self bounds];
    double v76 = v75;
    v77 = [(CKAvatarTitleCollectionReusableView *)self locationLabel];
    [v77 frame];
    double v79 = (v76 - v78) * 0.5;
    v80 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
    [v80 origin];
    double v82 = v81;
    v83 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
    [v83 bounds];
    objc_msgSend(v74, "setOrigin:", v79, v82 + v84);
  }
}

void __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  if (CKMainScreenScale_once_43 != -1) {
    dispatch_once(&CKMainScreenScale_once_43, &__block_literal_global_110);
  }
  double v6 = *(double *)&CKMainScreenScale_sMainScreenScale_43;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_43 == 0.0) {
    double v6 = 1.0;
  }
  double v7 = round(v2 * v6) / v6;
  double v8 = round(v3 * v6) / v6;
  double v9 = round(v4 * v6) / v6;
  double v10 = round(v5 * v6) / v6;
  id v11 = [*(id *)(a1 + 32) chevronImageView];
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);
}

void __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  if (CKMainScreenScale_once_43 != -1) {
    dispatch_once(&CKMainScreenScale_once_43, &__block_literal_global_110);
  }
  double v6 = *(double *)&CKMainScreenScale_sMainScreenScale_43;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_43 == 0.0) {
    double v6 = 1.0;
  }
  double v7 = round(v2 * v6) / v6;
  double v8 = round(v3 * v6) / v6;
  double v9 = round(v4 * v6) / v6;
  double v10 = round(v5 * v6) / v6;
  id v11 = [*(id *)(a1 + 32) statusIndicatorImageView];
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);
}

void __53__CKAvatarTitleCollectionReusableView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  if (CKMainScreenScale_once_43 != -1) {
    dispatch_once(&CKMainScreenScale_once_43, &__block_literal_global_110);
  }
  double v6 = *(double *)&CKMainScreenScale_sMainScreenScale_43;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_43 == 0.0) {
    double v6 = 1.0;
  }
  double v7 = round(v2 * v6) / v6;
  double v8 = round(v3 * v6) / v6;
  double v9 = round(v4 * v6) / v6;
  double v10 = round(v5 * v6) / v6;
  id v11 = [*(id *)(a1 + 32) titleLabel];
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  double v12 = [*(id *)(a1 + 32) titleLabel];
  [v12 setNeedsLayout];

  id v13 = [*(id *)(a1 + 32) titleLabel];
  [v13 layoutIfNeeded];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  id v11 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];

  if (v11)
  {
    double v12 = [(CKAvatarTitleCollectionReusableView *)self chevronImageView];
    [v12 bounds];
    double v8 = v8 + CGRectGetWidth(v20) + 1.5;
  }
  id v13 = [(CKAvatarTitleCollectionReusableView *)self statusIndicatorImageView];

  if (v13)
  {
    uint64_t v14 = [(CKAvatarTitleCollectionReusableView *)self statusIndicatorImageView];
    [v14 bounds];
    double v8 = v8 + CGRectGetWidth(v21) + 1.5;
  }
  CGFloat v15 = [(CKAvatarTitleCollectionReusableView *)self locationLabel];

  if (v15)
  {
    CGFloat v16 = [(CKAvatarTitleCollectionReusableView *)self locationLabel];
    [v16 bounds];
    double v10 = v10 + CGRectGetHeight(v22);
  }
  double v17 = v8;
  double v18 = v10;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (BOOL)isLTR
{
  return [(CKAvatarTitleCollectionReusableView *)self _shouldReverseLayoutDirection] ^ 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKAvatarTitleCollectionReusableView;
  [(CKAvatarTitleCollectionReusableView *)&v7 traitCollectionDidChange:a3];
  if (![(CKAvatarTitleCollectionReusableView *)self isChevronHidden]) {
    [(CKAvatarTitleCollectionReusableView *)self configureChevronImageView];
  }
  double v4 = +[CKUIBehavior sharedBehaviors];
  double v5 = [v4 avatarStackTitleFont];
  double v6 = [(CKAvatarTitleCollectionReusableView *)self titleLabel];
  [v6 setFont:v5];

  [(CKAvatarTitleCollectionReusableView *)self setNeedsLayout];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v4 = [(CKAvatarTitleCollectionReusableView *)self delegate];
  [v4 beganTouchingTitleLabel];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v4 = [(CKAvatarTitleCollectionReusableView *)self delegate];
  [v4 endedTouchingTitleLabel];
}

- (CKAvatarTitleCollectionReusableViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAvatarTitleCollectionReusableViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)avatarTitleAccessoryImageType
{
  return self->_avatarTitleAccessoryImageType;
}

- (BOOL)isAvatarPickerActive
{
  return self->_avatarPickerActive;
}

- (int64_t)statusIndicatorType
{
  return self->_statusIndicatorType;
}

- (void)setStatusIndicatorType:(int64_t)a3
{
  self->_statusIndicatorType = a3;
}

- (BOOL)wantsOpaqueChevron
{
  return self->_wantsOpaqueChevron;
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
}

- (UIImageView)statusIndicatorImageView
{
  return self->_statusIndicatorImageView;
}

- (void)setStatusIndicatorImageView:(id)a3
{
}

- (NSMutableArray)pendingTitles
{
  return self->_pendingTitles;
}

- (void)setPendingTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTitles, 0);
  objc_storeStrong((id *)&self->_statusIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTitle:(os_log_t)log animated:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Tried to set nil title: %@", (uint8_t *)&v1, 0xCu);
}

@end
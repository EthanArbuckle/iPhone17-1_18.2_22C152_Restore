@interface CKOrganicImageBalloonView
- (BOOL)canUseOpaqueMask;
- (BOOL)suppressMask;
- (CAShapeLayer)dashedBorder;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (CKBalloonImageView)imageView;
- (CKOrganicImageBalloonView)initWithFrame:(CGRect)a3;
- (CKOrganicImageLayoutRecipe)layoutRecipe;
- (id)createOverlayImageView;
- (id)image;
- (id)invisibleInkEffectImage;
- (id)tailMask;
- (void)addFilter:(id)a3;
- (void)attachInvisibleInkEffectView;
- (void)configureForMessagePart:(id)a3;
- (void)detachInvisibleInkEffectView;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setDashedBorder:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setInvisibleInkEffectImage:(id)a3;
- (void)setLayoutRecipe:(id)a3;
- (void)setMonoskiBadgeView:(id)a3;
@end

@implementation CKOrganicImageBalloonView

- (CKOrganicImageBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CKOrganicImageBalloonView;
  v7 = -[CKImageBalloonView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[CKBalloonImageView initWithFrame:]([CKBalloonImageView alloc], "initWithFrame:", x, y, width, height);
    [(CKOrganicImageBalloonView *)v7 setImageView:v8];

    v9 = [(CKOrganicImageBalloonView *)v7 imageView];
    [(CKOrganicImageBalloonView *)v7 addSubview:v9];
  }
  return v7;
}

- (void)prepareForDisplay
{
  v58.receiver = self;
  v58.super_class = (Class)CKOrganicImageBalloonView;
  [(CKImageBalloonView *)&v58 prepareForDisplay];
  v3 = [(CKBalloonView *)self invisibleInkEffectController];
  [v3 prepareForDisplay];

  v4 = [(CKOrganicImageBalloonView *)self imageView];
  v5 = [v4 layer];
  [v5 setContentsGravity:*MEMORY[0x1E4F3A3E0]];

  v6 = [(CKOrganicImageBalloonView *)self imageView];
  v7 = [v6 layer];
  [v7 setCornerRadius:20.0];

  v8 = [(CKOrganicImageBalloonView *)self imageView];
  v9 = [v8 layer];
  uint64_t v10 = *MEMORY[0x1E4F39EA8];
  [v9 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  objc_super v11 = [(CKOrganicImageBalloonView *)self imageView];
  v12 = [v11 layer];
  [v12 setMasksToBounds:1];

  v13 = [(CKOrganicImageBalloonView *)self dashedBorder];
  [v13 removeFromSuperlayer];

  if ([(CKImageBalloonView *)self isScheduled])
  {
    v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v15 = [v14 isDashedBalloonsEnabled];

    if (v15)
    {
      v16 = [(CKOrganicImageBalloonView *)self dashedBorder];

      if (!v16)
      {
        v17 = [MEMORY[0x1E4F39C88] layer];
        [(CKOrganicImageBalloonView *)self setDashedBorder:v17];

        v18 = (void *)MEMORY[0x1E4F428B8];
        [(CKOrganicImageBalloonView *)self balloonDescriptor];
        v19 = objc_msgSend(v18, "ck_colorWithCKColor:", v54, v55, v56, v57);
        uint64_t v20 = [v19 cgColor];
        v21 = [(CKOrganicImageBalloonView *)self dashedBorder];
        [v21 setStrokeColor:v20];

        v22 = [(CKOrganicImageBalloonView *)self dashedBorder];
        [v22 setFillColor:0];

        v23 = [(CKOrganicImageBalloonView *)self dashedBorder];
        [v23 setLineDashPattern:&unk_1EDF151D0];

        v24 = [(CKOrganicImageBalloonView *)self dashedBorder];
        [v24 setLineWidth:2.0];

        v25 = [(CKOrganicImageBalloonView *)self dashedBorder];
        [v25 setCornerRadius:20.0];

        v26 = [(CKOrganicImageBalloonView *)self dashedBorder];
        [v26 setCornerCurve:v10];

        v27 = [(CKOrganicImageBalloonView *)self dashedBorder];
        [v27 setAllowsEdgeAntialiasing:1];
      }
      v28 = [(CKOrganicImageBalloonView *)self layer];
      v29 = [(CKOrganicImageBalloonView *)self dashedBorder];
      [v28 addSublayer:v29];
    }
    v30 = [(CKOrganicImageBalloonView *)self layer];
    [v30 setCornerRadius:20.0];

    v31 = [(CKOrganicImageBalloonView *)self layer];
    [v31 setCornerCurve:v10];

    v32 = [(CKOrganicImageBalloonView *)self layer];
    [v32 setMasksToBounds:1];

    v33 = [(CKOrganicImageBalloonView *)self imageView];
    [v33 setAlpha:0.5];
  }
  v34 = [(CKBalloonView *)self invisibleInkEffectController];
  v35 = [v34 effectView];

  v36 = [v35 layer];
  [v36 setCornerRadius:20.0];

  v37 = [v35 layer];
  [v37 setCornerCurve:v10];

  v38 = [v35 layer];
  [v38 setMasksToBounds:1];

  v39 = [(CKOrganicImageBalloonView *)self layoutRecipe];
  [v39 rotation];
  double v41 = v40;

  memset(&v53, 0, sizeof(v53));
  long long v42 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v52.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v52.c = v42;
  *(_OWORD *)&v52.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformRotate(&v53, &v52, v41 * 3.14159265 / 180.0);
  CGAffineTransform v51 = v53;
  [(CKOrganicImageBalloonView *)self setTransform:&v51];
  v43 = [(CKOrganicImageBalloonView *)self layoutRecipe];
  LODWORD(v37) = [v43 wantsShadow];

  if (v37)
  {
    v44 = [(CKOrganicImageBalloonView *)self layer];
    objc_msgSend(v44, "setShadowOffset:", 0.0, 7.0);

    v45 = [(CKOrganicImageBalloonView *)self layer];
    LODWORD(v46) = 1045220557;
    [v45 setShadowOpacity:v46];

    v47 = [(CKOrganicImageBalloonView *)self layer];
    [v47 setShadowRadius:27.0];

    v48 = [(CKOrganicImageBalloonView *)self layer];
    [v48 setShadowPathIsBounds:1];
  }
  v49 = [(CKOrganicImageBalloonView *)self imageView];
  v50 = [v49 layer];
  [v50 setAllowsEdgeAntialiasing:1];
}

- (void)setMonoskiBadgeView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKOrganicImageBalloonView;
  id v3 = a3;
  [(CKImageBalloonView *)&v7 setMonoskiBadgeView:v3];
  v4 = objc_msgSend(v3, "layer", v7.receiver, v7.super_class);
  [v4 setCornerRadius:20.0];

  v5 = [v3 layer];
  [v5 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  v6 = [v3 layer];

  [v6 setMasksToBounds:1];
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)CKOrganicImageBalloonView;
  [(CKImageBalloonView *)&v47 layoutSubviews];
  id v3 = [(CKImageBalloonView *)self monoskiBadgeView];

  if (v3)
  {
    [(CKOrganicImageBalloonView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [(CKImageBalloonView *)self monoskiBadgeView];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  }
  uint64_t v13 = [(CKImageBalloonView *)self irisBadgeView];
  if (v13)
  {
    v14 = (void *)v13;
    int v15 = [(CKBalloonView *)self orientation];

    if (!v15)
    {
      v16 = [(CKImageBalloonView *)self irisBadgeView];
      [v16 frame];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;

      v25 = +[CKUIBehavior sharedBehaviors];
      [v25 balloonMaskTailWidth];
      double v27 = v18 - v26;

      v28 = [(CKImageBalloonView *)self irisBadgeView];
      objc_msgSend(v28, "setFrame:", v27, v20, v22, v24);
    }
  }
  v29 = (void *)MEMORY[0x1E4F427D0];
  v30 = [(CKOrganicImageBalloonView *)self layer];
  [v30 bounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [(CKOrganicImageBalloonView *)self layer];
  [v39 cornerRadius];
  objc_msgSend(v29, "bezierPathWithRoundedRect:cornerRadius:", v32, v34, v36, v38, v40);
  id v41 = objc_claimAutoreleasedReturnValue();
  uint64_t v42 = [v41 CGPath];
  v43 = [(CKOrganicImageBalloonView *)self dashedBorder];
  [v43 setPath:v42];

  v44 = [(CKOrganicImageBalloonView *)self imageView];
  v45 = [v44 layer];
  [(CKImageBalloonView *)self imageInsets];
  [v45 setCornerRadius:20.0 - v46];
}

- (id)tailMask
{
  return 0;
}

- (BOOL)suppressMask
{
  return 1;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CKOrganicImageBalloonView *)self frame];
  v36.origin.double x = v8;
  v36.origin.double y = v9;
  v36.size.double width = v10;
  v36.size.double height = v11;
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.double width = width;
  v35.size.double height = height;
  if (!CGRectEqualToRect(v35, v36))
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    [(CKOrganicImageBalloonView *)self transform];
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v31[0] = *MEMORY[0x1E4F1DAB8];
    v31[1] = v12;
    v31[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(CKOrganicImageBalloonView *)self setTransform:v31];
    v30.receiver = self;
    v30.super_class = (Class)CKOrganicImageBalloonView;
    -[CKBalloonView setFrame:](&v30, sel_setFrame_, x, y, width, height);
    uint64_t v13 = [(CKOrganicImageBalloonView *)self imageView];
    [(CKOrganicImageBalloonView *)self bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    [(CKImageBalloonView *)self imageInsets];
    objc_msgSend(v13, "setFrame:", v15 + v25, v17 + v22, v19 - (v25 + v23), v21 - (v22 + v24));

    double v26 = [(CKOrganicImageBalloonView *)self imageView];
    double v27 = [v26 layer];
    [(CKImageBalloonView *)self imageInsets];
    [v27 setCornerRadius:20.0 - v28];

    v29[0] = v32;
    v29[1] = v33;
    v29[2] = v34;
    [(CKOrganicImageBalloonView *)self setTransform:v29];
  }
}

- (id)createOverlayImageView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setUserInteractionEnabled:0];
  double v5 = [v4 layer];
  [v5 setCornerRadius:20.0];

  double v6 = [v4 layer];
  [v6 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  double v7 = [v4 layer];
  [v7 setMasksToBounds:1];

  CGFloat v8 = [(CKImageBalloonView *)self overlayColor];
  [v4 setBackgroundColor:v8];

  CGFloat v9 = [v4 layer];
  [v9 setAllowsEdgeAntialiasing:1];

  return v4;
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  double v5 = [v4 balloonBackdropFilters];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v19 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "Cannot have two backdrop filter layers", v19, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      CGFloat v8 = [(CKBalloonView *)self backdropFilterLayer];
      _CKAssert(v8 == 0);
    }
    CGFloat v9 = [(CKBalloonView *)self backdropFilterLayer];

    if (v9)
    {
      CGFloat v10 = [(CKBalloonView *)self backdropFilterLayer];
      [v10 removeFromSuperlayer];

      [(CKBalloonView *)self setBackdropFilterLayer:0];
    }
    [(CKImageBalloonView *)self setSuppressMask:1];
    CGFloat v11 = [(CKOrganicImageBalloonView *)self layer];
    [v11 setAllowsGroupBlending:0];

    id v12 = objc_alloc_init(MEMORY[0x1E4F39B40]);
    [(CKOrganicImageBalloonView *)self bounds];
    objc_msgSend(v12, "setFrame:");
    [v12 setGroupName:@"FSMBackdropGroup"];
    uint64_t v13 = [v4 balloonBackdropFilters];
    [v12 setFilters:v13];

    [v12 setScale:0.25];
    [v12 setCornerRadius:20.0];
    [v12 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v12 setMasksToBounds:1];
    [(CKOrganicImageBalloonView *)self bounds];
    objc_msgSend(v12, "setFrame:");
    [(CKBalloonView *)self setBackdropFilterLayer:v12];
    double v14 = [(CKOrganicImageBalloonView *)self layer];
    [v14 addSublayer:v12];

    [(CKBalloonView *)self setInvisibleInkEffectEnabled:0];
  }
  double v15 = [(CKOrganicImageBalloonView *)self layer];
  double v16 = [v4 balloonFilters];
  [v15 setFilters:v16];

  double v17 = [(CKOrganicImageBalloonView *)self layer];
  double v18 = [v4 balloonCompositingFilter];
  [v17 setCompositingFilter:v18];
}

- (void)setImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKOrganicImageBalloonView;
  id v4 = a3;
  [(CKImageBalloonView *)&v7 setImage:0];
  double v5 = [(CKOrganicImageBalloonView *)self layer];
  [v5 setContents:0];

  uint64_t v6 = [(CKOrganicImageBalloonView *)self imageView];
  [v6 setImage:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(CKOrganicImageBalloonView *)self imageView];
  objc_super v7 = [v6 image];

  if (v7)
  {
    [v7 size];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (width < v9 || height < v11)
  {
    double v13 = width / v9;
    double v14 = 0.0;
    if (v9 == 0.0) {
      double v13 = 0.0;
    }
    if (v11 != 0.0) {
      double v14 = height / v11;
    }
    double v15 = fmin(v13, v14);
    double v9 = ceil(v9 * v15);
    double v11 = ceil(v11 * v15);
  }

  double v16 = v9;
  double v17 = v11;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (id)image
{
  return 0;
}

- (void)setInvisibleInkEffectImage:(id)a3
{
  id v4 = a3;
  id v5 = [(CKOrganicImageBalloonView *)self imageView];
  [v5 setInvisibleInkEffectImage:v4];
}

- (id)invisibleInkEffectImage
{
  v2 = [(CKOrganicImageBalloonView *)self imageView];
  id v3 = [v2 invisibleInkEffectImage];

  return v3;
}

- (BOOL)canUseOpaqueMask
{
  return 0;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKOrganicImageBalloonView;
  CGSize result = (CKBalloonDescriptor_t *)[(CKBalloonDescriptor_t *)&v5 balloonDescriptor];
  retstr->var4 = -1;
  retstr->var1 = 0;
  return result;
}

- (void)attachInvisibleInkEffectView
{
  id v3 = [(CKBalloonView *)self invisibleInkEffectController];
  id v5 = [v3 effectView];

  id v4 = [(CKOrganicImageBalloonView *)self imageView];
  [(CKOrganicImageBalloonView *)self insertSubview:v5 aboveSubview:v4];
}

- (void)detachInvisibleInkEffectView
{
  v2 = [(CKBalloonView *)self invisibleInkEffectController];
  id v3 = [v2 effectView];

  [v3 removeFromSuperview];
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)CKOrganicImageBalloonView;
  [(CKImageBalloonView *)&v8 prepareForReuse];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v7[0] = *MEMORY[0x1E4F1DAB8];
  v7[1] = v3;
  v7[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(CKOrganicImageBalloonView *)self setTransform:v7];
  id v4 = [(CKOrganicImageBalloonView *)self imageView];
  [v4 setAlpha:1.0];

  id v5 = [(CKOrganicImageBalloonView *)self layer];
  [v5 setBorderColor:0];

  uint64_t v6 = [(CKOrganicImageBalloonView *)self layer];
  [v6 setBorderWidth:0.0];
}

- (CKOrganicImageLayoutRecipe)layoutRecipe
{
  return self->_layoutRecipe;
}

- (void)setLayoutRecipe:(id)a3
{
}

- (CKBalloonImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (CAShapeLayer)dashedBorder
{
  return self->_dashedBorder;
}

- (void)setDashedBorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashedBorder, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_layoutRecipe, 0);
}

- (void)configureForMessagePart:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKOrganicImageBalloonView;
  id v4 = a3;
  [(CKImageBalloonView *)&v6 configureForMessagePart:v4];
  id v5 = objc_msgSend(v4, "layoutRecipe", v6.receiver, v6.super_class);

  [(CKOrganicImageBalloonView *)self setLayoutRecipe:v5];
}

@end
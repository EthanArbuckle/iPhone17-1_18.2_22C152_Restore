@interface CNPhotoPickerCollectionViewCell
+ (CGPath)selectionPathInBounds:(CGRect)a3 forCellStyle:(unint64_t)a4;
+ (double)cornerRadiusForBounds:(CGRect)a3 forCellStyle:(unint64_t)a4;
+ (id)cellIdentifier;
- (BOOL)displaySelection;
- (BOOL)displaysBorder;
- (CAShapeLayer)selectionLayer;
- (CNPhotoPickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (NSUUID)displaySessionUUID;
- (UILabel)captionLabel;
- (UIView)containerContentView;
- (UIView)containerView;
- (unint64_t)cellStyle;
- (void)clearContainerViewAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCaptionLabel:(id)a3;
- (void)setCellStyle:(unint64_t)a3;
- (void)setContainerContentView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDisplaySelection:(BOOL)a3;
- (void)setDisplaySessionUUID:(id)a3;
- (void)setDisplaysBorder:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionLayer:(id)a3;
- (void)updateBorderTintColor:(id)a3;
- (void)updateCaptionFrame;
- (void)updateWithCaption:(id)a3;
- (void)updateWithView:(id)a3 animation:(unint64_t)a4;
@end

@implementation CNPhotoPickerCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerContentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_selectionLayer, 0);

  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

- (void)setContainerContentView:(id)a3
{
}

- (UIView)containerContentView
{
  return self->_containerContentView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setCaptionLabel:(id)a3
{
}

- (UILabel)captionLabel
{
  return self->_captionLabel;
}

- (void)setSelectionLayer:(id)a3
{
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setDisplaySessionUUID:(id)a3
{
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (unint64_t)cellStyle
{
  return self->_cellStyle;
}

- (BOOL)displaysBorder
{
  return self->_displaysBorder;
}

- (void)setDisplaySelection:(BOOL)a3
{
  self->_displaySelection = a3;
}

- (BOOL)displaySelection
{
  return self->_displaySelection;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerCollectionViewCell;
  [(CNPhotoPickerCollectionViewCell *)&v4 prepareForReuse];
  [(CNPhotoPickerCollectionViewCell *)self clearContainerViewAnimated:0 withCompletion:0];
  [(CNPhotoPickerCollectionViewCell *)self setContainerContentView:0];
  v3 = [(CNPhotoPickerCollectionViewCell *)self selectionLayer];
  [v3 setHidden:1];

  [(CNPhotoPickerCollectionViewCell *)self setDisplaysBorder:0];
  [(CNPhotoPickerCollectionViewCell *)self setDisplaySelection:0];
  [(CNPhotoPickerCollectionViewCell *)self setCellStyle:1];
}

- (void)clearContainerViewAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  uint64_t v7 = *MEMORY[0x1E4F5A258];
  v8 = [(CNPhotoPickerCollectionViewCell *)self containerView];
  v9 = [v8 subviews];
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  if (!v7)
  {
    if (v4)
    {
      v10 = (void *)MEMORY[0x1E4FB1EB0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __77__CNPhotoPickerCollectionViewCell_clearContainerViewAnimated_withCompletion___block_invoke;
      v14[3] = &unk_1E549B488;
      v14[4] = self;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __77__CNPhotoPickerCollectionViewCell_clearContainerViewAnimated_withCompletion___block_invoke_2;
      v12[3] = &unk_1E549B8C8;
      v12[4] = self;
      v13 = v6;
      [v10 animateWithDuration:v14 animations:v12 completion:0.15];

      goto LABEL_7;
    }
    v11 = [(CNPhotoPickerCollectionViewCell *)self containerContentView];
    [v11 removeFromSuperview];

    [(CNPhotoPickerCollectionViewCell *)self setContainerContentView:0];
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_7:
}

void __77__CNPhotoPickerCollectionViewCell_clearContainerViewAnimated_withCompletion___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) containerContentView];
  CGAffineTransformMakeScale(&v2, 0.2, 0.2);
  [v1 setTransform:&v2];
}

uint64_t __77__CNPhotoPickerCollectionViewCell_clearContainerViewAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  CGAffineTransform v2 = [*(id *)(a1 + 32) containerContentView];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setContainerContentView:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)updateBorderTintColor:(id)a3
{
  id v7 = [a3 colorWithAlphaComponent:0.25];
  uint64_t v4 = [v7 CGColor];
  v5 = [(CNPhotoPickerCollectionViewCell *)self containerView];
  v6 = [v5 layer];
  [v6 setBorderColor:v4];
}

- (void)setDisplaysBorder:(BOOL)a3
{
  if (self->_displaysBorder != a3)
  {
    self->_displaysBorder = a3;
    if (a3)
    {
      uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v4 scale];
      double v6 = 2.0 / v5;
      id v7 = [(CNPhotoPickerCollectionViewCell *)self containerView];
      v8 = [v7 layer];
      [v8 setBorderWidth:v6];

      id v13 = [(CNPhotoPickerCollectionViewCell *)self tintColor];
      id v9 = [v13 colorWithAlphaComponent:0.25];
      uint64_t v10 = [v9 CGColor];
      v11 = [(CNPhotoPickerCollectionViewCell *)self containerView];
      v12 = [v11 layer];
      [v12 setBorderColor:v10];
    }
    else
    {
      id v13 = [(CNPhotoPickerCollectionViewCell *)self containerView];
      id v9 = [v13 layer];
      [v9 setBorderWidth:0.0];
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNPhotoPickerCollectionViewCell;
  -[CNPhotoPickerCollectionViewCell setSelected:](&v15, sel_setSelected_);
  if (v3)
  {
    double v5 = [(CNPhotoPickerCollectionViewCell *)self selectionLayer];

    if (!v5)
    {
      double v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      id v7 = +[CNUIColorRepository photoPickerSelectionBorderColor];
      -[CAShapeLayer setStrokeColor:](v6, "setStrokeColor:", [v7 CGColor]);

      [(CAShapeLayer *)v6 setLineWidth:3.0];
      id v8 = [MEMORY[0x1E4FB1618] clearColor];
      -[CAShapeLayer setFillColor:](v6, "setFillColor:", [v8 CGColor]);

      [(CAShapeLayer *)v6 setHidden:1];
      selectionLayer = self->_selectionLayer;
      self->_selectionLayer = v6;
      uint64_t v10 = v6;

      v11 = [(CNPhotoPickerCollectionViewCell *)self contentView];
      v12 = [v11 layer];
      [v12 addSublayer:v10];
    }
  }
  uint64_t v13 = [(CNPhotoPickerCollectionViewCell *)self displaySelection] & v3 ^ 1;
  v14 = [(CNPhotoPickerCollectionViewCell *)self selectionLayer];
  [v14 setHidden:v13];
}

- (void)updateCaptionFrame
{
  BOOL v3 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
  [v3 sizeToFit];

  uint64_t v4 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [(CNPhotoPickerCollectionViewCell *)self contentView];
  [v13 bounds];
  double v15 = v14;

  if (v10 > v15)
  {
    v16 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
    v17 = [v16 font];
    [v17 lineHeight];
    double v19 = v18;
    v20 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
    double v12 = v19 * (double)[v20 numberOfLines];
  }
  v21 = [(CNPhotoPickerCollectionViewCell *)self contentView];
  [v21 bounds];
  double v23 = v22;

  v24 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
  objc_msgSend(v24, "setFrame:", v6, v8, v23, v12);

  id v37 = [(CNPhotoPickerCollectionViewCell *)self contentView];
  [v37 center];
  double v26 = v25;
  v27 = [(CNPhotoPickerCollectionViewCell *)self containerView];
  [v27 frame];
  double v29 = v28;
  v30 = [(CNPhotoPickerCollectionViewCell *)self containerView];
  [v30 bounds];
  double v32 = v29 + v31;
  v33 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
  [v33 bounds];
  double v35 = v32 + v34 * 0.5 + 8.0;
  v36 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
  objc_msgSend(v36, "setCenter:", v26, v35);
}

- (void)updateWithCaption:(id)a3
{
  id v4 = a3;
  double v5 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNPhotoPickerCollectionViewCell *)self setCaptionLabel:v7];

    double v8 = +[CNUIFontRepository contactCardPhotoPickerCaptionFont];
    double v9 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
    [v9 setFont:v8];

    double v10 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
    [v10 setAdjustsFontForContentSizeCategory:1];

    double v11 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
    [v11 setNumberOfLines:2];

    double v12 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
    [v12 setTextAlignment:1];

    LODWORD(v12) = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    uint64_t v13 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
    [v13 setAdjustsFontSizeToFitWidth:1];

    if (v12) {
      double v14 = 0.0;
    }
    else {
      double v14 = 0.7;
    }
    double v15 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
    [v15 setMinimumScaleFactor:v14];

    v16 = [(CNPhotoPickerCollectionViewCell *)self contentView];
    v17 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
    [v16 addSubview:v17];
  }
  double v18 = [(CNPhotoPickerCollectionViewCell *)self captionLabel];
  [v18 setText:v4];

  [(CNPhotoPickerCollectionViewCell *)self updateCaptionFrame];
}

- (void)updateWithView:(id)a3 animation:(unint64_t)a4
{
  id v6 = a3;
  double v7 = v6;
  if (a4 == 1)
  {
    [v6 setAlpha:0.0];
    double v9 = [(CNPhotoPickerCollectionViewCell *)self containerView];
    [v9 frame];
    objc_msgSend(v7, "setFrame:");

    double v10 = [(CNPhotoPickerCollectionViewCell *)self containerView];
    [v10 addSubview:v7];

    [(CNPhotoPickerCollectionViewCell *)self setContainerContentView:v7];
    double v11 = [(CNPhotoPickerCollectionViewCell *)self displaySessionUUID];
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_3;
    v19[3] = &unk_1E549B488;
    id v20 = v7;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_4;
    v16[3] = &unk_1E54968E0;
    v16[4] = self;
    id v17 = v11;
    id v18 = v20;
    id v13 = v11;
    [v12 animateWithDuration:v19 animations:v16 completion:0.5];
  }
  else
  {
    if (a4 == 2)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke;
      v21[3] = &unk_1E549BF80;
      id v22 = v6;
      double v23 = self;
      [(CNPhotoPickerCollectionViewCell *)self clearContainerViewAnimated:1 withCompletion:v21];
      double v8 = v22;
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_5;
      v14[3] = &unk_1E549BF80;
      v14[4] = self;
      id v15 = v6;
      [(CNPhotoPickerCollectionViewCell *)self clearContainerViewAnimated:0 withCompletion:v14];
      double v8 = v15;
    }
  }
}

void __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke(uint64_t a1)
{
  CGAffineTransform v2 = [*(id *)(a1 + 40) containerView];
  [v2 frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  BOOL v3 = [*(id *)(a1 + 40) containerView];
  [v3 addSubview:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) setContainerContentView:*(void *)(a1 + 32)];
  CGAffineTransformMakeScale(&v9, 0.2, 0.2);
  id v4 = *(void **)(a1 + 32);
  CGAffineTransform v8 = v9;
  [v4 setTransform:&v8];
  double v5 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_2;
  v6[3] = &unk_1E549B488;
  id v7 = *(id *)(a1 + 32);
  [v5 animateWithDuration:0x20000 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:0.6 completion:0.0];
}

uint64_t __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_4(uint64_t a1)
{
  CGAffineTransform v2 = [*(id *)(a1 + 32) displaySessionUUID];
  BOOL v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    id v4 = *(void **)(a1 + 48);
    [v4 removeFromSuperview];
  }
}

void __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setContainerContentView:*(void *)(a1 + 40)];
  CGAffineTransform v2 = [*(id *)(a1 + 32) containerView];
  [v2 frame];
  objc_msgSend(*(id *)(a1 + 40), "setFrame:");

  id v3 = [*(id *)(a1 + 32) containerView];
  [v3 addSubview:*(void *)(a1 + 40)];
}

uint64_t __60__CNPhotoPickerCollectionViewCell_updateWithView_animation___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.0, 1.0);
  return [v1 setTransform:&v3];
}

- (void)setCellStyle:(unint64_t)a3
{
  if (self->_cellStyle != a3)
  {
    self->_cellStyle = a3;
    [(CNPhotoPickerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)CNPhotoPickerCollectionViewCell;
  [(CNPhotoPickerCollectionViewCell *)&v36 layoutSubviews];
  CGAffineTransform v3 = [(CNPhotoPickerCollectionViewCell *)self containerView];
  [v3 bounds];
  double v5 = v4;
  id v6 = [(CNPhotoPickerCollectionViewCell *)self containerView];
  [v6 bounds];
  double v8 = v7;

  if (v5 != v8)
  {
    CGAffineTransform v9 = [(CNPhotoPickerCollectionViewCell *)self containerView];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    v16 = [(CNPhotoPickerCollectionViewCell *)self containerView];
    objc_msgSend(v16, "setFrame:", v11, v13, v15, v15);
  }
  id v17 = objc_opt_class();
  uint64_t v18 = [(CNPhotoPickerCollectionViewCell *)self containerView];
  [(id)v18 bounds];
  objc_msgSend(v17, "cornerRadiusForBounds:forCellStyle:", -[CNPhotoPickerCollectionViewCell cellStyle](self, "cellStyle"), v19, v20, v21, v22);
  double v24 = v23;
  double v25 = [(CNPhotoPickerCollectionViewCell *)self containerView];
  double v26 = [v25 layer];
  [v26 setCornerRadius:v24];

  v27 = [(CNPhotoPickerCollectionViewCell *)self selectionLayer];
  LOBYTE(v18) = [v27 isHidden];

  if ((v18 & 1) == 0)
  {
    double v28 = objc_opt_class();
    double v29 = [(CNPhotoPickerCollectionViewCell *)self containerView];
    [v29 bounds];
    uint64_t v34 = objc_msgSend(v28, "selectionPathInBounds:forCellStyle:", -[CNPhotoPickerCollectionViewCell cellStyle](self, "cellStyle"), v30, v31, v32, v33);
    double v35 = [(CNPhotoPickerCollectionViewCell *)self selectionLayer];
    [v35 setPath:v34];
  }
  [(CNPhotoPickerCollectionViewCell *)self updateCaptionFrame];
}

- (CNPhotoPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CNPhotoPickerCollectionViewCell;
  CGAffineTransform v3 = -[CNPhotoPickerCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v5 = [(CNPhotoPickerCollectionViewCell *)v3 contentView];
    [v5 bounds];
    double v7 = v6;
    double v8 = [(CNPhotoPickerCollectionViewCell *)v3 contentView];
    [v8 bounds];
    uint64_t v10 = objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v7, v9);
    containerView = v3->_containerView;
    v3->_containerView = (UIView *)v10;

    [(UIView *)v3->_containerView setClipsToBounds:1];
    double v12 = [(UIView *)v3->_containerView layer];
    [v12 setMasksToBounds:1];

    [(UIView *)v3->_containerView setAutoresizingMask:18];
    double v13 = [(CNPhotoPickerCollectionViewCell *)v3 contentView];
    [v13 addSubview:v3->_containerView];

    double v14 = v3;
  }

  return v3;
}

+ (CGPath)selectionPathInBounds:(CGRect)a3 forCellStyle:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGRect v19 = CGRectInset(a3, -6.0, -6.0);
  double v10 = v19.origin.x;
  double v11 = v19.origin.y;
  double v12 = v19.size.width;
  double v13 = v19.size.height;
  double v14 = (void *)MEMORY[0x1E4FB14C0];
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  }
  else
  {
    objc_msgSend(a1, "cornerRadiusForBounds:forCellStyle:", a4, x, y, width, height);
    objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v10, v11, v12, v13, v15);
  }
  id v16 = objc_claimAutoreleasedReturnValue();
  id v17 = (CGPath *)[v16 CGPath];

  return v17;
}

+ (double)cornerRadiusForBounds:(CGRect)a3 forCellStyle:(unint64_t)a4
{
  double v4 = 0.25;
  if (a4 == 1) {
    double v4 = 0.5;
  }
  return a3.size.width * v4;
}

+ (id)cellIdentifier
{
  return @"CNPhotoPickerCellIdentifier";
}

@end
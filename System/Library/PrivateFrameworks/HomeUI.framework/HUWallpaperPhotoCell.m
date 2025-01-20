@interface HUWallpaperPhotoCell
- (BOOL)busy;
- (BOOL)empty;
- (BOOL)removable;
- (BOOL)showBorder;
- (CAShapeLayer)borderLayer;
- (HUWallpaperPhotoCell)initWithFrame:(CGRect)a3;
- (HUWallpaperPhotoCellDelegate)delegate;
- (NSLayoutConstraint)imageWidthConstraint;
- (NSString)assetIdentifier;
- (UIActivityIndicatorView)spinnerView;
- (UIButton)deleteButton;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)choosePhotoLabel;
- (UIStackView)stackView;
- (UIView)selectionOverlayView;
- (double)cornerRadius;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)contentMode;
- (void)deleteButtonPressed;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAssetIdentifier:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderLayer:(id)a3;
- (void)setBusy:(BOOL)a3;
- (void)setChoosePhotoLabel:(id)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setImageWidthConstraint:(id)a3;
- (void)setRemovable:(BOOL)a3;
- (void)setSelectionOverlayView:(id)a3;
- (void)setShowBorder:(BOOL)a3;
- (void)setSpinnerView:(id)a3;
- (void)setStackView:(id)a3;
- (void)showBorder:(BOOL)a3 animated:(BOOL)a4;
- (void)updateView;
@end

@implementation HUWallpaperPhotoCell

- (HUWallpaperPhotoCell)initWithFrame:(CGRect)a3
{
  v65[2] = *MEMORY[0x1E4F143B8];
  v64.receiver = self;
  v64.super_class = (Class)HUWallpaperPhotoCell;
  v3 = -[HUWallpaperPhotoCell initWithFrame:](&v64, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = [(HUWallpaperPhotoCell *)v3 contentView];
    [v5 bounds];
    uint64_t v6 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    [(UIImageView *)v3->_imageView setAutoresizingMask:18];
    [(UIImageView *)v3->_imageView setContentMode:2];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    v3->_busy = 0;
    v3->_removable = 0;
    v3->_empty = 0;
    v3->_showBorder = 0;
    v3->_contentMode = 2;
    id v8 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v9 = [(HUWallpaperPhotoCell *)v3 contentView];
    [v9 bounds];
    uint64_t v10 = objc_msgSend(v8, "initWithFrame:");
    selectionOverlayView = v3->_selectionOverlayView;
    v3->_selectionOverlayView = (UIView *)v10;

    [(UIView *)v3->_selectionOverlayView setClipsToBounds:1];
    v12 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v3->_selectionOverlayView setBackgroundColor:v12];

    v13 = [(UIView *)v3->_selectionOverlayView layer];
    [v13 setCornerRadius:10.0];

    id v14 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    uint64_t v15 = [v14 CGColor];
    v16 = [(UIView *)v3->_selectionOverlayView layer];
    [v16 setBorderColor:v15];

    v17 = [(UIView *)v3->_selectionOverlayView layer];
    [v17 setBorderWidth:2.0];

    [(UIView *)v3->_selectionOverlayView setAlpha:0.0];
    uint64_t v18 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    deleteButton = v3->_deleteButton;
    v3->_deleteButton = (UIButton *)v18;

    v20 = v3->_deleteButton;
    v21 = HUImageNamed(@"deleteWallpaperButton");
    [(UIButton *)v20 setImage:v21 forState:0];

    v22 = [(UIButton *)v3->_deleteButton layer];
    [v22 setBorderWidth:3.0];

    id v23 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    uint64_t v24 = [v23 CGColor];
    v25 = [(UIButton *)v3->_deleteButton layer];
    [v25 setBorderColor:v24];

    [(UIButton *)v3->_deleteButton addTarget:v3 action:sel_deleteButtonPressed forControlEvents:64];
    id v26 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v27 = objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    choosePhotoLabel = v3->_choosePhotoLabel;
    v3->_choosePhotoLabel = (UILabel *)v27;

    v29 = _HULocalizedStringWithDefaultValue(@"HUEditLocationChoosePhotoLabelMac", @"HUEditLocationChoosePhotoLabelMac", 1);
    [(UILabel *)v3->_choosePhotoLabel setText:v29];

    v30 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
    [(UILabel *)v3->_choosePhotoLabel setTextColor:v30];

    [(UILabel *)v3->_choosePhotoLabel setHidden:1];
    [(UILabel *)v3->_choosePhotoLabel sizeToFit];
    id v31 = objc_alloc(MEMORY[0x1E4F42E20]);
    v65[0] = v3->_imageView;
    v65[1] = v3->_choosePhotoLabel;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
    uint64_t v33 = [v31 initWithArrangedSubviews:v32];
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v33;

    [(UIStackView *)v3->_stackView setAxis:1];
    [(UIStackView *)v3->_stackView setAlignment:3];
    [(UIStackView *)v3->_stackView setDistribution:3];
    [(UIStackView *)v3->_stackView setSpacing:8.0];
    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v35 = [MEMORY[0x1E4F39C88] layer];
    borderLayer = v3->_borderLayer;
    v3->_borderLayer = (CAShapeLayer *)v35;

    id v37 = [MEMORY[0x1E4F428B8] systemLightGrayColor];
    -[CAShapeLayer setStrokeColor:](v3->_borderLayer, "setStrokeColor:", [v37 CGColor]);

    [(CAShapeLayer *)v3->_borderLayer setFillColor:0];
    [(CAShapeLayer *)v3->_borderLayer setLineWidth:2.0];
    [(CAShapeLayer *)v3->_borderLayer setLineDashPattern:&unk_1F19B5978];
    v38 = [(HUWallpaperPhotoCell *)v3 contentView];
    [v38 addSubview:v3->_stackView];

    v39 = [(HUWallpaperPhotoCell *)v3 contentView];
    [v39 addSubview:v3->_selectionOverlayView];

    v40 = [(HUWallpaperPhotoCell *)v3 contentView];
    v41 = [v40 layer];
    [v41 addSublayer:v3->_borderLayer];

    id v42 = [MEMORY[0x1E4F428B8] systemBlackColor];
    uint64_t v43 = [v42 CGColor];
    v44 = [(HUWallpaperPhotoCell *)v3 contentView];
    v45 = [v44 layer];
    [v45 setBackgroundColor:v43];

    v46 = [(HUWallpaperPhotoCell *)v3 contentView];
    [v46 setAutoresizingMask:18];

    v47 = [(UIStackView *)v3->_stackView heightAnchor];
    v48 = [(HUWallpaperPhotoCell *)v3 contentView];
    v49 = [v48 heightAnchor];
    v50 = [v47 constraintLessThanOrEqualToAnchor:v49];
    [v50 setActive:1];

    v51 = [(UIStackView *)v3->_stackView widthAnchor];
    v52 = [(HUWallpaperPhotoCell *)v3 contentView];
    v53 = [v52 widthAnchor];
    v54 = [v51 constraintEqualToAnchor:v53];
    [v54 setActive:1];

    v55 = [(UIStackView *)v3->_stackView centerYAnchor];
    v56 = [(HUWallpaperPhotoCell *)v3 contentView];
    v57 = [v56 centerYAnchor];
    v58 = [v55 constraintEqualToAnchor:v57];
    [v58 setActive:1];

    v59 = [(UIImageView *)v3->_imageView widthAnchor];
    v60 = [(HUWallpaperPhotoCell *)v3 stackView];
    v61 = [v60 widthAnchor];
    v62 = [v59 constraintEqualToAnchor:v61];
    [(HUWallpaperPhotoCell *)v3 setImageWidthConstraint:v62];
  }
  return v3;
}

- (void)prepareForReuse
{
  [(HUWallpaperPhotoCell *)self setBusy:0];
  [(HUWallpaperPhotoCell *)self setEmpty:0];
  [(HUWallpaperPhotoCell *)self setRemovable:0];
  [(HUWallpaperPhotoCell *)self setShowBorder:0];
  v3 = [(HUWallpaperPhotoCell *)self choosePhotoLabel];
  [v3 setHidden:1];

  v4.receiver = self;
  v4.super_class = (Class)HUWallpaperPhotoCell;
  [(HUWallpaperPhotoCell *)&v4 prepareForReuse];
}

- (void)deleteButtonPressed
{
  v3 = [(HUWallpaperPhotoCell *)self delegate];

  if (v3)
  {
    id v4 = [(HUWallpaperPhotoCell *)self delegate];
    [v4 wallpaperPhotoCellDidPressDeleteButton:self];
  }
}

- (void)layoutSubviews
{
  v3 = [(HUWallpaperPhotoCell *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(HUWallpaperPhotoCell *)self selectionOverlayView];
  objc_msgSend(v12, "setFrame:", v5 + -4.0, v7 + -4.0, v9 + 8.0, v11 + 8.0);

  v13 = [(HUWallpaperPhotoCell *)self contentView];
  [v13 origin];
  double v15 = v14 + -8.0;
  v16 = [(HUWallpaperPhotoCell *)self contentView];
  [v16 origin];
  double v18 = v17 + -8.0;
  v19 = [(HUWallpaperPhotoCell *)self deleteButton];
  objc_msgSend(v19, "setFrame:", v15, v18, 26.0, 26.0);

  v20 = [(HUWallpaperPhotoCell *)self deleteButton];
  objc_msgSend(v20, "setContentEdgeInsets:", 3.0, 3.0, 3.0, 3.0);

  id v25 = [(HUWallpaperPhotoCell *)self deleteButton];
  [v25 frame];
  double v22 = v21 * 0.5;
  id v23 = [(HUWallpaperPhotoCell *)self deleteButton];
  uint64_t v24 = [v23 layer];
  [v24 setCornerRadius:v22];
}

- (void)updateView
{
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    if ([(HUWallpaperPhotoCell *)self showBorder] && ![(HUWallpaperPhotoCell *)self empty])
    {
      double v15 = [(HUWallpaperPhotoCell *)self selectionOverlayView];
      v16 = v15;
      double v17 = 1.0;
    }
    else
    {
      if ([(HUWallpaperPhotoCell *)self empty])
      {
        v3 = [MEMORY[0x1E4F428B8] labelColor];
        double v4 = [(HUWallpaperPhotoCell *)self imageView];
        [v4 setTintColor:v3];

        double v5 = [(HUWallpaperPhotoCell *)self imageView];
        [v5 _setContinuousCornerRadius:0.0];

        double v6 = [(HUWallpaperPhotoCell *)self choosePhotoLabel];
        [v6 setHidden:0];

        double v7 = [(HUWallpaperPhotoCell *)self imageWidthConstraint];
        double v8 = v7;
        uint64_t v9 = 0;
      }
      else
      {
        double v10 = [(HUWallpaperPhotoCell *)self imageView];
        [v10 setTintColor:0];

        [(HUWallpaperPhotoCell *)self cornerRadius];
        double v12 = v11 / 1.5;
        v13 = [(HUWallpaperPhotoCell *)self imageView];
        [v13 _setContinuousCornerRadius:v12];

        double v14 = [(HUWallpaperPhotoCell *)self choosePhotoLabel];
        [v14 setHidden:1];

        double v7 = [(HUWallpaperPhotoCell *)self imageWidthConstraint];
        double v8 = v7;
        uint64_t v9 = 1;
      }
      [v7 setActive:v9];

      double v15 = [(HUWallpaperPhotoCell *)self selectionOverlayView];
      v16 = v15;
      double v17 = 0.0;
    }
    [v15 setAlpha:v17];

    [(HUWallpaperPhotoCell *)self cornerRadius];
    double v19 = v18;
    v20 = [(HUWallpaperPhotoCell *)self selectionOverlayView];
    [v20 _setCornerRadius:v19];

    if ([(HUWallpaperPhotoCell *)self removable])
    {
      double v21 = [(HUWallpaperPhotoCell *)self contentView];
      double v22 = [(HUWallpaperPhotoCell *)self deleteButton];
      [v21 addSubview:v22];
    }
    else
    {
      if ([(HUWallpaperPhotoCell *)self removable]) {
        goto LABEL_14;
      }
      double v21 = [(HUWallpaperPhotoCell *)self deleteButton];
      [v21 removeFromSuperview];
    }
  }
LABEL_14:
  BOOL v23 = [(HUWallpaperPhotoCell *)self busy];
  uint64_t v24 = [(HUWallpaperPhotoCell *)self spinnerView];
  id v25 = v24;
  if (v23)
  {

    if (!v25)
    {
      id v26 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:101];
      [(HUWallpaperPhotoCell *)self setSpinnerView:v26];

      uint64_t v27 = [(HUWallpaperPhotoCell *)self spinnerView];
      [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    v28 = [(HUWallpaperPhotoCell *)self spinnerView];
    [v28 startAnimating];

    v29 = [(HUWallpaperPhotoCell *)self contentView];
    v30 = [(HUWallpaperPhotoCell *)self spinnerView];
    [v29 addSubview:v30];

    id v31 = [(HUWallpaperPhotoCell *)self spinnerView];
    v32 = [v31 centerXAnchor];
    uint64_t v33 = [(HUWallpaperPhotoCell *)self contentView];
    v34 = [v33 centerXAnchor];
    uint64_t v35 = [v32 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(HUWallpaperPhotoCell *)self spinnerView];
    id v37 = [v36 centerYAnchor];
    v38 = [(HUWallpaperPhotoCell *)self contentView];
    v39 = [v38 centerYAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    [v40 setActive:1];
  }
  else
  {
    [v24 stopAnimating];

    v36 = [(HUWallpaperPhotoCell *)self spinnerView];
    [v36 removeFromSuperview];
  }

  v41 = (void *)MEMORY[0x1E4F427D0];
  id v42 = [(HUWallpaperPhotoCell *)self contentView];
  [v42 bounds];
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  [(HUWallpaperPhotoCell *)self cornerRadius];
  objc_msgSend(v41, "bezierPathWithRoundedRect:cornerRadius:", v44, v46, v48, v50, v51);
  id v52 = objc_claimAutoreleasedReturnValue();
  uint64_t v53 = [v52 CGPath];
  v54 = [(HUWallpaperPhotoCell *)self borderLayer];
  [v54 setPath:v53];

  v55 = [(HUWallpaperPhotoCell *)self contentView];
  [v55 bounds];
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;
  objc_super v64 = [(HUWallpaperPhotoCell *)self borderLayer];
  objc_msgSend(v64, "setFrame:", v57, v59, v61, v63);

  uint64_t v65 = [(HUWallpaperPhotoCell *)self empty] ^ 1;
  v66 = [(HUWallpaperPhotoCell *)self borderLayer];
  [v66 setHidden:v65];

  if (([(HUWallpaperPhotoCell *)self isHighlighted] & 1) != 0
    || (double v67 = 1.0, [(HUWallpaperPhotoCell *)self busy]))
  {
    if ([(HUWallpaperPhotoCell *)self empty]) {
      double v67 = 1.0;
    }
    else {
      double v67 = 0.5;
    }
  }
  v68 = [(HUWallpaperPhotoCell *)self imageView];
  [v68 setAlpha:v67];

  [(HUWallpaperPhotoCell *)self setNeedsLayout];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(HUWallpaperPhotoCell *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)HUWallpaperPhotoCell;
    [(HUWallpaperPhotoCell *)&v5 setHighlighted:v3];
    [(HUWallpaperPhotoCell *)self updateView];
  }
}

- (void)setBusy:(BOOL)a3
{
  if (self->_busy != a3)
  {
    self->_busy = a3;
    [(HUWallpaperPhotoCell *)self updateView];
  }
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    self->_empty = a3;
    [(HUWallpaperPhotoCell *)self updateView];
  }
}

- (void)setRemovable:(BOOL)a3
{
  if (self->_removable != a3)
  {
    self->_removable = a3;
    [(HUWallpaperPhotoCell *)self updateView];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(HUWallpaperPhotoCell *)self updateView];
  }
}

- (void)setBackgroundColor:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HUWallpaperPhotoCell;
  id v4 = a3;
  [(HUWallpaperPhotoCell *)&v9 setBackgroundColor:v4];
  id v5 = v4;
  uint64_t v6 = objc_msgSend(v5, "CGColor", v9.receiver, v9.super_class);

  double v7 = [(HUWallpaperPhotoCell *)self contentView];
  double v8 = [v7 layer];
  [v8 setBackgroundColor:v6];
}

- (void)setShowBorder:(BOOL)a3
{
}

- (void)showBorder:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showBorder != a3)
  {
    self->_showBorder = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __44__HUWallpaperPhotoCell_showBorder_animated___block_invoke;
      v4[3] = &unk_1E6386018;
      v4[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v4 options:0 animations:0.1 completion:0.0];
    }
    else
    {
      [(HUWallpaperPhotoCell *)self updateView];
    }
  }
}

uint64_t __44__HUWallpaperPhotoCell_showBorder_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateView];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (UIImage)image
{
  if ([(HUWallpaperPhotoCell *)self empty])
  {
    BOOL v3 = [(HUWallpaperPhotoCell *)self imageView];
    id v4 = [v3 image];
  }
  else
  {
    id v4 = 0;
  }

  return (UIImage *)v4;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(HUWallpaperPhotoCell *)self imageView];
  [v5 setImage:v4];
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
  id v4 = [(HUWallpaperPhotoCell *)self imageView];
  [v4 setContentMode:a3];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUWallpaperPhotoCell;
  double v8 = -[HUWallpaperPhotoCell hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  if (!v8)
  {
    double v8 = [(HUWallpaperPhotoCell *)self deleteButton];

    if (v8)
    {
      objc_super v9 = [(HUWallpaperPhotoCell *)self deleteButton];
      double v10 = [(HUWallpaperPhotoCell *)self deleteButton];
      -[HUWallpaperPhotoCell convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
      double v8 = objc_msgSend(v9, "hitTest:withEvent:", v7);
    }
  }

  return v8;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (BOOL)busy
{
  return self->_busy;
}

- (BOOL)empty
{
  return self->_empty;
}

- (BOOL)removable
{
  return self->_removable;
}

- (BOOL)showBorder
{
  return self->_showBorder;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (HUWallpaperPhotoCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUWallpaperPhotoCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (UIView)selectionOverlayView
{
  return self->_selectionOverlayView;
}

- (void)setSelectionOverlayView:(id)a3
{
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (UILabel)choosePhotoLabel
{
  return self->_choosePhotoLabel;
}

- (void)setChoosePhotoLabel:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (CAShapeLayer)borderLayer
{
  return self->_borderLayer;
}

- (void)setBorderLayer:(id)a3
{
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_choosePhotoLabel, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_selectionOverlayView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end
@interface PDFIconCollectionViewCell_iOS
- (PDFIconCollectionViewCell_iOS)initWithCoder:(id)a3;
- (PDFIconCollectionViewCell_iOS)initWithFrame:(CGRect)a3;
- (PDFPage)page;
- (UIButton)actionsButton;
- (UIImageView)imageView;
- (void)_commonInit;
- (void)prepareForReuse;
- (void)setActionsButton:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPage:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setThumbnailHeight:(double)a3;
- (void)setThumbnailWidth:(double)a3;
- (void)setupSubviews;
- (void)updateAspectConstraintWithSize:(CGSize)a3;
- (void)updateOverlay;
@end

@implementation PDFIconCollectionViewCell_iOS

- (PDFIconCollectionViewCell_iOS)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDFIconCollectionViewCell_iOS;
  v3 = -[PDFIconCollectionViewCell_iOS initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PDFIconCollectionViewCell_iOS *)v3 _commonInit];
  }
  return v4;
}

- (PDFIconCollectionViewCell_iOS)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDFIconCollectionViewCell_iOS;
  v3 = [(PDFIconCollectionViewCell_iOS *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PDFIconCollectionViewCell_iOS *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(PDFIconCollectionViewCell_iOS *)self setupSubviews];
  uint64_t v3 = *MEMORY[0x263F15A20];
  v4 = [(PDFIconCollectionViewCell_iOS *)self layer];
  [v4 setCornerCurve:v3];

  v5 = [(PDFIconCollectionViewCell_iOS *)self layer];
  [v5 setCornerRadius:3.0];

  objc_super v6 = [(PDFIconCollectionViewCell_iOS *)self layer];
  [v6 setMasksToBounds:1];

  [(PDFIconCollectionViewCell_iOS *)self updateOverlay];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PDFIconCollectionViewCell_iOS;
  [(PDFIconCollectionViewCell_iOS *)&v5 prepareForReuse];
  if (self->_ratioConstraint)
  {
    uint64_t v3 = [(PDFIconCollectionViewCell_iOS *)self imageView];
    [v3 removeConstraint:self->_ratioConstraint];
  }
  v4 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  [v4 setImage:0];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PDFIconCollectionViewCell_iOS;
  [(PDFIconCollectionViewCell_iOS *)&v4 setSelected:a3];
  [(PDFIconCollectionViewCell_iOS *)self updateOverlay];
}

- (void)updateOverlay
{
  uint64_t v3 = [(PDFIconCollectionViewCell_iOS *)self isSelected] ^ 1;
  overlayView = self->_overlayView;

  [(UIView *)overlayView setHidden:v3];
}

- (void)setupSubviews
{
  v82[8] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  [(PDFIconCollectionViewCell_iOS *)self bounds];
  objc_super v4 = objc_msgSend(v3, "initWithFrame:");
  [(PDFIconCollectionViewCell_iOS *)self setImageView:v4];

  objc_super v5 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  [v5 setContentMode:0];

  uint64_t v6 = *MEMORY[0x263F15A20];
  v7 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  v8 = [v7 layer];
  [v8 setCornerCurve:v6];

  v9 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  v10 = [v9 layer];
  [v10 setCornerRadius:2.0];

  v11 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  v12 = [v11 layer];
  [v12 setMasksToBounds:1];

  v13 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  v14 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  [v13 addSubview:v14];

  v15 = (UIView *)objc_opt_new();
  overlayView = self->_overlayView;
  self->_overlayView = v15;

  v17 = [MEMORY[0x263F825C8] blackColor];
  v18 = [v17 colorWithAlphaComponent:0.3];
  [(UIView *)self->_overlayView setBackgroundColor:v18];

  v19 = [(UIView *)self->_overlayView layer];
  [v19 setCornerCurve:v6];

  v20 = [(UIView *)self->_overlayView layer];
  [v20 setCornerRadius:2.0];

  [(UIView *)self->_overlayView setHidden:1];
  v21 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  [v21 addSubview:self->_overlayView];

  v22 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(UIView *)self->_overlayView setTranslatesAutoresizingMaskIntoConstraints:0];
  v59 = (void *)MEMORY[0x263F08938];
  v79 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  v75 = [v79 bottomAnchor];
  v77 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  v73 = [v77 bottomAnchor];
  v71 = [v75 constraintEqualToAnchor:v73 constant:-3.0];
  v82[0] = v71;
  v69 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  v67 = [v69 topAnchor];
  v68 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  v66 = [v68 topAnchor];
  v65 = [v67 constraintEqualToAnchor:v66 constant:3.0];
  v82[1] = v65;
  v64 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  v62 = [v64 leadingAnchor];
  v63 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  v61 = [v63 leadingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:3.0];
  v82[2] = v60;
  v58 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  v56 = [v58 trailingAnchor];
  v57 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  v55 = [v57 trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:-3.0];
  v82[3] = v54;
  v52 = [(UIView *)self->_overlayView bottomAnchor];
  v53 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  v51 = [v53 bottomAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v82[4] = v50;
  v48 = [(UIView *)self->_overlayView topAnchor];
  v49 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  v47 = [v49 topAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v82[5] = v46;
  v23 = [(UIView *)self->_overlayView leadingAnchor];
  v24 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  v25 = [v24 leadingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v82[6] = v26;
  v27 = [(UIView *)self->_overlayView trailingAnchor];
  v28 = [(PDFIconCollectionViewCell_iOS *)self contentView];
  v29 = [v28 trailingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  v82[7] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:8];
  [v59 activateConstraints:v31];

  id v32 = objc_alloc(MEMORY[0x263F824E8]);
  v33 = (UIButton *)objc_msgSend(v32, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  actionsButton = self->_actionsButton;
  self->_actionsButton = v33;

  v80 = [MEMORY[0x263F827E8] systemImageNamed:@"ellipsis.circle.fill"];
  v78 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  [v78 setImage:v80];
  [(UIButton *)self->_actionsButton setConfiguration:v78];
  v35 = [MEMORY[0x263F825C8] whiteColor];
  [(UIButton *)self->_actionsButton setTintColor:v35];

  [(UIView *)self->_overlayView addSubview:self->_actionsButton];
  [(UIButton *)self->_actionsButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v70 = (void *)MEMORY[0x263F08938];
  v76 = [(UIButton *)self->_actionsButton widthAnchor];
  v74 = [(UIView *)self->_overlayView widthAnchor];
  v72 = [v76 constraintEqualToAnchor:v74];
  v81[0] = v72;
  v36 = [(UIButton *)self->_actionsButton heightAnchor];
  v37 = [(UIView *)self->_overlayView heightAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  v81[1] = v38;
  v39 = [(UIButton *)self->_actionsButton centerXAnchor];
  v40 = [(UIView *)self->_overlayView centerXAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v81[2] = v41;
  v42 = [(UIButton *)self->_actionsButton centerYAnchor];
  v43 = [(UIView *)self->_overlayView centerYAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v81[3] = v44;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
  [v70 activateConstraints:v45];
}

- (void)updateAspectConstraintWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v18[1] = *MEMORY[0x263EF8340];
  if (self->_ratioConstraint)
  {
    uint64_t v6 = [(PDFIconCollectionViewCell_iOS *)self imageView];
    [v6 removeConstraint:self->_ratioConstraint];
  }
  double v7 = height / width;
  if (fabs(height / width) == INFINITY) {
    double v7 = 1.0;
  }
  if (v7 < 0.5) {
    double v7 = 0.5;
  }
  double v8 = fmin(v7, 2.0);
  v9 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  v10 = [v9 heightAnchor];
  v11 = [(PDFIconCollectionViewCell_iOS *)self imageView];
  v12 = [v11 widthAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 multiplier:v8 constant:0.0];
  ratioConstraint = self->_ratioConstraint;
  self->_ratioConstraint = v13;

  LODWORD(v15) = 1148829696;
  [(NSLayoutConstraint *)self->_ratioConstraint setPriority:v15];
  v16 = (void *)MEMORY[0x263F08938];
  v18[0] = self->_ratioConstraint;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [v16 activateConstraints:v17];
}

- (void)setThumbnailWidth:(double)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  [(NSLayoutConstraint *)self->_imageViewWidthConstraint constant];
  if (v5 != a3)
  {
    imageViewWidthConstraint = self->_imageViewWidthConstraint;
    if (imageViewWidthConstraint)
    {
      [(NSLayoutConstraint *)imageViewWidthConstraint setConstant:a3];
    }
    else
    {
      double v7 = [(PDFIconCollectionViewCell_iOS *)self contentView];
      double v8 = [v7 widthAnchor];
      v9 = [v8 constraintEqualToConstant:a3];
      v10 = self->_imageViewWidthConstraint;
      self->_imageViewWidthConstraint = v9;

      v11 = (void *)MEMORY[0x263F08938];
      v14[0] = self->_imageViewWidthConstraint;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      [v11 activateConstraints:v12];

      LODWORD(v13) = 1148829696;
      [(NSLayoutConstraint *)self->_imageViewWidthConstraint setPriority:v13];
    }
  }
}

- (void)setThumbnailHeight:(double)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  [(NSLayoutConstraint *)self->_imageViewHeightConstraint constant];
  if (v5 != a3)
  {
    imageViewHeightConstraint = self->_imageViewHeightConstraint;
    if (imageViewHeightConstraint)
    {
      [(NSLayoutConstraint *)imageViewHeightConstraint setConstant:a3];
    }
    else
    {
      double v7 = [(PDFIconCollectionViewCell_iOS *)self contentView];
      double v8 = [v7 heightAnchor];
      v9 = [v8 constraintEqualToConstant:a3];
      v10 = self->_imageViewHeightConstraint;
      self->_imageViewHeightConstraint = v9;

      v11 = (void *)MEMORY[0x263F08938];
      v14[0] = self->_imageViewHeightConstraint;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      [v11 activateConstraints:v12];

      LODWORD(v13) = 1148829696;
      [(NSLayoutConstraint *)self->_imageViewHeightConstraint setPriority:v13];
    }
  }
}

- (UIButton)actionsButton
{
  return self->_actionsButton;
}

- (void)setActionsButton:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (PDFPage)page
{
  return self->_page;
}

- (void)setPage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_actionsButton, 0);
  objc_storeStrong((id *)&self->_imageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_ratioConstraint, 0);

  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end
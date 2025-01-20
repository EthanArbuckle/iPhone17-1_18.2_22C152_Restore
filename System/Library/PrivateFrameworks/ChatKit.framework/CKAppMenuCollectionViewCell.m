@interface CKAppMenuCollectionViewCell
- (CKAppMenuCollectionViewCell)initWithFrame:(CGRect)a3;
- (CKAppMenuCollectionViewCellDelegate)delegate;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIView)selectionView;
- (void)didHoverOverCell:(id)a3;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionView:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CKAppMenuCollectionViewCell

- (CKAppMenuCollectionViewCell)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CKAppMenuCollectionViewCell;
  v3 = -[CKAppMenuCollectionViewCell initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(CKAppMenuCollectionViewCell *)v3 setTitleLabel:v9];

    v10 = [(CKAppMenuCollectionViewCell *)v3 titleLabel];
    v11 = +[CKUIBehavior sharedBehaviors];
    v12 = [v11 appMenuTitleFont];
    [v10 setFont:v12];

    v13 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    v14 = [(CKAppMenuCollectionViewCell *)v3 titleLabel];
    [v14 setTextColor:v13];

    v15 = [(CKAppMenuCollectionViewCell *)v3 contentView];
    v16 = [(CKAppMenuCollectionViewCell *)v3 titleLabel];
    [v15 addSubview:v16];

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v5, v6, v7, v8);
    [(CKAppMenuCollectionViewCell *)v3 setImageView:v17];

    v18 = [(CKAppMenuCollectionViewCell *)v3 contentView];
    v19 = [(CKAppMenuCollectionViewCell *)v3 imageView];
    [v18 addSubview:v19];

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v6, v7, v8);
    [(CKAppMenuCollectionViewCell *)v3 setSelectionView:v20];

    v21 = +[CKUIBehavior sharedBehaviors];
    v22 = [v21 theme];
    v23 = [v22 appTintColor];
    v24 = [(CKAppMenuCollectionViewCell *)v3 selectionView];
    [v24 setBackgroundColor:v23];

    v25 = [(CKAppMenuCollectionViewCell *)v3 selectionView];
    [v25 setAlpha:0.0];

    v26 = [(CKAppMenuCollectionViewCell *)v3 contentView];
    v27 = [(CKAppMenuCollectionViewCell *)v3 selectionView];
    [v26 insertSubview:v27 atIndex:0];

    v28 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v3 action:sel_didHoverOverCell_];
    [(CKAppMenuCollectionViewCell *)v3 addGestureRecognizer:v28];
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_handleTap_];
    [(CKAppMenuCollectionViewCell *)v3 addGestureRecognizer:v29];
  }
  return v3;
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)CKAppMenuCollectionViewCell;
  [(CKAppMenuCollectionViewCell *)&v48 layoutSubviews];
  v3 = +[CKUIBehavior sharedBehaviors];
  [v3 iMessageAppIconSize];
  double v5 = v4;
  double v7 = v6;

  [(CKAppMenuCollectionViewCell *)self layoutMargins];
  double v9 = v8;
  v10 = [(CKAppMenuCollectionViewCell *)self contentView];
  [v10 frame];
  CGFloat v11 = CGRectGetMidY(v49) - v7 * 0.5;
  v12 = [(CKAppMenuCollectionViewCell *)self imageView];
  objc_msgSend(v12, "setFrame:", v9, v11, v5, v7);

  v13 = [(CKAppMenuCollectionViewCell *)self titleLabel];
  [v13 intrinsicContentSize];
  double v15 = v14;

  v16 = [(CKAppMenuCollectionViewCell *)self contentView];
  [v16 frame];
  double v18 = v17;
  [(CKAppMenuCollectionViewCell *)self layoutMargins];
  double v20 = v18 - v19;
  v21 = [(CKAppMenuCollectionViewCell *)self imageView];
  [v21 frame];
  double v22 = v20 - CGRectGetMaxX(v50);
  [(CKAppMenuCollectionViewCell *)self layoutMargins];
  double v24 = v22 - v23;

  if (v15 >= v24) {
    double v15 = v24;
  }
  v25 = [(CKAppMenuCollectionViewCell *)self imageView];
  [v25 frame];
  double MaxX = CGRectGetMaxX(v51);
  [(CKAppMenuCollectionViewCell *)self layoutMargins];
  double v28 = MaxX + v27;
  v29 = [(CKAppMenuCollectionViewCell *)self contentView];
  [v29 frame];
  double MidY = CGRectGetMidY(v52);
  objc_super v31 = [(CKAppMenuCollectionViewCell *)self titleLabel];
  [v31 intrinsicContentSize];
  double v33 = MidY - v32 * 0.5;
  v34 = [(CKAppMenuCollectionViewCell *)self titleLabel];
  [v34 intrinsicContentSize];
  double v36 = v35;
  v37 = [(CKAppMenuCollectionViewCell *)self titleLabel];
  objc_msgSend(v37, "setFrame:", v28, v33, v15, v36);

  v38 = [(CKAppMenuCollectionViewCell *)self contentView];
  [v38 bounds];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  v47 = [(CKAppMenuCollectionViewCell *)self selectionView];
  objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);
}

- (void)didHoverOverCell:(id)a3
{
  id v4 = a3;
  id v6 = [(CKAppMenuCollectionViewCell *)self delegate];
  uint64_t v5 = [v4 state];

  [v6 appMenuCollectionViewCell:self didHoverWithState:v5];
}

- (void)handleTap:(id)a3
{
  id v4 = [(CKAppMenuCollectionViewCell *)self delegate];
  [v4 appMenuCollectionViewCellWasTapped:self];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKAppMenuCollectionViewCell;
  -[CKAppMenuCollectionViewCell setSelected:](&v8, sel_setSelected_);
  uint64_t v5 = [(CKAppMenuCollectionViewCell *)self selectionView];
  [v5 setAlpha:(double)v3];

  if (v3) {
    [MEMORY[0x1E4F428B8] whiteColor];
  }
  else {
  id v6 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  double v7 = [(CKAppMenuCollectionViewCell *)self titleLabel];
  [v7 setTextColor:v6];
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

- (CKAppMenuCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAppMenuCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)selectionView
{
  return self->_selectionView;
}

- (void)setSelectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
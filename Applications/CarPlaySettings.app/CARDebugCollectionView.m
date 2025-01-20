@interface CARDebugCollectionView
- (BOOL)actioned;
- (BOOL)canBecomeFocused;
- (BOOL)isCellFocused;
- (BOOL)isCellHighlighted;
- (BOOL)isCellSelected;
- (CARDebugCollectionConfig)config;
- (CARDebugCollectionView)initWithConfig:(id)a3 color:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (UIImageView)actionedImageView;
- (UIImageView)selectedImageView;
- (void)_updateColors;
- (void)action;
- (void)setActioned:(BOOL)a3;
- (void)setActionedImageView:(id)a3;
- (void)setCellFocused:(BOOL)a3;
- (void)setCellHighlighted:(BOOL)a3;
- (void)setCellSelected:(BOOL)a3;
- (void)setConfig:(id)a3;
- (void)setSelectedImageView:(id)a3;
@end

@implementation CARDebugCollectionView

- (CARDebugCollectionView)initWithConfig:(id)a3 color:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v45.receiver = self;
  v45.super_class = (Class)CARDebugCollectionView;
  v9 = -[CARDebugCollectionView initWithFrame:](&v45, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_config, a3);
    [(CARDebugCollectionView *)v10 setBackgroundColor:v8];
    v11 = [(CARDebugCollectionView *)v10 layer];
    [v11 setBorderWidth:2.0];

    id v12 = objc_alloc((Class)UIImageView);
    +[UIImage systemImageNamed:@"circle.fill"];
    v13 = id v43 = v8;
    v14 = (UIImageView *)[v12 initWithImage:v13];
    id v44 = v7;
    actionedImageView = v10->_actionedImageView;
    v10->_actionedImageView = v14;

    [(UIImageView *)v10->_actionedImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CARDebugCollectionView *)v10 addSubview:v10->_actionedImageView];
    [(UIImageView *)v10->_actionedImageView setHidden:1];
    v16 = +[UIColor _carSystemFocusSecondaryColor];
    [(UIImageView *)v10->_actionedImageView setTintColor:v16];

    id v17 = objc_alloc((Class)UIImageView);
    v18 = +[UIImage systemImageNamed:@"checkmark.circle"];
    v19 = (UIImageView *)[v17 initWithImage:v18];
    selectedImageView = v10->_selectedImageView;
    v10->_selectedImageView = v19;

    [(UIImageView *)v10->_selectedImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CARDebugCollectionView *)v10 addSubview:v10->_selectedImageView];
    [(UIImageView *)v10->_selectedImageView setHidden:1];
    v42 = [(UIImageView *)v10->_selectedImageView centerXAnchor];
    v41 = [(CARDebugCollectionView *)v10 centerXAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v46[0] = v40;
    v39 = [(UIImageView *)v10->_selectedImageView centerYAnchor];
    v38 = [(CARDebugCollectionView *)v10 centerYAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v46[1] = v37;
    v36 = [(UIImageView *)v10->_selectedImageView heightAnchor];
    v35 = [v36 constraintEqualToConstant:20.0];
    v46[2] = v35;
    v34 = [(UIImageView *)v10->_selectedImageView widthAnchor];
    v33 = [v34 constraintEqualToConstant:20.0];
    v46[3] = v33;
    v32 = [(UIImageView *)v10->_actionedImageView centerXAnchor];
    v31 = [(CARDebugCollectionView *)v10 centerXAnchor];
    v21 = [v32 constraintEqualToAnchor:v31];
    v46[4] = v21;
    v22 = [(UIImageView *)v10->_actionedImageView centerYAnchor];
    v23 = [(CARDebugCollectionView *)v10 centerYAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v46[5] = v24;
    v25 = [(UIImageView *)v10->_actionedImageView heightAnchor];
    v26 = [v25 constraintEqualToConstant:20.0];
    v46[6] = v26;
    v27 = [(UIImageView *)v10->_actionedImageView widthAnchor];
    v28 = [v27 constraintEqualToConstant:20.0];
    v46[7] = v28;
    v29 = +[NSArray arrayWithObjects:v46 count:8];
    +[NSLayoutConstraint activateConstraints:v29];

    id v7 = v44;
    id v8 = v43;

    [(CARDebugCollectionView *)v10 _updateColors];
  }

  return v10;
}

- (void)action
{
  uint64_t v3 = [(CARDebugCollectionView *)self actioned] ^ 1;

  [(CARDebugCollectionView *)self setActioned:v3];
}

- (void)setActioned:(BOOL)a3
{
  if (self->_actioned != a3)
  {
    self->_actioned = a3;
    BOOL v3 = !a3;
    id v4 = [(CARDebugCollectionView *)self actionedImageView];
    [v4 setHidden:v3];
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CARDebugCollectionView *)self config];
  [v2 intrinsictContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  double v3 = [(CARDebugCollectionView *)self config];
  [v3 systemLayoutSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_updateColors
{
  if ([(CARDebugCollectionView *)self isCellFocused]) {
    +[UIColor _carSystemFocusColor];
  }
  else {
  id v5 = +[UIColor labelColor];
  }
  id v3 = [v5 CGColor];
  double v4 = [(CARDebugCollectionView *)self layer];
  [v4 setBorderColor:v3];

  [(UIImageView *)self->_selectedImageView setTintColor:v5];
}

- (void)setCellFocused:(BOOL)a3
{
  if (self->_cellFocused != a3)
  {
    self->_cellFocused = a3;
    [(CARDebugCollectionView *)self _updateColors];
  }
}

- (void)setCellSelected:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(CARDebugCollectionView *)self selectedImageView];
  [v4 setHidden:v3];
}

- (BOOL)isCellSelected
{
  v2 = [(CARDebugCollectionView *)self selectedImageView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setCellHighlighted:(BOOL)a3
{
  if (a3) {
    [(CARDebugCollectionView *)self setAlpha:0.5];
  }
  else {
    [(CARDebugCollectionView *)self setAlpha:1.0];
  }
}

- (BOOL)isCellHighlighted
{
  [(CARDebugCollectionView *)self alpha];
  return v2 == 0.5;
}

- (BOOL)isCellFocused
{
  return self->_cellFocused;
}

- (CARDebugCollectionConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (BOOL)actioned
{
  return self->_actioned;
}

- (UIImageView)selectedImageView
{
  return self->_selectedImageView;
}

- (void)setSelectedImageView:(id)a3
{
}

- (UIImageView)actionedImageView
{
  return self->_actionedImageView;
}

- (void)setActionedImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionedImageView, 0);
  objc_storeStrong((id *)&self->_selectedImageView, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end
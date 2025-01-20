@interface MUPunchoutCollectionViewCell
+ (id)reuseIdentifier;
- (MUPunchoutCollectionViewCell)initWithFrame:(CGRect)a3;
- (MUPunchoutViewModel)viewModel;
- (void)_setupContentView;
- (void)beginAnimatingActivityIndicator;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MUPunchoutCollectionViewCell

- (MUPunchoutCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MUPunchoutCollectionViewCell;
  v3 = -[MUPunchoutCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(MUPunchoutCollectionViewCell *)v3 setAccessibilityIdentifier:v5];

    [(MUPunchoutCollectionViewCell *)v3 _setupContentView];
    [(UIView *)v3 _mapsui_setCardCorner];
  }
  return v3;
}

- (void)_setupContentView
{
  v3 = [MUPunchoutView alloc];
  v4 = -[MUPunchoutView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  punchoutView = self->_punchoutView;
  self->_punchoutView = v4;

  [(MUPunchoutView *)self->_punchoutView setClipsToBounds:1];
  v6 = [(MUPunchoutCollectionViewCell *)self contentView];
  [v6 addSubview:self->_punchoutView];

  objc_super v7 = [(MUPunchoutCollectionViewCell *)self contentView];
  objc_msgSend(v7, "_mapsui_setCardCorner");

  v8 = [MUEdgeLayout alloc];
  v9 = self->_punchoutView;
  id v11 = [(MUPunchoutCollectionViewCell *)self contentView];
  v10 = [(MUEdgeLayout *)v8 initWithItem:v9 container:v11];
  [(MUConstraintLayout *)v10 activate];
}

- (void)setViewModel:(id)a3
{
}

- (MUPunchoutViewModel)viewModel
{
  return [(MUPunchoutView *)self->_punchoutView viewModel];
}

- (void)beginAnimatingActivityIndicator
{
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
}

@end
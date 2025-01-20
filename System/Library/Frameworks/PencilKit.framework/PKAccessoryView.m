@interface PKAccessoryView
- (BOOL)showsDragIndicator;
- (PKAccessoryView)initWithFrame:(CGRect)a3;
- (PKDragIndicatorView)dragIndicatorView;
- (double)scalingFactor;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setDragIndicatorView:(id)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setScalingFactor:(double)a3;
- (void)setShowsDragIndicator:(BOOL)a3;
@end

@implementation PKAccessoryView

- (PKAccessoryView)initWithFrame:(CGRect)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKAccessoryView;
  v3 = -[PKAccessoryView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PKDragIndicatorView);
    dragIndicatorView = v3->_dragIndicatorView;
    v3->_dragIndicatorView = v4;

    [(PKDragIndicatorView *)v3->_dragIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKAccessoryView *)v3 addSubview:v3->_dragIndicatorView];
    v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = [(PKDragIndicatorView *)v3->_dragIndicatorView centerXAnchor];
    v8 = [(PKAccessoryView *)v3 centerXAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v16[0] = v9;
    v10 = [(PKDragIndicatorView *)v3->_dragIndicatorView centerYAnchor];
    v11 = [(PKAccessoryView *)v3 centerYAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v16[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [v6 activateConstraints:v13];

    [(PKAccessoryView *)v3 setShowsDragIndicator:1];
  }
  return v3;
}

- (BOOL)showsDragIndicator
{
  v2 = [(PKAccessoryView *)self dragIndicatorView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setShowsDragIndicator:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(PKAccessoryView *)self dragIndicatorView];
  [v4 setHidden:v3];
}

- (unint64_t)edgeLocation
{
  v2 = [(PKAccessoryView *)self dragIndicatorView];
  unint64_t v3 = [v2 edgeLocation];

  return v3;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  id v4 = [(PKAccessoryView *)self dragIndicatorView];
  [v4 setEdgeLocation:a3];
}

- (void)setScalingFactor:(double)a3
{
  id v4 = [(PKAccessoryView *)self dragIndicatorView];
  [v4 setScalingFactor:a3];
}

- (double)scalingFactor
{
  v2 = [(PKAccessoryView *)self dragIndicatorView];
  [v2 scalingFactor];
  double v4 = v3;

  return v4;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (PKDragIndicatorView)dragIndicatorView
{
  return self->_dragIndicatorView;
}

- (void)setDragIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
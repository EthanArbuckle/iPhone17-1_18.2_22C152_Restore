@interface _MKStackingPlaceholderView
- (_MKStackingPlaceholderView)initWithHeight:(double)a3;
- (double)contentHeight;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setContentHeight:(double)a3;
@end

@implementation _MKStackingPlaceholderView

- (_MKStackingPlaceholderView)initWithHeight:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_MKStackingPlaceholderView;
  v4 = -[_MKStackingPlaceholderView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v6 = [(_MKStackingPlaceholderView *)v4 heightAnchor];
    uint64_t v7 = [v6 constraintEqualToConstant:a3];
    contentHeightConstraint = v5->_contentHeightConstraint;
    v5->_contentHeightConstraint = (NSLayoutConstraint *)v7;

    [(NSLayoutConstraint *)v5->_contentHeightConstraint setActive:1];
  }
  return v5;
}

- (double)contentHeight
{
  [(NSLayoutConstraint *)self->_contentHeightConstraint constant];
  return result;
}

- (void)setContentHeight:(double)a3
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

@end
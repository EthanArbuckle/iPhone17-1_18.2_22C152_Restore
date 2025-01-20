@interface _MURatingCellItem
- (BOOL)shouldApplyWidthConstraint;
- (UIView)ratingView;
- (double)preferredWidth;
- (void)setPreferredWidth:(double)a3;
- (void)setRatingView:(id)a3;
- (void)setShouldApplyWidthConstraint:(BOOL)a3;
@end

@implementation _MURatingCellItem

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (BOOL)shouldApplyWidthConstraint
{
  return self->_shouldApplyWidthConstraint;
}

- (void)setShouldApplyWidthConstraint:(BOOL)a3
{
  self->_shouldApplyWidthConstraint = a3;
}

- (UIView)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
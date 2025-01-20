@interface MPCarPlayDividerView
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)horizontalPositioningConstraint;
- (void)setHorizontalPositioningConstraint:(id)a3;
@end

@implementation MPCarPlayDividerView

- (CGSize)intrinsicContentSize
{
  double v2 = 50.0;
  double v3 = 1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (NSLayoutConstraint)horizontalPositioningConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHorizontalPositioningConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
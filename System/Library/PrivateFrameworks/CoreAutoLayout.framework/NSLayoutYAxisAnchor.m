@interface NSLayoutYAxisAnchor
- (BOOL)isCompatibleWithAnchor:(id)a3;
- (BOOL)validateOtherAttribute:(int64_t)a3;
- (NSLayoutConstraint)constraintEqualToSystemSpacingBelowAnchor:(NSLayoutYAxisAnchor *)anchor multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint)constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:(NSLayoutYAxisAnchor *)anchor multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint)constraintLessThanOrEqualToSystemSpacingBelowAnchor:(NSLayoutYAxisAnchor *)anchor multiplier:(CGFloat)multiplier;
- (NSLayoutDimension)anchorWithOffsetToAnchor:(NSLayoutYAxisAnchor *)otherAnchor;
- (id)anchorByOffsettingWithConstant:(double)a3;
- (id)anchorByOffsettingWithDimension:(id)a3;
- (id)anchorByOffsettingWithDimension:(id)a3 multiplier:(double)a4 constant:(double)a5;
@end

@implementation NSLayoutYAxisAnchor

- (BOOL)isCompatibleWithAnchor:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSLayoutConstraint)constraintEqualToSystemSpacingBelowAnchor:(NSLayoutYAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, 0, anchor);
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:(NSLayoutYAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, 1, anchor);
}

- (NSLayoutDimension)anchorWithOffsetToAnchor:(NSLayoutYAxisAnchor *)otherAnchor
{
  return (NSLayoutDimension *)+[_NSDistanceLayoutDimension distanceFromAnchor:self toAnchor:otherAnchor];
}

- (id)anchorByOffsettingWithDimension:(id)a3
{
  return [(NSLayoutYAxisAnchor *)self anchorByOffsettingWithDimension:a3 multiplier:1.0 constant:0.0];
}

- (id)anchorByOffsettingWithDimension:(id)a3 multiplier:(double)a4 constant:(double)a5
{
  v5 = [[_NSCompositeLayoutYAxisAnchor alloc] initWithAnchor:self plusDimension:a3 times:a4 plus:a5];
  return v5;
}

- (id)anchorByOffsettingWithConstant:(double)a3
{
  v3 = [[_NSCompositeLayoutYAxisAnchor alloc] initWithAnchor:self plusDimension:0 times:0.0 plus:a3];
  return v3;
}

- (NSLayoutConstraint)constraintLessThanOrEqualToSystemSpacingBelowAnchor:(NSLayoutYAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, -1, anchor);
}

- (BOOL)validateOtherAttribute:(int64_t)a3
{
  unint64_t v3 = (0x3F001FFE7FuLL >> a3) & 1;
  if (a3 > 0x25) {
    LOBYTE(v3) = 0;
  }
  if (((1 << a3) & 0x2A00119D19) != 0) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  return a3 <= 0x25 && v4;
}

@end
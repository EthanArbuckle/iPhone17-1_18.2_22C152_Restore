@interface NSLayoutXAxisAnchor
- (BOOL)_validateOtherXAxisAnchorDirectionAbstraction:(int64_t)a3;
- (BOOL)isCompatibleWithAnchor:(id)a3;
- (BOOL)validateOtherAttribute:(int64_t)a3;
- (NSLayoutConstraint)constraintEqualToSystemSpacingAfterAnchor:(NSLayoutXAxisAnchor *)anchor multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint)constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:(NSLayoutXAxisAnchor *)anchor multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint)constraintLessThanOrEqualToSystemSpacingAfterAnchor:(NSLayoutXAxisAnchor *)anchor multiplier:(CGFloat)multiplier;
- (NSLayoutDimension)anchorWithOffsetToAnchor:(NSLayoutXAxisAnchor *)otherAnchor;
- (id)anchorByOffsettingWithConstant:(double)a3;
- (id)anchorByOffsettingWithDimension:(id)a3;
- (id)anchorByOffsettingWithDimension:(id)a3 multiplier:(double)a4 constant:(double)a5;
- (int64_t)_directionAbstraction;
@end

@implementation NSLayoutXAxisAnchor

- (BOOL)_validateOtherXAxisAnchorDirectionAbstraction:(int64_t)a3
{
  if ([(NSLayoutXAxisAnchor *)self _directionAbstraction] == a3) {
    return 1;
  }
  int64_t v6 = [(NSLayoutXAxisAnchor *)self _directionAbstraction];
  return a3 == 2 || v6 == 2;
}

- (int64_t)_directionAbstraction
{
  int64_t v4 = [(NSLayoutAnchor *)self _anchorType];
  if (!v4)
  {
    return -1;
  }
  if (v4 == 2)
  {
    unsigned int v5 = [(NSLayoutAnchor *)self _proxiedAttribute];
    if (v5 > 0x24) {
      return -1;
    }
    if (((1 << v5) & 0x1500006006) != 0) {
      return 1;
    }
    if (((1 << v5) & 0x60060) != 0) {
      return 0;
    }
    if (((1 << v5) & 0x80200) == 0) {
      return -1;
    }
  }
  return 2;
}

- (BOOL)isCompatibleWithAnchor:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [a3 _directionAbstraction];
  return [(NSLayoutXAxisAnchor *)self _validateOtherXAxisAnchorDirectionAbstraction:v5];
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:(NSLayoutXAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, 1, anchor);
}

- (NSLayoutDimension)anchorWithOffsetToAnchor:(NSLayoutXAxisAnchor *)otherAnchor
{
  return (NSLayoutDimension *)+[_NSDistanceLayoutDimension distanceFromAnchor:self toAnchor:otherAnchor];
}

- (id)anchorByOffsettingWithDimension:(id)a3
{
  return [(NSLayoutXAxisAnchor *)self anchorByOffsettingWithDimension:a3 multiplier:1.0 constant:0.0];
}

- (id)anchorByOffsettingWithDimension:(id)a3 multiplier:(double)a4 constant:(double)a5
{
  uint64_t v5 = [[_NSCompositeLayoutXAxisAnchor alloc] initWithAnchor:self plusDimension:a3 times:a4 plus:a5];
  return v5;
}

- (id)anchorByOffsettingWithConstant:(double)a3
{
  v3 = [[_NSCompositeLayoutXAxisAnchor alloc] initWithAnchor:self plusDimension:0 times:0.0 plus:a3];
  return v3;
}

- (NSLayoutConstraint)constraintEqualToSystemSpacingAfterAnchor:(NSLayoutXAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, 0, anchor);
}

- (NSLayoutConstraint)constraintLessThanOrEqualToSystemSpacingAfterAnchor:(NSLayoutXAxisAnchor *)anchor multiplier:(CGFloat)multiplier
{
  return (NSLayoutConstraint *)+[NSLayoutConstraint _constraintWithAnchor:relatedBy:toAnchor:withSystemSpacingMultipliedBy:](multiplier, (uint64_t)NSLayoutConstraint, self, -1, anchor);
}

- (BOOL)validateOtherAttribute:(int64_t)a3
{
  if (a3 > 0x24 || ((1 << a3) & 0x15000E6266) == 0) {
    return 0;
  }
  if (((1 << a3) & 0x1500006006) != 0)
  {
    uint64_t v3 = 1;
  }
  else if (((1 << a3) & 0x60060) != 0)
  {
    uint64_t v3 = 0;
  }
  else if (((1 << a3) & 0x80200) != 0)
  {
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = -1;
  }
  return [(NSLayoutXAxisAnchor *)self _validateOtherXAxisAnchorDirectionAbstraction:v3];
}

@end
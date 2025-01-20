@interface NSLayoutDimension
- (BOOL)isCompatibleWithAnchor:(id)a3;
- (BOOL)validateOtherAttribute:(int64_t)a3;
- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint)constraintEqualToConstant:(CGFloat)c;
- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint)constraintGreaterThanOrEqualToConstant:(CGFloat)c;
- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint)constraintLessThanOrEqualToConstant:(CGFloat)c;
- (id)anchorByAddingConstant:(double)a3;
- (id)anchorByAddingDimension:(id)a3;
- (id)anchorByMultiplyingByConstant:(double)a3;
- (id)anchorBySubtractingDimension:(id)a3;
- (id)ruleEqualToConstant:(double)a3;
- (id)ruleEqualToConstant:(double)a3 priority:(float)a4 identifier:(id)a5;
- (id)ruleGreaterThanOrEqualToConstant:(double)a3;
- (id)ruleGreaterThanOrEqualToConstant:(double)a3 priority:(float)a4 identifier:(id)a5;
- (id)ruleLessThanOrEqualToConstant:(double)a3;
- (id)ruleLessThanOrEqualToConstant:(double)a3 priority:(float)a4 identifier:(id)a5;
@end

@implementation NSLayoutDimension

- (BOOL)isCompatibleWithAnchor:(id)a3
{
  if (a3) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

- (NSLayoutConstraint)constraintEqualToConstant:(CGFloat)c
{
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:0 toAnchor:0 multiplier:1.0 constant:c];
}

- (BOOL)validateOtherAttribute:(int64_t)a3
{
  return (a3 > 0x25) | (0xFFE00180uLL >> a3) & 1;
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToConstant:(CGFloat)c
{
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:1 toAnchor:0 multiplier:1.0 constant:c];
}

- (NSLayoutConstraint)constraintLessThanOrEqualToConstant:(CGFloat)c
{
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:-1 toAnchor:0 multiplier:1.0 constant:c];
}

- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:0 toAnchor:anchor multiplier:m constant:0.0];
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:1 toAnchor:anchor multiplier:m constant:0.0];
}

- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:-1 toAnchor:anchor multiplier:m constant:0.0];
}

- (id)ruleEqualToConstant:(double)a3
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, 0, 0.0, a3);
}

- (id)ruleLessThanOrEqualToConstant:(double)a3
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, 0, 0.0, a3);
}

- (id)ruleGreaterThanOrEqualToConstant:(double)a3
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, 0, 0.0, a3);
}

- (id)ruleEqualToConstant:(double)a3 priority:(float)a4 identifier:(id)a5
{
  return -[NSLayoutAnchor ruleEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, a5, 0.0, a3);
}

- (id)ruleGreaterThanOrEqualToConstant:(double)a3 priority:(float)a4 identifier:(id)a5
{
  return -[NSLayoutAnchor ruleGreaterThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, a5, 0.0, a3);
}

- (id)ruleLessThanOrEqualToConstant:(double)a3 priority:(float)a4 identifier:(id)a5
{
  return -[NSLayoutAnchor ruleLessThanOrEqualToAnchor:multiplier:constant:priority:identifier:]((double *)self, 0, a5, 0.0, a3);
}

- (id)anchorByMultiplyingByConstant:(double)a3
{
  v3 = [[_NSArithmeticLayoutDimension alloc] initWithMultiplier:self dimension:a3 constant:0.0];
  return v3;
}

- (id)anchorByAddingConstant:(double)a3
{
  v3 = [[_NSArithmeticLayoutDimension alloc] initWithMultiplier:self dimension:1.0 constant:a3];
  return v3;
}

- (id)anchorByAddingDimension:(id)a3
{
  v3 = [[_NSCompositeLayoutDimension alloc] initWithDimension:self plusDimension:a3];
  return v3;
}

- (id)anchorBySubtractingDimension:(id)a3
{
  v3 = [[_NSCompositeLayoutDimension alloc] initWithDimension:self plusDimension:a3 times:-1.0];
  return v3;
}

- (NSLayoutConstraint)constraintEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:0 toAnchor:anchor multiplier:m constant:c];
}

- (NSLayoutConstraint)constraintGreaterThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:1 toAnchor:anchor multiplier:m constant:c];
}

- (NSLayoutConstraint)constraintLessThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c
{
  if (!anchor) {
    _NSLayoutConstraintToNilAnchor();
  }
  return +[NSLayoutConstraint constraintWithAnchor:self relatedBy:-1 toAnchor:anchor multiplier:m constant:c];
}

@end
@interface NSISRestrictedToNonNegativeVariable
- (BOOL)shouldBeMinimized;
- (id)markedConstraint;
- (int)valueRestriction;
@end

@implementation NSISRestrictedToNonNegativeVariable

- (int)valueRestriction
{
  return 1;
}

- (BOOL)shouldBeMinimized
{
  return 0;
}

- (id)markedConstraint
{
  return 0;
}

@end
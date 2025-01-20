@interface NSISRestrictedToNonNegativeVariableToBeMinimized
- (BOOL)shouldBeMinimized;
- (id)markedConstraint;
- (int)valueRestriction;
@end

@implementation NSISRestrictedToNonNegativeVariableToBeMinimized

- (BOOL)shouldBeMinimized
{
  return 1;
}

- (int)valueRestriction
{
  return 1;
}

- (id)markedConstraint
{
  return 0;
}

@end
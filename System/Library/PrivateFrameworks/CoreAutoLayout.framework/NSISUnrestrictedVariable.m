@interface NSISUnrestrictedVariable
- (BOOL)shouldBeMinimized;
- (id)markedConstraint;
- (int)valueRestriction;
@end

@implementation NSISUnrestrictedVariable

- (int)valueRestriction
{
  return 0;
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
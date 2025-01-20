@interface NSISRestrictedToNonNegativeMarkerVariableToBeMinimized
- (BOOL)shouldBeMinimized;
- (int)valueRestriction;
@end

@implementation NSISRestrictedToNonNegativeMarkerVariableToBeMinimized

- (BOOL)shouldBeMinimized
{
  return 1;
}

- (int)valueRestriction
{
  return 1;
}

@end
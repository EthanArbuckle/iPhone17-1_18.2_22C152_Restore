@interface NSISRestrictedToZeroMarkerVariable
- (BOOL)shouldBeMinimized;
- (int)valueRestriction;
@end

@implementation NSISRestrictedToZeroMarkerVariable

- (BOOL)shouldBeMinimized
{
  return 0;
}

- (int)valueRestriction
{
  return 2;
}

@end
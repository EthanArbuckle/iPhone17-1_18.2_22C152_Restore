@interface PKDetectionQueryItem
- (NSSet)strokeIdentifiers;
- (UIBezierPath)baselinePath;
@end

@implementation PKDetectionQueryItem

- (NSSet)strokeIdentifiers
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (UIBezierPath)baselinePath
{
  return (UIBezierPath *)[MEMORY[0x1E4FB14C0] bezierPath];
}

@end
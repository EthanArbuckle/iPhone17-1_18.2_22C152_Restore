@interface NSIBPrototypingLayoutConstraint
+ (id)classFallbacksForKeyedArchiver;
- (BOOL)_isIBPrototypingLayoutConstraint;
@end

@implementation NSIBPrototypingLayoutConstraint

+ (id)classFallbacksForKeyedArchiver
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"NSLayoutConstraint"];
}

- (BOOL)_isIBPrototypingLayoutConstraint
{
  return 1;
}

@end
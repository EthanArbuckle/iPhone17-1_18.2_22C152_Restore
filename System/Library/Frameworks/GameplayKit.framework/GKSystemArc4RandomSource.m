@interface GKSystemArc4RandomSource
- (int64_t)nextInt;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
@end

@implementation GKSystemArc4RandomSource

- (int64_t)nextInt
{
  return (int)arc4random();
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  return arc4random_uniform(a3);
}

@end
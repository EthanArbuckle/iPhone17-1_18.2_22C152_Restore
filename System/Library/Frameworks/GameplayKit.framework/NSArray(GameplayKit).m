@interface NSArray(GameplayKit)
- (id)shuffledArray;
- (uint64_t)shuffledArrayWithRandomSource:()GameplayKit;
@end

@implementation NSArray(GameplayKit)

- (uint64_t)shuffledArrayWithRandomSource:()GameplayKit
{
  return [a3 arrayByShufflingObjectsInArray:a1];
}

- (id)shuffledArray
{
  v2 = +[GKRandomSource sharedRandom];
  v3 = [a1 shuffledArrayWithRandomSource:v2];

  return v3;
}

@end
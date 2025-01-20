@interface HMMediaSystem(AbstractionAdditions)
- (id)hf_accessoryLikeObject;
@end

@implementation HMMediaSystem(AbstractionAdditions)

- (id)hf_accessoryLikeObject
{
  return +[HFAccessoryLikeObject _accessoryLikeObjectForObject:a1];
}

@end
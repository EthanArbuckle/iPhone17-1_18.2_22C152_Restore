@interface CAAnimation(SceneKitAdditions)
+ (uint64_t)animationWithSCNAnimation:()SceneKitAdditions;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (uint64_t)animationEvents;
- (uint64_t)commitsOnCompletion;
- (uint64_t)setCommitsOnCompletion:()SceneKitAdditions;
- (uint64_t)setFadeInDuration:()SceneKitAdditions;
- (uint64_t)setFadeOutDuration:()SceneKitAdditions;
- (uint64_t)setUsesSceneTimeBase:()SceneKitAdditions;
- (uint64_t)usesSceneTimeBase;
- (void)setAnimationEvents:()SceneKitAdditions;
@end

@implementation CAAnimation(SceneKitAdditions)

- (uint64_t)usesSceneTimeBase
{
  v1 = (void *)[a1 valueForKey:@"SCNAnimationAnimatesUsingSceneTimeKey"];

  return [v1 BOOLValue];
}

- (uint64_t)setUsesSceneTimeBase:()SceneKitAdditions
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:");

  return [a1 setValue:v2 forKey:@"SCNAnimationAnimatesUsingSceneTimeKey"];
}

- (double)fadeInDuration
{
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"SCNAnimationFadeInDurationKey"), "floatValue");
  return v1;
}

- (uint64_t)setFadeInDuration:()SceneKitAdditions
{
  *(float *)&a2 = a2;
  uint64_t v3 = [NSNumber numberWithFloat:a2];

  return [a1 setValue:v3 forKey:@"SCNAnimationFadeInDurationKey"];
}

- (double)fadeOutDuration
{
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"SCNAnimationFadeOutDurationKey"), "floatValue");
  return v1;
}

- (uint64_t)setFadeOutDuration:()SceneKitAdditions
{
  *(float *)&a2 = a2;
  uint64_t v3 = [NSNumber numberWithFloat:a2];

  return [a1 setValue:v3 forKey:@"SCNAnimationFadeOutDurationKey"];
}

- (uint64_t)commitsOnCompletion
{
  float v1 = (void *)[a1 valueForKey:@"SCNAnimationCommitOnCompletion"];

  return [v1 BOOLValue];
}

- (uint64_t)setCommitsOnCompletion:()SceneKitAdditions
{
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:");

  return [a1 setValue:v2 forKey:@"SCNAnimationCommitOnCompletion"];
}

- (void)setAnimationEvents:()SceneKitAdditions
{
  id v4 = (id)[a3 copy];
  [a1 setValue:v4 forKey:@"SCNAnimationEventsKey"];
}

- (uint64_t)animationEvents
{
  return [a1 valueForKey:@"SCNAnimationEventsKey"];
}

+ (uint64_t)animationWithSCNAnimation:()SceneKitAdditions
{
  return [a3 caAnimation];
}

@end
@interface VKTimedAnimation(MapKitAdditions)
+ (id)animationMatchingCurrentAnimationParametersWithName:()MapKitAdditions;
@end

@implementation VKTimedAnimation(MapKitAdditions)

+ (id)animationMatchingCurrentAnimationParametersWithName:()MapKitAdditions
{
  id v3 = a3;
  if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB3A90]);
    objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_currentAnimationDuration");
    v5 = objc_msgSend(v4, "initWithDuration:name:", v3);
    v6 = objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_currentAnimationTimingFunction");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89__VKTimedAnimation_MapKitAdditions__animationMatchingCurrentAnimationParametersWithName___block_invoke;
    v9[3] = &unk_1E54B8A38;
    id v10 = v6;
    id v7 = v6;
    [v5 setTimingFunction:v9];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
@interface ARUICountdownDefaultTimeline
+ (id)cancelIdentifier;
+ (id)countdownIdentifier;
+ (id)disappearIdentifier;
+ (id)fadeInIdentifier;
+ (id)fadeOutIdentifier;
+ (id)preAnimationIdentifier;
+ (id)windUpIdentifier;
- (ARUICountdownDefaultTimeline)init;
@end

@implementation ARUICountdownDefaultTimeline

- (ARUICountdownDefaultTimeline)init
{
  v17[6] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)ARUICountdownDefaultTimeline;
  v2 = [(ARUICountdownDefaultTimeline *)&v16 init];
  if (v2)
  {
    v15 = objc_alloc_init(ARUICountdownPreAnimation);
    [(ARUICountdownTimeline *)v2 setPrepareToAnimate:v15];
    v14 = objc_alloc_init(ARUICountdownPreCancel);
    [(ARUICountdownTimeline *)v2 setPrepareToCancel:v14];
    v3 = [MEMORY[0x263EFF980] array];
    v4 = [MEMORY[0x263EFF980] array];
    v5 = objc_alloc_init(ARUICountdownFadeIn);
    v6 = objc_alloc_init(ARUICountdownWindUp);
    v7 = [[ARUICountdownCountdown alloc] initWithPercent:3 andStep:1 cancelable:0.66];
    v8 = [[ARUICountdownCountdown alloc] initWithPercent:2 andStep:1 cancelable:0.33];
    v9 = [[ARUICountdownCountdown alloc] initWithPercent:1 andStep:0 cancelable:0.0];
    v10 = objc_alloc_init(ARUICountdownFadeOut);
    v17[0] = v5;
    v17[1] = v6;
    v17[2] = v7;
    v17[3] = v8;
    v17[4] = v9;
    v17[5] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:6];
    [v3 addObjectsFromArray:v11];

    v12 = objc_alloc_init(ARUICountdownCancel);
    [v4 addObject:v12];
    [(ARUICountdownTimeline *)v2 setAnimations:v3];
    [(ARUICountdownTimeline *)v2 setCancelAnimations:v4];
  }
  return v2;
}

+ (id)preAnimationIdentifier
{
  return +[ARUICountdownPreAnimation identifier];
}

+ (id)fadeInIdentifier
{
  return +[ARUICountdownFadeIn identifier];
}

+ (id)windUpIdentifier
{
  return +[ARUICountdownWindUp identifier];
}

+ (id)countdownIdentifier
{
  return +[ARUICountdownCountdown identifier];
}

+ (id)fadeOutIdentifier
{
  return +[ARUICountdownFadeOut identifier];
}

+ (id)disappearIdentifier
{
  return +[ARUICountdownDisappear identifier];
}

+ (id)cancelIdentifier
{
  return +[ARUICountdownCancel identifier];
}

@end
@interface BSSpringAnimationSettings
+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5;
+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6;
+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 delay:(double)a7 timingFunction:(id)a8;
+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 initialVelocity:(double)a7;
+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 timingFunction:(id)a7;
+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 timingFunction:(id)a6;
- (BSSpringAnimationSettings)init;
@end

@implementation BSSpringAnimationSettings

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5
{
  id v8 = objc_alloc((Class)a1);
  v12 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v8, 1, 0, 0, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v9, v10, v11, *(uint64_t *)&a4, *(uint64_t *)&a5, 0.0,
                  0);
  return v12;
}

- (BSSpringAnimationSettings)init
{
  return (BSSpringAnimationSettings *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](self, 1, 0, 0, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v2, v3, v4, 0, 0, 0.0,
                                        0);
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6
{
  id v10 = objc_alloc((Class)a1);
  v14 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v10, 1, 0, 0, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v11, v12, v13, *(uint64_t *)&a4, *(uint64_t *)&a5, a6,
                  0);
  return v14;
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 initialVelocity:(double)a7
{
  id v12 = objc_alloc((Class)a1);
  v16 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v12, 1, 0, 0, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v13, v14, v15, *(uint64_t *)&a4, *(uint64_t *)&a5, a6,
                  *(uint64_t *)&a7);
  return v16;
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 timingFunction:(id)a6
{
  id v10 = a6;
  id v11 = objc_alloc((Class)a1);
  uint64_t v15 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v11, 1, 0, v10, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v12, v13, v14, *(uint64_t *)&a4, *(uint64_t *)&a5, 0.0,
                  0);

  return v15;
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 timingFunction:(id)a7
{
  id v12 = a7;
  id v13 = objc_alloc((Class)a1);
  v17 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v13, 1, 0, v12, 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v14, v15, v16, *(uint64_t *)&a4, *(uint64_t *)&a5, a6,
                  0);

  return v17;
}

+ (id)settingsWithMass:(double)a3 stiffness:(double)a4 damping:(double)a5 epsilon:(double)a6 delay:(double)a7 timingFunction:(id)a8
{
  id v14 = a8;
  id v15 = objc_alloc((Class)a1);
  v19 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v15, 1, 0, v14, 1, 0.0, a7, 0.0, 0.0, 0.0, 0.0, 1.0, a3, v16, v17, v18, *(uint64_t *)&a4, *(uint64_t *)&a5, a6,
                  0);

  return v19;
}

@end
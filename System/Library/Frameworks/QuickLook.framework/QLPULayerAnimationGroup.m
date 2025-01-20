@interface QLPULayerAnimationGroup
- (CALayer)referenceLayer;
- (QLPULayerAnimationGroup)init;
- (QLPULayerAnimationGroup)initWithReferenceLayer:(id)a3;
- (double)currentTime;
- (void)updateAnimations;
@end

@implementation QLPULayerAnimationGroup

- (QLPULayerAnimationGroup)init
{
  return [(QLPULayerAnimationGroup *)self initWithReferenceLayer:0];
}

- (QLPULayerAnimationGroup)initWithReferenceLayer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLPULayerAnimationGroup;
  v6 = [(QLPUTimedAnimationGroup *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_referenceLayer, a3);
    [(QLPULayerAnimationGroup *)v7 currentTime];
    -[QLPUTimedAnimationGroup setBeginTime:](v7, "setBeginTime:");
  }

  return v7;
}

- (double)currentTime
{
  v2 = [(QLPULayerAnimationGroup *)self referenceLayer];
  [v2 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;

  return v4;
}

- (void)updateAnimations
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)QLPULayerAnimationGroup;
  [(QLPUTimedAnimationGroup *)&v22 updateAnimations];
  BOOL v3 = [(QLPUAnimationGroup *)self isPaused];
  [(QLPUTimedAnimationGroup *)self elapsedTime];
  double v5 = v4;
  [(QLPUTimedAnimationGroup *)self beginTime];
  double v7 = v6;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = [(QLPUAnimationGroup *)self subAnimationGroups];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v3)
          {
            double v14 = 0.0;
            double v15 = 0.0;
            v16 = v13;
            double v17 = v5;
          }
          else
          {
            LODWORD(v14) = 1.0;
            double v17 = 0.0;
            v16 = v13;
            double v15 = v7;
          }
          [v16 setSpeed:v14 timeOffset:v17 beginTime:v15];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }
}

- (CALayer)referenceLayer
{
  return self->_referenceLayer;
}

- (void).cxx_destruct
{
}

@end
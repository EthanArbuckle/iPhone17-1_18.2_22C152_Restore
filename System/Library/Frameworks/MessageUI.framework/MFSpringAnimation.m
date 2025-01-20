@interface MFSpringAnimation
+ (id)springAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5;
- (MFSpringAnimation)init;
- (void)addCompletionBlock:(id)a3;
@end

@implementation MFSpringAnimation

- (MFSpringAnimation)init
{
  v12.receiver = self;
  v12.super_class = (Class)MFSpringAnimation;
  v2 = [(MFSpringAnimation *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(MFSpringAnimation *)v2 setAdditive:1];
    UIAnimationDragCoefficient();
    [(CASpringAnimation *)v3 setMass:(float)(v4 + v4)];
    UIAnimationDragCoefficient();
    [(CASpringAnimation *)v3 setStiffness:(float)(300.0 / v5)];
    [(CASpringAnimation *)v3 setDamping:400.0];
    LODWORD(v6) = 1043925356;
    LODWORD(v7) = 1058273231;
    LODWORD(v8) = 1063980840;
    v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v6 :0.0 :v7 :v8];
    [(MFSpringAnimation *)v3 setTimingFunction:v9];

    [(CASpringAnimation *)v3 durationForEpsilon:0.001];
    -[MFSpringAnimation setDuration:](v3, "setDuration:");
    v10 = objc_alloc_init(MFSpringAnimationDelegate);
    [(MFSpringAnimation *)v3 setDelegate:v10];
  }
  return v3;
}

- (void)addCompletionBlock:(id)a3
{
  id aBlock = a3;
  float v4 = [(MFSpringAnimation *)self delegate];
  float v5 = [v4 completionBlocks];
  double v6 = _Block_copy(aBlock);
  [v5 addObject:v6];
}

+ (id)springAnimationWithKeyPath:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(MFSpringAnimation);
  [(MFSpringAnimation *)v10 setKeyPath:v7];
  [(MFSpringAnimation *)v10 setFromValue:v8];
  [(MFSpringAnimation *)v10 setToValue:v9];

  return v10;
}

@end
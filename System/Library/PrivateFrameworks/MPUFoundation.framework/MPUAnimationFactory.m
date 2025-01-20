@interface MPUAnimationFactory
- (BOOL)isRemovedOnCompletion;
- (CAMediaTimingFunction)timingFunction;
- (MPUAnimationFactory)init;
- (NSArray)allowedKeyPaths;
- (NSString)fillMode;
- (double)timeOffset;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimation;
- (void)setAllowedKeyPaths:(id)a3;
- (void)setFillMode:(id)a3;
- (void)setRemovedOnCompletion:(BOOL)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation MPUAnimationFactory

- (MPUAnimationFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPUAnimationFactory;
  v2 = [(MPUAnimationFactory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_fillMode, (id)*MEMORY[0x263F15AB8]);
    v3->_removedOnCompletion = 1;
  }
  return v3;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5 = a4;
  v6 = [(MPUAnimationFactory *)self allowedKeyPaths];
  v7 = v6;
  if (v6 && ![v6 containsObject:v5])
  {
    v8 = 0;
  }
  else
  {
    v8 = [MEMORY[0x263F15760] animationWithKeyPath:v5];
    [v8 setTimeOffset:self->_timeOffset];
    [v8 setFillMode:self->_fillMode];
    [v8 setRemovedOnCompletion:self->_removedOnCompletion];
  }

  return v8;
}

- (id)_timingFunctionForAnimation
{
  return self->_timingFunction;
}

- (NSArray)allowedKeyPaths
{
  return self->_allowedKeyPaths;
}

- (void)setAllowedKeyPaths:(id)a3
{
}

- (NSString)fillMode
{
  return self->_fillMode;
}

- (void)setFillMode:(id)a3
{
}

- (BOOL)isRemovedOnCompletion
{
  return self->_removedOnCompletion;
}

- (void)setRemovedOnCompletion:(BOOL)a3
{
  self->_removedOnCompletion = a3;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_fillMode, 0);

  objc_storeStrong((id *)&self->_allowedKeyPaths, 0);
}

@end
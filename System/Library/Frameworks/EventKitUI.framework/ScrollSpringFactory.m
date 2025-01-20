@interface ScrollSpringFactory
+ (id)sharedFactory;
- (double)initialVelocity;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (void)setInitialVelocity:(double)a3;
@end

@implementation ScrollSpringFactory

+ (id)sharedFactory
{
  return 0;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  v5 = _createSpringOfBasicAnimationDependingOnDebugState(a4, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    [(ScrollSpringFactory *)self initialVelocity];
    objc_msgSend(v6, "setVelocity:");
    [(ScrollSpringFactory *)self initialVelocity];
    double v8 = -v7;
    if (v7 >= 0.0) {
      double v8 = v7;
    }
    if (v8 > 20.0) {
      objc_msgSend(v6, "setVelocity:");
    }
  }

  return v5;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (void)setInitialVelocity:(double)a3
{
  self->_initialVelocity = a3;
}

@end
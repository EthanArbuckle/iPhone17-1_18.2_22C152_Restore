@interface MPUSpringAnimationFactory
+ (void)animateUsingSpringWithDamping:(double)a3 mass:(double)a4 stiffness:(double)a5 velocity:(double)a6 animations:(id)a7 options:(unint64_t)a8 completion:(id)a9;
- (double)damping;
- (double)durationForEpsilon:(double)a3;
- (double)mass;
- (double)stiffness;
- (double)velocity;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_newSpringAnimationForKeyPath:(id)a3;
- (void)setDamping:(double)a3;
- (void)setMass:(double)a3;
- (void)setStiffness:(double)a3;
- (void)setVelocity:(double)a3;
@end

@implementation MPUSpringAnimationFactory

+ (void)animateUsingSpringWithDamping:(double)a3 mass:(double)a4 stiffness:(double)a5 velocity:(double)a6 animations:(id)a7 options:(unint64_t)a8 completion:(id)a9
{
  id v15 = a9;
  id v16 = a7;
  v18 = objc_alloc_init(MPUSpringAnimationFactory);
  [(MPUSpringAnimationFactory *)v18 setMass:a4];
  [(MPUSpringAnimationFactory *)v18 setStiffness:a5];
  [(MPUSpringAnimationFactory *)v18 setDamping:a3];
  [(MPUSpringAnimationFactory *)v18 setVelocity:a6];
  [(MPUSpringAnimationFactory *)v18 durationForEpsilon:0.001];
  objc_msgSend(MEMORY[0x263F1CB60], "_animateWithDuration:delay:options:factory:animations:completion:", a8 | 0x30000, v18, v16, v15, fmin(v17, 1.0), 0.0);
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MPUAnimationFactory *)self allowedKeyPaths];
  v9 = v8;
  if (v8 && ![v8 containsObject:v7])
  {
    v13.receiver = self;
    v13.super_class = (Class)MPUSpringAnimationFactory;
    id v10 = [(MPUAnimationFactory *)&v13 _basicAnimationForView:v6 withKeyPath:v7];
  }
  else
  {
    id v10 = [(MPUSpringAnimationFactory *)self _newSpringAnimationForKeyPath:v7];
  }
  v11 = v10;

  return v11;
}

- (double)durationForEpsilon:(double)a3
{
  id v4 = [(MPUSpringAnimationFactory *)self _newSpringAnimationForKeyPath:0];
  [v4 durationForEpsilon:a3];
  double v6 = v5;

  return v6;
}

- (id)_newSpringAnimationForKeyPath:(id)a3
{
  id v4 = [MEMORY[0x263F15890] animationWithKeyPath:a3];
  [v4 setMass:self->_mass];
  [v4 setStiffness:self->_stiffness];
  [v4 setDamping:self->_damping];
  [v4 setVelocity:self->_velocity];
  double v5 = [(MPUAnimationFactory *)self fillMode];
  [v4 setFillMode:v5];

  objc_msgSend(v4, "setRemovedOnCompletion:", -[MPUAnimationFactory isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  [(MPUAnimationFactory *)self timeOffset];
  objc_msgSend(v4, "setTimeOffset:");
  return v4;
}

- (double)damping
{
  return self->_damping;
}

- (void)setDamping:(double)a3
{
  self->_damping = a3;
}

- (double)mass
{
  return self->_mass;
}

- (void)setMass:(double)a3
{
  self->_mass = a3;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (void)setStiffness:(double)a3
{
  self->_stiffness = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

@end
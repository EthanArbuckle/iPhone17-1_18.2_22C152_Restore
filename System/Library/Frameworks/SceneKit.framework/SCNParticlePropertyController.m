@interface SCNParticlePropertyController
+ (BOOL)supportsSecureCoding;
+ (SCNParticlePropertyController)controllerWithAnimation:(CAAnimation *)animation;
+ (SCNParticlePropertyController)particlePropertyControllerWithAnimation:(id)a3;
- (CAAnimation)animation;
- (CGFloat)inputBias;
- (CGFloat)inputScale;
- (SCNNode)inputOrigin;
- (SCNParticleInputMode)inputMode;
- (SCNParticleProperty)inputProperty;
- (SCNParticlePropertyController)init;
- (SCNParticlePropertyController)initWithCoder:(id)a3;
- (id)c3dAnimation;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_customDecodingOfSCNParticlePropertyController:(id)a3;
- (void)_customEncodingOfSCNParticlePropertyController:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimation:(CAAnimation *)animation;
- (void)setC3dAnimation:(id)a3;
- (void)setInputBias:(CGFloat)inputBias;
- (void)setInputMode:(SCNParticleInputMode)inputMode;
- (void)setInputOrigin:(SCNNode *)inputOrigin;
- (void)setInputProperty:(SCNParticleProperty)inputProperty;
- (void)setInputScale:(CGFloat)inputScale;
@end

@implementation SCNParticlePropertyController

- (SCNParticlePropertyController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNParticlePropertyController;
  result = [(SCNParticlePropertyController *)&v3 init];
  if (result) {
    result->_inputScale = 1.0;
  }
  return result;
}

- (void)setC3dAnimation:(id)a3
{
  id c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation != a3)
  {

    self->_id c3dAnimation = a3;
  }
}

- (id)c3dAnimation
{
  return self->_c3dAnimation;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_inputOrigin, 0);

  v3.receiver = self;
  v3.super_class = (Class)SCNParticlePropertyController;
  [(SCNParticlePropertyController *)&v3 dealloc];
}

+ (SCNParticlePropertyController)particlePropertyControllerWithAnimation:(id)a3
{
  v4 = (SCNParticlePropertyController *)objc_alloc_init((Class)a1);
  [(SCNParticlePropertyController *)v4 setAnimation:a3];
  return v4;
}

+ (SCNParticlePropertyController)controllerWithAnimation:(CAAnimation *)animation
{
  v4 = (SCNParticlePropertyController *)objc_alloc_init((Class)a1);
  [(SCNParticlePropertyController *)v4 setAnimation:animation];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setAnimation:self->_animation];
  [v4 setInputMode:self->_inputMode];
  [v4 setInputScale:self->_inputScale];
  [v4 setInputBias:self->_inputBias];
  objc_msgSend(v4, "setInputOrigin:", -[SCNParticlePropertyController inputOrigin](self, "inputOrigin"));
  [v4 setInputProperty:self->_inputProperty];
  [v4 setC3dAnimation:self->_c3dAnimation];
  return v4;
}

- (id)copy
{
  return [(SCNParticlePropertyController *)self copyWithZone:0];
}

- (CAAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(CAAnimation *)animation
{
  objc_super v3 = self->_animation;
  if (v3 != animation)
  {

    self->_animation = animation;
  }
}

- (SCNParticleInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(SCNParticleInputMode)inputMode
{
  self->_inputMode = inputMode;
}

- (CGFloat)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(CGFloat)inputScale
{
  self->_inputScale = inputScale;
}

- (CGFloat)inputBias
{
  return self->_inputBias;
}

- (void)setInputBias:(CGFloat)inputBias
{
  self->_inputBias = inputBias;
}

- (SCNNode)inputOrigin
{
  return (SCNNode *)objc_loadWeak((id *)&self->_inputOrigin);
}

- (void)setInputOrigin:(SCNNode *)inputOrigin
{
}

- (SCNParticleProperty)inputProperty
{
  return self->_inputProperty;
}

- (void)setInputProperty:(SCNParticleProperty)inputProperty
{
  objc_super v3 = self->_inputProperty;
  if (v3 != inputProperty)
  {

    self->_inputProperty = inputProperty;
  }
}

- (void)_customEncodingOfSCNParticlePropertyController:(id)a3
{
  id c3dAnimation = self->_c3dAnimation;
  if (c3dAnimation) {
    SCNEncodeC3DAnimationForKey(a3, c3dAnimation, @"animation");
  }
}

- (void)_customDecodingOfSCNParticlePropertyController:(id)a3
{
  uint64_t v4 = SCNDecodeC3DAnimationForKey(a3, @"animation");
  if (v4)
  {
    id v5 = (id)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      id v5 = C3DAnimationToCAAnimation(v5);
    }
    [(SCNParticlePropertyController *)self setAnimation:v5];
  }
}

- (void)encodeWithCoder:(id)a3
{
  -[SCNParticlePropertyController _customEncodingOfSCNParticlePropertyController:](self, "_customEncodingOfSCNParticlePropertyController:");
  [a3 encodeInteger:self->_inputMode forKey:@"inputMode"];
  [a3 encodeDouble:@"inputScale" forKey:self->_inputScale];
  [a3 encodeDouble:@"inputBias" forKey:self->_inputBias];
  id v5 = [(SCNParticlePropertyController *)self inputOrigin];
  if (v5) {
    [a3 encodeObject:v5 forKey:@"inputOrigin"];
  }

  if (self->_inputProperty)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (SCNParticlePropertyController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNParticlePropertyController;
  uint64_t v4 = [(SCNParticlePropertyController *)&v7 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNParticlePropertyController *)v4 _customDecodingOfSCNParticlePropertyController:a3];
    -[SCNParticlePropertyController setInputMode:](v4, "setInputMode:", [a3 decodeIntegerForKey:@"inputMode"]);
    [a3 decodeDoubleForKey:@"inputScale"];
    -[SCNParticlePropertyController setInputScale:](v4, "setInputScale:");
    [a3 decodeDoubleForKey:@"inputBias"];
    -[SCNParticlePropertyController setInputBias:](v4, "setInputBias:");
    -[SCNParticlePropertyController setInputOrigin:](v4, "setInputOrigin:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"inputOrigin"]);
    -[SCNParticlePropertyController setInputProperty:](v4, "setInputProperty:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"inputProperty"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
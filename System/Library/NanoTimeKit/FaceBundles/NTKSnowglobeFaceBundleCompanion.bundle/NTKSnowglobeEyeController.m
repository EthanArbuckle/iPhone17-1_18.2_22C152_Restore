@interface NTKSnowglobeEyeController
- ($599F175E452E455E49EC8439362DB023)_weightForState:(SEL)a3;
- (BOOL)animationEnabled;
- (NTKSnowglobeEyeController)initWithLeftNode:(id)a3 rightNode:(id)a4 digitProfile:(id)a5;
- (SCNNode)leftEyeNode;
- (SCNNode)rightEyeNode;
- (void)_decideNextBlink:(double)a3;
- (void)_decideNextSquintChange:(double)a3;
- (void)_updateIdleStateForTime:(double)a3;
- (void)_updateWeights;
- (void)setAnimationEnabled:(BOOL)a3;
- (void)transitionToState:(unint64_t)a3 withDuration:(double)a4;
- (void)transitionToState:(unint64_t)a3 withFraction:(double)a4;
- (void)updateAtTime:(double)a3;
@end

@implementation NTKSnowglobeEyeController

- (NTKSnowglobeEyeController)initWithLeftNode:(id)a3 rightNode:(id)a4 digitProfile:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NTKSnowglobeEyeController;
  v12 = [(NTKSnowglobeEyeController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_leftEyeNode, a3);
    objc_storeStrong((id *)&v13->_rightEyeNode, a4);
    v13->_state = 0;
    v13->_idleState.nextBlink = 0.0;
    v13->_idleState.squint = (double)arc4random() / 4294967300.0 < 0.5;
    objc_storeStrong((id *)&v13->_profile, a5);
  }

  return v13;
}

- (void)transitionToState:(unint64_t)a3 withDuration:(double)a4
{
  if (self->_state != a3 && (self->_transitionState != a3 || self->_transitionFraction <= 0.0))
  {
    self->_transitionAutomatic = 1;
    self->_transitionState = a3;
    self->_transitionFraction = 0.0;
    self->_transitionDuration = a4;
  }
}

- (void)transitionToState:(unint64_t)a3 withFraction:(double)a4
{
  if (self->_state != a3)
  {
    self->_transitionAutomatic = 0;
    self->_transitionFraction = a4;
    self->_transitionState = a3;
    MEMORY[0x1F4181798]();
  }
}

- (void)updateAtTime:(double)a3
{
  if (!self->_state || !self->_transitionState) {
    [(NTKSnowglobeEyeController *)self _updateIdleStateForTime:a3];
  }
  if (self->_transitionAutomatic) {
    self->_transitionFraction = self->_transitionFraction + 0.0333333333 / self->_transitionDuration;
  }

  MEMORY[0x1F4181798](self, sel__updateWeights);
}

- (void)_updateWeights
{
  double transitionFraction = self->_transitionFraction;
  if (transitionFraction >= 1.0)
  {
    unint64_t transitionState = self->_transitionState;
    self->_state = transitionState;
    self->_double transitionFraction = 0.0;
    self->_transitionAutomatic = 0;
  }
  else
  {
    if (transitionFraction > 0.0)
    {
      [(NTKSnowglobeEyeController *)self _weightForState:self->_state];
      LODWORD(v30) = 0;
      -[NTKSnowglobeEyeController _weightForState:](self, "_weightForState:", self->_transitionState, 0, 0, v30);
      CLKInterpolateBetweenFloatsClipped();
      CLKInterpolateBetweenFloatsClipped();
      float v5 = v4;
      CLKInterpolateBetweenFloatsClipped();
      float v7 = v6;
      CLKInterpolateBetweenFloatsClipped();
      float v9 = v8;
      CLKInterpolateBetweenFloatsClipped();
      float v11 = v10;
      goto LABEL_7;
    }
    unint64_t transitionState = self->_state;
  }
  [(NTKSnowglobeEyeController *)self _weightForState:transitionState];
  float v5 = v31;
  float v9 = v33;
  float v7 = v32;
  float v11 = v34;
LABEL_7:
  double v13 = v11 * 2.0 + -1.0;
  double v14 = 1.0 - fabs(v13);
  if (v14 >= 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = 0.0;
  }
  if (v13 >= 0.0) {
    double v16 = v13;
  }
  else {
    double v16 = 0.0;
  }
  v17 = [(SCNNode *)self->_leftEyeNode morpher];
  double v18 = v7;
  [v17 setWeight:@"eyeContent_LShape" forTargetNamed:v18];

  v19 = [(SCNNode *)self->_leftEyeNode morpher];
  double v20 = v5;
  [v19 setWeight:@"eyeAngry_LShape" forTargetNamed:v20];

  v21 = [(SCNNode *)self->_leftEyeNode morpher];
  double v22 = v9;
  [v21 setWeight:@"eyeFullBlink_LShape" forTargetNamed:v22];

  v23 = [(SCNNode *)self->_leftEyeNode morpher];
  [v23 setWeight:@"eyeHalfSquint_LShape" forTargetNamed:v15];

  v24 = [(SCNNode *)self->_leftEyeNode morpher];
  [v24 setWeight:@"eyeSquint_LShape" forTargetNamed:v16];

  v25 = [(SCNNode *)self->_rightEyeNode morpher];
  [v25 setWeight:@"eyeContent_RShape" forTargetNamed:v18];

  v26 = [(SCNNode *)self->_rightEyeNode morpher];
  [v26 setWeight:@"eyeAngry_RShape" forTargetNamed:v20];

  v27 = [(SCNNode *)self->_rightEyeNode morpher];
  [v27 setWeight:@"eyeFullBlink_RShape" forTargetNamed:v22];

  v28 = [(SCNNode *)self->_rightEyeNode morpher];
  [v28 setWeight:@"eyeHalfSquint_RShape" forTargetNamed:v15];

  v29 = [(SCNNode *)self->_rightEyeNode morpher];
  [v29 setWeight:@"eyeSquint_RShape" forTargetNamed:v16];
}

- ($599F175E452E455E49EC8439362DB023)_weightForState:(SEL)a3
{
  switch(a4)
  {
    case 0uLL:
      float var2 = self->var2;
      float var1 = self[1].var1;
      retstr->var0 = (float)(1.0 - var2) * (float)(1.0 - var1);
      retstr->float var1 = 0.0;
      retstr->float var2 = 0.0;
      retstr->var3 = var2 * (float)(1.0 - var1);
      retstr->var4 = (float)(1.0 - var2) * var1;
      break;
    case 1uLL:
    case 3uLL:
      *(void *)&retstr->var0 = 0;
      *(void *)&retstr->float var2 = 0;
      retstr->var4 = 0.0;
      retstr->float var2 = 1.0;
      break;
    case 2uLL:
      *(void *)&retstr->var0 = 0;
      *(void *)&retstr->float var2 = 0;
      retstr->var4 = 0.0;
      retstr->float var1 = 1.0;
      break;
    default:
      return self;
  }
  return self;
}

- (void)_updateIdleStateForTime:(double)a3
{
  if (self->_idleState.nextBlink == 0.0) {
    [(NTKSnowglobeEyeController *)self _decideNextBlink:a3];
  }
  if (self->_animationEnabled)
  {
    double nextBlink = self->_idleState.nextBlink;
    float v6 = 0.0;
    if (nextBlink < a3)
    {
      double v7 = a3 - nextBlink;
      [(NTKSnowglobeDigitProfile *)self->_profile blinkDuration];
      double v9 = v7 / v8;
      if (v9 >= 1.0)
      {
        [(NTKSnowglobeEyeController *)self _decideNextBlink:a3];
      }
      else
      {
        double v10 = 1.0 - fabs(v9 * 2.0 + -1.0);
        if (v10 < 0.0) {
          double v10 = 0.0;
        }
        float v6 = v10;
      }
    }
    self->_idleState.blinkProgress = v6;
    if (self->_idleState.nextSquintChange >= a3)
    {
      double squintChange = self->_idleState.squintChange;
      BOOL squint = self->_idleState.squint;
    }
    else
    {
      [(NTKSnowglobeEyeController *)self _decideNextSquintChange:a3];
      self->_idleState.double squintChange = a3;
      BOOL squint = !self->_idleState.squint;
      self->_idleState.squint ^= 1u;
      double squintChange = a3;
    }
    double v14 = fmin((a3 - squintChange) / 0.2, 1.0);
    if (!squint) {
      double v14 = 1.0 - v14;
    }
    float v11 = v14;
  }
  else
  {
    self->_idleState.blinkProgress = 0.0;
    float v11 = 0.0;
  }
  self->_idleState.squintProgress = v11;
}

- (void)_decideNextBlink:(double)a3
{
  [(NTKSnowglobeDigitProfile *)self->_profile blinkTime];
  self->_idleState.double nextBlink = a3 + 1.0 + (double)arc4random() / 4294967300.0 * v5;
}

- (void)_decideNextSquintChange:(double)a3
{
  [(NTKSnowglobeDigitProfile *)self->_profile squintRatio];
  float v6 = v5;
  uint32_t v7 = arc4random();
  if (self->_idleState.squint) {
    float v8 = 1.0;
  }
  else {
    float v8 = v6;
  }
  float v9 = 1.0 / v6;
  if (!self->_idleState.squint) {
    float v9 = 1.0;
  }
  if (v6 < 1.0) {
    float v10 = v9;
  }
  else {
    float v10 = v8;
  }
  self->_idleState.nextSquintChange = a3 + ((double)v7 / 4294967300.0 * 2.0 + 1.0) * v10;
}

- (SCNNode)leftEyeNode
{
  return self->_leftEyeNode;
}

- (SCNNode)rightEyeNode
{
  return self->_rightEyeNode;
}

- (BOOL)animationEnabled
{
  return self->_animationEnabled;
}

- (void)setAnimationEnabled:(BOOL)a3
{
  self->_animationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEyeNode, 0);
  objc_storeStrong((id *)&self->_leftEyeNode, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end
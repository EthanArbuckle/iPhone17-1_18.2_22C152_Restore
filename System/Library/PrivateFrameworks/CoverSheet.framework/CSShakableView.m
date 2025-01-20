@interface CSShakableView
- (CSShakableView)initWithFrame:(CGRect)a3;
- (NSArray)prototypeSpringAnimations;
- (SBFTouchPassThroughView)containerView;
- (double)shakeDistance;
- (id)_defaultSpringAnimations;
- (void)_invokeCompletionBlockIfNecessary;
- (void)beginShakingWithCompletion:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setPrototypeSpringAnimations:(id)a3;
- (void)setShakeDistance:(double)a3;
@end

@implementation CSShakableView

- (CSShakableView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CSShakableView;
  v3 = -[CSShakableView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (SBFTouchPassThroughView *)objc_alloc_init(MEMORY[0x1E4FA6028]);
    containerView = v3->_containerView;
    v3->_containerView = v4;

    [(SBFTouchPassThroughView *)v3->_containerView setAutoresizingMask:2];
    [(CSShakableView *)v3 setShakeDistance:75.0];
    v6 = [(CSShakableView *)v3 _defaultSpringAnimations];
    [(CSShakableView *)v3 setPrototypeSpringAnimations:v6];

    [(CSShakableView *)v3 addSubview:v3->_containerView];
  }
  return v3;
}

- (void)dealloc
{
  v3 = (void *)MEMORY[0x1D94870A0](self, a2);
  [(CSShakableView *)self _invokeCompletionBlockIfNecessary];
  v4.receiver = self;
  v4.super_class = (Class)CSShakableView;
  [(CSShakableView *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CSShakableView;
  [(CSShakableView *)&v4 layoutSubviews];
  containerView = self->_containerView;
  [(CSShakableView *)self bounds];
  -[SBFTouchPassThroughView setFrame:](containerView, "setFrame:");
}

- (id)_defaultSpringAnimations
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  objc_super v4 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.x"];
  [v4 setMass:1.20000005];
  [v4 setStiffness:1200.0];
  [v4 setDamping:12.0];
  LODWORD(v5) = 1028389654;
  LODWORD(v6) = 990057071;
  LODWORD(v7) = 1059712716;
  LODWORD(v8) = 1.0;
  v9 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v5 :v6 :v7 :v8];
  [v4 setTimingFunction:v9];

  [v4 setDuration:0.860000014];
  [v4 setVelocity:0.0];
  uint64_t v10 = *MEMORY[0x1E4F39F98];
  [v4 setFillMode:*MEMORY[0x1E4F39F98]];
  [v4 setDelegate:self];
  [v3 addObject:v4];
  v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.x"];
  LODWORD(v12) = 1036831949;
  LODWORD(v13) = 0.25;
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 1.0;
  v16 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v13 :v12 :v14 :v15];
  [v11 setTimingFunction:v16];

  [v11 setDuration:0.0700000003];
  [v11 setFillMode:v10];
  [v3 addObject:v11];

  return v3;
}

- (void)_invokeCompletionBlockIfNecessary
{
  shakeCompletionBlock = (void (**)(id, SEL))self->_shakeCompletionBlock;
  if (shakeCompletionBlock)
  {
    shakeCompletionBlock[2](shakeCompletionBlock, a2);
    id v4 = self->_shakeCompletionBlock;
    self->_shakeCompletionBlock = 0;
  }
}

- (void)beginShakingWithCompletion:(id)a3
{
  id v4 = a3;
  [(CSShakableView *)self _invokeCompletionBlockIfNecessary];
  double v5 = (void *)MEMORY[0x1D9487300](v4);

  id shakeCompletionBlock = self->_shakeCompletionBlock;
  self->_id shakeCompletionBlock = v5;

  double v7 = [(CSShakableView *)self layer];
  [v7 position];
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  double v12 = [(CSShakableView *)self prototypeSpringAnimations];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__CSShakableView_beginShakingWithCompletion___block_invoke;
  v13[3] = &unk_1E6ADA968;
  v13[5] = v9;
  v13[6] = v11;
  v13[4] = self;
  [v12 enumerateObjectsUsingBlock:v13];
}

void __45__CSShakableView_beginShakingWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = (id)[a2 copy];
  double v5 = NSNumber;
  double v6 = *(double *)(a1 + 40);
  [*(id *)(a1 + 32) shakeDistance];
  uint64_t v8 = [v5 numberWithDouble:v6 - v7];
  [v11 setFromValue:v8];

  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 416);
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"SpringAnimation-%lu", a3);
  [v9 addAnimation:v11 forKey:v10];
}

- (SBFTouchPassThroughView)containerView
{
  return self->_containerView;
}

- (NSArray)prototypeSpringAnimations
{
  return self->_prototypeSpringAnimations;
}

- (void)setPrototypeSpringAnimations:(id)a3
{
}

- (double)shakeDistance
{
  return self->_shakeDistance;
}

- (void)setShakeDistance:(double)a3
{
  self->_shakeDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeSpringAnimations, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong(&self->_shakeCompletionBlock, 0);
}

@end
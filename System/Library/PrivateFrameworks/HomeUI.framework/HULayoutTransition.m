@interface HULayoutTransition
- (HULayoutTransition)init;
- (HULayoutTransition)initWithView:(id)a3 setupBlock:(id)a4 transitionBlock:(id)a5 completionBlock:(id)a6;
- (UIView)view;
- (id)completionBlock;
- (id)fromState;
- (id)setupBlock;
- (id)toState;
- (id)transitionBlock;
- (unint64_t)phase;
- (void)completeTransition;
- (void)executeTransition;
- (void)setFromState:(id)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setToState:(id)a3;
- (void)setupTransitionWithFromState:(id)a3 toState:(id)a4;
@end

@implementation HULayoutTransition

- (HULayoutTransition)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithView_setupBlock_transitionBlock_completionBlock_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULayoutTransition.m", 26, @"%s is unavailable; use %@ instead",
    "-[HULayoutTransition init]",
    v5);

  return 0;
}

- (HULayoutTransition)initWithView:(id)a3 setupBlock:(id)a4 transitionBlock:(id)a5 completionBlock:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v13)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"HULayoutTransition.m", 31, @"Invalid parameter not satisfying: %@", @"setupBlock" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)HULayoutTransition;
  v16 = [(HULayoutTransition *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_view, a3);
    v18 = _Block_copy(v13);
    id setupBlock = v17->_setupBlock;
    v17->_id setupBlock = v18;

    v20 = _Block_copy(v14);
    id transitionBlock = v17->_transitionBlock;
    v17->_id transitionBlock = v20;

    v22 = _Block_copy(v15);
    id completionBlock = v17->_completionBlock;
    v17->_id completionBlock = v22;

    v17->_phase = 0;
  }

  return v17;
}

- (void)setupTransitionWithFromState:(id)a3 toState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HULayoutTransition *)self phase])
  {
    NSLog(&cfstr_AttemptingToSe_0.isa);
  }
  else
  {
    [(HULayoutTransition *)self setFromState:v6];
    [(HULayoutTransition *)self setToState:v7];
    [(HULayoutTransition *)self setPhase:1];
    v8 = (void *)MEMORY[0x1E4F42FF0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__HULayoutTransition_setupTransitionWithFromState_toState___block_invoke;
    v9[3] = &unk_1E6386340;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [v8 performWithoutAnimation:v9];
  }
}

void __59__HULayoutTransition_setupTransitionWithFromState_toState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) setupBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) setupBlock];
    v3[2](v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  v4 = [*(id *)(a1 + 32) view];
  [v4 updateConstraintsIfNeeded];

  id v5 = [*(id *)(a1 + 32) view];
  [v5 layoutIfNeeded];
}

- (void)executeTransition
{
  if ([(HULayoutTransition *)self phase] == 1)
  {
    [(HULayoutTransition *)self setPhase:2];
    v3 = [(HULayoutTransition *)self transitionBlock];
    v4 = [(HULayoutTransition *)self fromState];
    id v5 = [(HULayoutTransition *)self toState];
    ((void (**)(void, void *, void *))v3)[2](v3, v4, v5);

    id v6 = [(HULayoutTransition *)self view];
    [v6 updateConstraintsIfNeeded];

    id v7 = [(HULayoutTransition *)self view];
    [v7 layoutIfNeeded];
  }
  else
  {
    NSLog(&cfstr_AttemptingToEx.isa, [(HULayoutTransition *)self phase]);
  }
}

- (void)completeTransition
{
  if ([(HULayoutTransition *)self phase] == 2)
  {
    [(HULayoutTransition *)self setPhase:3];
    v3 = [(HULayoutTransition *)self completionBlock];

    if (v3)
    {
      id v6 = [(HULayoutTransition *)self completionBlock];
      v4 = [(HULayoutTransition *)self fromState];
      id v5 = [(HULayoutTransition *)self toState];
      v6[2](v6, v4, v5);
    }
  }
  else
  {
    NSLog(&cfstr_AttemptingToCo.isa, [(HULayoutTransition *)self phase]);
  }
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (UIView)view
{
  return self->_view;
}

- (id)setupBlock
{
  return self->_setupBlock;
}

- (id)transitionBlock
{
  return self->_transitionBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (id)fromState
{
  return self->_fromState;
}

- (void)setFromState:(id)a3
{
}

- (id)toState
{
  return self->_toState;
}

- (void)setToState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_toState, 0);
  objc_storeStrong(&self->_fromState, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_transitionBlock, 0);
  objc_storeStrong(&self->_setupBlock, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end
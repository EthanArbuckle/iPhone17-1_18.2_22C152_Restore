@interface ARUICountdownAnimator
- (ARUICountdownAnimator)initWithTimeline:(id)a3;
- (ARUICountdownAnimatorDelegate)delegate;
- (ARUICountdownTimeline)timeline;
- (ARUICountdownView)countdownView;
- (BOOL)canceled;
- (BOOL)isAnimating;
- (void)_applyAnimationAtIndex:(unint64_t)a3;
- (void)_applyCancelAnimationAtIndex:(unint64_t)a3;
- (void)_delegate_completedAnimation:(id)a3;
- (void)_delegate_didFinishAnimating;
- (void)_delegate_performingAnimation:(id)a3 withDuration:(double)a4;
- (void)_delegate_willBeginAnimating;
- (void)_delegate_willBeginAnimation:(id)a3 afterDelay:(double)a4;
- (void)beginAnimations;
- (void)cancelAnimations;
- (void)prepareToAnimate;
- (void)setCountdownView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTimeline:(id)a3;
@end

@implementation ARUICountdownAnimator

- (ARUICountdownAnimator)initWithTimeline:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARUICountdownAnimator;
  v6 = [(ARUICountdownAnimator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_timeline, a3);
    *(_WORD *)&v7->_animating = 0;
  }

  return v7;
}

- (void)prepareToAnimate
{
  id v4 = [(ARUICountdownTimeline *)self->_timeline prepareToAnimate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_countdownView);
  [v4 applyToCountdownView:WeakRetained completion:0];
}

- (void)beginAnimations
{
  if (!self->_animating)
  {
    [(ARUICountdownAnimator *)self _delegate_willBeginAnimating];
    *(_WORD *)&self->_animating = 1;
    objc_initWeak(&location, self);
    v3 = [(ARUICountdownTimeline *)self->_timeline prepareToAnimate];
    objc_storeWeak((id *)&self->_currentAnimation, v3);

    id v4 = [(ARUICountdownTimeline *)self->_timeline prepareToAnimate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_countdownView);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__ARUICountdownAnimator_beginAnimations__block_invoke;
    v6[3] = &unk_264498DD0;
    objc_copyWeak(&v7, &location);
    [v4 applyToCountdownView:WeakRetained completion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __40__ARUICountdownAnimator_beginAnimations__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _applyAnimationAtIndex:0];
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)_applyAnimationAtIndex:(unint64_t)a3
{
  if (![(ARUICountdownAnimator *)self canceled] && [(ARUICountdownAnimator *)self isAnimating])
  {
    id v5 = [(ARUICountdownTimeline *)self->_timeline animations];
    unint64_t v6 = [v5 count];

    if (v6 <= a3)
    {
      *(_WORD *)&self->_animating = 0;
      [(ARUICountdownAnimator *)self _delegate_didFinishAnimating];
    }
    else
    {
      id v7 = [(ARUICountdownTimeline *)self->_timeline animations];
      v8 = [v7 objectAtIndex:a3];

      objc_storeWeak((id *)&self->_currentAnimation, v8);
      [v8 delay];
      double v10 = v9;
      -[ARUICountdownAnimator _delegate_willBeginAnimation:afterDelay:](self, "_delegate_willBeginAnimation:afterDelay:", v8);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v8);
      float v11 = v10;
      if (ARUIFloatGreater(v11, 0.0))
      {
        objc_copyWeak(&to, (id *)&self->_countdownView);
        dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke;
        block[3] = &unk_264498E40;
        objc_copyWeak(&v19, &location);
        objc_copyWeak(&v20, &from);
        objc_copyWeak(v21, &to);
        v21[1] = (id)a3;
        dispatch_after(v12, MEMORY[0x263EF83A0], block);
        objc_destroyWeak(v21);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&v19);
        p_id to = &to;
      }
      else
      {
        [v8 duration];
        -[ARUICountdownAnimator _delegate_performingAnimation:withDuration:](self, "_delegate_performingAnimation:withDuration:", v8);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_countdownView);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke_3;
        v15[3] = &unk_264498E18;
        objc_copyWeak(&v16, &location);
        objc_copyWeak(v17, &from);
        v17[1] = (id)a3;
        [v8 applyToCountdownView:WeakRetained completion:v15];

        objc_destroyWeak(v17);
        p_id to = &v16;
      }
      objc_destroyWeak(p_to);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
}

void __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke(id *a1)
{
  v2 = a1 + 4;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  if (([WeakRetained canceled] & 1) == 0 && objc_msgSend(WeakRetained, "isAnimating"))
  {
    id v4 = objc_loadWeakRetained(a1 + 5);
    id v5 = objc_loadWeakRetained(a1 + 6);
    [v4 duration];
    objc_msgSend(WeakRetained, "_delegate_performingAnimation:withDuration:", v4);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke_2;
    v6[3] = &unk_264498E18;
    objc_copyWeak(&v7, v2);
    objc_copyWeak(v8, a1 + 5);
    v8[1] = a1[7];
    [v4 applyToCountdownView:v5 completion:v6];
    objc_destroyWeak(v8);
    objc_destroyWeak(&v7);
  }
}

void __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_delegate_completedAnimation:", v2);
  [WeakRetained _applyAnimationAtIndex:*(void *)(a1 + 48) + 1];
}

void __48__ARUICountdownAnimator__applyAnimationAtIndex___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_delegate_completedAnimation:", v2);
  [WeakRetained _applyAnimationAtIndex:*(void *)(a1 + 48) + 1];
}

- (void)cancelAnimations
{
  if (self->_animating)
  {
    p_currentAnimation = &self->_currentAnimation;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentAnimation);
    int v5 = [WeakRetained cancelable];

    if (v5)
    {
      self->_canceled = 1;
      objc_initWeak(&location, self);
      unint64_t v6 = [(ARUICountdownTimeline *)self->_timeline prepareToCancel];
      objc_storeWeak((id *)p_currentAnimation, v6);

      id v7 = [(ARUICountdownTimeline *)self->_timeline prepareToCancel];
      id v8 = objc_loadWeakRetained((id *)&self->_countdownView);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __41__ARUICountdownAnimator_cancelAnimations__block_invoke;
      v9[3] = &unk_264498DD0;
      objc_copyWeak(&v10, &location);
      [v7 applyToCountdownView:v8 completion:v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __41__ARUICountdownAnimator_cancelAnimations__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _applyCancelAnimationAtIndex:0];
}

- (void)_applyCancelAnimationAtIndex:(unint64_t)a3
{
  int v5 = [(ARUICountdownTimeline *)self->_timeline cancelAnimations];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    *(_WORD *)&self->_animating = 0;
    [(ARUICountdownAnimator *)self _delegate_didFinishAnimating];
  }
  else
  {
    id v7 = [(ARUICountdownTimeline *)self->_timeline cancelAnimations];
    id v8 = [v7 objectAtIndex:a3];

    objc_storeWeak((id *)&self->_currentAnimation, v8);
    [(ARUICountdownAnimator *)self _delegate_willBeginAnimation:v8 afterDelay:0.0];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v8);
    [v8 duration];
    -[ARUICountdownAnimator _delegate_performingAnimation:withDuration:](self, "_delegate_performingAnimation:withDuration:", v8);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_countdownView);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__ARUICountdownAnimator__applyCancelAnimationAtIndex___block_invoke;
    v10[3] = &unk_264498E18;
    objc_copyWeak(&v11, &location);
    objc_copyWeak(v12, &from);
    v12[1] = (id)a3;
    [v8 applyToCountdownView:WeakRetained completion:v10];

    objc_destroyWeak(v12);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __54__ARUICountdownAnimator__applyCancelAnimationAtIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_delegate_completedAnimation:", v2);
  [WeakRetained _applyCancelAnimationAtIndex:*(void *)(a1 + 48) + 1];
}

- (void)_delegate_willBeginAnimating
{
  if (self->_delegateFlags.willBeginAnimating)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained countdownAnimatorWillBeginAnimating:self];
  }
}

- (void)_delegate_willBeginAnimation:(id)a3 afterDelay:(double)a4
{
  if (self->_delegateFlags.willBeginAnimation)
  {
    p_delegate = &self->_delegate;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained countdownAnimator:self willBeginAnimation:v7 afterDelay:a4];
  }
}

- (void)_delegate_performingAnimation:(id)a3 withDuration:(double)a4
{
  if (self->_delegateFlags.performingAnimation)
  {
    p_delegate = &self->_delegate;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained countdownAnimator:self performingAnimation:v7 withDuration:a4];
  }
}

- (void)_delegate_completedAnimation:(id)a3
{
  if (self->_delegateFlags.completedAnimation)
  {
    p_delegate = &self->_delegate;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained countdownAnimator:self completedAnimation:v5];
  }
}

- (void)_delegate_didFinishAnimating
{
  if (self->_delegateFlags.didFinishAnimating)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained countdownAnimatorDidFinishAnimating:self];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    self->_delegateFlags.willBeginAnimating = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.willBeginAnimation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.performingAnimation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.completedAnimation = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.didFinishAnimating = objc_opt_respondsToSelector() & 1;
    objc_storeWeak((id *)&self->_delegate, obj);
  }
}

- (ARUICountdownTimeline)timeline
{
  return self->_timeline;
}

- (void)setTimeline:(id)a3
{
}

- (ARUICountdownView)countdownView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_countdownView);

  return (ARUICountdownView *)WeakRetained;
}

- (void)setCountdownView:(id)a3
{
}

- (ARUICountdownAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ARUICountdownAnimatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_countdownView);
  objc_storeStrong((id *)&self->_timeline, 0);

  objc_destroyWeak((id *)&self->_currentAnimation);
}

@end
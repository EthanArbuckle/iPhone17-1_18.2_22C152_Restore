@interface ARUIManualAnimationSequencer
- (ARUIManualAnimationSequencer)init;
- (BOOL)isAnimating;
- (void)addObserver:(id)a3;
- (void)performAfter:(double)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)tick;
@end

@implementation ARUIManualAnimationSequencer

- (ARUIManualAnimationSequencer)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARUIManualAnimationSequencer;
  v2 = [(ARUIManualAnimationSequencer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(ARUIObserverStore);
    observers = v2->_observers;
    v2->_observers = v3;

    v2->_animating = 0;
    v2->_timeUntilCompletion = NAN;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  self->_animating = [(ARUIObserverStore *)self->_observers count] != 0;
}

- (void)removeObserver:(id)a3
{
  self->_animating = [(ARUIObserverStore *)self->_observers count] != 0;
}

- (void)tick
{
  observers = self->_observers;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ARUIManualAnimationSequencer_tick__block_invoke;
  v7[3] = &unk_264499080;
  v7[4] = self;
  [(ARUIObserverStore *)observers enumerateObserversWithBlock:v7];
  double v4 = self->_timeUntilCompletion + -0.0166666667;
  self->_timeUntilCompletion = v4;
  *(float *)&double v4 = v4;
  if (ARUIFloatLess(*(float *)&v4, 0.0))
  {
    v5 = (void (**)(void))[self->_completion copy];
    id completion = self->_completion;
    self->_id completion = 0;

    self->_timeUntilCompletion = NAN;
    v5[2](v5);
  }
}

uint64_t __36__ARUIManualAnimationSequencer_tick__block_invoke(uint64_t a1, void *a2)
{
  return [a2 animationSequencer:*(void *)(a1 + 32) updatedWithTime:0.0166666667];
}

- (void)performAfter:(double)a3 completion:(id)a4
{
  objc_super v6 = (void *)[a4 copy];
  id completion = self->_completion;
  self->_id completion = v6;

  self->_timeUntilCompletion = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end
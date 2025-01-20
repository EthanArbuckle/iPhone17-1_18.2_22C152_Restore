@interface EMKRippleAnimationCoordinator
- (BOOL)_hasNext;
- (BOOL)isStopped;
- (EMKRippleAnimationCoordinator)initWithTextView:(id)a3 animations:(id)a4 foregroundColor:(id)a5 log:(id)a6;
- (NSArray)rippleAnimations;
- (OS_os_log)log;
- (UIColor)foregroundColor;
- (UITextView)textView;
- (id)completionHandler;
- (unint64_t)startedRippleAnimationsIndex;
- (void)_completeWithFinished:(BOOL)a3;
- (void)_startAnimationAtIndex:(unint64_t)a3;
- (void)cleanupIncludingFilterEffect:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setLog:(id)a3;
- (void)setRippleAnimations:(id)a3;
- (void)setStartedRippleAnimationsIndex:(unint64_t)a3;
- (void)setStopped:(BOOL)a3;
- (void)setTextView:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
@end

@implementation EMKRippleAnimationCoordinator

- (EMKRippleAnimationCoordinator)initWithTextView:(id)a3 animations:(id)a4 foregroundColor:(id)a5 log:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)EMKRippleAnimationCoordinator;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(EMKRippleAnimationCoordinator *)&v16 init];
  -[EMKRippleAnimationCoordinator setTextView:](v13, "setTextView:", v12, v16.receiver, v16.super_class);

  [(EMKRippleAnimationCoordinator *)v13 setRippleAnimations:v11];
  [(EMKRippleAnimationCoordinator *)v13 setForegroundColor:v10];

  [(EMKRippleAnimationCoordinator *)v13 setStartedRippleAnimationsIndex:0x7FFFFFFFFFFFFFFFLL];
  [(EMKRippleAnimationCoordinator *)v13 setStopped:0];
  [(EMKRippleAnimationCoordinator *)v13 setLog:v9];

  v14 = [(EMKRippleAnimationCoordinator *)v13 log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = v13;
    _os_log_impl(&dword_1E4A5E000, v14, OS_LOG_TYPE_DEFAULT, "created ripple coordinator: %p", buf, 0xCu);
  }

  return v13;
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(EMKRippleAnimationCoordinator *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1E4A5E000, v5, OS_LOG_TYPE_DEFAULT, "start ripple coordinator", (uint8_t *)&v11, 2u);
  }

  v6 = [(EMKRippleAnimationCoordinator *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(EMKRippleAnimationCoordinator *)self rippleAnimations];
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1E4A5E000, v6, OS_LOG_TYPE_DEFAULT, "ripple animations: %@", (uint8_t *)&v11, 0xCu);
  }
  [(EMKRippleAnimationCoordinator *)self setCompletionHandler:v4];

  [(EMKRippleAnimationCoordinator *)self setStartedRippleAnimationsIndex:0x7FFFFFFFFFFFFFFFLL];
  [(EMKRippleAnimationCoordinator *)self setStopped:0];
  v8 = [(EMKRippleAnimationCoordinator *)self rippleAnimations];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    [(EMKRippleAnimationCoordinator *)self _startAnimationAtIndex:0];
  }
  else
  {
    id v10 = [(EMKRippleAnimationCoordinator *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      id v12 = self;
      _os_log_impl(&dword_1E4A5E000, v10, OS_LOG_TYPE_DEFAULT, "was asked to start but no ripple animations specified. %p", (uint8_t *)&v11, 0xCu);
    }

    [(EMKRippleAnimationCoordinator *)self _completeWithFinished:1];
  }
}

- (void)_startAnimationAtIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  -[EMKRippleAnimationCoordinator setStartedRippleAnimationsIndex:](self, "setStartedRippleAnimationsIndex:");
  v5 = [(EMKRippleAnimationCoordinator *)self rippleAnimations];
  v6 = [v5 objectAtIndexedSubscript:a3];

  v7 = [(EMKRippleAnimationCoordinator *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v16 = a3;
    __int16 v17 = 2048;
    v18 = v6;
    _os_log_impl(&dword_1E4A5E000, v7, OS_LOG_TYPE_DEFAULT, "start ripple at index: %lu - animation: %p", buf, 0x16u);
  }

  v8 = [(EMKRippleAnimationCoordinator *)self textView];
  uint64_t v9 = [(EMKRippleAnimationCoordinator *)self foregroundColor];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__EMKRippleAnimationCoordinator__startAnimationAtIndex___block_invoke;
  v14[3] = &unk_1E6E96E00;
  v14[4] = self;
  id v10 = objc_msgSend(v8, "newRippleAnimatorForAnimation:foregroundColor:notify_emk:", v6, v9, v14);

  [v10 start];
  if ([(EMKRippleAnimationCoordinator *)self _hasNext])
  {
    [v10 nextAnimationTriggerDelay];
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__EMKRippleAnimationCoordinator__startAnimationAtIndex___block_invoke_1;
    block[3] = &unk_1E6E96E28;
    block[4] = self;
    block[5] = a3;
    dispatch_after(v12, MEMORY[0x1E4F14428], block);
  }
}

void __56__EMKRippleAnimationCoordinator__startAnimationAtIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 animation];
    int v15 = 134217984;
    unint64_t v16 = v5;
    _os_log_impl(&dword_1E4A5E000, v4, OS_LOG_TYPE_DEFAULT, "animator state change for animation %p", (uint8_t *)&v15, 0xCu);
  }
  if ([v3 state] == 1)
  {
    v6 = [*(id *)(a1 + 32) rippleAnimations];
    v7 = [v6 lastObject];
    v8 = [v3 animation];

    uint64_t v9 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      LODWORD(v16) = v7 == v8;
      _os_log_impl(&dword_1E4A5E000, v9, OS_LOG_TYPE_DEFAULT, "idle ripple animator - is last: %{BOOL}d", (uint8_t *)&v15, 8u);
    }

    id v10 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = [*(id *)(a1 + 32) rippleAnimations];
      dispatch_time_t v12 = [v11 lastObject];
      int v15 = 134217984;
      unint64_t v16 = v12;
      _os_log_impl(&dword_1E4A5E000, v10, OS_LOG_TYPE_DEFAULT, "last ripple animation: %p", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v13 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v3 animation];
      int v15 = 134217984;
      unint64_t v16 = v14;
      _os_log_impl(&dword_1E4A5E000, v13, OS_LOG_TYPE_DEFAULT, "finished ripple animation: %p", (uint8_t *)&v15, 0xCu);
    }
    if (v7 == v8) {
      [*(id *)(a1 + 32) _completeWithFinished:1];
    }
  }
}

uint64_t __56__EMKRippleAnimationCoordinator__startAnimationAtIndex___block_invoke_1(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isStopped];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 _completeWithFinished:0];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40) + 1;
    return [v3 _startAnimationAtIndex:v5];
  }
}

- (void)_completeWithFinished:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(EMKRippleAnimationCoordinator *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    uint64_t v9 = self;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_1E4A5E000, v5, OS_LOG_TYPE_DEFAULT, "complete ripple coordinator %p - finished: %{BOOL}d", (uint8_t *)&v8, 0x12u);
  }

  v6 = [(EMKRippleAnimationCoordinator *)self completionHandler];

  if (v6)
  {
    v7 = [(EMKRippleAnimationCoordinator *)self completionHandler];
    [(EMKRippleAnimationCoordinator *)self setCompletionHandler:0];
    ((void (**)(void, EMKRippleAnimationCoordinator *, BOOL))v7)[2](v7, self, v3);
  }
}

- (void)stop
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(EMKRippleAnimationCoordinator *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = self;
    _os_log_impl(&dword_1E4A5E000, v3, OS_LOG_TYPE_DEFAULT, "stop ripple coordinator %p", (uint8_t *)&v4, 0xCu);
  }

  [(EMKRippleAnimationCoordinator *)self setStopped:1];
}

- (BOOL)_hasNext
{
  unint64_t v3 = [(EMKRippleAnimationCoordinator *)self startedRippleAnimationsIndex] + 1;
  int v4 = [(EMKRippleAnimationCoordinator *)self rippleAnimations];
  LOBYTE(v3) = v3 < [v4 count];

  return v3;
}

- (void)cleanupIncludingFilterEffect:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(EMKRippleAnimationCoordinator *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = self;
    _os_log_impl(&dword_1E4A5E000, v5, OS_LOG_TYPE_DEFAULT, "cleanup ripple coordinator %p", buf, 0xCu);
  }

  uint64_t v6 = [(EMKRippleAnimationCoordinator *)self textView];
  v7 = [v6 textStorage];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = [(EMKRippleAnimationCoordinator *)self rippleAnimations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "removeRippleAnimation:includingFilterEffect_emk:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), v3);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSArray)rippleAnimations
{
  return self->_rippleAnimations;
}

- (void)setRippleAnimations:(id)a3
{
}

- (unint64_t)startedRippleAnimationsIndex
{
  return self->_startedRippleAnimationsIndex;
}

- (void)setStartedRippleAnimationsIndex:(unint64_t)a3
{
  self->_startedRippleAnimationsIndex = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)isStopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_rippleAnimations, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
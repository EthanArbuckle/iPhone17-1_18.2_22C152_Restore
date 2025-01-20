@interface CalCancelablePerformSelector
- (CalCancelablePerformSelector)initWithBlock:(id)a3;
- (NSRunLoop)runloop;
- (id)block;
- (void)_performBlock:(id)a3;
- (void)cancel;
- (void)performAfterDelay:(double)a3;
- (void)setBlock:(id)a3;
- (void)setRunloop:(id)a3;
@end

@implementation CalCancelablePerformSelector

- (CalCancelablePerformSelector)initWithBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CalCancelablePerformSelector.m", 24, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)CalCancelablePerformSelector;
  v6 = [(CalCancelablePerformSelector *)&v10 init];
  v7 = v6;
  if (v6) {
    [(CalCancelablePerformSelector *)v6 setBlock:v5];
  }

  return v7;
}

- (void)performAfterDelay:(double)a3
{
  id v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [(CalCancelablePerformSelector *)self setRunloop:v5];

  id v7 = [(CalCancelablePerformSelector *)self block];
  v6 = (void *)MEMORY[0x192FD8850]();
  [(CalCancelablePerformSelector *)self performSelector:sel__performBlock_ withObject:v6 afterDelay:a3];
}

- (void)cancel
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "[CalCancelablePerformSelector cancel] called after block was already canceled", v1, 2u);
}

- (void)_performBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (NSRunLoop)runloop
{
  return self->_runloop;
}

- (void)setRunloop:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runloop, 0);

  objc_storeStrong(&self->_block, 0);
}

@end
@interface LAUIAnimationDelegate
- (id)didStartHandler;
- (id)didStopHandler;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)setDidStartHandler:(id)a3;
- (void)setDidStopHandler:(id)a3;
@end

@implementation LAUIAnimationDelegate

- (void)dealloc
{
  id didStopHandler = self->_didStopHandler;
  if (didStopHandler)
  {
    v4 = (void (**)(void, void))MEMORY[0x2166A1D50](didStopHandler, a2);
    id v5 = self->_didStopHandler;
    self->_id didStopHandler = 0;

    v4[2](v4, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)LAUIAnimationDelegate;
  [(LAUIAnimationDelegate *)&v6 dealloc];
}

- (void)animationDidStart:(id)a3
{
  id didStartHandler = self->_didStartHandler;
  if (didStartHandler)
  {
    objc_super v6 = (void (**)(void))MEMORY[0x2166A1D50](didStartHandler, a2, a3);
    id v5 = self->_didStartHandler;
    self->_id didStartHandler = 0;

    v6[2]();
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id didStopHandler = self->_didStopHandler;
  if (didStopHandler)
  {
    BOOL v6 = a4;
    v8 = (void (**)(id, BOOL))MEMORY[0x2166A1D50](didStopHandler, a2, a3);
    id v7 = self->_didStopHandler;
    self->_id didStopHandler = 0;

    v8[2](v8, v6);
  }
}

- (void)setDidStopHandler:(id)a3
{
  id v4 = a3;
  if (self->_didStopHandler != v4)
  {
    v8 = v4;
    id v5 = (void (**)(void, void))MEMORY[0x2166A1D50]();
    BOOL v6 = (void *)[v8 copy];
    id didStopHandler = self->_didStopHandler;
    self->_id didStopHandler = v6;

    if (v5) {
      v5[2](v5, 0);
    }
  }
  MEMORY[0x270F9A758]();
}

- (id)didStartHandler
{
  return self->_didStartHandler;
}

- (void)setDidStartHandler:(id)a3
{
}

- (id)didStopHandler
{
  return self->_didStopHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didStopHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);
}

@end
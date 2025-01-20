@interface CPSCAAnimationBlockDelegate
+ (void)attachToAnimation:(id)a3 didStartHandler:(id)a4 didStopHandler:(id)a5;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation CPSCAAnimationBlockDelegate

+ (void)attachToAnimation:(id)a3 didStartHandler:(id)a4 didStopHandler:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v19 delegate];

  if (v10)
  {
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"The provided animation already has a delegate." userInfo:0];
    objc_exception_throw(v18);
  }
  v11 = objc_alloc_init((Class)a1);
  uint64_t v12 = MEMORY[0x1D9487A30](v8);
  v13 = (void *)v11[2];
  v11[2] = v12;

  uint64_t v14 = MEMORY[0x1D9487A30](v9);
  v15 = (void *)v11[3];
  v11[3] = v14;

  v16 = (void *)v11[1];
  v11[1] = v11;
  v17 = v11;

  [v19 setDelegate:v17];
}

- (void)animationDidStart:(id)a3
{
  didStartHandler = (void (**)(id, id))self->_didStartHandler;
  if (didStartHandler) {
    didStartHandler[2](didStartHandler, a3);
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  didStopHandler = (void (**)(id, id, BOOL))self->_didStopHandler;
  if (didStopHandler) {
    didStopHandler[2](didStopHandler, a3, a4);
  }
  id referenceToSelf = self->_referenceToSelf;
  self->_id referenceToSelf = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didStopHandler, 0);
  objc_storeStrong(&self->_didStartHandler, 0);

  objc_storeStrong(&self->_referenceToSelf, 0);
}

@end
@interface _XRSpaceNotificationShim
- (BOOL)targetIsSet;
- (NSObject)observer;
- (NSObject)target;
- (NSObject)token;
- (XRSpace)space;
- (void)dealloc;
- (void)setObserver:(id)a3;
- (void)setSpace:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTargetIsSet:(BOOL)a3;
- (void)setToken:(id)a3;
@end

@implementation _XRSpaceNotificationShim

- (void)dealloc
{
  if (self->_token)
  {
    v6 = [MEMORY[0x263F08A00] performSelector:a2 withObject:v2 withObject:v3 withObject:v4];
    [v6 removeObserver:self name:v7 object:v8];
  }
  v10.receiver = self;
  v10.super_class = (Class)_XRSpaceNotificationShim;
  [(_XRSpaceNotificationShim *)&v10 dealloc];
}

- (NSObject)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (NSObject)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (BOOL)targetIsSet
{
  return self->_targetIsSet;
}

- (void)setTargetIsSet:(BOOL)a3
{
  self->_targetIsSet = a3;
}

- (NSObject)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (XRSpace)space
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_space);

  return (XRSpace *)WeakRetained;
}

- (void)setSpace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_space);
  objc_storeStrong((id *)&self->_token, 0);
  objc_destroyWeak((id *)&self->_target);

  objc_destroyWeak((id *)&self->_observer);
}

@end
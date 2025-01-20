@interface SCNEventHandler
- (BOOL)autoSwitchToFreeCamera;
- (BOOL)enableFreeCamera;
- (BOOL)wantsRedraw;
- (SCNEventHandler)init;
- (SCNNode)freeCamera;
- (SCNView)view;
- (id)gestureRecognizers;
- (void)activateFreeCamera;
- (void)dealloc;
- (void)setAutoSwitchToFreeCamera:(BOOL)a3;
- (void)setEnableFreeCamera:(BOOL)a3;
- (void)setView:(id)a3;
@end

@implementation SCNEventHandler

- (SCNEventHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNEventHandler;
  result = [(SCNEventHandler *)&v3 init];
  if (result) {
    *(_WORD *)&result->_enableFreeCamera = 257;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SCNEventHandler;
  [(SCNEventHandler *)&v2 dealloc];
}

- (SCNView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  self->_view = (SCNView *)a3;
}

- (id)gestureRecognizers
{
  return 0;
}

- (BOOL)wantsRedraw
{
  return 0;
}

- (SCNNode)freeCamera
{
  return 0;
}

- (BOOL)enableFreeCamera
{
  return self->_enableFreeCamera;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  self->_enableFreeCamera = a3;
}

- (BOOL)autoSwitchToFreeCamera
{
  return self->_autoSwitchToFreeCamera;
}

- (void)setAutoSwitchToFreeCamera:(BOOL)a3
{
  self->_autoSwitchToFreeCamera = a3;
}

- (void)activateFreeCamera
{
}

@end
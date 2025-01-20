@interface AVProxyPlayerLayer
- (BOOL)avkit_isFullScreen;
- (UIWindow)avkit_originalWindow;
- (id)avkit_window;
- (void)avkit_setIsFullScreen:(BOOL)a3;
- (void)avkit_setOriginalWindow:(id)a3;
@end

@implementation AVProxyPlayerLayer

- (void).cxx_destruct
{
}

- (void)avkit_setIsFullScreen:(BOOL)a3
{
  self->_avkit_isFullScreen = a3;
}

- (BOOL)avkit_isFullScreen
{
  return self->_avkit_isFullScreen;
}

- (void)avkit_setOriginalWindow:(id)a3
{
}

- (UIWindow)avkit_originalWindow
{
  return self->_avkit_originalWindow;
}

- (id)avkit_window
{
  return 0;
}

@end
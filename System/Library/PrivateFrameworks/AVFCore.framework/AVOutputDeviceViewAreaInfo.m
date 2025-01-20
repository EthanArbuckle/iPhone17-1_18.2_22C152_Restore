@interface AVOutputDeviceViewAreaInfo
- (AVOutputDeviceViewAreaInfo)initWithViewArea:(id)a3 transitionControl:(BOOL)a4 supportsFocusTransfer:(BOOL)a5 statusBarEdge:(id)a6 safeArea:(id)a7;
- (BOOL)supportsFocusTransfer;
- (BOOL)transitionControl;
- (NSNumber)statusBarEdge;
- (NSValue)safeArea;
- (NSValue)viewArea;
- (void)dealloc;
@end

@implementation AVOutputDeviceViewAreaInfo

- (AVOutputDeviceViewAreaInfo)initWithViewArea:(id)a3 transitionControl:(BOOL)a4 supportsFocusTransfer:(BOOL)a5 statusBarEdge:(id)a6 safeArea:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)AVOutputDeviceViewAreaInfo;
  v12 = [(AVOutputDeviceViewAreaInfo *)&v15 init];
  if (v12)
  {
    v12->_viewArea = (NSValue *)a3;
    v12->_transitionControl = a4;
    v12->_supportsFocusTransfer = a5;
    v12->_statusBarEdge = (NSNumber *)a6;
    v12->_safeArea = (NSValue *)a7;
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceViewAreaInfo;
  [(AVOutputDeviceViewAreaInfo *)&v3 dealloc];
}

- (NSValue)viewArea
{
  return self->_viewArea;
}

- (BOOL)transitionControl
{
  return self->_transitionControl;
}

- (BOOL)supportsFocusTransfer
{
  return self->_supportsFocusTransfer;
}

- (NSNumber)statusBarEdge
{
  return self->_statusBarEdge;
}

- (NSValue)safeArea
{
  return self->_safeArea;
}

@end
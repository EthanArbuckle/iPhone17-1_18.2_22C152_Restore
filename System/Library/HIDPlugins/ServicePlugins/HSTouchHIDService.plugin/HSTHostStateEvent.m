@interface HSTHostStateEvent
+ (const)hsClassName;
- (BOOL)coverClosed;
- (BOOL)displayOff;
- (HSTHostStateEvent)initWithDeviceOrientation:(unsigned __int8)a3 screenOrientation:(unsigned __int8)a4 coverClosed:(BOOL)a5 displayOff:(BOOL)a6;
- (unsigned)deviceOrientation;
- (unsigned)screenOrientation;
- (void)setCoverClosed:(BOOL)a3;
- (void)setDeviceOrientation:(unsigned __int8)a3;
- (void)setDisplayOff:(BOOL)a3;
- (void)setScreenOrientation:(unsigned __int8)a3;
@end

@implementation HSTHostStateEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)72,(char)111,(char)115,(char)116,(char)83,(char)116,(char)97,(char)116,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (HSTHostStateEvent)initWithDeviceOrientation:(unsigned __int8)a3 screenOrientation:(unsigned __int8)a4 coverClosed:(BOOL)a5 displayOff:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)HSTHostStateEvent;
  v10 = [(HSTEvent *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_deviceOrientation = a3;
    v10->_screenOrientation = a4;
    v10->_coverClosed = a5;
    v10->_displayOff = a6;
    v12 = v10;
  }

  return v11;
}

- (unsigned)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(unsigned __int8)a3
{
  self->_deviceOrientation = a3;
}

- (unsigned)screenOrientation
{
  return self->_screenOrientation;
}

- (void)setScreenOrientation:(unsigned __int8)a3
{
  self->_screenOrientation = a3;
}

- (BOOL)coverClosed
{
  return self->_coverClosed;
}

- (void)setCoverClosed:(BOOL)a3
{
  self->_coverClosed = a3;
}

- (BOOL)displayOff
{
  return self->_displayOff;
}

- (void)setDisplayOff:(BOOL)a3
{
  self->_displayOff = a3;
}

@end
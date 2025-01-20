@interface WKStylusDeviceObserver
+ (id)sharedInstance;
- (BOOL)hasStylusDevice;
- (WKStylusDeviceObserver)init;
- (id).cxx_construct;
- (void)changeTimerFired:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setHasStylusDevice:(BOOL)a3;
- (void)start;
- (void)startChangeTimer:(double)a3;
- (void)stop;
@end

@implementation WKStylusDeviceObserver

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

+ (id)sharedInstance
{
  if (byte_1EB359BCB == 1) {
    return (id)qword_1EB359BD8;
  }
  id result = objc_alloc_init(WKStylusDeviceObserver);
  qword_1EB359BD8 = (uint64_t)result;
  byte_1EB359BCB = 1;
  return result;
}

- (void)start
{
  unint64_t v2 = self->_startCount + 1;
  self->_startCount = v2;
  if (v2 <= 1 && WTF::linkedOnOrAfterSDKWithBehavior())
  {
    v4 = objc_opt_class();
    [v4 addObserver:self forKeyPath:@"isPencilInputExpected" options:4 context:0];
  }
}

- (WKStylusDeviceObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)WKStylusDeviceObserver;
  unint64_t v2 = [(WKStylusDeviceObserver *)&v6 init];
  if (v2)
  {
    v2->_hasStylusDevice = [MEMORY[0x1E4F42DA0] isPencilInputExpected];
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"WKStylusDeviceObserverChangeTimeInterval");
    if (v3)
    {
      [v3 doubleValue];
      changeTimeInterval = v4;
      WTFLogAlways();
    }
  }
  return v2;
}

- (BOOL)hasStylusDevice
{
  return self->_hasStylusDevice;
}

- (void)startChangeTimer:(double)a3
{
  [self->_changeTimer.m_ptr invalidate];
  v5 = (void *)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_changeTimerFired_ selector:0 userInfo:0 repeats:a3];
  objc_super v6 = v5;
  if (v5) {
    CFRetain(v5);
  }
  m_ptr = self->_changeTimer.m_ptr;
  self->_changeTimer.m_ptr = v6;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(MEMORY[0x1E4F42DA0], "isPencilInputExpected", a3, a4, a5, a6))
  {
    [(WKStylusDeviceObserver *)self setHasStylusDevice:1];
  }
  else
  {
    double v7 = *(double *)&changeTimeInterval;
    [(WKStylusDeviceObserver *)self startChangeTimer:v7];
  }
}

- (void)setHasStylusDevice:(BOOL)a3
{
  if (self->_hasStylusDevice != a3)
  {
    self->_hasStylusDevice = a3;
    WebKit::WebProcessProxy::notifyHasStylusDeviceChanged((WebKit::WebProcessProxy *)a3);
  }
  [self->_changeTimer.m_ptr invalidate];
  m_ptr = self->_changeTimer.m_ptr;
  self->_changeTimer.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)stop
{
  unint64_t startCount = self->_startCount;
  if (startCount)
  {
    unint64_t v4 = startCount - 1;
    self->_unint64_t startCount = v4;
    if (!v4)
    {
      if (WTF::linkedOnOrAfterSDKWithBehavior())
      {
        v5 = objc_opt_class();
        [v5 removeObserver:self forKeyPath:@"isPencilInputExpected"];
      }
    }
  }
}

- (void)changeTimerFired:(id)a3
{
}

- (void).cxx_destruct
{
  m_ptr = self->_changeTimer.m_ptr;
  self->_changeTimer.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

@end
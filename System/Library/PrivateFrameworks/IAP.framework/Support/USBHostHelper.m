@interface USBHostHelper
- (void)_run;
- (void)dealloc;
- (void)setUsbHostPort:(void *)a3;
- (void)start;
- (void)usbHostPort;
@end

@implementation USBHostHelper

- (void)start
{
  v3 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:self selector:"_run" object:0];
  self->_runLoopThread = v3;
  [(NSThread *)v3 start];
}

- (void)_run
{
  Current = CFRunLoopGetCurrent();
  usbHostPort = self->_usbHostPort;
  v5 = (__CFRunLoopSource *)*((void *)usbHostPort + 27);
  if (v5)
  {
    *((void *)usbHostPort + 28) = Current;
    CFRunLoopAddSource(Current, v5, kCFRunLoopDefaultMode);
    CFRunLoopRun();
  }
}

- (void)dealloc
{
  self->_runLoopThread = 0;
  v3.receiver = self;
  v3.super_class = (Class)USBHostHelper;
  [(USBHostHelper *)&v3 dealloc];
}

- (void)usbHostPort
{
  return self->_usbHostPort;
}

- (void)setUsbHostPort:(void *)a3
{
  self->_usbHostPort = a3;
}

@end
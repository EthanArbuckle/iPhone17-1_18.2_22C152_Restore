@interface CLSGeoServiceThread
- (void)cancel;
- (void)main;
@end

@implementation CLSGeoServiceThread

- (void)cancel
{
  runLoop = self->_runLoop;
  if (runLoop) {
    CFRunLoopStop(runLoop);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLSGeoServiceThread;
  [(CLSGeoServiceThread *)&v4 cancel];
}

- (void)main
{
  v3 = (void *)MEMORY[0x1D2602300](self, a2);
  self->_runLoop = CFRunLoopGetCurrent();
  memset(&v6, 0, sizeof(v6));
  objc_super v4 = CFRunLoopSourceCreate(0, 0, &v6);
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D418];
  CFRunLoopAddSource(self->_runLoop, v4, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  CFRelease(v4);
  CFRunLoopRun();
  CFRunLoopRemoveSource(self->_runLoop, v4, v5);
}

@end
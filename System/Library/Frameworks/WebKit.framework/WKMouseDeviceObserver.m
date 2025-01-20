@interface WKMouseDeviceObserver
+ (id)sharedInstance;
- (BOOL)hasMouseDevice;
- (WKMouseDeviceObserver)init;
- (id).cxx_construct;
- (uint64_t)_setHasMouseDeviceForTesting:(uint64_t)a1;
- (uint64_t)mousePointerDevicesDidChange:(uint64_t)a1;
- (void)_setHasMouseDeviceForTesting:(BOOL)a3;
- (void)mousePointerDevicesDidChange:(id)a3;
- (void)start;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
- (void)stopWithCompletionHandler:(id)a3;
@end

@implementation WKMouseDeviceObserver

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

+ (id)sharedInstance
{
  if (_MergedGlobals_19 == 1) {
    return (id)qword_1EB359BD0;
  }
  id result = objc_alloc_init(WKMouseDeviceObserver);
  qword_1EB359BD0 = (uint64_t)result;
  _MergedGlobals_19 = 1;
  return result;
}

- (void)start
{
}

- (void)startWithCompletionHandler:(id)a3
{
  unint64_t v3 = self->_startCount + 1;
  self->_startCount = v3;
  if (v3 <= 1)
  {
    m_ptr = self->_deviceObserverTokenQueue.m_ptr;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3321888768;
    v9[2] = __52__WKMouseDeviceObserver_startWithCompletionHandler___block_invoke;
    v9[3] = &__block_descriptor_48_e8_32c65_ZTSKZ52__WKMouseDeviceObserver_startWithCompletionHandler__E3__0_e5_v8__0l;
    CFRetain(self);
    v7 = _Block_copy(a3);
    CFTypeRef cf = self;
    CFRetain(self);
    aBlock = _Block_copy(v7);
    dispatch_async(m_ptr, v9);
    _Block_release(v7);
    CFRelease(self);
    _Block_release(aBlock);
    CFTypeRef v8 = cf;
    CFTypeRef cf = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
}

- (WKMouseDeviceObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)WKMouseDeviceObserver;
  v2 = [(WKMouseDeviceObserver *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("WKMouseDeviceObserver _deviceObserverTokenQueue", 0);
    m_ptr = v2->_deviceObserverTokenQueue.m_ptr;
    v2->_deviceObserverTokenQueue.m_ptr = (OS_dispatch_queue *)v3;
    if (m_ptr) {
  }
    }
  return v2;
}

- (BOOL)hasMouseDevice
{
  return self->_hasMouseDevice;
}

- (void)mousePointerDevicesDidChange:(id)a3
{
  BOOL v4 = [a3 count] != 0;
  if (self->_hasMouseDevice != v4)
  {
    self->_hasMouseDevice = v4;
    uint64_t v5 = WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v5 = &unk_1EE9D4310;
    *(unsigned char *)(v5 + 8) = v4;
    uint64_t v6 = v5;
    WTF::ensureOnMainRunLoop();
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    }
  }
}

uint64_t __52__WKMouseDeviceObserver_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F4F350], "sharedInstance"), "addPointerDeviceObserver:", *(void *)(a1 + 32));
  dispatch_queue_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v2) {
    CFRetain(v2);
  }
  uint64_t v5 = *(const void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

- (void)stop
{
}

- (void)stopWithCompletionHandler:(id)a3
{
  unint64_t startCount = self->_startCount;
  if (startCount)
  {
    unint64_t v5 = startCount - 1;
    self->_unint64_t startCount = v5;
    if (!v5)
    {
      m_ptr = self->_deviceObserverTokenQueue.m_ptr;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3321888768;
      v10[2] = __51__WKMouseDeviceObserver_stopWithCompletionHandler___block_invoke;
      v10[3] = &__block_descriptor_48_e8_32c64_ZTSKZ51__WKMouseDeviceObserver_stopWithCompletionHandler__E3__1_e5_v8__0l;
      CFRetain(self);
      CFTypeRef v8 = _Block_copy(a3);
      CFTypeRef cf = self;
      CFRetain(self);
      aBlock = _Block_copy(v8);
      dispatch_async(m_ptr, v10);
      _Block_release(v8);
      CFRelease(self);
      _Block_release(aBlock);
      CFTypeRef v9 = cf;
      CFTypeRef cf = 0;
      if (v9) {
        CFRelease(v9);
      }
    }
  }
}

uint64_t __51__WKMouseDeviceObserver_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(const void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)_setHasMouseDeviceForTesting:(BOOL)a3
{
  self->_hasMouseDevice = a3;
  uint64_t v4 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v4 = &unk_1EE9D4338;
  *(unsigned char *)(v4 + 8) = a3;
  uint64_t v5 = v4;
  WTF::ensureOnMainRunLoop();
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_deviceObserverTokenQueue.m_ptr;
  if (m_ptr) {

  }
  uint64_t v4 = self->_token.m_ptr;
  self->_token.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (uint64_t)mousePointerDevicesDidChange:(uint64_t)a1
{
  return WebKit::WebProcessProxy::notifyHasMouseDeviceChanged((WebKit::WebProcessProxy *)*(unsigned __int8 *)(a1 + 8));
}

- (uint64_t)_setHasMouseDeviceForTesting:(uint64_t)a1
{
  return WebKit::WebProcessProxy::notifyHasMouseDeviceChanged((WebKit::WebProcessProxy *)*(unsigned __int8 *)(a1 + 8));
}

@end
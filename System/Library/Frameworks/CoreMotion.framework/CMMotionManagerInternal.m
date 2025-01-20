@interface CMMotionManagerInternal
- (CMMotionManagerInternal)init;
- (NSOperationQueue)fDeviceMotionLiteClientQueue;
- (NSString)fDeviceMotionLitePhysicalDeviceID;
- (id).cxx_construct;
- (id)fDeviceMotionLiteFusedHandler;
- (id)fDisplayGravityHandler;
- (void)dealloc;
- (void)setFDeviceMotionLiteClientQueue:(id)a3;
- (void)setFDeviceMotionLiteFusedHandler:(id)a3;
- (void)setFDeviceMotionLitePhysicalDeviceID:(id)a3;
- (void)setFDisplayGravityHandler:(id)a3;
- (void)teardownPrivate;
@end

@implementation CMMotionManagerInternal

- (CMMotionManagerInternal)init
{
  v9.receiver = self;
  v9.super_class = (Class)CMMotionManagerInternal;
  v2 = [(CMMotionManagerInternal *)&v9 init];
  if (v2)
  {
    *((_DWORD *)v2 + 2) = 0;
    *((void *)v2 + 2) = 0;
    *((void *)v2 + 3) = 0x3F847AE147AE147BLL;
    *((void *)v2 + 4) = 0;
    *(_OWORD *)(v2 + 40) = 0u;
    *((void *)v2 + 7) = 0xBFF0000000000000;
    *((void *)v2 + 10) = 0;
    *((void *)v2 + 11) = 0x3F847AE147AE147BLL;
    *((void *)v2 + 12) = 0;
    *(_OWORD *)(v2 + 104) = 0u;
    *((void *)v2 + 15) = 0xBFF0000000000000;
    *((void *)v2 + 17) = 0;
    *((void *)v2 + 18) = 0x3F847AE147AE147BLL;
    *((void *)v2 + 19) = 0;
    *((_OWORD *)v2 + 10) = 0u;
    *((void *)v2 + 22) = 0xBFF0000000000000;
    *((void *)v2 + 24) = 0;
    *((void *)v2 + 25) = 0x3F847AE147AE147BLL;
    *((_OWORD *)v2 + 13) = 0u;
    *((void *)v2 + 28) = 0;
    *((void *)v2 + 29) = 0xBFF0000000000000;
    *((void *)v2 + 32) = 0;
    *((void *)v2 + 33) = 0x3F847AE147AE147BLL;
    *((void *)v2 + 36) = 0;
    *((_DWORD *)v2 + 74) = 0;
    *((_OWORD *)v2 + 17) = 0u;
    *((void *)v2 + 38) = 1;
    *((_DWORD *)v2 + 146) = 0;
    *((_DWORD *)v2 + 78) = 256;
    v2[316] = 0;
    *((void *)v2 + 44) = 0;
    *((_OWORD *)v2 + 20) = xmmword_1906093C0;
    *((_OWORD *)v2 + 21) = 0u;
    v2[360] = 0;
    *((void *)v2 + 46) = 0;
    *((void *)v2 + 47) = 0x3FA47AE147AE147BLL;
    *((_OWORD *)v2 + 24) = 0u;
    *((void *)v2 + 50) = 0;
    *((void *)v2 + 51) = 0xBFF0000000000000;
    v2[432] = 0;
    *(_OWORD *)(v2 + 440) = 0u;
    *(_OWORD *)(v2 + 456) = 0u;
    *(_OWORD *)(v2 + 472) = 0u;
    *((_OWORD *)v2 + 32) = 0u;
    *((void *)v2 + 66) = 0;
    *((_WORD *)v2 + 268) = 257;
    *(_OWORD *)(v2 + 616) = 0u;
    v5 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v3, v4);
    objc_msgSend_bundleIdentifier(v5, v6, v7);
    operator new();
  }
  return 0;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 568) = 0u;
  *((_OWORD *)self + 40) = 0u;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMMotionManagerInternal;
  [(CMMotionManagerInternal *)&v3 dealloc];
}

- (void)teardownPrivate
{
  fPrivateDeviceMotionCallbackInfo = self->fPrivateDeviceMotionCallbackInfo;
  if (fPrivateDeviceMotionCallbackInfo)
  {
    uint64_t v4 = MEMORY[0x192FCC3F0](fPrivateDeviceMotionCallbackInfo, a2);
    MEMORY[0x192FCC980](v4, 0xB0C40BC2CC919);
  }
  self->fPrivateDeviceMotionCallbackInfo = 0;

  *(void *)&self->fPrivateDeviceMotionUse9Axis = 0;
}

- (NSOperationQueue)fDeviceMotionLiteClientQueue
{
  return *(NSOperationQueue **)&self->fKeyboardMotionGravityNotificationFrequency;
}

- (void)setFDeviceMotionLiteClientQueue:(id)a3
{
}

- (id)fDeviceMotionLiteFusedHandler
{
  return self->fKeyboardMotionDispatcher;
}

- (void)setFDeviceMotionLiteFusedHandler:(id)a3
{
}

- (NSString)fDeviceMotionLitePhysicalDeviceID
{
  return (NSString *)self->fLocalTimeSyncSemaphore;
}

- (void)setFDeviceMotionLitePhysicalDeviceID:(id)a3
{
}

- (id)fDisplayGravityHandler
{
  return self->_fDeviceMotionLiteClientQueue;
}

- (void)setFDisplayGravityHandler:(id)a3
{
}

- (void).cxx_destruct
{
  sub_1902DD824((uint64_t *)&self->fIsApplicationActive, 0);
  fDeviceMotionErrorQueue = self->fDeviceMotionErrorQueue;
  self->fDeviceMotionErrorQueue = 0;
  if (fDeviceMotionErrorQueue) {
    (*((void (**)(NSOperationQueue *))fDeviceMotionErrorQueue->super.isa + 1))(fDeviceMotionErrorQueue);
  }
  sub_1904A6A20((uint64_t *)&self->fSidebandSensorFusionEnabled, 0);
  fConnectionQueue = self->fConnectionQueue;
  self->fConnectionQueue = 0;
  if (fConnectionQueue)
  {
    v5 = *(void (**)(void))(*(void *)fConnectionQueue + 8);
    v5();
  }
}

@end
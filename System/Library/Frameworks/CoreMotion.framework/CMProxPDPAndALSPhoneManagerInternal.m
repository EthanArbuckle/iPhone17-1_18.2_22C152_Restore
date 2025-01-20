@interface CMProxPDPAndALSPhoneManagerInternal
- (CMProxPDPAndALSPhoneManagerInternal)init;
- (void)_startALSPhoneUpdatesWithHandler:(id)a3;
- (void)_startPDPUpdatesWithHandler:(id)a3;
- (void)dealloc;
@end

@implementation CMProxPDPAndALSPhoneManagerInternal

- (CMProxPDPAndALSPhoneManagerInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMProxPDPAndALSPhoneManagerInternal;
  v2 = [(CMProxPDPAndALSPhoneManagerInternal *)&v4 init];
  if (v2)
  {
    v2->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotionCMProxPDPAndALSPhoneManagerPrivateQueue", 0);
    *(_WORD *)&v2->fStartedPDPUpdates = 0;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  self->fPrivateQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMProxPDPAndALSPhoneManagerInternal;
  [(CMProxPDPAndALSPhoneManagerInternal *)&v3 dealloc];
}

- (void)_startPDPUpdatesWithHandler:(id)a3
{
  fPrivateQueue = self->fPrivateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190452978;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fPrivateQueue, v4);
}

- (void)_startALSPhoneUpdatesWithHandler:(id)a3
{
  fPrivateQueue = self->fPrivateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_190453250;
  v4[3] = &unk_1E568D2F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(fPrivateQueue, v4);
}

@end
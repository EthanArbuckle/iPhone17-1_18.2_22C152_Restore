@interface CMPedestrianFenceManagerInternal
- (CMPedestrianFenceManagerInternal)init;
- (void)_clearFence:(id)a3 force:(BOOL)a4;
- (void)_setFence:(id)a3 withRadius:(id)a4 wake:(BOOL)a5 delay:(id)a6 withCompletion:(id)a7;
- (void)_setInSession:(BOOL)a3 withStatusHandler:(id)a4;
- (void)dealloc;
@end

@implementation CMPedestrianFenceManagerInternal

- (CMPedestrianFenceManagerInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CMPedestrianFenceManagerInternal;
  v2 = [(CMPedestrianFenceManagerInternal *)&v4 init];
  if (v2)
  {
    v2->fFenceHandler = 0;
    v2->fStatusHandler = 0;
    v2->fPrivateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreMotion.CMPedestrianFenceManagerPrivateQueue", 0);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  self->fFenceHandler = 0;
  self->fStatusHandler = 0;
  dispatch_release((dispatch_object_t)self->fPrivateQueue);
  self->fPrivateQueue = 0;
  if (self->fLocationdConnection)
  {
    uint64_t v3 = MEMORY[0x192FCC3F0]();
    MEMORY[0x192FCC980](v3, 0xB0C40BC2CC919);
  }
  self->fLocationdConnection = 0;
  v4.receiver = self;
  v4.super_class = (Class)CMPedestrianFenceManagerInternal;
  [(CMPedestrianFenceManagerInternal *)&v4 dealloc];
}

- (void)_setInSession:(BOOL)a3 withStatusHandler:(id)a4
{
  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19057F318;
  block[3] = &unk_1E568FD58;
  BOOL v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(fPrivateQueue, block);
}

- (void)_setFence:(id)a3 withRadius:(id)a4 wake:(BOOL)a5 delay:(id)a6 withCompletion:(id)a7
{
  fPrivateQueue = self->fPrivateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19057F698;
  v8[3] = &unk_1E568FD80;
  v8[7] = a6;
  v8[8] = a7;
  v8[4] = self;
  v8[5] = a3;
  BOOL v9 = a5;
  v8[6] = a4;
  dispatch_async(fPrivateQueue, v8);
}

- (void)_clearFence:(id)a3 force:(BOOL)a4
{
  fPrivateQueue = self->fPrivateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19057FCD0;
  block[3] = &unk_1E568F468;
  BOOL v6 = a4;
  block[4] = a3;
  block[5] = self;
  dispatch_async(fPrivateQueue, block);
}

@end
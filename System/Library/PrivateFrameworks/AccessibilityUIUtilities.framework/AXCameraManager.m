@interface AXCameraManager
- (AXCameraManager)init;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)fetchCurrentCameraSceneBufferWithHandler:(id)a3;
@end

@implementation AXCameraManager

- (AXCameraManager)init
{
  return (AXCameraManager *)AccessibilityCameraManager.init()();
}

- (void)fetchCurrentCameraSceneBufferWithHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___AXCameraManager_frameHandler);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AXCameraManager_frameHandler);
  *v6 = sub_1C3A26E60;
  v6[1] = (uint64_t (*)())v5;
  v8 = self;
  swift_retain();
  sub_1C3A2674C(v7);
  sub_1C3A25D8C();

  swift_release();
}

- (void).cxx_destruct
{
  sub_1C3A2674C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AXCameraManager_frameHandler));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AXCameraManager_session);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1C3A26C00(v9);
}

@end
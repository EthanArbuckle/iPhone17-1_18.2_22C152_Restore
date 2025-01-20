@interface CameraSource.CameraManager
- (_TtCV5Human12CameraSource13CameraManager)init;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4;
- (void)dealloc;
@end

@implementation CameraSource.CameraManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_cameraSession);
  v5 = self;
  objc_msgSend(v4, sel_stopRunning);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(CameraSource.CameraManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_rotationCoordinator));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_dataOutputSynchronizer));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtCV5Human12CameraSource13CameraManager_dataOutput);
}

- (_TtCV5Human12CameraSource13CameraManager)init
{
  result = (_TtCV5Human12CameraSource13CameraManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2528D9284(v7);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_2528D9540(v9);
}

@end
@interface CameraInputSourceManager
- (_TtC15assistivetouchd24CameraInputSourceManager)init;
- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)dealloc;
@end

@implementation CameraInputSourceManager

- (_TtC15assistivetouchd24CameraInputSourceManager)init
{
  return (_TtC15assistivetouchd24CameraInputSourceManager *)sub_1000E9080();
}

- (void)dealloc
{
  v2 = self;
  CameraInputSourceManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15assistivetouchd24CameraInputSourceManager_captureSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15assistivetouchd24CameraInputSourceManager_captureSessionPreset));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15assistivetouchd24CameraInputSourceManager_captureOutputQueue));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15assistivetouchd24CameraInputSourceManager_captureOutputPreview);
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  sub_1000F00F4(0, &qword_1001EFA40);
  v8 = (AVCaptureOutputInternal *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = (objc_class *)a3;
  v10 = (AVCaptureMetadataOutputInternal *)a5;
  v11 = self;
  v15.super.super.isa = v9;
  v15.super._outputInternal = v8;
  v15._internal = v10;
  CameraInputSourceManager.metadataOutput(_:didOutput:from:)(v15, v12, v13);

  swift_bridgeObjectRelease();
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  v8 = (objc_class *)a3;
  v9 = a4;
  v10 = (opaqueCMSampleBuffer *)a5;
  v11.super.Class isa = (Class)self;
  Class isa = v11.super.isa;
  v12.super.Class isa = v8;
  v12._outputInternal = v9;
  CameraInputSourceManager.captureOutput(_:didOutput:from:)(v12, v10, v11);
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  v8 = (objc_class *)a3;
  v9 = a4;
  v10 = (opaqueCMSampleBuffer *)a5;
  v11.super.Class isa = (Class)self;
  Class isa = v11.super.isa;
  v12.super.Class isa = v8;
  v12._outputInternal = v9;
  CameraInputSourceManager.captureOutput(_:didDrop:from:)(v12, v10, v11);
}

@end
@interface DataScannerViewController.Impl
- (_TtCC9VisionKit25DataScannerViewController4Impl)init;
- (void)avCaptureFrameProvider:(id)a3 cameraAccessGranted:(BOOL)a4;
- (void)avCaptureFrameProvider:(id)a3 didCapturePhoto:(id)a4 error:(id)a5;
- (void)avCaptureFrameProvider:(id)a3 didChangeIsRunning:(BOOL)a4;
- (void)avCaptureFrameProviderDidFinishPreparation:(id)a3;
- (void)avCaptureFrameProviderDidZoom:(id)a3;
- (void)cameraRestrictedDidChange:(id)a3;
- (void)frameProvider:(id)a3 didChangeSceneLuminosity:(double)a4;
- (void)frameProvider:(id)a3 didChangeSceneStabilityState:(unint64_t)a4;
@end

@implementation DataScannerViewController.Impl

- (void)frameProvider:(id)a3 didChangeSceneStabilityState:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_21796B688(v6, a4);
}

- (void)frameProvider:(id)a3 didChangeSceneLuminosity:(double)a4
{
  id v6 = a3;
  v7 = self;
  sub_21796BAA0(v6, a4);
}

- (void)avCaptureFrameProvider:(id)a3 didChangeIsRunning:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_21796BF30(v6, v4);
}

- (void)avCaptureFrameProvider:(id)a3 didCapturePhoto:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_21796C08C(v8, v9, a5);
}

- (void)avCaptureFrameProviderDidZoom:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21796C7C4(v4);
}

- (void)avCaptureFrameProviderDidFinishPreparation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21796C930(v4);
}

- (void)avCaptureFrameProvider:(id)a3 cameraAccessGranted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_21796CDAC(v6, v4);
}

- (void)cameraRestrictedDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_217979968();
}

- (_TtCC9VisionKit25DataScannerViewController4Impl)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DataScannerViewController.Impl();
  return [(DataScannerViewController.Impl *)&v4 init];
}

- (void).cxx_destruct
{
}

@end
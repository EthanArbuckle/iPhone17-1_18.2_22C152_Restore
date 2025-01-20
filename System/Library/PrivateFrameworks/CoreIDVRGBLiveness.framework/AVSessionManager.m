@interface AVSessionManager
- (_TtC18CoreIDVRGBLiveness16AVSessionManager)init;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 willCapturePhotoForResolvedSettings:(id)a4;
- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4;
@end

@implementation AVSessionManager

- (_TtC18CoreIDVRGBLiveness16AVSessionManager)init
{
  return (_TtC18CoreIDVRGBLiveness16AVSessionManager *)sub_21EE1B0B4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_21EE227B0((uint64_t)self + OBJC_IVAR____TtC18CoreIDVRGBLiveness16AVSessionManager_delegate);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)captureOutput:(id)a3 willCapturePhotoForResolvedSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_21EE2073C();
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_21EE20A90(v9, a5);
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_21EE215A0(v7);
}

@end
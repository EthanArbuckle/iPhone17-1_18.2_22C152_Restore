@interface MAGCaptureService
- (_TtC16MagnifierSupport17MAGCaptureService)init;
- (void)captureOutput:(id)a3 didCapturePhotoForResolvedSettings:(id)a4;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 willBeginCaptureForResolvedSettings:(id)a4;
- (void)sessionControlsDidBecomeActive:(id)a3;
- (void)sessionControlsDidBecomeInactive:(id)a3;
- (void)sessionControlsWillEnterFullscreenAppearance:(id)a3;
- (void)sessionControlsWillExitFullscreenAppearance:(id)a3;
- (void)sessionInterruptionEndedWithNotification:(id)a3;
- (void)sessionRuntimeErrorWithNotification:(id)a3;
- (void)sessionWasInterruptedWithNotification:(id)a3;
@end

@implementation MAGCaptureService

- (void)sessionRuntimeErrorWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235837200(v4);
}

- (void)sessionWasInterruptedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235837AFC(v4);
}

- (void)sessionInterruptionEndedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2358383BC(v4);
}

- (_TtC16MagnifierSupport17MAGCaptureService)init
{
  result = (_TtC16MagnifierSupport17MAGCaptureService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_captureSessionQueue));
  sub_23566A3AC((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_captureSessionRuntimeErrorSubscription, &qword_268813368);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_cameraVideoDataOutput));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_videoDeviceRotationCoordinator));
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_contrastSliderControl));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_brightnessSliderControl));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService_filterPickerControl));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17MAGCaptureService__capturedImage;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF14FE0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF151E0);
  MEMORY[0x270FA5388](v9 - 8, v10, v11, v12, v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MAGCMSampleBufferWrapper();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a4;
  uint64_t v17 = sub_235949EA8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = self;
  v19 = a4;
  v20 = self;
  v21 = v19;
  v22 = v20;
  id v23 = a3;
  id v24 = a5;
  sub_2357A1990((uint64_t)v15, (uint64_t)&unk_268813288, (uint64_t)v18);

  swift_release();
}

- (void)captureOutput:(id)a3 willBeginCaptureForResolvedSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23583A7D4();
}

- (void)captureOutput:(id)a3 didCapturePhotoForResolvedSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23583A7D4();
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  id v11 = a5;
  sub_23583A9EC(v9, a5);
}

- (void)sessionControlsDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23583A7D4();
}

- (void)sessionControlsDidBecomeInactive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23583A7D4();
}

- (void)sessionControlsWillEnterFullscreenAppearance:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23583A7D4();
}

- (void)sessionControlsWillExitFullscreenAppearance:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23583A7D4();
}

@end
@interface AVCameraSource
- (_TtC6Tamale14AVCameraSource)init;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
@end

@implementation AVCameraSource

- (_TtC6Tamale14AVCameraSource)init
{
  result = (_TtC6Tamale14AVCameraSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10010C310(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6Tamale14AVCameraSource_highQualityFrame), *(void *)&self->highQualityFrame[OBJC_IVAR____TtC6Tamale14AVCameraSource_highQualityFrame], *(void *)&self->highQualityFrame[OBJC_IVAR____TtC6Tamale14AVCameraSource_highQualityFrame + 8], *(void *)&self->highQualityFrame[OBJC_IVAR____TtC6Tamale14AVCameraSource_highQualityFrame + 16]);

  sub_10010C310(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6Tamale14AVCameraSource___latestFrame), *(void *)&self->highQualityFrame[OBJC_IVAR____TtC6Tamale14AVCameraSource___latestFrame], *(void *)&self->highQualityFrame[OBJC_IVAR____TtC6Tamale14AVCameraSource___latestFrame + 8], *(void *)&self->highQualityFrame[OBJC_IVAR____TtC6Tamale14AVCameraSource___latestFrame + 16]);
  v3 = (char *)self + OBJC_IVAR____TtC6Tamale14AVCameraSource_runStateStreamInternal;
  uint64_t v4 = sub_10000F214((uint64_t *)&unk_10051FB10);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC6Tamale14AVCameraSource_runStateStreamContinuation;
  uint64_t v6 = sub_10000F214(&qword_10051FB20);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_1000BC2F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6Tamale14AVCameraSource__runState), *(void *)&self->highQualityFrame[OBJC_IVAR____TtC6Tamale14AVCameraSource__runState], self->highQualityFrame[OBJC_IVAR____TtC6Tamale14AVCameraSource__runState + 8]);
  v7 = (char *)self + OBJC_IVAR____TtC6Tamale14AVCameraSource_logger;
  uint64_t v8 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC6Tamale14AVCameraSource_signposter;
  uint64_t v10 = type metadata accessor for OSSignposter();
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  sub_10010DE60(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC6Tamale14AVCameraSource____lazy_storage___captureDevice));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6Tamale14AVCameraSource____lazy_storage___captureSession));
  v11 = (char *)self + OBJC_IVAR____TtC6Tamale14AVCameraSource___observationRegistrar;
  uint64_t v12 = type metadata accessor for ObservationRegistrar();
  v13 = *(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8);

  v13(v11, v12);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10010CE64(v9);
}

@end
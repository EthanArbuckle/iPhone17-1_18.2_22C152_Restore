@interface ARCameraSource
- (_TtC6Tamale14ARCameraSource)init;
- (void)dealloc;
- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
@end

@implementation ARCameraSource

- (void)dealloc
{
  uint64_t v3 = sub_10000F214(&qword_10051A8C0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = OBJC_IVAR____TtC6Tamale14ARCameraSource_shutterSoundTask;
  v7 = self;
  swift_retain();
  Task.cancel()();
  swift_release();
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa + v6);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v9;
  swift_retain();
  sub_100064D5C((uint64_t)v5, (uint64_t)&unk_100521188, (uint64_t)v10);
  swift_release();
  sub_100136EA0();
  v11 = (objc_class *)type metadata accessor for ARCameraSource(0);
  v12.receiver = v7;
  v12.super_class = v11;
  [(ARCameraSource *)&v12 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  sub_10014C574((uint64_t)self + OBJC_IVAR____TtC6Tamale14ARCameraSource__configuration, type metadata accessor for CameraControllerConfiguration);

  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6Tamale14ARCameraSource_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10014C574((uint64_t)self + OBJC_IVAR____TtC6Tamale14ARCameraSource_signposter, type metadata accessor for LoggingSignposter);

  v5 = (char *)self + OBJC_IVAR____TtC6Tamale14ARCameraSource_runStateStreamInternal;
  uint64_t v6 = sub_10000F214((uint64_t *)&unk_10051FB10);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC6Tamale14ARCameraSource_runStateStreamContinuation;
  uint64_t v8 = sub_10000F214(&qword_10051FB20);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  sub_1000BC2F4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6Tamale14ARCameraSource__runState), *(void *)&self->arConfiguration[OBJC_IVAR____TtC6Tamale14ARCameraSource__runState], self->_arCameraSourceRecording[OBJC_IVAR____TtC6Tamale14ARCameraSource__runState]);
  swift_release();
  swift_release();
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC6Tamale14ARCameraSource___observationRegistrar;
  uint64_t v10 = type metadata accessor for ObservationRegistrar();
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);

  v11(v9, v10);
}

- (_TtC6Tamale14ARCameraSource)init
{
  result = (_TtC6Tamale14ARCameraSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_100148E00(v7);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1001498EC((uint64_t)v8);
}

- (void)session:(id)a3 didChangeGeoTrackingStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100149DF8(v7);
}

- (void)sessionWasInterrupted:(id)a3
{
  swift_getKeyPath();
  sub_10014572C(&qword_100520F88, (void (*)(uint64_t))type metadata accessor for ARCameraSource);
  id v5 = a3;
  id v6 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

  swift_release();
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100149FE4();
}

@end
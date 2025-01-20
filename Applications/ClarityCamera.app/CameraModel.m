@interface CameraModel
- (_TtC13ClarityCamera11CameraModel)init;
- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6;
- (void)dealloc;
- (void)orientationChangedWithNotification:(id)a3;
- (void)sessionInterruptionEndedWithNotification:(id)a3;
- (void)sessionWasInterruptedWithNotification:(id)a3;
@end

@implementation CameraModel

- (void)dealloc
{
  uint64_t v3 = sub_1000068B8(&qword_1000316D0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = &protocol witness table for MainActor;
  sub_1000090D4((uint64_t)v5, (uint64_t)&unk_1000317A8, v9);
  swift_release();
  v10 = (objc_class *)type metadata accessor for CameraModel();
  v11.receiver = v7;
  v11.super_class = v10;
  [(CameraModel *)&v11 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC13ClarityCamera11CameraModel__recordButtonEnabled;
  uint64_t v4 = sub_1000068B8(&qword_1000317B0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC13ClarityCamera11CameraModel__isRecordingVideo, v4);
  sub_1000070C4((uint64_t)self + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSessionRuntimeErrorSubscription, &qword_100031730);

  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13ClarityCamera11CameraModel_currentPhoto);
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = a5;
  sub_10000DEB0(v8, (uint64_t)a5);
}

- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = a5;
  sub_10000E1A8((uint64_t)a5);
}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  v14 = self;
  id v15 = a6;
  sub_10000E494((uint64_t)v12, (uint64_t)a6);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)orientationChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000E6AC();
}

- (void)sessionWasInterruptedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000EA0C(v4, "Session was interrupted: %@");
}

- (void)sessionInterruptionEndedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000EA0C(v4, "Session ended interruption: %@");
}

- (_TtC13ClarityCamera11CameraModel)init
{
  result = (_TtC13ClarityCamera11CameraModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
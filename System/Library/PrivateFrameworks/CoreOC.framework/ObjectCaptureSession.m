@interface ObjectCaptureSession
- (BOOL)sessionShouldAttemptRelocalization:(id)a3;
- (_TtC6CoreOC20ObjectCaptureSession)init;
- (uint64_t)logThermalStateChange;
- (void)dealloc;
- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4;
- (void)session:(id)a3 didAddAnchors:(id)a4;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didRemoveAnchors:(id)a4;
- (void)session:(id)a3 didUpdateAnchors:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
@end

@implementation ObjectCaptureSession

- (void)dealloc
{
  v2 = self;
  ObjectCaptureSession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession__state;
  uint64_t v4 = sub_24B562F04(&qword_2697CC9D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  v5 = (char *)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession__canTakeManualShot;
  uint64_t v6 = sub_24B562F04(&qword_2697CC9F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  v7 = (char *)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_identifier;
  uint64_t v8 = sub_24B682410();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  sub_24B65A19C(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_stateOnPause));
  sub_24B65E308(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_stateAfterFinishing));
  sub_24B5632A8((uint64_t)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_currentFrame, (uint64_t *)&unk_2697CCA10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24B5632A8((uint64_t)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_snapshotURL, &qword_2697CC1F0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_24B659B3C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession_pointCloud));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_24B5632A8((uint64_t)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession__replayVideoURL, &qword_2697CC1F0);
  sub_24B5632A8((uint64_t)self + OBJC_IVAR____TtC6CoreOC20ObjectCaptureSession__recordVideoURL, &qword_2697CC1F0);

  swift_bridgeObjectRelease();
}

- (_TtC6CoreOC20ObjectCaptureSession)init
{
  result = (_TtC6CoreOC20ObjectCaptureSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_24B65FF0C(v7);
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
}

- (void)session:(id)a3 cameraDidChangeTrackingState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_24B6613C0(v7);
}

- (void)sessionWasInterrupted:(id)a3
{
}

- (void)sessionInterruptionEnded:(id)a3
{
}

- (BOOL)sessionShouldAttemptRelocalization:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = _s6CoreOC20ObjectCaptureSessionC34sessionShouldAttemptRelocalizationySbSo9ARSessionCF_0();

  return self & 1;
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_24B661FA0(v8);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
}

- (uint64_t)logThermalStateChange
{
  uint64_t v0 = sub_24B6824D0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(self, sel_processInfo);
  id v5 = objc_msgSend(v4, sel_thermalState);

  uint64_t v6 = sub_24B57CB70();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v6, v0);
  id v7 = sub_24B6824B0();
  os_log_type_t v8 = sub_24B682B30();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 136380931;
    uint64_t v14 = sub_24B5627B8(0xD000000000000017, 0x800000024B691230, &v15);
    sub_24B682CD0();
    *(_WORD *)(v9 + 12) = 2082;
    uint64_t v14 = (uint64_t)v5;
    type metadata accessor for ThermalState(0);
    uint64_t v11 = sub_24B682820();
    uint64_t v14 = sub_24B5627B8(v11, v12, &v15);
    sub_24B682CD0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B55E000, v7, v8, "ObjectCaptureSession.%{private}s: Caution! Thermal State changed to %{public}s!", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24C5D6C00](v10, -1, -1);
    MEMORY[0x24C5D6C00](v9, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end
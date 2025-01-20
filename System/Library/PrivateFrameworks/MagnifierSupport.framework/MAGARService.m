@interface MAGARService
- (_TtC16MagnifierSupport12MAGARService)init;
- (void)replayConfigurationDidFinishReplaying:(id)a3;
- (void)session:(id)a3 didAddAnchors:(id)a4;
- (void)session:(id)a3 didRemoveAnchors:(id)a4;
- (void)session:(id)a3 didUpdateAnchors:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)session:(id)a3 didUpdateSpatialMappingPointClouds:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionWasInterrupted:(id)a3;
@end

@implementation MAGARService

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2357A3948(v6, v7);
}

- (void)session:(id)a3 didUpdateSpatialMappingPointClouds:(id)a4
{
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

- (void)sessionWasInterrupted:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2357A48A0(v4);
}

- (void)sessionInterruptionEnded:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2357A4E70(v4);
}

- (_TtC16MagnifierSupport12MAGARService)init
{
  result = (_TtC16MagnifierSupport12MAGARService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_arRecordingConfiguration));

  sub_23566A3AC((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport12MAGARService____lazy_storage___currentRecordingURL, (uint64_t *)&unk_268812130);
  sub_23566A3AC((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_lastRecordingURL, (uint64_t *)&unk_26AF12EB0);
  sub_23566A3AC((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_lastScreenRecordingURL, (uint64_t *)&unk_26AF12EB0);
}

- (void)replayConfigurationDidFinishReplaying:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF151E0);
  MEMORY[0x270FA5388](v5 - 8, v6, v7, v8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_detectionModeAutomationRunning) == 1)
  {
    *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16MagnifierSupport12MAGARService_detectionModeAutomationRunning) = 0;
  }
  else
  {
    uint64_t v12 = sub_235949EA8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
    v13 = (void *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = self;
    v14 = self;
    id v15 = a3;
    sub_2357A1990((uint64_t)v11, (uint64_t)&unk_268812118, (uint64_t)v13);

    swift_release();
  }
}

@end
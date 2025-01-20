@interface ARInternalSessionObserverWrapper
- (BOOL)sessionShouldAttemptRelocalization:(id)a3;
- (_TtC8RoomPlan32ARInternalSessionObserverWrapper)init;
- (void)replayConfigurationDidFinishReplaying:(id)a3;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)session:(id)a3 didUpdateSpatialMappingPointClouds:(id)a4;
- (void)session:(id)a3 requestedRunWithConfiguration:(id)a4 options:(unint64_t)a5;
- (void)session:(id)a3 willRunWithConfiguration:(id)a4;
- (void)sessionWasInterrupted:(id)a3;
@end

@implementation ARInternalSessionObserverWrapper

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2347A28D0(v6, v7);
}

- (void)session:(id)a3 didUpdateSpatialMappingPointClouds:(id)a4
{
}

- (void)replayConfigurationDidFinishReplaying:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2347B26EC();
}

- (void)session:(id)a3 requestedRunWithConfiguration:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_2347B27A4(v7);
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_2347B2AE8(v7);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_2347B2EB4();
}

- (void)sessionWasInterrupted:(id)a3
{
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    if (*(unsigned char *)(Strong + OBJC_IVAR____TtC8RoomPlan18RoomCaptureSession_runActive) == 1)
    {
      id v6 = a3;
      id v7 = self;
      sub_23479EEAC();
    }
    swift_release();
  }
}

- (BOOL)sessionShouldAttemptRelocalization:(id)a3
{
  return 1;
}

- (_TtC8RoomPlan32ARInternalSessionObserverWrapper)init
{
  return (_TtC8RoomPlan32ARInternalSessionObserverWrapper *)sub_2347AA028(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8RoomPlan32ARInternalSessionObserverWrapper_captureSession, (uint64_t (*)(uint64_t))type metadata accessor for ARInternalSessionObserverWrapper);
}

- (void).cxx_destruct
{
}

@end
@interface TranscriptEntityQueryingXPCServiceServer.Server
- (_TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server)init;
- (void)getTranscriptEntitiesBatchWithId:(id)a3 reply:(id)a4;
- (void)getTranscriptEntitiesWithParameters:(id)a3 reply:(id)a4;
- (void)stopTranscriptEntitiesEnumerationWithId:(id)a3 reply:(id)a4;
@end

@implementation TranscriptEntityQueryingXPCServiceServer.Server

- (void)getTranscriptEntitiesWithParameters:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  v11 = self;
  uint64_t v8 = sub_253DEFDD0();
  unint64_t v10 = v9;

  *(void *)(swift_allocObject() + 16) = v6;
  sub_253DEDA78(v8, v10);
  swift_release();
  sub_253D75D88(v8, v10);
}

- (void)getTranscriptEntitiesBatchWithId:(id)a3 reply:(id)a4
{
}

- (void)stopTranscriptEntitiesEnumerationWithId:(id)a3 reply:(id)a4
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtCV23IntelligenceFlowRuntime40TranscriptEntityQueryingXPCServiceServer6Server)init
{
}

@end
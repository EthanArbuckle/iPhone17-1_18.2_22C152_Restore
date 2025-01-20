@interface _MPCTranscriptAlignmentController
- (BOOL)isEnabled;
- (MPCPlaybackEngineEventConsumer)eventConsumer;
- (NSArray)transcriptAlignments;
- (_MPCTranscriptAlignmentController)init;
- (_MPCTranscriptAlignmentController)initWithPlaybackEngine:(id)a3;
- (void)resolveWith:(double)a3 referenceTime:(double)a4 completionHandler:(id)a5;
- (void)startProcessing;
@end

@implementation _MPCTranscriptAlignmentController

- (MPCPlaybackEngineEventConsumer)eventConsumer
{
  v2 = (void *)sub_21BD2F0FC();

  return (MPCPlaybackEngineEventConsumer *)v2;
}

- (NSArray)transcriptAlignments
{
  v2 = self;
  uint64_t v3 = sub_21BD2F17C();

  if (v3)
  {
    sub_21BD30680();
    v4 = (void *)sub_21BEAA2F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (BOOL)isEnabled
{
  v2 = self;
  char v3 = sub_21BD2F220();

  return v3 & 1;
}

- (_MPCTranscriptAlignmentController)initWithPlaybackEngine:(id)a3
{
  return (_MPCTranscriptAlignmentController *)TranscriptAlignmentController.init(playbackEngine:)(a3);
}

- (void)startProcessing
{
  v2 = self;
  sub_21BD2F37C();
}

- (void)resolveWith:(double)a3 referenceTime:(double)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(double *)(v9 + 16) = a3;
  *(double *)(v9 + 24) = a4;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = self;
  v10 = self;

  sub_21BD2EFC8((uint64_t)&unk_267C65628, v9);
}

- (_MPCTranscriptAlignmentController)init
{
}

- (void).cxx_destruct
{
}

@end
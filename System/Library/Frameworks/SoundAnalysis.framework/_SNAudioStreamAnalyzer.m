@interface _SNAudioStreamAnalyzer
- (BOOL)addRequest:(id)a3 completionHandler:(id)a4 resultsHandler:(id)a5 error:(id *)a6;
- (BOOL)addRequest:(id)a3 withObserver:(id)a4 error:(id *)a5;
- (NSString)detailedDescription;
- (_SNAudioStreamAnalyzer)init;
- (_SNAudioStreamAnalyzer)initWithFormat:(id)a3 error:(id *)a4;
- (void)analyzeAudioBuffer:(id)a3 atAudioFramePosition:(int64_t)a4;
- (void)completeAnalysis;
- (void)dealloc;
- (void)removeAllRequests;
- (void)removeRequest:(id)a3;
@end

@implementation _SNAudioStreamAnalyzer

- (_SNAudioStreamAnalyzer)initWithFormat:(id)a3 error:(id *)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  return (_SNAudioStreamAnalyzer *)sub_1DC8BB210((uint64_t)v5);
}

- (void)dealloc
{
  v2 = self;
  sub_1DC8BC540();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();

  swift_release();
}

- (BOOL)addRequest:(id)a3 withObserver:(id)a4 error:(id *)a5
{
  if (!a3)
  {
    memset(v11, 0, sizeof(v11));
    swift_unknownObjectRetain();
    v8 = self;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    memset(v10, 0, sizeof(v10));
    goto LABEL_6;
  }
  swift_unknownObjectRetain();
  v7 = self;
  swift_unknownObjectRetain();
  sub_1DCB88808();
  swift_unknownObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  sub_1DCB88808();
  swift_unknownObjectRelease();
LABEL_6:
  sub_1DC8BC780((uint64_t)v11, (uint64_t)v10);

  sub_1DC88CC04((uint64_t)v10, &qword_1EAA9CAB0);
  sub_1DC88CC04((uint64_t)v11, &qword_1EAA9CAB0);
  return 1;
}

- (BOOL)addRequest:(id)a3 completionHandler:(id)a4 resultsHandler:(id)a5 error:(id *)a6
{
  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  *(void *)(swift_allocObject() + 16) = v8;
  *(void *)(swift_allocObject() + 16) = v9;
  swift_unknownObjectRetain();
  v10 = self;
  sub_1DC8BCED8();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  return 1;
}

- (void)removeRequest:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1DC8BDB34(v6);

  sub_1DC88CC04((uint64_t)v6, &qword_1EAA9CAB0);
}

- (void)removeAllRequests
{
  v2 = self;
  sub_1DC8BE17C();
}

- (void)analyzeAudioBuffer:(id)a3 atAudioFramePosition:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_1DC8BE500(a3);
}

- (void)completeAnalysis
{
  v2 = self;
  sub_1DC8BEB6C();
}

- (NSString)detailedDescription
{
  v2 = self;
  sub_1DC8BEDBC();

  v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_SNAudioStreamAnalyzer)init
{
}

@end
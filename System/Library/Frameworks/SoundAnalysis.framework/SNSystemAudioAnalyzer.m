@interface SNSystemAudioAnalyzer
+ (void)configureNewAnalyzersToComputeInThisProcess:(BOOL)a3;
- (BOOL)addRequest:(id)a3 withObserver:(id)a4 error:(id *)a5;
- (SNSystemAudioAnalyzer)init;
- (SNSystemAudioAnalyzer)initWithAudioConfiguration:(id)a3;
- (void)addRequestInBackground:(id)a3 withObserver:(id)a4;
- (void)removeAllRequests;
- (void)removeRequest:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SNSystemAudioAnalyzer

+ (void)configureNewAnalyzersToComputeInThisProcess:(BOOL)a3
{
}

- (SNSystemAudioAnalyzer)init
{
  return (SNSystemAudioAnalyzer *)SNSystemAudioAnalyzer.init()();
}

- (SNSystemAudioAnalyzer)initWithAudioConfiguration:(id)a3
{
  return (SNSystemAudioAnalyzer *)sub_1DC9DFB9C(a3);
}

- (BOOL)addRequest:(id)a3 withObserver:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = self;
  sub_1DC9DFCA0(a3, a4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return 1;
}

- (void)addRequestInBackground:(id)a3 withObserver:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_1DC9E00A8(a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)removeRequest:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1DC9E0470(a3);
  swift_unknownObjectRelease();
}

- (void)removeAllRequests
{
  v2 = self;
  sub_1DC9E0740();
}

- (void)start
{
  v2 = self;
  sub_1DC9E09CC("(SNSystemAudioAnalyzer:%s) start");
}

- (void)stop
{
  v2 = self;
  sub_1DC9E09CC("(SNSystemAudioAnalyzer:%s) stop");
}

- (void).cxx_destruct
{
}

@end
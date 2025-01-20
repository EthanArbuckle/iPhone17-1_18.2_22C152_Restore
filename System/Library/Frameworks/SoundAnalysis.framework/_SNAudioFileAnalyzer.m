@interface _SNAudioFileAnalyzer
- (BOOL)addRequest:(id)a3 withObserver:(id)a4 error:(id *)a5;
- (NSString)detailedDescription;
- (_SNAudioFileAnalyzer)init;
- (_SNAudioFileAnalyzer)initWithURL:(id)a3 error:(id *)a4;
- (void)analyze;
- (void)analyzeInRange:(id *)a3;
- (void)analyzeWithCompletionHandler:(id)a3;
- (void)cancelAnalysis;
- (void)removeAllRequests;
- (void)removeRequest:(id)a3;
@end

@implementation _SNAudioFileAnalyzer

- (_SNAudioFileAnalyzer)initWithURL:(id)a3 error:(id *)a4
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
  return (_SNAudioFileAnalyzer *)sub_1DCA9DFB0((uint64_t)v5);
}

- (void)analyzeInRange:(id *)a3
{
  int64_t var3 = a3->var1.var3;
  v5[0] = a3->var0.var0;
  v5[1] = *(void *)&a3->var0.var1;
  long long v6 = *(_OWORD *)&a3->var0.var3;
  uint64_t v7 = *(void *)&a3->var1.var1;
  int64_t v8 = var3;
  v4 = self;
  sub_1DCA9EC58(v5);
}

- (void)analyze
{
  v2 = self;
  sub_1DCA9EF18();
}

- (void)analyzeWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_1DCA9FB70;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  int64_t v8 = self;
  sub_1DCA9EF8C((uint64_t)v7, v6);
  sub_1DC884EC0((uint64_t)v7);
}

- (void)cancelAnalysis
{
}

- (BOOL)addRequest:(id)a3 withObserver:(id)a4 error:(id *)a5
{
  if (!a3)
  {
    memset(v11, 0, sizeof(v11));
    swift_unknownObjectRetain();
    int64_t v8 = self;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    memset(v10, 0, sizeof(v10));
    goto LABEL_6;
  }
  swift_unknownObjectRetain();
  uint64_t v7 = self;
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
  sub_1DCA9F41C((uint64_t)v11, (uint64_t)v10);

  sub_1DC9AEC6C((uint64_t)v10, &qword_1EAA9CAB0);
  sub_1DC9AEC6C((uint64_t)v11, &qword_1EAA9CAB0);
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
  sub_1DCA9F6F0((uint64_t)v6);

  sub_1DC9AEC6C((uint64_t)v6, &qword_1EAA9CAB0);
}

- (void)removeAllRequests
{
  v2 = self;
  sub_1DCA9F824();
}

- (NSString)detailedDescription
{
  v2 = self;
  sub_1DCA9F8EC();

  v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_SNAudioFileAnalyzer)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____SNAudioFileAnalyzer_queue);
}

@end
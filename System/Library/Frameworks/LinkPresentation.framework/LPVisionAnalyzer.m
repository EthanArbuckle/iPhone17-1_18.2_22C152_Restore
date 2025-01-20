@interface LPVisionAnalyzer
- (_TtC16LinkPresentation16LPVisionAnalyzer)init;
- (id)computeSimilarityOf:(id)a3 with:(id)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation LPVisionAnalyzer

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16LinkPresentation16LPVisionAnalyzer_session);
  v3 = self;
  objc_msgSend(v2, sel_releaseCachedResources);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for LPVisionAnalyzer();
  [(LPVisionAnalyzer *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

- (id)computeSimilarityOf:(id)a3 with:(id)a4 error:(id *)a5
{
  v7 = (unint64_t *)a3;
  v8 = (char *)a4;
  v9 = self;
  v10 = (void *)sub_1A36C4D20(v7, v8);

  return v10;
}

- (_TtC16LinkPresentation16LPVisionAnalyzer)init
{
  uint64_t v3 = OBJC_IVAR____TtC16LinkPresentation16LPVisionAnalyzer_session;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F45968]);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for LPVisionAnalyzer();
  return [(LPVisionAnalyzer *)&v7 init];
}

@end
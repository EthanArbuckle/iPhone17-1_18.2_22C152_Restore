@interface ScoreInterceptTargetWithCallback
- (ScoreInterceptTargetWithCallback)initWithCallback:(id)a3;
- (float)scoreMatchWithOrgApacheLuceneSearchWeight:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4 withOrgApacheLuceneSearchScorer:(id)a5;
@end

@implementation ScoreInterceptTargetWithCallback

- (ScoreInterceptTargetWithCallback)initWithCallback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ScoreInterceptTargetWithCallback;
  v5 = [(ComAppleProactiveLuceneScoreInterceptTargetBase *)&v9 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    v7 = *(void **)(v5 + 10);
    *(void *)(v5 + 10) = v6;
  }
  return (ScoreInterceptTargetWithCallback *)v5;
}

- (float)scoreMatchWithOrgApacheLuceneSearchWeight:(id)a3 withOrgApacheLuceneIndexLeafReaderContext:(id)a4 withOrgApacheLuceneSearchScorer:(id)a5
{
  (*(void (**)(void))(*(void *)(&self->super.scoringModified_ + 1) + 16))();
  return result;
}

- (void).cxx_destruct
{
}

@end
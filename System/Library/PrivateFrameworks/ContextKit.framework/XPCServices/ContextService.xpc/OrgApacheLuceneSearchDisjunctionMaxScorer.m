@interface OrgApacheLuceneSearchDisjunctionMaxScorer
- (OrgApacheLuceneSearchDisjunctionMaxScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withFloat:(float)a4 withJavaUtilList:(id)a5 withBoolean:(BOOL)a6;
- (float)scoreWithOrgApacheLuceneSearchDisiWrapper:(id)a3;
@end

@implementation OrgApacheLuceneSearchDisjunctionMaxScorer

- (OrgApacheLuceneSearchDisjunctionMaxScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withFloat:(float)a4 withJavaUtilList:(id)a5 withBoolean:(BOOL)a6
{
  self->tieBreakerMultiplier_ = a4;
  return self;
}

- (float)scoreWithOrgApacheLuceneSearchDisiWrapper:(id)a3
{
  if (a3)
  {
    v4 = a3;
    float v5 = 0.0;
    float v6 = 0.0;
    do
    {
      v7 = (void *)v4[1];
      if (!v7) {
        JreThrowNullPointerException();
      }
      [v7 score];
      float v6 = v6 + v8;
      if (v8 > v5) {
        float v5 = v8;
      }
      v4 = (void *)v4[4];
    }
    while (v4);
  }
  else
  {
    float v6 = 0.0;
    float v5 = 0.0;
  }
  return v5 + (float)((float)(v6 - v5) * self->tieBreakerMultiplier_);
}

@end
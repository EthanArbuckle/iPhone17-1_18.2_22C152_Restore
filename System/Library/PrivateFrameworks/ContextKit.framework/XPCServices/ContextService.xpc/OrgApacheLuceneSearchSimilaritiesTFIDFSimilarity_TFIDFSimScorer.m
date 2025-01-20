@interface OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_TFIDFSimScorer
- (OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_TFIDFSimScorer)initWithOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity:(id)a3 withOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats:(id)a4 withOrgApacheLuceneIndexNumericDocValues:(id)a5;
- (float)computePayloadFactorWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilBytesRef:(id)a6;
- (float)computeSlopFactorWithInt:(int)a3;
- (float)scoreWithInt:(int)a3 withFloat:(float)a4;
- (id)explainWithInt:(int)a3 withOrgApacheLuceneSearchExplanation:(id)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_TFIDFSimScorer

- (OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_TFIDFSimScorer)initWithOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity:(id)a3 withOrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats:(id)a4 withOrgApacheLuceneIndexNumericDocValues:(id)a5
{
  return self;
}

- (float)scoreWithInt:(int)a3 withFloat:(float)a4
{
  uint64_t v4 = *(void *)&a3;
  -[OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity tfWithFloat:](self->this$0_, "tfWithFloat:");
  float v7 = v6 * self->weightValue_;
  norms = self->norms_;
  if (norms)
  {
    [(OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity *)self->this$0_ decodeNormValueWithLong:[(OrgApacheLuceneIndexNumericDocValues *)norms getWithInt:v4]];
    return v7 * v9;
  }
  return v7;
}

- (float)computeSlopFactorWithInt:(int)a3
{
  [(OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity *)self->this$0_ sloppyFreqWithInt:*(void *)&a3];
  return result;
}

- (float)computePayloadFactorWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilBytesRef:(id)a6
{
  [(OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity *)self->this$0_ scorePayloadWithInt:*(void *)&a3 withInt:*(void *)&a4 withInt:*(void *)&a5 withOrgApacheLuceneUtilBytesRef:a6];
  return result;
}

- (id)explainWithInt:(int)a3 withOrgApacheLuceneSearchExplanation:(id)a4
{
  return sub_10004C33C(self->this$0_, *(uint64_t *)&a3, a4, (uint64_t)self->stats_, self->norms_);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_TFIDFSimScorer;
  [(OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_TFIDFSimScorer *)&v3 dealloc];
}

@end
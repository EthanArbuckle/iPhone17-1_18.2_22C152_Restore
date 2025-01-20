@interface OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats
- (OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats)initWithNSString:(id)a3 withOrgApacheLuceneSearchExplanation:(id)a4 withFloat:(float)a5;
- (float)getValueForNormalization;
- (void)dealloc;
- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4;
@end

@implementation OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats

- (OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats)initWithNSString:(id)a3 withOrgApacheLuceneSearchExplanation:(id)a4 withFloat:(float)a5
{
  return self;
}

- (float)getValueForNormalization
{
  return self->queryWeight_ * self->queryWeight_;
}

- (void)normalizeWithFloat:(float)a3 withFloat:(float)a4
{
  float v5 = a3 * a4;
  self->queryNorm_ = v5;
  float v6 = v5 * self->queryWeight_;
  self->queryWeight_ = v6;
  idf = self->idf_;
  if (!idf) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchExplanation *)idf getValue];
  self->value_ = v6 * v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats;
  [(OrgApacheLuceneSearchSimilaritiesTFIDFSimilarity_IDFStats *)&v3 dealloc];
}

@end
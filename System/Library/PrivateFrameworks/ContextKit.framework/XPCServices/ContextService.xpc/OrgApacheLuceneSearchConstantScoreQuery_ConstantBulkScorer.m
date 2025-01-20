@interface OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer
- (OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer)initWithOrgApacheLuceneSearchConstantScoreQuery:(id)a3 withOrgApacheLuceneSearchBulkScorer:(id)a4 withOrgApacheLuceneSearchWeight:(id)a5 withFloat:(float)a6;
- (id)wrapCollectorWithOrgApacheLuceneSearchLeafCollector:(id)a3;
- (int)scoreWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer

- (OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer)initWithOrgApacheLuceneSearchConstantScoreQuery:(id)a3 withOrgApacheLuceneSearchBulkScorer:(id)a4 withOrgApacheLuceneSearchWeight:(id)a5 withFloat:(float)a6
{
  return self;
}

- (int)scoreWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  bulkScorer = self->bulkScorer_;
  if (!bulkScorer) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  v10 = sub_1000A4E28(self, a3);
  return [(OrgApacheLuceneSearchBulkScorer *)bulkScorer scoreWithOrgApacheLuceneSearchLeafCollector:v10 withOrgApacheLuceneUtilBits:a4 withInt:v8 withInt:v7];
}

- (id)wrapCollectorWithOrgApacheLuceneSearchLeafCollector:(id)a3
{
  return sub_1000A4E28(self, a3);
}

- (int64_t)cost
{
  bulkScorer = self->bulkScorer_;
  if (!bulkScorer) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneSearchBulkScorer *)bulkScorer cost];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer;
  [(OrgApacheLuceneSearchConstantScoreQuery_ConstantBulkScorer *)&v3 dealloc];
}

@end
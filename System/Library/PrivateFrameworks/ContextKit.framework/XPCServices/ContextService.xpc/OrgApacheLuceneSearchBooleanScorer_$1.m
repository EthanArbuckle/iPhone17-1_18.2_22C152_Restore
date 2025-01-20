@interface OrgApacheLuceneSearchBooleanScorer_$1
- (OrgApacheLuceneSearchBooleanScorer_$1)initWithOrgApacheLuceneSearchBulkScorer:(id)a3;
- (int)scoreWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchBooleanScorer_$1

- (int)scoreWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  v11 = [OrgApacheLuceneSearchBooleanScorer__1__1 alloc];
  JreStrongAssign((id *)&v11->val$collector_, a3);
  v12 = new_OrgApacheLuceneSearchFakeScorer_init();
  JreStrongAssignAndConsume((id *)&v11->fake_, v12);
  v13 = v11;
  v14 = self->val$scorer_;
  if (!v14) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchBulkScorer *)v14 scoreWithOrgApacheLuceneSearchLeafCollector:v13 withOrgApacheLuceneUtilBits:a4 withInt:v7 withInt:v6];
}

- (int64_t)cost
{
  v2 = self->val$scorer_;
  if (!v2) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneSearchBulkScorer *)v2 cost];
}

- (OrgApacheLuceneSearchBooleanScorer_$1)initWithOrgApacheLuceneSearchBulkScorer:(id)a3
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanScorer__1;
  [(OrgApacheLuceneSearchBooleanScorer_$1 *)&v3 dealloc];
}

@end
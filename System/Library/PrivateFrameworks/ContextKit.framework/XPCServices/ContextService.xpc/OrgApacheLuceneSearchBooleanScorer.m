@interface OrgApacheLuceneSearchBooleanScorer
- (OrgApacheLuceneSearchBooleanScorer)initWithOrgApacheLuceneSearchBooleanWeight:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5 withJavaUtilCollection:(id)a6 withInt:(int)a7 withBoolean:(BOOL)a8;
- (id)advanceWithInt:(int)a3;
- (int)scoreWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int64_t)cost;
- (void)dealloc;
- (void)scoreDocumentWithOrgApacheLuceneSearchLeafCollector:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)scoreMatchesWithOrgApacheLuceneSearchLeafCollector:(id)a3 withInt:(int)a4;
- (void)scoreWindowWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
- (void)scoreWindowWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withOrgApacheLuceneSearchBooleanScorer_BulkScorerAndDocArray:(id)a8 withInt:(int)a9;
@end

@implementation OrgApacheLuceneSearchBooleanScorer

- (OrgApacheLuceneSearchBooleanScorer)initWithOrgApacheLuceneSearchBooleanWeight:(id)a3 withBoolean:(BOOL)a4 withInt:(int)a5 withJavaUtilCollection:(id)a6 withInt:(int)a7 withBoolean:(BOOL)a8
{
  return self;
}

- (int64_t)cost
{
  return self->cost_;
}

- (void)scoreDocumentWithOrgApacheLuceneSearchLeafCollector:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)scoreMatchesWithOrgApacheLuceneSearchLeafCollector:(id)a3 withInt:(int)a4
{
}

- (void)scoreWindowWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withOrgApacheLuceneSearchBooleanScorer_BulkScorerAndDocArray:(id)a8 withInt:(int)a9
{
}

- (id)advanceWithInt:(int)a3
{
  return sub_10011063C((uint64_t)self, *(uint64_t *)&a3);
}

- (void)scoreWindowWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
}

- (int)scoreWithOrgApacheLuceneSearchLeafCollector:(id)a3 withOrgApacheLuceneUtilBits:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  fakeScorer = self->fakeScorer_;
  if (!fakeScorer
    || (fakeScorer->doc_ = -1, !a3)
    || (uint64_t v8 = *(void *)&a6,
        uint64_t v9 = *(void *)&a5,
        [a3 setScorerWithOrgApacheLuceneSearchScorer:self->fakeScorer_],
        (v12 = sub_10011063C((uint64_t)self, v9)) == 0))
  {
LABEL_7:
    JreThrowNullPointerException();
  }
  while (1)
  {
    int result = v12[6];
    if (result >= (int)v8) {
      return result;
    }
    unsigned int v14 = result & 0xFFFFF800;
    uint64_t v15 = JavaLangMath_maxWithInt_withInt_(v9, result & 0xFFFFF800);
    uint64_t v16 = JavaLangMath_minWithInt_withInt_(v8, v14 + 2048);
    sub_100110738((uint64_t)self, a3, (uint64_t)a4, v14, v15, v16);
    head = self->head_;
    if (head)
    {
      v12 = [(OrgApacheLuceneUtilPriorityQueue *)head top];
      if (v12) {
        continue;
      }
    }
    goto LABEL_7;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchBooleanScorer;
  [(OrgApacheLuceneSearchBooleanScorer *)&v3 dealloc];
}

@end
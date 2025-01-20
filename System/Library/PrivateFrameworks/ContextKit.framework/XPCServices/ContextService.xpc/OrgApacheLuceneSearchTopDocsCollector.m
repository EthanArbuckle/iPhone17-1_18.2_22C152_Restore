@interface OrgApacheLuceneSearchTopDocsCollector
+ (void)initialize;
- (OrgApacheLuceneSearchTopDocsCollector)initWithOrgApacheLuceneUtilPriorityQueue:(id)a3;
- (id)newTopDocsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4;
- (id)topDocs;
- (id)topDocsWithInt:(int)a3;
- (id)topDocsWithInt:(int)a3 withInt:(int)a4;
- (int)getTotalHits;
- (int)topDocsSize;
- (void)dealloc;
- (void)populateResultsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneSearchTopDocsCollector

- (OrgApacheLuceneSearchTopDocsCollector)initWithOrgApacheLuceneUtilPriorityQueue:(id)a3
{
  return self;
}

- (void)populateResultsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4
{
  uint64_t v4 = (a4 - 1);
  if (a4 - 1 >= 0)
  {
    if (a3)
    {
      int v6 = a4;
      while (1)
      {
        pq = self->pq_;
        if (!pq) {
          break;
        }
        IOSObjectArray_Set((uint64_t)a3, v4, [(OrgApacheLuceneUtilPriorityQueue *)pq pop]);
        --v6;
        --v4;
        if (v6 <= 0) {
          return;
        }
      }
    }
    JreThrowNullPointerException();
  }
}

- (id)newTopDocsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4
{
  if (!a3) {
    return (id)OrgApacheLuceneSearchTopDocsCollector_EMPTY_TOPDOCS_;
  }
  uint64_t v4 = new_OrgApacheLuceneSearchTopDocs_initWithInt_withOrgApacheLuceneSearchScoreDocArray_(self->totalHits_, a3);
  return v4;
}

- (int)getTotalHits
{
  return self->totalHits_;
}

- (int)topDocsSize
{
  pq = self->pq_;
  if (!pq) {
    JreThrowNullPointerException();
  }
  int totalHits = self->totalHits_;
  if (totalHits < [(OrgApacheLuceneUtilPriorityQueue *)pq size]) {
    return self->totalHits_;
  }
  int v6 = self->pq_;
  return [(OrgApacheLuceneUtilPriorityQueue *)v6 size];
}

- (id)topDocs
{
  uint64_t v3 = [(OrgApacheLuceneSearchTopDocsCollector *)self topDocsSize];
  return [(OrgApacheLuceneSearchTopDocsCollector *)self topDocsWithInt:0 withInt:v3];
}

- (id)topDocsWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(OrgApacheLuceneSearchTopDocsCollector *)self topDocsSize];
  return [(OrgApacheLuceneSearchTopDocsCollector *)self topDocsWithInt:v3 withInt:v5];
}

- (id)topDocsWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v7 = [(OrgApacheLuceneSearchTopDocsCollector *)self topDocsSize];
  if ((v5 & 0x80000000) != 0
    || a4 < 1
    || (BOOL v8 = __OFSUB__(v7, v5), v9 = v7 - v5, ((int)v9 < 0) ^ v8 | (v9 == 0)))
  {
    v15 = self;
    v16 = 0;
  }
  else
  {
    uint64_t v10 = JavaLangMath_minWithInt_withInt_(v9, a4);
    v11 = +[IOSObjectArray arrayWithLength:(int)v10 type:OrgApacheLuceneSearchScoreDoc_class_()];
    pq = self->pq_;
    if (!pq) {
      JreThrowNullPointerException();
    }
    int v13 = [(OrgApacheLuceneUtilPriorityQueue *)pq size] - (v10 + v5);
    if (v13 >= 1)
    {
      unsigned int v14 = v13 + 1;
      do
      {
        [(OrgApacheLuceneUtilPriorityQueue *)self->pq_ pop];
        --v14;
      }
      while (v14 > 1);
    }
    [(OrgApacheLuceneSearchTopDocsCollector *)self populateResultsWithOrgApacheLuceneSearchScoreDocArray:v11 withInt:v10];
    v15 = self;
    v16 = v11;
  }
  return [(OrgApacheLuceneSearchTopDocsCollector *)v15 newTopDocsWithOrgApacheLuceneSearchScoreDocArray:v16 withInt:v5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopDocsCollector;
  [(OrgApacheLuceneSearchTopDocsCollector *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[IOSObjectArray arrayWithLength:0 type:OrgApacheLuceneSearchScoreDoc_class_()];
    objc_super v3 = new_OrgApacheLuceneSearchTopDocs_initWithInt_withOrgApacheLuceneSearchScoreDocArray_withFloat_(0, v2, NAN);
    JreStrongAssignAndConsume((id *)&OrgApacheLuceneSearchTopDocsCollector_EMPTY_TOPDOCS_, v3);
    atomic_store(1u, OrgApacheLuceneSearchTopDocsCollector__initialized);
  }
}

@end
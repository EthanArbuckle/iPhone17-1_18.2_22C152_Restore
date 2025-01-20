@interface OrgApacheLuceneSearchTopScoreDocCollector
+ (id)createWithInt:(int)a3;
+ (id)createWithInt:(int)a3 withOrgApacheLuceneSearchScoreDoc:(id)a4;
- (BOOL)needsScores;
- (OrgApacheLuceneSearchTopScoreDocCollector)initWithInt:(int)a3;
- (id)newTopDocsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopScoreDocCollector

+ (id)createWithInt:(int)a3
{
  return OrgApacheLuceneSearchTopScoreDocCollector_createWithInt_withOrgApacheLuceneSearchScoreDoc_(*(uint64_t *)&a3, 0);
}

+ (id)createWithInt:(int)a3 withOrgApacheLuceneSearchScoreDoc:(id)a4
{
  return OrgApacheLuceneSearchTopScoreDocCollector_createWithInt_withOrgApacheLuceneSearchScoreDoc_(*(uint64_t *)&a3, a4);
}

- (OrgApacheLuceneSearchTopScoreDocCollector)initWithInt:(int)a3
{
  return self;
}

- (id)newTopDocsWithOrgApacheLuceneSearchScoreDocArray:(id)a3 withInt:(int)a4
{
  if (a3)
  {
    if (a4)
    {
      pq = self->super.pq_;
      if (pq)
      {
        int v7 = [(OrgApacheLuceneUtilPriorityQueue *)pq size];
        if (v7 >= 2)
        {
          unsigned int v8 = v7 + 1;
          do
          {
            [(OrgApacheLuceneUtilPriorityQueue *)self->super.pq_ pop];
            --v8;
          }
          while (v8 > 2);
        }
        v9 = [(OrgApacheLuceneUtilPriorityQueue *)self->super.pq_ pop];
        if (v9)
        {
LABEL_8:
          v10 = new_OrgApacheLuceneSearchTopDocs_initWithInt_withOrgApacheLuceneSearchScoreDocArray_withFloat_(self->super.totalHits_, a3, v9[2]);
          return v10;
        }
      }
    }
    else
    {
      uint64_t v12 = *((unsigned int *)a3 + 2);
      if ((int)v12 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v12, 0);
      }
      v9 = (float *)*((void *)a3 + 3);
      if (v9) {
        goto LABEL_8;
      }
    }
    JreThrowNullPointerException();
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)OrgApacheLuceneSearchTopDocsCollector__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
  return (id)OrgApacheLuceneSearchTopDocsCollector_EMPTY_TOPDOCS_;
  }
}

- (BOOL)needsScores
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopScoreDocCollector;
  [(OrgApacheLuceneSearchTopDocsCollector *)&v3 dealloc];
}

@end
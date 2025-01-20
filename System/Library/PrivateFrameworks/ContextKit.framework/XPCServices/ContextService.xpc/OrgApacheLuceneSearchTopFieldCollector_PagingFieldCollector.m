@interface OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector
- (OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector)initWithOrgApacheLuceneSearchSort:(id)a3 withOrgApacheLuceneSearchFieldValueHitQueue:(id)a4 withOrgApacheLuceneSearchFieldDoc:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8 withBoolean:(BOOL)a9;
- (id)getLeafCollectorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector

- (OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector)initWithOrgApacheLuceneSearchSort:(id)a3 withOrgApacheLuceneSearchFieldValueHitQueue:(id)a4 withOrgApacheLuceneSearchFieldDoc:(id)a5 withInt:(int)a6 withBoolean:(BOOL)a7 withBoolean:(BOOL)a8 withBoolean:(BOOL)a9
{
  return self;
}

- (id)getLeafCollectorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  if (!a3
    || (int v4 = *((_DWORD *)a3 + 8), self->super.docBase_ = v4, (v5 = *(void *)&self->trackDocScores_) == 0)
    || (v6 = *(void **)&self->collectedHits_) == 0)
  {
    JreThrowNullPointerException();
  }
  int v7 = *(_DWORD *)(v5 + 12) - v4;
  id v8 = objc_msgSend(v6, "getComparatorsWithOrgApacheLuceneIndexLeafReaderContext:");
  v9 = (unsigned int *)[*(id *)&self->collectedHits_ getReverseMul];
  v10 = [OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector__1 alloc];
  JreStrongAssign((id *)&v10->this$0_, self);
  v10->val$afterDoc_ = v7;
  sub_10009AC4C((uint64_t)v10, (uint64_t)v8, v9);
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_PagingFieldCollector;
  [(OrgApacheLuceneSearchTopFieldCollector *)&v3 dealloc];
}

@end
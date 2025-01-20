@interface OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector
- (OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector)initWithOrgApacheLuceneSearchSort:(id)a3 withOrgApacheLuceneSearchFieldValueHitQueue:(id)a4 withInt:(int)a5 withBoolean:(BOOL)a6;
- (id)getLeafCollectorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector

- (OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector)initWithOrgApacheLuceneSearchSort:(id)a3 withOrgApacheLuceneSearchFieldValueHitQueue:(id)a4 withInt:(int)a5 withBoolean:(BOOL)a6
{
  return self;
}

- (id)getLeafCollectorWithOrgApacheLuceneIndexLeafReaderContext:(id)a3
{
  if (!a3) {
    goto LABEL_12;
  }
  self->super.docBase_ = *((_DWORD *)a3 + 8);
  queue = self->queue_;
  if (!queue) {
    goto LABEL_12;
  }
  v5 = -[OrgApacheLuceneSearchFieldValueHitQueue getComparatorsWithOrgApacheLuceneIndexLeafReaderContext:](queue, "getComparatorsWithOrgApacheLuceneIndexLeafReaderContext:");
  v6 = [(OrgApacheLuceneSearchFieldValueHitQueue *)self->queue_ getReverseMul];
  if (!v5) {
    goto LABEL_12;
  }
  v7 = v6;
  if (v5[2] != 1)
  {
    v11 = [OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector__2 alloc];
    JreStrongAssign((id *)&v11[1].super.comparator_, self);
    sub_10009AC4C((uint64_t)v11, (uint64_t)v5, v7);
    goto LABEL_9;
  }
  if (!v6) {
LABEL_12:
  }
    JreThrowNullPointerException();
  v8 = (void *)*((void *)v5 + 3);
  uint64_t v9 = v6[2];
  if ((int)v9 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v9, 0);
  }
  int v10 = v7[3];
  v11 = [OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector__1 alloc];
  JreStrongAssign((id *)&v11->this$0_, self);
  JreStrongAssign((id *)&v11->super.comparator_, v8);
  v11->super.reverseMul_ = v10;
LABEL_9:
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopFieldCollector_NonScoringCollector;
  [(OrgApacheLuceneSearchTopFieldCollector *)&v3 dealloc];
}

@end
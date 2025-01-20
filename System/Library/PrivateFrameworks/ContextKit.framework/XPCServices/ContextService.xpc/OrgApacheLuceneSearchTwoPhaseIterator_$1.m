@interface OrgApacheLuceneSearchTwoPhaseIterator_$1
- (OrgApacheLuceneSearchTwoPhaseIterator_$1)initWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3 withOrgApacheLuceneSearchTwoPhaseIterator:(id)a4;
- (int)advanceWithInt:(int)a3;
- (int)doNextWithInt:(int)a3;
- (int)docID;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTwoPhaseIterator_$1

- (int)docID
{
  v2 = self->val$approximation_;
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchDocIdSetIterator *)v2 docID];
}

- (int)nextDoc
{
  v3 = self->val$approximation_;
  if (!v3) {
    JreThrowNullPointerException();
  }
  id v4 = [(OrgApacheLuceneSearchDocIdSetIterator *)v3 nextDoc];
  return sub_100143A48((uint64_t)self, (uint64_t)v4);
}

- (int)advanceWithInt:(int)a3
{
  id v4 = self->val$approximation_;
  if (!v4) {
    JreThrowNullPointerException();
  }
  id v5 = [(OrgApacheLuceneSearchDocIdSetIterator *)v4 advanceWithInt:*(void *)&a3];
  return sub_100143A48((uint64_t)self, (uint64_t)v5);
}

- (int)doNextWithInt:(int)a3
{
  return sub_100143A48((uint64_t)self, *(uint64_t *)&a3);
}

- (int64_t)cost
{
  v2 = self->val$approximation_;
  if (!v2) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneSearchDocIdSetIterator *)v2 cost];
}

- (OrgApacheLuceneSearchTwoPhaseIterator_$1)initWithOrgApacheLuceneSearchDocIdSetIterator:(id)a3 withOrgApacheLuceneSearchTwoPhaseIterator:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTwoPhaseIterator__1;
  [(OrgApacheLuceneSearchTwoPhaseIterator_$1 *)&v3 dealloc];
}

@end
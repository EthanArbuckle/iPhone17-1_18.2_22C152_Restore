@interface OrgApacheLuceneSearchReqExclScorer
- (OrgApacheLuceneSearchReqExclScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4;
- (float)score;
- (id)asTwoPhaseIterator;
- (id)getChildren;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int)toNonExcludedWithInt:(int)a3;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchReqExclScorer

- (OrgApacheLuceneSearchReqExclScorer)initWithOrgApacheLuceneSearchScorer:(id)a3 withOrgApacheLuceneSearchScorer:(id)a4
{
  return self;
}

- (int)nextDoc
{
  reqApproximation = self->reqApproximation_;
  if (!reqApproximation) {
    JreThrowNullPointerException();
  }
  id v4 = [(OrgApacheLuceneSearchDocIdSetIterator *)reqApproximation nextDoc];
  return sub_1000B7460((uint64_t)self, (uint64_t)v4);
}

- (int)toNonExcludedWithInt:(int)a3
{
  return sub_1000B7460((uint64_t)self, *(uint64_t *)&a3);
}

- (int)docID
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)reqScorer docID];
}

- (int)freq
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchScorer *)reqScorer freq];
}

- (int64_t)cost
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneSearchScorer *)reqScorer cost];
}

- (float)score
{
  reqScorer = self->reqScorer_;
  if (!reqScorer) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneSearchScorer *)reqScorer score];
  return result;
}

- (id)getChildren
{
  v2 = new_OrgApacheLuceneSearchScorer_ChildScorer_initWithOrgApacheLuceneSearchScorer_withNSString_(self->reqScorer_, @"MUST");
  return JavaUtilCollections_singletonWithId_(v2);
}

- (int)advanceWithInt:(int)a3
{
  reqApproximation = self->reqApproximation_;
  if (!reqApproximation) {
    JreThrowNullPointerException();
  }
  id v5 = [(OrgApacheLuceneSearchDocIdSetIterator *)reqApproximation advanceWithInt:*(void *)&a3];
  return sub_1000B7460((uint64_t)self, (uint64_t)v5);
}

- (id)asTwoPhaseIterator
{
  if (!self->reqTwoPhaseIterator_) {
    return 0;
  }
  reqApproximation = self->reqApproximation_;
  id v4 = [OrgApacheLuceneSearchReqExclScorer__1 alloc];
  JreStrongAssign((id *)&v4->this$0_, self);
  OrgApacheLuceneSearchTwoPhaseIterator_initWithOrgApacheLuceneSearchDocIdSetIterator_((uint64_t)v4, (uint64_t)reqApproximation);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchReqExclScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end
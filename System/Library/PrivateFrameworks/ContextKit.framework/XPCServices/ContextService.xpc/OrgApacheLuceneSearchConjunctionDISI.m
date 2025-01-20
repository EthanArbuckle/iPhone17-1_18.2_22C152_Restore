@interface OrgApacheLuceneSearchConjunctionDISI
+ (id)intersectWithJavaUtilList:(id)a3;
- (BOOL)matches;
- (OrgApacheLuceneSearchConjunctionDISI)initWithJavaUtilList:(id)a3;
- (id)asTwoPhaseIterator;
- (int)advanceWithInt:(int)a3;
- (int)doNextWithInt:(int)a3;
- (int)docID;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchConjunctionDISI

+ (id)intersectWithJavaUtilList:(id)a3
{
  return OrgApacheLuceneSearchConjunctionDISI_intersectWithJavaUtilList_(a3);
}

- (OrgApacheLuceneSearchConjunctionDISI)initWithJavaUtilList:(id)a3
{
  return self;
}

- (BOOL)matches
{
  return 1;
}

- (id)asTwoPhaseIterator
{
  return 0;
}

- (int)doNextWithInt:(int)a3
{
  return sub_100065AE0(self, *(uint64_t *)&a3);
}

- (int)advanceWithInt:(int)a3
{
  lead = self->lead_;
  if (!lead) {
    JreThrowNullPointerException();
  }
  id v5 = [(OrgApacheLuceneSearchDocIdSetIterator *)lead advanceWithInt:*(void *)&a3];
  return sub_100065AE0(self, (uint64_t)v5);
}

- (int)docID
{
  lead = self->lead_;
  if (!lead) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneSearchDocIdSetIterator *)lead docID];
}

- (int)nextDoc
{
  lead = self->lead_;
  if (!lead) {
    JreThrowNullPointerException();
  }
  id v4 = [(OrgApacheLuceneSearchDocIdSetIterator *)lead nextDoc];
  return sub_100065AE0(self, (uint64_t)v4);
}

- (int64_t)cost
{
  lead = self->lead_;
  if (!lead) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneSearchDocIdSetIterator *)lead cost];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchConjunctionDISI;
  [(OrgApacheLuceneSearchConjunctionDISI *)&v3 dealloc];
}

@end
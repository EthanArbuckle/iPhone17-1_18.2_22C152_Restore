@interface OrgApacheLuceneSearchDisjunctionDISIApproximation
- (OrgApacheLuceneSearchDisjunctionDISIApproximation)initWithOrgApacheLuceneSearchDisiPriorityQueue:(id)a3;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchDisjunctionDISIApproximation

- (OrgApacheLuceneSearchDisjunctionDISIApproximation)initWithOrgApacheLuceneSearchDisiPriorityQueue:(id)a3
{
  return self;
}

- (int64_t)cost
{
  return self->cost_;
}

- (int)docID
{
  subIterators = self->subIterators_;
  if (!subIterators || (v3 = [(OrgApacheLuceneSearchDisiPriorityQueue *)subIterators top]) == 0) {
    JreThrowNullPointerException();
  }
  return v3[6];
}

- (int)nextDoc
{
  subIterators = self->subIterators_;
  if (!subIterators || (v4 = [(OrgApacheLuceneSearchDisiPriorityQueue *)subIterators top]) == 0) {
LABEL_8:
  }
    JreThrowNullPointerException();
  v5 = v4;
  int v6 = v4[6];
  do
  {
    v7 = (void *)*((void *)v5 + 5);
    if (!v7) {
      goto LABEL_8;
    }
    v5[6] = [v7 nextDoc];
    v8 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self->subIterators_ updateTop];
    if (!v8) {
      goto LABEL_8;
    }
    v5 = v8;
    int result = v8[6];
  }
  while (result == v6);
  return result;
}

- (int)advanceWithInt:(int)a3
{
  subIterators = self->subIterators_;
  if (!subIterators) {
LABEL_7:
  }
    JreThrowNullPointerException();
  uint64_t v5 = *(void *)&a3;
  int v6 = [(OrgApacheLuceneSearchDisiPriorityQueue *)subIterators top];
  do
  {
    v7 = (void *)*((void *)v6 + 5);
    if (!v7) {
      goto LABEL_7;
    }
    v6[6] = [v7 advanceWithInt:v5];
    v8 = [(OrgApacheLuceneSearchDisiPriorityQueue *)self->subIterators_ updateTop];
    if (!v8) {
      goto LABEL_7;
    }
    int v6 = v8;
    int result = v8[6];
  }
  while (result < (int)v5);
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchDisjunctionDISIApproximation;
  [(OrgApacheLuceneSearchDisjunctionDISIApproximation *)&v3 dealloc];
}

@end
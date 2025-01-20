@interface OrgApacheLuceneSearchFieldValueHitQueue_OneComparatorFieldValueHitQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneSearchFieldValueHitQueue_OneComparatorFieldValueHitQueue)initWithOrgApacheLuceneSearchSortFieldArray:(id)a3 withInt:(int)a4;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchFieldValueHitQueue_OneComparatorFieldValueHitQueue

- (OrgApacheLuceneSearchFieldValueHitQueue_OneComparatorFieldValueHitQueue)initWithOrgApacheLuceneSearchSortFieldArray:(id)a3 withInt:(int)a4
{
  sub_10002B2F4((uint64_t)self, (int *)a3, *(uint64_t *)&a4, *(uint64_t *)&a4, v4, v5, v6, v7);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  oneComparator = self->oneComparator_;
  if (!oneComparator) {
    JreThrowNullPointerException();
  }
  int oneReverseMul = self->oneReverseMul_;
  signed int v9 = [(OrgApacheLuceneSearchFieldComparator *)oneComparator compareWithInt:*((unsigned int *)a3 + 5) withInt:*((unsigned int *)a4 + 5)]* oneReverseMul;
  if (v9) {
    BOOL v10 = v9 <= 0;
  }
  else {
    BOOL v10 = *((_DWORD *)a3 + 3) <= *((_DWORD *)a4 + 3);
  }
  return !v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldValueHitQueue_OneComparatorFieldValueHitQueue;
  [(OrgApacheLuceneSearchFieldValueHitQueue *)&v3 dealloc];
}

@end
@interface OrgApacheLuceneUtilMergedIterator_TermMergeQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneUtilMergedIterator_TermMergeQueue)initWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilMergedIterator_TermMergeQueue

- (OrgApacheLuceneUtilMergedIterator_TermMergeQueue)initWithInt:(int)a3
{
  OrgApacheLuceneUtilPriorityQueue_initWithInt_((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  if (!a3 || (uint64_t v5 = (void *)*((void *)a3 + 2)) == 0 || !a4) {
    JreThrowNullPointerException();
  }
  unsigned int v7 = [v5 compareToWithId:*((void *)a4 + 2)];
  if (v7) {
    return v7 >> 31;
  }
  else {
    LOBYTE(v8) = *((_DWORD *)a3 + 6) < *((_DWORD *)a4 + 6);
  }
  return v8;
}

@end
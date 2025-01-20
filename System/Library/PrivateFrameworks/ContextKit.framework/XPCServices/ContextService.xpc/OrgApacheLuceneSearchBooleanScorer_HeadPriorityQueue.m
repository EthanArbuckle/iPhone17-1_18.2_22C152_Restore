@interface OrgApacheLuceneSearchBooleanScorer_HeadPriorityQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneSearchBooleanScorer_HeadPriorityQueue)initWithInt:(int)a3;
@end

@implementation OrgApacheLuceneSearchBooleanScorer_HeadPriorityQueue

- (OrgApacheLuceneSearchBooleanScorer_HeadPriorityQueue)initWithInt:(int)a3
{
  OrgApacheLuceneUtilPriorityQueue_initWithInt_((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  if (!a3 || !a4) {
    JreThrowNullPointerException();
  }
  return *((_DWORD *)a3 + 6) < *((_DWORD *)a4 + 6);
}

@end
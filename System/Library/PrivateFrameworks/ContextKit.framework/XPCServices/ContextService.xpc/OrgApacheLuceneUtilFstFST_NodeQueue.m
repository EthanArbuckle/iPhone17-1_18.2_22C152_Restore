@interface OrgApacheLuceneUtilFstFST_NodeQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneUtilFstFST_NodeQueue)initWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilFstFST_NodeQueue

- (OrgApacheLuceneUtilFstFST_NodeQueue)initWithInt:(int)a3
{
  OrgApacheLuceneUtilPriorityQueue_initWithInt_withBoolean_((uint64_t)self, *(uint64_t *)&a3, 0, v3, v4, v5, v6, v7);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  return [a3 compareToWithId:a4] >> 31;
}

@end
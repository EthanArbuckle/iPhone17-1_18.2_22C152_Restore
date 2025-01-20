@interface OrgApacheLuceneSearchMinShouldMatchSumScorer_$1
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneSearchMinShouldMatchSumScorer_$1)initWithInt:(int)a3;
@end

@implementation OrgApacheLuceneSearchMinShouldMatchSumScorer_$1

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  if (!a3 || (id v5 = [a3 cost], !a4)) {
    JreThrowNullPointerException();
  }
  return (uint64_t)v5 > (uint64_t)[a4 cost];
}

- (OrgApacheLuceneSearchMinShouldMatchSumScorer_$1)initWithInt:(int)a3
{
  OrgApacheLuceneUtilPriorityQueue_initWithInt_((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  return self;
}

@end
@interface OrgApacheLuceneSearchHitQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneSearchHitQueue)initWithInt:(int)a3 withBoolean:(BOOL)a4;
- (id)getSentinelObject;
@end

@implementation OrgApacheLuceneSearchHitQueue

- (OrgApacheLuceneSearchHitQueue)initWithInt:(int)a3 withBoolean:(BOOL)a4
{
  OrgApacheLuceneUtilPriorityQueue_initWithInt_withBoolean_((uint64_t)self, *(uint64_t *)&a3, a4, a4, v4, v5, v6, v7);
  return self;
}

- (id)getSentinelObject
{
  v2 = new_OrgApacheLuceneSearchScoreDoc_initWithInt_withFloat_(0x7FFFFFFF, -INFINITY);
  return v2;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  if (!a3 || !a4) {
    JreThrowNullPointerException();
  }
  float v4 = *((float *)a3 + 2);
  float v5 = *((float *)a4 + 2);
  if (v4 == v5) {
    return *((_DWORD *)a3 + 3) > *((_DWORD *)a4 + 3);
  }
  else {
    return v4 < v5;
  }
}

@end
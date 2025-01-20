@interface OrgApacheLuceneSearchPhraseQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneSearchPhraseQueue)initWithInt:(int)a3;
@end

@implementation OrgApacheLuceneSearchPhraseQueue

- (OrgApacheLuceneSearchPhraseQueue)initWithInt:(int)a3
{
  OrgApacheLuceneUtilPriorityQueue_initWithInt_((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  if (!a3 || !a4) {
    JreThrowNullPointerException();
  }
  int v4 = *((_DWORD *)a3 + 2);
  int v5 = *((_DWORD *)a4 + 2);
  BOOL v6 = v4 < v5;
  if (v4 == v5)
  {
    int v7 = *((_DWORD *)a3 + 4);
    int v8 = *((_DWORD *)a4 + 4);
    BOOL v6 = v7 < v8;
    if (v7 == v8) {
      return *((_DWORD *)a3 + 5) < *((_DWORD *)a4 + 5);
    }
  }
  return v6;
}

@end
@interface OrgApacheLuceneSearchBooleanScorer_TailPriorityQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneSearchBooleanScorer_TailPriorityQueue)initWithInt:(int)a3;
- (id)getWithInt:(int)a3;
@end

@implementation OrgApacheLuceneSearchBooleanScorer_TailPriorityQueue

- (OrgApacheLuceneSearchBooleanScorer_TailPriorityQueue)initWithInt:(int)a3
{
  OrgApacheLuceneUtilPriorityQueue_initWithInt_((uint64_t)self, *(uint64_t *)&a3, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  if (!a3 || !a4) {
    JreThrowNullPointerException();
  }
  return *((void *)a3 + 2) < *((void *)a4 + 2);
}

- (id)getWithInt:(int)a3
{
  if (a3 < 0 || [(OrgApacheLuceneUtilPriorityQueue *)self size] <= a3)
  {
    v11 = new_JavaLangIndexOutOfBoundsException_init();
    objc_exception_throw(v11);
  }
  uint64_t v5 = [(OrgApacheLuceneUtilPriorityQueue *)self getHeapArray];
  if (!v5) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = v5;
  uint64_t v7 = (a3 + 1);
  uint64_t v8 = v5[2];
  if ((int)v7 >= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v8, v7);
  }
  v9 = *(void **)&v6[2 * v7 + 6];
  objc_opt_class();
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return v9;
}

@end
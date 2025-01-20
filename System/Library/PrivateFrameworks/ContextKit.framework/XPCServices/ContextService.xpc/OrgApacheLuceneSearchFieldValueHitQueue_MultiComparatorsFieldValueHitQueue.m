@interface OrgApacheLuceneSearchFieldValueHitQueue_MultiComparatorsFieldValueHitQueue
- (BOOL)lessThanWithId:(id)a3 withId:(id)a4;
- (OrgApacheLuceneSearchFieldValueHitQueue_MultiComparatorsFieldValueHitQueue)initWithOrgApacheLuceneSearchSortFieldArray:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneSearchFieldValueHitQueue_MultiComparatorsFieldValueHitQueue

- (OrgApacheLuceneSearchFieldValueHitQueue_MultiComparatorsFieldValueHitQueue)initWithOrgApacheLuceneSearchSortFieldArray:(id)a3 withInt:(int)a4
{
  sub_10002AC68((id *)&self->super.super.super.isa, (int *)a3, *(uint64_t *)&a4, *(uint64_t *)&a4, v4, v5, v6, v7);
  return self;
}

- (BOOL)lessThanWithId:(id)a3 withId:(id)a4
{
  comparators = self->super.comparators_;
  if (!comparators) {
LABEL_18:
  }
    JreThrowNullPointerException();
  int size = comparators->super.size_;
  if (size < 1)
  {
LABEL_13:
    BOOL v17 = *((_DWORD *)a3 + 3) <= *((_DWORD *)a4 + 3);
  }
  else
  {
    uint64_t v9 = 0;
    while (1)
    {
      reverseMul = self->super.reverseMul_;
      if (!reverseMul) {
        goto LABEL_18;
      }
      uint64_t v11 = reverseMul->super.size_;
      if ((int)v9 >= (int)v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v9);
      }
      int v12 = *(&reverseMul->super.size_ + v9 + 1);
      v13 = self->super.comparators_;
      uint64_t v14 = v13->super.size_;
      if ((int)v9 >= (int)v14) {
        IOSArray_throwOutOfBoundsWithMsg(v14, v9);
      }
      v15 = (&v13->elementType_)[v9];
      if (!v15) {
        goto LABEL_18;
      }
      signed int v16 = [(IOSClass *)v15 compareWithInt:*((unsigned int *)a3 + 5) withInt:*((unsigned int *)a4 + 5)]* v12;
      if (v16) {
        break;
      }
      if (size == ++v9) {
        goto LABEL_13;
      }
    }
    BOOL v17 = v16 <= 0;
  }
  return !v17;
}

@end
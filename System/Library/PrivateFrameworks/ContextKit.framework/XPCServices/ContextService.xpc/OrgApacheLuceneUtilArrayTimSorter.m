@interface OrgApacheLuceneUtilArrayTimSorter
- (OrgApacheLuceneUtilArrayTimSorter)initWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4 withInt:(int)a5;
- (int)compareSavedWithInt:(int)a3 withInt:(int)a4;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)copy__WithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)restoreWithInt:(int)a3 withInt:(int)a4;
- (void)saveWithInt:(int)a3 withInt:(int)a4;
- (void)swapWithInt:(int)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneUtilArrayTimSorter

- (OrgApacheLuceneUtilArrayTimSorter)initWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4 withInt:(int)a5
{
  return self;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  comparator = self->comparator_;
  if (!comparator || (arr = self->arr_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t size = arr->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  v7 = (&arr->elementType_)[a4];
  v8 = (&arr->elementType_)[a3];
  return [(JavaUtilComparator *)comparator compareWithId:v8 withId:v7];
}

- (void)swapWithInt:(int)a3 withInt:(int)a4
{
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
  arr = self->arr_;
  if (!arr) {
    JreThrowNullPointerException();
  }
  uint64_t size = arr->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v6 = (&arr->elementType_)[a3];
  IOSObjectArray_Set((uint64_t)arr, a4, v6);
}

- (void)saveWithInt:(int)a3 withInt:(int)a4
{
}

- (void)restoreWithInt:(int)a3 withInt:(int)a4
{
  arr = self->arr_;
  if (!arr || (tmp = self->tmp_) == 0) {
    JreThrowNullPointerException();
  }
  uint64_t size = tmp->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  v7 = (&tmp->elementType_)[a3];
  IOSObjectArray_Set((uint64_t)arr, a4, v7);
}

- (int)compareSavedWithInt:(int)a3 withInt:(int)a4
{
  comparator = self->comparator_;
  if (!comparator) {
    goto LABEL_11;
  }
  tmp = self->tmp_;
  if (!tmp) {
    goto LABEL_11;
  }
  uint64_t size = tmp->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  arr = self->arr_;
  if (!arr) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t v9 = arr->super.size_;
  if (a4 < 0 || (int)v9 <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(v9, *(uint64_t *)&a4);
  }
  v10 = (&arr->elementType_)[a4];
  v11 = (&tmp->elementType_)[a3];
  return [(JavaUtilComparator *)comparator compareWithId:v11 withId:v10];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilArrayTimSorter;
  [(OrgApacheLuceneUtilTimSorter *)&v3 dealloc];
}

@end
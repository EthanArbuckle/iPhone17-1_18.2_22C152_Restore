@interface JavaUtilDualPivotQuicksort
+ (const)__metadata;
+ (int)findAnyZeroWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)findAnyZeroWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)doSortWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)doSortWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)doSortWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)doSortWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)doSortWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)doSortWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)doSortWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)dualPivotQuicksortWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)dualPivotQuicksortWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)dualPivotQuicksortWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)dualPivotQuicksortWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)dualPivotQuicksortWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)dualPivotQuicksortWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)dualPivotQuicksortWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortNegZeroAndNaNWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortNegZeroAndNaNWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortWithByteArray:(id)a3;
+ (void)sortWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortWithCharArray:(id)a3;
+ (void)sortWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortWithDoubleArray:(id)a3;
+ (void)sortWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortWithFloatArray:(id)a3;
+ (void)sortWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortWithIntArray:(id)a3;
+ (void)sortWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortWithLongArray:(id)a3;
+ (void)sortWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortWithShortArray:(id)a3;
+ (void)sortWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaUtilDualPivotQuicksort

+ (void)sortWithIntArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (*((_DWORD *)a3 + 2) - 1);
  sub_100193DBC((uint64_t)a3, 0, v4);
}

+ (void)sortWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  JavaUtilDualPivotQuicksort_sortWithIntArray_withInt_withInt_((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (void)doSortWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)dualPivotQuicksortWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)sortWithLongArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (*((_DWORD *)a3 + 2) - 1);
  sub_100195804((uint64_t)a3, 0, v4);
}

+ (void)sortWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  JavaUtilDualPivotQuicksort_sortWithLongArray_withInt_withInt_((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (void)doSortWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)dualPivotQuicksortWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)sortWithShortArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (*((_DWORD *)a3 + 2) - 1);
  sub_100197238((uint64_t)a3, 0, v4);
}

+ (void)sortWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  JavaUtilDualPivotQuicksort_sortWithShortArray_withInt_withInt_((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (void)doSortWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)dualPivotQuicksortWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)sortWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (*((_DWORD *)a3 + 2) - 1);
  sub_100198E54((uint64_t)a3, 0, v4);
}

+ (void)sortWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  JavaUtilDualPivotQuicksort_sortWithCharArray_withInt_withInt_((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (void)doSortWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)dualPivotQuicksortWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)sortWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (*((_DWORD *)a3 + 2) - 1);
  sub_10019AA0C((uint64_t)a3, 0, v4);
}

+ (void)sortWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  JavaUtilDualPivotQuicksort_sortWithByteArray_withInt_withInt_((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (void)doSortWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)dualPivotQuicksortWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)sortWithFloatArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (*((_DWORD *)a3 + 2) - 1);
  sub_10019C628((uint64_t)a3, 0, v4);
}

+ (void)sortWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  JavaUtilDualPivotQuicksort_sortWithFloatArray_withInt_withInt_((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (void)sortNegZeroAndNaNWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (int)findAnyZeroWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return sub_10019C908((uint64_t)a3, a4, a5);
}

+ (void)doSortWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)dualPivotQuicksortWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)sortWithDoubleArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (*((_DWORD *)a3 + 2) - 1);
  sub_10019DF54((uint64_t)a3, 0, v4);
}

+ (void)sortWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  JavaUtilDualPivotQuicksort_sortWithDoubleArray_withInt_withInt_((uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (void)sortNegZeroAndNaNWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (int)findAnyZeroWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return sub_10019E238((uint64_t)a3, a4, a5);
}

+ (void)doSortWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)dualPivotQuicksortWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004142D8;
}

@end
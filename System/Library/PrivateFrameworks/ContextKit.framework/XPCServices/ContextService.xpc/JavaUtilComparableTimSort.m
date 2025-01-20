@interface JavaUtilComparableTimSort
+ (const)__metadata;
+ (int)countRunAndMakeAscendingWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)gallopLeftWithJavaLangComparable:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
+ (int)gallopRightWithJavaLangComparable:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7;
+ (int)minRunLengthWithInt:(int)a3;
+ (void)binarySortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)reverseRangeWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortWithNSObjectArray:(id)a3;
+ (void)sortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (JavaUtilComparableTimSort)initWithNSObjectArray:(id)a3;
- (id)ensureCapacityWithInt:(int)a3;
- (void)dealloc;
- (void)mergeAtWithInt:(int)a3;
- (void)mergeHiWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)mergeLoWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)pushRunWithInt:(int)a3 withInt:(int)a4;
@end

@implementation JavaUtilComparableTimSort

- (JavaUtilComparableTimSort)initWithNSObjectArray:(id)a3
{
  return self;
}

+ (void)sortWithNSObjectArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v9 = *((unsigned int *)a3 + 2);
  JavaUtilComparableTimSort_sortWithNSObjectArray_withInt_withInt_((unsigned int *)a3, 0, v9, v3, v4, v5, v6, v7);
}

+ (void)sortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  JavaUtilComparableTimSort_sortWithNSObjectArray_withInt_withInt_((unsigned int *)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (void)binarySortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (int)countRunAndMakeAscendingWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return sub_1001F6A68((unsigned int *)a3, *(uint64_t *)&a4, a5);
}

+ (void)reverseRangeWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (int)minRunLengthWithInt:(int)a3
{
  if (a3 < 32)
  {
    int v3 = 0;
  }
  else
  {
    int v3 = 0;
    unsigned int v4 = a3;
    do
    {
      v3 |= v4 & 1;
      a3 = v4 >> 1;
      BOOL v5 = v4 > 0x3F;
      v4 >>= 1;
    }
    while (v5);
  }
  return v3 + a3;
}

- (void)pushRunWithInt:(int)a3 withInt:(int)a4
{
}

- (void)mergeAtWithInt:(int)a3
{
}

+ (int)gallopLeftWithJavaLangComparable:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return sub_1001F7650(a3, (uint64_t)a4, a5, a6, a7);
}

+ (int)gallopRightWithJavaLangComparable:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7
{
  return sub_1001F78DC(a3, (uint64_t)a4, a5, a6, a7);
}

- (void)mergeLoWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
}

- (void)mergeHiWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
}

- (id)ensureCapacityWithInt:(int)a3
{
  return sub_1001F88D4((uint64_t)self, a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilComparableTimSort;
  [(JavaUtilComparableTimSort *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043C2A8;
}

@end
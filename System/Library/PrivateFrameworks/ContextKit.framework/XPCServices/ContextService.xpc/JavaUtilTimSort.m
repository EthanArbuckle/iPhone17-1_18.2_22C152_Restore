@interface JavaUtilTimSort
+ (const)__metadata;
+ (int)countRunAndMakeAscendingWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilComparator:(id)a6;
+ (int)gallopLeftWithId:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaUtilComparator:(id)a8;
+ (int)gallopRightWithId:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaUtilComparator:(id)a8;
+ (int)minRunLengthWithInt:(int)a3;
+ (void)binarySortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilComparator:(id)a7;
+ (void)reverseRangeWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)sortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilComparator:(id)a6;
+ (void)sortWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4;
- (JavaUtilTimSort)initWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4;
- (id)ensureCapacityWithInt:(int)a3;
- (void)dealloc;
- (void)mergeAtWithInt:(int)a3;
- (void)mergeHiWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)mergeLoWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)pushRunWithInt:(int)a3 withInt:(int)a4;
@end

@implementation JavaUtilTimSort

- (JavaUtilTimSort)initWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4
{
  return self;
}

+ (void)sortWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v9 = *((unsigned int *)a3 + 2);
  JavaUtilTimSort_sortWithNSObjectArray_withInt_withInt_withJavaUtilComparator_((unsigned int *)a3, 0, v9, a4, v4, v5, v6, v7);
}

+ (void)sortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilComparator:(id)a6
{
  JavaUtilTimSort_sortWithNSObjectArray_withInt_withInt_withJavaUtilComparator_((unsigned int *)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, a6, *(uint64_t *)&a5, (uint64_t)a6, v6, v7);
}

+ (void)binarySortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6 withJavaUtilComparator:(id)a7
{
}

+ (int)countRunAndMakeAscendingWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilComparator:(id)a6
{
  return sub_100246ABC((unsigned int *)a3, *(uint64_t *)&a4, a5, a6);
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

+ (int)gallopLeftWithId:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaUtilComparator:(id)a8
{
  return sub_100247568((uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
}

+ (int)gallopRightWithId:(id)a3 withNSObjectArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaUtilComparator:(id)a8
{
  return sub_100247824((uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
}

- (void)mergeLoWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
}

- (void)mergeHiWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
}

- (id)ensureCapacityWithInt:(int)a3
{
  return sub_100248804((uint64_t)self, a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTimSort;
  [(JavaUtilTimSort *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100460E98;
}

@end
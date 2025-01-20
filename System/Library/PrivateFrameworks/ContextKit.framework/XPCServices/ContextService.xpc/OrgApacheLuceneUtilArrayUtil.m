@interface OrgApacheLuceneUtilArrayUtil
+ (BOOL)equalsWithByteArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
+ (BOOL)equalsWithCharArray:(id)a3 withInt:(int)a4 withCharArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
+ (BOOL)equalsWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7;
+ (id)growWithBooleanArray:(id)a3;
+ (id)growWithBooleanArray:(id)a3 withInt:(int)a4;
+ (id)growWithByteArray:(id)a3;
+ (id)growWithByteArray:(id)a3 withInt:(int)a4;
+ (id)growWithCharArray:(id)a3;
+ (id)growWithCharArray:(id)a3 withInt:(int)a4;
+ (id)growWithDoubleArray:(id)a3;
+ (id)growWithDoubleArray:(id)a3 withInt:(int)a4;
+ (id)growWithFloatArray2:(id)a3;
+ (id)growWithFloatArray2:(id)a3 withInt:(int)a4;
+ (id)growWithFloatArray:(id)a3;
+ (id)growWithFloatArray:(id)a3 withInt:(int)a4;
+ (id)growWithIntArray2:(id)a3;
+ (id)growWithIntArray2:(id)a3 withInt:(int)a4;
+ (id)growWithIntArray:(id)a3;
+ (id)growWithIntArray:(id)a3 withInt:(int)a4;
+ (id)growWithLongArray:(id)a3;
+ (id)growWithLongArray:(id)a3 withInt:(int)a4;
+ (id)growWithNSObjectArray:(id)a3 withInt:(int)a4;
+ (id)growWithShortArray:(id)a3;
+ (id)growWithShortArray:(id)a3 withInt:(int)a4;
+ (id)shrinkWithBooleanArray:(id)a3 withInt:(int)a4;
+ (id)shrinkWithByteArray:(id)a3 withInt:(int)a4;
+ (id)shrinkWithCharArray:(id)a3 withInt:(int)a4;
+ (id)shrinkWithFloatArray2:(id)a3 withInt:(int)a4;
+ (id)shrinkWithIntArray2:(id)a3 withInt:(int)a4;
+ (id)shrinkWithIntArray:(id)a3 withInt:(int)a4;
+ (id)shrinkWithLongArray:(id)a3 withInt:(int)a4;
+ (id)shrinkWithShortArray:(id)a3 withInt:(int)a4;
+ (id)toIntArrayWithJavaUtilCollection:(id)a3;
+ (int)getShrinkSizeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)hashCodeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)hashCodeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)oversizeWithInt:(int)a3 withInt:(int)a4;
+ (int)parseIntWithCharArray:(id)a3;
+ (int)parseIntWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (int)parseIntWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)initialize;
+ (void)introSortWithJavaLangComparableArray:(id)a3;
+ (void)introSortWithJavaLangComparableArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)introSortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilComparator:(id)a6;
+ (void)introSortWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4;
+ (void)swapWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)timSortWithJavaLangComparableArray:(id)a3;
+ (void)timSortWithJavaLangComparableArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (void)timSortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilComparator:(id)a6;
+ (void)timSortWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4;
@end

@implementation OrgApacheLuceneUtilArrayUtil

+ (int)parseIntWithCharArray:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_parseIntWithCharArray_((uint64_t)a3);
}

+ (int)parseIntWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilArrayUtil_parseIntWithCharArray_withInt_withInt_((uint64_t)a3, *(uint64_t *)&a4, a5);
}

+ (int)parseIntWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  return OrgApacheLuceneUtilArrayUtil_parseIntWithCharArray_withInt_withInt_withInt_((uint64_t)a3, *(uint64_t *)&a4, a5, a6);
}

+ (int)oversizeWithInt:(int)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(a3, *(uint64_t *)&a4, *(uint64_t *)&a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (int)getShrinkSizeWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilArrayUtil_getShrinkSizeWithInt_withInt_withInt_(a3, a4, *(uint64_t *)&a5, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
}

+ (id)growWithNSObjectArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithNSObjectArray_withInt_(a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithShortArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithShortArray_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithShortArray:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithShortArray_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)growWithFloatArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithFloatArray_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithFloatArray:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithFloatArray_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)growWithDoubleArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithDoubleArray_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithDoubleArray:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithDoubleArray_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)shrinkWithShortArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_shrinkWithShortArray_withInt_((int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithIntArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithIntArray:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithIntArray_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)shrinkWithIntArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_shrinkWithIntArray_withInt_((int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithLongArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithLongArray_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithLongArray:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithLongArray_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)shrinkWithLongArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_shrinkWithLongArray_withInt_((int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithByteArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithByteArray_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithByteArray:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithByteArray_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)shrinkWithByteArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_shrinkWithByteArray_withInt_((int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithBooleanArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithBooleanArray_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithBooleanArray:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithBooleanArray_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)shrinkWithBooleanArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_shrinkWithBooleanArray_withInt_((int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithCharArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithCharArray_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithCharArray:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithCharArray_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)shrinkWithCharArray:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_shrinkWithCharArray_withInt_((int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithIntArray2:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithIntArray2_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithIntArray2:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithIntArray2_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)shrinkWithIntArray2:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_shrinkWithIntArray2_withInt_(a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithFloatArray2:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_growWithFloatArray2_withInt_((unsigned int *)a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (id)growWithFloatArray2:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_growWithFloatArray2_((unsigned int *)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

+ (id)shrinkWithFloatArray2:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilArrayUtil_shrinkWithFloatArray2_withInt_(a3, a4, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7);
}

+ (int)hashCodeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilArrayUtil_hashCodeWithCharArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (int)hashCodeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilArrayUtil_hashCodeWithByteArray_withInt_withInt_((uint64_t)a3, a4, a5);
}

+ (BOOL)equalsWithCharArray:(id)a3 withInt:(int)a4 withCharArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  return OrgApacheLuceneUtilArrayUtil_equalsWithCharArray_withInt_withCharArray_withInt_withInt_((uint64_t)a3, a4, (uint64_t)a5, a6, a7);
}

+ (BOOL)equalsWithByteArray:(id)a3 withInt:(int)a4 withByteArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  return OrgApacheLuceneUtilArrayUtil_equalsWithByteArray_withInt_withByteArray_withInt_withInt_((uint64_t)a3, a4, (uint64_t)a5, a6, a7);
}

+ (BOOL)equalsWithIntArray:(id)a3 withInt:(int)a4 withIntArray:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  return OrgApacheLuceneUtilArrayUtil_equalsWithIntArray_withInt_withIntArray_withInt_withInt_((uint64_t)a3, a4, (uint64_t)a5, a6, a7);
}

+ (id)toIntArrayWithJavaUtilCollection:(id)a3
{
  return OrgApacheLuceneUtilArrayUtil_toIntArrayWithJavaUtilCollection_(a3);
}

+ (void)swapWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)introSortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilComparator:(id)a6
{
}

+ (void)introSortWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4
{
}

+ (void)introSortWithJavaLangComparableArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)introSortWithJavaLangComparableArray:(id)a3
{
}

+ (void)timSortWithNSObjectArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaUtilComparator:(id)a6
{
}

+ (void)timSortWithNSObjectArray:(id)a3 withJavaUtilComparator:(id)a4
{
}

+ (void)timSortWithJavaLangComparableArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

+ (void)timSortWithJavaLangComparableArray:(id)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&OrgApacheLuceneUtilRamUsageEstimator__initialized, memory_order_acquire) & 1) == 0)objc_opt_class(); {
    OrgApacheLuceneUtilArrayUtil_MAX_ARRAY_LENGTH_ = OrgApacheLuceneUtilRamUsageEstimator_NUM_BYTES_ARRAY_HEADER_ ^ 0x7FFFFFFF;
    }
    JreStrongAssignAndConsume((id *)&qword_100560278, [OrgApacheLuceneUtilArrayUtil_NaturalComparator alloc]);
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneUtilArrayUtil__initialized);
  }
}

@end
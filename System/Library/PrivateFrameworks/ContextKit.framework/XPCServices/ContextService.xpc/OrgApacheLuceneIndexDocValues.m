@interface OrgApacheLuceneIndexDocValues
+ (id)docsWithValueWithOrgApacheLuceneIndexSortedDocValues:(id)a3 withInt:(int)a4;
+ (id)docsWithValueWithOrgApacheLuceneIndexSortedNumericDocValues:(id)a3 withInt:(int)a4;
+ (id)docsWithValueWithOrgApacheLuceneIndexSortedSetDocValues:(id)a3 withInt:(int)a4;
+ (id)emptySortedNumericWithInt:(int)a3;
+ (id)emptySortedSet;
+ (id)getBinaryWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4;
+ (id)getDocsWithFieldWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4;
+ (id)getNumericWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4;
+ (id)getSortedNumericWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4;
+ (id)getSortedSetWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4;
+ (id)getSortedWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4;
+ (id)singletonWithOrgApacheLuceneIndexNumericDocValues:(id)a3 withOrgApacheLuceneUtilBits:(id)a4;
+ (id)singletonWithOrgApacheLuceneIndexSortedDocValues:(id)a3;
+ (id)unwrapSingletonBitsWithOrgApacheLuceneIndexSortedNumericDocValues:(id)a3;
+ (id)unwrapSingletonWithOrgApacheLuceneIndexSortedNumericDocValues:(id)a3;
+ (id)unwrapSingletonWithOrgApacheLuceneIndexSortedSetDocValues:(id)a3;
@end

@implementation OrgApacheLuceneIndexDocValues

+ (id)emptySortedNumericWithInt:(int)a3
{
  return OrgApacheLuceneIndexDocValues_emptySortedNumericWithInt_(a3);
}

+ (id)emptySortedSet
{
  v2 = OrgApacheLuceneIndexDocValues_emptySorted();
  v3 = new_OrgApacheLuceneIndexSingletonSortedSetDocValues_initWithOrgApacheLuceneIndexSortedDocValues_(v2);
  return v3;
}

+ (id)singletonWithOrgApacheLuceneIndexSortedDocValues:(id)a3
{
  v3 = new_OrgApacheLuceneIndexSingletonSortedSetDocValues_initWithOrgApacheLuceneIndexSortedDocValues_(a3);
  return v3;
}

+ (id)unwrapSingletonWithOrgApacheLuceneIndexSortedSetDocValues:(id)a3
{
  return OrgApacheLuceneIndexDocValues_unwrapSingletonWithOrgApacheLuceneIndexSortedSetDocValues_(a3);
}

+ (id)unwrapSingletonWithOrgApacheLuceneIndexSortedNumericDocValues:(id)a3
{
  return OrgApacheLuceneIndexDocValues_unwrapSingletonWithOrgApacheLuceneIndexSortedNumericDocValues_(a3);
}

+ (id)unwrapSingletonBitsWithOrgApacheLuceneIndexSortedNumericDocValues:(id)a3
{
  return OrgApacheLuceneIndexDocValues_unwrapSingletonBitsWithOrgApacheLuceneIndexSortedNumericDocValues_(a3);
}

+ (id)singletonWithOrgApacheLuceneIndexNumericDocValues:(id)a3 withOrgApacheLuceneUtilBits:(id)a4
{
  v4 = new_OrgApacheLuceneIndexSingletonSortedNumericDocValues_initWithOrgApacheLuceneIndexNumericDocValues_withOrgApacheLuceneUtilBits_(a3, a4);
  return v4;
}

+ (id)docsWithValueWithOrgApacheLuceneIndexSortedDocValues:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneIndexDocValues_docsWithValueWithOrgApacheLuceneIndexSortedDocValues_withInt_(a3, a4);
}

+ (id)docsWithValueWithOrgApacheLuceneIndexSortedSetDocValues:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneIndexDocValues_docsWithValueWithOrgApacheLuceneIndexSortedSetDocValues_withInt_(a3, a4);
}

+ (id)docsWithValueWithOrgApacheLuceneIndexSortedNumericDocValues:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneIndexDocValues_docsWithValueWithOrgApacheLuceneIndexSortedNumericDocValues_withInt_(a3, a4);
}

+ (id)getNumericWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexDocValues_getNumericWithOrgApacheLuceneIndexLeafReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getBinaryWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexDocValues_getBinaryWithOrgApacheLuceneIndexLeafReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getSortedWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexDocValues_getSortedWithOrgApacheLuceneIndexLeafReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getSortedNumericWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexDocValues_getSortedNumericWithOrgApacheLuceneIndexLeafReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getSortedSetWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexDocValues_getSortedSetWithOrgApacheLuceneIndexLeafReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getDocsWithFieldWithOrgApacheLuceneIndexLeafReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexDocValues_getDocsWithFieldWithOrgApacheLuceneIndexLeafReader_withNSString_(a3, (uint64_t)a4);
}

@end
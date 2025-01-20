@interface OrgApacheLuceneIndexMultiDocValues
+ (id)getBinaryValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4;
+ (id)getDocsWithFieldWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4;
+ (id)getNormValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4;
+ (id)getNumericValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4;
+ (id)getSortedNumericValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4;
+ (id)getSortedSetValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4;
+ (id)getSortedValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4;
@end

@implementation OrgApacheLuceneIndexMultiDocValues

+ (id)getNormValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexMultiDocValues_getNormValuesWithOrgApacheLuceneIndexIndexReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getNumericValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexMultiDocValues_getNumericValuesWithOrgApacheLuceneIndexIndexReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getDocsWithFieldWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexMultiDocValues_getDocsWithFieldWithOrgApacheLuceneIndexIndexReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getBinaryValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexMultiDocValues_getBinaryValuesWithOrgApacheLuceneIndexIndexReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getSortedNumericValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexMultiDocValues_getSortedNumericValuesWithOrgApacheLuceneIndexIndexReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getSortedValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexMultiDocValues_getSortedValuesWithOrgApacheLuceneIndexIndexReader_withNSString_(a3, (uint64_t)a4);
}

+ (id)getSortedSetValuesWithOrgApacheLuceneIndexIndexReader:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneIndexMultiDocValues_getSortedSetValuesWithOrgApacheLuceneIndexIndexReader_withNSString_(a3, (uint64_t)a4);
}

@end
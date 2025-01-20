@interface OrgApacheLuceneUtilAutomatonOperations
+ (BOOL)hasDeadStatesFromInitialWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (BOOL)hasDeadStatesToAcceptWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (BOOL)hasDeadStatesWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (BOOL)isEmptyWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (BOOL)isFiniteWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (BOOL)isTotalWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (BOOL)isTotalWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (BOOL)runWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withNSString:(id)a4;
+ (BOOL)runWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilIntsRef:(id)a4;
+ (BOOL)sameLanguageWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4;
+ (BOOL)subsetOfWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4;
+ (id)complementWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4;
+ (id)concatenateWithJavaUtilList:(id)a3;
+ (id)concatenateWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4;
+ (id)determinizeWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4;
+ (id)getCommonPrefixBytesRefWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (id)getCommonPrefixWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (id)getCommonSuffixBytesRefWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4;
+ (id)getSingletonWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (id)intersectionWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4;
+ (id)minusWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4 withInt:(int)a5;
+ (id)optionalWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (id)removeDeadStatesWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (id)repeatWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (id)repeatWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4;
+ (id)repeatWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (id)reverseWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (id)reverseWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withJavaUtilSet:(id)a4;
+ (id)topoSortStatesWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (id)totalizeWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3;
+ (id)union__WithJavaUtilCollection:(id)a3;
+ (id)union__WithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4;
+ (int)findIndexWithInt:(int)a3 withIntArray:(id)a4;
@end

@implementation OrgApacheLuceneUtilAutomatonOperations

+ (id)concatenateWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_concatenateWithOrgApacheLuceneUtilAutomatonAutomaton_withOrgApacheLuceneUtilAutomatonAutomaton_((uint64_t)a3, (uint64_t)a4);
}

+ (id)concatenateWithJavaUtilList:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_concatenateWithJavaUtilList_(a3);
}

+ (id)optionalWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_optionalWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (id)repeatWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_repeatWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (id)repeatWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_repeatWithOrgApacheLuceneUtilAutomatonAutomaton_withInt_(a3, a4);
}

+ (id)repeatWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilAutomatonOperations_repeatWithOrgApacheLuceneUtilAutomatonAutomaton_withInt_withInt_(a3, a4, a5);
}

+ (id)complementWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_complementWithOrgApacheLuceneUtilAutomatonAutomaton_withInt_(a3, a4);
}

+ (id)minusWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilAutomatonOperations_minusWithOrgApacheLuceneUtilAutomatonAutomaton_withOrgApacheLuceneUtilAutomatonAutomaton_withInt_(a3, a4, a5);
}

+ (id)intersectionWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_intersectionWithOrgApacheLuceneUtilAutomatonAutomaton_withOrgApacheLuceneUtilAutomatonAutomaton_(a3, a4);
}

+ (BOOL)sameLanguageWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_sameLanguageWithOrgApacheLuceneUtilAutomatonAutomaton_withOrgApacheLuceneUtilAutomatonAutomaton_(a3, a4);
}

+ (BOOL)hasDeadStatesWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_hasDeadStatesWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (BOOL)hasDeadStatesFromInitialWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_hasDeadStatesFromInitialWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (BOOL)hasDeadStatesToAcceptWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_hasDeadStatesToAcceptWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (BOOL)subsetOfWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_subsetOfWithOrgApacheLuceneUtilAutomatonAutomaton_withOrgApacheLuceneUtilAutomatonAutomaton_(a3, a4);
}

+ (id)union__WithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilAutomatonAutomaton:(id)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_union__WithOrgApacheLuceneUtilAutomatonAutomaton_withOrgApacheLuceneUtilAutomatonAutomaton_((uint64_t)a3, (uint64_t)a4);
}

+ (id)union__WithJavaUtilCollection:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_union__WithJavaUtilCollection_(a3);
}

+ (id)determinizeWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_determinizeWithOrgApacheLuceneUtilAutomatonAutomaton_withInt_(a3, a4);
}

+ (BOOL)isEmptyWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_isEmptyWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (BOOL)isTotalWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_isTotalWithOrgApacheLuceneUtilAutomatonAutomaton_withInt_withInt_(a3, 0, 1114111);
}

+ (BOOL)isTotalWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return OrgApacheLuceneUtilAutomatonOperations_isTotalWithOrgApacheLuceneUtilAutomatonAutomaton_withInt_withInt_(a3, a4, a5);
}

+ (BOOL)runWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withNSString:(id)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_runWithOrgApacheLuceneUtilAutomatonAutomaton_withNSString_(a3, a4);
}

+ (BOOL)runWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withOrgApacheLuceneUtilIntsRef:(id)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_runWithOrgApacheLuceneUtilAutomatonAutomaton_withOrgApacheLuceneUtilIntsRef_(a3, (uint64_t)a4);
}

+ (id)removeDeadStatesWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_removeDeadStatesWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (int)findIndexWithInt:(int)a3 withIntArray:(id)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_findIndexWithInt_withIntArray_(a3, (uint64_t)a4);
}

+ (BOOL)isFiniteWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_isFiniteWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (id)getCommonPrefixWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_getCommonPrefixWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (id)getCommonPrefixBytesRefWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_getCommonPrefixBytesRefWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (id)getSingletonWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_getSingletonWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (id)getCommonSuffixBytesRefWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_getCommonSuffixBytesRefWithOrgApacheLuceneUtilAutomatonAutomaton_withInt_(a3, a4);
}

+ (id)reverseWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_reverseWithOrgApacheLuceneUtilAutomatonAutomaton_withJavaUtilSet_(a3, 0);
}

+ (id)reverseWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3 withJavaUtilSet:(id)a4
{
  return OrgApacheLuceneUtilAutomatonOperations_reverseWithOrgApacheLuceneUtilAutomatonAutomaton_withJavaUtilSet_(a3, a4);
}

+ (id)totalizeWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_totalizeWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

+ (id)topoSortStatesWithOrgApacheLuceneUtilAutomatonAutomaton:(id)a3
{
  return OrgApacheLuceneUtilAutomatonOperations_topoSortStatesWithOrgApacheLuceneUtilAutomatonAutomaton_(a3);
}

@end
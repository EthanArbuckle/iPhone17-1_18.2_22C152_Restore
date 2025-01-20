@interface OrgApacheLuceneUtilAccountables
+ (id)namedAccountableWithNSString:(id)a3 withJavaUtilCollection:(id)a4 withLong:(int64_t)a5;
+ (id)namedAccountableWithNSString:(id)a3 withLong:(int64_t)a4;
+ (id)namedAccountableWithNSString:(id)a3 withOrgApacheLuceneUtilAccountable:(id)a4;
+ (id)namedAccountablesWithNSString:(id)a3 withJavaUtilMap:(id)a4;
+ (id)toStringWithOrgApacheLuceneUtilAccountable:(id)a3;
@end

@implementation OrgApacheLuceneUtilAccountables

+ (id)toStringWithOrgApacheLuceneUtilAccountable:(id)a3
{
  v4 = new_JavaLangStringBuilder_init();
  v5 = sub_100126790(v4, a3, 0);
  return [v5 description];
}

+ (id)namedAccountableWithNSString:(id)a3 withOrgApacheLuceneUtilAccountable:(id)a4
{
  return OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(a3, a4, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
}

+ (id)namedAccountableWithNSString:(id)a3 withLong:(int64_t)a4
{
  uint64_t v6 = (void *)JavaUtilCollections_emptyList();
  return OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withJavaUtilCollection_withLong_(a3, v6, a4);
}

+ (id)namedAccountablesWithNSString:(id)a3 withJavaUtilMap:(id)a4
{
  return OrgApacheLuceneUtilAccountables_namedAccountablesWithNSString_withJavaUtilMap_(a3, a4);
}

+ (id)namedAccountableWithNSString:(id)a3 withJavaUtilCollection:(id)a4 withLong:(int64_t)a5
{
  return OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withJavaUtilCollection_withLong_(a3, a4, a5);
}

@end
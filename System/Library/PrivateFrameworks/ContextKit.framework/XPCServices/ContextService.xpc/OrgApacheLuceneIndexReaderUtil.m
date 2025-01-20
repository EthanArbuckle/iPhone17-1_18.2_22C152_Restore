@interface OrgApacheLuceneIndexReaderUtil
+ (id)getTopLevelContextWithOrgApacheLuceneIndexIndexReaderContext:(id)a3;
+ (int)subIndexWithInt:(int)a3 withIntArray:(id)a4;
+ (int)subIndexWithInt:(int)a3 withJavaUtilList:(id)a4;
@end

@implementation OrgApacheLuceneIndexReaderUtil

+ (id)getTopLevelContextWithOrgApacheLuceneIndexIndexReaderContext:(id)a3
{
  do
  {
    if (!a3) {
      JreThrowNullPointerException();
    }
    id result = a3;
    a3 = (id)*((void *)a3 + 1);
  }
  while (a3);
  return result;
}

+ (int)subIndexWithInt:(int)a3 withIntArray:(id)a4
{
  return OrgApacheLuceneIndexReaderUtil_subIndexWithInt_withIntArray_(a3, (uint64_t)a4);
}

+ (int)subIndexWithInt:(int)a3 withJavaUtilList:(id)a4
{
  return OrgApacheLuceneIndexReaderUtil_subIndexWithInt_withJavaUtilList_(a3, a4);
}

@end
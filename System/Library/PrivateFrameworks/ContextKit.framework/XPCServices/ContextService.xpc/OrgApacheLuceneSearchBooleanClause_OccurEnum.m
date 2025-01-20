@interface OrgApacheLuceneSearchBooleanClause_OccurEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneSearchBooleanClause_OccurEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneSearchBooleanClause_OccurEnum

- (OrgApacheLuceneSearchBooleanClause_OccurEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneSearchBooleanClause_OccurEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneSearchBooleanClause_Occur__1Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"MUST", 0);
    OrgApacheLuceneSearchBooleanClause_OccurEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneSearchBooleanClause_Occur__2Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"FILTER", 1);
    qword_100563A20 = (uint64_t)v3;
    v4 = [OrgApacheLuceneSearchBooleanClause_Occur__3Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"SHOULD", 2);
    qword_100563A28 = (uint64_t)v4;
    v5 = [OrgApacheLuceneSearchBooleanClause_Occur__4Enum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"MUST_NOT", 3);
    qword_100563A30 = (uint64_t)v5;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneSearchBooleanClause_OccurEnum__initialized);
  }
}

@end
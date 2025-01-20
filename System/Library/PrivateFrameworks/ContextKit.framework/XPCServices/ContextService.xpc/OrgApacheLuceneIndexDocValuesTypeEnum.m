@interface OrgApacheLuceneIndexDocValuesTypeEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneIndexDocValuesTypeEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneIndexDocValuesTypeEnum

- (OrgApacheLuceneIndexDocValuesTypeEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneIndexDocValuesTypeEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneIndexDocValuesTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"NONE", 0);
    OrgApacheLuceneIndexDocValuesTypeEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneIndexDocValuesTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"NUMERIC", 1);
    qword_1005638F8 = (uint64_t)v3;
    v4 = [OrgApacheLuceneIndexDocValuesTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"BINARY", 2);
    qword_100563900 = (uint64_t)v4;
    v5 = [OrgApacheLuceneIndexDocValuesTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"SORTED", 3);
    qword_100563908 = (uint64_t)v5;
    v6 = [OrgApacheLuceneIndexDocValuesTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"SORTED_NUMERIC", 4);
    qword_100563910 = (uint64_t)v6;
    v7 = [OrgApacheLuceneIndexDocValuesTypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v7, @"SORTED_SET", 5);
    qword_100563918 = (uint64_t)v7;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexDocValuesTypeEnum__initialized);
  }
}

@end
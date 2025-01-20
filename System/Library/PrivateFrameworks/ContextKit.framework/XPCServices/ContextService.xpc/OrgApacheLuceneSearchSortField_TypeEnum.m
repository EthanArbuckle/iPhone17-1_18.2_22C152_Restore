@interface OrgApacheLuceneSearchSortField_TypeEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneSearchSortField_TypeEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneSearchSortField_TypeEnum

- (OrgApacheLuceneSearchSortField_TypeEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneSearchSortField_TypeEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"SCORE", 0);
    OrgApacheLuceneSearchSortField_TypeEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"DOC", 1);
    qword_100563508 = (uint64_t)v3;
    v4 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"STRING", 2);
    qword_100563510 = (uint64_t)v4;
    v5 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"INT", 3);
    qword_100563518 = (uint64_t)v5;
    v6 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"FLOAT", 4);
    qword_100563520 = (uint64_t)v6;
    v7 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v7, @"LONG", 5);
    qword_100563528 = (uint64_t)v7;
    v8 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v8, @"DOUBLE", 6);
    qword_100563530 = (uint64_t)v8;
    v9 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v9, @"CUSTOM", 7);
    qword_100563538 = (uint64_t)v9;
    v10 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v10, @"STRING_VAL", 8);
    qword_100563540 = (uint64_t)v10;
    v11 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v11, @"BYTES", 9);
    qword_100563548 = (uint64_t)v11;
    v12 = [OrgApacheLuceneSearchSortField_TypeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v12, @"REWRITEABLE", 10);
    qword_100563550 = (uint64_t)v12;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneSearchSortField_TypeEnum__initialized);
  }
}

@end
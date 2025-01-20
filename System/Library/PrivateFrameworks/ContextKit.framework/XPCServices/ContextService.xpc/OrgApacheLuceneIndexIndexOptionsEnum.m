@interface OrgApacheLuceneIndexIndexOptionsEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneIndexIndexOptionsEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneIndexIndexOptionsEnum

- (OrgApacheLuceneIndexIndexOptionsEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneIndexIndexOptionsEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneIndexIndexOptionsEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"NONE", 0);
    OrgApacheLuceneIndexIndexOptionsEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneIndexIndexOptionsEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"DOCS", 1);
    qword_1005631F8 = (uint64_t)v3;
    v4 = [OrgApacheLuceneIndexIndexOptionsEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"DOCS_AND_FREQS", 2);
    qword_100563200 = (uint64_t)v4;
    v5 = [OrgApacheLuceneIndexIndexOptionsEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"DOCS_AND_FREQS_AND_POSITIONS", 3);
    qword_100563208 = (uint64_t)v5;
    v6 = [OrgApacheLuceneIndexIndexOptionsEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v6, @"DOCS_AND_FREQS_AND_POSITIONS_AND_OFFSETS", 4);
    qword_100563210 = (uint64_t)v6;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexIndexOptionsEnum__initialized);
  }
}

@end
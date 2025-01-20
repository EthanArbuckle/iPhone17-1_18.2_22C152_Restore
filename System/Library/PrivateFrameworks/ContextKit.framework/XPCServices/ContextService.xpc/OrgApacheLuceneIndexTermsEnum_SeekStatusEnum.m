@interface OrgApacheLuceneIndexTermsEnum_SeekStatusEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneIndexTermsEnum_SeekStatusEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneIndexTermsEnum_SeekStatusEnum

- (OrgApacheLuceneIndexTermsEnum_SeekStatusEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneIndexTermsEnum_SeekStatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"END", 0);
    OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneIndexTermsEnum_SeekStatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"FOUND", 1);
    qword_1005638C8 = (uint64_t)v3;
    v4 = [OrgApacheLuceneIndexTermsEnum_SeekStatusEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"NOT_FOUND", 2);
    qword_1005638D0 = (uint64_t)v4;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized);
  }
}

@end
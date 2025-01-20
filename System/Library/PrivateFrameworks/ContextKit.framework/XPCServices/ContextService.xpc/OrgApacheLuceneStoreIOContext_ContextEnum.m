@interface OrgApacheLuceneStoreIOContext_ContextEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneStoreIOContext_ContextEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneStoreIOContext_ContextEnum

- (OrgApacheLuceneStoreIOContext_ContextEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneStoreIOContext_ContextEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneStoreIOContext_ContextEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"MERGE", 0);
    OrgApacheLuceneStoreIOContext_ContextEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneStoreIOContext_ContextEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"READ", 1);
    qword_100563860 = (uint64_t)v3;
    v4 = [OrgApacheLuceneStoreIOContext_ContextEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v4, @"FLUSH", 2);
    qword_100563868 = (uint64_t)v4;
    v5 = [OrgApacheLuceneStoreIOContext_ContextEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v5, @"DEFAULT", 3);
    qword_100563870 = (uint64_t)v5;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneStoreIOContext_ContextEnum__initialized);
  }
}

@end
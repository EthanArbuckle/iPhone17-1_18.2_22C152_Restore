@interface OrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum
+ (id)valueOfWithNSString:(id)a3;
+ (void)initialize;
- (OrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum)initWithNSString:(id)a3 withInt:(int)a4;
@end

@implementation OrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum

- (OrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

+ (id)valueOfWithNSString:(id)a3
{
  return OrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum_valueOfWithNSString_(a3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [OrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v2, @"BEST_SPEED", 0);
    OrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum_values_[0] = (uint64_t)v2;
    v3 = [OrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum alloc];
    JavaLangEnum_initWithNSString_withInt_((uint64_t)v3, @"BEST_COMPRESSION", 1);
    qword_100563590 = (uint64_t)v3;
    atomic_store(1u, (unsigned __int8 *)OrgApacheLuceneCodecsLucene50Lucene50StoredFieldsFormat_ModeEnum__initialized);
  }
}

@end
@interface OrgApacheLuceneIndexCorruptIndexException
- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withNSString:(id)a4;
- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withNSString:(id)a4 withJavaLangThrowable:(id)a5;
- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDataInput:(id)a4;
- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withJavaLangThrowable:(id)a5;
- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDataOutput:(id)a4;
- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDataOutput:(id)a4 withJavaLangThrowable:(id)a5;
- (id)getOriginalMessage;
- (id)getResourceDescription;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexCorruptIndexException

- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDataInput:(id)a4
{
  v6 = (__CFString *)OrgLukhnosPortmobileUtilObjects_toStringWithId_(a4);
  OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withNSString_withJavaLangThrowable_((uint64_t)self, a3, v6, 0);
  return self;
}

- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDataOutput:(id)a4
{
  v6 = (__CFString *)OrgLukhnosPortmobileUtilObjects_toStringWithId_(a4);
  OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withNSString_withJavaLangThrowable_((uint64_t)self, a3, v6, 0);
  return self;
}

- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDataInput:(id)a4 withJavaLangThrowable:(id)a5
{
  v8 = (__CFString *)OrgLukhnosPortmobileUtilObjects_toStringWithId_(a4);
  OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withNSString_withJavaLangThrowable_((uint64_t)self, a3, v8, (uint64_t)a5);
  return self;
}

- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withOrgApacheLuceneStoreDataOutput:(id)a4 withJavaLangThrowable:(id)a5
{
  v8 = (__CFString *)OrgLukhnosPortmobileUtilObjects_toStringWithId_(a4);
  OrgApacheLuceneIndexCorruptIndexException_initWithNSString_withNSString_withJavaLangThrowable_((uint64_t)self, a3, v8, (uint64_t)a5);
  return self;
}

- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (OrgApacheLuceneIndexCorruptIndexException)initWithNSString:(id)a3 withNSString:(id)a4 withJavaLangThrowable:(id)a5
{
  return self;
}

- (id)getResourceDescription
{
  return self->resourceDescription_;
}

- (id)getOriginalMessage
{
  return self->message_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexCorruptIndexException;
  [(JavaLangThrowable *)&v3 dealloc];
}

@end
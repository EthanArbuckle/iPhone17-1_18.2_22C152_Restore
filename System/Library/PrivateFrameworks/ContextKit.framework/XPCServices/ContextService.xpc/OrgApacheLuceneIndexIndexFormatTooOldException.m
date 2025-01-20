@interface OrgApacheLuceneIndexIndexFormatTooOldException
- (OrgApacheLuceneIndexIndexFormatTooOldException)initWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (OrgApacheLuceneIndexIndexFormatTooOldException)initWithNSString:(id)a3 withNSString:(id)a4;
- (OrgApacheLuceneIndexIndexFormatTooOldException)initWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (OrgApacheLuceneIndexIndexFormatTooOldException)initWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4;
- (id)getMaxVersion;
- (id)getMinVersion;
- (id)getReason;
- (id)getResourceDescription;
- (id)getVersion;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexIndexFormatTooOldException

- (OrgApacheLuceneIndexIndexFormatTooOldException)initWithNSString:(id)a3 withNSString:(id)a4
{
  OrgApacheLuceneIndexIndexFormatTooOldException_initWithNSString_withNSString_((id *)&self->super.super.super.super.super.isa, a3, a4, (uint64_t)a4, v4, v5, v6, v7);
  return self;
}

- (OrgApacheLuceneIndexIndexFormatTooOldException)initWithOrgApacheLuceneStoreDataInput:(id)a3 withNSString:(id)a4
{
  uint64_t v6 = (__CFString *)OrgLukhnosPortmobileUtilObjects_toStringWithId_(a3);
  OrgApacheLuceneIndexIndexFormatTooOldException_initWithNSString_withNSString_((id *)&self->super.super.super.super.super.isa, v6, a4, v7, v8, v9, v10, v11);
  return self;
}

- (OrgApacheLuceneIndexIndexFormatTooOldException)initWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  OrgApacheLuceneIndexIndexFormatTooOldException_initWithNSString_withInt_withInt_withInt_((id *)&self->super.super.super.super.super.isa, a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a6, v6, v7);
  return self;
}

- (OrgApacheLuceneIndexIndexFormatTooOldException)initWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v10 = (__CFString *)OrgLukhnosPortmobileUtilObjects_toStringWithId_(a3);
  OrgApacheLuceneIndexIndexFormatTooOldException_initWithNSString_withInt_withInt_withInt_((id *)&self->super.super.super.super.super.isa, v10, v8, v7, v6, v11, v12, v13);
  return self;
}

- (id)getResourceDescription
{
  return self->resourceDescription_;
}

- (id)getReason
{
  return self->reason_;
}

- (id)getVersion
{
  return self->version__;
}

- (id)getMaxVersion
{
  return self->maxVersion_;
}

- (id)getMinVersion
{
  return self->minVersion_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexIndexFormatTooOldException;
  [(JavaLangThrowable *)&v3 dealloc];
}

@end
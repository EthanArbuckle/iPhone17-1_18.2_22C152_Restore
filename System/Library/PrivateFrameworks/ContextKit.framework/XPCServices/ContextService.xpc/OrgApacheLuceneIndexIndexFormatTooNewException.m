@interface OrgApacheLuceneIndexIndexFormatTooNewException
- (OrgApacheLuceneIndexIndexFormatTooNewException)initWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (OrgApacheLuceneIndexIndexFormatTooNewException)initWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (id)getResourceDescription;
- (int)getMaxVersion;
- (int)getMinVersion;
- (int)getVersion;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexIndexFormatTooNewException

- (OrgApacheLuceneIndexIndexFormatTooNewException)initWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  OrgApacheLuceneIndexIndexFormatTooNewException_initWithNSString_withInt_withInt_withInt_((uint64_t)self, a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a6, v6, v7);
  return self;
}

- (OrgApacheLuceneIndexIndexFormatTooNewException)initWithOrgApacheLuceneStoreDataInput:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  v10 = (__CFString *)OrgLukhnosPortmobileUtilObjects_toStringWithId_(a3);
  OrgApacheLuceneIndexIndexFormatTooNewException_initWithNSString_withInt_withInt_withInt_((uint64_t)self, v10, v8, v7, v6, v11, v12, v13);
  return self;
}

- (id)getResourceDescription
{
  return self->resourceDescription_;
}

- (int)getVersion
{
  return self->version__;
}

- (int)getMaxVersion
{
  return self->maxVersion_;
}

- (int)getMinVersion
{
  return self->minVersion_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexIndexFormatTooNewException;
  [(JavaLangThrowable *)&v3 dealloc];
}

@end
@interface OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader64
- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader64)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3;
- (int64_t)getWithLong:(int64_t)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader64

- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader64)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3
{
  return self;
}

- (int64_t)getWithLong:(int64_t)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneStoreRandomAccessInput *)in readLongWithLong:8 * a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader64;
  [(OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader64 *)&v3 dealloc];
}

@end
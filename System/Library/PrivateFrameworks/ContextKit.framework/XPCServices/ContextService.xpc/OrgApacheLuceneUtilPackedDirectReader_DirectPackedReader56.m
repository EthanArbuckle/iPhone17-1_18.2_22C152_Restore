@interface OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader56
- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader56)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3;
- (int64_t)getWithLong:(int64_t)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader56

- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader56)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3
{
  return self;
}

- (int64_t)getWithLong:(int64_t)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return (unint64_t)[(OrgApacheLuceneStoreRandomAccessInput *)in readLongWithLong:7 * a3] >> 8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader56;
  [(OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader56 *)&v3 dealloc];
}

@end
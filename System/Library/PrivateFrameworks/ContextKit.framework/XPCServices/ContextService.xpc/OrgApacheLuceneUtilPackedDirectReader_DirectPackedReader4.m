@interface OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader4
- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader4)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3;
- (int64_t)getWithLong:(int64_t)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader4

- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader4)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3
{
  return self;
}

- (int64_t)getWithLong:(int64_t)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return ([(OrgApacheLuceneStoreRandomAccessInput *)in readByteWithLong:(unint64_t)a3 >> 1] >> (~(4 * a3) & 4)) & 0xF;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader4;
  [(OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader4 *)&v3 dealloc];
}

@end
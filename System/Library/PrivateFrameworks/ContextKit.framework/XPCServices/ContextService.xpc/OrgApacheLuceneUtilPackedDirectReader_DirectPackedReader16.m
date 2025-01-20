@interface OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader16
- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader16)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3;
- (int64_t)getWithLong:(int64_t)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader16

- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader16)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3
{
  return self;
}

- (int64_t)getWithLong:(int64_t)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return (unsigned __int16)[(OrgApacheLuceneStoreRandomAccessInput *)in readShortWithLong:2 * a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader16;
  [(OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader16 *)&v3 dealloc];
}

@end
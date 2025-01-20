@interface OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader12
- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader12)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3;
- (int64_t)getWithLong:(int64_t)a3;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader12

- (OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader12)initWithOrgApacheLuceneStoreRandomAccessInput:(id)a3
{
  return self;
}

- (int64_t)getWithLong:(int64_t)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return ([(OrgApacheLuceneStoreRandomAccessInput *)in readShortWithLong:((unint64_t)(3 * a3) >> 1) & 0x1FFFFFFFFFFFFFFFLL] >> (~(4 * a3) & 4)) & 0xFFF;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader12;
  [(OrgApacheLuceneUtilPackedDirectReader_DirectPackedReader12 *)&v3 dealloc];
}

@end
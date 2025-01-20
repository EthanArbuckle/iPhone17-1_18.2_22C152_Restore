@interface OrgApacheLuceneUtilPackedDirectPacked64SingleBlockReader
- (OrgApacheLuceneUtilPackedDirectPacked64SingleBlockReader)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneStoreIndexInput:(id)a5;
- (int64_t)getWithInt:(int)a3;
- (int64_t)ramBytesUsed;
- (void)dealloc;
@end

@implementation OrgApacheLuceneUtilPackedDirectPacked64SingleBlockReader

- (OrgApacheLuceneUtilPackedDirectPacked64SingleBlockReader)initWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneStoreIndexInput:(id)a5
{
  return self;
}

- (int64_t)getWithInt:(int)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)in seekWithLong:self->startPointer_ + 8 * (a3 / self->valuesPerBlock_)];
  return ((unint64_t)[(OrgApacheLuceneStoreDataInput *)self->in_ readLong] >> (self->bitsPerValue_
                                                                                               * (a3 % self->valuesPerBlock_))) & self->mask_;
}

- (int64_t)ramBytesUsed
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedDirectPacked64SingleBlockReader;
  [(OrgApacheLuceneUtilPackedDirectPacked64SingleBlockReader *)&v3 dealloc];
}

@end
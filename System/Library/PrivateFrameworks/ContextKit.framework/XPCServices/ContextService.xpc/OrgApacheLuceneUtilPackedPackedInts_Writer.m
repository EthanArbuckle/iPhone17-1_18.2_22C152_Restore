@interface OrgApacheLuceneUtilPackedPackedInts_Writer
- (OrgApacheLuceneUtilPackedPackedInts_Writer)initWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)bitsPerValue;
- (void)dealloc;
- (void)writeHeader;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_Writer

- (OrgApacheLuceneUtilPackedPackedInts_Writer)initWithOrgApacheLuceneStoreDataOutput:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  self->valueCount_ = a4;
  self->bitsPerValue_ = a5;
  return self;
}

- (void)writeHeader
{
  OrgApacheLuceneCodecsCodecUtil_writeHeaderWithOrgApacheLuceneStoreDataOutput_withNSString_withInt_(self->out_, OrgApacheLuceneUtilPackedPackedInts_CODEC_NAME_, 2);
  out = self->out_;
  if (!out
    || ([(OrgApacheLuceneStoreDataOutput *)out writeVIntWithInt:self->bitsPerValue_],
        [(OrgApacheLuceneStoreDataOutput *)self->out_ writeVIntWithInt:self->valueCount_], v4 = self->out_, (id v5 = [(OrgApacheLuceneUtilPackedPackedInts_Writer *)self getFormat]) == 0))
  {
    JreThrowNullPointerException();
  }
  id v6 = [v5 getId];
  [(OrgApacheLuceneStoreDataOutput *)v4 writeVIntWithInt:v6];
}

- (int)bitsPerValue
{
  return self->bitsPerValue_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilPackedPackedInts_Writer;
  [(OrgApacheLuceneUtilPackedPackedInts_Writer *)&v3 dealloc];
}

@end
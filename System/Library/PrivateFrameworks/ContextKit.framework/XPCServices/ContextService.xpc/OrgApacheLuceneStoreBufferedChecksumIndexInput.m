@interface OrgApacheLuceneStoreBufferedChecksumIndexInput
- (OrgApacheLuceneStoreBufferedChecksumIndexInput)initWithOrgApacheLuceneStoreIndexInput:(id)a3;
- (char)readByte;
- (id)clone;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)getChecksum;
- (int64_t)getFilePointer;
- (int64_t)length;
- (void)close;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneStoreBufferedChecksumIndexInput

- (OrgApacheLuceneStoreBufferedChecksumIndexInput)initWithOrgApacheLuceneStoreIndexInput:(id)a3
{
  OrgApacheLuceneStoreBufferedChecksumIndexInput_initWithOrgApacheLuceneStoreIndexInput_((uint64_t)self, a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  return self;
}

- (char)readByte
{
  main = self->main_;
  if (!main || (id v4 = [(OrgApacheLuceneStoreIndexInput *)main readByte], (digest = self->digest_) == 0)) {
    JreThrowNullPointerException();
  }
  [(JavaUtilZipChecksum *)digest updateWithInt:v4];
  return (char)v4;
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  main = self->main_;
  if (!main
    || (uint64_t v7 = *(void *)&a5,
        uint64_t v8 = *(void *)&a4,
        -[OrgApacheLuceneStoreIndexInput readBytesWithByteArray:withInt:withInt:](main, "readBytesWithByteArray:withInt:withInt:"), (digest = self->digest_) == 0))
  {
    JreThrowNullPointerException();
  }
  [(JavaUtilZipChecksum *)digest updateWithByteArray:a3 withInt:v8 withInt:v7];
}

- (int64_t)getChecksum
{
  digest = self->digest_;
  if (!digest) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(JavaUtilZipChecksum *)digest getValue];
}

- (void)close
{
  main = self->main_;
  if (!main) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreIndexInput *)main close];
}

- (int64_t)getFilePointer
{
  main = self->main_;
  if (!main) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneStoreIndexInput *)main getFilePointer];
}

- (int64_t)length
{
  main = self->main_;
  if (!main) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneStoreIndexInput *)main length];
}

- (id)clone
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  uint64_t v5 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreBufferedChecksumIndexInput;
  [(OrgApacheLuceneStoreIndexInput *)&v3 dealloc];
}

@end
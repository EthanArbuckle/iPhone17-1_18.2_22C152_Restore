@interface OrgApacheLuceneUtilGrowableByteArrayDataOutput
- (OrgApacheLuceneUtilGrowableByteArrayDataOutput)initWithInt:(int)a3;
- (void)dealloc;
- (void)writeByteWithByte:(char)a3;
- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilGrowableByteArrayDataOutput

- (OrgApacheLuceneUtilGrowableByteArrayDataOutput)initWithInt:(int)a3
{
  return self;
}

- (void)writeByteWithByte:(char)a3
{
  p_bytes = &self->bytes_;
  bytes = self->bytes_;
  if (!bytes
    || self->length_ >= bytes->super.size_
    && (v12 = OrgApacheLuceneUtilArrayUtil_growWithByteArray_((unsigned int *)self->bytes_, (uint64_t)a2, a3, v3, v4, v5, v6, v7), JreStrongAssign((id *)p_bytes, v12), (bytes = *p_bytes) == 0))
  {
    JreThrowNullPointerException();
  }
  int length = self->length_;
  self->length_ = length + 1;
  uint64_t size = bytes->super.size_;
  if (length < 0 || length >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, length);
  }
  *((unsigned char *)&bytes->super.size_ + length + 4) = a3;
}

- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  signed int v12 = self->length_ + a5;
  p_bytes = &self->bytes_;
  v14 = OrgApacheLuceneUtilArrayUtil_growWithByteArray_withInt_((unsigned int *)self->bytes_, v12, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
  JreStrongAssign((id *)p_bytes, v14);
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v9, *p_bytes, self->length_, v8);
  self->length_ = v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilGrowableByteArrayDataOutput;
  [(OrgApacheLuceneStoreDataOutput *)&v3 dealloc];
}

@end
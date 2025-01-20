@interface OrgApacheLuceneStoreRAMInputStream
- (OrgApacheLuceneStoreRAMInputStream)initWithNSString:(id)a3 withOrgApacheLuceneStoreRAMFile:(id)a4;
- (OrgApacheLuceneStoreRAMInputStream)initWithNSString:(id)a3 withOrgApacheLuceneStoreRAMFile:(id)a4 withLong:(int64_t)a5;
- (char)readByte;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int64_t)getFilePointer;
- (int64_t)length;
- (void)dealloc;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)seekWithLong:(int64_t)a3;
- (void)switchCurrentBufferWithBoolean:(BOOL)a3;
@end

@implementation OrgApacheLuceneStoreRAMInputStream

- (OrgApacheLuceneStoreRAMInputStream)initWithNSString:(id)a3 withOrgApacheLuceneStoreRAMFile:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  OrgApacheLuceneStoreRAMInputStream_initWithNSString_withOrgApacheLuceneStoreRAMFile_withLong_((uint64_t)self, (uint64_t)a3, a4, *((void *)a4 + 2), v4, v5, v6, v7);
  return self;
}

- (OrgApacheLuceneStoreRAMInputStream)initWithNSString:(id)a3 withOrgApacheLuceneStoreRAMFile:(id)a4 withLong:(int64_t)a5
{
  OrgApacheLuceneStoreRAMInputStream_initWithNSString_withOrgApacheLuceneStoreRAMFile_withLong_((uint64_t)self, (uint64_t)a3, a4, a5, a5, v5, v6, v7);
  return self;
}

- (int64_t)length
{
  return self->length_;
}

- (char)readByte
{
  if (self->bufferPosition_ >= self->bufferLength_)
  {
    ++self->currentBufferIndex_;
    sub_10002F934((id *)&self->super.super.super.isa, 1, v2, v3, v4, v5, v6, v7);
  }
  currentBuffer = self->currentBuffer_;
  if (!currentBuffer) {
    JreThrowNullPointerException();
  }
  int bufferPosition = self->bufferPosition_;
  self->bufferPosition_ = bufferPosition + 1;
  uint64_t size = currentBuffer->super.size_;
  if (bufferPosition < 0 || bufferPosition >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, bufferPosition);
  }
  return *((unsigned char *)&currentBuffer->super.size_ + bufferPosition + 4);
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a5 >= 1)
  {
    int v8 = a5;
    uint64_t v9 = *(void *)&a4;
    uint64_t bufferPosition = self->bufferPosition_;
    do
    {
      int bufferLength = self->bufferLength_;
      if ((int)bufferPosition >= bufferLength)
      {
        ++self->currentBufferIndex_;
        sub_10002F934((id *)&self->super.super.super.isa, 1, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, v5, v6, v7);
        int bufferLength = self->bufferLength_;
        uint64_t bufferPosition = self->bufferPosition_;
      }
      int v14 = bufferLength - bufferPosition;
      if (v8 >= v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v8;
      }
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->currentBuffer_, bufferPosition, a3, v9, v15);
      uint64_t v9 = (v15 + v9);
      v8 -= v15;
      uint64_t bufferPosition = (self->bufferPosition_ + v15);
      self->bufferPosition_ = bufferPosition;
    }
    while (v8 > 0);
  }
}

- (void)switchCurrentBufferWithBoolean:(BOOL)a3
{
  sub_10002F934((id *)&self->super.super.super.isa, a3, a3, v3, v4, v5, v6, v7);
}

- (int64_t)getFilePointer
{
  if (self->currentBufferIndex_ < 0) {
    return 0;
  }
  else {
    return self->bufferStart_ + self->bufferPosition_;
  }
}

- (void)seekWithLong:(int64_t)a3
{
  if (!self->currentBuffer_
    || ((int64_t bufferStart = self->bufferStart_, bufferStart <= a3) ? (v11 = bufferStart + 1024 <= a3) : (v11 = 1), v11))
  {
    self->currentBufferIndex_ = a3 / 1024;
    sub_10002F934((id *)&self->super.super.super.isa, 0, a3, v3, v4, v5, v6, v7);
  }
  if (a3 <= 0) {
    int64_t v12 = -(-a3 & 0x3FF);
  }
  else {
    LODWORD(v12) = a3 & 0x3FF;
  }
  self->bufferPosition_ = v12;
}

- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  if ((a5 | a4) < 0 || (uint64_t v10 = a5 + a4, a5 + a4 > self->length_))
  {
    CFStringRef v19 = JreStrcat("$$$@", (uint64_t)a2, (uint64_t)a3, a4, a5, v5, v6, v7, @"slice() ");
    v20 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v19);
    objc_exception_throw(v20);
  }
  id v11 = [(OrgApacheLuceneStoreIndexInput *)self getFullSliceDescriptionWithNSString:a3];
  file = self->file_;
  v13 = [OrgApacheLuceneStoreRAMInputStream__1 alloc];
  *(void *)(&v13->super.bufferLength_ + 1) = a4;
  OrgApacheLuceneStoreRAMInputStream_initWithNSString_withOrgApacheLuceneStoreRAMFile_withLong_((uint64_t)v13, (uint64_t)v11, file, v10, v14, v15, v16, v17);
  [(OrgApacheLuceneStoreRAMInputStream_$1 *)v13 seekWithLong:0];
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreRAMInputStream;
  [(OrgApacheLuceneStoreIndexInput *)&v3 dealloc];
}

@end
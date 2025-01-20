@interface OrgApacheLuceneStoreRAMOutputStream
- (OrgApacheLuceneStoreRAMOutputStream)init;
- (OrgApacheLuceneStoreRAMOutputStream)initWithNSString:(id)a3 withOrgApacheLuceneStoreRAMFile:(id)a4 withBoolean:(BOOL)a5;
- (OrgApacheLuceneStoreRAMOutputStream)initWithOrgApacheLuceneStoreRAMFile:(id)a3 withBoolean:(BOOL)a4;
- (id)getChildResources;
- (id)switchCurrentBuffer;
- (int64_t)getChecksum;
- (int64_t)getFilePointer;
- (int64_t)ramBytesUsed;
- (uint64_t)flush;
- (void)dealloc;
- (void)reset;
- (void)writeByteWithByte:(char)a3;
- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeToWithByteArray:(id)a3 withInt:(int)a4;
- (void)writeToWithOrgApacheLuceneStoreDataOutput:(id)a3;
@end

@implementation OrgApacheLuceneStoreRAMOutputStream

- (OrgApacheLuceneStoreRAMOutputStream)init
{
  v3 = new_OrgApacheLuceneStoreRAMFile_init();
  OrgApacheLuceneStoreRAMOutputStream_initWithNSString_withOrgApacheLuceneStoreRAMFile_withBoolean_((uint64_t)self, @"noname", v3, 0, v4, v5, v6, v7);
  return self;
}

- (OrgApacheLuceneStoreRAMOutputStream)initWithOrgApacheLuceneStoreRAMFile:(id)a3 withBoolean:(BOOL)a4
{
  OrgApacheLuceneStoreRAMOutputStream_initWithNSString_withOrgApacheLuceneStoreRAMFile_withBoolean_((uint64_t)self, @"noname", a3, a4, v4, v5, v6, v7);
  return self;
}

- (OrgApacheLuceneStoreRAMOutputStream)initWithNSString:(id)a3 withOrgApacheLuceneStoreRAMFile:(id)a4 withBoolean:(BOOL)a5
{
  OrgApacheLuceneStoreRAMOutputStream_initWithNSString_withOrgApacheLuceneStoreRAMFile_withBoolean_((uint64_t)self, (uint64_t)a3, a4, a5, a5, v5, v6, v7);
  return self;
}

- (void)writeToWithOrgApacheLuceneStoreDataOutput:(id)a3
{
  [(OrgApacheLuceneStoreRAMOutputStream *)self flush];
  file = self->file_;
  if (!file) {
    goto LABEL_10;
  }
  uint64_t length = file->length_;
  if (length < 1) {
    return;
  }
  if (!a3) {
LABEL_10:
  }
    JreThrowNullPointerException();
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  int64_t v9 = file->length_;
  do
  {
    v8 += 1024;
    if (v8 <= length) {
      uint64_t v10 = 1024;
    }
    else {
      uint64_t v10 = v9;
    }
    objc_msgSend(a3, "writeBytesWithByteArray:withInt:", -[OrgApacheLuceneStoreRAMFile getBufferWithInt:](self->file_, "getBufferWithInt:", v7), v10);
    LODWORD(v9) = v9 - 1024;
    uint64_t v7 = (v7 + 1);
  }
  while (v8 < length);
}

- (void)writeToWithByteArray:(id)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(OrgApacheLuceneStoreRAMOutputStream *)self flush];
  file = self->file_;
  if (!file) {
    JreThrowNullPointerException();
  }
  uint64_t length = file->length_;
  if (length >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    int64_t v11 = file->length_;
    do
    {
      v10 += 1024;
      if (v10 <= length) {
        uint64_t v12 = 1024;
      }
      else {
        uint64_t v12 = v11;
      }
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_([(OrgApacheLuceneStoreRAMFile *)self->file_ getBufferWithInt:v9], 0, a3, v4, v12);
      LODWORD(v11) = v11 - 1024;
      uint64_t v9 = (v9 + 1);
      uint64_t v4 = (v12 + v4);
    }
    while (v10 < length);
  }
}

- (void)reset
{
  JreStrongAssign((id *)&self->currentBuffer_, 0);
  self->currentBufferIndex_ = -1;
  self->bufferPosition_ = 0;
  self->bufferStart_ = 0;
  self->bufferLength_ = 0;
  file = self->file_;
  if (!file) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneStoreRAMFile *)file setLengthWithLong:0];
  crc = self->crc_;
  if (crc)
  {
    [(JavaUtilZipChecksum *)crc reset];
  }
}

- (void)writeByteWithByte:(char)a3
{
  uint64_t v3 = a3;
  if (self->bufferPosition_ == self->bufferLength_)
  {
    ++self->currentBufferIndex_;
    -[OrgApacheLuceneStoreRAMOutputStream switchCurrentBuffer]_0((uint64_t)self);
  }
  crc = self->crc_;
  if (crc) {
    [(JavaUtilZipChecksum *)crc updateWithInt:v3];
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
  *((unsigned char *)&currentBuffer->super.size_ + bufferPosition + 4) = v3;
}

- (id)switchCurrentBuffer
{
  v2 = *(void **)(a1 + 24);
  if (!v2) {
    goto LABEL_7;
  }
  int v3 = *(_DWORD *)(a1 + 40);
  unsigned int v4 = [v2 numBuffers];
  uint64_t v5 = *(void **)(a1 + 24);
  id v6 = v3 == v4
     ? [v5 addBufferWithInt:1024]
     : [v5 getBufferWithInt:*(unsigned int *)(a1 + 40)];
  id result = JreStrongAssign((id *)(a1 + 32), v6);
  *(_DWORD *)(a1 + 44) = 0;
  *(void *)(a1 + 48) = (uint64_t)*(int *)(a1 + 40) << 10;
  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8) {
LABEL_7:
  }
    JreThrowNullPointerException();
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(v8 + 8);
  return result;
}

- (void)writeBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  int v5 = a5;
  uint64_t v6 = *(void *)&a4;
  crc = self->crc_;
  if (crc) {
    [(JavaUtilZipChecksum *)crc updateWithByteArray:a3 withInt:*(void *)&a4 withInt:*(void *)&a5];
  }
  if (v5 >= 1)
  {
    int bufferPosition = self->bufferPosition_;
    do
    {
      if (bufferPosition == self->bufferLength_)
      {
        ++self->currentBufferIndex_;
        -[OrgApacheLuceneStoreRAMOutputStream switchCurrentBuffer]_0((uint64_t)self);
      }
      currentBuffer = self->currentBuffer_;
      if (!currentBuffer) {
        JreThrowNullPointerException();
      }
      uint64_t v12 = self->bufferPosition_;
      int v13 = currentBuffer->super.size_ - v12;
      if (v5 >= v13) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v5;
      }
      JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v6, currentBuffer, v12, v14);
      uint64_t v6 = (v14 + v6);
      v5 -= v14;
      int bufferPosition = self->bufferPosition_ + v14;
      self->bufferPosition_ = bufferPosition;
    }
    while (v5 > 0);
  }
}

- (uint64_t)flush
{
  id result = *(uint64_t **)(a1 + 24);
  if (!result) {
    JreThrowNullPointerException();
  }
  if (*(void *)(a1 + 48) + *(int *)(a1 + 44) > result[2])
  {
    return (uint64_t *)objc_msgSend(result, "setLengthWithLong:");
  }
  return result;
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

- (int64_t)ramBytesUsed
{
  file = self->file_;
  if (!file) {
    JreThrowNullPointerException();
  }
  return (uint64_t)[(OrgApacheLuceneStoreRAMFile *)file numBuffers] << 10;
}

- (id)getChildResources
{
  uint64_t v8 = OrgApacheLuceneUtilAccountables_namedAccountableWithNSString_withOrgApacheLuceneUtilAccountable_(@"file", self->file_, v2, v3, v4, v5, v6, v7);
  return JavaUtilCollections_singletonWithId_(v8);
}

- (int64_t)getChecksum
{
  crc = self->crc_;
  if (!crc)
  {
    uint64_t v4 = new_JavaLangIllegalStateException_initWithNSString_(@"internal RAMOutputStream created with checksum disabled");
    objc_exception_throw(v4);
  }
  return (int64_t)[(JavaUtilZipChecksum *)crc getValue];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreRAMOutputStream;
  [(OrgApacheLuceneStoreIndexOutput *)&v3 dealloc];
}

@end
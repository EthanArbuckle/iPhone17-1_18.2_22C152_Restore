@interface OrgApacheLuceneStoreByteBufferIndexInput
+ (id)newInstanceWithNSString:(id)a3 withJavaNioByteBufferArray:(id)a4 withLong:(int64_t)a5 withInt:(int)a6 withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner:(id)a7 withBoolean:(BOOL)a8;
- (OrgApacheLuceneStoreByteBufferIndexInput)initWithNSString:(id)a3 withJavaNioByteBufferArray:(id)a4 withLong:(int64_t)a5 withInt:(int)a6 withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner:(id)a7 withOrgApacheLuceneUtilWeakIdentityMap:(id)a8;
- (char)readByte;
- (char)readByteWithLong:(int64_t)a3;
- (id)buildSliceWithJavaNioByteBufferArray:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (id)buildSliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (id)clone;
- (id)newCloneInstanceWithNSString:(id)a3 withJavaNioByteBufferArray:(id)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (int)readInt;
- (int)readIntWithLong:(int64_t)a3;
- (int64_t)getFilePointer;
- (int64_t)length;
- (int64_t)readLong;
- (int64_t)readLongWithLong:(int64_t)a3;
- (signed)readShort;
- (signed)readShortWithLong:(int64_t)a3;
- (void)close;
- (void)dealloc;
- (void)freeBufferWithJavaNioByteBuffer:(id)a3;
- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)seekWithLong:(int64_t)a3;
- (void)setPosWithLong:(int64_t)a3 withInt:(int)a4;
- (void)unsetBuffers;
@end

@implementation OrgApacheLuceneStoreByteBufferIndexInput

+ (id)newInstanceWithNSString:(id)a3 withJavaNioByteBufferArray:(id)a4 withLong:(int64_t)a5 withInt:(int)a6 withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner:(id)a7 withBoolean:(BOOL)a8
{
  return OrgApacheLuceneStoreByteBufferIndexInput_newInstanceWithNSString_withJavaNioByteBufferArray_withLong_withInt_withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner_withBoolean_(a3, (uint64_t)a4, a5, a6, a7, a8);
}

- (OrgApacheLuceneStoreByteBufferIndexInput)initWithNSString:(id)a3 withJavaNioByteBufferArray:(id)a4 withLong:(int64_t)a5 withInt:(int)a6 withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner:(id)a7 withOrgApacheLuceneUtilWeakIdentityMap:(id)a8
{
  return self;
}

- (char)readByte
{
  curBuf = self->curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)curBuf get];
}

- (void)readBytesWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  curBuf = self->curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  [(JavaNioByteBuffer *)curBuf getWithByteArray:a3 withInt:*(void *)&a4 withInt:*(void *)&a5];
}

- (signed)readShort
{
  curBuf = self->curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)curBuf getShort];
}

- (int)readInt
{
  curBuf = self->curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)curBuf getInt];
}

- (int64_t)readLong
{
  curBuf = self->curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)curBuf getLong];
}

- (int64_t)getFilePointer
{
  curBuf = self->curBuf_;
  if (!curBuf) {
    JreThrowNullPointerException();
  }
  uint64_t curBufIndex = self->curBufIndex_;
  int chunkSizePower = self->chunkSizePower_;
  return (curBufIndex << chunkSizePower) + [(JavaNioBuffer *)curBuf position];
}

- (void)seekWithLong:(int64_t)a3
{
  int64_t v4 = a3 >> self->chunkSizePower_;
  if (self->curBufIndex_ == v4)
  {
    curBuf = self->curBuf_;
    if (!curBuf) {
      JreThrowNullPointerException();
    }
    [(JavaNioBuffer *)curBuf positionWithInt:self->chunkSizeMask_ & a3];
  }
  else
  {
    buffers = self->buffers_;
    if (!buffers) {
      goto LABEL_9;
    }
    uint64_t size = buffers->super.size_;
    if ((v4 & 0x80000000) != 0 || (int)size <= (int)v4) {
      IOSArray_throwOutOfBoundsWithMsg(size, v4);
    }
    v8 = (&buffers->elementType_)[(int)v4];
    if (!v8) {
LABEL_9:
    }
      JreThrowNullPointerException();
    [(IOSClass *)v8 positionWithInt:self->chunkSizeMask_ & a3];
    self->curBufIndex_ = v4;
    JreStrongAssign((id *)&self->curBuf_, v8);
  }
}

- (char)readByteWithLong:(int64_t)a3
{
  buffers = self->buffers_;
  if (!buffers) {
    goto LABEL_6;
  }
  int64_t v5 = a3 >> self->chunkSizePower_;
  uint64_t size = buffers->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)size <= (int)v5) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3 >> self->chunkSizePower_);
  }
  v7 = (&buffers->elementType_)[(int)v5];
  if (!v7) {
LABEL_6:
  }
    JreThrowNullPointerException();
  return [(IOSClass *)v7 getWithInt:self->chunkSizeMask_ & a3];
}

- (void)setPosWithLong:(int64_t)a3 withInt:(int)a4
{
}

- (signed)readShortWithLong:(int64_t)a3
{
  int64_t v4 = a3 >> self->chunkSizePower_;
  buffers = self->buffers_;
  if (!buffers) {
    goto LABEL_6;
  }
  uint64_t size = buffers->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  v7 = (&buffers->elementType_)[(int)v4];
  if (!v7) {
LABEL_6:
  }
    JreThrowNullPointerException();
  return (unsigned __int16)[(IOSClass *)v7 getShortWithInt:self->chunkSizeMask_ & a3];
}

- (int)readIntWithLong:(int64_t)a3
{
  int64_t v4 = a3 >> self->chunkSizePower_;
  buffers = self->buffers_;
  if (!buffers) {
    goto LABEL_6;
  }
  uint64_t size = buffers->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  v7 = (&buffers->elementType_)[(int)v4];
  if (!v7) {
LABEL_6:
  }
    JreThrowNullPointerException();
  return [(IOSClass *)v7 getIntWithInt:self->chunkSizeMask_ & a3];
}

- (int64_t)readLongWithLong:(int64_t)a3
{
  int64_t v4 = a3 >> self->chunkSizePower_;
  buffers = self->buffers_;
  if (!buffers) {
    goto LABEL_6;
  }
  uint64_t size = buffers->super.size_;
  if ((v4 & 0x80000000) != 0 || (int)size <= (int)v4) {
    IOSArray_throwOutOfBoundsWithMsg(size, v4);
  }
  v7 = (&buffers->elementType_)[(int)v4];
  if (!v7) {
LABEL_6:
  }
    JreThrowNullPointerException();
  return (int64_t)[(IOSClass *)v7 getLongWithInt:self->chunkSizeMask_ & a3];
}

- (int64_t)length
{
  return self->length_;
}

- (id)clone
{
  id v3 = [(OrgApacheLuceneStoreByteBufferIndexInput *)self buildSliceWithNSString:0 withLong:0 withLong:self->length_];
  if (!v3) {
    JreThrowNullPointerException();
  }
  int64_t v4 = v3;
  objc_msgSend(v3, "seekWithLong:", -[OrgApacheLuceneStoreByteBufferIndexInput getFilePointer](self, "getFilePointer"));
  return v4;
}

- (id)sliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  if ((a5 | a4) < 0 || a5 + a4 > self->length_)
  {
    CFStringRef v9 = JreStrcat("$$$J$J$J$@", (uint64_t)a2, (uint64_t)a3, a4, a5, v5, v6, v7, @"slice() ");
    v10 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v9);
    objc_exception_throw(v10);
  }
  return -[OrgApacheLuceneStoreByteBufferIndexInput buildSliceWithNSString:withLong:withLong:](self, "buildSliceWithNSString:withLong:withLong:", a3);
}

- (id)buildSliceWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  buffers = self->buffers_;
  if (!buffers)
  {
    CFStringRef v14 = JreStrcat("$@", 0, (uint64_t)a3, a4, a5, v5, v6, v7, @"Already closed: ");
    v15 = new_OrgApacheLuceneStoreAlreadyClosedException_initWithNSString_((uint64_t)v14);
    objc_exception_throw(v15);
  }
  v10 = [(OrgApacheLuceneStoreByteBufferIndexInput *)self newCloneInstanceWithNSString:[(OrgApacheLuceneStoreIndexInput *)self getFullSliceDescriptionWithNSString:a3] withJavaNioByteBufferArray:sub_100130E84((uint64_t)self, (uint64_t)buffers, a4, a5) withInt:self->chunkSizeMask_ & a4 withLong:a5];
  if (!v10) {
    JreThrowNullPointerException();
  }
  v11 = v10;
  v10[80] = 1;
  clones = self->clones_;
  if (clones)
  {
    if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [(OrgApacheLuceneUtilWeakIdentityMap *)clones putWithId:v11 withId:JavaLangBoolean_TRUE__];
  }
  return v11;
}

- (id)newCloneInstanceWithNSString:(id)a3 withJavaNioByteBufferArray:(id)a4 withInt:(int)a5 withLong:(int64_t)a6
{
  if (!a4) {
    goto LABEL_11;
  }
  if (*((_DWORD *)a4 + 2) == 1)
  {
    v11 = (void *)*((void *)a4 + 3);
    if (v11)
    {
      [v11 positionWithInt:*(void *)&a5];
      uint64_t v12 = *((unsigned int *)a4 + 2);
      if ((int)v12 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v12, 0);
      }
      v13 = (void *)*((void *)a4 + 3);
      if (v13)
      {
        id v14 = [v13 slice];
        int chunkSizePower = self->chunkSizePower_;
        cleaner = self->cleaner_;
        clones = self->clones_;
        v18 = [OrgApacheLuceneStoreByteBufferIndexInput_SingleBufferImpl alloc];
        OrgApacheLuceneStoreByteBufferIndexInput_SingleBufferImpl_initWithNSString_withJavaNioByteBuffer_withLong_withInt_withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner_withOrgApacheLuceneUtilWeakIdentityMap_((uint64_t)v18, a3, v14, a6, chunkSizePower, cleaner, clones);
        goto LABEL_8;
      }
    }
LABEL_11:
    JreThrowNullPointerException();
  }
  int v19 = self->chunkSizePower_;
  v20 = self->cleaner_;
  v21 = self->clones_;
  v18 = [OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl alloc];
  OrgApacheLuceneStoreByteBufferIndexInput_MultiBufferImpl_initWithNSString_withJavaNioByteBufferArray_withInt_withLong_withInt_withOrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner_withOrgApacheLuceneUtilWeakIdentityMap_(v18, a3, a4, a5, a6, v19, v20, v21);
LABEL_8:
  return v18;
}

- (id)buildSliceWithJavaNioByteBufferArray:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  return sub_100130E84((uint64_t)self, (uint64_t)a3, a4, a5);
}

- (void)close
{
  p_buffers = &self->buffers_;
  buffers = self->buffers_;
  if (buffers)
  {
    JreStrongAssign((id *)&self->buffers_, 0);
    JreStrongAssign((id *)&self->curBuf_, 0);
    self->curBufIndex_ = 0;
    clones = self->clones_;
    if (clones) {
      [(OrgApacheLuceneUtilWeakIdentityMap *)clones removeWithId:self];
    }
    if (!self->isClone_)
    {
      uint64_t v6 = self->clones_;
      if (v6)
      {
        id v7 = [(OrgApacheLuceneUtilWeakIdentityMap *)v6 keyIterator];
        if (!v7) {
          JreThrowNullPointerException();
        }
        while (([v7 hasNext] & 1) != 0)
        {
          v8 = (id *)[v7 next];
          JreStrongAssign(v8 + 7, 0);
          JreStrongAssign(v8 + 9, 0);
          *((_DWORD *)v8 + 16) = 0;
        }
        [(OrgApacheLuceneUtilWeakIdentityMap *)self->clones_ clear];
      }
      p_elementType = &buffers->elementType_;
      unint64_t v10 = (unint64_t)&(&buffers->elementType_)[buffers->super.size_];
      if ((unint64_t)&buffers->elementType_ < v10)
      {
        do
        {
          cleaner = self->cleaner_;
          if (cleaner) {
            [(OrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner *)cleaner freeBufferWithOrgApacheLuceneStoreByteBufferIndexInput:self withJavaNioByteBuffer:*p_elementType];
          }
          ++p_elementType;
        }
        while ((unint64_t)p_elementType < v10);
      }
    }
  }
  JreStrongAssign((id *)p_buffers, 0);
  JreStrongAssign((id *)&self->curBuf_, 0);
  self->curBufIndex_ = 0;
}

- (void)unsetBuffers
{
  self->curBufIndex_ = 0;
}

- (void)freeBufferWithJavaNioByteBuffer:(id)a3
{
  cleaner = self->cleaner_;
  if (cleaner) {
    [(OrgApacheLuceneStoreByteBufferIndexInput_BufferCleaner *)cleaner freeBufferWithOrgApacheLuceneStoreByteBufferIndexInput:self withJavaNioByteBuffer:a3];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneStoreByteBufferIndexInput;
  [(OrgApacheLuceneStoreIndexInput *)&v3 dealloc];
}

@end
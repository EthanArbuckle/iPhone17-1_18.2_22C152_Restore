@interface JavaNioIoVec
+ (const)__metadata;
- (JavaNioIoVec)initWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaNioIoVec_DirectionEnum:(id)a6;
- (int)doTransferWithJavaIoFileDescriptor:(id)a3;
- (int)init__;
- (void)dealloc;
- (void)didTransferWithInt:(int)a3;
@end

@implementation JavaNioIoVec

- (JavaNioIoVec)initWithJavaNioByteBufferArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaNioIoVec_DirectionEnum:(id)a6
{
  return self;
}

- (int)init__
{
  if (self->bufferCount_ < 1) {
    return 0;
  }
  uint64_t v3 = 0;
  int v4 = 0;
  do
  {
    byteBuffers = self->byteBuffers_;
    if (!byteBuffers) {
LABEL_30:
    }
      JreThrowNullPointerException();
    int v6 = v3 + self->offset_;
    uint64_t size = byteBuffers->super.size_;
    if (v6 < 0 || v6 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v3 + self->offset_);
    }
    v8 = (&byteBuffers->elementType_)[v6];
    direction = self->direction_;
    if ((atomic_load_explicit(JavaNioIoVec_DirectionEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (direction == (JavaNioIoVec_DirectionEnum *)JavaNioIoVec_DirectionEnum_values_)
    {
      if (!v8) {
        goto LABEL_30;
      }
      [(IOSClass *)v8 checkWritable];
    }
    else if (!v8)
    {
      goto LABEL_30;
    }
    unsigned int v10 = [(IOSClass *)v8 remaining];
    unsigned int v11 = [(IOSClass *)v8 isDirect];
    ioBuffers = self->ioBuffers_;
    if (v11)
    {
      if (!ioBuffers) {
        goto LABEL_30;
      }
      IOSObjectArray_Set((uint64_t)self->ioBuffers_, v3, v8);
      unsigned int v13 = [(IOSClass *)v8 position];
      offsets = self->offsets_;
      if (!offsets) {
        goto LABEL_30;
      }
      unsigned int v15 = v13;
      uint64_t v16 = offsets->super.size_;
      if (v3 >= v16) {
        goto LABEL_27;
      }
    }
    else
    {
      if (!ioBuffers) {
        goto LABEL_30;
      }
      v17 = (void *)JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)v8);
      IOSObjectArray_Set((uint64_t)ioBuffers, v3, v17);
      int v18 = JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)v8);
      unsigned int v19 = [(IOSClass *)v8 position];
      offsets = self->offsets_;
      if (!offsets) {
        goto LABEL_30;
      }
      unsigned int v15 = v19 + v18;
      uint64_t v16 = offsets->super.size_;
      if (v3 >= v16) {
LABEL_27:
      }
        IOSArray_throwOutOfBoundsWithMsg(v16, v3);
    }
    *(&offsets->super.size_ + v3 + 1) = v15;
    byteCounts = self->byteCounts_;
    if (!byteCounts) {
      goto LABEL_30;
    }
    uint64_t v21 = byteCounts->super.size_;
    if (v3 >= v21) {
      IOSArray_throwOutOfBoundsWithMsg(v21, v3);
    }
    *(&byteCounts->super.size_ + v3 + 1) = v10;
    v4 += v10;
    ++v3;
  }
  while (v3 < self->bufferCount_);
  return v4;
}

- (int)doTransferWithJavaIoFileDescriptor:(id)a3
{
  direction = self->direction_;
  if ((atomic_load_explicit(JavaNioIoVec_DirectionEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v6 = JavaNioIoVec_DirectionEnum_values_;
  unsigned __int8 explicit = atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire);
  if (direction == (JavaNioIoVec_DirectionEnum *)v6)
  {
    if ((explicit & 1) == 0) {
      objc_opt_class();
    }
    if (!LibcoreIoLibcore_os_) {
      JreThrowNullPointerException();
    }
    int result = [(id)LibcoreIoLibcore_os_ readvWithJavaIoFileDescriptor:a3 withNSObjectArray:self->ioBuffers_ withIntArray:self->offsets_ withIntArray:self->byteCounts_];
    if (!result) {
      return -1;
    }
  }
  else
  {
    if ((explicit & 1) == 0) {
      objc_opt_class();
    }
    if (!LibcoreIoLibcore_os_) {
      JreThrowNullPointerException();
    }
    return [(id)LibcoreIoLibcore_os_ writevWithJavaIoFileDescriptor:a3 withNSObjectArray:self->ioBuffers_ withIntArray:self->offsets_ withIntArray:self->byteCounts_];
  }
  return result;
}

- (void)didTransferWithInt:(int)a3
{
  if (a3 >= 1)
  {
    int v3 = a3;
    uint64_t v5 = 0;
    while (v5 < self->bufferCount_)
    {
      byteBuffers = self->byteBuffers_;
      if (!byteBuffers) {
        goto LABEL_27;
      }
      int v7 = v5 + self->offset_;
      uint64_t size = byteBuffers->super.size_;
      if (v7 < 0 || v7 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5 + self->offset_);
      }
      byteCounts = self->byteCounts_;
      if (!byteCounts) {
        goto LABEL_27;
      }
      unsigned int v10 = (&byteBuffers->elementType_)[v7];
      uint64_t v11 = byteCounts->super.size_;
      if (v5 >= v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v5);
      }
      if (*(&byteCounts->super.size_ + v5 + 1) >= v3)
      {
        if (!v10) {
LABEL_27:
        }
          JreThrowNullPointerException();
        direction = self->direction_;
        if ((atomic_load_explicit(JavaNioIoVec_DirectionEnum__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        if (direction == (JavaNioIoVec_DirectionEnum *)qword_100563EC0) {
          unsigned int v15 = [(IOSClass *)v10 position];
        }
        else {
          unsigned int v15 = 0;
        }
        [(IOSClass *)v10 positionWithInt:v15 + v3];
        return;
      }
      if (!v10) {
        goto LABEL_27;
      }
      [(IOSClass *)v10 positionWithInt:[(IOSClass *)v10 limit]];
      v12 = self->byteCounts_;
      uint64_t v13 = v12->super.size_;
      if (v5 >= v13) {
        IOSArray_throwOutOfBoundsWithMsg(v13, v5);
      }
      v3 -= *(&v12->super.size_ + ++v5);
      if (v3 <= 0) {
        return;
      }
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioIoVec;
  [(JavaNioIoVec *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004308E0;
}

@end
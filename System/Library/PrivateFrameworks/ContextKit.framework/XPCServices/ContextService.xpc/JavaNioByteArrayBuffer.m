@interface JavaNioByteArrayBuffer
+ (const)__metadata;
+ (id)copy__WithJavaNioByteArrayBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (BOOL)isDirect;
- (BOOL)isReadOnly;
- (BOOL)protectedHasArray;
- (JavaNioByteArrayBuffer)initWithByteArray:(id)a3;
- (JavaNioByteArrayBuffer)initWithInt:(int)a3 withByteArray:(id)a4 withInt:(int)a5 withBoolean:(BOOL)a6;
- (char)get;
- (char)getWithInt:(int)a3;
- (double)getDouble;
- (double)getDoubleWithInt:(int)a3;
- (float)getFloat;
- (float)getFloatWithInt:(int)a3;
- (id)asReadOnlyBuffer;
- (id)compact;
- (id)duplicate;
- (id)getWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)protectedArray;
- (id)putCharWithChar:(unsigned __int16)a3;
- (id)putCharWithInt:(int)a3 withChar:(unsigned __int16)a4;
- (id)putDoubleWithDouble:(double)a3;
- (id)putDoubleWithInt:(int)a3 withDouble:(double)a4;
- (id)putFloatWithFloat:(float)a3;
- (id)putFloatWithInt:(int)a3 withFloat:(float)a4;
- (id)putIntWithInt:(int)a3;
- (id)putIntWithInt:(int)a3 withInt:(int)a4;
- (id)putLongWithInt:(int)a3 withLong:(int64_t)a4;
- (id)putLongWithLong:(int64_t)a3;
- (id)putShortWithInt:(int)a3 withShort:(signed __int16)a4;
- (id)putShortWithShort:(signed __int16)a3;
- (id)putWithByte:(char)a3;
- (id)putWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)putWithInt:(int)a3 withByte:(char)a4;
- (id)slice;
- (int)getIntWithInt:(int)a3;
- (int)protectedArrayOffset;
- (int64_t)getLongWithInt:(int)a3;
- (signed)getShort;
- (signed)getShortWithInt:(int)a3;
- (uint64_t)getInt;
- (unint64_t)getLong;
- (unsigned)getChar;
- (unsigned)getCharWithInt:(int)a3;
- (void)dealloc;
- (void)getWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)getWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)getWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)getWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)getWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)getWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)putWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)putWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)putWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)putWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)putWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)putWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaNioByteArrayBuffer

- (JavaNioByteArrayBuffer)initWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  sub_10021BC84((uint64_t)self, *((unsigned int *)a3 + 2), a3, 0, 0, v3, v4, v5);
  return self;
}

- (JavaNioByteArrayBuffer)initWithInt:(int)a3 withByteArray:(id)a4 withInt:(int)a5 withBoolean:(BOOL)a6
{
  sub_10021BC84((uint64_t)self, *(uint64_t *)&a3, a4, *(uint64_t *)&a5, a6, a6, v6, v7);
  return self;
}

+ (id)copy__WithJavaNioByteArrayBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return sub_10021BD70((uint64_t)a3, a4, a5);
}

- (id)asReadOnlyBuffer
{
  return sub_10021BD70((uint64_t)self, self->super.super.mark_, 1);
}

- (id)compact
{
  if (self->isReadOnly_)
  {
    uint64_t v4 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v4);
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->backingArray_, (self->arrayOffset_ + self->super.super.position_), self->backingArray_, self->arrayOffset_, [(JavaNioBuffer *)self remaining]);
  self->super.super.position_ = self->super.super.limit_ - self->super.super.position_;
  self->super.super.limit_ = self->super.super.capacity_;
  self->super.super.mark_ = -1;
  return self;
}

- (id)duplicate
{
  return sub_10021BD70((uint64_t)self, self->super.super.mark_, self->isReadOnly_);
}

- (id)slice
{
  uint64_t v3 = [(JavaNioBuffer *)self remaining];
  backingArray = self->backingArray_;
  uint64_t v5 = (self->super.super.position_ + self->arrayOffset_);
  BOOL isReadOnly = self->isReadOnly_;
  uint64_t v7 = [JavaNioByteArrayBuffer alloc];
  sub_10021BC84((uint64_t)v7, v3, backingArray, v5, isReadOnly, v8, v9, v10);
  return v7;
}

- (BOOL)isReadOnly
{
  return self->isReadOnly_;
}

- (id)protectedArray
{
  if (self->isReadOnly_)
  {
    uint64_t v3 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v3);
  }
  return self->backingArray_;
}

- (int)protectedArrayOffset
{
  if (self->isReadOnly_)
  {
    uint64_t v3 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v3);
  }
  return self->arrayOffset_;
}

- (BOOL)protectedHasArray
{
  return !self->isReadOnly_;
}

- (id)getWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  [(JavaNioBuffer *)self checkGetBoundsWithInt:1 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->backingArray_, (self->super.super.position_ + self->arrayOffset_), a3, v6, v5);
  self->super.super.position_ += v5;
  return self;
}

- (void)getWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkGetBoundsWithInt:2 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)a3 + 2 * a4 + 12), (int8x8_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), v8, 2, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)getWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkGetBoundsWithInt:8 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)a3 + a4 + 2, (int8x8_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), v8, 8, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)getWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkGetBoundsWithInt:4 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)a3 + 4 * a4 + 12), (int8x8_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), v8, 4, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)getWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkGetBoundsWithInt:4 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)a3 + 4 * a4 + 12), (int8x8_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), v8, 4, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)getWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkGetBoundsWithInt:8 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)a3 + a4 + 2, (int8x8_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), v8, 8, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)getWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkGetBoundsWithInt:2 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)a3 + 2 * a4 + 12), (int8x8_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), v8, 2, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (char)get
{
  int position = self->super.super.position_;
  if (position == self->super.super.limit_)
  {
    int v8 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v8);
  }
  backingArray = self->backingArray_;
  if (!backingArray) {
    JreThrowNullPointerException();
  }
  int arrayOffset = self->arrayOffset_;
  self->super.super.position_ = position + 1;
  uint64_t size = backingArray->super.size_;
  int v6 = arrayOffset + position;
  if (arrayOffset + position < 0 || v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (arrayOffset + position));
  }
  return *((unsigned char *)&backingArray->super.size_ + v6 + 4);
}

- (char)getWithInt:(int)a3
{
  -[JavaNioBuffer checkIndexWithInt:](self, "checkIndexWithInt:");
  backingArray = self->backingArray_;
  if (!backingArray) {
    JreThrowNullPointerException();
  }
  uint64_t size = backingArray->super.size_;
  uint64_t v7 = (self->arrayOffset_ + a3);
  if ((int)v7 < 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  return *((unsigned char *)&backingArray->super.size_ + (int)v7 + 4);
}

- (unsigned)getChar
{
  int position = self->super.super.position_;
  int v3 = position + 2;
  if (position + 2 > self->super.super.limit_)
  {
    int v6 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v6);
  }
  unsigned __int16 result = LibcoreIoMemory_peekShortWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + position), (uint64_t)self->super.order_);
  self->super.super.position_ = v3;
  return result;
}

- (unsigned)getCharWithInt:(int)a3
{
  return LibcoreIoMemory_peekShortWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + a3), (uint64_t)self->super.order_);
}

- (double)getDouble
{
  unint64_t v2 = -[JavaNioByteArrayBuffer getLong]_0((uint64_t)self);
  return JavaLangDouble_longBitsToDoubleWithLong_(v2);
}

- (unint64_t)getLong
{
  int v1 = *(_DWORD *)(a1 + 20);
  int v2 = v1 + 8;
  if (v1 + 8 > *(_DWORD *)(a1 + 12))
  {
    uint64_t v5 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v5);
  }
  unint64_t result = LibcoreIoMemory_peekLongWithByteArray_withInt_withJavaNioByteOrder_(*(void *)(a1 + 48), (*(_DWORD *)(a1 + 56) + v1), *(void *)(a1 + 40));
  *(_DWORD *)(a1 + 20) = v2;
  return result;
}

- (double)getDoubleWithInt:(int)a3
{
  [(JavaNioBuffer *)self checkIndexWithInt:*(void *)&a3 withInt:8];
  unint64_t v5 = LibcoreIoMemory_peekLongWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + a3), (uint64_t)self->super.order_);
  return JavaLangDouble_longBitsToDoubleWithLong_(v5);
}

- (float)getFloat
{
  int v2 = -[JavaNioByteArrayBuffer getInt]_0((uint64_t)self);
  return JavaLangFloat_intBitsToFloatWithInt_(v2);
}

- (uint64_t)getInt
{
  int v1 = *(_DWORD *)(a1 + 20);
  int v2 = v1 + 4;
  if (v1 + 4 > *(_DWORD *)(a1 + 12))
  {
    unint64_t v5 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v5);
  }
  uint64_t result = LibcoreIoMemory_peekIntWithByteArray_withInt_withJavaNioByteOrder_(*(void *)(a1 + 48), (*(_DWORD *)(a1 + 56) + v1), *(void *)(a1 + 40));
  *(_DWORD *)(a1 + 20) = v2;
  return result;
}

- (float)getFloatWithInt:(int)a3
{
  [(JavaNioBuffer *)self checkIndexWithInt:*(void *)&a3 withInt:4];
  int v5 = LibcoreIoMemory_peekIntWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + a3), (uint64_t)self->super.order_);
  return JavaLangFloat_intBitsToFloatWithInt_(v5);
}

- (int)getIntWithInt:(int)a3
{
  [(JavaNioBuffer *)self checkIndexWithInt:*(void *)&a3 withInt:4];
  backingArray = self->backingArray_;
  uint64_t v6 = (self->arrayOffset_ + a3);
  order = self->super.order_;
  return LibcoreIoMemory_peekIntWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)backingArray, v6, (uint64_t)order);
}

- (int64_t)getLongWithInt:(int)a3
{
  [(JavaNioBuffer *)self checkIndexWithInt:*(void *)&a3 withInt:8];
  backingArray = self->backingArray_;
  uint64_t v6 = (self->arrayOffset_ + a3);
  order = self->super.order_;
  return LibcoreIoMemory_peekLongWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)backingArray, v6, (uint64_t)order);
}

- (signed)getShort
{
  int position = self->super.super.position_;
  int v3 = position + 2;
  if (position + 2 > self->super.super.limit_)
  {
    uint64_t v6 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v6);
  }
  signed __int16 result = LibcoreIoMemory_peekShortWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + position), (uint64_t)self->super.order_);
  self->super.super.position_ = v3;
  return result;
}

- (signed)getShortWithInt:(int)a3
{
  [(JavaNioBuffer *)self checkIndexWithInt:*(void *)&a3 withInt:2];
  backingArray = self->backingArray_;
  uint64_t v6 = (self->arrayOffset_ + a3);
  order = self->super.order_;
  return LibcoreIoMemory_peekShortWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)backingArray, v6, (uint64_t)order);
}

- (BOOL)isDirect
{
  return 0;
}

- (id)putWithByte:(char)a3
{
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_11;
  }
  int position = self->super.super.position_;
  if (position == self->super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_11:
    objc_exception_throw(OnlyBufferException_init);
  }
  backingArray = self->backingArray_;
  if (!backingArray) {
    JreThrowNullPointerException();
  }
  int arrayOffset = self->arrayOffset_;
  self->super.super.position_ = position + 1;
  uint64_t size = backingArray->super.size_;
  int v8 = arrayOffset + position;
  if (arrayOffset + position < 0 || v8 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (arrayOffset + position));
  }
  *((unsigned char *)&backingArray->super.size_ + v8 + 4) = a3;
  return self;
}

- (id)putWithInt:(int)a3 withByte:(char)a4
{
  if (self->isReadOnly_)
  {
    v11 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v11);
  }
  -[JavaNioBuffer checkIndexWithInt:](self, "checkIndexWithInt:");
  backingArray = self->backingArray_;
  if (!backingArray) {
    JreThrowNullPointerException();
  }
  uint64_t size = backingArray->super.size_;
  uint64_t v9 = (self->arrayOffset_ + a3);
  if ((int)v9 < 0 || (int)v9 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v9);
  }
  *((unsigned char *)&backingArray->super.size_ + (int)v9 + 4) = a4;
  return self;
}

- (id)putWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (self->isReadOnly_)
  {
    uint64_t v10 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v10);
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  [(JavaNioBuffer *)self checkPutBoundsWithInt:1 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v7, self->backingArray_, (self->super.super.position_ + self->arrayOffset_), v6);
  self->super.super.position_ += v6;
  return self;
}

- (void)putWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkPutBoundsWithInt:2 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), (int8x8_t *)((char *)a3 + 2 * a4 + 12), v8, 2, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)putWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkPutBoundsWithInt:8 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), (int8x8_t *)a3 + a4 + 2, v8, 8, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)putWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkPutBoundsWithInt:4 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), (int8x8_t *)((char *)a3 + 4 * a4 + 12), v8, 4, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)putWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkPutBoundsWithInt:4 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), (int8x8_t *)((char *)a3 + 4 * a4 + 12), v8, 4, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)putWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkPutBoundsWithInt:8 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), (int8x8_t *)a3 + a4 + 2, v8, 8, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (void)putWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v8 = [(JavaNioBuffer *)self checkPutBoundsWithInt:2 withInt:*((unsigned int *)a3 + 2) withInt:*(void *)&a4 withInt:*(void *)&a5];
  unsafeBulkCopy((int32x2_t *)((char *)&self->backingArray_->super.size_ + self->arrayOffset_ + self->super.super.position_ + 4), (int8x8_t *)((char *)a3 + 2 * a4 + 12), v8, 2, self->super.order_->needsSwap_);
  self->super.super.position_ += v8;
}

- (id)putCharWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  if (self->isReadOnly_)
  {
    int v8 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v8);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:*(void *)&a3 withInt:2];
  LibcoreIoMemory_pokeShortWithByteArray_withInt_withShort_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + a3), a4, (uint64_t)self->super.order_);
  return self;
}

- (id)putCharWithChar:(unsigned __int16)a3
{
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_6;
  }
  int position = self->super.super.position_;
  int v5 = position + 2;
  if (position + 2 > self->super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_6:
    objc_exception_throw(OnlyBufferException_init);
  }
  LibcoreIoMemory_pokeShortWithByteArray_withInt_withShort_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + position), a3, (uint64_t)self->super.order_);
  self->super.super.position_ = v5;
  return self;
}

- (id)putDoubleWithDouble:(double)a3
{
  uint64_t v4 = JavaLangDouble_doubleToRawLongBitsWithDouble_(a3);
  return [(JavaNioByteArrayBuffer *)self putLongWithLong:v4];
}

- (id)putDoubleWithInt:(int)a3 withDouble:(double)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = JavaLangDouble_doubleToRawLongBitsWithDouble_(a4);
  return [(JavaNioByteArrayBuffer *)self putLongWithInt:v4 withLong:v6];
}

- (id)putFloatWithFloat:(float)a3
{
  uint64_t v4 = JavaLangFloat_floatToRawIntBitsWithFloat_(a3);
  return [(JavaNioByteArrayBuffer *)self putIntWithInt:v4];
}

- (id)putFloatWithInt:(int)a3 withFloat:(float)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = JavaLangFloat_floatToRawIntBitsWithFloat_(a4);
  return [(JavaNioByteArrayBuffer *)self putIntWithInt:v4 withInt:v6];
}

- (id)putIntWithInt:(int)a3
{
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_6;
  }
  int position = self->super.super.position_;
  int v5 = position + 4;
  if (position + 4 > self->super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_6:
    objc_exception_throw(OnlyBufferException_init);
  }
  LibcoreIoMemory_pokeIntWithByteArray_withInt_withInt_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + position), a3, (uint64_t)self->super.order_);
  self->super.super.position_ = v5;
  return self;
}

- (id)putIntWithInt:(int)a3 withInt:(int)a4
{
  if (self->isReadOnly_)
  {
    int v8 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v8);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:*(void *)&a3 withInt:4];
  LibcoreIoMemory_pokeIntWithByteArray_withInt_withInt_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + a3), a4, (uint64_t)self->super.order_);
  return self;
}

- (id)putLongWithInt:(int)a3 withLong:(int64_t)a4
{
  if (self->isReadOnly_)
  {
    int v8 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v8);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:*(void *)&a3 withInt:8];
  LibcoreIoMemory_pokeLongWithByteArray_withInt_withLong_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + a3), a4, (uint64_t)self->super.order_);
  return self;
}

- (id)putLongWithLong:(int64_t)a3
{
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_6;
  }
  int position = self->super.super.position_;
  int v5 = position + 8;
  if (position + 8 > self->super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_6:
    objc_exception_throw(OnlyBufferException_init);
  }
  LibcoreIoMemory_pokeLongWithByteArray_withInt_withLong_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + position), a3, (uint64_t)self->super.order_);
  self->super.super.position_ = v5;
  return self;
}

- (id)putShortWithInt:(int)a3 withShort:(signed __int16)a4
{
  if (self->isReadOnly_)
  {
    int v8 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v8);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:*(void *)&a3 withInt:2];
  LibcoreIoMemory_pokeShortWithByteArray_withInt_withShort_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + a3), a4, (uint64_t)self->super.order_);
  return self;
}

- (id)putShortWithShort:(signed __int16)a3
{
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_6;
  }
  int position = self->super.super.position_;
  int v5 = position + 2;
  if (position + 2 > self->super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_6:
    objc_exception_throw(OnlyBufferException_init);
  }
  LibcoreIoMemory_pokeShortWithByteArray_withInt_withShort_withJavaNioByteOrder_((uint64_t)self->backingArray_, (self->arrayOffset_ + position), a3, (uint64_t)self->super.order_);
  self->super.super.position_ = v5;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioByteArrayBuffer;
  [(JavaNioByteBuffer *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044C490;
}

@end
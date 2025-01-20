@interface JavaNioDirectByteBuffer
+ (const)__metadata;
+ (id)copy__WithJavaNioDirectByteBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (BOOL)isDirect;
- (BOOL)isReadOnly;
- (BOOL)isValid;
- (BOOL)protectedHasArray;
- (JavaNioDirectByteBuffer)initWithJavaNioMemoryBlock:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6 withJavaNioChannelsFileChannel_MapMode:(id)a7;
- (JavaNioDirectByteBuffer)initWithLong:(int64_t)a3 withInt:(int)a4;
- (char)get;
- (char)getWithInt:(int)a3;
- (double)getDouble;
- (double)getDoubleWithInt:(int)a3;
- (float)getFloat;
- (float)getFloatWithInt:(int)a3;
- (id)asCharBuffer;
- (id)asDoubleBuffer;
- (id)asFloatBuffer;
- (id)asIntBuffer;
- (id)asLongBuffer;
- (id)asReadOnlyBuffer;
- (id)asShortBuffer;
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
- (int)getInt;
- (int)getIntWithInt:(int)a3;
- (int)protectedArrayOffset;
- (int64_t)getLong;
- (int64_t)getLongWithInt:(int)a3;
- (signed)getShort;
- (signed)getShortWithInt:(int)a3;
- (uint64_t)checkNotFreed;
- (unsigned)getChar;
- (unsigned)getCharWithInt:(int)a3;
- (void)free;
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

@implementation JavaNioDirectByteBuffer

- (JavaNioDirectByteBuffer)initWithJavaNioMemoryBlock:(id)a3 withInt:(int)a4 withInt:(int)a5 withBoolean:(BOOL)a6 withJavaNioChannelsFileChannel_MapMode:(id)a7
{
  return self;
}

- (JavaNioDirectByteBuffer)initWithLong:(int64_t)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = JavaNioMemoryBlock_wrapFromJniWithLong_withLong_(a3, a4);
  JavaNioDirectByteBuffer_initWithJavaNioMemoryBlock_withInt_withInt_withBoolean_withJavaNioChannelsFileChannel_MapMode_((uint64_t)self, v6, v4, 0, 0, 0);
  return self;
}

+ (id)copy__WithJavaNioDirectByteBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return sub_10017D9D8((uint64_t)a3, a4, a5);
}

- (id)asReadOnlyBuffer
{
  return sub_10017D9D8((uint64_t)self, self->super.super.super.mark_, 1);
}

- (id)compact
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    uint64_t v4 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v4);
  }
  LibcoreIoMemory_memmoveWithId_withInt_withId_withInt_withLong_((uint64_t)self, 0, (uint64_t)self, self->super.super.super.position_, [(JavaNioBuffer *)self remaining]);
  self->super.super.super.position_ = self->super.super.super.limit_ - self->super.super.super.position_;
  self->super.super.super.limit_ = self->super.super.super.capacity_;
  self->super.super.super.mark_ = -1;
  return self;
}

- (uint64_t)checkNotFreed
{
  if (*(unsigned char *)(result + 68))
  {
    v1 = new_JavaLangIllegalStateException_initWithNSString_(@"buffer was freed");
    objc_exception_throw(v1);
  }
  return result;
}

- (id)duplicate
{
  return sub_10017D9D8((uint64_t)self, self->super.super.super.mark_, self->isReadOnly_);
}

- (id)slice
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  block = self->super.block_;
  uint64_t v4 = [(JavaNioBuffer *)self remaining];
  char isReadOnly = self->isReadOnly_;
  int v6 = self->super.super.super.position_ + self->offset_;
  mapMode = self->super.mapMode_;
  v8 = [JavaNioDirectByteBuffer alloc];
  JavaNioDirectByteBuffer_initWithJavaNioMemoryBlock_withInt_withInt_withBoolean_withJavaNioChannelsFileChannel_MapMode_((uint64_t)v8, block, v4, v6, isReadOnly, mapMode);
  return v8;
}

- (BOOL)isReadOnly
{
  return self->isReadOnly_;
}

- (id)protectedArray
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_8;
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  id result = [(JavaNioMemoryBlock *)block array];
  if (!result)
  {
    OnlyBufferException_init = (JavaNioReadOnlyBufferException *)new_JavaLangUnsupportedOperationException_init();
LABEL_8:
    objc_exception_throw(OnlyBufferException_init);
  }
  return result;
}

- (int)protectedArrayOffset
{
  return self->offset_;
}

- (BOOL)protectedHasArray
{
  if (self->isReadOnly_) {
    return 0;
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  return [(JavaNioMemoryBlock *)block array] != 0;
}

- (id)getWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || ([(JavaNioBuffer *)self checkGetBoundsWithInt:1 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0))
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block peekByteArrayWithInt:(self->super.super.super.position_ + self->offset_) withByteArray:a3 withInt:v6 withInt:v5];
  self->super.super.super.position_ += v5;
  return self;
}

- (void)getWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkGetBoundsWithInt:2 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block peekCharArrayWithInt:(self->super.super.super.position_ + self->offset_) withCharArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)getWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkGetBoundsWithInt:8 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block peekDoubleArrayWithInt:(self->super.super.super.position_ + self->offset_) withDoubleArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)getWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkGetBoundsWithInt:4 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block peekFloatArrayWithInt:(self->super.super.super.position_ + self->offset_) withFloatArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)getWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkGetBoundsWithInt:4 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block peekIntArrayWithInt:(self->super.super.super.position_ + self->offset_) withIntArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)getWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkGetBoundsWithInt:8 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block peekLongArrayWithInt:(self->super.super.super.position_ + self->offset_) withLongArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)getWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkGetBoundsWithInt:2 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block peekShortArrayWithInt:(self->super.super.super.position_ + self->offset_) withShortArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (char)get
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  int position = self->super.super.super.position_;
  if (position == self->super.super.super.limit_)
  {
    uint64_t v6 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v6);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  int offset = self->offset_;
  self->super.super.super.position_ = position + 1;
  return [(JavaNioMemoryBlock *)block peekByteWithInt:(offset + position)];
}

- (char)getWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  [(JavaNioBuffer *)self checkIndexWithInt:v3];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = (self->offset_ + v3);
  return [(JavaNioMemoryBlock *)block peekByteWithInt:v6];
}

- (unsigned)getChar
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  int position = self->super.super.super.position_;
  int v4 = position + 2;
  if (position + 2 > self->super.super.super.limit_)
  {
    v7 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v7);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  unsigned __int16 result = [(JavaNioMemoryBlock *)block peekShortWithInt:(self->offset_ + position) withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v4;
  return result;
}

- (unsigned)getCharWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  [(JavaNioBuffer *)self checkIndexWithInt:v3 withInt:2];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  return [(JavaNioMemoryBlock *)block peekShortWithInt:(self->offset_ + v3) withJavaNioByteOrder:self->super.super.order_];
}

- (double)getDouble
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  int position = self->super.super.super.position_;
  int v4 = position + 8;
  if (position + 8 > self->super.super.super.limit_)
  {
    v7 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v7);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  double result = JavaLangDouble_longBitsToDoubleWithLong_([(JavaNioMemoryBlock *)block peekLongWithInt:(self->offset_ + position) withJavaNioByteOrder:self->super.super.order_]);
  self->super.super.super.position_ = v4;
  return result;
}

- (double)getDoubleWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  [(JavaNioBuffer *)self checkIndexWithInt:v3 withInt:8];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  int64_t v6 = [(JavaNioMemoryBlock *)block peekLongWithInt:(self->offset_ + v3) withJavaNioByteOrder:self->super.super.order_];
  return JavaLangDouble_longBitsToDoubleWithLong_(v6);
}

- (float)getFloat
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  int position = self->super.super.super.position_;
  int v4 = position + 4;
  if (position + 4 > self->super.super.super.limit_)
  {
    v7 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v7);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  float result = JavaLangFloat_intBitsToFloatWithInt_([(JavaNioMemoryBlock *)block peekIntWithInt:(self->offset_ + position) withJavaNioByteOrder:self->super.super.order_]);
  self->super.super.super.position_ = v4;
  return result;
}

- (float)getFloatWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  [(JavaNioBuffer *)self checkIndexWithInt:v3 withInt:4];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  int v6 = [(JavaNioMemoryBlock *)block peekIntWithInt:(self->offset_ + v3) withJavaNioByteOrder:self->super.super.order_];
  return JavaLangFloat_intBitsToFloatWithInt_(v6);
}

- (int)getInt
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  int position = self->super.super.super.position_;
  int v4 = position + 4;
  if (position + 4 > self->super.super.super.limit_)
  {
    v7 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v7);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  int result = [(JavaNioMemoryBlock *)block peekIntWithInt:(self->offset_ + position) withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v4;
  return result;
}

- (int)getIntWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  [(JavaNioBuffer *)self checkIndexWithInt:v3 withInt:4];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = (self->offset_ + v3);
  order = self->super.super.order_;
  return [(JavaNioMemoryBlock *)block peekIntWithInt:v6 withJavaNioByteOrder:order];
}

- (int64_t)getLong
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  int position = self->super.super.super.position_;
  int v4 = position + 8;
  if (position + 8 > self->super.super.super.limit_)
  {
    v7 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v7);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  int64_t result = [(JavaNioMemoryBlock *)block peekLongWithInt:(self->offset_ + position) withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v4;
  return result;
}

- (int64_t)getLongWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  [(JavaNioBuffer *)self checkIndexWithInt:v3 withInt:8];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = (self->offset_ + v3);
  order = self->super.super.order_;
  return [(JavaNioMemoryBlock *)block peekLongWithInt:v6 withJavaNioByteOrder:order];
}

- (signed)getShort
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  int position = self->super.super.super.position_;
  int v4 = position + 2;
  if (position + 2 > self->super.super.super.limit_)
  {
    v7 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v7);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  signed __int16 result = [(JavaNioMemoryBlock *)block peekShortWithInt:(self->offset_ + position) withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v4;
  return result;
}

- (signed)getShortWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  [(JavaNioBuffer *)self checkIndexWithInt:v3 withInt:2];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  uint64_t v6 = (self->offset_ + v3);
  order = self->super.super.order_;
  return [(JavaNioMemoryBlock *)block peekShortWithInt:v6 withJavaNioByteOrder:order];
}

- (BOOL)isDirect
{
  return 1;
}

- (BOOL)isValid
{
  return !self->freed_;
}

- (void)free
{
  if (!self->freed_)
  {
    block = self->super.block_;
    if (!block) {
      JreThrowNullPointerException();
    }
    [(JavaNioMemoryBlock *)block free];
    self->freed_ = 1;
  }
}

- (id)asCharBuffer
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  return JavaNioByteBufferAsCharBuffer_asCharBufferWithJavaNioByteBuffer_(self);
}

- (id)asDoubleBuffer
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  return JavaNioByteBufferAsDoubleBuffer_asDoubleBufferWithJavaNioByteBuffer_(self);
}

- (id)asFloatBuffer
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  return JavaNioByteBufferAsFloatBuffer_asFloatBufferWithJavaNioByteBuffer_(self);
}

- (id)asIntBuffer
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  return JavaNioByteBufferAsIntBuffer_asIntBufferWithJavaNioByteBuffer_(self);
}

- (id)asLongBuffer
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  return JavaNioByteBufferAsLongBuffer_asLongBufferWithJavaNioByteBuffer_(self);
}

- (id)asShortBuffer
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  return JavaNioByteBufferAsShortBuffer_asShortBufferWithJavaNioByteBuffer_(self);
}

- (id)putWithByte:(char)a3
{
  uint64_t v3 = a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_8;
  }
  int position = self->super.super.super.position_;
  if (position == self->super.super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_8:
    objc_exception_throw(OnlyBufferException_init);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  int offset = self->offset_;
  self->super.super.super.position_ = position + 1;
  [(JavaNioMemoryBlock *)block pokeByteWithInt:(offset + position) withByte:v3];
  return self;
}

- (id)putWithInt:(int)a3 withByte:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    unsigned int v9 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v9);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:v5];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeByteWithInt:(self->offset_ + v5) withByte:v4];
  return self;
}

- (id)putWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    v11 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v11);
  }
  if (!a3
    || ([(JavaNioBuffer *)self checkPutBoundsWithInt:1 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0))
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeByteArrayWithInt:(self->super.super.super.position_ + self->offset_) withByteArray:a3 withInt:v6 withInt:v5];
  self->super.super.super.position_ += v5;
  return self;
}

- (void)putWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkPutBoundsWithInt:2 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeCharArrayWithInt:(self->super.super.super.position_ + self->offset_) withCharArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)putWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkPutBoundsWithInt:8 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeDoubleArrayWithInt:(self->super.super.super.position_ + self->offset_) withDoubleArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)putWithFloatArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkPutBoundsWithInt:4 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeFloatArrayWithInt:(self->super.super.super.position_ + self->offset_) withFloatArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)putWithIntArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkPutBoundsWithInt:4 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeIntArrayWithInt:(self->super.super.super.position_ + self->offset_) withIntArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)putWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkPutBoundsWithInt:8 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeLongArrayWithInt:(self->super.super.super.position_ + self->offset_) withLongArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (void)putWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (!a3
    || (unsigned int v9 = [(JavaNioBuffer *)self checkPutBoundsWithInt:2 withInt:*((unsigned int *)a3 + 2) withInt:v6 withInt:v5], (block = self->super.block_) == 0)|| (order = self->super.super.order_) == 0)
  {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeShortArrayWithInt:(self->super.super.super.position_ + self->offset_) withShortArray:a3 withInt:v6 withInt:v5 withBoolean:order->needsSwap_];
  self->super.super.super.position_ += v9;
}

- (id)putCharWithChar:(unsigned __int16)a3
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_8;
  }
  int position = self->super.super.super.position_;
  int v6 = position + 2;
  if (position + 2 > self->super.super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_8:
    objc_exception_throw(OnlyBufferException_init);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeShortWithInt:(self->offset_ + position) withShort:(__int16)a3 withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v6;
  return self;
}

- (id)putCharWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  uint64_t v5 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    unsigned int v9 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v9);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:v5 withInt:2];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeShortWithInt:(self->offset_ + v5) withShort:(__int16)a4 withJavaNioByteOrder:self->super.super.order_];
  return self;
}

- (id)putDoubleWithDouble:(double)a3
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_8;
  }
  int position = self->super.super.super.position_;
  int v6 = position + 8;
  if (position + 8 > self->super.super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_8:
    objc_exception_throw(OnlyBufferException_init);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeLongWithInt:(self->offset_ + position) withLong:JavaLangDouble_doubleToRawLongBitsWithDouble_(a3) withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v6;
  return self;
}

- (id)putDoubleWithInt:(int)a3 withDouble:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    unsigned int v9 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v9);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:v5 withInt:8];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeLongWithInt:(self->offset_ + v5) withLong:JavaLangDouble_doubleToRawLongBitsWithDouble_(a4) withJavaNioByteOrder:self->super.super.order_];
  return self;
}

- (id)putFloatWithFloat:(float)a3
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_8;
  }
  int position = self->super.super.super.position_;
  int v6 = position + 4;
  if (position + 4 > self->super.super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_8:
    objc_exception_throw(OnlyBufferException_init);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeIntWithInt:(self->offset_ + position) withInt:JavaLangFloat_floatToRawIntBitsWithFloat_(a3) withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v6;
  return self;
}

- (id)putFloatWithInt:(int)a3 withFloat:(float)a4
{
  uint64_t v5 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    unsigned int v9 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v9);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:v5 withInt:4];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeIntWithInt:(self->offset_ + v5) withInt:JavaLangFloat_floatToRawIntBitsWithFloat_(a4) withJavaNioByteOrder:self->super.super.order_];
  return self;
}

- (id)putIntWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_8;
  }
  int position = self->super.super.super.position_;
  int v6 = position + 4;
  if (position + 4 > self->super.super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_8:
    objc_exception_throw(OnlyBufferException_init);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeIntWithInt:(self->offset_ + position) withInt:v3 withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v6;
  return self;
}

- (id)putIntWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    unsigned int v9 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v9);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:v5 withInt:4];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeIntWithInt:(self->offset_ + v5) withInt:v4 withJavaNioByteOrder:self->super.super.order_];
  return self;
}

- (id)putLongWithLong:(int64_t)a3
{
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_8;
  }
  int position = self->super.super.super.position_;
  int v6 = position + 8;
  if (position + 8 > self->super.super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_8:
    objc_exception_throw(OnlyBufferException_init);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeLongWithInt:(self->offset_ + position) withLong:a3 withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v6;
  return self;
}

- (id)putLongWithInt:(int)a3 withLong:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    unsigned int v9 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v9);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:v5 withInt:8];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeLongWithInt:(self->offset_ + v5) withLong:a4 withJavaNioByteOrder:self->super.super.order_];
  return self;
}

- (id)putShortWithShort:(signed __int16)a3
{
  uint64_t v3 = a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_8;
  }
  int position = self->super.super.super.position_;
  int v6 = position + 2;
  if (position + 2 > self->super.super.super.limit_)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_8:
    objc_exception_throw(OnlyBufferException_init);
  }
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeShortWithInt:(self->offset_ + position) withShort:v3 withJavaNioByteOrder:self->super.super.order_];
  self->super.super.super.position_ = v6;
  return self;
}

- (id)putShortWithInt:(int)a3 withShort:(signed __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  -[JavaNioDirectByteBuffer checkNotFreed]_0((uint64_t)self);
  if (self->isReadOnly_)
  {
    unsigned int v9 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v9);
  }
  [(JavaNioBuffer *)self checkIndexWithInt:v5 withInt:2];
  block = self->super.block_;
  if (!block) {
    JreThrowNullPointerException();
  }
  [(JavaNioMemoryBlock *)block pokeShortWithInt:(self->offset_ + v5) withShort:v4 withJavaNioByteOrder:self->super.super.order_];
  return self;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004072D0;
}

@end
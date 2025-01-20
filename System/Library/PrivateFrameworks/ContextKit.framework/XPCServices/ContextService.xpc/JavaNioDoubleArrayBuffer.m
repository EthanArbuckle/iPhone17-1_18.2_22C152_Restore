@interface JavaNioDoubleArrayBuffer
+ (const)__metadata;
+ (id)copy__WithJavaNioDoubleArrayBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (BOOL)isDirect;
- (BOOL)isReadOnly;
- (BOOL)protectedHasArray;
- (JavaNioDoubleArrayBuffer)initWithDoubleArray:(id)a3;
- (JavaNioDoubleArrayBuffer)initWithInt:(int)a3 withDoubleArray:(id)a4 withInt:(int)a5 withBoolean:(BOOL)a6;
- (double)get;
- (double)getWithInt:(int)a3;
- (id)asReadOnlyBuffer;
- (id)compact;
- (id)duplicate;
- (id)getWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)protectedArray;
- (id)putWithDouble:(double)a3;
- (id)putWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)putWithInt:(int)a3 withDouble:(double)a4;
- (id)slice;
- (int)protectedArrayOffset;
- (void)dealloc;
@end

@implementation JavaNioDoubleArrayBuffer

- (JavaNioDoubleArrayBuffer)initWithDoubleArray:(id)a3
{
  JavaNioDoubleArrayBuffer_initWithDoubleArray_((uint64_t)self, (unsigned int *)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  return self;
}

- (JavaNioDoubleArrayBuffer)initWithInt:(int)a3 withDoubleArray:(id)a4 withInt:(int)a5 withBoolean:(BOOL)a6
{
  JavaNioDoubleBuffer_initWithInt_withLong_((uint64_t)self, *(uint64_t *)&a3, 0, (uint64_t)a4, *(uint64_t *)&a5, a6, v6, v7);
  JreStrongAssign((id *)&self->backingArray_, a4);
  self->arrayOffset_ = a5;
  self->isReadOnly_ = a6;
  return self;
}

+ (id)copy__WithJavaNioDoubleArrayBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return sub_1001759C0((uint64_t)a3, a4, a5);
}

- (id)asReadOnlyBuffer
{
  return sub_1001759C0((uint64_t)self, self->super.super.mark_, 1);
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
  return sub_1001759C0((uint64_t)self, self->super.super.mark_, self->isReadOnly_);
}

- (id)slice
{
  v2 = sub_100175BE8([(JavaNioBuffer *)self remaining], self->backingArray_, self->super.super.position_ + self->arrayOffset_, self->isReadOnly_);
  return v2;
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

- (double)get
{
  int position = self->super.super.position_;
  if (position == self->super.super.limit_)
  {
    v8 = new_JavaNioBufferUnderflowException_init();
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
  return backingArray->buffer_[v6];
}

- (double)getWithInt:(int)a3
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
  return backingArray->buffer_[(int)v7];
}

- (id)getWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if ([(JavaNioBuffer *)self remaining] < a5)
  {
    v10 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v10);
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->backingArray_, (self->super.super.position_ + self->arrayOffset_), a3, v6, v5);
  self->super.super.position_ += v5;
  return self;
}

- (BOOL)isDirect
{
  return 0;
}

- (id)putWithDouble:(double)a3
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
  backingArray->buffer_[v8] = a3;
  return self;
}

- (id)putWithInt:(int)a3 withDouble:(double)a4
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
  backingArray->buffer_[(int)v9] = a4;
  return self;
}

- (id)putWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (self->isReadOnly_)
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_6;
  }
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if ([(JavaNioBuffer *)self remaining] < a5)
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_6:
    objc_exception_throw(OnlyBufferException_init);
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v6, self->backingArray_, (self->super.super.position_ + self->arrayOffset_), v5);
  self->super.super.position_ += v5;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioDoubleArrayBuffer;
  [(JavaNioDoubleArrayBuffer *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100403348;
}

@end
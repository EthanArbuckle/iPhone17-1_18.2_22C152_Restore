@interface JavaNioShortArrayBuffer
+ (const)__metadata;
+ (id)copy__WithJavaNioShortArrayBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (BOOL)isDirect;
- (BOOL)isReadOnly;
- (BOOL)protectedHasArray;
- (JavaNioShortArrayBuffer)initWithInt:(int)a3 withShortArray:(id)a4 withInt:(int)a5 withBoolean:(BOOL)a6;
- (JavaNioShortArrayBuffer)initWithShortArray:(id)a3;
- (id)asReadOnlyBuffer;
- (id)compact;
- (id)duplicate;
- (id)getWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)protectedArray;
- (id)putWithInt:(int)a3 withShort:(signed __int16)a4;
- (id)putWithShort:(signed __int16)a3;
- (id)putWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)slice;
- (int)protectedArrayOffset;
- (signed)get;
- (signed)getWithInt:(int)a3;
- (void)dealloc;
@end

@implementation JavaNioShortArrayBuffer

- (JavaNioShortArrayBuffer)initWithShortArray:(id)a3
{
  JavaNioShortArrayBuffer_initWithShortArray_((uint64_t)self, (unsigned int *)a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  return self;
}

- (JavaNioShortArrayBuffer)initWithInt:(int)a3 withShortArray:(id)a4 withInt:(int)a5 withBoolean:(BOOL)a6
{
  JavaNioShortBuffer_initWithInt_withLong_((uint64_t)self, *(uint64_t *)&a3, 0, (uint64_t)a4, *(uint64_t *)&a5, a6, v6, v7);
  JreStrongAssign((id *)&self->backingArray_, a4);
  self->arrayOffset_ = a5;
  self->isReadOnly_ = a6;
  return self;
}

+ (id)copy__WithJavaNioShortArrayBuffer:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return sub_10027E3B0((uint64_t)a3, a4, a5);
}

- (id)asReadOnlyBuffer
{
  return sub_10027E3B0((uint64_t)self, self->super.super.mark_, 1);
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
  return sub_10027E3B0((uint64_t)self, self->super.super.mark_, self->isReadOnly_);
}

- (id)slice
{
  v2 = sub_10027E5D8([(JavaNioBuffer *)self remaining], self->backingArray_, self->super.super.position_ + self->arrayOffset_, self->isReadOnly_);
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

- (signed)get
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
  return *((_WORD *)&backingArray->super.size_ + v6 + 2);
}

- (signed)getWithInt:(int)a3
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
  return *((_WORD *)&backingArray->super.size_ + (int)v7 + 2);
}

- (id)getWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
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

- (id)putWithShort:(signed __int16)a3
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
  *((_WORD *)&backingArray->super.size_ + v8 + 2) = a3;
  return self;
}

- (id)putWithInt:(int)a3 withShort:(signed __int16)a4
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
  *((_WORD *)&backingArray->super.size_ + (int)v9 + 2) = a4;
  return self;
}

- (id)putWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
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
  v3.super_class = (Class)JavaNioShortArrayBuffer;
  [(JavaNioShortArrayBuffer *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047AE18;
}

@end
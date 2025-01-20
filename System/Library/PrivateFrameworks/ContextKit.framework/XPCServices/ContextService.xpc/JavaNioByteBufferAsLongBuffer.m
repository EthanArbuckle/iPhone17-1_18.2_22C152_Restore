@interface JavaNioByteBufferAsLongBuffer
+ (const)__metadata;
+ (id)asLongBufferWithJavaNioByteBuffer:(id)a3;
- (BOOL)isDirect;
- (BOOL)isReadOnly;
- (BOOL)protectedHasArray;
- (JavaNioByteBufferAsLongBuffer)initWithJavaNioByteBuffer:(id)a3;
- (id)asReadOnlyBuffer;
- (id)compact;
- (id)duplicate;
- (id)getWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)order;
- (id)protectedArray;
- (id)putWithInt:(int)a3 withLong:(int64_t)a4;
- (id)putWithLong:(int64_t)a3;
- (id)putWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)slice;
- (int)protectedArrayOffset;
- (int64_t)get;
- (int64_t)getWithInt:(int)a3;
- (void)dealloc;
@end

@implementation JavaNioByteBufferAsLongBuffer

+ (id)asLongBufferWithJavaNioByteBuffer:(id)a3
{
  return JavaNioByteBufferAsLongBuffer_asLongBufferWithJavaNioByteBuffer_(a3);
}

- (JavaNioByteBufferAsLongBuffer)initWithJavaNioByteBuffer:(id)a3
{
  return self;
}

- (id)asReadOnlyBuffer
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  v4 = [(JavaNioByteBuffer *)byteBuffer asReadOnlyBuffer];
  v5 = [JavaNioByteBufferAsLongBuffer alloc];
  sub_1002747D4((uint64_t)v5, v4);
  v6 = v5;
  v6->super.super.limit_ = self->super.super.limit_;
  v6->super.super.position_ = self->super.super.position_;
  v6->super.super.mark_ = self->super.super.mark_;
  JreStrongAssign((id *)&v6->byteBuffer_->order_, self->byteBuffer_->order_);
  return v6;
}

- (id)compact
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  if ([(JavaNioBuffer *)byteBuffer isReadOnly])
  {
    v5 = new_JavaNioReadOnlyBufferException_init();
    objc_exception_throw(v5);
  }
  [(JavaNioBuffer *)self->byteBuffer_ limitWithInt:(8 * self->super.super.limit_)];
  [(JavaNioBuffer *)self->byteBuffer_ positionWithInt:(8 * self->super.super.position_)];
  [(JavaNioByteBuffer *)self->byteBuffer_ compact];
  [(JavaNioBuffer *)self->byteBuffer_ clear];
  self->super.super.position_ = self->super.super.limit_ - self->super.super.position_;
  self->super.super.limit_ = self->super.super.capacity_;
  self->super.super.mark_ = -1;
  return self;
}

- (id)duplicate
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer || (id v4 = [(JavaNioByteBuffer *)byteBuffer duplicate]) == 0) {
    JreThrowNullPointerException();
  }
  v5 = (uint64_t *)objc_msgSend(v4, "orderWithJavaNioByteOrder:", -[JavaNioByteBuffer order](self->byteBuffer_, "order"));
  v6 = [JavaNioByteBufferAsLongBuffer alloc];
  sub_1002747D4((uint64_t)v6, v5);
  id result = v6;
  *((_DWORD *)result + 3) = self->super.super.limit_;
  *((_DWORD *)result + 5) = self->super.super.position_;
  *((_DWORD *)result + 4) = self->super.super.mark_;
  return result;
}

- (int64_t)get
{
  int position = self->super.super.position_;
  if (position == self->super.super.limit_)
  {
    v5 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v5);
  }
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  self->super.super.position_ = position + 1;
  return [(JavaNioByteBuffer *)byteBuffer getLongWithInt:(8 * position)];
}

- (int64_t)getWithInt:(int)a3
{
  -[JavaNioBuffer checkIndexWithInt:](self, "checkIndexWithInt:");
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)byteBuffer getLongWithInt:(8 * a3)];
}

- (id)getWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  [(JavaNioBuffer *)byteBuffer limitWithInt:(8 * self->super.super.limit_)];
  [(JavaNioBuffer *)self->byteBuffer_ positionWithInt:(8 * self->super.super.position_)];
  objc_opt_class();
  objc_opt_isKindOfClass();
  v10 = self->byteBuffer_;
  objc_opt_class();
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  [(JavaNioByteBuffer *)v10 getWithLongArray:a3 withInt:v8 withInt:v7];
  self->super.super.position_ += v7;
  return self;
}

- (BOOL)isDirect
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)byteBuffer isDirect];
}

- (BOOL)isReadOnly
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  return [(JavaNioBuffer *)byteBuffer isReadOnly];
}

- (id)order
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)byteBuffer order];
}

- (id)protectedArray
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int)protectedArrayOffset
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (BOOL)protectedHasArray
{
  return 0;
}

- (id)putWithLong:(int64_t)a3
{
  int position = self->super.super.position_;
  if (position == self->super.super.limit_)
  {
    uint64_t v7 = new_JavaNioBufferOverflowException_init();
    objc_exception_throw(v7);
  }
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  self->super.super.position_ = position + 1;
  [(JavaNioByteBuffer *)byteBuffer putLongWithInt:(8 * position) withLong:a3];
  return self;
}

- (id)putWithInt:(int)a3 withLong:(int64_t)a4
{
  -[JavaNioBuffer checkIndexWithInt:](self, "checkIndexWithInt:");
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  [(JavaNioByteBuffer *)byteBuffer putLongWithInt:(8 * a3) withLong:a4];
  return self;
}

- (id)putWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  [(JavaNioBuffer *)byteBuffer limitWithInt:(8 * self->super.super.limit_)];
  [(JavaNioBuffer *)self->byteBuffer_ positionWithInt:(8 * self->super.super.position_)];
  objc_opt_class();
  objc_opt_isKindOfClass();
  v10 = self->byteBuffer_;
  objc_opt_class();
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  [(JavaNioByteBuffer *)v10 putWithLongArray:a3 withInt:v8 withInt:v7];
  self->super.super.position_ += v7;
  return self;
}

- (id)slice
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer
    || ([(JavaNioBuffer *)byteBuffer limitWithInt:(8 * self->super.super.limit_)],
        [(JavaNioBuffer *)self->byteBuffer_ positionWithInt:(8 * self->super.super.position_)], (id v4 = [(JavaNioByteBuffer *)self->byteBuffer_ slice]) == 0))
  {
    JreThrowNullPointerException();
  }
  v5 = (uint64_t *)objc_msgSend(v4, "orderWithJavaNioByteOrder:", -[JavaNioByteBuffer order](self->byteBuffer_, "order"));
  v6 = [JavaNioByteBufferAsLongBuffer alloc];
  sub_1002747D4((uint64_t)v6, v5);
  uint64_t v7 = v6;
  [(JavaNioBuffer *)self->byteBuffer_ clear];
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioByteBufferAsLongBuffer;
  [(JavaNioByteBufferAsLongBuffer *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100476FB8;
}

@end
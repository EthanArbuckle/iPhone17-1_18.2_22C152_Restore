@interface JavaNioByteBufferAsShortBuffer
+ (const)__metadata;
+ (id)asShortBufferWithJavaNioByteBuffer:(id)a3;
- (BOOL)isDirect;
- (BOOL)isReadOnly;
- (BOOL)protectedHasArray;
- (JavaNioByteBufferAsShortBuffer)initWithJavaNioByteBuffer:(id)a3;
- (id)asReadOnlyBuffer;
- (id)compact;
- (id)duplicate;
- (id)getWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)order;
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

@implementation JavaNioByteBufferAsShortBuffer

+ (id)asShortBufferWithJavaNioByteBuffer:(id)a3
{
  return JavaNioByteBufferAsShortBuffer_asShortBufferWithJavaNioByteBuffer_(a3);
}

- (JavaNioByteBufferAsShortBuffer)initWithJavaNioByteBuffer:(id)a3
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
  v5 = [JavaNioByteBufferAsShortBuffer alloc];
  sub_10027DA04((uint64_t)v5, v4);
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
  [(JavaNioBuffer *)self->byteBuffer_ limitWithInt:(2 * self->super.super.limit_)];
  [(JavaNioBuffer *)self->byteBuffer_ positionWithInt:(2 * self->super.super.position_)];
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
  v6 = [JavaNioByteBufferAsShortBuffer alloc];
  sub_10027DA04((uint64_t)v6, v5);
  id result = v6;
  *((_DWORD *)result + 3) = self->super.super.limit_;
  *((_DWORD *)result + 5) = self->super.super.position_;
  *((_DWORD *)result + 4) = self->super.super.mark_;
  return result;
}

- (signed)get
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
  return [(JavaNioByteBuffer *)byteBuffer getShortWithInt:(2 * position)];
}

- (signed)getWithInt:(int)a3
{
  -[JavaNioBuffer checkIndexWithInt:](self, "checkIndexWithInt:");
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  return [(JavaNioByteBuffer *)byteBuffer getShortWithInt:(2 * a3)];
}

- (id)getWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  [(JavaNioBuffer *)byteBuffer limitWithInt:(2 * self->super.super.limit_)];
  [(JavaNioBuffer *)self->byteBuffer_ positionWithInt:(2 * self->super.super.position_)];
  objc_opt_class();
  objc_opt_isKindOfClass();
  v10 = self->byteBuffer_;
  objc_opt_class();
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  [(JavaNioByteBuffer *)v10 getWithShortArray:a3 withInt:v8 withInt:v7];
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

- (id)putWithShort:(signed __int16)a3
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
  [(JavaNioByteBuffer *)byteBuffer putShortWithInt:(2 * position) withShort:a3];
  return self;
}

- (id)putWithInt:(int)a3 withShort:(signed __int16)a4
{
  uint64_t v4 = a4;
  -[JavaNioBuffer checkIndexWithInt:](self, "checkIndexWithInt:");
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  [(JavaNioByteBuffer *)byteBuffer putShortWithInt:(2 * a3) withShort:v4];
  return self;
}

- (id)putWithShortArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer) {
    JreThrowNullPointerException();
  }
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  [(JavaNioBuffer *)byteBuffer limitWithInt:(2 * self->super.super.limit_)];
  [(JavaNioBuffer *)self->byteBuffer_ positionWithInt:(2 * self->super.super.position_)];
  objc_opt_class();
  objc_opt_isKindOfClass();
  v10 = self->byteBuffer_;
  objc_opt_class();
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  [(JavaNioByteBuffer *)v10 putWithShortArray:a3 withInt:v8 withInt:v7];
  self->super.super.position_ += v7;
  return self;
}

- (id)slice
{
  byteBuffer = self->byteBuffer_;
  if (!byteBuffer
    || ([(JavaNioBuffer *)byteBuffer limitWithInt:(2 * self->super.super.limit_)],
        [(JavaNioBuffer *)self->byteBuffer_ positionWithInt:(2 * self->super.super.position_)], (id v4 = [(JavaNioByteBuffer *)self->byteBuffer_ slice]) == 0))
  {
    JreThrowNullPointerException();
  }
  v5 = (uint64_t *)objc_msgSend(v4, "orderWithJavaNioByteOrder:", -[JavaNioByteBuffer order](self->byteBuffer_, "order"));
  v6 = [JavaNioByteBufferAsShortBuffer alloc];
  sub_10027DA04((uint64_t)v6, v5);
  uint64_t v7 = v6;
  [(JavaNioBuffer *)self->byteBuffer_ clear];
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioByteBufferAsShortBuffer;
  [(JavaNioByteBufferAsShortBuffer *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047A970;
}

@end
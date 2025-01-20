@interface JavaNioCharsetIOSCharsetEncoder
+ (const)__metadata;
+ (id)encodeWithCharArray:(id)a3 withLong:(int64_t)a4;
- (JavaNioCharsetIOSCharsetEncoder)initWithJavaNioCharsetCharset:(id)a3 withFloat:(float)a4;
- (id)encodeImplWithJavaNioCharBuffer:(id)a3;
- (id)encodeLoopWithJavaNioCharBuffer:(id)a3 withJavaNioByteBuffer:(id)a4;
- (id)encodeWithJavaNioCharBuffer:(id)a3;
- (void)dealloc;
@end

@implementation JavaNioCharsetIOSCharsetEncoder

- (JavaNioCharsetIOSCharsetEncoder)initWithJavaNioCharsetCharset:(id)a3 withFloat:(float)a4
{
  char v6 = 63;
  JavaNioCharsetCharsetEncoder_initWithJavaNioCharsetCharset_withFloat_withFloat_withByteArray_((uint64_t)self, a3, +[IOSByteArray arrayWithBytes:&v6 count:1], a4, a4);
  return self;
}

- (id)encodeWithJavaNioCharBuffer:(id)a3
{
  v3 = sub_1001B7944((id *)&self->super.super.isa, a3);
  return JavaNioByteBuffer_wrapWithByteArray_(v3);
}

- (id)encodeLoopWithJavaNioCharBuffer:(id)a3 withJavaNioByteBuffer:(id)a4
{
  p_byteBuffer = &self->byteBuffer_;
  if (self->byteBuffer_)
  {
    if (a4)
    {
      if (objc_msgSend(a4, "hasRemaining", a3))
      {
        while (1)
        {
          uint64_t outIndex = self->outIndex_;
          v8 = *p_byteBuffer;
          int size = (*p_byteBuffer)->super.size_;
          if ((int)outIndex >= size) {
            break;
          }
          self->outIndex_ = outIndex + 1;
          uint64_t v10 = v8->super.size_;
          if ((outIndex & 0x80000000) != 0 || (int)outIndex >= (int)v10) {
            IOSArray_throwOutOfBoundsWithMsg(v10, outIndex);
          }
          [a4 putWithByte:*((char *)&v8->super.size_ + (int)outIndex + 4)];
          if (([a4 hasRemaining] & 1) == 0) {
            goto LABEL_10;
          }
        }
      }
      else
      {
LABEL_10:
        LODWORD(outIndex) = self->outIndex_;
        int size = (*p_byteBuffer)->super.size_;
      }
      if (outIndex != size)
      {
        if ((atomic_load_explicit(JavaNioCharsetCoderResult__initialized, memory_order_acquire) & 1) == 0) {
          objc_opt_class();
        }
        v15 = &JavaNioCharsetCoderResult_OVERFLOW__;
        return (id)*v15;
      }
      JreStrongAssign((id *)p_byteBuffer, 0);
LABEL_26:
      if ((atomic_load_explicit(JavaNioCharsetCoderResult__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      v15 = &JavaNioCharsetCoderResult_UNDERFLOW__;
      return (id)*v15;
    }
    goto LABEL_30;
  }
  if (!a3) {
    goto LABEL_30;
  }
  if (![a3 hasRemaining]) {
    goto LABEL_26;
  }
  v12 = sub_1001B7944((id *)&self->super.super.isa, a3);
  if (!v12) {
    goto LABEL_30;
  }
  v13 = v12;
  if (!v12->super.size_) {
    goto LABEL_26;
  }
  if (!a4) {
LABEL_30:
  }
    JreThrowNullPointerException();
  if ((int)[a4 remaining] >= v12->super.size_)
  {
    [a4 putWithByteArray:v13];
    goto LABEL_26;
  }
  JreStrongAssign((id *)p_byteBuffer, v13);
  self->outIndex_ = 0;
  return [(JavaNioCharsetIOSCharsetEncoder *)self encodeLoopWithJavaNioCharBuffer:a3 withJavaNioByteBuffer:a4];
}

- (id)encodeImplWithJavaNioCharBuffer:(id)a3
{
  return sub_1001B7944((id *)&self->super.super.isa, a3);
}

+ (id)encodeWithCharArray:(id)a3 withLong:(int64_t)a4
{
  return sub_1001B7DB0((uint64_t)a3, a4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioCharsetIOSCharsetEncoder;
  [(JavaNioCharsetCharsetEncoder *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041C6A8;
}

@end
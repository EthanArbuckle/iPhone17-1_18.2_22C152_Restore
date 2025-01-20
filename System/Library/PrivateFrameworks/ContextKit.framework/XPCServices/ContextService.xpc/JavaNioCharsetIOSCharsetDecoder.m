@interface JavaNioCharsetIOSCharsetDecoder
+ (const)__metadata;
+ (id)decodeWithByteArray:(id)a3 withLong:(int64_t)a4;
- (JavaNioCharsetIOSCharsetDecoder)initWithJavaNioCharsetCharset:(id)a3;
- (id)decodeImplWithJavaNioByteBuffer:(id)a3;
- (id)decodeLoopWithJavaNioByteBuffer:(id)a3 withJavaNioCharBuffer:(id)a4;
- (id)decodeWithJavaNioByteBuffer:(id)a3;
- (int)available;
- (void)dealloc;
@end

@implementation JavaNioCharsetIOSCharsetDecoder

- (JavaNioCharsetIOSCharsetDecoder)initWithJavaNioCharsetCharset:(id)a3
{
  return self;
}

- (id)decodeLoopWithJavaNioByteBuffer:(id)a3 withJavaNioCharBuffer:(id)a4
{
  v6 = (id *)((char *)&self->inBuffer_ + 4);
  if (*(IOSByteArray **)((char *)&self->inBuffer_ + 4))
  {
    if (a4)
    {
      if (objc_msgSend(a4, "hasRemaining", a3))
      {
        while (1)
        {
          uint64_t charBuffer_high = HIDWORD(self->charBuffer_);
          v8 = (unsigned int *)*v6;
          int v9 = *((_DWORD *)*v6 + 2);
          if ((int)charBuffer_high >= v9) {
            break;
          }
          HIDWORD(self->charBuffer_) = charBuffer_high + 1;
          uint64_t v10 = v8[2];
          if ((charBuffer_high & 0x80000000) != 0 || (int)charBuffer_high >= (int)v10) {
            IOSArray_throwOutOfBoundsWithMsg(v10, charBuffer_high);
          }
          [a4 putWithChar:*((unsigned __int16 *)v8 + (int)charBuffer_high + 6)];
          if (([a4 hasRemaining] & 1) == 0) {
            goto LABEL_10;
          }
        }
      }
      else
      {
LABEL_10:
        LODWORD(charBuffer_high) = HIDWORD(self->charBuffer_);
        int v9 = *((_DWORD *)*v6 + 2);
      }
      if (charBuffer_high == v9) {
        JreStrongAssign(v6, 0);
      }
      goto LABEL_23;
    }
LABEL_26:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_26;
  }
  if (![a3 hasRemaining]) {
    goto LABEL_23;
  }
  v12 = sub_100250CF8((uint64_t)self, a3);
  if (!v12) {
    goto LABEL_26;
  }
  v13 = v12;
  if ([(__CFString *)v12 isEmpty])
  {
LABEL_23:
    if ((atomic_load_explicit(JavaNioCharsetCoderResult__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    return (id)JavaNioCharsetCoderResult_UNDERFLOW__;
  }
  if (!a4) {
    goto LABEL_26;
  }
  int v14 = [a4 remaining];
  if (v14 >= (int)[(__CFString *)v13 length])
  {
    [a4 putWithNSString:v13];
    goto LABEL_23;
  }
  JreStrongAssign(v6, [(__CFString *)v13 toCharArray]);
  HIDWORD(self->charBuffer_) = 0;
  return [(JavaNioCharsetIOSCharsetDecoder *)self decodeLoopWithJavaNioByteBuffer:a3 withJavaNioCharBuffer:a4];
}

- (id)decodeWithJavaNioByteBuffer:(id)a3
{
  v3 = sub_100250CF8((uint64_t)self, a3);
  return JavaNioCharBuffer_wrapWithJavaLangCharSequence_(v3);
}

- (id)decodeImplWithJavaNioByteBuffer:(id)a3
{
  return sub_100250CF8((uint64_t)self, a3);
}

+ (id)decodeWithByteArray:(id)a3 withLong:(int64_t)a4
{
  return (id)sub_100250EE0((uint64_t)a3, a4);
}

- (int)available
{
  uint64_t v2 = *(uint64_t *)((char *)&self->inBuffer_ + 4);
  if (v2) {
    return *(_DWORD *)(v2 + 8) - HIDWORD(self->charBuffer_);
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioCharsetIOSCharsetDecoder;
  [(JavaNioCharsetCharsetDecoder *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004659C8;
}

@end
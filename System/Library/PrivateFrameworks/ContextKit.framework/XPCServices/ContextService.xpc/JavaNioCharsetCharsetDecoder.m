@interface JavaNioCharsetCharsetDecoder
+ (const)__metadata;
- (BOOL)isAutoDetecting;
- (BOOL)isCharsetDetected;
- (JavaNioCharsetCharsetDecoder)initWithJavaNioCharsetCharset:(id)a3 withFloat:(float)a4 withFloat:(float)a5;
- (float)averageCharsPerByte;
- (float)maxCharsPerByte;
- (id)charset;
- (id)decodeLoopWithJavaNioByteBuffer:(id)a3 withJavaNioCharBuffer:(id)a4;
- (id)decodeWithJavaNioByteBuffer:(id)a3;
- (id)decodeWithJavaNioByteBuffer:(id)a3 withJavaNioCharBuffer:(id)a4 withBoolean:(BOOL)a5;
- (id)detectedCharset;
- (id)flushWithJavaNioCharBuffer:(id)a3;
- (id)replaceWithWithNSString:(id)a3;
- (id)replacement;
- (void)dealloc;
@end

@implementation JavaNioCharsetCharsetDecoder

- (JavaNioCharsetCharsetDecoder)initWithJavaNioCharsetCharset:(id)a3 withFloat:(float)a4 withFloat:(float)a5
{
  return self;
}

- (float)averageCharsPerByte
{
  return self->averageCharsPerByte_;
}

- (id)charset
{
  return self->cs_;
}

- (id)decodeWithJavaNioByteBuffer:(id)a3
{
  return 0;
}

- (id)decodeWithJavaNioByteBuffer:(id)a3 withJavaNioCharBuffer:(id)a4 withBoolean:(BOOL)a5
{
  return -[JavaNioCharsetCharsetDecoder decodeLoopWithJavaNioByteBuffer:withJavaNioCharBuffer:](self, "decodeLoopWithJavaNioByteBuffer:withJavaNioCharBuffer:", a3, a4, a5);
}

- (id)decodeLoopWithJavaNioByteBuffer:(id)a3 withJavaNioCharBuffer:(id)a4
{
  return 0;
}

- (id)detectedCharset
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (id)flushWithJavaNioCharBuffer:(id)a3
{
  if ((atomic_load_explicit(JavaNioCharsetCoderResult__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaNioCharsetCoderResult_UNDERFLOW__;
}

- (BOOL)isAutoDetecting
{
  return 0;
}

- (BOOL)isCharsetDetected
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (float)maxCharsPerByte
{
  return self->maxCharsPerByte_;
}

- (id)replacement
{
  return self->replacementChars_;
}

- (id)replaceWithWithNSString:(id)a3
{
  if (!a3)
  {
    CFStringRef v6 = @"replacement == null";
    goto LABEL_6;
  }
  if ([a3 isEmpty])
  {
    CFStringRef v6 = @"replacement.isEmpty()";
LABEL_6:
    v7 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v6);
    objc_exception_throw(v7);
  }
  JreStrongAssign((id *)&self->replacementChars_, a3);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioCharsetCharsetDecoder;
  [(JavaNioCharsetCharsetDecoder *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10048B770;
}

@end
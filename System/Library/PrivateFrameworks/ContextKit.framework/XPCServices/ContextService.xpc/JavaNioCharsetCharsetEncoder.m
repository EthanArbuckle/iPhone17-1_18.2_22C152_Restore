@interface JavaNioCharsetCharsetEncoder
+ (const)__metadata;
- (BOOL)canEncodeWithChar:(unsigned __int16)a3;
- (BOOL)canEncodeWithJavaLangCharSequence:(id)a3;
- (BOOL)implCanEncodeWithJavaNioCharBuffer:(id)a3;
- (JavaNioCharsetCharsetEncoder)initWithJavaNioCharsetCharset:(id)a3 withFloat:(float)a4 withFloat:(float)a5;
- (JavaNioCharsetCharsetEncoder)initWithJavaNioCharsetCharset:(id)a3 withFloat:(float)a4 withFloat:(float)a5 withByteArray:(id)a6;
- (float)averageBytesPerChar;
- (float)maxBytesPerChar;
- (id)charset;
- (id)encodeLoopWithJavaNioCharBuffer:(id)a3 withJavaNioByteBuffer:(id)a4;
- (id)encodeWithJavaNioCharBuffer:(id)a3;
- (id)encodeWithJavaNioCharBuffer:(id)a3 withJavaNioByteBuffer:(id)a4 withBoolean:(BOOL)a5;
- (id)flushWithJavaNioByteBuffer:(id)a3;
- (id)malformedInputAction;
- (id)onMalformedInputWithJavaNioCharsetCodingErrorAction:(id)a3;
- (id)onUnmappableCharacterWithJavaNioCharsetCodingErrorAction:(id)a3;
- (id)replaceWithWithByteArray:(id)a3;
- (id)replacement;
- (id)unmappableCharacterAction;
- (void)dealloc;
@end

@implementation JavaNioCharsetCharsetEncoder

- (JavaNioCharsetCharsetEncoder)initWithJavaNioCharsetCharset:(id)a3 withFloat:(float)a4 withFloat:(float)a5
{
  char v7 = 63;
  JavaNioCharsetCharsetEncoder_initWithJavaNioCharsetCharset_withFloat_withFloat_withByteArray_((uint64_t)self, a3, +[IOSByteArray arrayWithBytes:&v7 count:1], a4, a5);
  return self;
}

- (JavaNioCharsetCharsetEncoder)initWithJavaNioCharsetCharset:(id)a3 withFloat:(float)a4 withFloat:(float)a5 withByteArray:(id)a6
{
  return self;
}

- (float)averageBytesPerChar
{
  return self->averageBytesPerChar_;
}

- (BOOL)canEncodeWithChar:(unsigned __int16)a3
{
  unsigned __int16 v6 = a3;
  v4 = JavaNioCharBuffer_wrapWithCharArray_((unsigned int *)+[IOSCharArray arrayWithChars:&v6 count:1]);
  return sub_100190D6C((uint64_t)self, (uint64_t)v4);
}

- (BOOL)implCanEncodeWithJavaNioCharBuffer:(id)a3
{
  return sub_100190D6C((uint64_t)self, (uint64_t)a3);
}

- (BOOL)canEncodeWithJavaLangCharSequence:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    v5 = (JavaNioCharSequenceAdapter *)[a3 duplicate];
  }
  else
  {
    v5 = JavaNioCharBuffer_wrapWithJavaLangCharSequence_(a3);
  }
  return sub_100190D6C((uint64_t)self, (uint64_t)v5);
}

- (id)charset
{
  return self->cs_;
}

- (id)encodeWithJavaNioCharBuffer:(id)a3
{
  return 0;
}

- (id)encodeWithJavaNioCharBuffer:(id)a3 withJavaNioByteBuffer:(id)a4 withBoolean:(BOOL)a5
{
  return -[JavaNioCharsetCharsetEncoder encodeLoopWithJavaNioCharBuffer:withJavaNioByteBuffer:](self, "encodeLoopWithJavaNioCharBuffer:withJavaNioByteBuffer:", a3, a4, a5);
}

- (id)encodeLoopWithJavaNioCharBuffer:(id)a3 withJavaNioByteBuffer:(id)a4
{
  return 0;
}

- (id)flushWithJavaNioByteBuffer:(id)a3
{
  if ((atomic_load_explicit(JavaNioCharsetCoderResult__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)JavaNioCharsetCoderResult_UNDERFLOW__;
}

- (id)malformedInputAction
{
  return self->malformedInputAction_;
}

- (float)maxBytesPerChar
{
  return self->maxBytesPerChar_;
}

- (id)onMalformedInputWithJavaNioCharsetCodingErrorAction:(id)a3
{
  return (id)sub_100191024((uint64_t)self, a3);
}

- (id)onUnmappableCharacterWithJavaNioCharsetCodingErrorAction:(id)a3
{
  return (id)sub_100191070((uint64_t)self, a3);
}

- (id)replacement
{
  return self->replacementBytes_;
}

- (id)replaceWithWithByteArray:(id)a3
{
  if (!a3)
  {
    CFStringRef v11 = @"replacement == null";
    goto LABEL_8;
  }
  int v8 = *((_DWORD *)a3 + 2);
  if (!v8)
  {
    CFStringRef v11 = @"replacement.length == 0";
    goto LABEL_8;
  }
  if (self->maxBytesPerChar_ < (float)v8)
  {
    CFStringRef v11 = JreStrcat("$I$F", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, @"replacement.length > maxBytesPerChar: ");
LABEL_8:
    v12 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v11);
    objc_exception_throw(v12);
  }
  JreStrongAssign((id *)&self->replacementBytes_, a3);
  return self;
}

- (id)unmappableCharacterAction
{
  return self->unmappableCharacterAction_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioCharsetCharsetEncoder;
  [(JavaNioCharsetCharsetEncoder *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040F5B8;
}

@end
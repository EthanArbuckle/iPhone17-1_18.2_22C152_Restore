@interface JavaIoOutputStreamWriter
+ (const)__metadata;
- (BOOL)checkError;
- (JavaIoOutputStreamWriter)initWithJavaIoOutputStream:(id)a3;
- (JavaIoOutputStreamWriter)initWithJavaIoOutputStream:(id)a3 withJavaNioCharsetCharset:(id)a4;
- (JavaIoOutputStreamWriter)initWithJavaIoOutputStream:(id)a3 withJavaNioCharsetCharsetEncoder:(id)a4;
- (JavaIoOutputStreamWriter)initWithJavaIoOutputStream:(id)a3 withNSString:(id)a4;
- (id)drainEncoder;
- (id)getEncoding;
- (void)close;
- (void)convertWithJavaNioCharBuffer:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)flushBytesWithBoolean:(BOOL)a3;
- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaIoOutputStreamWriter

- (JavaIoOutputStreamWriter)initWithJavaIoOutputStream:(id)a3
{
  v5 = (void *)JavaNioCharsetCharset_defaultCharset();
  JavaIoOutputStreamWriter_initWithJavaIoOutputStream_withJavaNioCharsetCharset_((id *)&self->super.super.isa, a3, v5);
  return self;
}

- (JavaIoOutputStreamWriter)initWithJavaIoOutputStream:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaIoOutputStreamWriter)initWithJavaIoOutputStream:(id)a3 withJavaNioCharsetCharset:(id)a4
{
  return self;
}

- (JavaIoOutputStreamWriter)initWithJavaIoOutputStream:(id)a3 withJavaNioCharsetCharsetEncoder:(id)a4
{
  return self;
}

- (void)close
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  if (self->encoder_)
  {
    [(JavaIoOutputStreamWriter *)(uint64_t)self drainEncoder];
    sub_100290EE0((uint64_t)self, 0);
    out = self->out_;
    if (!out) {
      JreThrowNullPointerException();
    }
    [(JavaIoOutputStream *)out close];
    JreStrongAssign((id *)&self->encoder_, 0);
    JreStrongAssign((id *)&self->bytes_, 0);
  }
  objc_sync_exit(lock);
}

- (id)drainEncoder
{
  uint64_t v9 = JavaNioCharBuffer_allocateWithInt_(0, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v10 = *(void **)(a1 + 24);
  if (!v10) {
    goto LABEL_16;
  }
  while (1)
  {
    id v11 = [v10 encodeWithJavaNioCharBuffer:v9 withJavaNioByteBuffer:*(void *)(a1 + 32) withBoolean:1];
    if (!v11) {
      goto LABEL_16;
    }
    v12 = v11;
    if ([v11 isError]) {
      break;
    }
    if (![v12 isOverflow]) {
      goto LABEL_8;
    }
    sub_100290EE0(a1, 0);
    uint64_t v10 = *(void **)(a1 + 24);
    if (!v10) {
      goto LABEL_16;
    }
  }
  [v12 throwException];
LABEL_8:
  v13 = *(void **)(a1 + 24);
  if (!v13 || (id v14 = [v13 flushWithJavaNioByteBuffer:*(void *)(a1 + 32)]) == 0) {
LABEL_16:
  }
    JreThrowNullPointerException();
  id v15 = v14;
  while (1)
  {
    id result = [v15 isUnderflow];
    if (result) {
      return result;
    }
    if ([v15 isOverflow])
    {
      sub_100290EE0(a1, 0);
      id v15 = [*(id *)(a1 + 24) flushWithJavaNioByteBuffer:*(void *)(a1 + 32)];
    }
    else
    {
      [v15 throwException];
    }
    if (!v15) {
      goto LABEL_16;
    }
  }
}

- (void)flush
{
}

- (void)flushBytesWithBoolean:(BOOL)a3
{
}

- (void)convertWithJavaNioCharBuffer:(id)a3
{
}

- (id)getEncoding
{
  id result = self->encoder_;
  if (result)
  {
    id v3 = [result charset];
    if (!v3) {
      JreThrowNullPointerException();
    }
    return [v3 name];
  }
  return result;
}

- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  sub_1002910D8((uint64_t)self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  uint64_t v10 = JavaNioCharBuffer_wrapWithCharArray_withInt_withInt_((unsigned int *)a3, a4, a5);
  sub_100291014((uint64_t)self, (uint64_t)v10);
  objc_sync_exit(lock);
}

- (void)writeWithInt:(int)a3
{
  __int16 v3 = a3;
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  sub_1002910D8((uint64_t)self);
  __int16 v7 = v3;
  uint64_t v6 = JavaNioCharBuffer_wrapWithCharArray_((unsigned int *)+[IOSCharArray arrayWithChars:&v7 count:1]);
  sub_100291014((uint64_t)self, (uint64_t)v6);
  objc_sync_exit(lock);
}

- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  if (a5 < 0) {
    goto LABEL_8;
  }
  if (!a3)
  {
    id v11 = new_JavaLangNullPointerException_initWithNSString_(@"str == null");
LABEL_10:
    objc_exception_throw(v11);
  }
  if ((a5 | a4) < 0 || (int)([a3 length] - a5) < a4)
  {
LABEL_8:
    id v11 = new_JavaLangStringIndexOutOfBoundsException_initWithNSString_withInt_withInt_(a3);
    goto LABEL_10;
  }
  sub_1002910D8((uint64_t)self);
  uint64_t v10 = JavaNioCharBuffer_wrapWithJavaLangCharSequence_withInt_withInt_(a3, a4, a5 + a4);
  sub_100291014((uint64_t)self, (uint64_t)v10);
  objc_sync_exit(lock);
}

- (BOOL)checkError
{
  out = self->out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  return [(JavaIoOutputStream *)out checkError];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoOutputStreamWriter;
  [(JavaIoWriter *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100483530;
}

@end
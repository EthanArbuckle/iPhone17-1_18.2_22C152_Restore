@interface JavaIoPrintStream
+ (const)__metadata;
- (BOOL)checkError;
- (JavaIoPrintStream)initWithJavaIoFile:(id)a3;
- (JavaIoPrintStream)initWithJavaIoFile:(id)a3 withNSString:(id)a4;
- (JavaIoPrintStream)initWithJavaIoOutputStream:(id)a3;
- (JavaIoPrintStream)initWithJavaIoOutputStream:(id)a3 withBoolean:(BOOL)a4;
- (JavaIoPrintStream)initWithJavaIoOutputStream:(id)a3 withBoolean:(BOOL)a4 withNSString:(id)a5;
- (JavaIoPrintStream)initWithNSString:(id)a3;
- (JavaIoPrintStream)initWithNSString:(id)a3 withNSString:(id)a4;
- (id)appendWithChar:(unsigned __int16)a3;
- (id)appendWithJavaLangCharSequence:(id)a3;
- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)formatWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5;
- (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4;
- (id)printfWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5;
- (void)clearError;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)newline;
- (void)printWithBoolean:(BOOL)a3;
- (void)printWithChar:(unsigned __int16)a3;
- (void)printWithCharArray:(id)a3;
- (void)printWithDouble:(double)a3;
- (void)printWithFloat:(float)a3;
- (void)printWithId:(id)a3;
- (void)printWithInt:(int)a3;
- (void)printWithLong:(int64_t)a3;
- (void)printWithNSString:(id)a3;
- (void)println;
- (void)printlnWithBoolean:(BOOL)a3;
- (void)printlnWithChar:(unsigned __int16)a3;
- (void)printlnWithCharArray:(id)a3;
- (void)printlnWithDouble:(double)a3;
- (void)printlnWithFloat:(float)a3;
- (void)printlnWithId:(id)a3;
- (void)printlnWithInt:(int)a3;
- (void)printlnWithLong:(int64_t)a3;
- (void)printlnWithNSString:(id)a3;
- (void)setError;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaIoPrintStream

- (JavaIoPrintStream)initWithJavaIoOutputStream:(id)a3
{
  return self;
}

- (JavaIoPrintStream)initWithJavaIoOutputStream:(id)a3 withBoolean:(BOOL)a4
{
  return self;
}

- (JavaIoPrintStream)initWithJavaIoOutputStream:(id)a3 withBoolean:(BOOL)a4 withNSString:(id)a5
{
  return self;
}

- (JavaIoPrintStream)initWithJavaIoFile:(id)a3
{
  v4 = new_JavaIoFileOutputStream_initWithJavaIoFile_(a3);
  JavaIoFilterOutputStream_initWithJavaIoOutputStream_((uint64_t)self, v4);
  return self;
}

- (JavaIoPrintStream)initWithJavaIoFile:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaIoPrintStream)initWithNSString:(id)a3
{
  return self;
}

- (JavaIoPrintStream)initWithNSString:(id)a3 withNSString:(id)a4
{
  v6 = new_JavaIoFile_initWithNSString_(a3);
  JavaIoPrintStream_initWithJavaIoFile_withNSString_((uint64_t)self, v6, (__CFString *)a4);
  return self;
}

- (BOOL)checkError
{
  out = self->super.out_;
  if (!out) {
    return self->ioError_;
  }
  [(JavaIoPrintStream *)self flush];
  if (self->ioError_) {
    return 1;
  }
  return [(JavaIoOutputStream *)out checkError];
}

- (void)clearError
{
  self->ioError_ = 0;
}

- (void)close
{
  objc_sync_enter(self);
  [(JavaIoPrintStream *)self flush];
  out = self->super.out_;
  if (out)
  {
    [(JavaIoOutputStream *)out close];
    JreStrongAssign((id *)&self->super.out_, 0);
  }
  objc_sync_exit(self);
}

- (void)flush
{
  objc_sync_enter(self);
  out = self->super.out_;
  if (out) {
    [(JavaIoOutputStream *)out flush];
  }
  else {
    [(JavaIoPrintStream *)self setError];
  }
  objc_sync_exit(self);
}

- (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4
{
  uint64_t Default = JavaUtilLocale_getDefault();
  return [(JavaIoPrintStream *)self formatWithJavaUtilLocale:Default withNSString:a3 withNSObjectArray:a4];
}

- (id)formatWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5
{
  if (!a4)
  {
    v7 = new_JavaLangNullPointerException_initWithNSString_(@"format == null");
    objc_exception_throw(v7);
  }
  [new_JavaUtilFormatter_initWithJavaLangAppendable_withJavaUtilLocale_(self, a3) formatWithNSString:a4 withNSObjectArray:a5];
  return self;
}

- (id)printfWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5
{
  return [(JavaIoPrintStream *)self formatWithJavaUtilLocale:a3 withNSString:a4 withNSObjectArray:a5];
}

- (void)newline
{
  CFStringRef v3 = JavaLangSystem_lineSeparator();
  [(JavaIoPrintStream *)self printWithNSString:v3];
}

- (void)printWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  v4 = +[NSString stringWithCharacters:a3 offset:0 length:*((unsigned int *)a3 + 2)];
  [(JavaIoPrintStream *)self printWithNSString:v4];
}

- (void)printWithChar:(unsigned __int16)a3
{
  v4 = NSString_valueOfChar_(a3);
  [(JavaIoPrintStream *)self printWithNSString:v4];
}

- (void)printWithDouble:(double)a3
{
  CFStringRef v4 = NSString_valueOfDouble_(a3);
  [(JavaIoPrintStream *)self printWithNSString:v4];
}

- (void)printWithFloat:(float)a3
{
  CFStringRef v4 = NSString_valueOfFloat_(a3);
  [(JavaIoPrintStream *)self printWithNSString:v4];
}

- (void)printWithInt:(int)a3
{
  CFStringRef v4 = NSString_valueOfInt_(a3);
  [(JavaIoPrintStream *)self printWithNSString:v4];
}

- (void)printWithLong:(int64_t)a3
{
  CFStringRef v4 = NSString_valueOfLong_(a3);
  [(JavaIoPrintStream *)self printWithNSString:v4];
}

- (void)printWithId:(id)a3
{
  CFStringRef v4 = NSString_valueOf_(a3);
  [(JavaIoPrintStream *)self printWithNSString:v4];
}

- (void)printWithNSString:(id)a3
{
  objc_sync_enter(self);
  if (self->super.out_)
  {
    if (a3)
    {
      if (self->encoding_) {
        id v5 = objc_msgSend(a3, "getBytesWithCharsetName:");
      }
      else {
        id v5 = [a3 getBytes];
      }
      [(JavaIoOutputStream *)self writeWithByteArray:v5];
    }
    else
    {
      [(JavaIoPrintStream *)self printWithNSString:@"null"];
    }
  }
  else
  {
    [(JavaIoPrintStream *)self setError];
  }
  objc_sync_exit(self);
}

- (void)printWithBoolean:(BOOL)a3
{
  CFStringRef v4 = NSString_valueOfBool_(a3);
  [(JavaIoPrintStream *)self printWithNSString:v4];
}

- (void)println
{
  CFStringRef v3 = JavaLangSystem_lineSeparator();
  [(JavaIoPrintStream *)self printWithNSString:v3];
}

- (void)printlnWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  CFStringRef v4 = +[NSString stringWithCharacters:a3 offset:0 length:*((unsigned int *)a3 + 2)];
  [(JavaIoPrintStream *)self printlnWithNSString:v4];
}

- (void)printlnWithChar:(unsigned __int16)a3
{
  CFStringRef v4 = NSString_valueOfChar_(a3);
  [(JavaIoPrintStream *)self printlnWithNSString:v4];
}

- (void)printlnWithDouble:(double)a3
{
  CFStringRef v4 = NSString_valueOfDouble_(a3);
  [(JavaIoPrintStream *)self printlnWithNSString:v4];
}

- (void)printlnWithFloat:(float)a3
{
  CFStringRef v4 = NSString_valueOfFloat_(a3);
  [(JavaIoPrintStream *)self printlnWithNSString:v4];
}

- (void)printlnWithInt:(int)a3
{
  CFStringRef v4 = NSString_valueOfInt_(a3);
  [(JavaIoPrintStream *)self printlnWithNSString:v4];
}

- (void)printlnWithLong:(int64_t)a3
{
  CFStringRef v4 = NSString_valueOfLong_(a3);
  [(JavaIoPrintStream *)self printlnWithNSString:v4];
}

- (void)printlnWithId:(id)a3
{
  CFStringRef v4 = NSString_valueOf_(a3);
  [(JavaIoPrintStream *)self printlnWithNSString:v4];
}

- (void)printlnWithNSString:(id)a3
{
  objc_sync_enter(self);
  [(JavaIoPrintStream *)self printWithNSString:a3];
  [(JavaIoPrintStream *)self printWithNSString:JavaLangSystem_lineSeparator()];
  objc_sync_exit(self);
}

- (void)printlnWithBoolean:(BOOL)a3
{
  CFStringRef v4 = NSString_valueOfBool_(a3);
  [(JavaIoPrintStream *)self printlnWithNSString:v4];
}

- (void)setError
{
  self->ioError_ = 1;
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  objc_sync_enter(self);
  out = self->super.out_;
  if (out)
  {
    [(JavaIoOutputStream *)out writeWithByteArray:a3 withInt:v6 withInt:v5];
    if (self->autoFlush_) {
      [(JavaIoPrintStream *)self flush];
    }
  }
  else
  {
    [(JavaIoPrintStream *)self setError];
  }
  objc_sync_exit(self);
}

- (void)writeWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  out = self->super.out_;
  if (out)
  {
    [(JavaIoOutputStream *)out writeWithInt:v3];
    if (self->autoFlush_ && (v3 == 21 || v3 == 10)) {
      [(JavaIoPrintStream *)self flush];
    }
  }
  else
  {
    [(JavaIoPrintStream *)self setError];
  }
  objc_sync_exit(self);
}

- (id)appendWithChar:(unsigned __int16)a3
{
  return self;
}

- (id)appendWithJavaLangCharSequence:(id)a3
{
  if (a3) {
    CFStringRef v4 = (const __CFString *)[a3 description];
  }
  else {
    CFStringRef v4 = @"null";
  }
  [(JavaIoPrintStream *)self printWithNSString:v4];
  return self;
}

- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a3) {
    uint64_t v6 = (__CFString *)a3;
  }
  else {
    uint64_t v6 = @"null";
  }
  id v7 = [(__CFString *)v6 subSequenceFrom:*(void *)&a4 to:*(void *)&a5];
  if (!v7) {
    JreThrowNullPointerException();
  }
  -[JavaIoPrintStream printWithNSString:](self, "printWithNSString:", [v7 description]);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoPrintStream;
  [(JavaIoFilterOutputStream *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100453F10;
}

@end
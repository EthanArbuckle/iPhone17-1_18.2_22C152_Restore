@interface JavaIoPrintWriter
+ (const)__metadata;
- (BOOL)checkError;
- (JavaIoPrintWriter)initWithJavaIoFile:(id)a3;
- (JavaIoPrintWriter)initWithJavaIoFile:(id)a3 withNSString:(id)a4;
- (JavaIoPrintWriter)initWithJavaIoOutputStream:(id)a3;
- (JavaIoPrintWriter)initWithJavaIoOutputStream:(id)a3 withBoolean:(BOOL)a4;
- (JavaIoPrintWriter)initWithJavaIoWriter:(id)a3;
- (JavaIoPrintWriter)initWithJavaIoWriter:(id)a3 withBoolean:(BOOL)a4;
- (JavaIoPrintWriter)initWithNSString:(id)a3;
- (JavaIoPrintWriter)initWithNSString:(id)a3 withNSString:(id)a4;
- (id)appendWithChar:(unsigned __int16)a3;
- (id)appendWithJavaLangCharSequence:(id)a3;
- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)formatWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5;
- (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4;
- (id)printfWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5;
- (void)clearError;
- (void)close;
- (void)dealloc;
- (void)doWriteWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)flush;
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
- (void)writeWithCharArray:(id)a3;
- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
- (void)writeWithNSString:(id)a3;
- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaIoPrintWriter

- (JavaIoPrintWriter)initWithJavaIoOutputStream:(id)a3
{
  return self;
}

- (JavaIoPrintWriter)initWithJavaIoOutputStream:(id)a3 withBoolean:(BOOL)a4
{
  return self;
}

- (JavaIoPrintWriter)initWithJavaIoWriter:(id)a3
{
  self->autoFlush_ = 0;
  JreStrongAssign((id *)&self->out_, a3);
  return self;
}

- (JavaIoPrintWriter)initWithJavaIoWriter:(id)a3 withBoolean:(BOOL)a4
{
  self->autoFlush_ = a4;
  JreStrongAssign((id *)&self->out_, a3);
  return self;
}

- (JavaIoPrintWriter)initWithJavaIoFile:(id)a3
{
  return self;
}

- (JavaIoPrintWriter)initWithJavaIoFile:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaIoPrintWriter)initWithNSString:(id)a3
{
  return self;
}

- (JavaIoPrintWriter)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (BOOL)checkError
{
  out = self->out_;
  if (!out) {
    return self->ioError_;
  }
  [(JavaIoPrintWriter *)self flush];
  if (self->ioError_) {
    return 1;
  }
  return [(JavaIoWriter *)out checkError];
}

- (void)clearError
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  self->ioError_ = 0;
  objc_sync_exit(lock);
}

- (void)close
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  out = self->out_;
  if (out)
  {
    [(JavaIoWriter *)out close];
    JreStrongAssign((id *)&self->out_, 0);
  }
  objc_sync_exit(lock);
}

- (void)flush
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  out = self->out_;
  if (out) {
    [(JavaIoWriter *)out flush];
  }
  else {
    [(JavaIoPrintWriter *)self setError];
  }
  objc_sync_exit(lock);
}

- (id)formatWithNSString:(id)a3 withNSObjectArray:(id)a4
{
  uint64_t Default = JavaUtilLocale_getDefault();
  return [(JavaIoPrintWriter *)self formatWithJavaUtilLocale:Default withNSString:a3 withNSObjectArray:a4];
}

- (id)formatWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5
{
  if (!a4)
  {
    v7 = new_JavaLangNullPointerException_initWithNSString_(@"format == null");
    objc_exception_throw(v7);
  }
  [new_JavaUtilFormatter_initWithJavaLangAppendable_withJavaUtilLocale_(self, a3) formatWithNSString:a4 withNSObjectArray:a5];
  if (self->autoFlush_) {
    [(JavaIoPrintWriter *)self flush];
  }
  return self;
}

- (id)printfWithJavaUtilLocale:(id)a3 withNSString:(id)a4 withNSObjectArray:(id)a5
{
  return [(JavaIoPrintWriter *)self formatWithJavaUtilLocale:a3 withNSString:a4 withNSObjectArray:a5];
}

- (void)printWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  v4 = +[NSString stringWithCharacters:a3 offset:0 length:*((unsigned int *)a3 + 2)];
  [(JavaIoPrintWriter *)self printWithNSString:v4];
}

- (void)printWithChar:(unsigned __int16)a3
{
  v4 = NSString_valueOfChar_(a3);
  [(JavaIoPrintWriter *)self printWithNSString:v4];
}

- (void)printWithDouble:(double)a3
{
  CFStringRef v4 = NSString_valueOfDouble_(a3);
  [(JavaIoPrintWriter *)self printWithNSString:v4];
}

- (void)printWithFloat:(float)a3
{
  CFStringRef v4 = NSString_valueOfFloat_(a3);
  [(JavaIoPrintWriter *)self printWithNSString:v4];
}

- (void)printWithInt:(int)a3
{
  CFStringRef v4 = NSString_valueOfInt_(a3);
  [(JavaIoPrintWriter *)self printWithNSString:v4];
}

- (void)printWithLong:(int64_t)a3
{
  CFStringRef v4 = NSString_valueOfLong_(a3);
  [(JavaIoPrintWriter *)self printWithNSString:v4];
}

- (void)printWithId:(id)a3
{
  CFStringRef v4 = NSString_valueOf_(a3);
  [(JavaIoPrintWriter *)self printWithNSString:v4];
}

- (void)printWithNSString:(id)a3
{
  if (!a3) {
    a3 = (id)NSString_valueOf_(0);
  }
  [(JavaIoPrintWriter *)self writeWithNSString:a3];
}

- (void)printWithBoolean:(BOOL)a3
{
  CFStringRef v4 = NSString_valueOfBool_(a3);
  [(JavaIoPrintWriter *)self printWithNSString:v4];
}

- (void)println
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  [(JavaIoPrintWriter *)self printWithNSString:JavaLangSystem_lineSeparator()];
  if (self->autoFlush_) {
    [(JavaIoPrintWriter *)self flush];
  }
  objc_sync_exit(lock);
}

- (void)printlnWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  CFStringRef v4 = +[NSString stringWithCharacters:a3 offset:0 length:*((unsigned int *)a3 + 2)];
  [(JavaIoPrintWriter *)self printlnWithNSString:v4];
}

- (void)printlnWithChar:(unsigned __int16)a3
{
  CFStringRef v4 = NSString_valueOfChar_(a3);
  [(JavaIoPrintWriter *)self printlnWithNSString:v4];
}

- (void)printlnWithDouble:(double)a3
{
  CFStringRef v4 = NSString_valueOfDouble_(a3);
  [(JavaIoPrintWriter *)self printlnWithNSString:v4];
}

- (void)printlnWithFloat:(float)a3
{
  CFStringRef v4 = NSString_valueOfFloat_(a3);
  [(JavaIoPrintWriter *)self printlnWithNSString:v4];
}

- (void)printlnWithInt:(int)a3
{
  CFStringRef v4 = NSString_valueOfInt_(a3);
  [(JavaIoPrintWriter *)self printlnWithNSString:v4];
}

- (void)printlnWithLong:(int64_t)a3
{
  CFStringRef v4 = NSString_valueOfLong_(a3);
  [(JavaIoPrintWriter *)self printlnWithNSString:v4];
}

- (void)printlnWithId:(id)a3
{
  CFStringRef v4 = NSString_valueOf_(a3);
  [(JavaIoPrintWriter *)self printlnWithNSString:v4];
}

- (void)printlnWithNSString:(id)a3
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  [(JavaIoPrintWriter *)self printWithNSString:a3];
  [(JavaIoPrintWriter *)self println];
  objc_sync_exit(lock);
}

- (void)printlnWithBoolean:(BOOL)a3
{
  CFStringRef v4 = NSString_valueOfBool_(a3);
  [(JavaIoPrintWriter *)self printlnWithNSString:v4];
}

- (void)setError
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  self->ioError_ = 1;
  objc_sync_exit(lock);
}

- (void)writeWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  [(JavaIoPrintWriter *)self writeWithCharArray:a3 withInt:0 withInt:v3];
}

- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)writeWithInt:(int)a3
{
  __int16 v3 = a3;
  sub_100219AEC(self, (uint64_t)+[IOSCharArray arrayWithChars:&v3 count:1], 0, 1);
}

- (void)doWriteWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)writeWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v4 = [a3 toCharArray];
  [(JavaIoPrintWriter *)self writeWithCharArray:v4];
}

- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3 || (id v6 = [a3 substring:*(void *)&a4 endIndex:(a5 + a4)]) == 0) {
    JreThrowNullPointerException();
  }
  id v7 = [v6 toCharArray];
  [(JavaIoPrintWriter *)self writeWithCharArray:v7];
}

- (id)appendWithChar:(unsigned __int16)a3
{
  return self;
}

- (id)appendWithJavaLangCharSequence:(id)a3
{
  if (a3) {
    id v4 = (__CFString *)a3;
  }
  else {
    id v4 = @"null";
  }
  [(JavaIoPrintWriter *)self appendWithJavaLangCharSequence:v4 withInt:0 withInt:[(__CFString *)v4 length]];
  return self;
}

- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a3) {
    id v6 = (__CFString *)a3;
  }
  else {
    id v6 = @"null";
  }
  id v7 = [(__CFString *)v6 subSequenceFrom:*(void *)&a4 to:*(void *)&a5];
  if (!v7 || (id v8 = [v7 description]) == 0) {
    JreThrowNullPointerException();
  }
  -[JavaIoPrintWriter writeWithNSString:withInt:withInt:](self, "writeWithNSString:withInt:withInt:", v8, 0, [v8 length]);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoPrintWriter;
  [(JavaIoWriter *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044A688;
}

@end
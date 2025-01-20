@interface JavaIoWriter
+ (const)__metadata;
- (BOOL)checkError;
- (JavaIoWriter)init;
- (JavaIoWriter)initWithId:(id)a3;
- (id)appendWithChar:(unsigned __int16)a3;
- (id)appendWithJavaLangCharSequence:(id)a3;
- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)writeWithCharArray:(id)a3;
- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
- (void)writeWithNSString:(id)a3;
- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaIoWriter

- (JavaIoWriter)init
{
  return self;
}

- (JavaIoWriter)initWithId:(id)a3
{
  return self;
}

- (void)close
{
}

- (void)flush
{
}

- (void)writeWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  [(JavaIoWriter *)self writeWithCharArray:a3 withInt:0 withInt:v3];
}

- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
}

- (void)writeWithInt:(int)a3
{
  __int16 v3 = a3;
  id lock = self->lock_;
  objc_sync_enter(lock);
  v6 = +[IOSCharArray arrayWithLength:1];
  uint64_t size = v6->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  *((_WORD *)&v6->super.size_ + 2) = v3;
  [(JavaIoWriter *)self writeWithCharArray:v6];
  objc_sync_exit(lock);
}

- (void)writeWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 length];
  [(JavaIoWriter *)self writeWithNSString:a3 withInt:0 withInt:v5];
}

- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  if ((a5 | a4) < 0) {
    goto LABEL_8;
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((int)([a3 length] - a5) < a4)
  {
LABEL_8:
    v11 = new_JavaLangStringIndexOutOfBoundsException_initWithNSString_withInt_withInt_(a3);
    objc_exception_throw(v11);
  }
  v9 = +[IOSCharArray arrayWithLength:a5];
  [a3 getChars:v6 sourceEnd:(a5 + v6) destination:v9 destinationBegin:0];
  id lock = self->lock_;
  objc_sync_enter(lock);
  [(JavaIoWriter *)self writeWithCharArray:v9 withInt:0 withInt:v9->super.size_];
  objc_sync_exit(lock);
}

- (id)appendWithChar:(unsigned __int16)a3
{
  return self;
}

- (id)appendWithJavaLangCharSequence:(id)a3
{
  if (a3) {
    v4 = (__CFString *)a3;
  }
  else {
    v4 = @"null";
  }
  [(JavaIoWriter *)self writeWithNSString:[(__CFString *)v4 description]];
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
  -[JavaIoWriter writeWithNSString:](self, "writeWithNSString:", [v7 description]);
  return self;
}

- (BOOL)checkError
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoWriter;
  [(JavaIoWriter *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100474668;
}

@end
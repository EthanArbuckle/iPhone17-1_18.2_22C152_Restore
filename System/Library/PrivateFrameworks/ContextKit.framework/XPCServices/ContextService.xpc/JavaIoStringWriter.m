@interface JavaIoStringWriter
+ (const)__metadata;
- (JavaIoStringWriter)init;
- (JavaIoStringWriter)initWithInt:(int)a3;
- (id)appendWithChar:(unsigned __int16)a3;
- (id)appendWithJavaLangCharSequence:(id)a3;
- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)description;
- (id)getBuffer;
- (void)dealloc;
- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
- (void)writeWithNSString:(id)a3;
- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaIoStringWriter

- (JavaIoStringWriter)init
{
  return self;
}

- (JavaIoStringWriter)initWithInt:(int)a3
{
  return self;
}

- (id)getBuffer
{
  return self->buf_;
}

- (id)description
{
  buf = self->buf_;
  if (!buf) {
    JreThrowNullPointerException();
  }
  return [(JavaLangStringBuffer *)buf description];
}

- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    goto LABEL_8;
  }
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if (!v5) {
    return;
  }
  buf = self->buf_;
  if (!buf) {
LABEL_8:
  }
    JreThrowNullPointerException();
  [(JavaLangStringBuffer *)buf appendWithCharArray:a3 withInt:v6 withInt:v5];
}

- (void)writeWithInt:(int)a3
{
  buf = self->buf_;
  if (!buf) {
    JreThrowNullPointerException();
  }
  [(JavaLangStringBuffer *)buf appendWithChar:(unsigned __int16)a3];
}

- (void)writeWithNSString:(id)a3
{
  buf = self->buf_;
  if (!buf) {
    JreThrowNullPointerException();
  }
  [(JavaLangStringBuffer *)buf appendWithNSString:a3];
}

- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3
    || (id v6 = [a3 substring:*(void *)&a4 endIndex:(a5 + a4)], (buf = self->buf_) == 0))
  {
    JreThrowNullPointerException();
  }
  [(JavaLangStringBuffer *)buf appendWithNSString:v6];
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
  [(JavaIoStringWriter *)self writeWithNSString:[(__CFString *)v4 description]];
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
  -[JavaIoStringWriter writeWithNSString:withInt:withInt:](self, "writeWithNSString:withInt:withInt:", v8, 0, [v8 length]);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoStringWriter;
  [(JavaIoWriter *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045D840;
}

@end
@interface JavaIoFilterOutputStream
+ (const)__metadata;
- (JavaIoFilterOutputStream)initWithJavaIoOutputStream:(id)a3;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaIoFilterOutputStream

- (JavaIoFilterOutputStream)initWithJavaIoOutputStream:(id)a3
{
  return self;
}

- (void)close
{
  [(JavaIoFilterOutputStream *)self flush];
  out = self->out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)out close];
}

- (void)flush
{
  out = self->out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)out flush];
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v6 = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if (a5 >= 1)
  {
    uint64_t v9 = a5;
    do
    {
      uint64_t v10 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v6);
      }
      [(JavaIoFilterOutputStream *)self writeWithInt:*((char *)a3 + v6++ + 12)];
      --v9;
    }
    while (v9);
  }
}

- (void)writeWithInt:(int)a3
{
  out = self->out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)out writeWithInt:*(void *)&a3];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoFilterOutputStream;
  [(JavaIoFilterOutputStream *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100407CA0;
}

@end
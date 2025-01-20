@interface JavaIoReader
+ (const)__metadata;
- (BOOL)markSupported;
- (BOOL)ready;
- (JavaIoReader)init;
- (JavaIoReader)initWithId:(id)a3;
- (int)read;
- (int)readWithCharArray:(id)a3;
- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)readWithJavaNioCharBuffer:(id)a3;
- (int64_t)skipWithLong:(int64_t)a3;
- (void)close;
- (void)dealloc;
- (void)markWithInt:(int)a3;
- (void)reset;
@end

@implementation JavaIoReader

- (JavaIoReader)init
{
  return self;
}

- (JavaIoReader)initWithId:(id)a3
{
  return self;
}

- (void)close
{
}

- (void)markWithInt:(int)a3
{
  v3 = new_JavaIoIOException_init();
  objc_exception_throw(v3);
}

- (BOOL)markSupported
{
  return 0;
}

- (int)read
{
  id lock = self->lock_;
  objc_sync_enter(lock);
  v4 = +[IOSCharArray arrayWithLength:1];
  if ([(JavaIoReader *)self readWithCharArray:v4 withInt:0 withInt:1] == -1)
  {
    int v6 = -1;
  }
  else
  {
    uint64_t size = v4->super.size_;
    if ((int)size <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(size, 0);
    }
    int v6 = *((unsigned __int16 *)&v4->super.size_ + 2);
  }
  objc_sync_exit(lock);
  return v6;
}

- (int)readWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaIoReader *)self readWithCharArray:a3 withInt:0 withInt:v3];
}

- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return 0;
}

- (BOOL)ready
{
  return 0;
}

- (void)reset
{
  v2 = new_JavaIoIOException_init();
  objc_exception_throw(v2);
}

- (int64_t)skipWithLong:(int64_t)a3
{
  if (a3 < 0)
  {
    CFStringRef v17 = JreStrcat("$J", (uint64_t)a2, a3, v3, v4, v5, v6, v7, @"charCount < 0: ");
    v18 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v17);
    objc_exception_throw(v18);
  }
  id lock = self->lock_;
  objc_sync_enter(lock);
  if (a3 >= 512) {
    int64_t v11 = 512;
  }
  else {
    int64_t v11 = a3;
  }
  v12 = +[IOSCharArray arrayWithLength:v11];
  if (a3)
  {
    v13 = v12;
    uint64_t v14 = 0;
    do
    {
      int v15 = [(JavaIoReader *)self readWithCharArray:v13 withInt:0 withInt:v11];
      if (v15 == -1) {
        break;
      }
      v14 += v15;
      if (v15 < (int)v11) {
        break;
      }
      int64_t v11 = a3 - v14 >= (int)v11 ? v11 : (a3 - v14);
    }
    while (a3 > v14);
  }
  else
  {
    uint64_t v14 = 0;
  }
  objc_sync_exit(lock);
  return v14;
}

- (int)readWithJavaNioCharBuffer:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 length];
  uint64_t v6 = +[IOSCharArray arrayWithLength:(int)v5];
  uint64_t v7 = JavaLangMath_minWithInt_withInt_((uint64_t)v5, [(JavaIoReader *)self readWithCharArray:v6]);
  if ((int)v7 >= 1) {
    [a3 putWithCharArray:v6 withInt:0 withInt:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoReader;
  [(JavaIoReader *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042E948;
}

@end
@interface JavaIoBufferedOutputStream
+ (const)__metadata;
- (JavaIoBufferedOutputStream)initWithJavaIoOutputStream:(id)a3;
- (JavaIoBufferedOutputStream)initWithJavaIoOutputStream:(id)a3 withInt:(int)a4;
- (uint64_t)checkNotClosed;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)flushInternal;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaIoBufferedOutputStream

- (JavaIoBufferedOutputStream)initWithJavaIoOutputStream:(id)a3
{
  return self;
}

- (JavaIoBufferedOutputStream)initWithJavaIoOutputStream:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)flush
{
  objc_sync_enter(self);
  -[JavaIoBufferedOutputStream checkNotClosed]_0((uint64_t)self);
  -[JavaIoBufferedOutputStream flushInternal]_0(self);
  out = self->super.out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  [(JavaIoOutputStream *)out flush];
  objc_sync_exit(self);
}

- (uint64_t)checkNotClosed
{
  if (!*(void *)(result + 16))
  {
    v1 = new_JavaIoIOException_initWithNSString_(@"BufferedOutputStream is closed");
    objc_exception_throw(v1);
  }
  return result;
}

- (void)flushInternal
{
  if (*((int *)result + 6) >= 1)
  {
    v1 = result;
    v2 = (void *)result[1];
    if (!v2) {
      JreThrowNullPointerException();
    }
    result = objc_msgSend(v2, "writeWithByteArray:withInt:withInt:", v1[2], 0);
    *((_DWORD *)v1 + 6) = 0;
  }
  return result;
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  objc_sync_enter(self);
  -[JavaIoBufferedOutputStream checkNotClosed]_0((uint64_t)self);
  if (!a3)
  {
    v12 = new_JavaLangNullPointerException_initWithNSString_(@"buffer == null");
    objc_exception_throw(v12);
  }
  buf = self->buf_;
  if (!buf) {
    goto LABEL_12;
  }
  if (buf->super.size_ <= (int)v5)
  {
    -[JavaIoBufferedOutputStream flushInternal]_0(self);
    out = self->super.out_;
    if (out)
    {
      [(JavaIoOutputStream *)out writeWithByteArray:a3 withInt:v6 withInt:v5];
      goto LABEL_9;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), v6, v5);
  uint64_t count = self->count_;
  if (buf->super.size_ - (int)count < (int)v5)
  {
    -[JavaIoBufferedOutputStream flushInternal]_0(self);
    uint64_t count = self->count_;
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v6, buf, count, v5);
  self->count_ += v5;
LABEL_9:
  objc_sync_exit(self);
}

- (void)close
{
  objc_sync_enter(self);
  if (self->buf_)
  {
    v3.receiver = self;
    v3.super_class = (Class)JavaIoBufferedOutputStream;
    [(JavaIoFilterOutputStream *)&v3 close];
    JreStrongAssign((id *)&self->buf_, 0);
  }
  objc_sync_exit(self);
}

- (void)writeWithInt:(int)a3
{
  char v3 = a3;
  objc_sync_enter(self);
  -[JavaIoBufferedOutputStream checkNotClosed]_0((uint64_t)self);
  buf = self->buf_;
  if (!buf) {
    goto LABEL_10;
  }
  uint64_t count = self->count_;
  if (count == buf->super.size_)
  {
    out = self->super.out_;
    if (out)
    {
      [(JavaIoOutputStream *)out writeWithByteArray:self->buf_ withInt:0 withInt:self->count_];
      uint64_t count = 0;
      self->count_ = 0;
      buf = self->buf_;
      goto LABEL_5;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
LABEL_5:
  self->count_ = count + 1;
  uint64_t size = buf->super.size_;
  if ((count & 0x80000000) != 0 || (int)count >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, count);
  }
  *((unsigned char *)&buf->super.size_ + (int)count + 4) = v3;
  objc_sync_exit(self);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoBufferedOutputStream;
  [(JavaIoFilterOutputStream *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100402048;
}

@end
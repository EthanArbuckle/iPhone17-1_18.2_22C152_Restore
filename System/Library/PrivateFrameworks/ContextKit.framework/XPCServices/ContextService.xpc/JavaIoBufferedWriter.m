@interface JavaIoBufferedWriter
+ (const)__metadata;
- (BOOL)isClosed;
- (JavaIoBufferedWriter)initWithJavaIoWriter:(id)a3;
- (JavaIoBufferedWriter)initWithJavaIoWriter:(id)a3 withInt:(int)a4;
- (uint64_t)checkNotClosed;
- (void)close;
- (void)dealloc;
- (void)flush;
- (void)flushInternal;
- (void)newLine;
- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation JavaIoBufferedWriter

- (JavaIoBufferedWriter)initWithJavaIoWriter:(id)a3
{
  return self;
}

- (JavaIoBufferedWriter)initWithJavaIoWriter:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)close
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  p_out = (id *)&self->out_;
  if (self->out_)
  {
    -[JavaIoBufferedWriter flushInternal]_0(self);
    JreStrongAssign((id *)&self->buf_, 0);
    if (!*p_out) {
      JreThrowNullPointerException();
    }
    [*p_out close];
    JreStrongAssign((id *)&self->out_, 0);
  }
  objc_sync_exit(lock);
}

- (void)flushInternal
{
  v1 = result;
  if (*((int *)result + 8) >= 1)
  {
    v2 = (void *)result[2];
    if (!v2) {
      JreThrowNullPointerException();
    }
    result = objc_msgSend(v2, "writeWithCharArray:withInt:withInt:", v1[3], 0);
  }
  *((_DWORD *)v1 + 8) = 0;
  return result;
}

- (void)flush
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  -[JavaIoBufferedWriter checkNotClosed]_0((uint64_t)self);
  -[JavaIoBufferedWriter flushInternal]_0(self);
  out = self->out_;
  if (!out) {
    JreThrowNullPointerException();
  }
  [(JavaIoWriter *)out flush];
  objc_sync_exit(lock);
}

- (uint64_t)checkNotClosed
{
  if (!*(void *)(result + 16))
  {
    v1 = new_JavaIoIOException_initWithNSString_(@"BufferedWriter is closed");
    objc_exception_throw(v1);
  }
  return result;
}

- (BOOL)isClosed
{
  return self->out_ == 0;
}

- (void)newLine
{
  CFStringRef v3 = JavaLangSystem_lineSeparator();
  [(JavaIoWriter *)self writeWithNSString:v3];
}

- (void)writeWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id obj = self->super.lock_;
  objc_sync_enter(obj);
  -[JavaIoBufferedWriter checkNotClosed]_0((uint64_t)self);
  if (!a3)
  {
    v18 = new_JavaLangNullPointerException_initWithNSString_(@"buffer == null");
    objc_exception_throw(v18);
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), v6, v5);
  uint64_t pos = self->pos_;
  buf = self->buf_;
  if (pos)
  {
    if (!buf) {
LABEL_23:
    }
      JreThrowNullPointerException();
    goto LABEL_7;
  }
  if (!buf) {
LABEL_24:
  }
    JreThrowNullPointerException();
  if (buf->super.size_ <= (int)v5)
  {
    out = self->out_;
    if (out)
    {
      [(JavaIoWriter *)out writeWithCharArray:a3 withInt:v6 withInt:v5];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_7:
  int size = buf->super.size_;
  int v12 = size - pos;
  if (size - (int)pos >= (int)v5) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = v12;
  }
  if ((int)v13 > 0)
  {
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v6, buf, pos, v13);
    LODWORD(pos) = self->pos_ + v13;
    self->pos_ = pos;
    int size = self->buf_->super.size_;
  }
  if (pos == size)
  {
    v14 = self->out_;
    if (!v14) {
      goto LABEL_23;
    }
    -[JavaIoWriter writeWithCharArray:withInt:withInt:](v14, "writeWithCharArray:withInt:withInt:");
    self->pos_ = 0;
    if (v12 < (int)v5)
    {
      uint64_t v15 = (v5 - v13);
      v16 = self->buf_;
      if ((int)v15 >= v16->super.size_)
      {
        [(JavaIoWriter *)self->out_ writeWithCharArray:a3 withInt:(v13 + v6) withInt:v15];
      }
      else
      {
        JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, (v13 + v6), v16, 0, v15);
        self->pos_ += v15;
      }
    }
  }
LABEL_20:
  objc_sync_exit(obj);
}

- (void)writeWithInt:(int)a3
{
  __int16 v3 = a3;
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  -[JavaIoBufferedWriter checkNotClosed]_0((uint64_t)self);
  buf = self->buf_;
  if (!buf) {
    goto LABEL_10;
  }
  uint64_t pos = self->pos_;
  if ((int)pos >= buf->super.size_)
  {
    out = self->out_;
    if (out)
    {
      -[JavaIoWriter writeWithCharArray:withInt:withInt:](out, "writeWithCharArray:withInt:withInt:", self->buf_, 0);
      uint64_t pos = 0;
      self->pos_ = 0;
      buf = self->buf_;
      goto LABEL_5;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
LABEL_5:
  self->pos_ = pos + 1;
  uint64_t size = buf->super.size_;
  if ((pos & 0x80000000) != 0 || (int)pos >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, pos);
  }
  *((_WORD *)&buf->super.size_ + (int)pos + 2) = v3;
  objc_sync_exit(lock);
}

- (void)writeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  -[JavaIoBufferedWriter checkNotClosed]_0((uint64_t)self);
  if ((int)v5 < 1) {
    goto LABEL_23;
  }
  if ((v6 & 0x80000000) != 0) {
    goto LABEL_29;
  }
  if (!a3) {
    goto LABEL_26;
  }
  if ((int)([a3 length] - v5) < (int)v6)
  {
LABEL_29:
    v21 = new_JavaLangStringIndexOutOfBoundsException_initWithNSString_withInt_withInt_(a3);
    objc_exception_throw(v21);
  }
  int pos = self->pos_;
  buf = self->buf_;
  if (pos)
  {
    if (!buf) {
LABEL_27:
    }
      JreThrowNullPointerException();
    goto LABEL_10;
  }
  if (!buf) {
LABEL_26:
  }
    JreThrowNullPointerException();
  if (buf->super.size_ <= (int)v5)
  {
    v18 = +[IOSCharArray arrayWithLength:v5];
    [a3 getChars:v6 sourceEnd:(v5 + v6) destination:v18 destinationBegin:0];
    out = self->out_;
    if (!out) {
      JreThrowNullPointerException();
    }
    [(JavaIoWriter *)out writeWithCharArray:v18 withInt:0 withInt:v5];
    goto LABEL_23;
  }
LABEL_10:
  uint64_t size = buf->super.size_;
  int v13 = size - pos;
  if ((int)size - pos >= (int)v5) {
    int v14 = v5;
  }
  else {
    int v14 = size - pos;
  }
  if (v14 > 0)
  {
    objc_msgSend(a3, "getChars:sourceEnd:destination:destinationBegin:", v6, (v14 + v6));
    int pos = self->pos_ + v14;
    self->pos_ = pos;
    buf = self->buf_;
    uint64_t size = buf->super.size_;
  }
  if (pos == size)
  {
    uint64_t v15 = self->out_;
    if (!v15) {
      goto LABEL_27;
    }
    [(JavaIoWriter *)v15 writeWithCharArray:buf withInt:0 withInt:size];
    self->pos_ = 0;
    if (v13 < (int)v5)
    {
      uint64_t v16 = (v14 + v6);
      uint64_t v17 = (v5 - v14);
      if ((int)v17 >= self->buf_->super.size_)
      {
        v20 = +[IOSCharArray arrayWithLength:v5];
        [a3 getChars:v16 sourceEnd:(v5 + v6) destination:v20 destinationBegin:0];
        [(JavaIoWriter *)self->out_ writeWithCharArray:v20 withInt:0 withInt:v17];
      }
      else
      {
        objc_msgSend(a3, "getChars:sourceEnd:destination:destinationBegin:", v16, (v5 + v6));
        self->pos_ += v17;
      }
    }
  }
LABEL_23:
  objc_sync_exit(lock);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoBufferedWriter;
  [(JavaIoWriter *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004013F8;
}

@end
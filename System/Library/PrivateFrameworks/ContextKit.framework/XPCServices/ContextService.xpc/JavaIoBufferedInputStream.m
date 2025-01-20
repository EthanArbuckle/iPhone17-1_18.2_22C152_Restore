@interface JavaIoBufferedInputStream
+ (const)__metadata;
- (BOOL)markSupported;
- (JavaIoBufferedInputStream)initWithJavaIoInputStream:(id)a3;
- (JavaIoBufferedInputStream)initWithJavaIoInputStream:(id)a3 withInt:(int)a4;
- (id)streamClosed;
- (int)available;
- (int)fillbufWithJavaIoInputStream:(id)a3 withByteArray:(id)a4;
- (int)read;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)skipWithLong:(int64_t)a3;
- (void)__javaClone;
- (void)close;
- (void)dealloc;
- (void)markWithInt:(int)a3;
- (void)reset;
@end

@implementation JavaIoBufferedInputStream

- (JavaIoBufferedInputStream)initWithJavaIoInputStream:(id)a3
{
  return self;
}

- (JavaIoBufferedInputStream)initWithJavaIoInputStream:(id)a3 withInt:(int)a4
{
  return self;
}

- (int)available
{
  objc_sync_enter(self);
  v3 = (void *)atomic_load((unint64_t *)&self->super.in_);
  if (atomic_load((unint64_t *)&self->buf_)) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    sub_1001B8F6C();
  }
  int count = self->count_;
  int pos = self->pos_;
  int v8 = count - pos + [v3 available];
  objc_sync_exit(self);
  return v8;
}

- (id)streamClosed
{
  v2 = new_JavaIoIOException_initWithNSString_(@"BufferedInputStream is closed");
  objc_exception_throw(v2);
}

- (void)close
{
  JreVolatileStrongAssign((atomic_ullong *)&self->buf_, 0);
  p_in = &self->super.in_;
  v4 = (void *)atomic_load((unint64_t *)&self->super.in_);
  JreVolatileStrongAssign((atomic_ullong *)p_in, 0);
  if (v4)
  {
    [v4 close];
  }
}

- (int)fillbufWithJavaIoInputStream:(id)a3 withByteArray:(id)a4
{
  return sub_1001B902C((uint64_t)self, a3, (unsigned int *)a4);
}

- (void)markWithInt:(int)a3
{
  objc_sync_enter(self);
  self->marklimit_ = a3;
  self->markpos_ = self->pos_;
  objc_sync_exit(self);
}

- (BOOL)markSupported
{
  return 1;
}

- (int)read
{
  objc_sync_enter(self);
  v3 = (unsigned int *)atomic_load((unint64_t *)&self->buf_);
  v4 = (void *)atomic_load((unint64_t *)&self->super.in_);
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    goto LABEL_16;
  }
  if (self->pos_ >= self->count_ && sub_1001B902C((uint64_t)self, v4, v3) == -1) {
    goto LABEL_13;
  }
  unint64_t v6 = atomic_load((unint64_t *)&self->buf_);
  if (v3 != (unsigned int *)v6)
  {
    v3 = (unsigned int *)atomic_load((unint64_t *)&self->buf_);
    if (!v3) {
LABEL_16:
    }
      sub_1001B8F6C();
  }
  uint64_t pos = self->pos_;
  if (self->count_ - (int)pos < 1)
  {
LABEL_13:
    int v9 = -1;
    goto LABEL_14;
  }
  self->pos_ = pos + 1;
  uint64_t v8 = v3[2];
  if ((pos & 0x80000000) != 0 || (int)pos >= (int)v8) {
    IOSArray_throwOutOfBoundsWithMsg(v8, pos);
  }
  int v9 = *((unsigned __int8 *)v3 + pos + 12);
LABEL_14:
  objc_sync_exit(self);
  return v9;
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a4;
  objc_sync_enter(self);
  uint64_t v8 = (_DWORD *)atomic_load((unint64_t *)&self->buf_);
  if (!v8) {
    sub_1001B8F6C();
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), v5, a5);
  if (!a5)
  {
    LODWORD(v13) = 0;
    goto LABEL_31;
  }
  int v9 = (void *)atomic_load((unint64_t *)&self->super.in_);
  if (!v9) {
    sub_1001B8F6C();
  }
  uint64_t pos = self->pos_;
  int count = self->count_;
  int v12 = count - pos;
  if (count <= (int)pos)
  {
    uint64_t v13 = a5;
    goto LABEL_14;
  }
  if (v12 >= a5) {
    uint64_t v13 = a5;
  }
  else {
    uint64_t v13 = v12;
  }
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v8, pos, a3, v5, v13);
  self->pos_ += v13;
  if (v12 < a5 && [v9 available])
  {
    uint64_t v5 = (v13 + v5);
    uint64_t v13 = (a5 - v13);
    while (1)
    {
LABEL_14:
      if (self->markpos_ == -1 && (int)v13 >= v8[2])
      {
        LODWORD(v17) = [v9 readWithByteArray:a3 withInt:v5 withInt:v13];
        if (v17 == -1)
        {
LABEL_27:
          if (a5 == v13) {
            LODWORD(v13) = -1;
          }
          else {
            LODWORD(v13) = a5 - v13;
          }
          break;
        }
      }
      else
      {
        if (sub_1001B902C((uint64_t)self, v9, v8) == -1) {
          goto LABEL_27;
        }
        unint64_t v14 = atomic_load((unint64_t *)&self->buf_);
        if (v8 != (_DWORD *)v14)
        {
          uint64_t v8 = (_DWORD *)atomic_load((unint64_t *)&self->buf_);
          if (!v8) {
            sub_1001B8F6C();
          }
        }
        uint64_t v15 = self->pos_;
        int v16 = self->count_ - v15;
        if (v16 >= (int)v13) {
          uint64_t v17 = v13;
        }
        else {
          uint64_t v17 = v16;
        }
        JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(v8, v15, a3, v5, v17);
        self->pos_ += v17;
      }
      uint64_t v13 = (v13 - v17);
      if (!v13)
      {
        LODWORD(v13) = a5;
        break;
      }
      uint64_t v5 = (v17 + v5);
      if (![v9 available])
      {
        LODWORD(v13) = a5 - v13;
        break;
      }
    }
  }
LABEL_31:
  objc_sync_exit(self);
  return v13;
}

- (void)reset
{
  objc_sync_enter(self);
  if (!atomic_load((unint64_t *)&self->buf_))
  {
    CFStringRef v5 = @"Stream is closed";
    goto LABEL_8;
  }
  markuint64_t pos = self->markpos_;
  if (markpos == -1)
  {
    CFStringRef v5 = @"Mark has been invalidated.";
LABEL_8:
    unint64_t v6 = new_JavaIoIOException_initWithNSString_((uint64_t)v5);
    objc_exception_throw(v6);
  }
  self->pos_ = markpos;
  objc_sync_exit(self);
}

- (int64_t)skipWithLong:(int64_t)a3
{
  objc_sync_enter(self);
  CFStringRef v5 = (unsigned int *)atomic_load((unint64_t *)&self->buf_);
  unint64_t v6 = (void *)atomic_load((unint64_t *)&self->super.in_);
  if (!v5) {
    goto LABEL_17;
  }
  if (a3 < 1)
  {
    a3 = 0;
    goto LABEL_11;
  }
  if (!v6) {
LABEL_17:
  }
    sub_1001B8F6C();
  int count = self->count_;
  int pos = self->pos_;
  int v9 = count - pos;
  if (a3 <= count - pos)
  {
    int v11 = pos + a3;
LABEL_10:
    self->pos_ = v11;
    goto LABEL_11;
  }
  self->pos_ = count;
  int64_t v10 = v9;
  if (self->markpos_ != -1 && self->marklimit_ >= a3)
  {
    if (sub_1001B902C((uint64_t)self, v6, v5) == -1)
    {
      a3 = v10;
      goto LABEL_11;
    }
    int v11 = self->count_;
    int v13 = self->pos_;
    if (a3 - v10 <= v11 - v13) {
      int v11 = v13 + a3 - v10;
    }
    else {
      a3 = v11 - v13 + v10;
    }
    goto LABEL_10;
  }
  a3 = (int64_t)[v6 skipWithLong:a3 - v9] + v9;
LABEL_11:
  objc_sync_exit(self);
  return a3;
}

- (void)dealloc
{
  JreReleaseVolatile(&self->buf_);
  v3.receiver = self;
  v3.super_class = (Class)JavaIoBufferedInputStream;
  [(JavaIoFilterInputStream *)&v3 dealloc];
}

- (void)__javaClone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoBufferedInputStream;
  [(JavaIoFilterInputStream *)&v3 __javaClone];
  JreRetainVolatile(&self->buf_);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041D578;
}

@end
@interface JavaIoBufferedReader
+ (const)__metadata;
- (BOOL)isClosed;
- (BOOL)markSupported;
- (BOOL)ready;
- (JavaIoBufferedReader)initWithJavaIoReader:(id)a3;
- (JavaIoBufferedReader)initWithJavaIoReader:(id)a3 withInt:(int)a4;
- (id)readChar;
- (id)readLine;
- (int)read;
- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)skipWithLong:(int64_t)a3;
- (uint64_t)checkNotClosed;
- (void)close;
- (void)dealloc;
- (void)markWithInt:(int)a3;
- (void)maybeSwallowLF;
- (void)reset;
@end

@implementation JavaIoBufferedReader

- (JavaIoBufferedReader)initWithJavaIoReader:(id)a3
{
  return self;
}

- (JavaIoBufferedReader)initWithJavaIoReader:(id)a3 withInt:(int)a4
{
  return self;
}

- (void)close
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  if (self->buf_)
  {
    in = self->in_;
    if (!in) {
      JreThrowNullPointerException();
    }
    [(JavaIoReader *)in close];
    JreStrongAssign((id *)&self->buf_, 0);
  }
  objc_sync_exit(lock);
}

- (BOOL)isClosed
{
  return self->buf_ == 0;
}

- (void)markWithInt:(int)a3
{
  if (a3 < 0)
  {
    CFStringRef v11 = JreStrcat("$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"markLimit < 0:");
    v12 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v11);
    objc_exception_throw(v12);
  }
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  -[JavaIoBufferedReader checkNotClosed]_0((uint64_t)self);
  self->markLimit_ = a3;
  self->mark_ = self->pos_;
  self->markedLastWasCR_ = self->lastWasCR_;
  objc_sync_exit(lock);
}

- (uint64_t)checkNotClosed
{
  if (!*(void *)(result + 24))
  {
    v1 = new_JavaIoIOException_initWithNSString_(@"BufferedReader is closed");
    objc_exception_throw(v1);
  }
  return result;
}

- (BOOL)markSupported
{
  return 1;
}

- (int)read
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  -[JavaIoBufferedReader checkNotClosed]_0((uint64_t)self);
  unsigned int v4 = -[JavaIoBufferedReader readChar]_0((uint64_t)self);
  int v5 = v4;
  if (self->lastWasCR_ && v4 == 10) {
    int v5 = -[JavaIoBufferedReader readChar]_0((uint64_t)self);
  }
  self->lastWasCR_ = 0;
  objc_sync_exit(lock);
  return v5;
}

- (id)readChar
{
  if (*(_DWORD *)(a1 + 32) < *(_DWORD *)(a1 + 36) || (id result = sub_1001C8DD8(a1), result != -1))
  {
    uint64_t v3 = *(void *)(a1 + 24);
    if (!v3) {
      JreThrowNullPointerException();
    }
    int v4 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 32) = v4 + 1;
    uint64_t v5 = *(unsigned int *)(v3 + 8);
    if (v4 < 0 || v4 >= (int)v5) {
      IOSArray_throwOutOfBoundsWithMsg(v5, v4);
    }
    return (id)*(unsigned __int16 *)(v3 + 12 + 2 * v4);
  }
  return result;
}

- (int)readWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id obj = self->super.lock_;
  objc_sync_enter(obj);
  -[JavaIoBufferedReader checkNotClosed]_0((uint64_t)self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), v6, v5);
  if (v5)
  {
    if (self->lastWasCR_)
    {
      sub_1001C94B0((uint64_t)self);
      self->lastWasCR_ = 0;
    }
    uint64_t v9 = v5;
    do
    {
      if ((int)v9 < 1) {
        break;
      }
      uint64_t pos = self->pos_;
      int v11 = self->end_ - pos;
      if (v11 >= 1)
      {
        if (v11 >= (int)v9) {
          uint64_t v12 = v9;
        }
        else {
          uint64_t v12 = v11;
        }
        JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->buf_, pos, a3, v6, v12);
        self->pos_ += v12;
        uint64_t v9 = (v9 - v12);
        if (!v9) {
          break;
        }
        uint64_t v6 = (v12 + v6);
      }
      if ((int)v9 < (int)v5)
      {
        in = self->in_;
        if (!in) {
          goto LABEL_29;
        }
        if (![(JavaIoReader *)in ready]) {
          break;
        }
      }
      int mark = self->mark_;
      if (mark == -1 || self->pos_ - mark >= self->markLimit_)
      {
        buf = self->buf_;
        if (!buf) {
LABEL_29:
        }
          JreThrowNullPointerException();
        if ((int)v9 >= buf->super.size_)
        {
          v16 = self->in_;
          if (!v16) {
            JreThrowNullPointerException();
          }
          int v17 = [(JavaIoReader *)v16 readWithCharArray:a3 withInt:v6 withInt:v9];
          if (v17 >= 1)
          {
            LODWORD(v9) = v9 - v17;
            self->mark_ = -1;
          }
          break;
        }
      }
    }
    while (sub_1001C8DD8((uint64_t)self) != -1);
    if ((int)v5 - (int)v9 <= 0) {
      LODWORD(v5) = -1;
    }
    else {
      LODWORD(v5) = v5 - v9;
    }
  }
  objc_sync_exit(obj);
  return v5;
}

- (void)maybeSwallowLF
{
  if (self->lastWasCR_)
  {
    sub_1001C94B0((uint64_t)self);
    self->lastWasCR_ = 0;
  }
}

- (id)readLine
{
  id lock = (NSString *)self->super.lock_;
  objc_sync_enter(lock);
  -[JavaIoBufferedReader checkNotClosed]_0((uint64_t)self);
  if (self->lastWasCR_)
  {
    sub_1001C94B0((uint64_t)self);
    self->lastWasCR_ = 0;
  }
  id obj = lock;
  int pos = self->pos_;
  LODWORD(v5) = self->end_;
  if (pos >= (int)v5)
  {
LABEL_21:
    uint64_t v12 = new_JavaLangStringBuilder_initWithInt_((int)v5 - pos + 80);
    [(JavaLangStringBuilder *)v12 appendWithCharArray:self->buf_ withInt:self->pos_ withInt:(self->end_ - self->pos_)];
    while (1)
    {
      self->pos_ = self->end_;
      if (sub_1001C8DD8((uint64_t)self) == -1)
      {
        if ([(JavaLangStringBuilder *)v12 length] < 1) {
          id lock = 0;
        }
        else {
          id lock = [(JavaLangStringBuilder *)v12 description];
        }
        goto LABEL_45;
      }
      uint64_t v13 = self->pos_;
      LODWORD(end) = self->end_;
      if ((int)v13 < (int)end) {
        break;
      }
LABEL_41:
      [(JavaLangStringBuilder *)v12 appendWithCharArray:self->buf_ withInt:v13 withInt:(end - v13)];
    }
    uint64_t v15 = (int)v13;
    while (1)
    {
      buf = self->buf_;
      if (!buf) {
        JreThrowNullPointerException();
      }
      uint64_t size = buf->super.size_;
      if (v15 < 0 || v15 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v15);
      }
      int v18 = *((unsigned __int16 *)&buf->super.size_ + v15 + 2);
      if (v18 == 13 || v18 == 10)
      {
        [(JavaLangStringBuilder *)v12 appendWithCharArray:self->buf_ withInt:self->pos_ withInt:(v15 - self->pos_)];
        self->pos_ = v15 + 1;
        self->lastWasCR_ = v18 == 13;
        id lock = [(JavaLangStringBuilder *)v12 description];
      }
      if (v18 == 10 || v18 == 13) {
        break;
      }
      ++v15;
      uint64_t end = self->end_;
      if (v15 >= end)
      {
        uint64_t v13 = self->pos_;
        goto LABEL_41;
      }
    }
  }
  else
  {
    uint64_t v6 = pos;
    while (1)
    {
      uint64_t v7 = self->buf_;
      if (!v7) {
        JreThrowNullPointerException();
      }
      uint64_t v8 = v7->super.size_;
      if (v6 < 0 || v6 >= (int)v8) {
        IOSArray_throwOutOfBoundsWithMsg(v8, v6);
      }
      int v9 = *((unsigned __int16 *)&v7->super.size_ + v6 + 2);
      if (v9 == 13 || v9 == 10)
      {
        id lock = +[NSString stringWithCharacters:self->buf_ offset:self->pos_ length:(v6 - self->pos_)];
        self->pos_ = v6 + 1;
        self->lastWasCR_ = v9 == 13;
      }
      if (v9 == 10 || v9 == 13) {
        break;
      }
      ++v6;
      uint64_t v5 = self->end_;
      if (v6 >= v5)
      {
        int pos = self->pos_;
        goto LABEL_21;
      }
    }
  }
LABEL_45:
  objc_sync_exit(obj);
  return lock;
}

- (BOOL)ready
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  -[JavaIoBufferedReader checkNotClosed]_0((uint64_t)self);
  if (self->end_ - self->pos_ <= 0)
  {
    in = self->in_;
    if (!in) {
      JreThrowNullPointerException();
    }
    unsigned __int8 v4 = [(JavaIoReader *)in ready];
  }
  else
  {
    unsigned __int8 v4 = 1;
  }
  objc_sync_exit(lock);
  return v4;
}

- (void)reset
{
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  -[JavaIoBufferedReader checkNotClosed]_0((uint64_t)self);
  int mark = self->mark_;
  if (mark == -1)
  {
    uint64_t v5 = new_JavaIoIOException_initWithNSString_(@"Invalid mark");
    objc_exception_throw(v5);
  }
  self->pos_ = mark;
  self->lastWasCR_ = self->markedLastWasCR_;
  objc_sync_exit(lock);
}

- (int64_t)skipWithLong:(int64_t)a3
{
  int64_t v8 = a3;
  if (a3 < 0)
  {
    CFStringRef v17 = JreStrcat("$J", (uint64_t)a2, a3, v3, v4, v5, v6, v7, @"charCount < 0: ");
    int v18 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v17);
    objc_exception_throw(v18);
  }
  id lock = self->super.lock_;
  objc_sync_enter(lock);
  -[JavaIoBufferedReader checkNotClosed]_0((uint64_t)self);
  int end = self->end_;
  int pos = self->pos_;
  int64_t v13 = end - pos;
  int v14 = v8;
  if (v13 >= v8)
  {
LABEL_8:
    self->pos_ = pos + v14;
  }
  else
  {
    self->pos_ = end;
    while (sub_1001C8DD8((uint64_t)self) != -1)
    {
      int v15 = self->end_;
      int pos = self->pos_;
      int v14 = v8 - v13;
      if (v8 - v13 <= v15 - pos) {
        goto LABEL_8;
      }
      v13 += v15 - pos;
      self->pos_ = v15;
      if (v13 >= v8) {
        goto LABEL_10;
      }
    }
    int64_t v8 = v13;
  }
LABEL_10:
  objc_sync_exit(lock);
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoBufferedReader;
  [(JavaIoReader *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100424A30;
}

@end
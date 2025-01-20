@interface JavaIoByteArrayInputStream
+ (const)__metadata;
- (BOOL)markSupported;
- (JavaIoByteArrayInputStream)initWithByteArray:(id)a3;
- (JavaIoByteArrayInputStream)initWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)available;
- (int)read;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)skipWithLong:(int64_t)a3;
- (void)dealloc;
- (void)markWithInt:(int)a3;
- (void)reset;
@end

@implementation JavaIoByteArrayInputStream

- (JavaIoByteArrayInputStream)initWithByteArray:(id)a3
{
  return self;
}

- (JavaIoByteArrayInputStream)initWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (int)available
{
  objc_sync_enter(self);
  int v3 = self->count_ - self->pos_;
  objc_sync_exit(self);
  return v3;
}

- (void)markWithInt:(int)a3
{
  objc_sync_enter(self);
  self->mark_ = self->pos_;
  objc_sync_exit(self);
}

- (BOOL)markSupported
{
  return 1;
}

- (int)read
{
  objc_sync_enter(self);
  uint64_t pos = self->pos_;
  if ((int)pos >= self->count_)
  {
    int v6 = -1;
  }
  else
  {
    buf = self->buf_;
    if (!buf) {
      JreThrowNullPointerException();
    }
    self->pos_ = pos + 1;
    uint64_t size = buf->super.size_;
    if ((pos & 0x80000000) != 0 || (int)pos >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, pos);
    }
    int v6 = *((unsigned __int8 *)&buf->super.size_ + pos + 4);
  }
  objc_sync_exit(self);
  return v6;
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  LODWORD(v5) = a5;
  uint64_t v6 = *(void *)&a4;
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), v6, v5);
  uint64_t pos = self->pos_;
  int count = self->count_;
  BOOL v11 = __OFSUB__(count, pos);
  int v12 = count - pos;
  if ((v12 < 0) ^ v11 | (v12 == 0))
  {
    LODWORD(v5) = -1;
  }
  else if (v5)
  {
    if (v12 >= (int)v5) {
      uint64_t v5 = v5;
    }
    else {
      uint64_t v5 = v12;
    }
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->buf_, pos, a3, v6, v5);
    self->pos_ += v5;
  }
  objc_sync_exit(self);
  return v5;
}

- (void)reset
{
  objc_sync_enter(self);
  self->pos_ = self->mark_;
  objc_sync_exit(self);
}

- (int64_t)skipWithLong:(int64_t)a3
{
  objc_sync_enter(self);
  if (a3 < 1)
  {
    int64_t v7 = 0;
  }
  else
  {
    int pos = self->pos_;
    int count = self->count_;
    if (count - pos >= a3) {
      int count = pos + a3;
    }
    self->pos_ = count;
    int64_t v7 = count - pos;
  }
  objc_sync_exit(self);
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoByteArrayInputStream;
  [(JavaIoByteArrayInputStream *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100468C88;
}

@end
@interface JavaIoByteArrayOutputStream
+ (const)__metadata;
+ (id)__annotations_toStringWithInt_;
- (JavaIoByteArrayOutputStream)init;
- (JavaIoByteArrayOutputStream)initWithInt:(int)a3;
- (id)description;
- (id)toByteArray;
- (id)toStringWithInt:(int)a3;
- (id)toStringWithNSString:(id)a3;
- (int)size;
- (void)close;
- (void)dealloc;
- (void)expandWithInt:(int)a3;
- (void)reset;
- (void)writeToWithJavaIoOutputStream:(id)a3;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaIoByteArrayOutputStream

- (JavaIoByteArrayOutputStream)init
{
  return self;
}

- (JavaIoByteArrayOutputStream)initWithInt:(int)a3
{
  return self;
}

- (void)close
{
  v2.receiver = self;
  v2.super_class = (Class)JavaIoByteArrayOutputStream;
  [(JavaIoOutputStream *)&v2 close];
}

- (void)expandWithInt:(int)a3
{
}

- (void)reset
{
  objc_sync_enter(self);
  self->count_ = 0;
  objc_sync_exit(self);
}

- (int)size
{
  return self->count_;
}

- (id)toByteArray
{
  objc_sync_enter(self);
  v3 = +[IOSByteArray arrayWithLength:self->count_];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->buf_, 0, v3, 0, self->count_);
  objc_sync_exit(self);
  return v3;
}

- (id)description
{
  return +[NSString stringWithBytes:self->buf_ offset:0 length:self->count_];
}

- (id)toStringWithInt:(int)a3
{
  __int16 v3 = a3;
  v5 = +[IOSCharArray arrayWithLength:[(JavaIoByteArrayOutputStream *)self size]];
  if (v5->super.size_ >= 1)
  {
    uint64_t v6 = 0;
    __int16 v7 = v3 << 8;
    do
    {
      buf = self->buf_;
      if (!buf) {
        JreThrowNullPointerException();
      }
      uint64_t size = buf->super.size_;
      if (v6 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v6);
      }
      __int16 v10 = *((unsigned __int8 *)&buf->super.size_ + v6 + 4);
      uint64_t v11 = v5->super.size_;
      if (v6 >= v11) {
        IOSArray_throwOutOfBoundsWithMsg(v11, v6);
      }
      *((_WORD *)&v5->super.size_ + v6++ + 2) = v7 | v10;
    }
    while (v6 < v5->super.size_);
  }
  return +[NSString stringWithCharacters:v5];
}

- (id)toStringWithNSString:(id)a3
{
  return +[NSString stringWithBytes:self->buf_ offset:0 length:self->count_ charsetName:a3];
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), v6, v5);
  if (v5)
  {
    sub_10015DD08((id *)&self->super.super.isa, v5);
    JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(a3, v6, self->buf_, self->count_, v5);
    self->count_ += v5;
  }
  objc_sync_exit(self);
}

- (void)writeWithInt:(int)a3
{
  char v3 = a3;
  objc_sync_enter(self);
  buf = self->buf_;
  if (!buf) {
    JreThrowNullPointerException();
  }
  uint64_t count = self->count_;
  if (count == buf->super.size_)
  {
    sub_10015DD08((id *)&self->super.super.isa, 1);
    buf = self->buf_;
    uint64_t count = self->count_;
  }
  self->count_ = count + 1;
  uint64_t size = buf->super.size_;
  if ((count & 0x80000000) != 0 || (int)count >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, count);
  }
  *((unsigned char *)&buf->super.size_ + (int)count + 4) = v3;
  objc_sync_exit(self);
}

- (void)writeToWithJavaIoOutputStream:(id)a3
{
  objc_sync_enter(self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 writeWithByteArray:self->buf_ withInt:0 withInt:self->count_];
  objc_sync_exit(self);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoByteArrayOutputStream;
  [(JavaIoByteArrayOutputStream *)&v3 dealloc];
}

+ (id)__annotations_toStringWithInt_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003FB3B0;
}

@end
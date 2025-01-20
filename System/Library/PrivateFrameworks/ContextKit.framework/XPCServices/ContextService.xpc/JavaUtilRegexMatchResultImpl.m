@interface JavaUtilRegexMatchResultImpl
+ (const)__metadata;
- (JavaUtilRegexMatchResultImpl)initWithNSString:(id)a3 withIntArray:(id)a4;
- (id)group;
- (id)groupWithInt:(int)a3;
- (int)end;
- (int)endWithInt:(int)a3;
- (int)groupCount;
- (int)start;
- (int)startWithInt:(int)a3;
- (void)dealloc;
@end

@implementation JavaUtilRegexMatchResultImpl

- (JavaUtilRegexMatchResultImpl)initWithNSString:(id)a3 withIntArray:(id)a4
{
  return self;
}

- (int)end
{
  return [(JavaUtilRegexMatchResultImpl *)self endWithInt:0];
}

- (int)endWithInt:(int)a3
{
  offsets = self->offsets_;
  if (!offsets) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = (2 * a3) | 1;
  uint64_t size = offsets->super.size_;
  if (2 * a3 < 0 || (int)v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (2 * a3) | 1);
  }
  return *(&offsets->super.size_ + v4 + 1);
}

- (id)group
{
  text = self->text_;
  if (!text) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = [(JavaUtilRegexMatchResultImpl *)self start];
  uint64_t v5 = [(JavaUtilRegexMatchResultImpl *)self end];
  return [(NSString *)text substring:v4 endIndex:v5];
}

- (id)groupWithInt:(int)a3
{
  offsets = self->offsets_;
  if (!offsets) {
    goto LABEL_16;
  }
  int v5 = 2 * a3;
  uint64_t v6 = 2 * a3;
  uint64_t size = offsets->super.size_;
  if (2 * a3 < 0 || v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  v8 = offsets;
  uint64_t v9 = *((unsigned int *)&offsets->super.size_ + v6 + 1);
  uint64_t v10 = v6 | 1;
  if ((v6 & 0x80000000) != 0 || (int)v10 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6 | 1);
  }
  if (v9 == -1 || *(&v8->super.size_ + v10 + 1) == -1) {
    return 0;
  }
  text = self->text_;
  if (!text) {
LABEL_16:
  }
    JreThrowNullPointerException();
  return -[NSString substring:endIndex:](text, "substring:endIndex:", v9);
}

- (int)groupCount
{
  offsets = self->offsets_;
  if (!offsets) {
    JreThrowNullPointerException();
  }
  return offsets->super.size_ / 2 - 1;
}

- (int)start
{
  return [(JavaUtilRegexMatchResultImpl *)self startWithInt:0];
}

- (int)startWithInt:(int)a3
{
  offsets = self->offsets_;
  if (!offsets) {
    JreThrowNullPointerException();
  }
  int v4 = 2 * a3;
  uint64_t size = offsets->super.size_;
  if (2 * a3 < 0 || v4 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, (2 * a3));
  }
  return *(&offsets->super.size_ + v4 + 1);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilRegexMatchResultImpl;
  [(JavaUtilRegexMatchResultImpl *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1003F43A8;
}

@end
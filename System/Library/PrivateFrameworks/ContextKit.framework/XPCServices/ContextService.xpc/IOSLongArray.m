@interface IOSLongArray
+ (IOSLongArray)arrayWithLength:(unint64_t)a3;
+ (IOSLongArray)arrayWithLongs:(const int64_t *)a3 count:(unint64_t)a4;
+ (id)iosClass;
+ (id)newArrayWithLength:(unint64_t)a3;
+ (id)newArrayWithLongs:(const int64_t *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfElementAtIndex:(int)a3;
- (id)elementType;
- (int64_t)longAtIndex:(unint64_t)a3;
- (int64_t)longRefAtIndex:(unint64_t)a3;
- (int64_t)replaceLongAtIndex:(unint64_t)a3 withLong:(int64_t)a4;
- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6;
- (void)buffer;
- (void)getLongs:(int64_t *)a3 length:(unint64_t)a4;
@end

@implementation IOSLongArray

+ (id)newArrayWithLength:(unint64_t)a3
{
  return sub_10024A34C(a3);
}

+ (IOSLongArray)arrayWithLength:(unint64_t)a3
{
  v3 = sub_10024A34C(a3);
  return (IOSLongArray *)v3;
}

+ (id)newArrayWithLongs:(const int64_t *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_10024A34C(a4);
  memcpy(v6 + 4, a3, 8 * v4);
  return v6;
}

+ (IOSLongArray)arrayWithLongs:(const int64_t *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_10024A34C(a4);
  memcpy(v6 + 4, a3, 8 * v4);
  return (IOSLongArray *)v6;
}

- (int64_t)longAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return self->buffer_[a3];
}

- (int64_t)longRefAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return &self->buffer_[a3];
}

- (int64_t)replaceLongAtIndex:(unint64_t)a3 withLong:(int64_t)a4
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  self->buffer_[a3] = a4;
  return a4;
}

- (void)getLongs:(int64_t *)a3 length:(unint64_t)a4
{
  uint64_t size = self->super.size_;
  uint64_t v6 = (a4 - 1);
  if ((int)a4 - 1 < 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  memcpy(a3, self->buffer_, 8 * a4);
}

- (void)buffer
{
  return self->buffer_;
}

- (id)elementType
{
  return +[IOSClass longClass];
}

+ (id)iosClass
{
  id v2 = +[IOSClass longClass];
  return (id)IOSClass_arrayOf((uint64_t)v2);
}

- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6
{
  if ((a6 | a3) < 0 || a6 + a3 > self->super.size_) {
    IOSArray_throwOutOfBounds();
  }
  if ((a6 | a5) < 0 || a6 + a5 > *((_DWORD *)a4 + 2)) {
    IOSArray_throwOutOfBounds();
  }
  memmove((char *)a4 + 8 * a5 + 16, &self->buffer_[a3], 8 * a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[IOSLongArray newArrayWithLongs:self->buffer_ count:self->super.size_];
}

- (id)descriptionOfElementAtIndex:(int)a3
{
  return +[NSString stringWithFormat:@"%lld", self->buffer_[a3]];
}

@end
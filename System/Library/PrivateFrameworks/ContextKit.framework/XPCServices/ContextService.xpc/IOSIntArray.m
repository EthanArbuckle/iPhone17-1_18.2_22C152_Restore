@interface IOSIntArray
+ (IOSIntArray)arrayWithInts:(const int *)a3 count:(unint64_t)a4;
+ (IOSIntArray)arrayWithLength:(unint64_t)a3;
+ (id)iosClass;
+ (id)newArrayWithInts:(const int *)a3 count:(unint64_t)a4;
+ (id)newArrayWithLength:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfElementAtIndex:(int)a3;
- (id)elementType;
- (int)intAtIndex:(unint64_t)a3;
- (int)intRefAtIndex:(unint64_t)a3;
- (int)replaceIntAtIndex:(unint64_t)a3 withInt:(int)a4;
- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6;
- (void)buffer;
- (void)getInts:(int *)a3 length:(unint64_t)a4;
@end

@implementation IOSIntArray

+ (id)newArrayWithLength:(unint64_t)a3
{
  return sub_100249EE8(a3);
}

+ (IOSIntArray)arrayWithLength:(unint64_t)a3
{
  v3 = sub_100249EE8(a3);
  return (IOSIntArray *)v3;
}

+ (id)newArrayWithInts:(const int *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100249EE8(a4);
  memcpy(v6 + 3, a3, 4 * v4);
  return v6;
}

+ (IOSIntArray)arrayWithInts:(const int *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100249EE8(a4);
  memcpy(v6 + 3, a3, 4 * v4);
  return (IOSIntArray *)v6;
}

- (int)intAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return *(&self->super.size_ + a3 + 1);
}

- (int)intRefAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return &self->super.size_ + a3 + 1;
}

- (int)replaceIntAtIndex:(unint64_t)a3 withInt:(int)a4
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  *(&self->super.size_ + a3 + 1) = a4;
  return a4;
}

- (void)getInts:(int *)a3 length:(unint64_t)a4
{
  uint64_t size = self->super.size_;
  uint64_t v6 = (a4 - 1);
  if ((int)a4 - 1 < 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  memcpy(a3, &self->super.size_ + 1, 4 * a4);
}

- (void)buffer
{
  return &self->super.size_ + 1;
}

- (id)elementType
{
  return +[IOSClass intClass];
}

+ (id)iosClass
{
  id v2 = +[IOSClass intClass];
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
  memmove((char *)a4 + 4 * a5 + 12, &self->super.size_ + a3 + 1, 4 * a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[IOSIntArray newArrayWithInts:&self->super.size_ + 1 count:self->super.size_];
}

- (id)descriptionOfElementAtIndex:(int)a3
{
  return +[NSString stringWithFormat:@"%d", *((unsigned int *)&self->super.size_ + a3 + 1)];
}

@end
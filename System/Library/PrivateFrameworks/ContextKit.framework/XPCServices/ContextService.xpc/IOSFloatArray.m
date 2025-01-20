@interface IOSFloatArray
+ (IOSFloatArray)arrayWithFloats:(const float *)a3 count:(unint64_t)a4;
+ (IOSFloatArray)arrayWithLength:(unint64_t)a3;
+ (id)iosClass;
+ (id)newArrayWithFloats:(const float *)a3 count:(unint64_t)a4;
+ (id)newArrayWithLength:(unint64_t)a3;
- (float)floatAtIndex:(unint64_t)a3;
- (float)floatRefAtIndex:(unint64_t)a3;
- (float)replaceFloatAtIndex:(unint64_t)a3 withFloat:(float)result;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfElementAtIndex:(int)a3;
- (id)elementType;
- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6;
- (void)buffer;
- (void)getFloats:(float *)a3 length:(unint64_t)a4;
@end

@implementation IOSFloatArray

+ (id)newArrayWithLength:(unint64_t)a3
{
  return sub_10024A7B0(a3);
}

+ (IOSFloatArray)arrayWithLength:(unint64_t)a3
{
  v3 = sub_10024A7B0(a3);
  return (IOSFloatArray *)v3;
}

+ (id)newArrayWithFloats:(const float *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_10024A7B0(a4);
  memcpy(v6 + 3, a3, 4 * v4);
  return v6;
}

+ (IOSFloatArray)arrayWithFloats:(const float *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_10024A7B0(a4);
  memcpy(v6 + 3, a3, 4 * v4);
  return (IOSFloatArray *)v6;
}

- (float)floatAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return *((float *)&self->super.size_ + a3 + 1);
}

- (float)floatRefAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return (float *)(&self->super.size_ + a3 + 1);
}

- (float)replaceFloatAtIndex:(unint64_t)a3 withFloat:(float)result
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  *((float *)&self->super.size_ + a3 + 1) = result;
  return result;
}

- (void)getFloats:(float *)a3 length:(unint64_t)a4
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
  return +[IOSClass floatClass];
}

+ (id)iosClass
{
  id v2 = +[IOSClass floatClass];
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
  return +[IOSFloatArray newArrayWithFloats:&self->super.size_ + 1 count:self->super.size_];
}

- (id)descriptionOfElementAtIndex:(int)a3
{
  return +[NSString stringWithFormat:@"%g", *((float *)&self->super.size_ + a3 + 1)];
}

@end
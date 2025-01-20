@interface IOSShortArray
+ (IOSShortArray)arrayWithLength:(unint64_t)a3;
+ (IOSShortArray)arrayWithShorts:(const signed __int16 *)a3 count:(unint64_t)a4;
+ (id)iosClass;
+ (id)newArrayWithLength:(unint64_t)a3;
+ (id)newArrayWithShorts:(const signed __int16 *)a3 count:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfElementAtIndex:(int)a3;
- (id)elementType;
- (signed)replaceShortAtIndex:(unint64_t)a3 withShort:(signed __int16)a4;
- (signed)shortAtIndex:(unint64_t)a3;
- (signed)shortRefAtIndex:(unint64_t)a3;
- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6;
- (void)buffer;
- (void)getShorts:(signed __int16 *)a3 length:(unint64_t)a4;
@end

@implementation IOSShortArray

+ (id)newArrayWithLength:(unint64_t)a3
{
  return sub_100249A84(a3);
}

+ (IOSShortArray)arrayWithLength:(unint64_t)a3
{
  v3 = sub_100249A84(a3);
  return (IOSShortArray *)v3;
}

+ (id)newArrayWithShorts:(const signed __int16 *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100249A84(a4);
  memcpy(v6 + 3, a3, 2 * v4);
  return v6;
}

+ (IOSShortArray)arrayWithShorts:(const signed __int16 *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100249A84(a4);
  memcpy(v6 + 3, a3, 2 * v4);
  return (IOSShortArray *)v6;
}

- (signed)shortAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return *((_WORD *)&self->super.size_ + a3 + 2);
}

- (signed)shortRefAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return (signed __int16 *)&self->super.size_ + a3 + 2;
}

- (signed)replaceShortAtIndex:(unint64_t)a3 withShort:(signed __int16)a4
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  *((_WORD *)&self->super.size_ + a3 + 2) = a4;
  return a4;
}

- (void)getShorts:(signed __int16 *)a3 length:(unint64_t)a4
{
  uint64_t size = self->super.size_;
  uint64_t v6 = (a4 - 1);
  if ((int)a4 - 1 < 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  memcpy(a3, &self->super.size_ + 1, 2 * a4);
}

- (void)buffer
{
  return &self->super.size_ + 1;
}

- (id)elementType
{
  return +[IOSClass shortClass];
}

+ (id)iosClass
{
  id v2 = +[IOSClass shortClass];
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
  memmove((char *)a4 + 2 * a5 + 12, (char *)&self->super.size_ + 2 * a3 + 4, 2 * a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[IOSShortArray newArrayWithShorts:&self->super.size_ + 1 count:self->super.size_];
}

- (id)descriptionOfElementAtIndex:(int)a3
{
  return +[NSString stringWithFormat:@"%hi", *((__int16 *)&self->super.size_ + a3 + 2)];
}

@end
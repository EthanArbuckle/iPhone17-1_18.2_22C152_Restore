@interface IOSByteArray
+ (IOSByteArray)arrayWithBytes:(const char *)a3 count:(unint64_t)a4;
+ (IOSByteArray)arrayWithLength:(unint64_t)a3;
+ (IOSByteArray)arrayWithNSData:(id)a3;
+ (id)iosClass;
+ (id)newArrayWithBytes:(const char *)a3 count:(unint64_t)a4;
+ (id)newArrayWithLength:(unint64_t)a3;
- (char)byteAtIndex:(unint64_t)a3;
- (char)byteRefAtIndex:(unint64_t)a3;
- (char)replaceByteAtIndex:(unint64_t)a3 withByte:(char)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfElementAtIndex:(int)a3;
- (id)elementType;
- (id)toNSData;
- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6;
- (void)buffer;
- (void)getBytes:(char *)a3 length:(unint64_t)a4;
- (void)getBytes:(char *)a3 offset:(int)a4 length:(int)a5;
- (void)replaceBytes:(const char *)a3 length:(int)a4 offset:(int)a5;
@end

@implementation IOSByteArray

+ (id)newArrayWithLength:(unint64_t)a3
{
  return sub_100249478(a3);
}

+ (IOSByteArray)arrayWithLength:(unint64_t)a3
{
  v3 = sub_100249478(a3);
  return (IOSByteArray *)v3;
}

+ (id)newArrayWithBytes:(const char *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100249478(a4);
  memcpy(v6 + 3, a3, v4);
  return v6;
}

+ (IOSByteArray)arrayWithBytes:(const char *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100249478(a4);
  memcpy(v6 + 3, a3, v4);
  return (IOSByteArray *)v6;
}

- (char)byteAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return *((unsigned char *)&self->super.size_ + a3 + 4);
}

- (char)byteRefAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return (char *)&self->super.size_ + a3 + 4;
}

- (char)replaceByteAtIndex:(unint64_t)a3 withByte:(char)a4
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  *((unsigned char *)&self->super.size_ + a3 + 4) = a4;
  return a4;
}

- (void)getBytes:(char *)a3 length:(unint64_t)a4
{
  uint64_t size = self->super.size_;
  uint64_t v6 = (a4 - 1);
  if ((int)a4 - 1 < 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  memcpy(a3, &self->super.size_ + 1, a4);
}

- (void)buffer
{
  return &self->super.size_ + 1;
}

- (id)elementType
{
  return +[IOSClass byteClass];
}

+ (id)iosClass
{
  id v2 = +[IOSClass byteClass];
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
  memmove((char *)a4 + a5 + 12, (char *)&self->super.size_ + a3 + 4, a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[IOSByteArray newArrayWithBytes:&self->super.size_ + 1 count:self->super.size_];
}

+ (IOSByteArray)arrayWithNSData:(id)a3
{
  id v4 = [a3 length];
  v5 = sub_100249478(v4);
  uint64_t v6 = v5;
  if (v4) {
    [a3 getBytes:v5 + 3 length:v4];
  }
  return (IOSByteArray *)v6;
}

- (void)getBytes:(char *)a3 offset:(int)a4 length:(int)a5
{
  if ((a5 | a4) < 0 || a5 + a4 > self->super.size_) {
    IOSArray_throwOutOfBounds();
  }
  memcpy(a3, (char *)&self->super.size_ + a4 + 4, a5);
}

- (void)replaceBytes:(const char *)a3 length:(int)a4 offset:(int)a5
{
  if ((a5 | a4) < 0 || a5 + a4 > self->super.size_) {
    IOSArray_throwOutOfBounds();
  }
  v5 = (char *)&self->super.size_ + a5 + 4;
  memcpy(v5, a3, a4);
}

- (id)descriptionOfElementAtIndex:(int)a3
{
  return +[NSString stringWithFormat:@"0x%x", *((char *)&self->super.size_ + a3 + 4)];
}

- (id)toNSData
{
  return +[NSData dataWithBytes:&self->super.size_ + 1 length:self->super.size_];
}

@end
@interface IOSBooleanArray
+ (IOSBooleanArray)arrayWithBooleans:(const BOOL *)a3 count:(unint64_t)a4;
+ (IOSBooleanArray)arrayWithLength:(unint64_t)a3;
+ (id)iosClass;
+ (id)newArrayWithBooleans:(const BOOL *)a3 count:(unint64_t)a4;
+ (id)newArrayWithLength:(unint64_t)a3;
- (BOOL)BOOLeanAtIndex:(unint64_t)a3;
- (BOOL)BOOLeanRefAtIndex:(unint64_t)a3;
- (BOOL)replaceBooleanAtIndex:(unint64_t)a3 withBoolean:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfElementAtIndex:(int)a3;
- (id)elementType;
- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6;
- (void)buffer;
- (void)getBooleans:(BOOL *)a3 length:(unint64_t)a4;
@end

@implementation IOSBooleanArray

+ (id)newArrayWithLength:(unint64_t)a3
{
  return sub_100248B28(a3);
}

+ (IOSBooleanArray)arrayWithLength:(unint64_t)a3
{
  v3 = sub_100248B28(a3);
  return (IOSBooleanArray *)v3;
}

+ (id)newArrayWithBooleans:(const BOOL *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100248B28(a4);
  memcpy(v6 + 3, a3, v4);
  return v6;
}

+ (IOSBooleanArray)arrayWithBooleans:(const BOOL *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100248B28(a4);
  memcpy(v6 + 3, a3, v4);
  return (IOSBooleanArray *)v6;
}

- (BOOL)BOOLeanAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return *((unsigned char *)&self->super.size_ + a3 + 4);
}

- (BOOL)BOOLeanRefAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return (BOOL *)&self->super.size_ + a3 + 4;
}

- (BOOL)replaceBooleanAtIndex:(unint64_t)a3 withBoolean:(BOOL)a4
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  *((unsigned char *)&self->super.size_ + a3 + 4) = a4;
  return a4;
}

- (void)getBooleans:(BOOL *)a3 length:(unint64_t)a4
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
  return +[IOSClass BOOLeanClass];
}

+ (id)iosClass
{
  id v2 = +[IOSClass BOOLeanClass];
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
  return +[IOSBooleanArray newArrayWithBooleans:&self->super.size_ + 1 count:self->super.size_];
}

- (id)descriptionOfElementAtIndex:(int)a3
{
  if (*((unsigned char *)&self->super.size_ + a3 + 4)) {
    CFStringRef v3 = @"true";
  }
  else {
    CFStringRef v3 = @"false";
  }
  return +[NSString stringWithFormat:@"%@", v3];
}

@end
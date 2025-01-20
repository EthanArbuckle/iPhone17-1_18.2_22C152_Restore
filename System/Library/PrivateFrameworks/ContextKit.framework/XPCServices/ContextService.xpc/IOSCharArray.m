@interface IOSCharArray
+ (IOSCharArray)arrayWithChars:(const unsigned __int16 *)a3 count:(unint64_t)a4;
+ (IOSCharArray)arrayWithLength:(unint64_t)a3;
+ (IOSCharArray)arrayWithNSString:(id)a3;
+ (id)iosClass;
+ (id)newArrayWithChars:(const unsigned __int16 *)a3 count:(unint64_t)a4;
+ (id)newArrayWithLength:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfElementAtIndex:(int)a3;
- (id)elementType;
- (unsigned)charAtIndex:(unint64_t)a3;
- (unsigned)charRefAtIndex:(unint64_t)a3;
- (unsigned)replaceCharAtIndex:(unint64_t)a3 withChar:(unsigned __int16)a4;
- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6;
- (void)buffer;
- (void)getChars:(unsigned __int16 *)a3 length:(unint64_t)a4;
@end

@implementation IOSCharArray

+ (id)newArrayWithLength:(unint64_t)a3
{
  return sub_100248FA4(a3);
}

+ (IOSCharArray)arrayWithLength:(unint64_t)a3
{
  v3 = sub_100248FA4(a3);
  return (IOSCharArray *)v3;
}

+ (id)newArrayWithChars:(const unsigned __int16 *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100248FA4(a4);
  memcpy(v6 + 3, a3, 2 * v4);
  return v6;
}

+ (IOSCharArray)arrayWithChars:(const unsigned __int16 *)a3 count:(unint64_t)a4
{
  int v4 = a4;
  v6 = sub_100248FA4(a4);
  memcpy(v6 + 3, a3, 2 * v4);
  return (IOSCharArray *)v6;
}

- (unsigned)charAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return *((_WORD *)&self->super.size_ + a3 + 2);
}

- (unsigned)charRefAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return (unsigned __int16 *)&self->super.size_ + a3 + 2;
}

- (unsigned)replaceCharAtIndex:(unint64_t)a3 withChar:(unsigned __int16)a4
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  *((_WORD *)&self->super.size_ + a3 + 2) = a4;
  return a4;
}

- (void)getChars:(unsigned __int16 *)a3 length:(unint64_t)a4
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
  return +[IOSClass charClass];
}

+ (id)iosClass
{
  id v2 = +[IOSClass charClass];
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
  return +[IOSCharArray newArrayWithChars:&self->super.size_ + 1 count:self->super.size_];
}

+ (IOSCharArray)arrayWithNSString:(id)a3
{
  id v4 = [a3 length];
  v5 = sub_100248FA4(v4);
  uint64_t v6 = v5;
  if (v4) {
    objc_msgSend(a3, "getCharacters:range:", v5 + 3, 0, v4);
  }
  return (IOSCharArray *)v6;
}

- (id)descriptionOfElementAtIndex:(int)a3
{
  return +[NSString stringWithFormat:@"%C", *((unsigned __int16 *)&self->super.size_ + a3 + 2)];
}

@end
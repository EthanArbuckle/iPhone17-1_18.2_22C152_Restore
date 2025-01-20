@interface JavaIoInputStream
+ (const)__metadata;
- (BOOL)markSupported;
- (int)available;
- (int)read;
- (int)readWithByteArray:(id)a3;
- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int64_t)skipWithLong:(int64_t)a3;
- (void)reset;
@end

@implementation JavaIoInputStream

- (int)available
{
  return 0;
}

- (BOOL)markSupported
{
  return 0;
}

- (int)read
{
  return 0;
}

- (int)readWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaIoInputStream *)self readWithByteArray:a3 withInt:0 withInt:v3];
}

- (int)readWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v9 = a5;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if (a5 > 0)
  {
    uint64_t v10 = 0;
    uint64_t v11 = a4;
    while (1)
    {
      unsigned int v12 = [(JavaIoInputStream *)self read];
      char v13 = v12;
      if (v12 == -1) {
        break;
      }
      int v14 = v11 + v10;
      uint64_t v15 = *((unsigned int *)a3 + 2);
      if (v11 + v10 < 0 || v14 >= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v15, v11 + v10);
      }
      *((unsigned char *)a3 + v14 + 12) = v13;
      if (v9 == ++v10) {
        return v9;
      }
    }
    if (v10) {
      LODWORD(v9) = v10;
    }
    else {
      LODWORD(v9) = -1;
    }
  }
  return v9;
}

- (void)reset
{
  objc_sync_enter(self);
  v2 = new_JavaIoIOException_init();
  objc_exception_throw(v2);
}

- (int64_t)skipWithLong:(int64_t)a3
{
  return LibcoreIoStreams_skipByReadingWithJavaIoInputStream_withLong_(self, a3);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004633F0;
}

@end
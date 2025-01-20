@interface JavaIoOutputStream
+ (const)__metadata;
- (BOOL)checkError;
- (void)writeWithByteArray:(id)a3;
- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)writeWithInt:(int)a3;
@end

@implementation JavaIoOutputStream

- (void)writeWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  [(JavaIoOutputStream *)self writeWithByteArray:a3 withInt:0 withInt:v3];
}

- (void)writeWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = a5;
  LODWORD(v6) = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if (v5 + (int)v6 > (int)v6)
  {
    uint64_t v6 = (int)v6;
    do
    {
      uint64_t v9 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v6);
      }
      [(JavaIoOutputStream *)self writeWithInt:*((char *)a3 + v6++ + 12)];
      --v5;
    }
    while (v5);
  }
}

- (void)writeWithInt:(int)a3
{
}

- (BOOL)checkError
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10048A568;
}

@end
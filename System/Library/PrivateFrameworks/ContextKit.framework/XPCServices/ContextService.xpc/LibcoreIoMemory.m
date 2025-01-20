@interface LibcoreIoMemory
+ (char)peekByteWithLong:(int64_t)a3;
+ (const)__metadata;
+ (int)peekIntNativeWithLong:(int64_t)a3;
+ (int)peekIntWithByteArray:(id)a3 withInt:(int)a4 withJavaNioByteOrder:(id)a5;
+ (int)peekIntWithLong:(int64_t)a3 withBoolean:(BOOL)a4;
+ (int64_t)peekLongNativeWithLong:(int64_t)a3;
+ (int64_t)peekLongWithByteArray:(id)a3 withInt:(int)a4 withJavaNioByteOrder:(id)a5;
+ (int64_t)peekLongWithLong:(int64_t)a3 withBoolean:(BOOL)a4;
+ (signed)peekShortNativeWithLong:(int64_t)a3;
+ (signed)peekShortWithByteArray:(id)a3 withInt:(int)a4 withJavaNioByteOrder:(id)a5;
+ (signed)peekShortWithLong:(int64_t)a3 withBoolean:(BOOL)a4;
+ (void)memmoveWithId:(id)a3 withInt:(int)a4 withId:(id)a5 withInt:(int)a6 withLong:(int64_t)a7;
+ (void)peekByteArrayWithLong:(int64_t)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)peekCharArrayWithLong:(int64_t)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)peekDoubleArrayWithLong:(int64_t)a3 withDoubleArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)peekFloatArrayWithLong:(int64_t)a3 withFloatArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)peekIntArrayWithLong:(int64_t)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)peekLongArrayWithLong:(int64_t)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)peekShortArrayWithLong:(int64_t)a3 withShortArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)pokeByteArrayWithLong:(int64_t)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
+ (void)pokeByteWithLong:(int64_t)a3 withByte:(char)a4;
+ (void)pokeCharArrayWithLong:(int64_t)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)pokeDoubleArrayWithLong:(int64_t)a3 withDoubleArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)pokeFloatArrayWithLong:(int64_t)a3 withFloatArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)pokeIntArrayWithLong:(int64_t)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)pokeIntNativeWithLong:(int64_t)a3 withInt:(int)a4;
+ (void)pokeIntWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaNioByteOrder:(id)a6;
+ (void)pokeIntWithLong:(int64_t)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
+ (void)pokeLongArrayWithLong:(int64_t)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)pokeLongNativeWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (void)pokeLongWithByteArray:(id)a3 withInt:(int)a4 withLong:(int64_t)a5 withJavaNioByteOrder:(id)a6;
+ (void)pokeLongWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5;
+ (void)pokeShortArrayWithLong:(int64_t)a3 withShortArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
+ (void)pokeShortNativeWithLong:(int64_t)a3 withShort:(signed __int16)a4;
+ (void)pokeShortWithByteArray:(id)a3 withInt:(int)a4 withShort:(signed __int16)a5 withJavaNioByteOrder:(id)a6;
+ (void)pokeShortWithLong:(int64_t)a3 withShort:(signed __int16)a4 withBoolean:(BOOL)a5;
@end

@implementation LibcoreIoMemory

+ (int)peekIntWithByteArray:(id)a3 withInt:(int)a4 withJavaNioByteOrder:(id)a5
{
  return LibcoreIoMemory_peekIntWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5);
}

+ (int64_t)peekLongWithByteArray:(id)a3 withInt:(int)a4 withJavaNioByteOrder:(id)a5
{
  return LibcoreIoMemory_peekLongWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5);
}

+ (signed)peekShortWithByteArray:(id)a3 withInt:(int)a4 withJavaNioByteOrder:(id)a5
{
  return LibcoreIoMemory_peekShortWithByteArray_withInt_withJavaNioByteOrder_((uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5);
}

+ (void)pokeIntWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaNioByteOrder:(id)a6
{
}

+ (void)pokeLongWithByteArray:(id)a3 withInt:(int)a4 withLong:(int64_t)a5 withJavaNioByteOrder:(id)a6
{
}

+ (void)pokeShortWithByteArray:(id)a3 withInt:(int)a4 withShort:(signed __int16)a5 withJavaNioByteOrder:(id)a6
{
}

+ (void)memmoveWithId:(id)a3 withInt:(int)a4 withId:(id)a5 withInt:(int)a6 withLong:(int64_t)a7
{
}

+ (char)peekByteWithLong:(int64_t)a3
{
  return *(unsigned char *)a3;
}

+ (int)peekIntWithLong:(int64_t)a3 withBoolean:(BOOL)a4
{
  int result = *(_DWORD *)a3;
  if (a4) {
    return JavaLangInteger_reverseBytesWithInt_(result);
  }
  return result;
}

+ (int)peekIntNativeWithLong:(int64_t)a3
{
  return *(_DWORD *)a3;
}

+ (int64_t)peekLongWithLong:(int64_t)a3 withBoolean:(BOOL)a4
{
  int64_t result = *(void *)a3;
  if (a4) {
    return JavaLangLong_reverseBytesWithLong_(result);
  }
  return result;
}

+ (int64_t)peekLongNativeWithLong:(int64_t)a3
{
  return *(void *)a3;
}

+ (signed)peekShortWithLong:(int64_t)a3 withBoolean:(BOOL)a4
{
  unsigned int v4 = *(__int16 *)a3;
  if (a4) {
    LOWORD(v4) = JavaLangShort_reverseBytesWithShort_(v4);
  }
  return v4;
}

+ (signed)peekShortNativeWithLong:(int64_t)a3
{
  return *(_WORD *)a3;
}

+ (void)peekByteArrayWithLong:(int64_t)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (void)peekCharArrayWithLong:(int64_t)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)peekDoubleArrayWithLong:(int64_t)a3 withDoubleArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)peekFloatArrayWithLong:(int64_t)a3 withFloatArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)peekIntArrayWithLong:(int64_t)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)peekLongArrayWithLong:(int64_t)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)peekShortArrayWithLong:(int64_t)a3 withShortArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)pokeByteWithLong:(int64_t)a3 withByte:(char)a4
{
  *(unsigned char *)a3 = a4;
}

+ (void)pokeIntWithLong:(int64_t)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  int v5 = a4;
  if (a5) {
    int v5 = JavaLangInteger_reverseBytesWithInt_(a4);
  }
  *(_DWORD *)a3 = v5;
}

+ (void)pokeIntNativeWithLong:(int64_t)a3 withInt:(int)a4
{
  *(_DWORD *)a3 = a4;
}

+ (void)pokeLongWithLong:(int64_t)a3 withLong:(int64_t)a4 withBoolean:(BOOL)a5
{
  unint64_t v5 = a4;
  if (a5) {
    unint64_t v5 = JavaLangLong_reverseBytesWithLong_(a4);
  }
  *(void *)a3 = v5;
}

+ (void)pokeLongNativeWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  *(void *)a3 = a4;
}

+ (void)pokeShortWithLong:(int64_t)a3 withShort:(signed __int16)a4 withBoolean:(BOOL)a5
{
  __int16 v5 = a4;
  if (a5) {
    __int16 v5 = JavaLangShort_reverseBytesWithShort_(a4);
  }
  *(_WORD *)a3 = v5;
}

+ (void)pokeShortNativeWithLong:(int64_t)a3 withShort:(signed __int16)a4
{
  *(_WORD *)a3 = a4;
}

+ (void)pokeByteArrayWithLong:(int64_t)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

+ (void)pokeCharArrayWithLong:(int64_t)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)pokeDoubleArrayWithLong:(int64_t)a3 withDoubleArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)pokeFloatArrayWithLong:(int64_t)a3 withFloatArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)pokeIntArrayWithLong:(int64_t)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)pokeLongArrayWithLong:(int64_t)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (void)pokeShortArrayWithLong:(int64_t)a3 withShortArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046B640;
}

@end
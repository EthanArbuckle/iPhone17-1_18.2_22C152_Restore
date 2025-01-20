@interface JavaNioMemoryBlock
+ (const)__metadata;
+ (id)allocateWithInt:(int)a3;
+ (id)mmapWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withJavaNioChannelsFileChannel_MapMode:(id)a6;
+ (id)wrapFromJniWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (JavaNioMemoryBlock)initWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (char)peekByteWithInt:(int)a3;
- (id)array;
- (id)description;
- (int)peekIntWithInt:(int)a3 withJavaNioByteOrder:(id)a4;
- (int64_t)getSize;
- (int64_t)peekLongWithInt:(int)a3 withJavaNioByteOrder:(id)a4;
- (int64_t)toLong;
- (signed)peekShortWithInt:(int)a3 withJavaNioByteOrder:(id)a4;
- (void)peekByteArrayWithInt:(int)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)peekCharArrayWithInt:(int)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)peekDoubleArrayWithInt:(int)a3 withDoubleArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)peekFloatArrayWithInt:(int)a3 withFloatArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)peekIntArrayWithInt:(int)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)peekLongArrayWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)peekShortArrayWithInt:(int)a3 withShortArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)pokeByteArrayWithInt:(int)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)pokeByteWithInt:(int)a3 withByte:(char)a4;
- (void)pokeCharArrayWithInt:(int)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)pokeDoubleArrayWithInt:(int)a3 withDoubleArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)pokeFloatArrayWithInt:(int)a3 withFloatArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)pokeIntArrayWithInt:(int)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)pokeIntWithInt:(int)a3 withInt:(int)a4 withJavaNioByteOrder:(id)a5;
- (void)pokeLongArrayWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)pokeLongWithInt:(int)a3 withLong:(int64_t)a4 withJavaNioByteOrder:(id)a5;
- (void)pokeShortArrayWithInt:(int)a3 withShortArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7;
- (void)pokeShortWithInt:(int)a3 withShort:(signed __int16)a4 withJavaNioByteOrder:(id)a5;
@end

@implementation JavaNioMemoryBlock

+ (id)mmapWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withJavaNioChannelsFileChannel_MapMode:(id)a6
{
  return JavaNioMemoryBlock_mmapWithJavaIoFileDescriptor_withLong_withLong_withJavaNioChannelsFileChannel_MapMode_((uint64_t)a3, a4, a5, (uint64_t)a6, a5, (uint64_t)a6, v6, v7);
}

+ (id)allocateWithInt:(int)a3
{
  return JavaNioMemoryBlock_allocateWithInt_(a3);
}

+ (id)wrapFromJniWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  uint64_t v6 = [JavaNioMemoryBlock_UnmanagedBlock alloc];
  v6->super.address_ = a3;
  v6->super.size_ = a4;
  return v6;
}

- (JavaNioMemoryBlock)initWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  self->address_ = a3;
  self->size_ = a4;
  return self;
}

- (id)array
{
  return 0;
}

- (void)pokeByteWithInt:(int)a3 withByte:(char)a4
{
}

- (void)pokeByteArrayWithInt:(int)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

- (void)pokeCharArrayWithInt:(int)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)pokeDoubleArrayWithInt:(int)a3 withDoubleArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)pokeFloatArrayWithInt:(int)a3 withFloatArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)pokeIntArrayWithInt:(int)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)pokeLongArrayWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)pokeShortArrayWithInt:(int)a3 withShortArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (char)peekByteWithInt:(int)a3
{
  return LibcoreIoMemory_peekByteWithLong_((char *)(self->address_ + a3));
}

- (void)peekByteArrayWithInt:(int)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
}

- (void)peekCharArrayWithInt:(int)a3 withCharArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)peekDoubleArrayWithInt:(int)a3 withDoubleArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)peekFloatArrayWithInt:(int)a3 withFloatArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)peekIntArrayWithInt:(int)a3 withIntArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)peekLongArrayWithInt:(int)a3 withLongArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)peekShortArrayWithInt:(int)a3 withShortArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withBoolean:(BOOL)a7
{
}

- (void)pokeShortWithInt:(int)a3 withShort:(signed __int16)a4 withJavaNioByteOrder:(id)a5
{
  if (!a5) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = self->address_ + a3;
  int v6 = *((unsigned __int8 *)a5 + 8);
  LibcoreIoMemory_pokeShortWithLong_withShort_withBoolean_(v5, a4, v6);
}

- (signed)peekShortWithInt:(int)a3 withJavaNioByteOrder:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  v4 = (__int16 *)(self->address_ + a3);
  int v5 = *((unsigned __int8 *)a4 + 8);
  return LibcoreIoMemory_peekShortWithLong_withBoolean_(v4, v5);
}

- (void)pokeIntWithInt:(int)a3 withInt:(int)a4 withJavaNioByteOrder:(id)a5
{
  if (!a5) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = self->address_ + a3;
  int v6 = *((unsigned __int8 *)a5 + 8);
  LibcoreIoMemory_pokeIntWithLong_withInt_withBoolean_(v5, a4, v6);
}

- (int)peekIntWithInt:(int)a3 withJavaNioByteOrder:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  v4 = (unsigned int *)(self->address_ + a3);
  int v5 = *((unsigned __int8 *)a4 + 8);
  return LibcoreIoMemory_peekIntWithLong_withBoolean_(v4, v5);
}

- (void)pokeLongWithInt:(int)a3 withLong:(int64_t)a4 withJavaNioByteOrder:(id)a5
{
  if (!a5) {
    JreThrowNullPointerException();
  }
  unint64_t v5 = self->address_ + a3;
  int v6 = *((unsigned __int8 *)a5 + 8);
  LibcoreIoMemory_pokeLongWithLong_withLong_withBoolean_(v5, a4, v6);
}

- (int64_t)peekLongWithInt:(int)a3 withJavaNioByteOrder:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  v4 = (unint64_t *)(self->address_ + a3);
  int v5 = *((unsigned __int8 *)a4 + 8);
  return LibcoreIoMemory_peekLongWithLong_withBoolean_(v4, v5);
}

- (int64_t)toLong
{
  return self->address_;
}

- (id)description
{
  id v2 = objc_msgSend(-[JavaNioMemoryBlock getClass](self, "getClass"), "getName");
  return (id)JreStrcat("$CJC", v3, v4, v5, v6, v7, v8, v9, v2);
}

- (int64_t)getSize
{
  return self->size_;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004235C8;
}

@end
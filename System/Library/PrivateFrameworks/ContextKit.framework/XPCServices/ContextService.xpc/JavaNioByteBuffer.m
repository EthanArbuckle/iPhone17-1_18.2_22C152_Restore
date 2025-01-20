@interface JavaNioByteBuffer
+ (const)__metadata;
+ (id)allocateDirectWithInt:(int)a3;
+ (id)allocateWithInt:(int)a3;
+ (id)wrapWithByteArray:(id)a3;
+ (id)wrapWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (BOOL)hasArray;
- (BOOL)isDirect;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)protectedHasArray;
- (JavaNioByteBuffer)initWithInt:(int)a3 withLong:(int64_t)a4;
- (char)get;
- (char)getWithInt:(int)a3;
- (double)getDouble;
- (double)getDoubleWithInt:(int)a3;
- (float)getFloat;
- (float)getFloatWithInt:(int)a3;
- (id)asCharBuffer;
- (id)asDoubleBuffer;
- (id)asFloatBuffer;
- (id)asIntBuffer;
- (id)asLongBuffer;
- (id)asReadOnlyBuffer;
- (id)asShortBuffer;
- (id)compact;
- (id)duplicate;
- (id)getWithByteArray:(id)a3;
- (id)getWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)order;
- (id)orderWithJavaNioByteOrder:(id)a3;
- (id)protectedArray;
- (id)putCharWithChar:(unsigned __int16)a3;
- (id)putCharWithInt:(int)a3 withChar:(unsigned __int16)a4;
- (id)putDoubleWithDouble:(double)a3;
- (id)putDoubleWithInt:(int)a3 withDouble:(double)a4;
- (id)putFloatWithFloat:(float)a3;
- (id)putFloatWithInt:(int)a3 withFloat:(float)a4;
- (id)putIntWithInt:(int)a3;
- (id)putIntWithInt:(int)a3 withInt:(int)a4;
- (id)putLongWithInt:(int)a3 withLong:(int64_t)a4;
- (id)putLongWithLong:(int64_t)a3;
- (id)putShortWithInt:(int)a3 withShort:(signed __int16)a4;
- (id)putShortWithShort:(signed __int16)a3;
- (id)putWithByte:(char)a3;
- (id)putWithByteArray:(id)a3;
- (id)putWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)putWithInt:(int)a3 withByte:(char)a4;
- (id)putWithJavaNioByteBuffer:(id)a3;
- (id)slice;
- (int)arrayOffset;
- (int)compareToWithId:(id)a3;
- (int)getInt;
- (int)getIntWithInt:(int)a3;
- (int)protectedArrayOffset;
- (int64_t)getLong;
- (int64_t)getLongWithInt:(int)a3;
- (signed)getShort;
- (signed)getShortWithInt:(int)a3;
- (unint64_t)hash;
- (unsigned)getChar;
- (unsigned)getCharWithInt:(int)a3;
- (void)dealloc;
@end

@implementation JavaNioByteBuffer

+ (id)allocateWithInt:(int)a3
{
  return JavaNioByteBuffer_allocateWithInt_(a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (id)allocateDirectWithInt:(int)a3
{
  return JavaNioByteBuffer_allocateDirectWithInt_(*(uint64_t *)&a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (id)wrapWithByteArray:(id)a3
{
  uint64_t v3 = new_JavaNioByteArrayBuffer_initWithByteArray_(a3);
  return v3;
}

+ (id)wrapWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaNioByteBuffer_wrapWithByteArray_withInt_withInt_(a3, a4, a5);
}

- (JavaNioByteBuffer)initWithInt:(int)a3 withLong:(int64_t)a4
{
  JavaNioByteBuffer_initWithInt_withLong_((uint64_t)self, *(uint64_t *)&a3, a4, a4, v4, v5, v6, v7);
  return self;
}

- (int)arrayOffset
{
  return [(JavaNioByteBuffer *)self protectedArrayOffset];
}

- (id)asCharBuffer
{
  return 0;
}

- (id)asDoubleBuffer
{
  return 0;
}

- (id)asFloatBuffer
{
  return 0;
}

- (id)asIntBuffer
{
  return 0;
}

- (id)asLongBuffer
{
  return 0;
}

- (id)asReadOnlyBuffer
{
  return 0;
}

- (id)asShortBuffer
{
  return 0;
}

- (id)compact
{
  return 0;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3)
  {
    [(JavaNioBuffer *)self remaining];
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int v5 = [(JavaNioBuffer *)self remaining];
  if (v5 >= (int)[a3 remaining]) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = self;
  }
  int v7 = [v6 remaining];
  if (v7 < 1)
  {
LABEL_10:
    unsigned int v13 = [(JavaNioBuffer *)self remaining];
    return v13 - [a3 remaining];
  }
  else
  {
    uint64_t v8 = *((unsigned int *)a3 + 5);
    uint64_t position = self->super.position_;
    int v10 = v7 + 1;
    while (1)
    {
      signed int v11 = [(JavaNioByteBuffer *)self getWithInt:position];
      signed int v12 = [a3 getWithInt:v8];
      if (v11 != v12) {
        break;
      }
      uint64_t position = (position + 1);
      uint64_t v8 = (v8 + 1);
      if (--v10 <= 1) {
        goto LABEL_10;
      }
    }
    if (v11 < v12) {
      return -1;
    }
    else {
      return 1;
    }
  }
}

- (id)duplicate
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3)
  {
    [(JavaNioBuffer *)self remaining];
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  unsigned int v5 = [(JavaNioBuffer *)self remaining];
  if (v5 != [a3 remaining]) {
    return 0;
  }
  int position = self->super.position_;
  uint64_t v7 = *((unsigned int *)a3 + 5);
  do
  {
    int limit = self->super.limit_;
    BOOL v9 = position >= limit;
    if (position >= limit) {
      break;
    }
    int v10 = position + 1;
    unsigned int v11 = -[JavaNioByteBuffer getWithInt:](self, "getWithInt:");
    unsigned int v12 = [a3 getWithInt:v7];
    uint64_t v7 = (v7 + 1);
    int position = v10;
  }
  while (v11 == v12);
  return v9;
}

- (char)get
{
  return 0;
}

- (id)getWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioByteBuffer *)self getWithByteArray:a3 withInt:0 withInt:v3];
}

- (id)getWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = a5;
  LODWORD(v6) = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if ([(JavaNioBuffer *)self remaining] < v5)
  {
    unsigned int v12 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v12);
  }
  if (v5 + (int)v6 > (int)v6)
  {
    uint64_t v6 = (int)v6;
    do
    {
      unsigned __int8 v9 = [(JavaNioByteBuffer *)self get];
      uint64_t v10 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v6);
      }
      *((unsigned char *)a3 + v6++ + 12) = v9;
      --v5;
    }
    while (v5);
  }
  return self;
}

- (char)getWithInt:(int)a3
{
  return 0;
}

- (unsigned)getChar
{
  return 0;
}

- (unsigned)getCharWithInt:(int)a3
{
  return 0;
}

- (double)getDouble
{
  return 0.0;
}

- (double)getDoubleWithInt:(int)a3
{
  return 0.0;
}

- (float)getFloat
{
  return 0.0;
}

- (float)getFloatWithInt:(int)a3
{
  return 0.0;
}

- (int)getInt
{
  return 0;
}

- (int)getIntWithInt:(int)a3
{
  return 0;
}

- (int64_t)getLong
{
  return 0;
}

- (int64_t)getLongWithInt:(int)a3
{
  return 0;
}

- (signed)getShort
{
  return 0;
}

- (signed)getShortWithInt:(int)a3
{
  return 0;
}

- (BOOL)hasArray
{
  return [(JavaNioByteBuffer *)self protectedHasArray];
}

- (unint64_t)hash
{
  int position = self->super.position_;
  if (position >= self->super.limit_) {
    return 0;
  }
  int v4 = 0;
  do
  {
    int v5 = position + 1;
    v4 += -[JavaNioByteBuffer getWithInt:](self, "getWithInt:");
    int position = v5;
  }
  while (v5 < self->super.limit_);
  return v4;
}

- (BOOL)isDirect
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

- (id)order
{
  return self->order_;
}

- (id)orderWithJavaNioByteOrder:(id)a3
{
  id v3 = a3;
  if (!a3)
  {
    if ((atomic_load_explicit(JavaNioByteOrder__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    id v3 = (id)JavaNioByteOrder_LITTLE_ENDIAN__;
  }
  JreStrongAssign((id *)&self->order_, v3);
  return self;
}

- (id)protectedArray
{
  return 0;
}

- (int)protectedArrayOffset
{
  return 0;
}

- (BOOL)protectedHasArray
{
  return 0;
}

- (id)putWithByte:(char)a3
{
  return 0;
}

- (id)putWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioByteBuffer *)self putWithByteArray:a3 withInt:0 withInt:v3];
}

- (id)putWithByteArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = a5;
  LODWORD(v6) = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if ([(JavaNioBuffer *)self remaining] < v5)
  {
    unsigned int v11 = new_JavaNioBufferOverflowException_init();
    objc_exception_throw(v11);
  }
  if (v5 + (int)v6 > (int)v6)
  {
    uint64_t v6 = (int)v6;
    do
    {
      uint64_t v9 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v6);
      }
      [(JavaNioByteBuffer *)self putWithByte:*((char *)a3 + v6++ + 12)];
      --v5;
    }
    while (v5);
  }
  return self;
}

- (id)putWithJavaNioByteBuffer:(id)a3
{
  if ([(JavaNioBuffer *)self isReadOnly])
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_18;
  }
  if (a3 == self)
  {
    OnlyBufferException_init = new_JavaLangIllegalArgumentException_initWithNSString_(@"src == this");
    goto LABEL_18;
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = [a3 remaining];
  if (v5 > [(JavaNioBuffer *)self remaining])
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_18:
    objc_exception_throw(OnlyBufferException_init);
  }
  uint64_t v6 = (uint64_t)a3;
  if (([a3 isDirect] & 1) == 0) {
    uint64_t v6 = JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)a3);
  }
  int v7 = [a3 position];
  if (([a3 isDirect] & 1) == 0) {
    v7 += JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)a3);
  }
  uint64_t v8 = (uint64_t)self;
  if (![(JavaNioByteBuffer *)self isDirect]) {
    uint64_t v8 = JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)self);
  }
  int v9 = [(JavaNioBuffer *)self position];
  if (![(JavaNioByteBuffer *)self isDirect]) {
    v9 += JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)self);
  }
  LibcoreIoMemory_memmoveWithId_withInt_withId_withInt_withLong_(v8, v9, v6, v7, v5);
  objc_msgSend(a3, "positionWithInt:", objc_msgSend(a3, "limit"));
  [(JavaNioBuffer *)self positionWithInt:[(JavaNioBuffer *)self position] + v5];
  return self;
}

- (id)putWithInt:(int)a3 withByte:(char)a4
{
  return 0;
}

- (id)putCharWithChar:(unsigned __int16)a3
{
  return 0;
}

- (id)putCharWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  return 0;
}

- (id)putDoubleWithDouble:(double)a3
{
  return 0;
}

- (id)putDoubleWithInt:(int)a3 withDouble:(double)a4
{
  return 0;
}

- (id)putFloatWithFloat:(float)a3
{
  return 0;
}

- (id)putFloatWithInt:(int)a3 withFloat:(float)a4
{
  return 0;
}

- (id)putIntWithInt:(int)a3
{
  return 0;
}

- (id)putIntWithInt:(int)a3 withInt:(int)a4
{
  return 0;
}

- (id)putLongWithLong:(int64_t)a3
{
  return 0;
}

- (id)putLongWithInt:(int)a3 withLong:(int64_t)a4
{
  return 0;
}

- (id)putShortWithShort:(signed __int16)a3
{
  return 0;
}

- (id)putShortWithInt:(int)a3 withShort:(signed __int16)a4
{
  return 0;
}

- (id)slice
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioByteBuffer;
  [(JavaNioByteBuffer *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100449248;
}

@end
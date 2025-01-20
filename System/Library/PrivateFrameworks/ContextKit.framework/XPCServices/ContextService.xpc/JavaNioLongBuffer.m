@interface JavaNioLongBuffer
+ (const)__metadata;
+ (id)allocateWithInt:(int)a3;
+ (id)wrapWithLongArray:(id)a3;
+ (id)wrapWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (BOOL)hasArray;
- (BOOL)isDirect;
- (BOOL)isEqual:(id)a3;
- (BOOL)protectedHasArray;
- (JavaNioLongBuffer)initWithInt:(int)a3 withLong:(int64_t)a4;
- (id)asReadOnlyBuffer;
- (id)compact;
- (id)duplicate;
- (id)getWithLongArray:(id)a3;
- (id)getWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)order;
- (id)protectedArray;
- (id)putWithInt:(int)a3 withLong:(int64_t)a4;
- (id)putWithJavaNioLongBuffer:(id)a3;
- (id)putWithLong:(int64_t)a3;
- (id)putWithLongArray:(id)a3;
- (id)putWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)slice;
- (int)arrayOffset;
- (int)compareToWithId:(id)a3;
- (int)protectedArrayOffset;
- (int64_t)get;
- (int64_t)getWithInt:(int)a3;
- (unint64_t)hash;
@end

@implementation JavaNioLongBuffer

+ (id)allocateWithInt:(int)a3
{
  return JavaNioLongBuffer_allocateWithInt_(a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (id)wrapWithLongArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v4 = *((_DWORD *)a3 + 2);
  return JavaNioLongBuffer_wrapWithLongArray_withInt_withInt_((unsigned int *)a3, 0, v4);
}

+ (id)wrapWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaNioLongBuffer_wrapWithLongArray_withInt_withInt_((unsigned int *)a3, a4, a5);
}

- (JavaNioLongBuffer)initWithInt:(int)a3 withLong:(int64_t)a4
{
  JavaNioBuffer_initWithInt_withInt_withLong_((uint64_t)self, 3, *(uint64_t *)&a3, a4, v4, v5, v6, v7);
  return self;
}

- (int)arrayOffset
{
  return [(JavaNioLongBuffer *)self protectedArrayOffset];
}

- (id)asReadOnlyBuffer
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
      int64_t v11 = [(JavaNioLongBuffer *)self getWithInt:position];
      id v12 = [a3 getWithInt:v8];
      if ((id)v11 != v12) {
        break;
      }
      uint64_t position = (position + 1);
      uint64_t v8 = (v8 + 1);
      if (--v10 <= 1) {
        goto LABEL_10;
      }
    }
    if (v11 < (uint64_t)v12) {
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
    int64_t v11 = -[JavaNioLongBuffer getWithInt:](self, "getWithInt:");
    id v12 = [a3 getWithInt:v7];
    uint64_t v7 = (v7 + 1);
    int position = v10;
  }
  while ((id)v11 == v12);
  return v9;
}

- (int64_t)get
{
  return 0;
}

- (id)getWithLongArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioLongBuffer *)self getWithLongArray:a3 withInt:0 withInt:v3];
}

- (id)getWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = a5;
  LODWORD(v6) = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if ([(JavaNioBuffer *)self remaining] < v5)
  {
    id v12 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v12);
  }
  if (v5 + (int)v6 > (int)v6)
  {
    uint64_t v6 = (int)v6;
    do
    {
      int64_t v9 = [(JavaNioLongBuffer *)self get];
      uint64_t v10 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v6);
      }
      *((void *)a3 + v6++ + 2) = v9;
      --v5;
    }
    while (v5);
  }
  return self;
}

- (int64_t)getWithInt:(int)a3
{
  return 0;
}

- (BOOL)hasArray
{
  return [(JavaNioLongBuffer *)self protectedHasArray];
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
    int64_t v6 = -[JavaNioLongBuffer getWithInt:](self, "getWithInt:");
    int v4 = (v4 + v6) ^ HIDWORD(v6);
    int position = v5;
  }
  while (v5 < self->super.limit_);
  return v4;
}

- (BOOL)isDirect
{
  return 0;
}

- (id)order
{
  return 0;
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

- (id)putWithLong:(int64_t)a3
{
  return 0;
}

- (id)putWithLongArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioLongBuffer *)self putWithLongArray:a3 withInt:0 withInt:v3];
}

- (id)putWithLongArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = a5;
  LODWORD(v6) = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if ([(JavaNioBuffer *)self remaining] < v5)
  {
    int64_t v11 = new_JavaNioBufferOverflowException_init();
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
      [(JavaNioLongBuffer *)self putWithLong:*((void *)a3 + v6++ + 2)];
      --v5;
    }
    while (v5);
  }
  return self;
}

- (id)putWithJavaNioLongBuffer:(id)a3
{
  if ([(JavaNioBuffer *)self isReadOnly])
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_11;
  }
  if (a3 == self)
  {
    OnlyBufferException_init = new_JavaLangIllegalArgumentException_initWithNSString_(@"src == this");
    goto LABEL_11;
  }
  if (!a3) {
    goto LABEL_7;
  }
  int v5 = [a3 remaining];
  if (v5 > [(JavaNioBuffer *)self remaining])
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_11:
    objc_exception_throw(OnlyBufferException_init);
  }
  uint64_t v6 = +[IOSLongArray arrayWithLength:](IOSLongArray, "arrayWithLength:", (int)[a3 remaining]);
  [a3 getWithLongArray:v6];
  if (!v6) {
LABEL_7:
  }
    JreThrowNullPointerException();
  [(JavaNioLongBuffer *)self putWithLongArray:v6 withInt:0 withInt:v6->super.size_];
  return self;
}

- (id)putWithInt:(int)a3 withLong:(int64_t)a4
{
  return 0;
}

- (id)slice
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100404748;
}

@end
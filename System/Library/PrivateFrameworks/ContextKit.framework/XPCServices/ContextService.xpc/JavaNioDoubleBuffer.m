@interface JavaNioDoubleBuffer
+ (const)__metadata;
+ (id)allocateWithInt:(int)a3;
+ (id)wrapWithDoubleArray:(id)a3;
+ (id)wrapWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (BOOL)hasArray;
- (BOOL)isDirect;
- (BOOL)isEqual:(id)a3;
- (BOOL)protectedHasArray;
- (JavaNioDoubleBuffer)initWithInt:(int)a3 withLong:(int64_t)a4;
- (double)get;
- (double)getWithInt:(int)a3;
- (id)asReadOnlyBuffer;
- (id)compact;
- (id)duplicate;
- (id)getWithDoubleArray:(id)a3;
- (id)getWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)order;
- (id)protectedArray;
- (id)putWithDouble:(double)a3;
- (id)putWithDoubleArray:(id)a3;
- (id)putWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)putWithInt:(int)a3 withDouble:(double)a4;
- (id)putWithJavaNioDoubleBuffer:(id)a3;
- (id)slice;
- (int)arrayOffset;
- (int)compareToWithId:(id)a3;
- (int)protectedArrayOffset;
- (unint64_t)hash;
@end

@implementation JavaNioDoubleBuffer

+ (id)allocateWithInt:(int)a3
{
  return JavaNioDoubleBuffer_allocateWithInt_(a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (id)wrapWithDoubleArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v4 = *((_DWORD *)a3 + 2);
  return JavaNioDoubleBuffer_wrapWithDoubleArray_withInt_withInt_((unsigned int *)a3, 0, v4);
}

+ (id)wrapWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaNioDoubleBuffer_wrapWithDoubleArray_withInt_withInt_((unsigned int *)a3, a4, a5);
}

- (JavaNioDoubleBuffer)initWithInt:(int)a3 withLong:(int64_t)a4
{
  JavaNioBuffer_initWithInt_withInt_withLong_((uint64_t)self, 3, *(uint64_t *)&a3, a4, v4, v5, v6, v7);
  return self;
}

- (int)arrayOffset
{
  return [(JavaNioDoubleBuffer *)self protectedArrayOffset];
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
    unsigned int v14 = [(JavaNioBuffer *)self remaining];
    return v14 - [a3 remaining];
  }
  else
  {
    uint64_t v8 = *((unsigned int *)a3 + 5);
    uint64_t position = self->super.position_;
    int v10 = v7 + 1;
    while (1)
    {
      [(JavaNioDoubleBuffer *)self getWithInt:position];
      double v12 = v11;
      [a3 getWithInt:v8];
      if (v12 != v13) {
        break;
      }
      uint64_t position = (position + 1);
      uint64_t v8 = (v8 + 1);
      if (--v10 <= 1) {
        goto LABEL_10;
      }
    }
    if (v12 >= v13) {
      return 1;
    }
    else {
      return -1;
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
  if (objc_opt_isKindOfClass())
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
    unsigned int v5 = [(JavaNioBuffer *)self remaining];
    if (v5 == [a3 remaining])
    {
      uint64_t position = self->super.position_;
      if ((int)position >= self->super.limit_) {
        return 1;
      }
      uint64_t v7 = *((unsigned int *)a3 + 5);
      while (1)
      {
        [(JavaNioDoubleBuffer *)self getWithInt:position];
        double v9 = v8;
        [a3 getWithInt:v7];
        if (v9 != v10) {
          break;
        }
        uint64_t position = (position + 1);
        uint64_t v7 = (v7 + 1);
        if ((int)position >= self->super.limit_) {
          return 1;
        }
      }
    }
  }
  return 0;
}

- (double)get
{
  return 0.0;
}

- (id)getWithDoubleArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioDoubleBuffer *)self getWithDoubleArray:a3 withInt:0 withInt:v3];
}

- (id)getWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = a5;
  LODWORD(v6) = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if ([(JavaNioBuffer *)self remaining] < v5)
  {
    double v12 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v12);
  }
  if (v5 + (int)v6 > (int)v6)
  {
    uint64_t v6 = (int)v6;
    do
    {
      [(JavaNioDoubleBuffer *)self get];
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

- (double)getWithInt:(int)a3
{
  return 0.0;
}

- (BOOL)hasArray
{
  return [(JavaNioDoubleBuffer *)self protectedHasArray];
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
    -[JavaNioDoubleBuffer getWithInt:](self, "getWithInt:");
    uint64_t v7 = JavaLangDouble_doubleToLongBitsWithDouble_(v6);
    int v4 = (v4 + v7) ^ HIDWORD(v7);
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

- (id)putWithDouble:(double)a3
{
  return 0;
}

- (id)putWithDoubleArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioDoubleBuffer *)self putWithDoubleArray:a3 withInt:0 withInt:v3];
}

- (id)putWithDoubleArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v5 = a5;
  LODWORD(v6) = a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if ([(JavaNioBuffer *)self remaining] < v5)
  {
    double v11 = new_JavaNioBufferOverflowException_init();
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
      [(JavaNioDoubleBuffer *)self putWithDouble:*((double *)a3 + v6++ + 2)];
      --v5;
    }
    while (v5);
  }
  return self;
}

- (id)putWithJavaNioDoubleBuffer:(id)a3
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
  uint64_t v6 = +[IOSDoubleArray arrayWithLength:](IOSDoubleArray, "arrayWithLength:", (int)[a3 remaining]);
  [a3 getWithDoubleArray:v6];
  if (!v6) {
LABEL_7:
  }
    JreThrowNullPointerException();
  [(JavaNioDoubleBuffer *)self putWithDoubleArray:v6 withInt:0 withInt:v6->super.size_];
  return self;
}

- (id)putWithInt:(int)a3 withDouble:(double)a4
{
  return 0;
}

- (id)slice
{
  return 0;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047B3C8;
}

@end
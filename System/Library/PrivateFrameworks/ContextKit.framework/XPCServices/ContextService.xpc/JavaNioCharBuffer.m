@interface JavaNioCharBuffer
+ (const)__metadata;
+ (id)allocateWithInt:(int)a3;
+ (id)wrapWithCharArray:(id)a3;
+ (id)wrapWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
+ (id)wrapWithJavaLangCharSequence:(id)a3;
+ (id)wrapWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (BOOL)hasArray;
- (BOOL)isDirect;
- (BOOL)isEqual:(id)a3;
- (BOOL)protectedHasArray;
- (JavaNioCharBuffer)initWithInt:(int)a3 withLong:(int64_t)a4;
- (NSString)description;
- (id)appendWithJavaLangCharSequence:(id)a3;
- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)asReadOnlyBuffer;
- (id)compact;
- (id)duplicate;
- (id)getWithCharArray:(id)a3;
- (id)getWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)order;
- (id)protectedArray;
- (id)putWithChar:(unsigned __int16)a3;
- (id)putWithCharArray:(id)a3;
- (id)putWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)putWithInt:(int)a3 withChar:(unsigned __int16)a4;
- (id)putWithJavaNioCharBuffer:(id)a3;
- (id)putWithNSString:(id)a3;
- (id)putWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)slice;
- (id)subSequenceFrom:(int)a3 to:(int)a4;
- (int)arrayOffset;
- (int)compareToWithId:(id)a3;
- (int)protectedArrayOffset;
- (int)readWithJavaNioCharBuffer:(id)a3;
- (unint64_t)hash;
- (unsigned)charAtWithInt:(int)a3;
- (unsigned)get;
- (unsigned)getWithInt:(int)a3;
@end

@implementation JavaNioCharBuffer

+ (id)allocateWithInt:(int)a3
{
  return JavaNioCharBuffer_allocateWithInt_(a3, (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
}

+ (id)wrapWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  int v4 = *((_DWORD *)a3 + 2);
  return JavaNioCharBuffer_wrapWithCharArray_withInt_withInt_((unsigned int *)a3, 0, v4);
}

+ (id)wrapWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaNioCharBuffer_wrapWithCharArray_withInt_withInt_((unsigned int *)a3, a4, a5);
}

+ (id)wrapWithJavaLangCharSequence:(id)a3
{
  uint64_t v3 = new_JavaNioCharSequenceAdapter_initWithJavaLangCharSequence_(a3);
  return v3;
}

+ (id)wrapWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return JavaNioCharBuffer_wrapWithJavaLangCharSequence_withInt_withInt_(a3, a4, a5);
}

- (JavaNioCharBuffer)initWithInt:(int)a3 withLong:(int64_t)a4
{
  JavaNioBuffer_initWithInt_withInt_withLong_((uint64_t)self, 1, *(uint64_t *)&a3, a4, v4, v5, v6, v7);
  return self;
}

- (int)arrayOffset
{
  return [(JavaNioCharBuffer *)self protectedArrayOffset];
}

- (id)asReadOnlyBuffer
{
  return 0;
}

- (unsigned)charAtWithInt:(int)a3
{
  if (a3 < 0 || [(JavaNioBuffer *)self remaining] <= a3)
  {
    [(JavaNioBuffer *)self remaining];
    CFStringRef v14 = JreStrcat("$I$I", v7, v8, v9, v10, v11, v12, v13, @"index=");
    v15 = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v14);
    objc_exception_throw(v15);
  }
  uint64_t v5 = (self->super.position_ + a3);
  return [(JavaNioCharBuffer *)self getWithInt:v5];
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
      unsigned int v11 = [(JavaNioCharBuffer *)self getWithInt:position];
      unsigned int v12 = [a3 getWithInt:v8];
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
    unsigned int v11 = -[JavaNioCharBuffer getWithInt:](self, "getWithInt:");
    unsigned int v12 = [a3 getWithInt:v7];
    uint64_t v7 = (v7 + 1);
    int position = v10;
  }
  while (v11 == v12);
  return v9;
}

- (unsigned)get
{
  return 0;
}

- (id)getWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioCharBuffer *)self getWithCharArray:a3 withInt:0 withInt:v3];
}

- (id)getWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
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
      unsigned __int16 v9 = [(JavaNioCharBuffer *)self get];
      uint64_t v10 = *((unsigned int *)a3 + 2);
      if (v6 < 0 || v6 >= (int)v10) {
        IOSArray_throwOutOfBoundsWithMsg(v10, v6);
      }
      *((_WORD *)a3 + v6++ + 6) = v9;
      --v5;
    }
    while (v5);
  }
  return self;
}

- (unsigned)getWithInt:(int)a3
{
  return 0;
}

- (BOOL)hasArray
{
  return [(JavaNioCharBuffer *)self protectedHasArray];
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
    v4 += -[JavaNioCharBuffer getWithInt:](self, "getWithInt:");
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

- (id)putWithChar:(unsigned __int16)a3
{
  return 0;
}

- (id)putWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *((unsigned int *)a3 + 2);
  return [(JavaNioCharBuffer *)self putWithCharArray:a3 withInt:0 withInt:v3];
}

- (id)putWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
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
      [(JavaNioCharBuffer *)self putWithChar:*((unsigned __int16 *)a3 + v6++ + 6)];
      --v5;
    }
    while (v5);
  }
  return self;
}

- (id)putWithJavaNioCharBuffer:(id)a3
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
  uint64_t v6 = +[IOSCharArray arrayWithLength:](IOSCharArray, "arrayWithLength:", (int)[a3 remaining]);
  [a3 getWithCharArray:v6];
  if (!v6) {
LABEL_7:
  }
    JreThrowNullPointerException();
  [(JavaNioCharBuffer *)self putWithCharArray:v6 withInt:0 withInt:v6->super.size_];
  return self;
}

- (id)putWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  return 0;
}

- (id)putWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = [a3 length];
  return [(JavaNioCharBuffer *)self putWithNSString:a3 withInt:0 withInt:v5];
}

- (id)putWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  if ([(JavaNioBuffer *)self isReadOnly])
  {
    OnlyBufferException_init = new_JavaNioReadOnlyBufferException_init();
    goto LABEL_15;
  }
  if ((v6 & 0x80000000) != 0 || a5 < (int)v6)
  {
    if (a3) {
      goto LABEL_12;
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_13;
  }
  if ((int)[a3 length] < a5)
  {
LABEL_12:
    [a3 length];
    CFStringRef v18 = JreStrcat("$I$I$I", v11, v12, v13, v14, v15, v16, v17, @"str.length()=");
    OnlyBufferException_init = new_JavaLangIndexOutOfBoundsException_initWithNSString_((uint64_t)v18);
    goto LABEL_15;
  }
  if (a5 - (int)v6 > [(JavaNioBuffer *)self remaining])
  {
    OnlyBufferException_init = new_JavaNioBufferOverflowException_init();
LABEL_15:
    objc_exception_throw(OnlyBufferException_init);
  }
  if (a5 > (int)v6)
  {
    do
    {
      -[JavaNioCharBuffer putWithChar:](self, "putWithChar:", [a3 charAtWithInt:v6]);
      uint64_t v6 = (v6 + 1);
    }
    while (a5 != v6);
  }
  return self;
}

- (id)slice
{
  return 0;
}

- (id)subSequenceFrom:(int)a3 to:(int)a4
{
  return 0;
}

- (NSString)description
{
  uint64_t v3 = new_JavaLangStringBuilder_initWithInt_(self->super.limit_ - self->super.position_);
  for (uint64_t i = self->super.position_; (int)i < self->super.limit_; uint64_t i = (i + 1))
    [(JavaLangStringBuilder *)v3 appendWithChar:[(JavaNioCharBuffer *)self getWithInt:i]];
  return [(JavaLangStringBuilder *)v3 description];
}

- (id)appendWithJavaLangCharSequence:(id)a3
{
  if (a3)
  {
    int v4 = (__CFString *)[a3 description];
    if (!v4) {
      JreThrowNullPointerException();
    }
  }
  else
  {
    int v4 = @"null";
  }
  id v5 = [(__CFString *)v4 length];
  return [(JavaNioCharBuffer *)self putWithNSString:v4 withInt:0 withInt:v5];
}

- (id)appendWithJavaLangCharSequence:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a3) {
    uint64_t v6 = (__CFString *)a3;
  }
  else {
    uint64_t v6 = @"null";
  }
  id v7 = [(__CFString *)v6 subSequenceFrom:*(void *)&a4 to:*(void *)&a5];
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  if ((int)[v7 length] < 1) {
    return self;
  }
  id v9 = [v8 description];
  if (!v9) {
LABEL_11:
  }
    JreThrowNullPointerException();
  id v10 = v9;
  id v11 = [v9 length];
  return [(JavaNioCharBuffer *)self putWithNSString:v10 withInt:0 withInt:v11];
}

- (int)readWithJavaNioCharBuffer:(id)a3
{
  int v5 = [(JavaNioBuffer *)self remaining];
  if (a3 == self)
  {
    if (v5)
    {
      id v9 = new_JavaLangIllegalArgumentException_initWithNSString_(@"target == this");
      objc_exception_throw(v9);
    }
    return -1;
  }
  if (!v5)
  {
    if (self->super.limit_ >= 1)
    {
      if (!a3) {
        goto LABEL_15;
      }
      if ([a3 remaining]) {
        return -1;
      }
      else {
        return 0;
      }
    }
    return -1;
  }
  if (!a3) {
    goto LABEL_15;
  }
  int v6 = JavaLangMath_minWithInt_withInt_((uint64_t)[a3 remaining], v5);
  if (v6 >= 1)
  {
    id v7 = +[IOSCharArray arrayWithLength:v6];
    [(JavaNioCharBuffer *)self getWithCharArray:v7];
    if (v7)
    {
      [a3 putWithCharArray:v7 withInt:0 withInt:v7->super.size_];
      return v6;
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  return v6;
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10043F1F0;
}

@end
@interface JavaNioCharSequenceAdapter
+ (const)__metadata;
+ (id)copy__WithJavaNioCharSequenceAdapter:(id)a3;
- (BOOL)isDirect;
- (BOOL)isReadOnly;
- (BOOL)protectedHasArray;
- (JavaNioCharSequenceAdapter)initWithJavaLangCharSequence:(id)a3;
- (id)compact;
- (id)getWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)protectedArray;
- (id)putWithChar:(unsigned __int16)a3;
- (id)putWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)putWithInt:(int)a3 withChar:(unsigned __int16)a4;
- (id)putWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)slice;
- (id)subSequenceFrom:(int)a3 to:(int)a4;
- (int)protectedArrayOffset;
- (unsigned)get;
- (unsigned)getWithInt:(int)a3;
- (void)dealloc;
@end

@implementation JavaNioCharSequenceAdapter

+ (id)copy__WithJavaNioCharSequenceAdapter:(id)a3
{
  return JavaNioCharSequenceAdapter_copy__WithJavaNioCharSequenceAdapter_((uint64_t)a3);
}

- (JavaNioCharSequenceAdapter)initWithJavaLangCharSequence:(id)a3
{
  return self;
}

- (id)compact
{
  v2 = new_JavaNioReadOnlyBufferException_init();
  objc_exception_throw(v2);
}

- (unsigned)get
{
  int position = self->super.super.position_;
  if (position == self->super.super.limit_)
  {
    v5 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v5);
  }
  sequence = self->sequence_;
  if (!sequence) {
    JreThrowNullPointerException();
  }
  self->super.super.position_ = position + 1;
  return (unsigned __int16)-[JavaLangCharSequence charAtWithInt:](sequence, "charAtWithInt:");
}

- (unsigned)getWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[JavaNioBuffer checkIndexWithInt:](self, "checkIndexWithInt:");
  sequence = self->sequence_;
  if (!sequence) {
    JreThrowNullPointerException();
  }
  return (unsigned __int16)[(JavaLangCharSequence *)sequence charAtWithInt:v3];
}

- (id)getWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    goto LABEL_6;
  }
  uint64_t v6 = *(void *)&a4;
  JavaUtilArrays_checkOffsetAndCountWithInt_withInt_withInt_(*((unsigned int *)a3 + 2), a4, a5);
  if ([(JavaNioBuffer *)self remaining] < a5)
  {
    v14 = new_JavaNioBufferUnderflowException_init();
    objc_exception_throw(v14);
  }
  sequence = self->sequence_;
  if (!sequence
    || (int position = self->super.super.position_,
        (id v11 = [(JavaLangCharSequence *)sequence description]) == 0))
  {
LABEL_6:
    JreThrowNullPointerException();
  }
  uint64_t v12 = (position + a5);
  [v11 getChars:self->super.super.position_ sourceEnd:v12 destination:a3 destinationBegin:v6];
  self->super.super.position_ = v12;
  return self;
}

- (BOOL)isDirect
{
  return 0;
}

- (BOOL)isReadOnly
{
  return 1;
}

- (id)protectedArray
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int)protectedArrayOffset
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (BOOL)protectedHasArray
{
  return 0;
}

- (id)putWithChar:(unsigned __int16)a3
{
  uint64_t v3 = new_JavaNioReadOnlyBufferException_init();
  objc_exception_throw(v3);
}

- (id)putWithInt:(int)a3 withChar:(unsigned __int16)a4
{
  v4 = new_JavaNioReadOnlyBufferException_init();
  objc_exception_throw(v4);
}

- (id)putWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  v5 = new_JavaNioReadOnlyBufferException_init();
  objc_exception_throw(v5);
}

- (id)putWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  v5 = new_JavaNioReadOnlyBufferException_init();
  objc_exception_throw(v5);
}

- (id)slice
{
  if (!self->sequence_) {
    JreThrowNullPointerException();
  }
  id v2 = [(JavaLangCharSequence *)self->sequence_ subSequenceFrom:self->super.super.position_ to:self->super.super.limit_];
  uint64_t v3 = [JavaNioCharSequenceAdapter alloc];
  JavaNioCharSequenceAdapter_initWithJavaLangCharSequence_((uint64_t)v3, v2);
  return v3;
}

- (id)subSequenceFrom:(int)a3 to:(int)a4
{
  -[JavaNioBuffer checkStartEndRemainingWithInt:withInt:](self, "checkStartEndRemainingWithInt:withInt:");
  id result = JavaNioCharSequenceAdapter_copy__WithJavaNioCharSequenceAdapter_((uint64_t)self);
  if (!result) {
    JreThrowNullPointerException();
  }
  *((_DWORD *)result + 5) = self->super.super.position_ + a3;
  *((_DWORD *)result + 3) = self->super.super.position_ + a4;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioCharSequenceAdapter;
  [(JavaNioCharSequenceAdapter *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100419B30;
}

@end
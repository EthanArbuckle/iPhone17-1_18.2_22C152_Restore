@interface JavaNioCharsetCoderResult
+ (const)__metadata;
+ (id)malformedForLengthWithInt:(int)a3;
+ (id)unmappableForLengthWithInt:(int)a3;
+ (void)initialize;
- (BOOL)isError;
- (BOOL)isMalformed;
- (BOOL)isOverflow;
- (BOOL)isUnderflow;
- (BOOL)isUnmappable;
- (JavaNioCharsetCoderResult)initWithInt:(int)a3 withInt:(int)a4;
- (id)description;
- (int)length;
- (void)throwException;
@end

@implementation JavaNioCharsetCoderResult

- (JavaNioCharsetCoderResult)initWithInt:(int)a3 withInt:(int)a4
{
  self->type_ = a3;
  self->length_ = a4;
  return self;
}

+ (id)malformedForLengthWithInt:(int)a3
{
  return JavaNioCharsetCoderResult_malformedForLengthWithInt_(a3);
}

+ (id)unmappableForLengthWithInt:(int)a3
{
  return JavaNioCharsetCoderResult_unmappableForLengthWithInt_(a3);
}

- (BOOL)isUnderflow
{
  return self->type_ == 1;
}

- (BOOL)isError
{
  return (self->type_ - 3) < 2;
}

- (BOOL)isMalformed
{
  return self->type_ == 3;
}

- (BOOL)isOverflow
{
  return self->type_ == 2;
}

- (BOOL)isUnmappable
{
  return self->type_ == 4;
}

- (int)length
{
  if ((self->type_ - 3) > 1)
  {
    [(JavaNioCharsetCoderResult *)self description];
    CFStringRef v10 = JreStrcat("$$", v3, v4, v5, v6, v7, v8, v9, @"length meaningless for ");
    v11 = new_JavaLangUnsupportedOperationException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  return self->length_;
}

- (void)throwException
{
  switch(self->type_)
  {
    case 1:
      v2 = new_JavaNioBufferUnderflowException_init();
      break;
    case 2:
      v2 = new_JavaNioBufferOverflowException_init();
      break;
    case 3:
      v2 = new_JavaNioCharsetMalformedInputException_initWithInt_(self->length_);
      break;
    case 4:
      v2 = new_JavaNioCharsetUnmappableCharacterException_initWithInt_(self->length_);
      break;
    default:
      v2 = new_JavaNioCharsetCharacterCodingException_init();
      break;
  }
  objc_exception_throw(v2);
}

- (id)description
{
  switch(self->type_)
  {
    case 3:
      uint64_t v9 = @"Malformed-input error with erroneous input length ";
      goto LABEL_4;
    case 4:
      uint64_t v9 = @"Unmappable-character error with erroneous input length ";
LABEL_4:
      JreStrcat("$I", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
      break;
    default:
      break;
  }
  id v10 = objc_msgSend(-[JavaNioCharsetCoderResult getClass](self, "getClass"), "getName");
  return (id)JreStrcat("$C$C", v11, v12, v13, v14, v15, v16, v17, v10);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [JavaNioCharsetCoderResult alloc];
    *(void *)&v2->type_ = 1;
    JreStrongAssignAndConsume((id *)&JavaNioCharsetCoderResult_UNDERFLOW__, v2);
    uint64_t v3 = [JavaNioCharsetCoderResult alloc];
    *(void *)&v3->type_ = 2;
    JreStrongAssignAndConsume((id *)&JavaNioCharsetCoderResult_OVERFLOW__, v3);
    uint64_t v4 = new_JavaUtilWeakHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100560BF0, v4);
    uint64_t v5 = new_JavaUtilWeakHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100560BF8, v5);
    atomic_store(1u, (unsigned __int8 *)JavaNioCharsetCoderResult__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100423D80;
}

@end
@interface JavaMathMathContext
+ (const)__metadata;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (JavaMathMathContext)initWithInt:(int)a3;
- (JavaMathMathContext)initWithInt:(int)a3 withJavaMathRoundingModeEnum:(id)a4;
- (JavaMathMathContext)initWithNSString:(id)a3;
- (NSString)description;
- (id)getRoundingMode;
- (int)getPrecision;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaMathMathContext

- (JavaMathMathContext)initWithInt:(int)a3
{
  return self;
}

- (JavaMathMathContext)initWithInt:(int)a3 withJavaMathRoundingModeEnum:(id)a4
{
  return self;
}

- (JavaMathMathContext)initWithNSString:(id)a3
{
  return self;
}

- (int)getPrecision
{
  return self->precision_;
}

- (id)getRoundingMode
{
  return self->roundingMode_;
}

- (BOOL)isEqual:(id)a3
{
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    if ([a3 getPrecision] == self->precision_)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return [a3 getRoundingMode] == self->roundingMode_;
      }
LABEL_8:
      JreThrowClassCastException();
    }
  }
  return 0;
}

- (unint64_t)hash
{
  roundingMode = self->roundingMode_;
  if (!roundingMode) {
    JreThrowNullPointerException();
  }
  int precision = self->precision_;
  return [(JavaLangEnum *)roundingMode ordinal] | (8 * precision);
}

- (NSString)description
{
  v3 = new_JavaLangStringBuilder_initWithInt_(0x2Du);
  [(JavaLangStringBuilder *)v3 appendWithCharArray:qword_100561098];
  [(JavaLangStringBuilder *)v3 appendWithInt:self->precision_];
  [(JavaLangStringBuilder *)v3 appendWithChar:32];
  [(JavaLangStringBuilder *)v3 appendWithCharArray:qword_1005610A0];
  [(JavaLangStringBuilder *)v3 appendWithId:self->roundingMode_];
  return [(JavaLangStringBuilder *)v3 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaMathMathContext;
  [(JavaMathMathContext *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v2 = (void *)qword_100563CC0;
    objc_super v3 = [JavaMathMathContext alloc];
    JavaMathMathContext_initWithInt_withJavaMathRoundingModeEnum_((uint64_t)v3, 34, v2);
    JreStrongAssignAndConsume(&JavaMathMathContext_DECIMAL128_, v3);
    if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v4 = (void *)qword_100563CC0;
    v5 = [JavaMathMathContext alloc];
    JavaMathMathContext_initWithInt_withJavaMathRoundingModeEnum_((uint64_t)v5, 7, v4);
    JreStrongAssignAndConsume(&JavaMathMathContext_DECIMAL32_, v5);
    if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v6 = (void *)qword_100563CC0;
    v7 = [JavaMathMathContext alloc];
    JavaMathMathContext_initWithInt_withJavaMathRoundingModeEnum_((uint64_t)v7, 16, v6);
    JreStrongAssignAndConsume(&JavaMathMathContext_DECIMAL64_, v7);
    if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    v8 = (void *)qword_100563CB0;
    v9 = [JavaMathMathContext alloc];
    JavaMathMathContext_initWithInt_withJavaMathRoundingModeEnum_((uint64_t)v9, 0, v8);
    JreStrongAssignAndConsume(&JavaMathMathContext_UNLIMITED_, v9);
    int v12 = 3997806;
    long long v11 = *(_OWORD *)L"precision=roundingMode=";
    JreStrongAssignAndConsume((id *)&qword_100561098, +[IOSCharArray newArrayWithChars:&v11 count:10]);
    v10[0] = *(_OWORD *)L"roundingMode=";
    *(_OWORD *)((char *)v10 + 10) = *(_OWORD *)L"ingMode=";
    JreStrongAssignAndConsume((id *)&qword_1005610A0, +[IOSCharArray newArrayWithChars:v10 count:13]);
    atomic_store(1u, JavaMathMathContext__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100456F10;
}

@end
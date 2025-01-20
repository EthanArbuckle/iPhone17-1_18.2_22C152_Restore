@interface JavaLangHexStringParser
+ (const)__metadata;
+ (double)parseDoubleWithNSString:(id)a3;
+ (float)parseFloatWithNSString:(id)a3;
+ (void)initialize;
- (JavaLangHexStringParser)initWithInt:(int)a3 withInt:(int)a4;
- (id)getNormalizedSignificandWithNSString:(id)a3 withNSString:(id)a4;
- (int)countBitsLengthWithLong:(int64_t)a3;
- (int)getOffsetWithNSString:(id)a3 withNSString:(id)a4;
- (int64_t)parseWithNSString:(id)a3 withBoolean:(BOOL)a4;
- (void)checkedAddExponentWithLong:(int64_t)a3;
- (void)dealloc;
- (void)discardTrailingBitsWithLong:(int64_t)a3;
- (void)fitMantissaInDesiredWidthWithInt:(int)a3;
- (void)parseExponentWithNSString:(id)a3;
- (void)parseHexSignWithNSString:(id)a3;
- (void)parseMantissaWithNSString:(id)a3;
- (void)processNormalNumber;
- (void)setInfinite;
- (void)setZero;
@end

@implementation JavaLangHexStringParser

- (JavaLangHexStringParser)initWithInt:(int)a3 withInt:(int)a4
{
  return self;
}

+ (double)parseDoubleWithNSString:(id)a3
{
  return JavaLangHexStringParser_parseDoubleWithNSString_((uint64_t)a3);
}

+ (float)parseFloatWithNSString:(id)a3
{
  return JavaLangHexStringParser_parseFloatWithNSString_((uint64_t)a3);
}

- (int64_t)parseWithNSString:(id)a3 withBoolean:(BOOL)a4
{
  return sub_100236054((uint64_t)self, (uint64_t)a3);
}

- (void)parseHexSignWithNSString:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  self->sign_ = [a3 isEqual:@"-"];
}

- (void)parseExponentWithNSString:(id)a3
{
}

- (void)parseMantissaWithNSString:(id)a3
{
}

- (void)setInfinite
{
  self->exponent_ = self->MAX_EXPONENT_;
  self->mantissa_ = 0;
}

- (void)setZero
{
  self->exponent_ = 0;
  self->mantissa_ = 0;
}

- (void)checkedAddExponentWithLong:(int64_t)a3
{
}

- (void)processNormalNumber
{
  self->mantissa_ &= self->MANTISSA_MASK_;
}

- (void)fitMantissaInDesiredWidthWithInt:(int)a3
{
}

- (void)discardTrailingBitsWithLong:(int64_t)a3
{
  char v8 = a3;
  JreStrAppendStrong((__CFString **)&self->abandonedNumber_, "J", a3, v3, v4, v5, v6, v7, (id)(self->mantissa_ & ~(-1 << a3)));
  self->mantissa_ >>= v8;
}

- (id)getNormalizedSignificandWithNSString:(id)a3 withNSString:(id)a4
{
  return (id)sub_100236740(a3, (uint64_t)a4, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
}

- (int)getOffsetWithNSString:(id)a3 withNSString:(id)a4
{
  return sub_1002367B4(a3, a4);
}

- (int)countBitsLengthWithLong:(int64_t)a3
{
  return 64 - JavaLangLong_numberOfLeadingZerosWithLong_(a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaLangHexStringParser;
  [(JavaLangHexStringParser *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = JavaUtilRegexPattern_compileWithNSString_(off_10055DEE8);
    JreStrongAssign((id *)&qword_1005610B0, v2);
    atomic_store(1u, (unsigned __int8 *)JavaLangHexStringParser__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100458248;
}

@end
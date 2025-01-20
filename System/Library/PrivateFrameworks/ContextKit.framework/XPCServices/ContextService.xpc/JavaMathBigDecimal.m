@interface JavaMathBigDecimal
+ (const)__metadata;
+ (id)addAndMult10WithJavaMathBigDecimal:(id)a3 withJavaMathBigDecimal:(id)a4 withInt:(int)a5;
+ (id)divideBigIntegersWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withInt:(int)a5 withJavaMathRoundingModeEnum:(id)a6;
+ (id)dividePrimitiveLongsWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5 withJavaMathRoundingModeEnum:(id)a6;
+ (id)valueOfWithLong:(int64_t)a3;
+ (id)valueOfWithLong:(int64_t)a3 withInt:(int)a4;
+ (id)zeroScaledByWithLong:(int64_t)a3;
+ (int)bitLengthWithInt:(int)a3;
+ (int)bitLengthWithLong:(int64_t)a3;
+ (int)longCompareToWithLong:(int64_t)a3 withLong:(int64_t)a4;
+ (int)roundingBehaviorWithInt:(int)a3 withInt:(int)a4 withJavaMathRoundingModeEnum:(id)a5;
+ (int)toIntScaleWithLong:(int64_t)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isZero;
- (JavaMathBigDecimal)initWithCharArray:(id)a3;
- (JavaMathBigDecimal)initWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (JavaMathBigDecimal)initWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaMathMathContext:(id)a6;
- (JavaMathBigDecimal)initWithCharArray:(id)a3 withJavaMathMathContext:(id)a4;
- (JavaMathBigDecimal)initWithDouble:(double)a3;
- (JavaMathBigDecimal)initWithDouble:(double)a3 withJavaMathMathContext:(id)a4;
- (JavaMathBigDecimal)initWithInt:(int)a3;
- (JavaMathBigDecimal)initWithInt:(int)a3 withInt:(int)a4;
- (JavaMathBigDecimal)initWithInt:(int)a3 withJavaMathMathContext:(id)a4;
- (JavaMathBigDecimal)initWithJavaMathBigInteger:(id)a3;
- (JavaMathBigDecimal)initWithJavaMathBigInteger:(id)a3 withInt:(int)a4;
- (JavaMathBigDecimal)initWithJavaMathBigInteger:(id)a3 withInt:(int)a4 withJavaMathMathContext:(id)a5;
- (JavaMathBigDecimal)initWithJavaMathBigInteger:(id)a3 withJavaMathMathContext:(id)a4;
- (JavaMathBigDecimal)initWithLong:(int64_t)a3;
- (JavaMathBigDecimal)initWithLong:(int64_t)a3 withInt:(int)a4;
- (JavaMathBigDecimal)initWithLong:(int64_t)a3 withJavaMathMathContext:(id)a4;
- (JavaMathBigDecimal)initWithNSString:(id)a3;
- (JavaMathBigDecimal)initWithNSString:(id)a3 withJavaMathMathContext:(id)a4;
- (NSString)description;
- (char)byteValueExact;
- (const)objCType;
- (double)doubleValue;
- (float)floatValue;
- (id)abs;
- (id)absWithJavaMathMathContext:(id)a3;
- (id)addWithJavaMathBigDecimal:(id)a3;
- (id)addWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4;
- (id)divideAndRemainderWithJavaMathBigDecimal:(id)a3;
- (id)divideAndRemainderWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4;
- (id)divideToIntegralValueWithJavaMathBigDecimal:(id)a3;
- (id)divideToIntegralValueWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4;
- (id)divideWithJavaMathBigDecimal:(id)a3;
- (id)divideWithJavaMathBigDecimal:(id)a3 withInt:(int)a4;
- (id)divideWithJavaMathBigDecimal:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)divideWithJavaMathBigDecimal:(id)a3 withInt:(int)a4 withJavaMathRoundingModeEnum:(id)a5;
- (id)divideWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4;
- (id)divideWithJavaMathBigDecimal:(id)a3 withJavaMathRoundingModeEnum:(id)a4;
- (id)maxWithJavaMathBigDecimal:(id)a3;
- (id)minWithJavaMathBigDecimal:(id)a3;
- (id)movePointLeftWithInt:(int)a3;
- (id)movePointRightWithInt:(int)a3;
- (id)movePointWithLong:(int64_t)a3;
- (id)multiplyWithJavaMathBigDecimal:(id)a3;
- (id)multiplyWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4;
- (id)negate;
- (id)negateWithJavaMathMathContext:(id)a3;
- (id)powWithInt:(int)a3;
- (id)powWithInt:(int)a3 withJavaMathMathContext:(id)a4;
- (id)remainderWithJavaMathBigDecimal:(id)a3;
- (id)remainderWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4;
- (id)roundWithJavaMathMathContext:(id)a3;
- (id)scaleByPowerOfTenWithInt:(int)a3;
- (id)setScaleWithInt:(int)a3;
- (id)setScaleWithInt:(int)a3 withInt:(int)a4;
- (id)setScaleWithInt:(int)a3 withJavaMathRoundingModeEnum:(id)a4;
- (id)stripTrailingZeros;
- (id)subtractWithJavaMathBigDecimal:(id)a3;
- (id)subtractWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4;
- (id)toBigInteger;
- (id)toBigIntegerExact;
- (id)toEngineeringString;
- (id)toPlainString;
- (id)ulp;
- (int)aproxPrecision;
- (int)compareToWithId:(id)a3;
- (int)intValue;
- (int)intValueExact;
- (int)precision;
- (int)scale__;
- (int)signum;
- (int64_t)longLongValue;
- (int64_t)longValueExact;
- (int64_t)valueExactWithInt:(int)a3;
- (signed)shortValueExact;
- (uint64_t)unscaledValue;
- (unint64_t)hash;
- (void)dealloc;
- (void)getValue:(void *)a3;
- (void)inplaceRoundWithJavaMathMathContext:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)setUnscaledValueWithJavaMathBigInteger:(id)a3;
- (void)smallRoundWithJavaMathMathContext:(id)a3 withInt:(int)a4;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaMathBigDecimal

- (JavaMathBigDecimal)initWithLong:(int64_t)a3 withInt:(int)a4
{
  return self;
}

- (JavaMathBigDecimal)initWithInt:(int)a3 withInt:(int)a4
{
  return self;
}

- (JavaMathBigDecimal)initWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  return self;
}

- (JavaMathBigDecimal)initWithCharArray:(id)a3 withInt:(int)a4 withInt:(int)a5 withJavaMathMathContext:(id)a6
{
  return self;
}

- (JavaMathBigDecimal)initWithCharArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  JavaMathBigDecimal_initWithCharArray_withInt_withInt_((uint64_t)self, (uint64_t)a3, 0, *((_DWORD *)a3 + 2));
  return self;
}

- (JavaMathBigDecimal)initWithCharArray:(id)a3 withJavaMathMathContext:(id)a4
{
  return self;
}

- (JavaMathBigDecimal)initWithNSString:(id)a3
{
  return self;
}

- (JavaMathBigDecimal)initWithNSString:(id)a3 withJavaMathMathContext:(id)a4
{
  return self;
}

- (JavaMathBigDecimal)initWithDouble:(double)a3
{
  return self;
}

- (JavaMathBigDecimal)initWithDouble:(double)a3 withJavaMathMathContext:(id)a4
{
  return self;
}

- (JavaMathBigDecimal)initWithJavaMathBigInteger:(id)a3
{
  return self;
}

- (JavaMathBigDecimal)initWithJavaMathBigInteger:(id)a3 withJavaMathMathContext:(id)a4
{
  return self;
}

- (JavaMathBigDecimal)initWithJavaMathBigInteger:(id)a3 withInt:(int)a4
{
  return self;
}

- (JavaMathBigDecimal)initWithJavaMathBigInteger:(id)a3 withInt:(int)a4 withJavaMathMathContext:(id)a5
{
  return self;
}

- (JavaMathBigDecimal)initWithInt:(int)a3
{
  return self;
}

- (JavaMathBigDecimal)initWithInt:(int)a3 withJavaMathMathContext:(id)a4
{
  return self;
}

- (JavaMathBigDecimal)initWithLong:(int64_t)a3
{
  return self;
}

- (JavaMathBigDecimal)initWithLong:(int64_t)a3 withJavaMathMathContext:(id)a4
{
  return self;
}

+ (id)valueOfWithLong:(int64_t)a3 withInt:(int)a4
{
  return JavaMathBigDecimal_valueOfWithLong_withInt_(a3, a4);
}

+ (id)valueOfWithLong:(int64_t)a3
{
  return JavaMathBigDecimal_valueOfWithLong_(a3);
}

- (id)addWithJavaMathBigDecimal:(id)a3
{
  if (!a3) {
    goto LABEL_28;
  }
  v3 = (JavaMathBigDecimal *)a3;
  int scale = self->scale__;
  int v6 = *((_DWORD *)a3 + 12);
  uint64_t v7 = (scale - v6);
  uint64_t bitLength = self->bitLength_;
  if (!bitLength && self->smallValue_ != -1)
  {
    if ((int)v7 < 1) {
      return v3;
    }
    int v9 = v3->bitLength_;
    if (v9) {
      goto LABEL_4;
    }
    if (v3->smallValue_ == -1)
    {
      int v9 = 0;
      goto LABEL_4;
    }
    return self;
  }
  int v9 = v3->bitLength_;
  if (!v9 && v3->smallValue_ != -1 && (v7 & 0x80000000) == 0) {
    return self;
  }
LABEL_4:
  if (scale == v6)
  {
    if ((int)(JavaLangMath_maxWithInt_withInt_(bitLength, v9) + 1) <= 63)
    {
      unint64_t v10 = v3->smallValue_ + self->smallValue_;
      int v11 = self->scale__;
      return JavaMathBigDecimal_valueOfWithLong_withInt_(v10, v11);
    }
    v15 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (v15)
    {
      id v16 = [v15 addWithJavaMathBigInteger:-[JavaMathBigDecimal unscaledValue]_0((uint64_t)v3)];
      int v17 = self->scale__;
      v18 = [JavaMathBigDecimal alloc];
      JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v18, v16, v17);
      return v18;
    }
LABEL_28:
    JreThrowNullPointerException();
  }
  if ((int)v7 < 1)
  {
    uint64_t v7 = (v6 - scale);
    v13 = v3;
    v14 = self;
  }
  else
  {
    v13 = self;
    v14 = v3;
  }
  return sub_100167C4C((uint64_t)v13, (uint64_t)v14, v7);
}

- (uint64_t)unscaledValue
{
  v2 = (id *)(a1 + 24);
  uint64_t result = *(void *)(a1 + 24);
  if (!result)
  {
    v4 = JavaMathBigInteger_valueOfWithLong_(*(void *)(a1 + 40));
    JreStrongAssign(v2, v4);
    return *(void *)(a1 + 24);
  }
  return result;
}

+ (id)addAndMult10WithJavaMathBigDecimal:(id)a3 withJavaMathBigDecimal:(id)a4 withInt:(int)a5
{
  return sub_100167C4C((uint64_t)a3, (uint64_t)a4, *(uint64_t *)&a5);
}

- (id)addWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4
{
  if (!a3) {
    goto LABEL_44;
  }
  uint64_t scale = self->scale__;
  uint64_t v8 = *((int *)a3 + 12);
  if (!*((_DWORD *)a3 + 8) && *((void *)a3 + 5) != -1 || !self->bitLength_ && self->smallValue_ != -1) {
    goto LABEL_36;
  }
  if (!a4) {
    goto LABEL_44;
  }
  if (![a4 getPrecision]) {
    goto LABEL_36;
  }
  uint64_t v9 = scale - v8;
  int precision = self->precision_;
  if (precision <= 0)
  {
    double v11 = (double)(self->bitLength_ - 1) * 0.301029996;
    int v12 = (int)v11;
    if (v11 < 0.0) {
      unsigned int v13 = 0x80000000;
    }
    else {
      unsigned int v13 = 0x7FFFFFFF;
    }
    if (v12 == 0x80000000) {
      int v12 = v13;
    }
    int precision = v12 + 1;
  }
  v14 = a3;
  v15 = self;
  if (v9 - 1 <= precision)
  {
    int v16 = *((_DWORD *)a3 + 13);
    if (v16 <= 0)
    {
      double v17 = (double)(*((_DWORD *)a3 + 8) - 1) * 0.301029996;
      int v18 = (int)v17;
      if (v17 < 0.0) {
        unsigned int v19 = 0x80000000;
      }
      else {
        unsigned int v19 = 0x7FFFFFFF;
      }
      if (v18 == 0x80000000) {
        int v18 = v19;
      }
      int v16 = v18 + 1;
    }
    v14 = self;
    v15 = a3;
    if (v16 >= ~v9) {
      goto LABEL_36;
    }
  }
  signed int v20 = [a4 getPrecision];
  int v21 = v14[13];
  if (v21 <= 0)
  {
    double v22 = (double)(v14[8] - 1) * 0.301029996;
    int v23 = (int)v22;
    if (v22 < 0.0) {
      unsigned int v24 = 0x80000000;
    }
    else {
      unsigned int v24 = 0x7FFFFFFF;
    }
    if (v23 == 0x80000000) {
      int v23 = v24;
    }
    int v21 = v23 + 1;
  }
  if (v20 >= v21)
  {
LABEL_36:
    v30 = [(JavaMathBigDecimal *)self addWithJavaMathBigDecimal:a3];
    if (v30) {
      goto LABEL_37;
    }
    goto LABEL_44;
  }
  signed int v25 = [v14 signum];
  unsigned int v26 = [v15 signum];
  v27 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)v14);
  if (v25 != v26)
  {
    if (v27)
    {
      id v32 = [v27 subtractWithJavaMathBigInteger:JavaMathBigInteger_valueOfWithLong_(v25)];
      v33 = JavaMathMultiplication_multiplyByPositiveIntWithJavaMathBigInteger_withInt_((uint64_t)v32, 0xAu);
      if (v33)
      {
        v29 = v33;
        v25 *= 9;
        goto LABEL_43;
      }
    }
LABEL_44:
    JreThrowNullPointerException();
  }
  v28 = JavaMathMultiplication_multiplyByPositiveIntWithJavaMathBigInteger_withInt_((uint64_t)v27, 0xAu);
  if (!v28) {
    goto LABEL_44;
  }
  v29 = v28;
LABEL_43:
  id v34 = [(JavaMathBigInteger *)v29 addWithJavaMathBigInteger:JavaMathBigInteger_valueOfWithLong_(v25)];
  int v35 = v14[12] + 1;
  v36 = [JavaMathBigDecimal alloc];
  JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v36, v34, v35);
  v30 = v36;
LABEL_37:
  return [(JavaMathBigDecimal *)v30 roundWithJavaMathMathContext:a4];
}

- (id)subtractWithJavaMathBigDecimal:(id)a3
{
  if (!a3) {
    goto LABEL_50;
  }
  int scale = self->scale__;
  int v6 = *((_DWORD *)a3 + 12);
  uint64_t v7 = (scale - v6);
  uint64_t bitLength = self->bitLength_;
  if (bitLength || self->smallValue_ == -1)
  {
    int v9 = *((_DWORD *)a3 + 8);
    if (v9 || *((void *)a3 + 5) == -1 || (v7 & 0x80000000) != 0)
    {
LABEL_4:
      if (scale == v6)
      {
        if ((int)(JavaLangMath_maxWithInt_withInt_(bitLength, v9) + 1) <= 63)
        {
          unint64_t v10 = self->smallValue_ - *((void *)a3 + 5);
LABEL_20:
          int v14 = self->scale__;
LABEL_21:
          return JavaMathBigDecimal_valueOfWithLong_withInt_(v10, v14);
        }
        uint64_t v16 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
        if (v16)
        {
          double v17 = (void *)v16;
          uint64_t v18 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3);
          unsigned int v19 = v17;
LABEL_31:
          id v23 = [v19 subtractWithJavaMathBigInteger:v18];
          int v24 = self->scale__;
          signed int v25 = [JavaMathBigDecimal alloc];
          unsigned int v26 = v25;
          v27 = v23;
          int v28 = v24;
LABEL_47:
          JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v25, v27, v28);
          return v26;
        }
      }
      else if ((int)v7 < 1)
      {
        if (!qword_1005608D0) {
          goto LABEL_50;
        }
        uint64_t v29 = (v6 - scale);
        if (*(_DWORD *)(qword_1005608D0 + 8) <= (int)v29)
        {
          uint64_t v30 = (int)v29;
        }
        else
        {
          if (!qword_1005608D8) {
            goto LABEL_50;
          }
          uint64_t v30 = (int)v29;
          uint64_t v31 = *(unsigned int *)(qword_1005608D8 + 8);
          if ((v29 & 0x80000000) != 0 || (int)v31 <= (int)v29) {
            IOSArray_throwOutOfBoundsWithMsg(v31, v29);
          }
          if ((int)(JavaLangMath_maxWithInt_withInt_((*(_DWORD *)(qword_1005608D8 + 12 + 4 * (int)v29) + bitLength), v9)+ 1) <= 63)
          {
            int64_t smallValue = self->smallValue_;
            uint64_t v33 = *(unsigned int *)(qword_1005608D0 + 8);
            if ((v29 & 0x80000000) != 0 || (int)v33 <= (int)v29) {
              IOSArray_throwOutOfBoundsWithMsg(v33, v29);
            }
            unint64_t v10 = *(void *)(qword_1005608D0 + 16 + 8 * (int)v29) * smallValue - *((void *)a3 + 5);
            int v14 = *((_DWORD *)a3 + 12);
            goto LABEL_21;
          }
        }
        id v34 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
        int v35 = JavaMathMultiplication_multiplyByTenPowWithJavaMathBigInteger_withLong_(v34, v30);
        if (v35)
        {
          id v36 = -[JavaMathBigInteger subtractWithJavaMathBigInteger:](v35, "subtractWithJavaMathBigInteger:", -[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3));
          int v37 = *((_DWORD *)a3 + 12);
          signed int v25 = [JavaMathBigDecimal alloc];
          unsigned int v26 = v25;
          v27 = v36;
          int v28 = v37;
          goto LABEL_47;
        }
      }
      else
      {
        if (!qword_1005608D0) {
          goto LABEL_50;
        }
        if ((int)v7 < *(_DWORD *)(qword_1005608D0 + 8))
        {
          if (!qword_1005608D8) {
            goto LABEL_50;
          }
          uint64_t v11 = *(unsigned int *)(qword_1005608D8 + 8);
          if ((int)v7 >= (int)v11) {
            IOSArray_throwOutOfBoundsWithMsg(v11, v7);
          }
          if ((int)(JavaLangMath_maxWithInt_withInt_(bitLength, *(_DWORD *)(qword_1005608D8 + 12 + 4 * v7) + v9) + 1) <= 63)
          {
            uint64_t v12 = *((void *)a3 + 5);
            uint64_t v13 = *(unsigned int *)(qword_1005608D0 + 8);
            if ((int)v7 >= (int)v13) {
              IOSArray_throwOutOfBoundsWithMsg(v13, v7);
            }
            unint64_t v10 = self->smallValue_ - *(void *)(qword_1005608D0 + 16 + 8 * v7) * v12;
            goto LABEL_20;
          }
        }
        uint64_t v20 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
        if (v20)
        {
          int v21 = (void *)v20;
          double v22 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3);
          uint64_t v18 = (uint64_t)JavaMathMultiplication_multiplyByTenPowWithJavaMathBigInteger_withLong_(v22, v7);
          unsigned int v19 = v21;
          goto LABEL_31;
        }
      }
LABEL_50:
      JreThrowNullPointerException();
    }
    return self;
  }
  if ((int)v7 > 0)
  {
    int v9 = *((_DWORD *)a3 + 8);
    if (v9) {
      goto LABEL_4;
    }
    if (*((void *)a3 + 5) == -1)
    {
      int v9 = 0;
      goto LABEL_4;
    }
    return self;
  }
  return [a3 negate];
}

- (id)subtractWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4
{
  if (!a3) {
    goto LABEL_36;
  }
  uint64_t v7 = *((int *)a3 + 12);
  int scale = self->scale__;
  if (!*((_DWORD *)a3 + 8) && *((void *)a3 + 5) != -1 || !self->bitLength_ && self->smallValue_ != -1) {
    goto LABEL_29;
  }
  if (!a4) {
    goto LABEL_36;
  }
  if (![a4 getPrecision]) {
    goto LABEL_29;
  }
  int v9 = *((_DWORD *)a3 + 13);
  if (v9 <= 0)
  {
    double v10 = (double)(*((_DWORD *)a3 + 8) - 1) * 0.301029996;
    int v11 = (int)v10;
    if (v10 < 0.0) {
      unsigned int v12 = 0x80000000;
    }
    else {
      unsigned int v12 = 0x7FFFFFFF;
    }
    if (v11 == 0x80000000) {
      int v11 = v12;
    }
    int v9 = v11 + 1;
  }
  if (v7 + ~scale <= v9) {
    goto LABEL_29;
  }
  signed int v13 = [a4 getPrecision];
  int precision = self->precision_;
  if (precision <= 0)
  {
    double v15 = (double)(self->bitLength_ - 1) * 0.301029996;
    int v16 = (int)v15;
    if (v15 < 0.0) {
      unsigned int v17 = 0x80000000;
    }
    else {
      unsigned int v17 = 0x7FFFFFFF;
    }
    if (v16 == 0x80000000) {
      int v16 = v17;
    }
    int precision = v16 + 1;
  }
  if (v13 >= precision)
  {
LABEL_29:
    int v24 = [(JavaMathBigDecimal *)self subtractWithJavaMathBigDecimal:a3];
    if (v24) {
      goto LABEL_30;
    }
    goto LABEL_36;
  }
  signed int v18 = [(JavaMathBigDecimal *)self signum];
  unsigned int v19 = [a3 signum];
  uint64_t v20 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (v18 != v19)
  {
    unsigned int v26 = JavaMathMultiplication_multiplyByPositiveIntWithJavaMathBigInteger_withInt_((uint64_t)v20, 0xAu);
    if (v26)
    {
      id v23 = v26;
      goto LABEL_35;
    }
LABEL_36:
    JreThrowNullPointerException();
  }
  if (!v20) {
    goto LABEL_36;
  }
  id v21 = [v20 subtractWithJavaMathBigInteger:JavaMathBigInteger_valueOfWithLong_(v18)];
  double v22 = JavaMathMultiplication_multiplyByPositiveIntWithJavaMathBigInteger_withInt_((uint64_t)v21, 0xAu);
  if (!v22) {
    goto LABEL_36;
  }
  id v23 = v22;
  v18 *= 9;
LABEL_35:
  id v27 = [(JavaMathBigInteger *)v23 addWithJavaMathBigInteger:JavaMathBigInteger_valueOfWithLong_(v18)];
  int v28 = self->scale__ + 1;
  uint64_t v29 = [JavaMathBigDecimal alloc];
  JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v29, v27, v28);
  int v24 = v29;
LABEL_30:
  return [(JavaMathBigDecimal *)v24 roundWithJavaMathMathContext:a4];
}

- (id)multiplyWithJavaMathBigDecimal:(id)a3
{
  if (!a3) {
    goto LABEL_18;
  }
  uint64_t v4 = *((int *)a3 + 12) + (uint64_t)self->scale__;
  int bitLength = self->bitLength_;
  if (!bitLength && self->smallValue_ != -1 || (int v6 = *((_DWORD *)a3 + 8)) == 0 && *((void *)a3 + 5) != -1)
  {
    uint64_t v14 = *((int *)a3 + 12) + (uint64_t)self->scale__;
    return sub_1001688C0(v14);
  }
  if (v6 + bitLength <= 63)
  {
    unint64_t v7 = *((void *)a3 + 5) * self->smallValue_;
    int v8 = sub_100168968(*((int *)a3 + 12) + (uint64_t)self->scale__);
    return JavaMathBigDecimal_valueOfWithLong_withInt_(v7, v8);
  }
  double v10 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!v10) {
LABEL_18:
  }
    JreThrowNullPointerException();
  id v11 = [v10 multiplyWithJavaMathBigInteger:-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3)];
  int v12 = sub_100168968(v4);
  signed int v13 = [JavaMathBigDecimal alloc];
  JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v13, v11, v12);
  return v13;
}

- (id)multiplyWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4
{
  v5 = [(JavaMathBigDecimal *)self multiplyWithJavaMathBigDecimal:a3];
  if (!v5) {
    JreThrowNullPointerException();
  }
  int v6 = v5;
  sub_100168A20(v5, a4);
  return v6;
}

- (id)divideWithJavaMathBigDecimal:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v8 = JavaMathRoundingModeEnum_valueOfWithInt_(a5);
  return [(JavaMathBigDecimal *)self divideWithJavaMathBigDecimal:a3 withInt:v5 withJavaMathRoundingModeEnum:v8];
}

- (id)divideWithJavaMathBigDecimal:(id)a3 withInt:(int)a4 withJavaMathRoundingModeEnum:(id)a5
{
  if (!a5)
  {
    int v28 = new_JavaLangNullPointerException_init();
    goto LABEL_45;
  }
  if (!a3) {
    goto LABEL_38;
  }
  int v8 = *((_DWORD *)a3 + 8);
  if (!v8 && *((void *)a3 + 5) != -1)
  {
    int v28 = new_JavaLangArithmeticException_initWithNSString_(@"Division by zero");
LABEL_45:
    objc_exception_throw(v28);
  }
  uint64_t scale = self->scale__;
  uint64_t v10 = *((int *)a3 + 12) + (uint64_t)a4;
  uint64_t v11 = scale - v10;
  if (v8 > 63) {
    goto LABEL_31;
  }
  int bitLength = self->bitLength_;
  if (bitLength > 63) {
    goto LABEL_31;
  }
  if (scale == v10)
  {
    int64_t smallValue = self->smallValue_;
    uint64_t v14 = *((void *)a3 + 5);
LABEL_9:
    return sub_1001691C4(smallValue, v14, a4, a5);
  }
  if (v11 < 1)
  {
    if (qword_1005608D0)
    {
      uint64_t v20 = v10 - scale;
      if (v10 - scale >= *(int *)(qword_1005608D0 + 8)) {
        goto LABEL_31;
      }
      if (qword_1005608D8)
      {
        uint64_t v21 = (v10 - scale);
        uint64_t v22 = *(unsigned int *)(qword_1005608D8 + 8);
        if ((v20 & 0x80000000) != 0 || (int)v22 <= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v22, v20);
        }
        if (*(_DWORD *)(qword_1005608D8 + 12 + 4 * v21) + bitLength <= 63)
        {
          int64_t v23 = self->smallValue_;
          uint64_t v24 = *(unsigned int *)(qword_1005608D0 + 8);
          if ((v20 & 0x80000000) != 0 || (int)v24 <= (int)v20) {
            IOSArray_throwOutOfBoundsWithMsg(v24, v20);
          }
          int64_t smallValue = *(void *)(qword_1005608D0 + 16 + 8 * v21) * v23;
          uint64_t v14 = *((void *)a3 + 5);
          goto LABEL_9;
        }
        goto LABEL_31;
      }
    }
LABEL_38:
    JreThrowNullPointerException();
  }
  if (!qword_1005608D0) {
    goto LABEL_38;
  }
  if (v11 >= *(int *)(qword_1005608D0 + 8)) {
    goto LABEL_31;
  }
  if (!qword_1005608D8) {
    goto LABEL_38;
  }
  uint64_t v16 = (scale - v10);
  uint64_t v17 = *(unsigned int *)(qword_1005608D8 + 8);
  if ((v11 & 0x80000000) != 0 || (int)v17 <= (int)v11) {
    IOSArray_throwOutOfBoundsWithMsg(v17, v11);
  }
  if (*(_DWORD *)(qword_1005608D8 + 12 + 4 * v16) + v8 <= 63)
  {
    int64_t v18 = self->smallValue_;
    uint64_t v19 = *(unsigned int *)(qword_1005608D0 + 8);
    if ((v11 & 0x80000000) != 0 || (int)v19 <= (int)v11) {
      IOSArray_throwOutOfBoundsWithMsg(v19, v11);
    }
    uint64_t v14 = *(void *)(qword_1005608D0 + 16 + 8 * v16) * *((void *)a3 + 5);
    int64_t smallValue = v18;
    goto LABEL_9;
  }
LABEL_31:
  signed int v25 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  unsigned int v26 = (JavaMathBigInteger *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3);
  id v27 = v26;
  if (v11 < 1)
  {
    if (v11 < 0) {
      signed int v25 = JavaMathMultiplication_multiplyByTenPowWithJavaMathBigInteger_withLong_(v25, -(int)v11);
    }
  }
  else
  {
    id v27 = JavaMathMultiplication_multiplyByTenPowWithJavaMathBigInteger_withLong_(v26, (int)v11);
  }
  return sub_1001692BC(v25, v27, a4, a5);
}

+ (id)divideBigIntegersWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4 withInt:(int)a5 withJavaMathRoundingModeEnum:(id)a6
{
  return sub_1001692BC(a3, a4, a5, a6);
}

+ (id)dividePrimitiveLongsWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5 withJavaMathRoundingModeEnum:(id)a6
{
  return sub_1001691C4(a3, a4, a5, a6);
}

- (id)divideWithJavaMathBigDecimal:(id)a3 withInt:(int)a4
{
  uint64_t scale = self->scale__;
  uint64_t v7 = JavaMathRoundingModeEnum_valueOfWithInt_(a4);
  return [(JavaMathBigDecimal *)self divideWithJavaMathBigDecimal:a3 withInt:scale withJavaMathRoundingModeEnum:v7];
}

- (id)divideWithJavaMathBigDecimal:(id)a3 withJavaMathRoundingModeEnum:(id)a4
{
  return [(JavaMathBigDecimal *)self divideWithJavaMathBigDecimal:a3 withInt:self->scale__ withJavaMathRoundingModeEnum:a4];
}

- (id)divideWithJavaMathBigDecimal:(id)a3
{
  uint64_t v5 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!a3) {
    goto LABEL_45;
  }
  int v6 = (void *)v5;
  uint64_t v7 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3);
  if (!qword_1005608E0) {
    goto LABEL_45;
  }
  int v8 = (void *)v7;
  int v9 = *(_DWORD *)(qword_1005608E0 + 8);
  if (!*((_DWORD *)a3 + 8) && *((void *)a3 + 5) != -1)
  {
    CFStringRef v39 = @"Division by zero";
    goto LABEL_48;
  }
  if (!v6) {
    goto LABEL_45;
  }
  uint64_t v10 = self->scale__ - (uint64_t)*((int *)a3 + 12);
  if ([v6 signum])
  {
    id v11 = [v6 gcdWithJavaMathBigInteger:v8];
    id v12 = [v6 divideWithJavaMathBigInteger:v11];
    if (!v8) {
      goto LABEL_45;
    }
    id v13 = v12;
    id v14 = [v8 divideWithJavaMathBigInteger:v11];
    if (!v14) {
      goto LABEL_45;
    }
    double v15 = v14;
    v41 = v13;
    id v16 = [v14 getLowestSetBit];
    id v17 = [v15 shiftRightWithInt:v16];
    if (!v17) {
      goto LABEL_45;
    }
    int64_t v18 = v17;
    int v19 = 0;
    int v20 = v9 - 1;
    for (int i = 1; ; int i = 1)
    {
      while (1)
      {
        int v22 = i;
        uint64_t v23 = *(unsigned int *)(qword_1005608E0 + 8);
        if (i < 0 || i >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, i);
        }
        uint64_t v24 = (unsigned int *)[v18 divideAndRemainderWithJavaMathBigInteger:*(void *)(qword_1005608E0 + 24 + 8 * i)];
        if (!v24) {
          goto LABEL_45;
        }
        signed int v25 = v24;
        uint64_t v26 = v24[2];
        if ((int)v26 <= 1) {
          IOSArray_throwOutOfBoundsWithMsg(v26, 1);
        }
        id v27 = (void *)*((void *)v25 + 4);
        if (!v27) {
          goto LABEL_45;
        }
        if ([v27 signum]) {
          break;
        }
        if (i < v20) {
          ++i;
        }
        uint64_t v28 = v25[2];
        if ((int)v28 <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(v28, 0);
        }
        v19 += v22;
        int64_t v18 = (void *)*((void *)v25 + 3);
        if (!v18) {
          goto LABEL_45;
        }
      }
      if (i == 1) {
        break;
      }
    }
    id v29 = [v18 abs];
    if (!v29) {
      goto LABEL_45;
    }
    uint64_t v30 = v29;
    if ((atomic_load_explicit(JavaMathBigInteger__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if ([v30 isEqual:JavaMathBigInteger_ONE_])
    {
      if (([v18 signum] & 0x80000000) != 0)
      {
        if (!v41) {
          goto LABEL_45;
        }
        id v31 = [v41 negate];
      }
      else
      {
        id v31 = v41;
      }
      int v33 = JavaLangMath_maxWithInt_withInt_((uint64_t)v16, v19);
      int v34 = sub_100168968(v10 + v33);
      uint64_t v35 = (v16 - v19);
      if ((int)v35 >= 1)
      {
        id v36 = JavaMathMultiplication_multiplyByFivePowWithJavaMathBigInteger_withInt_(v31, v35);
LABEL_42:
        int v37 = v36;
        v38 = [JavaMathBigDecimal alloc];
        JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v38, v37, v34);
        return v38;
      }
      if (v31)
      {
        id v36 = (JavaMathBigInteger *)[v31 shiftLeftWithInt:(v19 - v16)];
        goto LABEL_42;
      }
LABEL_45:
      JreThrowNullPointerException();
    }
    CFStringRef v39 = @"Non-terminating decimal expansion; no exact representable decimal result.";
LABEL_48:
    v40 = new_JavaLangArithmeticException_initWithNSString_((uint64_t)v39);
    objc_exception_throw(v40);
  }
  return sub_1001688C0(v10);
}

- (id)divideWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4
{
  if (!a4) {
    goto LABEL_68;
  }
  unsigned int v7 = [a4 getPrecision];
  if (!a3) {
    goto LABEL_68;
  }
  signed int v8 = v7;
  int v9 = *((_DWORD *)a3 + 13);
  if (v9 <= 0)
  {
    double v10 = (double)(*((_DWORD *)a3 + 8) - 1) * 0.301029996;
    int v11 = (int)v10;
    if (v10 < 0.0) {
      unsigned int v12 = 0x80000000;
    }
    else {
      unsigned int v12 = 0x7FFFFFFF;
    }
    if (v11 == 0x80000000) {
      int v11 = v12;
    }
    int v9 = v11 + 1;
  }
  int precision = self->precision_;
  if (precision <= 0)
  {
    double v14 = (double)(self->bitLength_ - 1) * 0.301029996;
    int v15 = (int)v14;
    if (v14 < 0.0) {
      unsigned int v16 = 0x80000000;
    }
    else {
      unsigned int v16 = 0x7FFFFFFF;
    }
    if (v15 == 0x80000000) {
      int v15 = v16;
    }
    int precision = v15 + 1;
  }
  if (!qword_1005608E8) {
    goto LABEL_68;
  }
  uint64_t scale = self->scale__;
  uint64_t v18 = *((int *)a3 + 12);
  int v51 = *(_DWORD *)(qword_1005608E8 + 8);
  uint64_t v52 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  int v19 = +[IOSObjectArray arrayWithObjects:&v52 count:1 type:JavaMathBigInteger_class_()];
  if (![a4 getPrecision]
    || !self->bitLength_ && self->smallValue_ != -1
    || !*((_DWORD *)a3 + 8) && *((void *)a3 + 5) != -1)
  {
    return [(JavaMathBigDecimal *)self divideWithJavaMathBigDecimal:a3];
  }
  uint64_t v20 = v8 + 2 + v9 - precision;
  uint64_t v21 = scale - v18;
  if (v20 < 1)
  {
    uint64_t v24 = scale - v18;
  }
  else
  {
    int v22 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (!v22) {
      goto LABEL_68;
    }
    id v23 = [v22 multiplyWithJavaMathBigInteger:JavaMathMultiplication_powerOf10WithLong_(v20)];
    IOSObjectArray_Set((uint64_t)v19, 0, v23);
    uint64_t v24 = v21 + v20;
  }
  uint64_t size = v19->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  elementType = v19->elementType_;
  if (!elementType) {
    goto LABEL_68;
  }
  uint64_t v28 = (unsigned int *)-[IOSClass divideAndRemainderWithJavaMathBigInteger:](elementType, "divideAndRemainderWithJavaMathBigInteger:", -[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3));
  if (!v28) {
    goto LABEL_68;
  }
  id v29 = v28;
  uint64_t v30 = v28[2];
  if ((int)v30 < 1) {
    IOSArray_throwOutOfBoundsWithMsg(v30, 0);
  }
  id v31 = (id)*((void *)v29 + 3);
  if ((int)v30 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v30, 1);
  }
  id v32 = (void *)*((void *)v29 + 4);
  if (!v32) {
LABEL_68:
  }
    JreThrowNullPointerException();
  if (![v32 signum])
  {
    if (v31)
    {
      uint64_t v43 = 1;
      while (([v31 testBitWithInt:0] & 1) == 0)
      {
        uint64_t v44 = *(unsigned int *)(qword_1005608E8 + 8);
        if ((v43 & 0x80000000) != 0 || (int)v43 >= (int)v44) {
          IOSArray_throwOutOfBoundsWithMsg(v44, v43);
        }
        v45 = (unsigned int *)[v31 divideAndRemainderWithJavaMathBigInteger:*(void *)(qword_1005608E8 + 24 + 8 * (int)v43)];
        if (!v45) {
          goto LABEL_68;
        }
        v46 = v45;
        uint64_t v47 = v45[2];
        if ((int)v47 <= 1) {
          IOSArray_throwOutOfBoundsWithMsg(v47, 1);
        }
        v48 = (void *)*((void *)v46 + 4);
        if (!v48) {
          goto LABEL_68;
        }
        if ([v48 signum] || (uint64_t v49 = v24 - (int)v43, v49 < v21))
        {
          if (v43 == 1) {
            goto LABEL_46;
          }
          uint64_t v43 = 1;
        }
        else
        {
          if ((int)v43 >= v51 - 1) {
            uint64_t v43 = v43;
          }
          else {
            uint64_t v43 = (v43 + 1);
          }
          uint64_t v50 = v46[2];
          if ((int)v50 <= 0) {
            IOSArray_throwOutOfBoundsWithMsg(v50, 0);
          }
          id v31 = (id)*((void *)v46 + 3);
          uint64_t v24 = v49;
          if (!v31) {
            goto LABEL_68;
          }
        }
      }
      goto LABEL_46;
    }
    goto LABEL_68;
  }
  uint64_t v33 = v29[2];
  if ((int)v33 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v33, 1);
  }
  int v34 = (void *)*((void *)v29 + 4);
  if (!v34) {
    goto LABEL_68;
  }
  id v35 = [v34 shiftLeftOneBit];
  if (!v35) {
    goto LABEL_68;
  }
  unsigned int v36 = [v35 compareToWithId:-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3)];
  if (!v31) {
    goto LABEL_68;
  }
  unsigned int v37 = v36;
  if ((atomic_load_explicit(JavaMathBigInteger__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v38 = [v31 multiplyWithJavaMathBigInteger:JavaMathBigInteger_TEN_];
  if (!v38) {
    goto LABEL_68;
  }
  CFStringRef v39 = v38;
  uint64_t v40 = v29[2];
  if ((int)v40 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v40, 0);
  }
  v41 = (void *)*((void *)v29 + 3);
  if (!v41) {
    goto LABEL_68;
  }
  id v31 = objc_msgSend(v39, "addWithJavaMathBigInteger:", JavaMathBigInteger_valueOfWithLong_((int)(objc_msgSend(v41, "signum") * (v37 + 5))));
  ++v24;
LABEL_46:
  int v42 = sub_100168968(v24);
  return new_JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_withJavaMathMathContext_(v31, v42, a4);
}

- (id)divideToIntegralValueWithJavaMathBigDecimal:(id)a3
{
  uint64_t v43 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  +[IOSObjectArray arrayWithObjects:&v43 count:1 type:JavaMathBigInteger_class_()];
  if (!a3 || !qword_1005608E8) {
    goto LABEL_61;
  }
  int v5 = *(_DWORD *)(qword_1005608E8 + 8);
  int v6 = *((_DWORD *)a3 + 8);
  if (!v6 && *((void *)a3 + 5) != -1)
  {
    int v42 = new_JavaLangArithmeticException_initWithNSString_(@"Division by zero");
    objc_exception_throw(v42);
  }
  uint64_t v7 = self->scale__ - (uint64_t)*((int *)a3 + 12);
  int v8 = *((_DWORD *)a3 + 13);
  if (v8 <= 0)
  {
    double v9 = (double)(v6 - 1) * 0.301029996;
    int v10 = (int)v9;
    if (v9 < 0.0) {
      unsigned int v11 = 0x80000000;
    }
    else {
      unsigned int v11 = 0x7FFFFFFF;
    }
    if (v10 == 0x80000000) {
      int v10 = v11;
    }
    int v8 = v10 + 1;
  }
  int precision = self->precision_;
  if (precision <= 0)
  {
    double v13 = (double)(self->bitLength_ - 1) * 0.301029996;
    int v14 = (int)v13;
    if (v13 < 0.0) {
      unsigned int v15 = 0x80000000;
    }
    else {
      unsigned int v15 = 0x7FFFFFFF;
    }
    if (v14 == 0x80000000) {
      int v14 = v15;
    }
    int precision = v14 + 1;
  }
  if (v7 + v8 > precision + 1 || !self->bitLength_ && self->smallValue_ != -1)
  {
    if ((atomic_load_explicit(JavaMathBigInteger__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    id v16 = (id)JavaMathBigInteger_ZERO_;
LABEL_23:
    uint64_t v17 = v7;
    if (v16) {
      goto LABEL_24;
    }
LABEL_61:
    JreThrowNullPointerException();
  }
  if (!v7)
  {
    uint64_t v26 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (!v26) {
      goto LABEL_61;
    }
    id v27 = (void *)v26;
    uint64_t v28 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3);
    id v16 = objc_msgSend(v27, "divideWithJavaMathBigInteger:", v28, v43);
    uint64_t v7 = 0;
    goto LABEL_23;
  }
  if (v7 >= 1)
  {
    id v21 = JavaMathMultiplication_powerOf10WithLong_(self->scale__ - (uint64_t)*((int *)a3 + 12));
    uint64_t v22 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (!v22) {
      goto LABEL_61;
    }
    id v23 = (void *)v22;
    uint64_t v24 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3);
    if (!v24) {
      goto LABEL_61;
    }
    id v25 = objc_msgSend(v23, "divideWithJavaMathBigInteger:", objc_msgSend(v24, "multiplyWithJavaMathBigInteger:", v21, v43));
    if (!v25) {
      goto LABEL_61;
    }
    id v16 = [v25 multiplyWithJavaMathBigInteger:v21];
    goto LABEL_23;
  }
  id v29 = JavaMathMultiplication_powerOf10WithLong_(*((int *)a3 + 12) - (uint64_t)self->scale__);
  uint64_t v30 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!v30) {
    goto LABEL_61;
  }
  id v31 = objc_msgSend(v30, "multiplyWithJavaMathBigInteger:", v29, v43);
  if (!v31) {
    goto LABEL_61;
  }
  id v32 = [v31 divideWithJavaMathBigInteger:-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3)];
  if (!v32) {
    goto LABEL_61;
  }
  id v16 = v32;
  uint64_t v17 = 0;
  int v33 = v5 - 1;
  uint64_t v34 = 1;
  while (([v16 testBitWithInt:0] & 1) == 0)
  {
    uint64_t v35 = *(unsigned int *)(qword_1005608E8 + 8);
    if ((v34 & 0x80000000) != 0 || (int)v34 >= (int)v35) {
      IOSArray_throwOutOfBoundsWithMsg(v35, v34);
    }
    unsigned int v36 = (unsigned int *)[v16 divideAndRemainderWithJavaMathBigInteger:*(void *)(qword_1005608E8 + 24 + 8 * (int)v34)];
    if (!v36) {
      goto LABEL_61;
    }
    unsigned int v37 = v36;
    uint64_t v38 = v36[2];
    if ((int)v38 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v38, 1);
    }
    CFStringRef v39 = (void *)*((void *)v37 + 4);
    if (!v39) {
      goto LABEL_61;
    }
    if ([v39 signum] || (uint64_t v40 = v17 - (int)v34, v40 < v7))
    {
      if (v34 == 1) {
        break;
      }
      uint64_t v34 = 1;
    }
    else
    {
      if ((int)v34 >= v33) {
        uint64_t v34 = v34;
      }
      else {
        uint64_t v34 = (v34 + 1);
      }
      uint64_t v41 = v37[2];
      if ((int)v41 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v41, 0);
      }
      id v16 = (id)*((void *)v37 + 3);
      uint64_t v17 = v40;
      if (!v16) {
        goto LABEL_61;
      }
    }
  }
LABEL_24:
  if (!objc_msgSend(v16, "signum", v43)) {
    return sub_1001688C0(v17);
  }
  int v18 = sub_100168968(v17);
  int v19 = [JavaMathBigDecimal alloc];
  JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v19, v16, v18);
  return v19;
}

- (id)divideToIntegralValueWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4
{
  if (!a4) {
    goto LABEL_78;
  }
  signed int v6 = [a4 getPrecision];
  unsigned int v7 = [(JavaMathBigDecimal *)self precision];
  if (!a3) {
    goto LABEL_78;
  }
  unsigned int v8 = v7;
  unsigned int v9 = [a3 precision];
  if (!qword_1005608E8) {
    goto LABEL_78;
  }
  unsigned int v10 = v9;
  int v11 = *(_DWORD *)(qword_1005608E8 + 8);
  uint64_t scale = self->scale__;
  uint64_t v13 = *((int *)a3 + 12);
  int v14 = +[IOSObjectArray arrayWithLength:2 type:JavaMathBigInteger_class_()];
  if (!v6
    || (uint64_t v15 = (uint64_t)v14, !self->bitLength_) && self->smallValue_ != -1
    || !*((_DWORD *)a3 + 8) && *((void *)a3 + 5) != -1)
  {
    return [(JavaMathBigDecimal *)self divideToIntegralValueWithJavaMathBigDecimal:a3];
  }
  signed int v16 = v8 - v10;
  uint64_t v17 = scale - v13;
  uint64_t v18 = v16 - (scale - v13);
  if (v18 < 0)
  {
    if ((atomic_load_explicit(JavaMathBigInteger__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    id v29 = (id)JavaMathBigInteger_ZERO_;
    uint64_t v24 = scale - v13;
    goto LABEL_26;
  }
  if (!v17)
  {
    uint64_t v30 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (!v30) {
      goto LABEL_78;
    }
    id v29 = [v30 divideWithJavaMathBigInteger:-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3)];
    uint64_t v24 = 0;
LABEL_26:
    IOSObjectArray_Set(v15, 0, v29);
    if (!v15) {
      goto LABEL_78;
    }
    goto LABEL_27;
  }
  if (v17 < 1)
  {
    uint64_t v48 = scale - v13;
    uint64_t v49 = JavaLangMath_maxWithLong_withLong_(v6 - (uint64_t)v16, 0);
    uint64_t v50 = JavaLangMath_minWithLong_withLong_(-v17, v49);
    int v51 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (!v51) {
      goto LABEL_78;
    }
    id v52 = [v51 multiplyWithJavaMathBigInteger:JavaMathMultiplication_powerOf10WithLong_(v50)];
    if (!v52) {
      goto LABEL_78;
    }
    v53 = (unsigned int *)[v52 divideAndRemainderWithJavaMathBigInteger:-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3)];
    if (!v53) {
      goto LABEL_78;
    }
    uint64_t v15 = (uint64_t)v53;
    uint64_t v54 = v53[2];
    if ((int)v54 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v54, 1);
    }
    v55 = *(void **)(v15 + 32);
    if (!v55) {
      goto LABEL_78;
    }
    uint64_t v24 = v50 + v48;
    uint64_t v17 = v48;
    if ([v55 signum])
    {
      if (-v24 < 1)
      {
        uint64_t v17 = v48;
      }
      else
      {
        uint64_t v56 = *(unsigned int *)(v15 + 8);
        if ((int)v56 <= 1) {
          IOSArray_throwOutOfBoundsWithMsg(v56, 1);
        }
        uint64_t v57 = [new_JavaMathBigDecimal_initWithJavaMathBigInteger_(*(void **)(v15 + 32)) precision];
        uint64_t v58 = v57 - (v24 + (int)[a3 precision]);
        if (v58)
        {
          uint64_t v17 = v48;
        }
        else
        {
          uint64_t v59 = *(unsigned int *)(v15 + 8);
          if ((int)v59 <= 1) {
            IOSArray_throwOutOfBoundsWithMsg(v59, 1);
          }
          v60 = *(void **)(v15 + 32);
          if (!v60) {
            goto LABEL_78;
          }
          id v61 = [v60 multiplyWithJavaMathBigInteger:JavaMathMultiplication_powerOf10WithLong_(-v24)];
          if (!v61) {
            goto LABEL_78;
          }
          id v62 = [v61 divideWithJavaMathBigInteger:-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3)];
          IOSObjectArray_Set(v15, 1, v62);
          uint64_t v63 = *(unsigned int *)(v15 + 8);
          if ((int)v63 <= 1) {
            IOSArray_throwOutOfBoundsWithMsg(v63, 1);
          }
          v64 = *(void **)(v15 + 32);
          if (!v64) {
            goto LABEL_78;
          }
          uint64_t v17 = v48;
          uint64_t v58 = (int)JavaLangMath_absWithInt_((uint64_t)[v64 signum]);
        }
        if (v58 >= 1) {
          goto LABEL_77;
        }
      }
    }
  }
  else
  {
    uint64_t v19 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (!v19) {
      goto LABEL_78;
    }
    uint64_t v20 = (void *)v19;
    id v21 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3);
    if (!v21) {
      goto LABEL_78;
    }
    id v22 = objc_msgSend(v20, "divideWithJavaMathBigInteger:", objc_msgSend(v21, "multiplyWithJavaMathBigInteger:", JavaMathMultiplication_powerOf10WithLong_(v17)));
    IOSObjectArray_Set(v15, 0, v22);
    uint64_t v23 = JavaLangMath_maxWithLong_withLong_(v6 - v18, 0);
    uint64_t v24 = JavaLangMath_minWithLong_withLong_(v17, v23);
    uint64_t v25 = *(unsigned int *)(v15 + 8);
    if ((int)v25 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v25, 0);
    }
    uint64_t v26 = *(void **)(v15 + 24);
    if (!v26) {
      goto LABEL_78;
    }
    id v27 = [v26 multiplyWithJavaMathBigInteger:JavaMathMultiplication_powerOf10WithLong_(v24)];
    IOSObjectArray_Set(v15, 0, v27);
  }
LABEL_27:
  uint64_t v31 = *(unsigned int *)(v15 + 8);
  if ((int)v31 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v31, 0);
  }
  id v32 = *(void **)(v15 + 24);
  if (!v32) {
    goto LABEL_78;
  }
  if ([v32 signum])
  {
    uint64_t v33 = *(unsigned int *)(v15 + 8);
    uint64_t v68 = v17;
    if ((int)v33 < 1) {
      IOSArray_throwOutOfBoundsWithMsg(v33, 0);
    }
    uint64_t v34 = *(void **)(v15 + 24);
    uint64_t v35 = [JavaMathBigDecimal alloc];
    JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v35, v34, 0);
    v66 = v35;
    signed int v36 = [(JavaMathBigDecimal *)v66 precision];
    if (v34)
    {
      int v67 = v11 - 1;
      uint64_t v37 = v36;
      uint64_t v38 = v6;
      uint64_t v39 = 1;
      while (([v34 testBitWithInt:0] & 1) == 0)
      {
        uint64_t v40 = *(unsigned int *)(qword_1005608E8 + 8);
        if ((v39 & 0x80000000) != 0 || (int)v39 >= (int)v40) {
          IOSArray_throwOutOfBoundsWithMsg(v40, v39);
        }
        uint64_t v41 = (unsigned int *)[v34 divideAndRemainderWithJavaMathBigInteger:*(void *)(qword_1005608E8 + 24 + 8 * (int)v39)];
        if (v41)
        {
          int v42 = v41;
          uint64_t v43 = v41[2];
          if ((int)v43 <= 1) {
            IOSArray_throwOutOfBoundsWithMsg(v43, 1);
          }
          uint64_t v44 = (void *)*((void *)v42 + 4);
          if (v44)
          {
            if ([v44 signum]
              || (uint64_t v45 = v37 - (int)v39, v46 = v24 - (int)v39, v45 < v38) && v46 < v68)
            {
              if (v39 == 1) {
                break;
              }
              uint64_t v39 = 1;
            }
            else
            {
              uint64_t v39 = (int)v39 >= v67 ? v39 : (v39 + 1);
              uint64_t v47 = v42[2];
              if ((int)v47 <= 0) {
                IOSArray_throwOutOfBoundsWithMsg(v47, 0);
              }
              uint64_t v34 = (void *)*((void *)v42 + 3);
              uint64_t v24 = v46;
              uint64_t v37 = v45;
            }
            if (v34) {
              continue;
            }
          }
        }
        goto LABEL_78;
      }
      if (v37 <= v38)
      {
        v66->scale__ = sub_100168968(v24);
        sub_10016A958((uint64_t)v66, v34);
        return v66;
      }
LABEL_77:
      v65 = new_JavaLangArithmeticException_initWithNSString_(@"Division impossible");
      objc_exception_throw(v65);
    }
LABEL_78:
    JreThrowNullPointerException();
  }
  return sub_1001688C0(v17);
}

- (id)remainderWithJavaMathBigDecimal:(id)a3
{
  v3 = [(JavaMathBigDecimal *)self divideAndRemainderWithJavaMathBigDecimal:a3];
  if (!v3) {
    JreThrowNullPointerException();
  }
  uint64_t v4 = v3;
  uint64_t v5 = v3[2];
  if ((int)v5 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v5, 1);
  }
  return (id)*((void *)v4 + 4);
}

- (id)remainderWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4
{
  uint64_t v4 = [(JavaMathBigDecimal *)self divideAndRemainderWithJavaMathBigDecimal:a3 withJavaMathMathContext:a4];
  if (!v4) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = v4;
  uint64_t v6 = v4[2];
  if ((int)v6 <= 1) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 1);
  }
  return (id)*((void *)v5 + 4);
}

- (id)divideAndRemainderWithJavaMathBigDecimal:(id)a3
{
  uint64_t v5 = +[IOSObjectArray arrayWithLength:2 type:JavaMathBigDecimal_class_()];
  IOSObjectArray_Set((uint64_t)v5, 0, [(JavaMathBigDecimal *)self divideToIntegralValueWithJavaMathBigDecimal:a3]);
  uint64_t size = v5->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  elementType = v5->elementType_;
  if (!elementType) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)v5, 1, [(JavaMathBigDecimal *)self subtractWithJavaMathBigDecimal:[(IOSClass *)elementType multiplyWithJavaMathBigDecimal:a3]]);
  return v5;
}

- (id)divideAndRemainderWithJavaMathBigDecimal:(id)a3 withJavaMathMathContext:(id)a4
{
  unsigned int v7 = +[IOSObjectArray arrayWithLength:2 type:JavaMathBigDecimal_class_()];
  IOSObjectArray_Set((uint64_t)v7, 0, [(JavaMathBigDecimal *)self divideToIntegralValueWithJavaMathBigDecimal:a3 withJavaMathMathContext:a4]);
  uint64_t size = v7->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  elementType = v7->elementType_;
  if (!elementType) {
    JreThrowNullPointerException();
  }
  IOSObjectArray_Set((uint64_t)v7, 1, [(JavaMathBigDecimal *)self subtractWithJavaMathBigDecimal:[(IOSClass *)elementType multiplyWithJavaMathBigDecimal:a3]]);
  return v7;
}

- (id)powWithInt:(int)a3
{
  if (!a3) {
    return (id)JavaMathBigDecimal_ONE_;
  }
  uint64_t v3 = *(void *)&a3;
  if (a3 >= 0x3B9ACA00)
  {
    int v11 = new_JavaLangArithmeticException_initWithNSString_(@"Invalid Operation");
    objc_exception_throw(v11);
  }
  uint64_t v4 = self->scale__ * (unint64_t)a3;
  if (self->bitLength_ || self->smallValue_ == -1)
  {
    uint64_t v5 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (!v5) {
      JreThrowNullPointerException();
    }
    id v6 = [v5 powWithInt:v3];
    int v7 = sub_100168968(v4);
    unsigned int v8 = [JavaMathBigDecimal alloc];
    JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v8, v6, v7);
    return v8;
  }
  else
  {
    uint64_t v10 = self->scale__ * (unint64_t)a3;
    return sub_1001688C0(v10);
  }
}

- (id)powWithInt:(int)a3 withJavaMathMathContext:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  int v7 = JavaLangMath_absWithInt_(*(uint64_t *)&a3);
  if (!a4) {
    goto LABEL_33;
  }
  int v8 = v7;
  int v9 = [a4 getPrecision];
  long double v10 = JavaLangMath_log10WithDouble_((double)v8);
  int v11 = (int)v10;
  if (v10 < 0.0) {
    unsigned int v12 = 0x80000000;
  }
  else {
    unsigned int v12 = 0x7FFFFFFF;
  }
  if (v11 == 0x80000000) {
    int v11 = v12;
  }
  if (v5 && (self->bitLength_ || (int)v5 < 1 || self->smallValue_ == -1))
  {
    if (v8 > 999999999 || (v5 & 0x80000000) != 0 && !v9 || (int v13 = v11 + 1, v9 >= 1) && v13 > v9)
    {
      id v21 = new_JavaLangArithmeticException_initWithNSString_(@"Invalid Operation");
      objc_exception_throw(v21);
    }
    int v14 = (JavaMathMathContext *)a4;
    if (v9 >= 1) {
      int v14 = new_JavaMathMathContext_initWithInt_withJavaMathRoundingModeEnum_(v9 + v13 + 1, [a4 getRoundingMode]);
    }
    uint64_t v15 = [(JavaMathBigDecimal *)self roundWithJavaMathMathContext:v14];
    int v16 = JavaLangInteger_highestOneBitWithInt_(v8);
    if (v16 <= 1)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0)
      {
        if (!JavaMathBigDecimal_ONE_) {
          goto LABEL_33;
        }
        uint64_t v15 = [(id)JavaMathBigDecimal_ONE_ divideWithJavaMathBigDecimal:v15 withJavaMathMathContext:v14];
      }
      if (v15)
      {
        sub_100168A20(v15, a4);
        return v15;
      }
    }
    else
    {
      unsigned int v17 = v16;
      while (v15)
      {
        uint64_t v18 = [v15 multiplyWithJavaMathBigDecimal:v15 withJavaMathMathContext:v14];
        uint64_t v15 = v18;
        if (((v17 >> 1) & ~v8) == 0)
        {
          if (!v18) {
            break;
          }
          uint64_t v15 = [v18 multiplyWithJavaMathBigDecimal:self withJavaMathMathContext:v14];
        }
        BOOL v19 = v17 > 3;
        v17 >>= 1;
        if (!v19) {
          goto LABEL_23;
        }
      }
    }
LABEL_33:
    JreThrowNullPointerException();
  }
  return [(JavaMathBigDecimal *)self powWithInt:v5];
}

- (id)abs
{
  if (([(JavaMathBigDecimal *)self signum] & 0x80000000) == 0) {
    return self;
  }
  return [(JavaMathBigDecimal *)self negate];
}

- (id)absWithJavaMathMathContext:(id)a3
{
  id v3 = [(JavaMathBigDecimal *)self roundWithJavaMathMathContext:a3];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 abs];
}

- (id)negate
{
  int bitLength = self->bitLength_;
  if (bitLength <= 62)
  {
    int64_t smallValue = self->smallValue_;
    goto LABEL_9;
  }
  if (bitLength == 63)
  {
    int64_t smallValue = self->smallValue_;
    if (smallValue != 0x8000000000000000)
    {
LABEL_9:
      int scale = self->scale__;
      return JavaMathBigDecimal_valueOfWithLong_withInt_(-smallValue, scale);
    }
  }
  uint64_t v5 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!v5) {
    JreThrowNullPointerException();
  }
  id v6 = [v5 negate];
  int v7 = self->scale__;
  int v8 = [JavaMathBigDecimal alloc];
  JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v8, v6, v7);
  return v8;
}

- (id)negateWithJavaMathMathContext:(id)a3
{
  id v3 = [(JavaMathBigDecimal *)self roundWithJavaMathMathContext:a3];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 negate];
}

- (int)signum
{
  if (self->bitLength_ > 63)
  {
    uint64_t v4 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (!v4) {
      JreThrowNullPointerException();
    }
    return [v4 signum];
  }
  else
  {
    int64_t smallValue = self->smallValue_;
    return JavaLangLong_signumWithLong_(smallValue);
  }
}

- (BOOL)isZero
{
  return !self->bitLength_ && self->smallValue_ != -1;
}

- (int)scale__
{
  return self->scale__;
}

- (int)precision
{
  int result = self->precision_;
  if (result <= 0)
  {
    int bitLength = self->bitLength_;
    if (bitLength > 1023)
    {
      double v7 = (double)(bitLength - 1) * 0.301029996 + 1.0;
      if (v7 < 0.0) {
        unsigned int v8 = 0x80000000;
      }
      else {
        unsigned int v8 = 0x7FFFFFFF;
      }
      if ((int)v7 == 0x80000000) {
        int v9 = v8;
      }
      else {
        int v9 = (int)v7;
      }
      long double v10 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
      if (v10)
      {
        id v11 = [v10 divideWithJavaMathBigInteger:JavaMathMultiplication_powerOf10WithLong_(v9)];
        if (v11)
        {
          if ([v11 signum]) {
            int result = v9 + 1;
          }
          else {
            int result = v9;
          }
LABEL_26:
          self->precision_ = result;
          return result;
        }
      }
    }
    else
    {
      if (bitLength < 64)
      {
        if (bitLength < 1) {
          double smallValue = 1.0;
        }
        else {
          double smallValue = (double)self->smallValue_;
        }
LABEL_20:
        double v12 = JavaLangMath_absWithDouble_(smallValue);
        double v13 = JavaLangMath_log10WithDouble_(v12) + 1.0;
        if (v13 < 0.0) {
          int v14 = 0x80000000;
        }
        else {
          int v14 = 0x7FFFFFFF;
        }
        if ((int)v13 == 0x80000000) {
          int result = v14;
        }
        else {
          int result = (int)v13;
        }
        goto LABEL_26;
      }
      uint64_t v5 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
      if (v5)
      {
        [v5 doubleValue];
        goto LABEL_20;
      }
    }
    JreThrowNullPointerException();
  }
  return result;
}

- (id)roundWithJavaMathMathContext:(id)a3
{
  uint64_t v4 = self;
  uint64_t v5 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  LODWORD(v4) = v4->scale__;
  id v6 = [JavaMathBigDecimal alloc];
  JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v6, v5, (int)v4);
  double v7 = v6;
  sub_100168A20(v7, a3);
  return v7;
}

- (id)setScaleWithInt:(int)a3 withJavaMathRoundingModeEnum:(id)a4
{
  if (!a4)
  {
    id v21 = new_JavaLangNullPointerException_init();
    objc_exception_throw(v21);
  }
  uint64_t v5 = *((int *)self + 12);
  if (v5 != a3)
  {
    uint64_t v6 = a3 - v5;
    if (v6 >= 1)
    {
      if (qword_1005608D0)
      {
        if (v6 >= *(int *)(qword_1005608D0 + 8))
        {
LABEL_15:
          id v11 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
          double v12 = JavaMathMultiplication_multiplyByTenPowWithJavaMathBigInteger_withLong_(v11, (int)v6);
          double v13 = [JavaMathBigDecimal alloc];
          JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v13, v12, a3);
          return v13;
        }
        if (qword_1005608D8)
        {
          uint64_t v7 = *(unsigned int *)(qword_1005608D8 + 8);
          if ((v6 & 0x80000000) != 0 || (int)v7 <= (int)v6) {
            IOSArray_throwOutOfBoundsWithMsg(v7, v6);
          }
          if (*(_DWORD *)(qword_1005608D8 + 12 + 4 * v6) + *((_DWORD *)self + 8) <= 63)
          {
            uint64_t v8 = *((void *)self + 5);
            uint64_t v9 = *(unsigned int *)(qword_1005608D0 + 8);
            if ((v6 & 0x80000000) != 0 || (int)v9 <= (int)v6) {
              IOSArray_throwOutOfBoundsWithMsg(v9, v6);
            }
            unint64_t v10 = *(void *)(qword_1005608D0 + 16 + 8 * v6) * v8;
            return JavaMathBigDecimal_valueOfWithLong_withInt_(v10, a3);
          }
          goto LABEL_15;
        }
      }
LABEL_29:
      JreThrowNullPointerException();
    }
    uint64_t v15 = v5 - a3;
    if (*((int *)self + 8) > 63) {
      goto LABEL_26;
    }
    if (!qword_1005608D0) {
      goto LABEL_29;
    }
    uint64_t v16 = *(int *)(qword_1005608D0 + 8);
    if (v15 >= v16)
    {
LABEL_26:
      BOOL v19 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
      id v20 = JavaMathMultiplication_powerOf10WithLong_(v15);
      return sub_1001692BC(v19, v20, a3, a4);
    }
    else
    {
      uint64_t v17 = *((void *)self + 5);
      if ((v15 & 0x80000000) != 0 || (int)v16 <= (int)v15) {
        IOSArray_throwOutOfBoundsWithMsg(v16, v15);
      }
      uint64_t v18 = *(void *)(qword_1005608D0 + 16 + 8 * v15);
      return sub_1001691C4(v17, v18, a3, a4);
    }
  }
  return self;
}

- (id)setScaleWithInt:(int)a3 withInt:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = JavaMathRoundingModeEnum_valueOfWithInt_(a4);
  return [(JavaMathBigDecimal *)self setScaleWithInt:v4 withJavaMathRoundingModeEnum:v6];
}

- (id)setScaleWithInt:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((atomic_load_explicit(JavaMathRoundingModeEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = qword_100563CC8;
  return [(JavaMathBigDecimal *)self setScaleWithInt:v3 withJavaMathRoundingModeEnum:v5];
}

- (id)movePointLeftWithInt:(int)a3
{
  return sub_10016B6AC((uint64_t)self, self->scale__ + (uint64_t)a3);
}

- (id)movePointWithLong:(int64_t)a3
{
  return sub_10016B6AC((uint64_t)self, a3);
}

- (id)movePointRightWithInt:(int)a3
{
  return sub_10016B6AC((uint64_t)self, self->scale__ - (uint64_t)a3);
}

- (id)scaleByPowerOfTenWithInt:(int)a3
{
  uint64_t v3 = self->scale__ - (uint64_t)a3;
  if (self->bitLength_ > 63)
  {
    uint64_t v7 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    int v8 = sub_100168968(v3);
    uint64_t v9 = [JavaMathBigDecimal alloc];
    JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v9, v7, v8);
    return v9;
  }
  else
  {
    unint64_t smallValue = self->smallValue_;
    if (smallValue)
    {
      int v5 = sub_100168968(self->scale__ - (uint64_t)a3);
      return JavaMathBigDecimal_valueOfWithLong_withInt_(smallValue, v5);
    }
    else
    {
      uint64_t v10 = self->scale__ - (uint64_t)a3;
      return sub_1001688C0(v10);
    }
  }
}

- (id)stripTrailingZeros
{
  if (!qword_1005608E8) {
    goto LABEL_29;
  }
  int v2 = *(_DWORD *)(qword_1005608E8 + 8);
  uint64_t scale = self->scale__;
  if (!self->bitLength_ && self->smallValue_ != -1)
  {
    uint64_t v16 = [JavaMathBigDecimal alloc];
    JavaMathBigDecimal_initWithCharArray_withInt_withInt_((uint64_t)v16, (uint64_t)[@"0" toCharArray], 0, (signed int)objc_msgSend(@"0", "length"));
    goto LABEL_26;
  }
  uint64_t v4 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!v4) {
LABEL_29:
  }
    JreThrowNullPointerException();
  int v5 = (void *)v4;
  int v6 = v2 - 1;
  uint64_t v7 = 1;
  while (([v5 testBitWithInt:0] & 1) == 0)
  {
    uint64_t v8 = *(unsigned int *)(qword_1005608E8 + 8);
    if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v8) {
      IOSArray_throwOutOfBoundsWithMsg(v8, v7);
    }
    uint64_t v9 = (int)v7;
    uint64_t v10 = (unsigned int *)[v5 divideAndRemainderWithJavaMathBigInteger:*(void *)(qword_1005608E8 + 24 + 8 * (int)v7)];
    if (!v10) {
      goto LABEL_29;
    }
    id v11 = v10;
    uint64_t v12 = v10[2];
    if ((int)v12 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v12, 1);
    }
    double v13 = (void *)*((void *)v11 + 4);
    if (!v13) {
      goto LABEL_29;
    }
    if ([v13 signum])
    {
      if (v7 == 1) {
        break;
      }
      uint64_t v7 = 1;
    }
    else
    {
      if ((int)v7 >= v6) {
        uint64_t v7 = v7;
      }
      else {
        uint64_t v7 = (v7 + 1);
      }
      uint64_t v14 = v11[2];
      if ((int)v14 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v14, 0);
      }
      scale -= v9;
      int v5 = (void *)*((void *)v11 + 3);
      if (!v5) {
        goto LABEL_29;
      }
    }
  }
  int v15 = sub_100168968(scale);
  uint64_t v16 = [JavaMathBigDecimal alloc];
  JavaMathBigDecimal_initWithJavaMathBigInteger_withInt_((uint64_t)v16, v5, v15);
LABEL_26:
  return v16;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3)
  {
    [(JavaMathBigDecimal *)self signum];
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int v5 = [(JavaMathBigDecimal *)self signum];
  signed int v6 = [a3 signum];
  if (v5 != v6)
  {
    if (v5 < v6) {
      return -1;
    }
    else {
      return 1;
    }
  }
  uint64_t scale = self->scale__;
  uint64_t v8 = *((int *)a3 + 12);
  if (scale == v8 && self->bitLength_ <= 63 && *((int *)a3 + 8) <= 63)
  {
    int64_t smallValue = self->smallValue_;
    int64_t v10 = *((void *)a3 + 5);
    BOOL v11 = smallValue < v10;
    BOOL v12 = smallValue > v10;
    if (v11) {
      return -1;
    }
    else {
      return v12;
    }
  }
  int precision = self->precision_;
  if (precision <= 0)
  {
    double v14 = (double)(self->bitLength_ - 1) * 0.301029996;
    int v15 = (int)v14;
    if (v14 < 0.0) {
      unsigned int v16 = 0x80000000;
    }
    else {
      unsigned int v16 = 0x7FFFFFFF;
    }
    if (v15 == 0x80000000) {
      int v15 = v16;
    }
    int precision = v15 + 1;
  }
  uint64_t v17 = scale - v8;
  int v18 = *((_DWORD *)a3 + 13);
  if (v18 <= 0)
  {
    double v19 = (double)(*((_DWORD *)a3 + 8) - 1) * 0.301029996;
    int v20 = (int)v19;
    if (v19 < 0.0) {
      unsigned int v21 = 0x80000000;
    }
    else {
      unsigned int v21 = 0x7FFFFFFF;
    }
    if (v20 == 0x80000000) {
      int v20 = v21;
    }
    int v18 = v20 + 1;
  }
  int v22 = precision - v18;
  if (v17 + 1 < v22) {
    return v5;
  }
  if (v17 - 1 > v22) {
    return -v5;
  }
  id v24 = (id)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  uint64_t v25 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)a3);
  id v26 = v25;
  if (v17 < 0)
  {
    if (!v24) {
      goto LABEL_42;
    }
    id v24 = [v24 multiplyWithJavaMathBigInteger:JavaMathMultiplication_powerOf10WithLong_(v8 - scale)];
  }
  else if (scale != v8)
  {
    if (!v25) {
      goto LABEL_42;
    }
    id v26 = [v25 multiplyWithJavaMathBigInteger:JavaMathMultiplication_powerOf10WithLong_(scale - v8)];
  }
  if (!v24) {
LABEL_42:
  }
    JreThrowNullPointerException();
  return [v24 compareToWithId:v26];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (*((_DWORD *)a3 + 12) != self->scale__) {
    return 0;
  }
  if (self->bitLength_ <= 63) {
    return *((void *)a3 + 5) == self->smallValue_;
  }
  intVal = self->intVal_;
  if (!intVal) {
LABEL_15:
  }
    JreThrowNullPointerException();
  uint64_t v7 = *((void *)a3 + 3);
  return [(JavaMathBigInteger *)intVal isEqual:v7];
}

- (id)minWithJavaMathBigDecimal:(id)a3
{
  if (-[JavaMathBigDecimal compareToWithId:](self, "compareToWithId:") >= 1) {
    return a3;
  }
  else {
    return self;
  }
}

- (id)maxWithJavaMathBigDecimal:(id)a3
{
  if (-[JavaMathBigDecimal compareToWithId:](self, "compareToWithId:") >= 0) {
    return self;
  }
  else {
    return a3;
  }
}

- (unint64_t)hash
{
  int hashCode = self->hashCode_;
  if (!hashCode)
  {
    if (self->bitLength_ > 63)
    {
      intVal = self->intVal_;
      if (!intVal) {
        JreThrowNullPointerException();
      }
      int v4 = [(JavaMathBigInteger *)intVal hash];
    }
    else
    {
      int v4 = 33 * LODWORD(self->smallValue_) + HIDWORD(self->smallValue_);
      self->hashCode_ = v4;
    }
    int hashCode = 17 * v4 + self->scale__;
    self->hashCode_ = hashCode;
  }
  return hashCode;
}

- (NSString)description
{
  p_toStringImage = &self->toStringImage_;
  toStringImage = self->toStringImage_;
  if (!toStringImage)
  {
    if (self->bitLength_ <= 31)
    {
      int v5 = JavaMathConversion_toDecimalScaledStringWithLong_withInt_(self->smallValue_, self->scale__);
LABEL_22:
      JreStrongAssign((id *)p_toStringImage, v5);
      return *p_toStringImage;
    }
    signed int v6 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (!v6) {
LABEL_24:
    }
      JreThrowNullPointerException();
    toStringImage = (NSString *)[v6 description];
    if (self->scale__)
    {
      uint64_t v7 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
      if (v7)
      {
        uint64_t v8 = (int)[v7 signum] >= 0 ? 1 : 2;
        if (toStringImage)
        {
          NSUInteger v9 = [(NSString *)toStringImage length];
          uint64_t v10 = (int)v9 - (self->scale__ + (unint64_t)v8);
          BOOL v11 = new_JavaLangStringBuilder_init();
          [(JavaLangStringBuilder *)v11 appendWithNSString:toStringImage];
          int scale = self->scale__;
          if (scale < 1 || v10 < -6)
          {
            if ((int)v9 - (int)v8 >= 1)
            {
              [(JavaLangStringBuilder *)v11 insertWithInt:v8 withChar:46];
              NSUInteger v9 = (v9 + 1);
            }
            [(JavaLangStringBuilder *)v11 insertWithInt:v9 withChar:69];
            if (v10 >= 1)
            {
              NSUInteger v9 = (v9 + 1);
              [(JavaLangStringBuilder *)v11 insertWithInt:v9 withChar:43];
            }
            [(JavaLangStringBuilder *)v11 insertWithInt:(v9 + 1) withNSString:JavaLangLong_toStringWithLong_(v10)];
          }
          else if (v10 < 0)
          {
            [(JavaLangStringBuilder *)v11 insertWithInt:(v8 - 1) withNSString:@"0."];
            [(JavaLangStringBuilder *)v11 insertWithInt:(v8 + 1) withCharArray:qword_1005608F0 withInt:0 withInt:~v10];
          }
          else
          {
            [(JavaLangStringBuilder *)v11 insertWithInt:(v9 - scale) withChar:46];
          }
          int v5 = [(JavaLangStringBuilder *)v11 description];
          goto LABEL_22;
        }
      }
      goto LABEL_24;
    }
  }
  return toStringImage;
}

- (id)toEngineeringString
{
  uint64_t v3 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!v3) {
    goto LABEL_45;
  }
  id result = [v3 description];
  id v5 = result;
  if (!self->scale__) {
    return result;
  }
  signed int v6 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!v6) {
    goto LABEL_45;
  }
  uint64_t v7 = (int)[v6 signum] >= 0 ? 1 : 2;
  if (!v5) {
    goto LABEL_45;
  }
  unint64_t v8 = (unint64_t)[v5 length];
  uint64_t v9 = (int)v8 - (self->scale__ + (unint64_t)v7);
  uint64_t v10 = new_JavaLangStringBuilder_initWithNSString_(v5);
  BOOL v11 = v10;
  int scale = self->scale__;
  if (scale < 1 || v9 < -6)
  {
    int v14 = (int)v9 % 3;
    if (!((int)v9 % 3))
    {
      uint64_t v21 = v7;
LABEL_35:
      if ((int)v8 - (int)v21 >= 1)
      {
        [(JavaLangStringBuilder *)v11 insertWithInt:v21 withChar:46];
        unint64_t v8 = (v8 + 1);
      }
      if (v9)
      {
        [(JavaLangStringBuilder *)v11 insertWithInt:v8 withChar:69];
        if (v9 >= 1)
        {
          unint64_t v8 = (v8 + 1);
          [(JavaLangStringBuilder *)v11 insertWithInt:v8 withChar:43];
        }
        [(JavaLangStringBuilder *)v11 insertWithInt:(v8 + 1) withNSString:JavaLangLong_toStringWithLong_(v9)];
      }
      goto LABEL_42;
    }
    int v15 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (v15)
    {
      int v16 = v8 - v7;
      unsigned int v17 = [v15 signum];
      int v18 = v14 + 3;
      if (v14 < 0)
      {
        int v19 = 0;
      }
      else
      {
        int v18 = (int)v9 % 3;
        int v19 = 3;
      }
      int v20 = v19 - v14;
      if (v17) {
        uint64_t v21 = (v18 + v7);
      }
      else {
        uint64_t v21 = v7;
      }
      if (v17) {
        v9 -= v18;
      }
      else {
        v9 += v20;
      }
      if (!v17) {
        int v18 = v20;
      }
      if (v16 <= 2 && v18 - v16 >= 1)
      {
        unsigned int v22 = v7 + v18 - v8 + 1;
        do
        {
          unint64_t v23 = v8;
          unint64_t v8 = (v8 + 1);
          [(JavaLangStringBuilder *)v11 insertWithInt:v23 withChar:48];
          --v22;
        }
        while (v22 > 1);
      }
      goto LABEL_35;
    }
LABEL_45:
    JreThrowNullPointerException();
  }
  if (v9 < 0)
  {
    [(JavaLangStringBuilder *)v10 insertWithInt:(v7 - 1) withNSString:@"0."];
    [(JavaLangStringBuilder *)v11 insertWithInt:(v7 + 1) withCharArray:qword_1005608F0 withInt:0 withInt:~v9];
  }
  else
  {
    [(JavaLangStringBuilder *)v10 insertWithInt:(v8 - scale) withChar:46];
  }
LABEL_42:
  return [(JavaLangStringBuilder *)v11 description];
}

- (id)toPlainString
{
  uint64_t v3 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!v3) {
    goto LABEL_27;
  }
  id result = [v3 description];
  id v5 = result;
  int scale = self->scale__;
  if (!scale || !self->bitLength_ && scale < 0 && self->smallValue_ != -1) {
    return result;
  }
  unsigned int v7 = [(JavaMathBigDecimal *)self signum];
  if (!v5) {
    goto LABEL_27;
  }
  unsigned int v8 = v7;
  uint64_t v9 = v7 >> 31;
  int v10 = self->scale__;
  unsigned int v11 = [v5 length];
  int v12 = JavaLangMath_absWithInt_(self->scale__);
  double v13 = new_JavaLangStringBuilder_initWithInt_(v11 + v12 + 1);
  int v14 = v13;
  if ((v8 & 0x80000000) != 0) {
    [(JavaLangStringBuilder *)v13 appendWithChar:45];
  }
  if (self->scale__ >= 1)
  {
    int v15 = v9 - [v5 length] + v10;
    if (v15 < 0)
    {
      uint64_t v20 = (v9 - v15);
      -[JavaLangStringBuilder appendWithNSString:](v14, "appendWithNSString:", [v5 substring:v9 endIndex:v20]);
      [(JavaLangStringBuilder *)v14 appendWithChar:46];
      unsigned int v17 = v5;
      uint64_t v18 = v20;
LABEL_23:
      -[JavaLangStringBuilder appendWithNSString:](v14, "appendWithNSString:", [v17 substring:v18]);
      goto LABEL_24;
    }
    [(JavaLangStringBuilder *)v14 appendWithNSString:@"0."];
    if (qword_1005608F0)
    {
      for (int i = *(_DWORD *)(qword_1005608F0 + 8); v15 > i; v15 -= i)
      {
        -[JavaLangStringBuilder appendWithCharArray:](v14, "appendWithCharArray:");
        int i = *(_DWORD *)(qword_1005608F0 + 8);
      }
      -[JavaLangStringBuilder appendWithCharArray:withInt:withInt:](v14, "appendWithCharArray:withInt:withInt:");
      unsigned int v17 = v5;
      uint64_t v18 = v9;
      goto LABEL_23;
    }
LABEL_27:
    JreThrowNullPointerException();
  }
  -[JavaLangStringBuilder appendWithNSString:](v14, "appendWithNSString:", [v5 substring:v9]);
  if (!qword_1005608F0) {
    goto LABEL_27;
  }
  for (int j = *(_DWORD *)(qword_1005608F0 + 8); v10 < -j; v10 += j)
  {
    -[JavaLangStringBuilder appendWithCharArray:](v14, "appendWithCharArray:");
    int j = *(_DWORD *)(qword_1005608F0 + 8);
  }
  -[JavaLangStringBuilder appendWithCharArray:withInt:withInt:](v14, "appendWithCharArray:withInt:withInt:");
LABEL_24:
  return [(JavaLangStringBuilder *)v14 description];
}

- (id)toBigInteger
{
  int scale = self->scale__;
  if (!scale || !self->bitLength_ && self->smallValue_ != -1)
  {
    return (id)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  }
  uint64_t v4 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  id v5 = (void *)v4;
  if ((scale & 0x80000000) == 0)
  {
    if (v4)
    {
      id v6 = JavaMathMultiplication_powerOf10WithLong_(self->scale__);
      return [v5 divideWithJavaMathBigInteger:v6];
    }
LABEL_16:
    JreThrowNullPointerException();
  }
  if (!v4) {
    goto LABEL_16;
  }
  id v8 = JavaMathMultiplication_powerOf10WithLong_(-(uint64_t)self->scale__);
  return [v5 multiplyWithJavaMathBigInteger:v8];
}

- (id)toBigIntegerExact
{
  int scale = self->scale__;
  if (!scale || (int bitLength = self->bitLength_) == 0 && self->smallValue_ != -1)
  {
    return (id)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  }
  if ((scale & 0x80000000) == 0)
  {
    int precision = self->precision_;
    if (precision <= 0)
    {
      double v6 = (double)(bitLength - 1) * 0.301029996;
      int v7 = (int)v6;
      if (v6 < 0.0) {
        unsigned int v8 = 0x80000000;
      }
      else {
        unsigned int v8 = 0x7FFFFFFF;
      }
      if (v7 == 0x80000000) {
        int v7 = v8;
      }
      int precision = v7 + 1;
    }
    if (scale > precision) {
      goto LABEL_32;
    }
    uint64_t v9 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
    if (v9)
    {
      if (scale > (int)[v9 getLowestSetBit]) {
        goto LABEL_32;
      }
      int v10 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
      if (v10)
      {
        unsigned int v11 = (unsigned int *)[v10 divideAndRemainderWithJavaMathBigInteger:JavaMathMultiplication_powerOf10WithLong_(self->scale__)];
        if (v11)
        {
          int v12 = v11;
          uint64_t v13 = v11[2];
          if ((int)v13 <= 1) {
            IOSArray_throwOutOfBoundsWithMsg(v13, 1);
          }
          int v14 = (void *)*((void *)v12 + 4);
          if (v14)
          {
            if (![v14 signum])
            {
              uint64_t v15 = v12[2];
              if ((int)v15 <= 0) {
                IOSArray_throwOutOfBoundsWithMsg(v15, 0);
              }
              return (id)*((void *)v12 + 3);
            }
LABEL_32:
            uint64_t v20 = new_JavaLangArithmeticException_initWithNSString_(@"Rounding necessary");
            objc_exception_throw(v20);
          }
        }
      }
    }
LABEL_29:
    JreThrowNullPointerException();
  }
  uint64_t v17 = -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!v17) {
    goto LABEL_29;
  }
  uint64_t v18 = (void *)v17;
  id v19 = JavaMathMultiplication_powerOf10WithLong_(-(uint64_t)self->scale__);
  return [v18 multiplyWithJavaMathBigInteger:v19];
}

- (int64_t)longLongValue
{
  int scale = self->scale__;
  if (scale < -63) {
    return 0;
  }
  int precision = self->precision_;
  if (precision <= 0)
  {
    double v4 = (double)(self->bitLength_ - 1) * 0.301029996;
    int v5 = (int)v4;
    if (v4 < 0.0) {
      unsigned int v6 = 0x80000000;
    }
    else {
      unsigned int v6 = 0x7FFFFFFF;
    }
    if (v5 == 0x80000000) {
      int v5 = v6;
    }
    int precision = v5 + 1;
  }
  if (scale > precision) {
    return 0;
  }
  id v8 = [(JavaMathBigDecimal *)self toBigInteger];
  if (!v8) {
    JreThrowNullPointerException();
  }
  return (int64_t)[v8 longLongValue];
}

- (int64_t)longValueExact
{
  return (int64_t)sub_10016CA50(self, 64);
}

- (int)intValue
{
  int scale = self->scale__;
  if (scale < -31) {
    return 0;
  }
  int precision = self->precision_;
  if (precision <= 0)
  {
    double v4 = (double)(self->bitLength_ - 1) * 0.301029996;
    int v5 = (int)v4;
    if (v4 < 0.0) {
      unsigned int v6 = 0x80000000;
    }
    else {
      unsigned int v6 = 0x7FFFFFFF;
    }
    if (v5 == 0x80000000) {
      int v5 = v6;
    }
    int precision = v5 + 1;
  }
  if (scale > precision) {
    return 0;
  }
  id v8 = [(JavaMathBigDecimal *)self toBigInteger];
  if (!v8) {
    JreThrowNullPointerException();
  }
  return [v8 intValue];
}

- (int)intValueExact
{
  return sub_10016CA50(self, 32);
}

- (signed)shortValueExact
{
  return (unsigned __int16)sub_10016CA50(self, 16);
}

- (char)byteValueExact
{
  return sub_10016CA50(self, 8);
}

- (float)floatValue
{
  int v3 = [(JavaMathBigDecimal *)self signum];
  *(float *)&double v4 = (float)v3;
  double v5 = (double)self->scale__ / 0.301029996;
  uint64_t v6 = (uint64_t)v5;
  unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 < 0.0) {
    unint64_t v7 = 0x8000000000000000;
  }
  if (v6 == 0x8000000000000000) {
    uint64_t v6 = v7;
  }
  uint64_t v8 = self->bitLength_ - v6;
  if (v8 < -149 || v3 == 0)
  {
    float v10 = 0.0;
    return *(float *)&v4 * v10;
  }
  if (v8 >= 130)
  {
    float v10 = INFINITY;
    return *(float *)&v4 * v10;
  }
  [(JavaMathBigDecimal *)self doubleValue];
  return v12;
}

- (double)doubleValue
{
  unsigned int v3 = [(JavaMathBigDecimal *)self signum];
  int v4 = v3;
  uint64_t bitLength = self->bitLength_;
  double v6 = (double)self->scale__ / 0.301029996;
  uint64_t v7 = (uint64_t)v6;
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 < 0.0) {
    unint64_t v8 = 0x8000000000000000;
  }
  if (v7 == 0x8000000000000000) {
    uint64_t v7 = v8;
  }
  uint64_t v9 = bitLength - v7;
  if (bitLength - v7 < -1074 || v3 == 0) {
    return (double)v4 * 0.0;
  }
  if (v9 >= 1026) {
    return (float)((float)v4 * INFINITY);
  }
  double v12 = (void *)-[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!v12) {
    goto LABEL_61;
  }
  id v13 = [v12 abs];
  uint64_t scale = self->scale__;
  if ((int)scale <= 0)
  {
    if (!v13) {
      goto LABEL_61;
    }
    id v17 = [v13 multiplyWithJavaMathBigInteger:JavaMathMultiplication_powerOf10WithLong_(-(int)scale)];
    int v16 = 1076;
  }
  else
  {
    id v15 = JavaMathMultiplication_powerOf10WithLong_(scale);
    if ((int)v9 > 99)
    {
      int v16 = 1074;
    }
    else
    {
      if (!v13) {
        goto LABEL_61;
      }
      id v13 = [v13 shiftLeftWithInt:(100 - v9)];
      int v16 = v9 + 974;
    }
    if (!v13) {
      goto LABEL_61;
    }
    uint64_t v18 = (unsigned int *)[v13 divideAndRemainderWithJavaMathBigInteger:v15];
    if (!v18) {
      goto LABEL_61;
    }
    id v19 = v18;
    uint64_t v20 = v18[2];
    if ((int)v20 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v20, 1);
    }
    uint64_t v21 = (void *)*((void *)v19 + 4);
    if (!v21) {
      goto LABEL_61;
    }
    id v22 = [v21 shiftLeftOneBit];
    if (!v22) {
      goto LABEL_61;
    }
    unsigned int v23 = [v22 compareToWithId:v15];
    uint64_t v24 = v19[2];
    if ((int)v24 <= 0) {
      IOSArray_throwOutOfBoundsWithMsg(v24, 0);
    }
    uint64_t v25 = (void *)*((void *)v19 + 3);
    if (!v25 || (id v26 = [v25 shiftLeftWithInt:2]) == 0) {
LABEL_61:
    }
      JreThrowNullPointerException();
    id v17 = [v26 addWithJavaMathBigInteger:JavaMathBigInteger_valueOfWithLong_((int)((v23 + 3) * v23) / 2 + 1)];
  }
  if (!v17) {
    goto LABEL_61;
  }
  int v27 = [v17 getLowestSetBit];
  unsigned int v28 = [v17 bitLength];
  uint64_t v29 = v28 - 54;
  if ((int)v29 >= 1)
  {
    id v30 = [v17 shiftRightWithInt:v29];
    if (v30)
    {
      uint64_t v31 = (uint64_t)[v30 longLongValue];
      if ((~(_BYTE)v31 & 3) != 0) {
        int v32 = v31 & (v27 < (int)v29);
      }
      else {
        int v32 = 1;
      }
      uint64_t v33 = v31 + 2;
      if (!v32) {
        uint64_t v33 = v31;
      }
      goto LABEL_40;
    }
    goto LABEL_61;
  }
  uint64_t v31 = (void)[v17 longLongValue] << (54 - v28);
  uint64_t v33 = v31 + 2;
  if ((~(_BYTE)v31 & 3) != 0) {
    uint64_t v33 = v31;
  }
LABEL_40:
  unsigned int v34 = v28 - 53;
  if ((v33 & 0x40000000000000) == 0) {
    unsigned int v34 = v28 - 54;
  }
  uint64_t v35 = v34 + v16;
  if ((int)v35 >= 2047) {
    return (float)((float)v4 * INFINITY);
  }
  char v36 = 1;
  if ((v33 & 0x40000000000000) != 0) {
    char v36 = 2;
  }
  if ((int)v35 <= 0)
  {
    if ((int)v35 > -54)
    {
      uint64_t v38 = v31 >> 1 >> -(char)v35;
      if ((~(_BYTE)v38 & 3) == 0
        || (v38 & 1) != 0
        && (((0xFFFFFFFFFFFFFFFFLL >> (v35 + 63)) & (v31 >> 1)) != 0
          ? (BOOL v39 = v27 < (int)v29)
          : (BOOL v39 = 0),
            v39))
      {
        ++v38;
      }
      uint64_t v35 = 0;
      uint64_t v37 = v38 >> 1;
      goto LABEL_58;
    }
    return (double)v4 * 0.0;
  }
  uint64_t v37 = v33 >> v36;
LABEL_58:
  return JavaLangDouble_longBitsToDoubleWithLong_(v4 & 0x8000000000000000 | (v35 << 52) | v37 & 0xFFFFFFFFFFFFFLL);
}

- (id)ulp
{
  return JavaMathBigDecimal_valueOfWithLong_withInt_(1uLL, self->scale__);
}

- (void)inplaceRoundWithJavaMathMathContext:(id)a3
{
}

+ (int)longCompareToWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  if ((atomic_load_explicit(JavaMathBigDecimal__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (a3 >= a4) {
    int v6 = 0;
  }
  else {
    int v6 = -1;
  }
  if (a3 > a4) {
    return 1;
  }
  else {
    return v6;
  }
}

- (void)smallRoundWithJavaMathMathContext:(id)a3 withInt:(int)a4
{
}

+ (int)roundingBehaviorWithInt:(int)a3 withInt:(int)a4 withJavaMathRoundingModeEnum:(id)a5
{
  return sub_10016D208(a3, *(uint64_t *)&a4, a5);
}

- (int64_t)valueExactWithInt:(int)a3
{
  return (int64_t)sub_10016CA50(self, a3);
}

- (int)aproxPrecision
{
  int precision = self->precision_;
  if (precision <= 0)
  {
    double v3 = (double)(self->bitLength_ - 1) * 0.301029996;
    int v4 = (int)v3;
    if (v3 < 0.0) {
      unsigned int v5 = 0x80000000;
    }
    else {
      unsigned int v5 = 0x7FFFFFFF;
    }
    if (v4 == 0x80000000) {
      int v4 = v5;
    }
    return v4 + 1;
  }
  return precision;
}

+ (int)toIntScaleWithLong:(int64_t)a3
{
  return sub_100168968(a3);
}

+ (id)zeroScaledByWithLong:(int64_t)a3
{
  return sub_1001688C0(a3);
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3 || ([a3 defaultReadObject], (intVal = self->intVal_) == 0)) {
    JreThrowNullPointerException();
  }
  int v5 = [(JavaMathBigInteger *)intVal bitLength];
  self->bitLength_ = v5;
  if (v5 <= 63) {
    self->smallValue_ = [(JavaMathBigInteger *)self->intVal_ longLongValue];
  }
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  -[JavaMathBigDecimal unscaledValue]_0((uint64_t)self);
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
}

- (void)setUnscaledValueWithJavaMathBigInteger:(id)a3
{
}

+ (int)bitLengthWithLong:(int64_t)a3
{
  return sub_10016D4B0(a3);
}

+ (int)bitLengthWithInt:(int)a3
{
  return sub_10016D508(a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaMathBigDecimal;
  [(JavaMathBigDecimal *)&v3 dealloc];
}

- (const)objCType
{
  return "d";
}

- (void)getValue:(void *)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    int v2 = [JavaMathBigDecimal alloc];
    sub_1001668D8((uint64_t)v2, 0, 0);
    JreStrongAssignAndConsume(&JavaMathBigDecimal_ZERO_, v2);
    objc_super v3 = [JavaMathBigDecimal alloc];
    sub_1001668D8((uint64_t)v3, 1, 0);
    JreStrongAssignAndConsume((id *)&JavaMathBigDecimal_ONE_, v3);
    int v4 = [JavaMathBigDecimal alloc];
    sub_1001668D8((uint64_t)v4, 10, 0);
    JreStrongAssignAndConsume(&JavaMathBigDecimal_TEN_, v4);
    v24[6] = xmmword_10031FC70;
    v24[7] = unk_10031FC80;
    v24[8] = xmmword_10031FC90;
    uint64_t v25 = 1000000000000000000;
    v24[2] = xmmword_10031FC30;
    v24[3] = unk_10031FC40;
    v24[4] = xmmword_10031FC50;
    v24[5] = unk_10031FC60;
    v24[0] = xmmword_10031FC10;
    v24[1] = unk_10031FC20;
    JreStrongAssignAndConsume((id *)&qword_1005608D0, +[IOSLongArray newArrayWithLongs:v24 count:19]);
    v23[10] = xmmword_10031FD48;
    v23[11] = unk_10031FD58;
    v23[12] = xmmword_10031FD68;
    v23[13] = unk_10031FD78;
    v23[6] = xmmword_10031FD08;
    v23[7] = unk_10031FD18;
    v23[8] = xmmword_10031FD28;
    v23[9] = unk_10031FD38;
    v23[2] = xmmword_10031FCC8;
    v23[3] = unk_10031FCD8;
    v23[4] = xmmword_10031FCE8;
    v23[5] = unk_10031FCF8;
    v23[0] = xmmword_10031FCA8;
    v23[1] = unk_10031FCB8;
    JreStrongAssignAndConsume((id *)&qword_1005608F8, +[IOSLongArray newArrayWithLongs:v23 count:28]);
    JreStrongAssignAndConsume((id *)&qword_100560900, +[IOSIntArray newArrayWithLength:*(int *)(qword_1005608F8 + 8)]);
    JreStrongAssignAndConsume((id *)&qword_1005608D8, +[IOSIntArray newArrayWithLength:*(int *)(qword_1005608D0 + 8)]);
    id v5 = +[IOSObjectArray newArrayWithLength:11 type:JavaMathBigDecimal_class_()];
    JreStrongAssignAndConsume((id *)&qword_100560908, v5);
    id v6 = +[IOSObjectArray newArrayWithLength:11 type:JavaMathBigDecimal_class_()];
    JreStrongAssignAndConsume((id *)&qword_100560910, v6);
    JreStrongAssignAndConsume((id *)&qword_1005608F0, +[IOSCharArray newArrayWithLength:100]);
    if (*(int *)(qword_100560910 + 8) < 1)
    {
      LODWORD(v7) = 0;
    }
    else
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = qword_100560908;
        uint64_t v9 = [JavaMathBigDecimal alloc];
        sub_1001668D8((uint64_t)v9, v7, 0);
        IOSObjectArray_SetAndConsume(v8, v7, v9);
        uint64_t v10 = qword_100560910;
        unsigned int v11 = [JavaMathBigDecimal alloc];
        sub_1001668D8((uint64_t)v11, 0, v7);
        IOSObjectArray_SetAndConsume(v10, v7, v11);
        uint64_t v12 = *(int *)(qword_1005608F0 + 8);
        if (v7 >= v12) {
          IOSArray_throwOutOfBoundsWithMsg(v12, v7);
        }
        *(_WORD *)(qword_1005608F0 + 12 + 2 * v7++) = 48;
      }
      while (v7 < *(int *)(qword_100560910 + 8));
    }
    uint64_t v13 = qword_1005608F0;
    if ((int)v7 < *(_DWORD *)(qword_1005608F0 + 8))
    {
      uint64_t v14 = v7;
      do
      {
        *(_WORD *)(v13 + 12 + 2 * v14++) = 48;
        uint64_t v13 = qword_1005608F0;
      }
      while (*(_DWORD *)(qword_1005608F0 + 8) > (int)v14);
    }
    if (*(int *)(qword_100560900 + 8) >= 1)
    {
      uint64_t v15 = 0;
      do
      {
        uint64_t v16 = *(int *)(qword_1005608F8 + 8);
        if (v15 >= v16) {
          IOSArray_throwOutOfBoundsWithMsg(v16, v15);
        }
        int v17 = sub_10016D4B0(*(void *)(qword_1005608F8 + 16 + 8 * v15));
        uint64_t v18 = *(int *)(qword_100560900 + 8);
        if (v15 >= v18) {
          IOSArray_throwOutOfBoundsWithMsg(v18, v15);
        }
        *(_DWORD *)(qword_100560900 + 12 + 4 * v15++) = v17;
      }
      while (v15 < *(int *)(qword_100560900 + 8));
    }
    if (*(int *)(qword_1005608D8 + 8) >= 1)
    {
      uint64_t v19 = 0;
      do
      {
        uint64_t v20 = *(int *)(qword_1005608D0 + 8);
        if (v19 >= v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, v19);
        }
        int v21 = sub_10016D4B0(*(void *)(qword_1005608D0 + 16 + 8 * v19));
        uint64_t v22 = *(int *)(qword_1005608D8 + 8);
        if (v19 >= v22) {
          IOSArray_throwOutOfBoundsWithMsg(v22, v19);
        }
        *(_DWORD *)(qword_1005608D8 + 12 + 4 * v19++) = v21;
      }
      while (v19 < *(int *)(qword_1005608D8 + 8));
    }
    if ((atomic_load_explicit(JavaMathMultiplication__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    JreStrongAssign((id *)&qword_1005608E8, (void *)JavaMathMultiplication_bigTenPows_);
    if ((atomic_load_explicit(JavaMathMultiplication__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    JreStrongAssign((id *)&qword_1005608E0, (void *)JavaMathMultiplication_bigFivePows_);
    atomic_store(1u, (unsigned __int8 *)JavaMathBigDecimal__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004010B0;
}

@end
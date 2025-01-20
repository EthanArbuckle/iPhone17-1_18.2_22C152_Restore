@interface JavaMathBigInteger
+ (const)__metadata;
+ (id)getPowerOfTwoWithInt:(int)a3;
+ (id)probablePrimeWithInt:(int)a3 withJavaUtilRandom:(id)a4;
+ (id)valueOfWithLong:(int64_t)a3;
+ (void)initialize;
+ (void)setFromStringWithJavaMathBigInteger:(id)a3 withNSString:(id)a4 withInt:(int)a5;
- (BOOL)equalsArraysWithIntArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOne;
- (BOOL)isProbablePrimeWithInt:(int)a3;
- (BOOL)testBitWithInt:(int)a3;
- (JavaMathBigInteger)initWithByteArray:(id)a3;
- (JavaMathBigInteger)initWithInt:(int)a3 withByteArray:(id)a4;
- (JavaMathBigInteger)initWithInt:(int)a3 withInt:(int)a4;
- (JavaMathBigInteger)initWithInt:(int)a3 withInt:(int)a4 withIntArray:(id)a5;
- (JavaMathBigInteger)initWithInt:(int)a3 withInt:(int)a4 withJavaUtilRandom:(id)a5;
- (JavaMathBigInteger)initWithInt:(int)a3 withIntArray:(id)a4;
- (JavaMathBigInteger)initWithInt:(int)a3 withJavaUtilRandom:(id)a4;
- (JavaMathBigInteger)initWithInt:(int)a3 withLong:(int64_t)a4;
- (JavaMathBigInteger)initWithNSString:(id)a3;
- (JavaMathBigInteger)initWithNSString:(id)a3 withInt:(int)a4;
- (NSString)description;
- (const)objCType;
- (float)floatValue;
- (id)abs;
- (id)addWithJavaMathBigInteger:(id)a3;
- (id)andNotWithJavaMathBigInteger:(id)a3;
- (id)and__WithJavaMathBigInteger:(id)a3;
- (id)clearBitWithInt:(int)a3;
- (id)copy__;
- (id)divideAndRemainderWithJavaMathBigInteger:(id)a3;
- (id)divideWithJavaMathBigInteger:(id)a3;
- (id)flipBitWithInt:(int)a3;
- (id)gcdWithJavaMathBigInteger:(id)a3;
- (id)maxWithJavaMathBigInteger:(id)a3;
- (id)minWithJavaMathBigInteger:(id)a3;
- (id)modInverseWithJavaMathBigInteger:(id)a3;
- (id)modPowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4;
- (id)modWithJavaMathBigInteger:(id)a3;
- (id)multiplyWithJavaMathBigInteger:(id)a3;
- (id)negate;
- (id)nextProbablePrime;
- (id)or__WithJavaMathBigInteger:(id)a3;
- (id)powWithInt:(int)a3;
- (id)remainderWithJavaMathBigInteger:(id)a3;
- (id)setBitWithInt:(int)a3;
- (id)shiftLeftOneBit;
- (id)shiftLeftWithInt:(int)a3;
- (id)shiftRightWithInt:(int)a3;
- (id)subtractWithJavaMathBigInteger:(id)a3;
- (id)toByteArray;
- (id)toStringWithInt:(int)a3;
- (id)xor__WithJavaMathBigInteger:(id)a3;
- (int)compareToWithId:(id)a3;
- (int)getFirstNonzeroDigit;
- (int)getLowestSetBit;
- (int)intValue;
- (int)signum;
- (int64_t)longLongValue;
- (uint64_t)cutOffLeadingZeroes;
- (unint64_t)hash;
- (void)dealloc;
- (void)getValue:(void *)a3;
- (void)putBytesNegativeToIntegersWithByteArray:(id)a3;
- (void)putBytesPositiveToIntegersWithByteArray:(id)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)unCache;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaMathBigInteger

- (JavaMathBigInteger)initWithInt:(int)a3 withJavaUtilRandom:(id)a4
{
  return self;
}

- (JavaMathBigInteger)initWithInt:(int)a3 withInt:(int)a4 withJavaUtilRandom:(id)a5
{
  return self;
}

- (JavaMathBigInteger)initWithNSString:(id)a3
{
  return self;
}

- (JavaMathBigInteger)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

- (JavaMathBigInteger)initWithInt:(int)a3 withByteArray:(id)a4
{
  return self;
}

- (JavaMathBigInteger)initWithByteArray:(id)a3
{
  return self;
}

- (JavaMathBigInteger)initWithInt:(int)a3 withInt:(int)a4
{
  return self;
}

- (JavaMathBigInteger)initWithInt:(int)a3 withInt:(int)a4 withIntArray:(id)a5
{
  self->firstNonzeroDigit_ = -2;
  self->hashCode_ = 0;
  self->sign_ = a3;
  self->numberLength_ = a4;
  JreStrongAssign((id *)&self->digits_, a5);
  return self;
}

- (JavaMathBigInteger)initWithInt:(int)a3 withLong:(int64_t)a4
{
  return self;
}

- (JavaMathBigInteger)initWithInt:(int)a3 withIntArray:(id)a4
{
  return self;
}

+ (id)valueOfWithLong:(int64_t)a3
{
  return JavaMathBigInteger_valueOfWithLong_(a3);
}

- (id)toByteArray
{
  if (self->sign_)
  {
    int v3 = [(JavaMathBigInteger *)self bitLength];
    uint64_t v4 = [(JavaMathBigInteger *)self getFirstNonzeroDigit];
    int v5 = v3 >> 3;
    int v6 = v5 + 1;
    v7 = +[IOSByteArray arrayWithLength:(v3 >> 3) + 1];
    v8 = v7;
    if (v5 + 1 - 4 * self->numberLength_ == 1)
    {
      uint64_t size = v7->super.size_;
      if ((int)size <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(size, 0);
      }
      *((unsigned char *)&v8->super.size_ + 4) = self->sign_ >> 31;
      int v10 = 4;
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
      if ((v6 & 3) != 0) {
        int v10 = v6 & 3;
      }
      else {
        int v10 = 4;
      }
    }
    if (self->sign_ < 0)
    {
      digits = self->digits_;
      if (!digits) {
        goto LABEL_56;
      }
      int v21 = v5;
      uint64_t v22 = digits->super.size_;
      if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)v22) {
        IOSArray_throwOutOfBoundsWithMsg(v22, v4);
      }
      int v23 = -*(&digits->super.size_ + (int)v4 + 1);
      int v24 = v4 + 1;
      if (v4 + 1 == self->numberLength_) {
        int v25 = v10;
      }
      else {
        int v25 = 4;
      }
      if (v25 <= 1) {
        int v26 = 1;
      }
      else {
        int v26 = v25;
      }
      int v27 = v21 - 4 * v4;
      do
      {
        uint64_t v28 = v8->super.size_;
        if (v27 < 0 || v27 >= (int)v28) {
          IOSArray_throwOutOfBoundsWithMsg(v28, v27);
        }
        *((unsigned char *)&v8->super.size_ + v27 + 4) = v23;
        v23 >>= 8;
        --v27;
        --v26;
      }
      while (v26);
      LODWORD(v29) = v27 + 1;
      while ((int)v29 > v11)
      {
        v30 = self->digits_;
        uint64_t v31 = v24;
        uint64_t v32 = v30->super.size_;
        if (v24 < 0 || v24 >= (int)v32) {
          IOSArray_throwOutOfBoundsWithMsg(v32, v24);
        }
        ++v24;
        if (v31 + 1 == self->numberLength_) {
          int v25 = v10;
        }
        if (v25 >= 1)
        {
          int v33 = ~*(&v30->super.size_ + v31 + 1);
          int v34 = v25;
          do
          {
            uint64_t v35 = v8->super.size_;
            uint64_t v29 = (v29 - 1);
            if ((int)v29 < 0 || (int)v29 >= (int)v35) {
              IOSArray_throwOutOfBoundsWithMsg(v35, v29);
            }
            *((unsigned char *)&v8->super.size_ + (int)v29 + 4) = v33;
            v33 >>= 8;
            --v34;
          }
          while (v34);
        }
      }
    }
    else
    {
      LODWORD(v12) = v6 - 4 * v4;
      if ((int)v12 > v11)
      {
        int v13 = 4;
        while (1)
        {
          v14 = self->digits_;
          if (!v14) {
            break;
          }
          uint64_t v15 = v14->super.size_;
          if ((v4 & 0x80000000) != 0 || (int)v4 >= (int)v15) {
            IOSArray_throwOutOfBoundsWithMsg(v15, v4);
          }
          uint64_t v16 = (v4 + 1);
          if (v16 == self->numberLength_) {
            int v13 = v10;
          }
          if (v13 >= 1)
          {
            int v17 = *(&v14->super.size_ + (int)v4 + 1);
            int v18 = v13;
            do
            {
              uint64_t v19 = v8->super.size_;
              uint64_t v12 = (v12 - 1);
              if ((int)v12 < 0 || (int)v12 >= (int)v19) {
                IOSArray_throwOutOfBoundsWithMsg(v19, v12);
              }
              *((unsigned char *)&v8->super.size_ + (int)v12 + 4) = v17;
              v17 >>= 8;
              --v18;
            }
            while (v18);
          }
          uint64_t v4 = v16;
          if ((int)v12 <= v11) {
            return v8;
          }
        }
LABEL_56:
        JreThrowNullPointerException();
      }
    }
  }
  else
  {
    char v37 = 0;
    return +[IOSByteArray arrayWithBytes:&v37 count:1];
  }
  return v8;
}

+ (void)setFromStringWithJavaMathBigInteger:(id)a3 withNSString:(id)a4 withInt:(int)a5
{
}

- (id)abs
{
  if ((*((_DWORD *)self + 5) & 0x80000000) != 0)
  {
    v2 = new_JavaMathBigInteger_initWithInt_withInt_withIntArray_(1, *((_DWORD *)self + 4), *((void **)self + 1));
    return v2;
  }
  return self;
}

- (id)negate
{
  int v2 = *((_DWORD *)self + 5);
  if (v2)
  {
    int v3 = new_JavaMathBigInteger_initWithInt_withInt_withIntArray_(-v2, *((_DWORD *)self + 4), *((void **)self + 1));
    return v3;
  }
  return self;
}

- (id)addWithJavaMathBigInteger:(id)a3
{
  return JavaMathElementary_addWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)self, (uint64_t)a3);
}

- (id)subtractWithJavaMathBigInteger:(id)a3
{
  return JavaMathElementary_subtractWithJavaMathBigInteger_withJavaMathBigInteger_((uint64_t)self, (uint64_t)a3);
}

- (int)signum
{
  return self->sign_;
}

- (id)shiftRightWithInt:(int)a3
{
  if (a3 && *((_DWORD *)self + 5))
  {
    if (a3 < 1) {
      return JavaMathBitLevel_shiftLeftWithJavaMathBigInteger_withInt_((uint64_t)self, -a3);
    }
    else {
      return JavaMathBitLevel_shiftRightWithJavaMathBigInteger_withInt_((uint64_t)self, a3);
    }
  }
  return self;
}

- (id)shiftLeftWithInt:(int)a3
{
  if (a3 && *((_DWORD *)self + 5))
  {
    if (a3 < 1) {
      return JavaMathBitLevel_shiftRightWithJavaMathBigInteger_withInt_((uint64_t)self, -a3);
    }
    else {
      return JavaMathBitLevel_shiftLeftWithJavaMathBigInteger_withInt_((uint64_t)self, a3);
    }
  }
  return self;
}

- (id)shiftLeftOneBit
{
  if (*((_DWORD *)self + 5)) {
    return JavaMathBitLevel_shiftLeftOneBitWithJavaMathBigInteger_((uint64_t)self);
  }
  return self;
}

- (BOOL)testBitWithInt:(int)a3
{
  if (a3)
  {
    char v4 = a3;
    if (a3 < 0)
    {
      int v13 = new_JavaLangArithmeticException_initWithNSString_(@"Negative bit address");
      objc_exception_throw(v13);
    }
    uint64_t v5 = a3 >> 5;
    if ((int)v5 >= self->numberLength_) {
      return self->sign_ >> 31;
    }
    digits = self->digits_;
    if (digits)
    {
      uint64_t size = digits->super.size_;
      if ((int)v5 >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, a3 >> 5);
      }
      int v8 = *(&digits->super.size_ + v5 + 1);
      if ((self->sign_ & 0x80000000) == 0
        || ((int v9 = [(JavaMathBigInteger *)self getFirstNonzeroDigit],
             LOBYTE(v10) = 0,
             v9 != v5)
          ? (int v8 = ~v8)
          : (int v8 = -v8),
            (int)v5 >= v9))
      {
        LOBYTE(v10) = (v8 & (1 << v4)) != 0;
      }
      return v10;
    }
LABEL_17:
    JreThrowNullPointerException();
  }
  int v11 = self->digits_;
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = v11->super.size_;
  if ((int)v12 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v12, 0);
  }
  LOBYTE(v10) = *(unsigned char *)(&v11->super.size_ + 1) & 1;
  return v10;
}

- (id)setBitWithInt:(int)a3
{
  if (-[JavaMathBigInteger testBitWithInt:](self, "testBitWithInt:")) {
    return self;
  }
  return JavaMathBitLevel_flipBitWithJavaMathBigInteger_withInt_((uint64_t)self, a3);
}

- (id)clearBitWithInt:(int)a3
{
  if (!-[JavaMathBigInteger testBitWithInt:](self, "testBitWithInt:")) {
    return self;
  }
  return JavaMathBitLevel_flipBitWithJavaMathBigInteger_withInt_((uint64_t)self, a3);
}

- (id)flipBitWithInt:(int)a3
{
  if (a3 < 0)
  {
    uint64_t v5 = new_JavaLangArithmeticException_initWithNSString_(@"Negative bit address");
    objc_exception_throw(v5);
  }
  return JavaMathBitLevel_flipBitWithJavaMathBigInteger_withInt_((uint64_t)self, a3);
}

- (int)getLowestSetBit
{
  if (!self->sign_) {
    return -1;
  }
  uint64_t v3 = [(JavaMathBigInteger *)self getFirstNonzeroDigit];
  digits = self->digits_;
  if (!digits) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = v3;
  int v6 = 32 * v3;
  uint64_t v7 = (int)v3;
  uint64_t size = digits->super.size_;
  if ((v5 & 0x80000000) != 0 || (int)v5 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v5);
  }
  return JavaLangInteger_numberOfTrailingZerosWithInt_(*(&digits->super.size_ + v7 + 1)) + v6;
}

- (id)and__WithJavaMathBigInteger:(id)a3
{
  return JavaMathLogical_and__WithJavaMathBigInteger_withJavaMathBigInteger_(self, a3);
}

- (id)or__WithJavaMathBigInteger:(id)a3
{
  return JavaMathLogical_or__WithJavaMathBigInteger_withJavaMathBigInteger_(self, (JavaMathBigInteger *)a3);
}

- (id)xor__WithJavaMathBigInteger:(id)a3
{
  return JavaMathLogical_xor__WithJavaMathBigInteger_withJavaMathBigInteger_(self, a3);
}

- (id)andNotWithJavaMathBigInteger:(id)a3
{
  return JavaMathLogical_andNotWithJavaMathBigInteger_withJavaMathBigInteger_(self, a3);
}

- (int)intValue
{
  digits = self->digits_;
  if (!digits) {
    JreThrowNullPointerException();
  }
  int sign = self->sign_;
  uint64_t size = digits->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  return *(&digits->super.size_ + 1) * sign;
}

- (int64_t)longLongValue
{
  digits = (unsigned int *)self->digits_;
  if (self->numberLength_ >= 2)
  {
    if (digits)
    {
      uint64_t v4 = digits[2];
      if ((int)v4 <= 1) {
        IOSArray_throwOutOfBoundsWithMsg(v4, 1);
      }
      unint64_t v5 = digits[3] | ((unint64_t)digits[4] << 32);
      return v5 * self->sign_;
    }
LABEL_9:
    JreThrowNullPointerException();
  }
  if (!digits) {
    goto LABEL_9;
  }
  uint64_t v6 = digits[2];
  if ((int)v6 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v6, 0);
  }
  unint64_t v5 = digits[3];
  return v5 * self->sign_;
}

- (float)floatValue
{
  [(JavaMathBigInteger *)self doubleValue];
  return v2;
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  int sign = self->sign_;
  int v6 = *((_DWORD *)a3 + 5);
  if (sign > v6) {
    return 1;
  }
  if (sign < v6) {
    return -1;
  }
  int numberLength = self->numberLength_;
  int v8 = *((_DWORD *)a3 + 4);
  if (numberLength <= v8)
  {
    if (numberLength < v8) {
      return -v6;
    }
    else {
      sign *= JavaMathElementary_compareArraysWithIntArray_withIntArray_withInt_((uint64_t)self->digits_, *((void *)a3 + 1), numberLength);
    }
  }
  return sign;
}

- (id)minWithJavaMathBigInteger:(id)a3
{
  if (-[JavaMathBigInteger compareToWithId:](self, "compareToWithId:") == -1) {
    return self;
  }
  else {
    return a3;
  }
}

- (id)maxWithJavaMathBigInteger:(id)a3
{
  if (-[JavaMathBigInteger compareToWithId:](self, "compareToWithId:") == 1) {
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
    digits = self->digits_;
    if (!digits) {
LABEL_6:
    }
      JreThrowNullPointerException();
    int v4 = 0;
    uint64_t v5 = 0;
    while (v5 < digits->super.size_)
    {
      int v4 = *(&digits->super.size_ + v5 + 1) + 33 * v4;
      self->hashCode_ = v4;
      ++v5;
      digits = self->digits_;
      if (!digits) {
        goto LABEL_6;
      }
    }
    int hashCode = self->sign_ * v4;
    self->hashCode_ = hashCode;
  }
  return hashCode;
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
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->sign_ != *((_DWORD *)a3 + 5) || self->numberLength_ != *((_DWORD *)a3 + 4)) {
    return 0;
  }
  uint64_t v5 = *((void *)a3 + 1);
  return [(JavaMathBigInteger *)self equalsArraysWithIntArray:v5];
}

- (BOOL)equalsArraysWithIntArray:(id)a3
{
  uint64_t v4 = (self->numberLength_ - 1);
  do
  {
    unsigned int v5 = v4;
    if ((v4 & 0x80000000) != 0) {
      break;
    }
    digits = self->digits_;
    if (!digits) {
      goto LABEL_12;
    }
    uint64_t size = digits->super.size_;
    if ((int)v4 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v4);
    }
    if (!a3) {
LABEL_12:
    }
      JreThrowNullPointerException();
    int v8 = *(&digits->super.size_ + v4 + 1);
    uint64_t v9 = *((unsigned int *)a3 + 2);
    if ((int)v4 >= (int)v9) {
      IOSArray_throwOutOfBoundsWithMsg(v9, v4);
    }
    uint64_t v4 = (v4 - 1);
  }
  while (v8 == *((_DWORD *)a3 + v5 + 3));
  return v5 >> 31;
}

- (NSString)description
{
  return (NSString *)JavaMathConversion_toDecimalScaledStringWithJavaMathBigInteger_withInt_((uint64_t)self, 0);
}

- (id)toStringWithInt:(int)a3
{
  return (id)JavaMathConversion_bigInteger2StringWithJavaMathBigInteger_withInt_((uint64_t)self, *(uint64_t *)&a3);
}

- (id)gcdWithJavaMathBigInteger:(id)a3
{
  id v4 = [(JavaMathBigInteger *)self abs];
  if (!a3) {
    goto LABEL_24;
  }
  id v5 = v4;
  id v6 = [a3 abs];
  if (!v5) {
    goto LABEL_24;
  }
  id v7 = v6;
  if (![v5 signum]) {
    return v7;
  }
  if (!v7) {
    goto LABEL_24;
  }
  if (![v7 signum]) {
    return v5;
  }
  int v8 = *((_DWORD *)v5 + 4);
  if (v8 != 1)
  {
    if (v8 != 2) {
      goto LABEL_19;
    }
    uint64_t v9 = *((void *)v5 + 1);
    if (!v9) {
      goto LABEL_24;
    }
    uint64_t v10 = *(unsigned int *)(v9 + 8);
    if ((int)v10 <= 1) {
      IOSArray_throwOutOfBoundsWithMsg(v10, 1);
    }
    if (*(int *)(v9 + 16) < 1) {
      goto LABEL_19;
    }
  }
  int v11 = *((_DWORD *)v7 + 4);
  if (v11 == 1)
  {
LABEL_16:
    unint64_t v14 = JavaMathDivision_gcdBinaryWithLong_withLong_((unint64_t)[v5 longLongValue], (unint64_t)objc_msgSend(v7, "longLongValue"));
    return JavaMathBigInteger_valueOfWithLong_(v14);
  }
  if (v11 == 2)
  {
    uint64_t v12 = *((void *)v7 + 1);
    if (v12)
    {
      uint64_t v13 = *(unsigned int *)(v12 + 8);
      if ((int)v13 <= 1) {
        IOSArray_throwOutOfBoundsWithMsg(v13, 1);
      }
      if (*(int *)(v12 + 16) >= 1) {
        goto LABEL_16;
      }
      goto LABEL_19;
    }
LABEL_24:
    JreThrowNullPointerException();
  }
LABEL_19:
  id v16 = [v5 copy];
  id v17 = [v7 copy];
  return JavaMathDivision_gcdBinaryWithJavaMathBigInteger_withJavaMathBigInteger_(v16, v17);
}

- (id)multiplyWithJavaMathBigInteger:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (!*((_DWORD *)a3 + 5) || !self->sign_) {
    return (id)JavaMathBigInteger_ZERO_;
  }
  return JavaMathMultiplication_multiplyWithJavaMathBigInteger_withJavaMathBigInteger_((int *)self, (int *)a3);
}

- (id)powWithInt:(int)a3
{
  if (a3 < 0)
  {
    uint64_t v12 = new_JavaLangArithmeticException_initWithNSString_(@"Negative exponent");
    objc_exception_throw(v12);
  }
  uint64_t v3 = *(void *)&a3;
  id v4 = self;
  if (a3 == 1) {
    return v4;
  }
  if (!a3) {
    return (id)JavaMathBigInteger_ONE_;
  }
  if ([(JavaMathBigInteger *)self isEqual:JavaMathBigInteger_ONE_]
    || [(JavaMathBigInteger *)v4 isEqual:JavaMathBigInteger_ZERO_])
  {
    return v4;
  }
  if ([(JavaMathBigInteger *)v4 testBitWithInt:0])
  {
    return JavaMathMultiplication_powWithJavaMathBigInteger_withInt_(v4, v3);
  }
  else
  {
    LODWORD(v6) = 0;
    LODWORD(v7) = 0;
    do
    {
      uint64_t v7 = (v7 + 1);
      uint64_t v6 = (v6 + v3);
    }
    while (![(JavaMathBigInteger *)v4 testBitWithInt:v7]);
    PowerOfTwoWithInt = JavaMathBigInteger_getPowerOfTwoWithInt_(v6);
    if (!PowerOfTwoWithInt
      || (v9 = PowerOfTwoWithInt, (id v10 = [(JavaMathBigInteger *)v4 shiftRightWithInt:v7]) == 0))
    {
      JreThrowNullPointerException();
    }
    id v11 = [v10 powWithInt:v3];
    return [(JavaMathBigInteger *)v9 multiplyWithJavaMathBigInteger:v11];
  }
}

- (id)divideAndRemainderWithJavaMathBigInteger:(id)a3
{
  if (!a3) {
LABEL_18:
  }
    JreThrowNullPointerException();
  int v3 = *((_DWORD *)a3 + 5);
  if (!v3)
  {
    uint64_t v22 = new_JavaLangArithmeticException_initWithNSString_(@"BigInteger divide by zero");
    objc_exception_throw(v22);
  }
  uint64_t v5 = *((unsigned int *)a3 + 4);
  uint64_t v6 = (unsigned int *)*((void *)a3 + 1);
  if (v5 != 1)
  {
    digits = (unsigned int *)self->digits_;
    uint64_t numberLength = self->numberLength_;
    if (numberLength == v5)
    {
      if ((JavaMathElementary_compareArraysWithIntArray_withIntArray_withInt_((uint64_t)self->digits_, *((void *)a3 + 1), *((_DWORD *)a3 + 4)) & 0x80000000) == 0)
      {
LABEL_11:
        int sign = self->sign_;
        int v14 = numberLength - v5 + 1;
        if (sign == v3) {
          int v15 = 1;
        }
        else {
          int v15 = -1;
        }
        id v16 = +[IOSIntArray arrayWithLength:v14];
        id v17 = JavaMathDivision_divideWithIntArray_withInt_withIntArray_withInt_withIntArray_withInt_((uint64_t)v16, v14, digits, numberLength, v6, v5);
        int v18 = new_JavaMathBigInteger_initWithInt_withInt_withIntArray_(v15, v14, v16);
        uint64_t v19 = new_JavaMathBigInteger_initWithInt_withInt_withIntArray_(sign, v5, v17);
        -[JavaMathBigInteger cutOffLeadingZeroes]_0((uint64_t)v18);
        -[JavaMathBigInteger cutOffLeadingZeroes]_0((uint64_t)v19);
        v23[0] = v18;
        v23[1] = v19;
        uint64_t v20 = JavaMathBigInteger_class_();
        int v21 = v23;
        return +[IOSObjectArray arrayWithObjects:v21 count:2 type:v20];
      }
    }
    else if ((int)numberLength > (int)v5)
    {
      goto LABEL_11;
    }
    v24[0] = JavaMathBigInteger_ZERO_;
    v24[1] = self;
    uint64_t v20 = JavaMathBigInteger_class_();
    int v21 = v24;
    return +[IOSObjectArray arrayWithObjects:v21 count:2 type:v20];
  }
  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v7 = v6[2];
  if ((int)v7 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v7, 0);
  }
  unsigned int v8 = v6[3];
  int v9 = *((_DWORD *)a3 + 5);
  return JavaMathDivision_divideAndRemainderByIntegerWithJavaMathBigInteger_withInt_withInt_((uint64_t)self, v8, v9);
}

- (uint64_t)cutOffLeadingZeroes
{
  do
  {
    int v2 = *(_DWORD *)(a1 + 16);
    uint64_t v3 = (v2 - 1);
    if (v2 < 1) {
      break;
    }
    uint64_t v4 = *(void *)(a1 + 8);
    if (!v4) {
      goto LABEL_13;
    }
    *(_DWORD *)(a1 + 16) = v3;
    uint64_t v5 = *(unsigned int *)(v4 + 8);
    if (v2 > (int)v5) {
      IOSArray_throwOutOfBoundsWithMsg(v5, (v2 - 1));
    }
  }
  while (!*(_DWORD *)(v4 + 12 + 4 * v3));
  uint64_t v6 = *(void *)(a1 + 8);
  if (!v6) {
LABEL_13:
  }
    JreThrowNullPointerException();
  int v7 = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 16) = v7 + 1;
  uint64_t result = *(unsigned int *)(v6 + 8);
  if (v7 < 0 || v7 >= (int)result) {
    IOSArray_throwOutOfBoundsWithMsg(result, v7);
  }
  if (!*(_DWORD *)(v6 + 12 + 4 * v7)) {
    *(_DWORD *)(a1 + 20) = 0;
  }
  return result;
}

- (id)divideWithJavaMathBigInteger:(id)a3
{
  if (!a3) {
    goto LABEL_36;
  }
  int v4 = *((_DWORD *)a3 + 5);
  if (!v4)
  {
    int v25 = new_JavaLangArithmeticException_initWithNSString_(@"BigInteger divide by zero");
    objc_exception_throw(v25);
  }
  if ([a3 isOne])
  {
    if (*((int *)a3 + 5) <= 0)
    {
      return [(JavaMathBigInteger *)self negate];
    }
    return self;
  }
  int sign = self->sign_;
  uint64_t numberLength = self->numberLength_;
  uint64_t v9 = *((unsigned int *)a3 + 4);
  if (v9 + numberLength != 2)
  {
    if (numberLength == v9)
    {
      int v16 = JavaMathElementary_compareArraysWithIntArray_withIntArray_withInt_((uint64_t)self->digits_, *((void *)a3 + 1), self->numberLength_);
      if (v16 != -1)
      {
        if (!v16)
        {
          id v17 = &JavaMathBigInteger_ONE_;
          if (sign != v4) {
            id v17 = &JavaMathBigInteger_MINUS_ONE_;
          }
          return (id)*v17;
        }
        goto LABEL_25;
      }
    }
    else if ((int)numberLength > (int)v9)
    {
LABEL_25:
      int v18 = numberLength - v9 + 1;
      uint64_t v19 = +[IOSIntArray arrayWithLength:v18];
      uint64_t v20 = v19;
      if (sign == v4) {
        int v21 = 1;
      }
      else {
        int v21 = -1;
      }
      digits = (unsigned int *)self->digits_;
      int v23 = (unsigned int *)*((void *)a3 + 1);
      if (v9 != 1)
      {
        JavaMathDivision_divideWithIntArray_withInt_withIntArray_withInt_withIntArray_withInt_((uint64_t)v19, v18, digits, numberLength, v23, v9);
LABEL_34:
        self = new_JavaMathBigInteger_initWithInt_withInt_withIntArray_(v21, v18, v20);
        -[JavaMathBigInteger cutOffLeadingZeroes]_0((uint64_t)self);
        return self;
      }
      if (v23)
      {
        uint64_t v24 = v23[2];
        if ((int)v24 <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(v24, 0);
        }
        JavaMathDivision_divideArrayByIntWithIntArray_withIntArray_withInt_withInt_((uint64_t)v20, (uint64_t)digits, numberLength, v23[3]);
        goto LABEL_34;
      }
LABEL_36:
      JreThrowNullPointerException();
    }
    return (id)JavaMathBigInteger_ZERO_;
  }
  id v10 = self->digits_;
  if (!v10) {
    goto LABEL_36;
  }
  uint64_t size = v10->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  unsigned int v12 = *(&v10->super.size_ + 1);
  uint64_t v13 = *((void *)a3 + 1);
  uint64_t v14 = *(unsigned int *)(v13 + 8);
  if ((int)v14 <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(v14, 0);
  }
  if (sign == v4) {
    unint64_t v15 = v12 / *(_DWORD *)(v13 + 12);
  }
  else {
    unint64_t v15 = -(uint64_t)(v12 / *(_DWORD *)(v13 + 12));
  }
  return JavaMathBigInteger_valueOfWithLong_(v15);
}

- (id)remainderWithJavaMathBigInteger:(id)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  if (!*((_DWORD *)a3 + 5))
  {
    uint64_t v14 = new_JavaLangArithmeticException_initWithNSString_(@"BigInteger divide by zero");
    objc_exception_throw(v14);
  }
  int v4 = self;
  uint64_t numberLength = self->numberLength_;
  uint64_t v6 = *((int *)a3 + 4);
  if (numberLength == v6)
  {
    if (JavaMathElementary_compareArraysWithIntArray_withIntArray_withInt_((uint64_t)self->digits_, *((void *)a3 + 1), numberLength) == -1)return v4; {
    goto LABEL_7;
    }
  }
  if ((int)numberLength > (int)v6)
  {
LABEL_7:
    int v7 = +[IOSIntArray arrayWithLength:v6];
    if (v6 != 1)
    {
      uint64_t v9 = (unsigned int *)JavaMathDivision_divideWithIntArray_withInt_withIntArray_withInt_withIntArray_withInt_(0, (int)numberLength - (int)v6 + 1, (unsigned int *)v4->digits_, numberLength, *((unsigned int **)a3 + 1), v6);
LABEL_13:
      int v4 = new_JavaMathBigInteger_initWithInt_withInt_withIntArray_(v4->sign_, v6, v9);
      -[JavaMathBigInteger cutOffLeadingZeroes]_0((uint64_t)v4);
      return v4;
    }
    uint64_t v8 = *((void *)a3 + 1);
    if (v8)
    {
      uint64_t v9 = (unsigned int *)v7;
      uint64_t v10 = *(unsigned int *)(v8 + 8);
      if ((int)v10 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v10, 0);
      }
      unsigned int v11 = JavaMathDivision_remainderArrayByIntWithIntArray_withInt_withInt_((uint64_t)v4->digits_, numberLength, *(_DWORD *)(v8 + 12));
      uint64_t v12 = v9[2];
      if ((int)v12 <= 0) {
        IOSArray_throwOutOfBoundsWithMsg(v12, 0);
      }
      v9[3] = v11;
      goto LABEL_13;
    }
LABEL_15:
    JreThrowNullPointerException();
  }
  return v4;
}

- (id)modInverseWithJavaMathBigInteger:(id)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  if (*((int *)a3 + 5) <= 0)
  {
    CFStringRef v9 = @"BigInteger: modulus not positive";
    goto LABEL_18;
  }
  if (![(JavaMathBigInteger *)self testBitWithInt:0]
    && ([a3 testBitWithInt:0] & 1) == 0)
  {
LABEL_17:
    CFStringRef v9 = @"BigInteger not invertible.";
LABEL_18:
    uint64_t v10 = new_JavaLangArithmeticException_initWithNSString_((uint64_t)v9);
    objc_exception_throw(v10);
  }
  if ([a3 isOne]) {
    return (id)JavaMathBigInteger_ZERO_;
  }
  id v6 = [(JavaMathBigInteger *)self abs];
  if (!v6
    || (int v7 = JavaMathDivision_modInverseMontgomeryWithJavaMathBigInteger_withJavaMathBigInteger_([v6 modWithJavaMathBigInteger:a3], a3)) == 0)
  {
LABEL_15:
    JreThrowNullPointerException();
  }
  uint64_t v5 = v7;
  if (!v7->sign_) {
    goto LABEL_17;
  }
  if ((self->sign_ & 0x80000000) == 0) {
    return v5;
  }
  return [a3 subtractWithJavaMathBigInteger:v7];
}

- (id)modPowWithJavaMathBigInteger:(id)a3 withJavaMathBigInteger:(id)a4
{
  if (!a4) {
    goto LABEL_31;
  }
  if (*((int *)a4 + 5) <= 0)
  {
    int v16 = new_JavaLangArithmeticException_initWithNSString_(@"BigInteger: modulus not positive");
    objc_exception_throw(v16);
  }
  unsigned int v7 = [a4 isOne];
  if (!a3) {
    goto LABEL_31;
  }
  int v8 = *((_DWORD *)a3 + 5);
  if (v8 > 0 && self->sign_ == 0) {
    int v10 = 1;
  }
  else {
    int v10 = v7;
  }
  if (v10 == 1) {
    return (id)JavaMathBigInteger_ZERO_;
  }
  if (!v8)
  {
    id v13 = (id)JavaMathBigInteger_ONE_;
    if (JavaMathBigInteger_ONE_) {
      goto LABEL_27;
    }
    goto LABEL_31;
  }
  if (v8 < 0)
  {
    self = [(JavaMathBigInteger *)self modInverseWithJavaMathBigInteger:a4];
    a3 = [a3 negate];
  }
  if ([a4 testBitWithInt:0])
  {
    if (!self) {
      goto LABEL_31;
    }
    uint64_t v12 = JavaMathDivision_oddModPowWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_([(JavaMathBigInteger *)self abs], a3, (uint64_t)a4);
  }
  else
  {
    if (!self) {
      goto LABEL_31;
    }
    uint64_t v12 = JavaMathDivision_evenModPowWithJavaMathBigInteger_withJavaMathBigInteger_withJavaMathBigInteger_([(JavaMathBigInteger *)self abs], a3, a4);
  }
  unsigned int v11 = v12;
  if ((self->sign_ & 0x80000000) == 0) {
    return v11;
  }
  if (!a3) {
    goto LABEL_31;
  }
  if (![a3 testBitWithInt:0]) {
    return v11;
  }
  id v14 = [a4 subtractWithJavaMathBigInteger:JavaMathBigInteger_ONE_];
  if (!v14 || (id v13 = [v14 multiplyWithJavaMathBigInteger:v11]) == 0) {
LABEL_31:
  }
    JreThrowNullPointerException();
LABEL_27:
  return [v13 modWithJavaMathBigInteger:a4];
}

- (id)modWithJavaMathBigInteger:(id)a3
{
  if (!a3) {
    goto LABEL_8;
  }
  if (*((int *)a3 + 5) <= 0)
  {
    uint64_t v5 = new_JavaLangArithmeticException_initWithNSString_(@"BigInteger: modulus not positive");
    objc_exception_throw(v5);
  }
  id result = [(JavaMathBigInteger *)self remainderWithJavaMathBigInteger:a3];
  if (!result) {
LABEL_8:
  }
    JreThrowNullPointerException();
  if ((*((_DWORD *)result + 5) & 0x80000000) != 0)
  {
    return [result addWithJavaMathBigInteger:a3];
  }
  return result;
}

- (BOOL)isProbablePrimeWithInt:(int)a3
{
  id v4 = [(JavaMathBigInteger *)self abs];
  return JavaMathPrimality_isProbablePrimeWithJavaMathBigInteger_withInt_((uint64_t)v4, a3);
}

- (id)nextProbablePrime
{
  if (self->sign_ < 0)
  {
    [(JavaMathBigInteger *)self description];
    CFStringRef v10 = JreStrcat("$$", v3, v4, v5, v6, v7, v8, v9, @"start < 0: ");
    unsigned int v11 = new_JavaLangArithmeticException_initWithNSString_((uint64_t)v10);
    objc_exception_throw(v11);
  }
  return JavaMathPrimality_nextProbablePrimeWithJavaMathBigInteger_((uint64_t)self);
}

+ (id)probablePrimeWithInt:(int)a3 withJavaUtilRandom:(id)a4
{
  return JavaMathBigInteger_probablePrimeWithInt_withJavaUtilRandom_(*(uint64_t *)&a3, a4);
}

- (BOOL)isOne
{
  if (self->numberLength_ != 1) {
    return 0;
  }
  digits = self->digits_;
  if (!digits) {
    JreThrowNullPointerException();
  }
  uint64_t size = digits->super.size_;
  if ((int)size <= 0) {
    IOSArray_throwOutOfBoundsWithMsg(size, 0);
  }
  return *(&digits->super.size_ + 1) == 1;
}

- (void)putBytesPositiveToIntegersWithByteArray:(id)a3
{
}

- (void)putBytesNegativeToIntegersWithByteArray:(id)a3
{
}

- (int)getFirstNonzeroDigit
{
  LODWORD(v2) = self->firstNonzeroDigit_;
  if (v2 == -2)
  {
    if (self->sign_)
    {
      digits = self->digits_;
      if (!digits) {
LABEL_14:
      }
        JreThrowNullPointerException();
      uint64_t v2 = 0;
      while (1)
      {
        uint64_t size = digits->super.size_;
        if ((v2 & 0x80000000) != 0 || (int)v2 >= (int)size) {
          IOSArray_throwOutOfBoundsWithMsg(size, v2);
        }
        if (*(&digits->super.size_ + (int)v2 + 1)) {
          break;
        }
        uint64_t v2 = (v2 + 1);
        digits = self->digits_;
        if (!digits) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      LODWORD(v2) = -1;
    }
    self->firstNonzeroDigit_ = v2;
  }
  return v2;
}

- (id)copy__
{
  uint64_t v3 = +[IOSIntArray arrayWithLength:self->numberLength_];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->digits_, 0, v3, 0, self->numberLength_);
  uint64_t v4 = new_JavaMathBigInteger_initWithInt_withInt_withIntArray_(self->sign_, self->numberLength_, v3);
  return v4;
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  self->sign_ = self->signum_;
  sub_1001A2BC4((uint64_t)self, (uint64_t)self->magnitude_);
  -[JavaMathBigInteger cutOffLeadingZeroes]_0((uint64_t)self);
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  self->signum_ = [(JavaMathBigInteger *)self signum];
  id v5 = [(JavaMathBigInteger *)self abs];
  if (!v5 || (JreStrongAssign((id *)&self->magnitude_, [v5 toByteArray]), !a3)) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
}

- (void)unCache
{
  self->firstNonzeroDigit_ = -2;
}

+ (id)getPowerOfTwoWithInt:(int)a3
{
  return JavaMathBigInteger_getPowerOfTwoWithInt_(*(uint64_t *)&a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaMathBigInteger;
  [(JavaMathBigInteger *)&v3 dealloc];
}

- (const)objCType
{
  return "q";
}

- (void)getValue:(void *)a3
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v2, 0, 0);
    JreStrongAssignAndConsume((id *)&JavaMathBigInteger_ZERO_, v2);
    objc_super v3 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v3, 1, 1);
    JreStrongAssignAndConsume((id *)&JavaMathBigInteger_ONE_, v3);
    uint64_t v4 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v4, 1, 10);
    JreStrongAssignAndConsume((id *)&JavaMathBigInteger_TEN_, v4);
    id v5 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v5, -1, 1);
    JreStrongAssignAndConsume((id *)&JavaMathBigInteger_MINUS_ONE_, v5);
    uint64_t v19 = JavaMathBigInteger_ZERO_;
    uint64_t v20 = JavaMathBigInteger_ONE_;
    uint64_t v6 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v6, 1, 2);
    int v21 = v6;
    uint64_t v7 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v7, 1, 3);
    uint64_t v22 = v7;
    uint64_t v8 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v8, 1, 4);
    int v23 = v8;
    uint64_t v9 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v9, 1, 5);
    uint64_t v24 = v9;
    CFStringRef v10 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v10, 1, 6);
    int v25 = v10;
    unsigned int v11 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v11, 1, 7);
    int v26 = v11;
    uint64_t v12 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v12, 1, 8);
    int v27 = v12;
    id v13 = [JavaMathBigInteger alloc];
    JavaMathBigInteger_initWithInt_withInt_((uint64_t)v13, 1, 9);
    uint64_t v28 = v13;
    uint64_t v29 = JavaMathBigInteger_TEN_;
    id v14 = +[IOSObjectArray newArrayWithObjects:&v19 count:11 type:JavaMathBigInteger_class_()];
    JreStrongAssignAndConsume((id *)&JavaMathBigInteger_SMALL_VALUES_, v14);
    id v15 = +[IOSObjectArray newArrayWithLength:type:](IOSObjectArray, "newArrayWithLength:type:", 32, JavaMathBigInteger_class_(), v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    JreStrongAssignAndConsume((id *)&JavaMathBigInteger_TWO_POWS_, v15);
    uint64_t v16 = JavaMathBigInteger_TWO_POWS_;
    if (*(int *)(JavaMathBigInteger_TWO_POWS_ + 8) >= 1)
    {
      uint64_t v17 = 0;
      do
      {
        int v18 = JavaMathBigInteger_valueOfWithLong_(1 << v17);
        IOSObjectArray_Set(v16, v17++, v18);
        uint64_t v16 = JavaMathBigInteger_TWO_POWS_;
      }
      while (v17 < *(int *)(JavaMathBigInteger_TWO_POWS_ + 8));
    }
    atomic_store(1u, (unsigned __int8 *)JavaMathBigInteger__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100415688;
}

@end
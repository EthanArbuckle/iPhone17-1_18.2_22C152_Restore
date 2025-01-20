@interface JavaUtilRandom
+ (const)__metadata;
- (BOOL)nextBoolean;
- (JavaUtilRandom)init;
- (JavaUtilRandom)initWithLong:(int64_t)a3;
- (double)nextDouble;
- (double)nextGaussian;
- (float)nextFloat;
- (int)nextInt;
- (int)nextIntWithInt:(int)a3;
- (int)nextWithInt:(int)a3;
- (int64_t)nextLong;
- (void)nextBytesWithByteArray:(id)a3;
- (void)setSeedWithLong:(int64_t)a3;
@end

@implementation JavaUtilRandom

- (JavaUtilRandom)init
{
  uint64_t v3 = JavaLangSystem_nanoTime();
  unint64_t v4 = atomic_load((unint64_t *)&qword_100562F18);
  [(JavaUtilRandom *)self setSeedWithLong:v4 + v3];
  atomic_fetch_add(&qword_100562F18, 1uLL);
  return self;
}

- (JavaUtilRandom)initWithLong:(int64_t)a3
{
  return self;
}

- (int)nextWithInt:(int)a3
{
  char v3 = a3;
  objc_sync_enter(self);
  unint64_t v5 = (0x5DEECE66DLL * self->seed_ + 11) & 0xFFFFFFFFFFFFLL;
  self->seed_ = v5;
  unint64_t v6 = v5 >> (48 - v3);
  objc_sync_exit(self);
  return v6;
}

- (BOOL)nextBoolean
{
  return [(JavaUtilRandom *)self nextWithInt:1] != 0;
}

- (void)nextBytesWithByteArray:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *((unsigned int *)a3 + 2);
  if ((int)v5 >= 1)
  {
    int v6 = 0;
    int v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = (int)v5;
    do
    {
      if (v7)
      {
        --v7;
      }
      else
      {
        int v6 = [(JavaUtilRandom *)self nextInt];
        uint64_t v5 = *((unsigned int *)a3 + 2);
        uint64_t v9 = (int)v5;
        int v7 = 3;
      }
      if (v8 >= v9) {
        IOSArray_throwOutOfBoundsWithMsg(v5, v8);
      }
      *((unsigned char *)a3 + v8++ + 12) = v6;
      v6 >>= 8;
      uint64_t v5 = *((unsigned int *)a3 + 2);
      uint64_t v9 = (int)v5;
    }
    while (v8 < (int)v5);
  }
}

- (double)nextDouble
{
  uint64_t v3 = (uint64_t)[(JavaUtilRandom *)self nextWithInt:26] << 27;
  return (double)(v3 + [(JavaUtilRandom *)self nextWithInt:27]) * 1.11022302e-16;
}

- (float)nextFloat
{
  return (float)[(JavaUtilRandom *)self nextWithInt:24] * 0.000000059605;
}

- (double)nextGaussian
{
  objc_sync_enter(self);
  if (self->haveNextNextGaussian_)
  {
    self->haveNextNextGaussian_ = 0;
    double nextNextGaussian = self->nextNextGaussian_;
  }
  else
  {
    do
    {
      do
      {
        [(JavaUtilRandom *)self nextDouble];
        double v5 = v4;
        [(JavaUtilRandom *)self nextDouble];
        double v6 = v5 * 2.0 + -1.0;
        double v8 = v7 * 2.0 + -1.0;
        double v9 = v8 * v8 + v6 * v6;
      }
      while (v9 >= 1.0);
    }
    while (v9 == 0.0);
    JavaLangStrictMath_logWithDouble_(v8 * v8 + v6 * v6);
    double v11 = JavaLangStrictMath_sqrtWithDouble_(v10 * -2.0 / v9);
    self->nextNextGaussian_ = v8 * v11;
    self->haveNextNextGaussian_ = 1;
    double nextNextGaussian = v6 * v11;
  }
  objc_sync_exit(self);
  return nextNextGaussian;
}

- (int)nextInt
{
  return [(JavaUtilRandom *)self nextWithInt:32];
}

- (int)nextIntWithInt:(int)a3
{
  if (a3 <= 0)
  {
    CFStringRef v13 = JreStrcat("$I", (uint64_t)a2, *(uint64_t *)&a3, v3, v4, v5, v6, v7, @"n <= 0: ");
    v14 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v13);
    objc_exception_throw(v14);
  }
  int v10 = a3 - 1;
  if ((a3 & (a3 - 1)) != 0)
  {
    do
    {
      signed int v12 = [(JavaUtilRandom *)self nextWithInt:31];
      LODWORD(v11) = v12 % a3;
    }
    while (v10 + v12 - v12 % a3 < 0);
  }
  else
  {
    return ([(JavaUtilRandom *)self nextWithInt:31] * (unint64_t)a3) >> 31;
  }
  return v11;
}

- (int64_t)nextLong
{
  uint64_t v3 = (void)[(JavaUtilRandom *)self nextWithInt:32] << 32;
  return v3 + [(JavaUtilRandom *)self nextWithInt:32];
}

- (void)setSeedWithLong:(int64_t)a3
{
  objc_sync_enter(self);
  self->seed_ = a3 & 0xFFFFFFFFFFFFLL ^ 0x5DEECE66DLL;
  self->haveNextNextGaussian_ = 0;
  objc_sync_exit(self);
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004851B0;
}

@end
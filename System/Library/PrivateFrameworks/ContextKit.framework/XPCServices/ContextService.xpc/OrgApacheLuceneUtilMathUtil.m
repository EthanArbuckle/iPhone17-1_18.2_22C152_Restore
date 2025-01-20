@interface OrgApacheLuceneUtilMathUtil
+ (double)acoshWithDouble:(double)a3;
+ (double)logWithDouble:(double)a3 withDouble:(double)a4;
+ (int)logWithLong:(int64_t)a3 withInt:(int)a4;
+ (int64_t)gcdWithLong:(int64_t)a3 withLong:(int64_t)a4;
@end

@implementation OrgApacheLuceneUtilMathUtil

+ (int)logWithLong:(int64_t)a3 withInt:(int)a4
{
  return OrgApacheLuceneUtilMathUtil_logWithLong_withInt_(a3, a4);
}

+ (double)logWithDouble:(double)a3 withDouble:(double)a4
{
  double v5 = JavaLangMath_logWithDouble_(a4);
  return v5 / JavaLangMath_logWithDouble_(a3);
}

+ (int64_t)gcdWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  return OrgApacheLuceneUtilMathUtil_gcdWithLong_withLong_(a3, a4);
}

+ (double)acoshWithDouble:(double)a3
{
  double v3 = JavaLangMath_sqrtWithDouble_(a3 * a3 + -1.0) + a3;
  return JavaLangMath_logWithDouble_(v3);
}

@end
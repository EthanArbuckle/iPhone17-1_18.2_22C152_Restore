@interface OrgApacheLuceneUtilPackedPackedInts_Format_$1Enum
- (OrgApacheLuceneUtilPackedPackedInts_Format_$1Enum)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5;
- (int64_t)byteCountWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_Format_$1Enum

- (int64_t)byteCountWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  double v5 = (double)a4 * (double)a5;
  if (a3 <= 0)
  {
    double v9 = JavaLangMath_ceilWithDouble_(v5 * 0.015625);
    uint64_t v10 = (uint64_t)v9;
    uint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    if (v9 < 0.0) {
      uint64_t v11 = 0;
    }
    if (v10 == 0x8000000000000000) {
      uint64_t v10 = v11;
    }
    return 8 * v10;
  }
  else
  {
    double v6 = JavaLangMath_ceilWithDouble_(v5 * 0.125);
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6 < 0.0) {
      int64_t v7 = 0x8000000000000000;
    }
    if ((uint64_t)v6 == 0x8000000000000000) {
      return v7;
    }
    else {
      return (uint64_t)v6;
    }
  }
}

- (OrgApacheLuceneUtilPackedPackedInts_Format_$1Enum)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5
{
  *(&self->super.super.ordinal_ + 1) = a3;
  return self;
}

@end
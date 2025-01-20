@interface OrgApacheLuceneUtilPackedPackedInts_Format_$2Enum
- (BOOL)isSupportedWithInt:(int)a3;
- (OrgApacheLuceneUtilPackedPackedInts_Format_$2Enum)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5;
- (float)overheadPerValueWithInt:(int)a3;
- (int)longCountWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
@end

@implementation OrgApacheLuceneUtilPackedPackedInts_Format_$2Enum

- (int)longCountWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  double v5 = JavaLangMath_ceilWithDouble_((double)a4 / (double)(64 / a5));
  if (v5 < 0.0) {
    int v6 = 0x80000000;
  }
  else {
    int v6 = 0x7FFFFFFF;
  }
  if ((int)v5 == 0x80000000) {
    return v6;
  }
  else {
    return (int)v5;
  }
}

- (BOOL)isSupportedWithInt:(int)a3
{
  return OrgApacheLuceneUtilPackedPacked64SingleBlock_isSupportedWithInt_(a3);
}

- (float)overheadPerValueWithInt:(int)a3
{
  return (float)(64 % a3) / (float)(64 / a3);
}

- (OrgApacheLuceneUtilPackedPackedInts_Format_$2Enum)initWithInt:(int)a3 withNSString:(id)a4 withInt:(int)a5
{
  *(&self->super.super.ordinal_ + 1) = a3;
  return self;
}

@end
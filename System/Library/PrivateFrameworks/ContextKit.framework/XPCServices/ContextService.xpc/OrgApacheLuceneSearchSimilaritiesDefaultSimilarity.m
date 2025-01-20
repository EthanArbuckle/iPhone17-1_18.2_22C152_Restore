@interface OrgApacheLuceneSearchSimilaritiesDefaultSimilarity
+ (void)initialize;
- (BOOL)getDiscountOverlaps;
- (OrgApacheLuceneSearchSimilaritiesDefaultSimilarity)init;
- (float)coordWithInt:(int)a3 withInt:(int)a4;
- (float)decodeNormValueWithLong:(int64_t)a3;
- (float)idfWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (float)lengthNormWithOrgApacheLuceneIndexFieldInvertState:(id)a3;
- (float)queryNormWithFloat:(float)a3;
- (float)scorePayloadWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilBytesRef:(id)a6;
- (float)sloppyFreqWithInt:(int)a3;
- (float)tfWithFloat:(float)a3;
- (id)description;
- (int64_t)encodeNormValueWithFloat:(float)a3;
- (void)setDiscountOverlapsWithBoolean:(BOOL)a3;
@end

@implementation OrgApacheLuceneSearchSimilaritiesDefaultSimilarity

- (OrgApacheLuceneSearchSimilaritiesDefaultSimilarity)init
{
  self->discountOverlaps_ = 1;
  return self;
}

- (float)coordWithInt:(int)a3 withInt:(int)a4
{
  return (float)a3 / (float)a4;
}

- (float)queryNormWithFloat:(float)a3
{
  return 1.0 / JavaLangMath_sqrtWithDouble_(a3);
}

- (int64_t)encodeNormValueWithFloat:(float)a3
{
  return OrgApacheLuceneUtilSmallFloat_floatToByte315WithFloat_(a3);
}

- (float)decodeNormValueWithLong:(int64_t)a3
{
  if (!qword_10055FE98) {
    JreThrowNullPointerException();
  }
  uint64_t v3 = *(unsigned int *)(qword_10055FE98 + 8);
  if ((int)v3 <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(v3, a3);
  }
  return *(float *)(qword_10055FE98 + 12 + 4 * a3);
}

- (float)lengthNormWithOrgApacheLuceneIndexFieldInvertState:(id)a3
{
  if (!self->discountOverlaps_)
  {
    if (a3)
    {
      int v5 = [a3 getLength];
      goto LABEL_6;
    }
LABEL_7:
    JreThrowNullPointerException();
  }
  if (!a3) {
    goto LABEL_7;
  }
  unsigned int v4 = [a3 getLength];
  int v5 = v4 - [a3 getNumOverlap];
LABEL_6:
  [a3 getBoost];
  float v7 = v6;
  float v8 = 1.0 / JavaLangMath_sqrtWithDouble_((double)v5);
  return v7 * v8;
}

- (float)tfWithFloat:(float)a3
{
  return JavaLangMath_sqrtWithDouble_(a3);
}

- (float)sloppyFreqWithInt:(int)a3
{
  return 1.0 / (float)(a3 + 1);
}

- (float)scorePayloadWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilBytesRef:(id)a6
{
  return 1.0;
}

- (float)idfWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  return JavaLangMath_logWithDouble_((double)a4 / (double)(a3 + 1)) + 1.0;
}

- (void)setDiscountOverlapsWithBoolean:(BOOL)a3
{
  self->discountOverlaps_ = a3;
}

- (BOOL)getDiscountOverlaps
{
  return self->discountOverlaps_;
}

- (id)description
{
  return @"DefaultSimilarity";
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_10055FE98, +[IOSFloatArray newArrayWithLength:256]);
    for (uint64_t i = 0; i != 256; ++i)
    {
      double v3 = OrgApacheLuceneUtilSmallFloat_byte315ToFloatWithByte_((char)i);
      uint64_t v4 = *(int *)(qword_10055FE98 + 8);
      if (i >= v4) {
        IOSArray_throwOutOfBoundsWithMsg(v4, i);
      }
      *(_DWORD *)(qword_10055FE98 + 12 + 4 * i) = LODWORD(v3);
    }
    atomic_store(1u, OrgApacheLuceneSearchSimilaritiesDefaultSimilarity__initialized);
  }
}

@end
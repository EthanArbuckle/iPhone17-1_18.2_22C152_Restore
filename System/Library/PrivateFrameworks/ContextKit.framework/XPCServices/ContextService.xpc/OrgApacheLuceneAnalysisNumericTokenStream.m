@interface OrgApacheLuceneAnalysisNumericTokenStream
- (BOOL)incrementToken;
- (OrgApacheLuceneAnalysisNumericTokenStream)init;
- (OrgApacheLuceneAnalysisNumericTokenStream)initWithInt:(int)a3;
- (OrgApacheLuceneAnalysisNumericTokenStream)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3 withInt:(int)a4;
- (id)description;
- (id)setDoubleValueWithDouble:(double)a3;
- (id)setFloatValueWithFloat:(float)a3;
- (id)setIntValueWithInt:(int)a3;
- (id)setLongValueWithLong:(int64_t)a3;
- (int)getPrecisionStep;
- (void)dealloc;
- (void)reset;
@end

@implementation OrgApacheLuceneAnalysisNumericTokenStream

- (OrgApacheLuceneAnalysisNumericTokenStream)init
{
  return self;
}

- (OrgApacheLuceneAnalysisNumericTokenStream)initWithInt:(int)a3
{
  return self;
}

- (OrgApacheLuceneAnalysisNumericTokenStream)initWithOrgApacheLuceneUtilAttributeFactory:(id)a3 withInt:(int)a4
{
  return self;
}

- (id)setLongValueWithLong:(int64_t)a3
{
  numericAtt = self->numericAtt_;
  if (!numericAtt) {
    JreThrowNullPointerException();
  }
  self->valSize_ = 64;
  [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttribute *)numericAtt init__WithLong:a3 withInt:64 withInt:self->precisionStep_ withInt:-self->precisionStep_];
  return self;
}

- (id)setIntValueWithInt:(int)a3
{
  numericAtt = self->numericAtt_;
  if (!numericAtt) {
    JreThrowNullPointerException();
  }
  self->valSize_ = 32;
  [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttribute *)numericAtt init__WithLong:a3 withInt:32 withInt:self->precisionStep_ withInt:-self->precisionStep_];
  return self;
}

- (id)setDoubleValueWithDouble:(double)a3
{
  numericAtt = self->numericAtt_;
  if (!numericAtt) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = OrgApacheLuceneUtilNumericUtils_doubleToSortableLongWithDouble_(a3);
  self->valSize_ = 64;
  [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttribute *)numericAtt init__WithLong:v5 withInt:64 withInt:self->precisionStep_ withInt:-self->precisionStep_];
  return self;
}

- (id)setFloatValueWithFloat:(float)a3
{
  numericAtt = self->numericAtt_;
  if (!numericAtt) {
    JreThrowNullPointerException();
  }
  int v5 = OrgApacheLuceneUtilNumericUtils_floatToSortableIntWithFloat_(a3);
  self->valSize_ = 32;
  [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttribute *)numericAtt init__WithLong:v5 withInt:32 withInt:self->precisionStep_ withInt:-self->precisionStep_];
  return self;
}

- (void)reset
{
  if (!self->valSize_)
  {
    v4 = new_JavaLangIllegalStateException_initWithNSString_(@"call set???Value() before usage");
    objc_exception_throw(v4);
  }
  if (!self->numericAtt_) {
    JreThrowNullPointerException();
  }
  uint64_t v2 = -self->precisionStep_;
  numericAtt = self->numericAtt_;
  [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttribute *)numericAtt setShiftWithInt:v2];
}

- (BOOL)incrementToken
{
  if (!self->valSize_)
  {
    v9 = new_JavaLangIllegalStateException_initWithNSString_(@"call set???Value() before usage");
    objc_exception_throw(v9);
  }
  [(OrgApacheLuceneUtilAttributeSource *)self clearAttributes];
  numericAtt = self->numericAtt_;
  if (!numericAtt) {
    goto LABEL_8;
  }
  int v4 = [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttribute *)numericAtt incShift];
  typeAtt = self->typeAtt_;
  if (!typeAtt) {
    goto LABEL_8;
  }
  v6 = &OrgApacheLuceneAnalysisNumericTokenStream_TOKEN_TYPE_FULL_PREC_;
  if (v4) {
    v6 = &OrgApacheLuceneAnalysisNumericTokenStream_TOKEN_TYPE_LOWER_PREC_;
  }
  [(OrgApacheLuceneAnalysisTokenattributesTypeAttribute *)typeAtt setTypeWithNSString:*v6];
  posIncrAtt = self->posIncrAtt_;
  if (!posIncrAtt) {
LABEL_8:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneAnalysisTokenattributesPositionIncrementAttribute *)posIncrAtt setPositionIncrementWithInt:v4 == 0];
  return v4 < self->valSize_;
}

- (int)getPrecisionStep
{
  return self->precisionStep_;
}

- (id)description
{
  id v3 = objc_msgSend(-[OrgApacheLuceneAnalysisNumericTokenStream getClass](self, "getClass"), "getSimpleName");
  numericAtt = self->numericAtt_;
  if (!numericAtt) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttribute *)numericAtt getValueSize];
  [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttribute *)self->numericAtt_ getShift];
  return (id)JreStrcat("$$I$I$IC", v5, v6, v7, v8, v9, v10, v11, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisNumericTokenStream;
  [(OrgApacheLuceneUtilAttributeSource *)&v3 dealloc];
}

@end
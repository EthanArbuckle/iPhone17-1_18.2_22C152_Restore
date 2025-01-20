@interface OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl)init;
- (id)clone;
- (id)getBytesRef;
- (int)getShift;
- (int)getValueSize;
- (int)incShift;
- (int64_t)getRawValue;
- (unint64_t)hash;
- (void)copyToWithOrgApacheLuceneUtilAttributeImpl:(id)a3;
- (void)dealloc;
- (void)init__WithLong:(int64_t)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)reflectWithWithOrgApacheLuceneUtilAttributeReflector:(id)a3;
- (void)setShiftWithInt:(int)a3;
@end

@implementation OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl

- (OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl)init
{
  return self;
}

- (id)getBytesRef
{
  int valueSize = self->valueSize_;
  int64_t value = self->value_;
  if (valueSize == 64) {
    OrgApacheLuceneUtilNumericUtils_longToPrefixCodedWithLong_withInt_withOrgApacheLuceneUtilBytesRefBuilder_(value, self->shift_, self->bytes_);
  }
  else {
    OrgApacheLuceneUtilNumericUtils_intToPrefixCodedWithInt_withInt_withOrgApacheLuceneUtilBytesRefBuilder_(value, self->shift_, self->bytes_);
  }
  bytes = self->bytes_;
  if (!bytes) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilBytesRefBuilder *)bytes get];
}

- (int)getShift
{
  return self->shift_;
}

- (void)setShiftWithInt:(int)a3
{
  self->shift_ = a3;
}

- (int)incShift
{
  int v2 = self->shift_ + self->precisionStep_;
  self->shift_ = v2;
  return v2;
}

- (int64_t)getRawValue
{
  return (-1 << self->shift_) & self->value_;
}

- (int)getValueSize
{
  return self->valueSize_;
}

- (void)init__WithLong:(int64_t)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  self->value_ = a3;
  self->valueSize_ = a4;
  self->precisionStep_ = a5;
  self->shift_ = a6;
}

- (void)reflectWithWithOrgApacheLuceneUtilAttributeReflector:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  objc_msgSend(a3, "reflectWithIOSClass:withNSString:withId:", OrgApacheLuceneAnalysisTokenattributesTermToBytesRefAttribute_class_(), @"bytes", -[OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl getBytesRef](self, "getBytesRef"));
  if (qword_10055FE68 != -1) {
    dispatch_once(&qword_10055FE68, &stru_1003F1850);
  }
  [a3 reflectWithIOSClass:qword_10055FE60 withNSString:@"shift" withId:JavaLangInteger_valueOfWithInt_(self->shift_)];
  if (qword_10055FE68 != -1) {
    dispatch_once(&qword_10055FE68, &stru_1003F1850);
  }
  objc_msgSend(a3, "reflectWithIOSClass:withNSString:withId:", qword_10055FE60, @"rawValue", JavaLangLong_valueOfWithLong_(-[OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl getRawValue](self, "getRawValue")));
  if (qword_10055FE68 != -1) {
    dispatch_once(&qword_10055FE68, &stru_1003F1850);
  }
  uint64_t v5 = qword_10055FE60;
  v6 = JavaLangInteger_valueOfWithInt_(self->valueSize_);
  [a3 reflectWithIOSClass:v5 withNSString:@"valueSize" withId:v6];
}

- (void)copyToWithOrgApacheLuceneUtilAttributeImpl:(id)a3
{
  if (qword_10055FE68 == -1)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_8:
    JreThrowNullPointerException();
  }
  dispatch_once(&qword_10055FE68, &stru_1003F1850);
  if (!a3) {
    goto LABEL_8;
  }
LABEL_3:
  if (([(id)qword_10055FE60 isInstance:a3] & 1) == 0) {
    JreThrowClassCastException();
  }
  int64_t value = self->value_;
  uint64_t valueSize = self->valueSize_;
  uint64_t precisionStep = self->precisionStep_;
  uint64_t shift = self->shift_;
  objc_msgSend(a3, "init__WithLong:withInt:withInt:withInt:", value, valueSize, precisionStep, shift);
}

- (id)clone
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl;
  v3 = [(OrgApacheLuceneUtilAttributeImpl *)&v6 clone];
  objc_opt_class();
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  v4 = new_OrgApacheLuceneUtilBytesRefBuilder_init();
  JreStrongAssignAndConsume(v3 + 4, v4);
  objc_msgSend(v3[4], "copyBytesWithOrgApacheLuceneUtilBytesRef:", -[OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl getBytesRef](self, "getBytesRef"));
  return v3;
}

- (unint64_t)hash
{
  v5[0] = JavaLangInteger_valueOfWithInt_(self->precisionStep_);
  v5[1] = JavaLangInteger_valueOfWithInt_(self->shift_);
  v5[2] = JavaLangLong_valueOfWithLong_(self->value_);
  v5[3] = JavaLangInteger_valueOfWithInt_(self->valueSize_);
  v3 = +[IOSObjectArray arrayWithObjects:v5 count:4 type:NSObject_class_()];
  return (int)OrgLukhnosPortmobileUtilObjects_hash__WithNSObjectArray_(v3);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    id v5 = [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl *)self getClass];
    if (v5 == [a3 getClass])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        JreThrowClassCastException();
      }
      if (self->precisionStep_ == *((_DWORD *)a3 + 6)
        && self->shift_ == *((_DWORD *)a3 + 5)
        && self->value_ == *((void *)a3 + 1))
      {
        return self->valueSize_ == *((_DWORD *)a3 + 4);
      }
    }
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl;
  [(OrgApacheLuceneAnalysisNumericTokenStream_NumericTermAttributeImpl *)&v3 dealloc];
}

@end
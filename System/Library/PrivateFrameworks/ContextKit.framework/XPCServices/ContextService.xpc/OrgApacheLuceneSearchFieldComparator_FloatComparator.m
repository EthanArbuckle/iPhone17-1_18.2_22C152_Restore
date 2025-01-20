@interface OrgApacheLuceneSearchFieldComparator_FloatComparator
- (OrgApacheLuceneSearchFieldComparator_FloatComparator)initWithInt:(int)a3 withNSString:(id)a4 withJavaLangFloat:(id)a5;
- (id)valueWithInt:(int)a3;
- (int)compareBottomWithInt:(int)a3;
- (int)compareTopWithInt:(int)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)copy__WithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setBottomWithInt:(int)a3;
- (void)setTopValueWithId:(id)a3;
@end

@implementation OrgApacheLuceneSearchFieldComparator_FloatComparator

- (OrgApacheLuceneSearchFieldComparator_FloatComparator)initWithInt:(int)a3 withNSString:(id)a4 withJavaLangFloat:(id)a5
{
  return self;
}

- (int)compareWithInt:(int)a3 withInt:(int)a4
{
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  if (a4 < 0 || (int)size <= a4) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a4);
  }
  float v6 = *((float *)&values->super.size_ + a4 + 1);
  float v7 = *((float *)&values->super.size_ + a3 + 1);
  return JavaLangFloat_compareWithFloat_withFloat_(v7, v6);
}

- (int)compareBottomWithInt:(int)a3
{
  currentReaderValues = self->super.currentReaderValues_;
  if (!currentReaderValues) {
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)&a3;
  float v6 = JavaLangFloat_intBitsToFloatWithInt_((int)-[OrgApacheLuceneIndexNumericDocValues getWithInt:](currentReaderValues, "getWithInt:"));
  float v7 = v6;
  docsWithField = self->super.docsWithField_;
  if (docsWithField
    && v6 == 0.0
    && ([(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v5] & 1) == 0)
  {
    missingValue = self->super.missingValue_;
    if (missingValue)
    {
      [(NSNumber *)missingValue floatValue];
      float v7 = v10;
      goto LABEL_7;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
LABEL_7:
  float bottom = self->bottom_;
  return JavaLangFloat_compareWithFloat_withFloat_(bottom, v7);
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
  currentReaderValues = self->super.currentReaderValues_;
  if (!currentReaderValues) {
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  float v8 = JavaLangFloat_intBitsToFloatWithInt_((int)[(OrgApacheLuceneIndexNumericDocValues *)currentReaderValues getWithInt:*(void *)&a4]);
  float v9 = v8;
  docsWithField = self->super.docsWithField_;
  if (docsWithField
    && v8 == 0.0
    && ([(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v6] & 1) == 0)
  {
    missingValue = self->super.missingValue_;
    if (!missingValue) {
      goto LABEL_11;
    }
    [(NSNumber *)missingValue floatValue];
    float v9 = v12;
  }
  values = self->values_;
  if (!values) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t size = values->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)size <= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  *((float *)&values->super.size_ + (int)v7 + 1) = v9;
}

- (void)setBottomWithInt:(int)a3
{
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  self->bottom_ = *((float *)&values->super.size_ + a3 + 1);
}

- (void)setTopValueWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 floatValue];
  self->topValue_ = v4;
}

- (id)valueWithInt:(int)a3
{
  values = self->values_;
  if (!values) {
    JreThrowNullPointerException();
  }
  uint64_t size = values->super.size_;
  if (a3 < 0 || (int)size <= a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, *(uint64_t *)&a3);
  }
  float v5 = *((float *)&values->super.size_ + a3 + 1);
  return JavaLangFloat_valueOfWithFloat_(v5);
}

- (int)compareTopWithInt:(int)a3
{
  currentReaderValues = self->super.currentReaderValues_;
  if (!currentReaderValues) {
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)&a3;
  float v6 = JavaLangFloat_intBitsToFloatWithInt_((int)-[OrgApacheLuceneIndexNumericDocValues getWithInt:](currentReaderValues, "getWithInt:"));
  float v7 = v6;
  docsWithField = self->super.docsWithField_;
  if (docsWithField
    && v6 == 0.0
    && ([(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v5] & 1) == 0)
  {
    missingValue = self->super.missingValue_;
    if (missingValue)
    {
      [(NSNumber *)missingValue floatValue];
      float v7 = v10;
      goto LABEL_7;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
LABEL_7:
  float topValue = self->topValue_;
  return JavaLangFloat_compareWithFloat_withFloat_(topValue, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldComparator_FloatComparator;
  [(OrgApacheLuceneSearchFieldComparator_NumericComparator *)&v3 dealloc];
}

@end
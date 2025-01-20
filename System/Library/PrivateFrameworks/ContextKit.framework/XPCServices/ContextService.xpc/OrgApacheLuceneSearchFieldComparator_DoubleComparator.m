@interface OrgApacheLuceneSearchFieldComparator_DoubleComparator
- (OrgApacheLuceneSearchFieldComparator_DoubleComparator)initWithInt:(int)a3 withNSString:(id)a4 withJavaLangDouble:(id)a5;
- (id)valueWithInt:(int)a3;
- (int)compareBottomWithInt:(int)a3;
- (int)compareTopWithInt:(int)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)copy__WithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setBottomWithInt:(int)a3;
- (void)setTopValueWithId:(id)a3;
@end

@implementation OrgApacheLuceneSearchFieldComparator_DoubleComparator

- (OrgApacheLuceneSearchFieldComparator_DoubleComparator)initWithInt:(int)a3 withNSString:(id)a4 withJavaLangDouble:(id)a5
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
  double v6 = values->buffer_[a4];
  double v7 = values->buffer_[a3];
  return JavaLangDouble_compareWithDouble_withDouble_(v7, v6);
}

- (int)compareBottomWithInt:(int)a3
{
  currentReaderValues = self->super.currentReaderValues_;
  if (!currentReaderValues) {
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)&a3;
  double v6 = JavaLangDouble_longBitsToDoubleWithLong_((uint64_t)-[OrgApacheLuceneIndexNumericDocValues getWithInt:](currentReaderValues, "getWithInt:"));
  double v7 = v6;
  docsWithField = self->super.docsWithField_;
  if (docsWithField
    && v6 == 0.0
    && ([(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v5] & 1) == 0)
  {
    missingValue = self->super.missingValue_;
    if (missingValue)
    {
      [(NSNumber *)missingValue doubleValue];
      double v7 = v10;
      goto LABEL_7;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
LABEL_7:
  double bottom = self->bottom_;
  return JavaLangDouble_compareWithDouble_withDouble_(bottom, v7);
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
  currentReaderValues = self->super.currentReaderValues_;
  if (!currentReaderValues) {
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  double v8 = JavaLangDouble_longBitsToDoubleWithLong_((uint64_t)[(OrgApacheLuceneIndexNumericDocValues *)currentReaderValues getWithInt:*(void *)&a4]);
  double v9 = v8;
  docsWithField = self->super.docsWithField_;
  if (docsWithField
    && v8 == 0.0
    && ([(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v6] & 1) == 0)
  {
    missingValue = self->super.missingValue_;
    if (!missingValue) {
      goto LABEL_11;
    }
    [(NSNumber *)missingValue doubleValue];
    double v9 = v12;
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
  values->buffer_[(int)v7] = v9;
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
  self->bottom_ = values->buffer_[a3];
}

- (void)setTopValueWithId:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 doubleValue];
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
  double v5 = values->buffer_[a3];
  return JavaLangDouble_valueOfWithDouble_(v5);
}

- (int)compareTopWithInt:(int)a3
{
  currentReaderValues = self->super.currentReaderValues_;
  if (!currentReaderValues) {
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)&a3;
  double v6 = JavaLangDouble_longBitsToDoubleWithLong_((uint64_t)-[OrgApacheLuceneIndexNumericDocValues getWithInt:](currentReaderValues, "getWithInt:"));
  double v7 = v6;
  docsWithField = self->super.docsWithField_;
  if (docsWithField
    && v6 == 0.0
    && ([(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v5] & 1) == 0)
  {
    missingValue = self->super.missingValue_;
    if (missingValue)
    {
      [(NSNumber *)missingValue doubleValue];
      double v7 = v10;
      goto LABEL_7;
    }
LABEL_10:
    JreThrowNullPointerException();
  }
LABEL_7:
  double topValue = self->topValue_;
  return JavaLangDouble_compareWithDouble_withDouble_(topValue, v7);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldComparator_DoubleComparator;
  [(OrgApacheLuceneSearchFieldComparator_NumericComparator *)&v3 dealloc];
}

@end
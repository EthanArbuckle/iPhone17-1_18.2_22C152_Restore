@interface OrgApacheLuceneSearchFieldComparator_LongComparator
- (OrgApacheLuceneSearchFieldComparator_LongComparator)initWithInt:(int)a3 withNSString:(id)a4 withJavaLangLong:(id)a5;
- (id)valueWithInt:(int)a3;
- (int)compareBottomWithInt:(int)a3;
- (int)compareTopWithInt:(int)a3;
- (int)compareWithInt:(int)a3 withInt:(int)a4;
- (void)copy__WithInt:(int)a3 withInt:(int)a4;
- (void)dealloc;
- (void)setBottomWithInt:(int)a3;
- (void)setTopValueWithId:(id)a3;
@end

@implementation OrgApacheLuceneSearchFieldComparator_LongComparator

- (OrgApacheLuceneSearchFieldComparator_LongComparator)initWithInt:(int)a3 withNSString:(id)a4 withJavaLangLong:(id)a5
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
  uint64_t v6 = values->buffer_[a4];
  uint64_t v7 = values->buffer_[a3];
  return JavaLangLong_compareWithLong_withLong_(v7, v6);
}

- (int)compareBottomWithInt:(int)a3
{
  currentReaderValues = self->super.currentReaderValues_;
  if (!currentReaderValues) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)&a3;
  id v6 = -[OrgApacheLuceneIndexNumericDocValues getWithInt:](currentReaderValues, "getWithInt:");
  docsWithField = self->super.docsWithField_;
  if (docsWithField) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    goto LABEL_11;
  }
  if ([(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v5])
  {
    id v6 = 0;
    goto LABEL_11;
  }
  missingValue = self->super.missingValue_;
  if (!missingValue) {
LABEL_14:
  }
    JreThrowNullPointerException();
  id v6 = [(NSNumber *)missingValue longLongValue];
LABEL_11:
  int64_t bottom = self->bottom_;
  return JavaLangLong_compareWithLong_withLong_(bottom, (uint64_t)v6);
}

- (void)copy__WithInt:(int)a3 withInt:(int)a4
{
  currentReaderValues = self->super.currentReaderValues_;
  if (!currentReaderValues) {
    goto LABEL_15;
  }
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  id v8 = [(OrgApacheLuceneIndexNumericDocValues *)currentReaderValues getWithInt:*(void *)&a4];
  docsWithField = self->super.docsWithField_;
  if (docsWithField) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    if ([(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v6])
    {
      id v8 = 0;
    }
    else
    {
      missingValue = self->super.missingValue_;
      if (!missingValue) {
        goto LABEL_15;
      }
      id v8 = [(NSNumber *)missingValue longLongValue];
    }
  }
  values = self->values_;
  if (!values) {
LABEL_15:
  }
    JreThrowNullPointerException();
  uint64_t size = values->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)size <= (int)v7) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  values->buffer_[(int)v7] = (int64_t)v8;
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
  self->topValue_ = (int64_t)[a3 longLongValue];
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
  int64_t v5 = values->buffer_[a3];
  return JavaLangLong_valueOfWithLong_(v5);
}

- (int)compareTopWithInt:(int)a3
{
  currentReaderValues = self->super.currentReaderValues_;
  if (!currentReaderValues) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)&a3;
  id v6 = -[OrgApacheLuceneIndexNumericDocValues getWithInt:](currentReaderValues, "getWithInt:");
  docsWithField = self->super.docsWithField_;
  if (docsWithField) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    goto LABEL_11;
  }
  if ([(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v5])
  {
    id v6 = 0;
    goto LABEL_11;
  }
  missingValue = self->super.missingValue_;
  if (!missingValue) {
LABEL_14:
  }
    JreThrowNullPointerException();
  id v6 = [(NSNumber *)missingValue longLongValue];
LABEL_11:
  int64_t topValue = self->topValue_;
  return JavaLangLong_compareWithLong_withLong_(topValue, (uint64_t)v6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchFieldComparator_LongComparator;
  [(OrgApacheLuceneSearchFieldComparator_NumericComparator *)&v3 dealloc];
}

@end
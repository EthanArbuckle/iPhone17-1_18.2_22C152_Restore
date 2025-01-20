@interface OrgApacheLuceneIndexMultiDocValues_MultiSortedSetDocValues
- (OrgApacheLuceneIndexMultiDocValues_MultiSortedSetDocValues)initWithOrgApacheLuceneIndexSortedSetDocValuesArray:(id)a3 withIntArray:(id)a4 withOrgApacheLuceneIndexMultiDocValues_OrdinalMap:(id)a5;
- (id)lookupOrdWithLong:(int64_t)a3;
- (int64_t)getValueCount;
- (int64_t)nextOrd;
- (void)dealloc;
- (void)setDocumentWithInt:(int)a3;
@end

@implementation OrgApacheLuceneIndexMultiDocValues_MultiSortedSetDocValues

- (OrgApacheLuceneIndexMultiDocValues_MultiSortedSetDocValues)initWithOrgApacheLuceneIndexSortedSetDocValuesArray:(id)a3 withIntArray:(id)a4 withOrgApacheLuceneIndexMultiDocValues_OrdinalMap:(id)a5
{
  return self;
}

- (int64_t)nextOrd
{
  values = self->values_;
  if (!values) {
    goto LABEL_11;
  }
  int currentSubIndex = self->currentSubIndex_;
  uint64_t size = values->super.size_;
  if (currentSubIndex < 0 || currentSubIndex >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, currentSubIndex);
  }
  v6 = (&values->elementType_)[currentSubIndex];
  if (!v6) {
    goto LABEL_11;
  }
  int64_t result = (int64_t)[(IOSClass *)v6 nextOrd];
  if (result == -1) {
    return result;
  }
  int64_t v8 = result;
  currentGlobalOrds = self->currentGlobalOrds_;
  if (!currentGlobalOrds) {
LABEL_11:
  }
    JreThrowNullPointerException();
  return (int64_t)[(OrgApacheLuceneUtilLongValues *)currentGlobalOrds getWithLong:v8];
}

- (void)setDocumentWithInt:(int)a3
{
  uint64_t v5 = OrgApacheLuceneIndexReaderUtil_subIndexWithInt_withIntArray_(a3, (uint64_t)self->docStarts_);
  self->currentSubIndex_ = v5;
  mapping = self->mapping_;
  if (!mapping) {
    goto LABEL_12;
  }
  JreStrongAssign((id *)&self->currentGlobalOrds_, [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)mapping getGlobalOrdsWithInt:v5]);
  values = self->values_;
  if (!values) {
    goto LABEL_12;
  }
  int currentSubIndex = self->currentSubIndex_;
  uint64_t size = values->super.size_;
  if (currentSubIndex < 0 || currentSubIndex >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, currentSubIndex);
  }
  v10 = (&values->elementType_)[currentSubIndex];
  if (!v10 || (docStarts = self->docStarts_) == 0) {
LABEL_12:
  }
    JreThrowNullPointerException();
  int v12 = self->currentSubIndex_;
  uint64_t v13 = docStarts->super.size_;
  if (v12 < 0 || v12 >= (int)v13) {
    IOSArray_throwOutOfBoundsWithMsg(v13, v12);
  }
  uint64_t v14 = (a3 - *(&docStarts->super.size_ + v12 + 1));
  [(IOSClass *)v10 setDocumentWithInt:v14];
}

- (id)lookupOrdWithLong:(int64_t)a3
{
  mapping = self->mapping_;
  if (!mapping) {
    goto LABEL_9;
  }
  uint64_t v6 = -[OrgApacheLuceneIndexMultiDocValues_OrdinalMap getFirstSegmentNumberWithLong:](mapping, "getFirstSegmentNumberWithLong:");
  int64_t v7 = [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)self->mapping_ getFirstSegmentOrdWithLong:a3];
  values = self->values_;
  if (!values) {
    goto LABEL_9;
  }
  int64_t v9 = v7;
  uint64_t size = values->super.size_;
  if ((v6 & 0x80000000) != 0 || (int)v6 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v6);
  }
  v11 = (&values->elementType_)[(int)v6];
  if (!v11) {
LABEL_9:
  }
    JreThrowNullPointerException();
  return [(IOSClass *)v11 lookupOrdWithLong:v9];
}

- (int64_t)getValueCount
{
  mapping = self->mapping_;
  if (!mapping) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)mapping getValueCount];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiDocValues_MultiSortedSetDocValues;
  [(OrgApacheLuceneIndexMultiDocValues_MultiSortedSetDocValues *)&v3 dealloc];
}

@end
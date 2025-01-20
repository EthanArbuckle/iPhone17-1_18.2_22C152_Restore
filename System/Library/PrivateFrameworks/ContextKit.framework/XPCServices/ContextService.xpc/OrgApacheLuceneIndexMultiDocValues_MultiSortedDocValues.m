@interface OrgApacheLuceneIndexMultiDocValues_MultiSortedDocValues
- (OrgApacheLuceneIndexMultiDocValues_MultiSortedDocValues)initWithOrgApacheLuceneIndexSortedDocValuesArray:(id)a3 withIntArray:(id)a4 withOrgApacheLuceneIndexMultiDocValues_OrdinalMap:(id)a5;
- (id)lookupOrdWithInt:(int)a3;
- (int)getOrdWithInt:(int)a3;
- (int)getValueCount;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexMultiDocValues_MultiSortedDocValues

- (OrgApacheLuceneIndexMultiDocValues_MultiSortedDocValues)initWithOrgApacheLuceneIndexSortedDocValuesArray:(id)a3 withIntArray:(id)a4 withOrgApacheLuceneIndexMultiDocValues_OrdinalMap:(id)a5
{
  return self;
}

- (int)getOrdWithInt:(int)a3
{
  uint64_t v5 = OrgApacheLuceneIndexReaderUtil_subIndexWithInt_withIntArray_(a3, (uint64_t)self->docStarts_);
  values = self->values_;
  if (!values) {
    goto LABEL_13;
  }
  uint64_t v7 = v5;
  uint64_t v8 = (int)v5;
  uint64_t size = values->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  v10 = (&values->elementType_)[v8];
  if (!v10) {
    goto LABEL_13;
  }
  docStarts = self->docStarts_;
  if (!docStarts) {
    goto LABEL_13;
  }
  uint64_t v12 = docStarts->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v7);
  }
  id v13 = [(IOSClass *)v10 getOrdWithInt:(a3 - *(&docStarts->super.size_ + v8 + 1))];
  if (v13 != -1)
  {
    id v14 = v13;
    mapping = self->mapping_;
    if (mapping)
    {
      id v16 = [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)mapping getGlobalOrdsWithInt:v7];
      if (v16) {
        return [v16 getWithInt:v14];
      }
    }
LABEL_13:
    JreThrowNullPointerException();
  }
  return -1;
}

- (id)lookupOrdWithInt:(int)a3
{
  mapping = self->mapping_;
  if (!mapping) {
    goto LABEL_9;
  }
  uint64_t v5 = a3;
  uint64_t v6 = [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)mapping getFirstSegmentNumberWithLong:a3];
  int64_t v7 = [(OrgApacheLuceneIndexMultiDocValues_OrdinalMap *)self->mapping_ getFirstSegmentOrdWithLong:v5];
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
  return [(IOSClass *)v11 lookupOrdWithInt:v9];
}

- (int)getValueCount
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
  v3.super_class = (Class)OrgApacheLuceneIndexMultiDocValues_MultiSortedDocValues;
  [(OrgApacheLuceneIndexSortedDocValues *)&v3 dealloc];
}

@end
@interface OrgApacheLuceneIndexSortedSetDocValuesTermsEnum
- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (OrgApacheLuceneIndexSortedSetDocValuesTermsEnum)initWithOrgApacheLuceneIndexSortedSetDocValues:(id)a3;
- (id)next;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)term;
- (id)termState;
- (int)docFreq;
- (int64_t)ord;
- (int64_t)totalTermFreq;
- (void)dealloc;
- (void)seekExactWithLong:(int64_t)a3;
- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4;
@end

@implementation OrgApacheLuceneIndexSortedSetDocValuesTermsEnum

- (OrgApacheLuceneIndexSortedSetDocValuesTermsEnum)initWithOrgApacheLuceneIndexSortedSetDocValues:(id)a3
{
  return self;
}

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  values = self->values_;
  if (!values) {
    goto LABEL_12;
  }
  int64_t v6 = -[OrgApacheLuceneIndexSortedSetDocValues lookupTermWithOrgApacheLuceneUtilBytesRef:](values, "lookupTermWithOrgApacheLuceneUtilBytesRef:");
  if (v6 < 0)
  {
    self->currentOrd_ = ~v6;
    if ([(OrgApacheLuceneIndexSortedSetDocValues *)self->values_ getValueCount] == (id)~v6)
    {
      v8 = OrgApacheLuceneIndexTermsEnum_SeekStatusEnum_values_;
      if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
        return (id)*v8;
      }
LABEL_11:
      objc_opt_class();
      return (id)*v8;
    }
    scratch = self->scratch_;
    if (scratch)
    {
      [(OrgApacheLuceneUtilBytesRefBuilder *)scratch copyBytesWithOrgApacheLuceneUtilBytesRef:[(OrgApacheLuceneIndexSortedSetDocValues *)self->values_ lookupOrdWithLong:self->currentOrd_]];
      v8 = &qword_1005638D0;
      if (atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire)) {
        return (id)*v8;
      }
      goto LABEL_11;
    }
LABEL_12:
    JreThrowNullPointerException();
  }
  self->currentOrd_ = v6;
  v7 = self->scratch_;
  if (!v7) {
    goto LABEL_12;
  }
  [(OrgApacheLuceneUtilBytesRefBuilder *)v7 copyBytesWithOrgApacheLuceneUtilBytesRef:a3];
  v8 = &qword_1005638C8;
  if ((atomic_load_explicit(OrgApacheLuceneIndexTermsEnum_SeekStatusEnum__initialized, memory_order_acquire) & 1) == 0) {
    goto LABEL_11;
  }
  return (id)*v8;
}

- (BOOL)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  values = self->values_;
  if (!values) {
    goto LABEL_6;
  }
  int64_t v6 = -[OrgApacheLuceneIndexSortedSetDocValues lookupTermWithOrgApacheLuceneUtilBytesRef:](values, "lookupTermWithOrgApacheLuceneUtilBytesRef:");
  int64_t v7 = v6;
  if ((v6 & 0x8000000000000000) == 0)
  {
    self->currentOrd_ = v6;
    scratch = self->scratch_;
    if (scratch)
    {
      [(OrgApacheLuceneUtilBytesRefBuilder *)scratch copyBytesWithOrgApacheLuceneUtilBytesRef:a3];
      return v7 >= 0;
    }
LABEL_6:
    JreThrowNullPointerException();
  }
  return v7 >= 0;
}

- (void)seekExactWithLong:(int64_t)a3
{
  self->currentOrd_ = (int)a3;
  scratch = self->scratch_;
  if (!scratch || (values = self->values_) == 0) {
    JreThrowNullPointerException();
  }
  id v5 = -[OrgApacheLuceneIndexSortedSetDocValues lookupOrdWithLong:](values, "lookupOrdWithLong:");
  [(OrgApacheLuceneUtilBytesRefBuilder *)scratch copyBytesWithOrgApacheLuceneUtilBytesRef:v5];
}

- (id)next
{
  int64_t v3 = self->currentOrd_ + 1;
  self->currentOrd_ = v3;
  values = self->values_;
  if (!values) {
    goto LABEL_8;
  }
  if (v3 >= (uint64_t)[(OrgApacheLuceneIndexSortedSetDocValues *)values getValueCount]) {
    return 0;
  }
  scratch = self->scratch_;
  if (!scratch) {
LABEL_8:
  }
    JreThrowNullPointerException();
  [(OrgApacheLuceneUtilBytesRefBuilder *)scratch copyBytesWithOrgApacheLuceneUtilBytesRef:[(OrgApacheLuceneIndexSortedSetDocValues *)self->values_ lookupOrdWithLong:self->currentOrd_]];
  int64_t v6 = self->scratch_;
  return [(OrgApacheLuceneUtilBytesRefBuilder *)v6 get];
}

- (id)term
{
  scratch = self->scratch_;
  if (!scratch) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneUtilBytesRefBuilder *)scratch get];
}

- (int64_t)ord
{
  return self->currentOrd_;
}

- (int)docFreq
{
  v2 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v2);
}

- (int64_t)totalTermFreq
{
  return -1;
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (void)seekExactWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4
{
  objc_opt_class();
  if (!a4) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  uint64_t v6 = *((void *)a4 + 1);
  [(OrgApacheLuceneIndexSortedSetDocValuesTermsEnum *)self seekExactWithLong:v6];
}

- (id)termState
{
  id result = new_OrgApacheLuceneIndexOrdTermState_init();
  *((void *)result + 1) = self->currentOrd_;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSortedSetDocValuesTermsEnum;
  [(OrgApacheLuceneIndexTermsEnum *)&v3 dealloc];
}

@end
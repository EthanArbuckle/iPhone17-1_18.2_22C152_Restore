@interface OrgApacheLuceneIndexSingletonSortedSetDocValues
- (OrgApacheLuceneIndexSingletonSortedSetDocValues)initWithOrgApacheLuceneIndexSortedDocValues:(id)a3;
- (id)getSortedDocValues;
- (id)lookupOrdWithLong:(int64_t)a3;
- (id)termsEnum;
- (int)cardinality;
- (int64_t)getValueCount;
- (int64_t)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (int64_t)nextOrd;
- (int64_t)ordAtWithInt:(int)a3;
- (void)dealloc;
- (void)setDocumentWithInt:(int)a3;
@end

@implementation OrgApacheLuceneIndexSingletonSortedSetDocValues

- (OrgApacheLuceneIndexSingletonSortedSetDocValues)initWithOrgApacheLuceneIndexSortedDocValues:(id)a3
{
  return self;
}

- (id)getSortedDocValues
{
  return self->in_;
}

- (int64_t)nextOrd
{
  int64_t currentOrd = self->currentOrd_;
  self->currentOrd_ = -1;
  return currentOrd;
}

- (void)setDocumentWithInt:(int)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  signed int v5 = [(OrgApacheLuceneIndexSortedDocValues *)in getOrdWithInt:*(void *)&a3];
  self->ord_ = v5;
  self->currentOrd_ = v5;
}

- (id)lookupOrdWithLong:(int64_t)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexSortedDocValues *)in lookupOrdWithInt:a3];
}

- (int64_t)getValueCount
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return (int)[(OrgApacheLuceneIndexSortedDocValues *)in getValueCount];
}

- (int64_t)lookupTermWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexSortedDocValues *)in lookupTermWithOrgApacheLuceneUtilBytesRef:a3];
}

- (int64_t)ordAtWithInt:(int)a3
{
  return self->ord_;
}

- (int)cardinality
{
  return self->ord_ >= 0;
}

- (id)termsEnum
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexSortedDocValues *)in termsEnum];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSingletonSortedSetDocValues;
  [(OrgApacheLuceneIndexSingletonSortedSetDocValues *)&v3 dealloc];
}

@end
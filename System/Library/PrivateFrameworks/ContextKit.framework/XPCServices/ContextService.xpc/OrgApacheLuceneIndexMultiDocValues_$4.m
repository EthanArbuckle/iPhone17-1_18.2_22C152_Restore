@interface OrgApacheLuceneIndexMultiDocValues_$4
- (OrgApacheLuceneIndexMultiDocValues_$4)initWithIntArray:(id)a3 withOrgApacheLuceneIndexSortedNumericDocValuesArray:(id)a4;
- (int)count;
- (int64_t)valueAtWithInt:(int)a3;
- (void)dealloc;
- (void)setDocumentWithInt:(int)a3;
@end

@implementation OrgApacheLuceneIndexMultiDocValues_$4

- (void)setDocumentWithInt:(int)a3
{
  uint64_t v5 = OrgApacheLuceneIndexReaderUtil_subIndexWithInt_withIntArray_(a3, (uint64_t)self->val$starts_);
  v6 = self->val$values_;
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = v5;
  uint64_t v8 = (int)v5;
  uint64_t size = v6->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v7);
  }
  JreStrongAssign((id *)&self->current_, (&v6->elementType_)[v8]);
  current = self->current_;
  if (!current || (v11 = self->val$starts_) == 0) {
LABEL_11:
  }
    JreThrowNullPointerException();
  uint64_t v12 = v11->super.size_;
  if ((v7 & 0x80000000) != 0 || (int)v7 >= (int)v12) {
    IOSArray_throwOutOfBoundsWithMsg(v12, v7);
  }
  uint64_t v13 = (a3 - *(&v11->super.size_ + v8 + 1));
  [(OrgApacheLuceneIndexSortedNumericDocValues *)current setDocumentWithInt:v13];
}

- (int64_t)valueAtWithInt:(int)a3
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneIndexSortedNumericDocValues *)current valueAtWithInt:*(void *)&a3];
}

- (int)count
{
  current = self->current_;
  if (!current) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexSortedNumericDocValues *)current count];
}

- (OrgApacheLuceneIndexMultiDocValues_$4)initWithIntArray:(id)a3 withOrgApacheLuceneIndexSortedNumericDocValuesArray:(id)a4
{
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiDocValues__4;
  [(OrgApacheLuceneIndexMultiDocValues_$4 *)&v3 dealloc];
}

@end
@interface OrgApacheLuceneIndexFilterLeafReader_FilterTermsEnum
- (OrgApacheLuceneIndexFilterLeafReader_FilterTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3;
- (id)attributes;
- (id)next;
- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4;
- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3;
- (id)term;
- (int)docFreq;
- (int64_t)ord;
- (int64_t)totalTermFreq;
- (void)dealloc;
- (void)seekExactWithLong:(int64_t)a3;
@end

@implementation OrgApacheLuceneIndexFilterLeafReader_FilterTermsEnum

- (OrgApacheLuceneIndexFilterLeafReader_FilterTermsEnum)initWithOrgApacheLuceneIndexTermsEnum:(id)a3
{
  return self;
}

- (id)attributes
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)in attributes];
}

- (id)seekCeilWithOrgApacheLuceneUtilBytesRef:(id)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)in seekCeilWithOrgApacheLuceneUtilBytesRef:a3];
}

- (void)seekExactWithLong:(int64_t)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneIndexTermsEnum *)in seekExactWithLong:a3];
}

- (id)next
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)in next];
}

- (id)term
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)in term];
}

- (int64_t)ord
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneIndexTermsEnum *)in ord];
}

- (int)docFreq
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)in docFreq];
}

- (int64_t)totalTermFreq
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneIndexTermsEnum *)in totalTermFreq];
}

- (id)postingsWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withInt:(int)a4
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexTermsEnum *)in postingsWithOrgApacheLuceneIndexPostingsEnum:a3 withInt:*(void *)&a4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexFilterLeafReader_FilterTermsEnum;
  [(OrgApacheLuceneIndexTermsEnum *)&v3 dealloc];
}

@end
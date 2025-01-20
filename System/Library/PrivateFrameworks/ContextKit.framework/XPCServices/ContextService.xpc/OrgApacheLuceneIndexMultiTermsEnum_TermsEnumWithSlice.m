@interface OrgApacheLuceneIndexMultiTermsEnum_TermsEnumWithSlice
- (OrgApacheLuceneIndexMultiTermsEnum_TermsEnumWithSlice)initWithInt:(int)a3 withOrgApacheLuceneIndexReaderSlice:(id)a4;
- (id)description;
- (void)dealloc;
- (void)resetWithOrgApacheLuceneIndexTermsEnum:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4;
@end

@implementation OrgApacheLuceneIndexMultiTermsEnum_TermsEnumWithSlice

- (OrgApacheLuceneIndexMultiTermsEnum_TermsEnumWithSlice)initWithInt:(int)a3 withOrgApacheLuceneIndexReaderSlice:(id)a4
{
  self->index_ = a3;
  return self;
}

- (void)resetWithOrgApacheLuceneIndexTermsEnum:(id)a3 withOrgApacheLuceneUtilBytesRef:(id)a4
{
  JreStrongAssign((id *)&self->terms_, a3);
  JreStrongAssign((id *)&self->current_, a4);
}

- (id)description
{
  subSlice = self->subSlice_;
  if (!subSlice) {
    JreThrowNullPointerException();
  }
  id v3 = [(OrgApacheLuceneIndexReaderSlice *)subSlice description];
  return (id)JreStrcat("$C@", v4, v5, v6, v7, v8, v9, v10, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexMultiTermsEnum_TermsEnumWithSlice;
  [(OrgApacheLuceneIndexMultiTermsEnum_TermsEnumWithSlice *)&v3 dealloc];
}

@end
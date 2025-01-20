@interface OrgApacheLuceneIndexSingletonSortedNumericDocValues
- (OrgApacheLuceneIndexSingletonSortedNumericDocValues)initWithOrgApacheLuceneIndexNumericDocValues:(id)a3 withOrgApacheLuceneUtilBits:(id)a4;
- (id)getDocsWithField;
- (id)getNumericDocValues;
- (int)count;
- (int64_t)valueAtWithInt:(int)a3;
- (void)dealloc;
- (void)setDocumentWithInt:(int)a3;
@end

@implementation OrgApacheLuceneIndexSingletonSortedNumericDocValues

- (OrgApacheLuceneIndexSingletonSortedNumericDocValues)initWithOrgApacheLuceneIndexNumericDocValues:(id)a3 withOrgApacheLuceneUtilBits:(id)a4
{
  return self;
}

- (id)getNumericDocValues
{
  return self->in_;
}

- (id)getDocsWithField
{
  return self->docsWithField_;
}

- (void)setDocumentWithInt:(int)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = *(void *)&a3;
  id v6 = -[OrgApacheLuceneIndexNumericDocValues getWithInt:](in, "getWithInt:");
  self->value_ = (int64_t)v6;
  docsWithField = self->docsWithField_;
  if (docsWithField) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = !v8 || [(OrgApacheLuceneUtilBits *)docsWithField getWithInt:v5];
  self->count_ = v9;
}

- (int64_t)valueAtWithInt:(int)a3
{
  return self->value_;
}

- (int)count
{
  return self->count_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexSingletonSortedNumericDocValues;
  [(OrgApacheLuceneIndexSingletonSortedNumericDocValues *)&v3 dealloc];
}

@end
@interface OrgApacheLuceneIndexDocsAndPositionsEnum_DocsAndPositionsEnumWrapper
- (OrgApacheLuceneIndexDocsAndPositionsEnum_DocsAndPositionsEnumWrapper)initWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withOrgApacheLuceneUtilBits:(id)a4;
- (id)attributes;
- (id)getPayload;
- (int)advanceWithInt:(int)a3;
- (int)doNextWithInt:(int)a3;
- (int)docID;
- (int)endOffset;
- (int)freq;
- (int)nextDoc;
- (int)nextPosition;
- (int)startOffset;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexDocsAndPositionsEnum_DocsAndPositionsEnumWrapper

- (OrgApacheLuceneIndexDocsAndPositionsEnum_DocsAndPositionsEnumWrapper)initWithOrgApacheLuceneIndexPostingsEnum:(id)a3 withOrgApacheLuceneUtilBits:(id)a4
{
  return self;
}

- (int)doNextWithInt:(int)a3
{
  return sub_10001397C((uint64_t)self, *(uint64_t *)&a3);
}

- (int)nextPosition
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in nextPosition];
}

- (int)startOffset
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in startOffset];
}

- (int)endOffset
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in endOffset];
}

- (id)getPayload
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in getPayload];
}

- (int)freq
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in freq];
}

- (id)attributes
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in attributes];
}

- (int)docID
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in docID];
}

- (int)nextDoc
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  id v4 = [(OrgApacheLuceneIndexPostingsEnum *)in nextDoc];
  return sub_10001397C((uint64_t)self, (uint64_t)v4);
}

- (int)advanceWithInt:(int)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  id v5 = [(OrgApacheLuceneIndexPostingsEnum *)in advanceWithInt:*(void *)&a3];
  return sub_10001397C((uint64_t)self, (uint64_t)v5);
}

- (int64_t)cost
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneIndexPostingsEnum *)in cost];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneIndexDocsAndPositionsEnum_DocsAndPositionsEnumWrapper;
  [(OrgApacheLuceneIndexPostingsEnum *)&v3 dealloc];
}

@end
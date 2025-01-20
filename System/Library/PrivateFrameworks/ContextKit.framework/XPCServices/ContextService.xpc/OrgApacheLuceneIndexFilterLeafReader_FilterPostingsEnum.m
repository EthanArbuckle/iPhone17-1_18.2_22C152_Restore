@interface OrgApacheLuceneIndexFilterLeafReader_FilterPostingsEnum
- (OrgApacheLuceneIndexFilterLeafReader_FilterPostingsEnum)initWithOrgApacheLuceneIndexPostingsEnum:(id)a3;
- (id)attributes;
- (id)getPayload;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)endOffset;
- (int)freq;
- (int)nextDoc;
- (int)nextPosition;
- (int)startOffset;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneIndexFilterLeafReader_FilterPostingsEnum

- (OrgApacheLuceneIndexFilterLeafReader_FilterPostingsEnum)initWithOrgApacheLuceneIndexPostingsEnum:(id)a3
{
  return self;
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

- (int)freq
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in freq];
}

- (int)nextDoc
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in nextDoc];
}

- (int)advanceWithInt:(int)a3
{
  in = self->in_;
  if (!in) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)in advanceWithInt:*(void *)&a3];
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
  v3.super_class = (Class)OrgApacheLuceneIndexFilterLeafReader_FilterPostingsEnum;
  [(OrgApacheLuceneIndexPostingsEnum *)&v3 dealloc];
}

@end
@interface OrgApacheLuceneDocumentField_BinaryTokenStream
- (BOOL)incrementToken;
- (OrgApacheLuceneDocumentField_BinaryTokenStream)init;
- (void)close;
- (void)dealloc;
- (void)reset;
- (void)setValueWithOrgApacheLuceneUtilBytesRef:(id)a3;
@end

@implementation OrgApacheLuceneDocumentField_BinaryTokenStream

- (OrgApacheLuceneDocumentField_BinaryTokenStream)init
{
  return self;
}

- (void)setValueWithOrgApacheLuceneUtilBytesRef:(id)a3
{
}

- (BOOL)incrementToken
{
  BOOL used = self->used_;
  if (!self->used_)
  {
    [(OrgApacheLuceneUtilAttributeSource *)self clearAttributes];
    bytesAtt = self->bytesAtt_;
    if (!bytesAtt) {
      JreThrowNullPointerException();
    }
    [(OrgApacheLuceneAnalysisTokenattributesBytesTermAttribute *)bytesAtt setBytesRefWithOrgApacheLuceneUtilBytesRef:self->value_];
    self->used_ = 1;
  }
  return !used;
}

- (void)reset
{
  self->used_ = 0;
}

- (void)close
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneDocumentField_BinaryTokenStream;
  [(OrgApacheLuceneUtilAttributeSource *)&v3 dealloc];
}

@end
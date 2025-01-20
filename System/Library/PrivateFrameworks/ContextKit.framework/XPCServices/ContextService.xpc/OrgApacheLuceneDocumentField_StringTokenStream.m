@interface OrgApacheLuceneDocumentField_StringTokenStream
- (BOOL)incrementToken;
- (OrgApacheLuceneDocumentField_StringTokenStream)init;
- (void)close;
- (void)dealloc;
- (void)end;
- (void)reset;
- (void)setValueWithNSString:(id)a3;
@end

@implementation OrgApacheLuceneDocumentField_StringTokenStream

- (OrgApacheLuceneDocumentField_StringTokenStream)init
{
  return self;
}

- (void)setValueWithNSString:(id)a3
{
}

- (BOOL)incrementToken
{
  BOOL used = self->used_;
  if (!self->used_)
  {
    [(OrgApacheLuceneUtilAttributeSource *)self clearAttributes];
    termAttribute = self->termAttribute_;
    if (!termAttribute
      || ([(OrgApacheLuceneAnalysisTokenattributesCharTermAttribute *)termAttribute appendWithNSString:self->value_], (offsetAttribute = self->offsetAttribute_) == 0)|| (value = self->value_) == 0)
    {
      JreThrowNullPointerException();
    }
    [(OrgApacheLuceneAnalysisTokenattributesOffsetAttribute *)offsetAttribute setOffsetWithInt:0 withInt:[(NSString *)value length]];
    self->used_ = 1;
  }
  return !used;
}

- (void)end
{
  v6.receiver = self;
  v6.super_class = (Class)OrgApacheLuceneDocumentField_StringTokenStream;
  [(OrgApacheLuceneAnalysisTokenStream *)&v6 end];
  value = self->value_;
  if (!value || (id v4 = [(NSString *)value length], (offsetAttribute = self->offsetAttribute_) == 0)) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneAnalysisTokenattributesOffsetAttribute *)offsetAttribute setOffsetWithInt:v4 withInt:v4];
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
  v3.super_class = (Class)OrgApacheLuceneDocumentField_StringTokenStream;
  [(OrgApacheLuceneUtilAttributeSource *)&v3 dealloc];
}

@end
@interface OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents
- (OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents)initWithOrgApacheLuceneAnalysisTokenizer:(id)a3;
- (OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents)initWithOrgApacheLuceneAnalysisTokenizer:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4;
- (id)getTokenStream;
- (id)getTokenizer;
- (void)dealloc;
- (void)setReaderWithJavaIoReader:(id)a3;
@end

@implementation OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents

- (OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents)initWithOrgApacheLuceneAnalysisTokenizer:(id)a3 withOrgApacheLuceneAnalysisTokenStream:(id)a4
{
  return self;
}

- (OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents)initWithOrgApacheLuceneAnalysisTokenizer:(id)a3
{
  return self;
}

- (void)setReaderWithJavaIoReader:(id)a3
{
  source = self->source_;
  if (!source) {
    JreThrowNullPointerException();
  }
  [(OrgApacheLuceneAnalysisTokenizer *)source setReaderWithJavaIoReader:a3];
}

- (id)getTokenStream
{
  return self->sink_;
}

- (id)getTokenizer
{
  return self->source_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents;
  [(OrgApacheLuceneAnalysisAnalyzer_TokenStreamComponents *)&v3 dealloc];
}

@end
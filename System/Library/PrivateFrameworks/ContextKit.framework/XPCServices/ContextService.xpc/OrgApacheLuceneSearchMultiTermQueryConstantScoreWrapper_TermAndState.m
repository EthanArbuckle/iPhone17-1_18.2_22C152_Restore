@interface OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_TermAndState
- (OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_TermAndState)initWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4 withInt:(int)a5 withLong:(int64_t)a6;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_TermAndState

- (OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_TermAndState)initWithOrgApacheLuceneUtilBytesRef:(id)a3 withOrgApacheLuceneIndexTermState:(id)a4 withInt:(int)a5 withLong:(int64_t)a6
{
  self->docFreq_ = a5;
  self->totalTermFreq_ = a6;
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_TermAndState;
  [(OrgApacheLuceneSearchMultiTermQueryConstantScoreWrapper_TermAndState *)&v3 dealloc];
}

@end
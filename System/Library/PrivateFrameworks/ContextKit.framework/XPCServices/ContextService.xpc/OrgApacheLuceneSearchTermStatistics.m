@interface OrgApacheLuceneSearchTermStatistics
- (OrgApacheLuceneSearchTermStatistics)initWithOrgApacheLuceneUtilBytesRef:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5;
- (id)term;
- (int64_t)docFreq;
- (int64_t)totalTermFreq;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTermStatistics

- (OrgApacheLuceneSearchTermStatistics)initWithOrgApacheLuceneUtilBytesRef:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5
{
  self->docFreq_ = a4;
  self->totalTermFreq_ = a5;
  return self;
}

- (id)term
{
  return self->term_;
}

- (int64_t)docFreq
{
  return self->docFreq_;
}

- (int64_t)totalTermFreq
{
  return self->totalTermFreq_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTermStatistics;
  [(OrgApacheLuceneSearchTermStatistics *)&v3 dealloc];
}

@end
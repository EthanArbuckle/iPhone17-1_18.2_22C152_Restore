@interface OrgApacheLuceneSearchCollectionStatistics
- (OrgApacheLuceneSearchCollectionStatistics)initWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withLong:(int64_t)a7;
- (id)field;
- (int64_t)docCount;
- (int64_t)maxDoc;
- (int64_t)sumDocFreq;
- (int64_t)sumTotalTermFreq;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchCollectionStatistics

- (OrgApacheLuceneSearchCollectionStatistics)initWithNSString:(id)a3 withLong:(int64_t)a4 withLong:(int64_t)a5 withLong:(int64_t)a6 withLong:(int64_t)a7
{
  self->maxDoc_ = a4;
  self->docCount_ = a5;
  self->sumTotalTermFreq_ = a6;
  self->sumDocFreq_ = a7;
  return self;
}

- (id)field
{
  return self->field_;
}

- (int64_t)maxDoc
{
  return self->maxDoc_;
}

- (int64_t)docCount
{
  return self->docCount_;
}

- (int64_t)sumTotalTermFreq
{
  return self->sumTotalTermFreq_;
}

- (int64_t)sumDocFreq
{
  return self->sumDocFreq_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchCollectionStatistics;
  [(OrgApacheLuceneSearchCollectionStatistics *)&v3 dealloc];
}

@end
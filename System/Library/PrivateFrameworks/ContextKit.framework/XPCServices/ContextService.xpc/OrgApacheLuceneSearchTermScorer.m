@interface OrgApacheLuceneSearchTermScorer
- (OrgApacheLuceneSearchTermScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withOrgApacheLuceneIndexPostingsEnum:(id)a4 withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer:(id)a5;
- (float)score;
- (id)description;
- (int)advanceWithInt:(int)a3;
- (int)docID;
- (int)freq;
- (int)nextDoc;
- (int64_t)cost;
- (void)dealloc;
@end

@implementation OrgApacheLuceneSearchTermScorer

- (OrgApacheLuceneSearchTermScorer)initWithOrgApacheLuceneSearchWeight:(id)a3 withOrgApacheLuceneIndexPostingsEnum:(id)a4 withOrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer:(id)a5
{
  return self;
}

- (int)docID
{
  postingsEnum = self->postingsEnum_;
  if (!postingsEnum) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)postingsEnum docID];
}

- (int)freq
{
  postingsEnum = self->postingsEnum_;
  if (!postingsEnum) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)postingsEnum freq];
}

- (int)nextDoc
{
  postingsEnum = self->postingsEnum_;
  if (!postingsEnum) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)postingsEnum nextDoc];
}

- (float)score
{
  docScorer = self->docScorer_;
  if (!docScorer || (postingsEnum = self->postingsEnum_) == 0) {
    JreThrowNullPointerException();
  }
  id v5 = [(OrgApacheLuceneIndexPostingsEnum *)postingsEnum docID];
  *(float *)&double v6 = (float)(int)[(OrgApacheLuceneIndexPostingsEnum *)self->postingsEnum_ freq];
  [(OrgApacheLuceneSearchSimilaritiesSimilarity_SimScorer *)docScorer scoreWithInt:v5 withFloat:v6];
  return result;
}

- (int)advanceWithInt:(int)a3
{
  postingsEnum = self->postingsEnum_;
  if (!postingsEnum) {
    JreThrowNullPointerException();
  }
  return [(OrgApacheLuceneIndexPostingsEnum *)postingsEnum advanceWithInt:*(void *)&a3];
}

- (int64_t)cost
{
  postingsEnum = self->postingsEnum_;
  if (!postingsEnum) {
    JreThrowNullPointerException();
  }
  return (int64_t)[(OrgApacheLuceneIndexPostingsEnum *)postingsEnum cost];
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)OrgApacheLuceneSearchTermScorer;
  [(OrgApacheLuceneSearchTermScorer *)&v10 description];
  return (id)JreStrcat("$@$$C", v2, v3, v4, v5, v6, v7, v8, @"scorer(");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTermScorer;
  [(OrgApacheLuceneSearchScorer *)&v3 dealloc];
}

@end
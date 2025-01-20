@interface OrgApacheLuceneSearchTopDocs
+ (id)mergeWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneSearchTopDocsArray:(id)a5;
+ (id)mergeWithInt:(int)a3 withOrgApacheLuceneSearchTopDocsArray:(id)a4;
+ (id)mergeWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneSearchTopFieldDocsArray:(id)a6;
+ (id)mergeWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchTopFieldDocsArray:(id)a5;
- (OrgApacheLuceneSearchTopDocs)initWithInt:(int)a3 withOrgApacheLuceneSearchScoreDocArray:(id)a4;
- (OrgApacheLuceneSearchTopDocs)initWithInt:(int)a3 withOrgApacheLuceneSearchScoreDocArray:(id)a4 withFloat:(float)a5;
- (float)getMaxScore;
- (void)dealloc;
- (void)setMaxScoreWithFloat:(float)a3;
@end

@implementation OrgApacheLuceneSearchTopDocs

- (float)getMaxScore
{
  return self->maxScore_;
}

- (void)setMaxScoreWithFloat:(float)a3
{
  self->maxScore_ = a3;
}

- (OrgApacheLuceneSearchTopDocs)initWithInt:(int)a3 withOrgApacheLuceneSearchScoreDocArray:(id)a4
{
  self->totalHits_ = a3;
  JreStrongAssign((id *)&self->scoreDocs_, a4);
  self->maxScore_ = NAN;
  return self;
}

- (OrgApacheLuceneSearchTopDocs)initWithInt:(int)a3 withOrgApacheLuceneSearchScoreDocArray:(id)a4 withFloat:(float)a5
{
  self->totalHits_ = a3;
  JreStrongAssign((id *)&self->scoreDocs_, a4);
  self->maxScore_ = a5;
  return self;
}

+ (id)mergeWithInt:(int)a3 withOrgApacheLuceneSearchTopDocsArray:(id)a4
{
  return sub_10001F648(0, 0, a3, (uint64_t)a4);
}

+ (id)mergeWithInt:(int)a3 withInt:(int)a4 withOrgApacheLuceneSearchTopDocsArray:(id)a5
{
  return sub_10001F648(0, a3, a4, (uint64_t)a5);
}

+ (id)mergeWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withOrgApacheLuceneSearchTopFieldDocsArray:(id)a5
{
  return OrgApacheLuceneSearchTopDocs_mergeWithOrgApacheLuceneSearchSort_withInt_withInt_withOrgApacheLuceneSearchTopFieldDocsArray_(a3, 0, a4, (uint64_t)a5);
}

+ (id)mergeWithOrgApacheLuceneSearchSort:(id)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneSearchTopFieldDocsArray:(id)a6
{
  return OrgApacheLuceneSearchTopDocs_mergeWithOrgApacheLuceneSearchSort_withInt_withInt_withOrgApacheLuceneSearchTopFieldDocsArray_(a3, a4, a5, (uint64_t)a6);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneSearchTopDocs;
  [(OrgApacheLuceneSearchTopDocs *)&v3 dealloc];
}

@end
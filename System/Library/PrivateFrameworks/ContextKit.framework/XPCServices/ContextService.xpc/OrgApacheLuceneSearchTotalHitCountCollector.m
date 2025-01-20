@interface OrgApacheLuceneSearchTotalHitCountCollector
- (BOOL)needsScores;
- (OrgApacheLuceneSearchTotalHitCountCollector)init;
- (int)getTotalHits;
- (void)collectWithInt:(int)a3;
@end

@implementation OrgApacheLuceneSearchTotalHitCountCollector

- (int)getTotalHits
{
  return self->totalHits_;
}

- (void)collectWithInt:(int)a3
{
}

- (BOOL)needsScores
{
  return 0;
}

- (OrgApacheLuceneSearchTotalHitCountCollector)init
{
  return self;
}

@end
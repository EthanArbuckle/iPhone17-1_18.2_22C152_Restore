@interface OrgApacheLuceneSearchIndexSearcher_$1_$2
- (OrgApacheLuceneSearchIndexSearcher_$1_$2)init;
- (float)computePayloadFactorWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilBytesRef:(id)a6;
- (float)computeSlopFactorWithInt:(int)a3;
- (float)scoreWithInt:(int)a3 withFloat:(float)a4;
@end

@implementation OrgApacheLuceneSearchIndexSearcher_$1_$2

- (float)scoreWithInt:(int)a3 withFloat:(float)a4
{
  return 0.0;
}

- (float)computeSlopFactorWithInt:(int)a3
{
  return 1.0;
}

- (float)computePayloadFactorWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withOrgApacheLuceneUtilBytesRef:(id)a6
{
  return 1.0;
}

- (OrgApacheLuceneSearchIndexSearcher_$1_$2)init
{
  return self;
}

@end
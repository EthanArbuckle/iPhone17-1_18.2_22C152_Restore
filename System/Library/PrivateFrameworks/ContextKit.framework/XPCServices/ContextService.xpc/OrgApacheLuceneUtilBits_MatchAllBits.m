@interface OrgApacheLuceneUtilBits_MatchAllBits
- (BOOL)getWithInt:(int)a3;
- (OrgApacheLuceneUtilBits_MatchAllBits)initWithInt:(int)a3;
- (int)length;
@end

@implementation OrgApacheLuceneUtilBits_MatchAllBits

- (OrgApacheLuceneUtilBits_MatchAllBits)initWithInt:(int)a3
{
  self->len_ = a3;
  return self;
}

- (BOOL)getWithInt:(int)a3
{
  return 1;
}

- (int)length
{
  return self->len_;
}

@end
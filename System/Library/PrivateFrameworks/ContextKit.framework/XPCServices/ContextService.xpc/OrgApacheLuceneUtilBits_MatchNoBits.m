@interface OrgApacheLuceneUtilBits_MatchNoBits
- (BOOL)getWithInt:(int)a3;
- (OrgApacheLuceneUtilBits_MatchNoBits)initWithInt:(int)a3;
- (int)length;
@end

@implementation OrgApacheLuceneUtilBits_MatchNoBits

- (OrgApacheLuceneUtilBits_MatchNoBits)initWithInt:(int)a3
{
  self->len_ = a3;
  return self;
}

- (BOOL)getWithInt:(int)a3
{
  return 0;
}

- (int)length
{
  return self->len_;
}

@end
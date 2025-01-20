@interface OrgApacheLuceneUtilCounter_SerialCounter
- (OrgApacheLuceneUtilCounter_SerialCounter)init;
- (int64_t)addAndGetWithLong:(int64_t)a3;
- (int64_t)get;
@end

@implementation OrgApacheLuceneUtilCounter_SerialCounter

- (int64_t)addAndGetWithLong:(int64_t)a3
{
  int64_t v3 = self->count_ + a3;
  self->count_ = v3;
  return v3;
}

- (int64_t)get
{
  return self->count_;
}

- (OrgApacheLuceneUtilCounter_SerialCounter)init
{
  self->count_ = 0;
  return self;
}

@end
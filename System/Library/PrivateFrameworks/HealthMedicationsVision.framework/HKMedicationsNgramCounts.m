@interface HKMedicationsNgramCounts
- (int64_t)seen;
- (int64_t)used;
- (void)setSeen:(int64_t)a3;
- (void)setUsed:(int64_t)a3;
@end

@implementation HKMedicationsNgramCounts

- (int64_t)seen
{
  return self->_seen;
}

- (void)setSeen:(int64_t)a3
{
  self->_seen = a3;
}

- (int64_t)used
{
  return self->_used;
}

- (void)setUsed:(int64_t)a3
{
  self->_used = a3;
}

@end
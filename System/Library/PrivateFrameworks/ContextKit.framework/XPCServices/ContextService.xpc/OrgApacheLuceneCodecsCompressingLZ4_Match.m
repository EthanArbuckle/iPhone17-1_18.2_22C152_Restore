@interface OrgApacheLuceneCodecsCompressingLZ4_Match
- (int)end;
- (void)fixWithInt:(int)a3;
@end

@implementation OrgApacheLuceneCodecsCompressingLZ4_Match

- (void)fixWithInt:(int)a3
{
  *(int32x2_t *)&self->start_ = vadd_s32(*(int32x2_t *)&self->start_, vdup_n_s32(a3));
  self->len_ -= a3;
}

- (int)end
{
  return self->len_ + self->start_;
}

@end
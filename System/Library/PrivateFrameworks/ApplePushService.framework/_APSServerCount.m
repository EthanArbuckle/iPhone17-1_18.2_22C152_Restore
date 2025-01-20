@interface _APSServerCount
- (double)ttlBegin;
- (double)ttlEnd;
- (unsigned)serverCount;
- (void)setServerCount:(unsigned int)a3;
- (void)setTtlBegin:(double)a3;
- (void)setTtlEnd:(double)a3;
@end

@implementation _APSServerCount

- (double)ttlBegin
{
  return self->ttlBegin;
}

- (void)setTtlBegin:(double)a3
{
  self->ttlBegin = a3;
}

- (double)ttlEnd
{
  return self->ttlEnd;
}

- (void)setTtlEnd:(double)a3
{
  self->ttlEnd = a3;
}

- (unsigned)serverCount
{
  return self->serverCount;
}

- (void)setServerCount:(unsigned int)a3
{
  self->serverCount = a3;
}

@end
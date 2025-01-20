@interface _CPNewsUsagePropensity
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)other;
- (int)totalEngagements;
- (unint64_t)hash;
- (void)setOther:(float)a3;
- (void)setTotalEngagements:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPNewsUsagePropensity

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setOther:(float)a3
{
  self->_other = a3;
}

- (float)other
{
  return self->_other;
}

- (unint64_t)hash
{
  float other = self->_other;
  double v3 = other;
  if (other < 0.0) {
    double v3 = -other;
  }
  long double v4 = round(v3);
  return ((unint64_t)(fmod(v4, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v3 - v4, 0x40uLL)) ^ (2654435761 * self->_totalEngagements);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (float other = self->_other, [v4 other], other == v6))
  {
    int totalEngagements = self->_totalEngagements;
    BOOL v7 = totalEngagements == [v4 totalEngagements];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  [(_CPNewsUsagePropensity *)self other];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPNewsUsagePropensity *)self totalEngagements]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPNewsUsagePropensityReadFrom(self, (uint64_t)a3, v3);
}

@end
@interface _CPEngagementTriggerRatio
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)go;
- (float)tap;
- (int)totalEngagements;
- (unint64_t)hash;
- (void)setGo:(float)a3;
- (void)setTap:(float)a3;
- (void)setTotalEngagements:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPEngagementTriggerRatio

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setTap:(float)a3
{
  self->_tap = a3;
}

- (float)tap
{
  return self->_tap;
}

- (void)setGo:(float)a3
{
  self->_go = a3;
}

- (float)go
{
  return self->_go;
}

- (unint64_t)hash
{
  float go = self->_go;
  double v4 = go;
  if (go < 0.0) {
    double v4 = -go;
  }
  long double v5 = round(v4);
  unint64_t v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  float tap = self->_tap;
  double v8 = tap;
  if (tap < 0.0) {
    double v8 = -tap;
  }
  long double v9 = round(v8);
  return v6 ^ (2654435761 * self->_totalEngagements) ^ ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0)
                                                        + vcvtd_n_u64_f64(v8 - v9, 0x40uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (float go = self->_go, [v4 go], go == v6)
    && (float tap = self->_tap, [v4 tap], tap == v8))
  {
    int totalEngagements = self->_totalEngagements;
    BOOL v9 = totalEngagements == [v4 totalEngagements];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)writeTo:(id)a3
{
  a3;
  [(_CPEngagementTriggerRatio *)self go];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPEngagementTriggerRatio *)self tap];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPEngagementTriggerRatio *)self totalEngagements]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPEngagementTriggerRatioReadFrom(self, (uint64_t)a3, v3);
}

@end
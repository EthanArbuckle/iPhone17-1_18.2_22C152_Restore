@interface _CPEngagementShareRatio
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)shareOfEngagements;
- (float)shareOfInternetEngagements;
- (unint64_t)hash;
- (void)setShareOfEngagements:(float)a3;
- (void)setShareOfInternetEngagements:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPEngagementShareRatio

- (void)setShareOfInternetEngagements:(float)a3
{
  self->_shareOfInternetEngagements = a3;
}

- (float)shareOfInternetEngagements
{
  return self->_shareOfInternetEngagements;
}

- (void)setShareOfEngagements:(float)a3
{
  self->_shareOfEngagements = a3;
}

- (float)shareOfEngagements
{
  return self->_shareOfEngagements;
}

- (unint64_t)hash
{
  float shareOfEngagements = self->_shareOfEngagements;
  double v4 = shareOfEngagements;
  if (shareOfEngagements < 0.0) {
    double v4 = -shareOfEngagements;
  }
  long double v5 = round(v4);
  unint64_t v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  float shareOfInternetEngagements = self->_shareOfInternetEngagements;
  double v8 = shareOfInternetEngagements;
  if (shareOfInternetEngagements < 0.0) {
    double v8 = -shareOfInternetEngagements;
  }
  long double v9 = round(v8);
  return ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (float shareOfEngagements = self->_shareOfEngagements, [v4 shareOfEngagements], shareOfEngagements == v6))
  {
    float shareOfInternetEngagements = self->_shareOfInternetEngagements;
    [v4 shareOfInternetEngagements];
    BOOL v7 = shareOfInternetEngagements == v9;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  [(_CPEngagementShareRatio *)self shareOfEngagements];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPEngagementShareRatio *)self shareOfInternetEngagements];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPEngagementShareRatioReadFrom(self, (uint64_t)a3, v3);
}

@end
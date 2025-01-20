@interface _CPImagesUsagePropensity
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)image;
- (float)other;
- (float)querySuggestion;
- (float)recentResult;
- (float)zkw;
- (int)totalEngagements;
- (unint64_t)hash;
- (void)setImage:(float)a3;
- (void)setOther:(float)a3;
- (void)setQuerySuggestion:(float)a3;
- (void)setRecentResult:(float)a3;
- (void)setTotalEngagements:(int)a3;
- (void)setZkw:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPImagesUsagePropensity

- (void)setTotalEngagements:(int)a3
{
  self->_totalEngagements = a3;
}

- (int)totalEngagements
{
  return self->_totalEngagements;
}

- (void)setImage:(float)a3
{
  self->_image = a3;
}

- (float)image
{
  return self->_image;
}

- (void)setQuerySuggestion:(float)a3
{
  self->_querySuggestion = a3;
}

- (float)querySuggestion
{
  return self->_querySuggestion;
}

- (void)setOther:(float)a3
{
  self->_other = a3;
}

- (float)other
{
  return self->_other;
}

- (void)setRecentResult:(float)a3
{
  self->_recentResult = a3;
}

- (float)recentResult
{
  return self->_recentResult;
}

- (void)setZkw:(float)a3
{
  self->_zkw = a3;
}

- (float)zkw
{
  return self->_zkw;
}

- (unint64_t)hash
{
  float zkw = self->_zkw;
  double v4 = zkw;
  if (zkw < 0.0) {
    double v4 = -zkw;
  }
  long double v5 = round(v4);
  unint64_t v6 = (unint64_t)(fmod(v5, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v4 - v5, 0x40uLL);
  float recentResult = self->_recentResult;
  double v8 = recentResult;
  if (recentResult < 0.0) {
    double v8 = -recentResult;
  }
  long double v9 = round(v8);
  unint64_t v10 = ((unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL)) ^ v6;
  float other = self->_other;
  double v12 = other;
  if (other < 0.0) {
    double v12 = -other;
  }
  long double v13 = round(v12);
  unint64_t v14 = (unint64_t)(fmod(v13, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v12 - v13, 0x40uLL);
  float querySuggestion = self->_querySuggestion;
  double v16 = querySuggestion;
  if (querySuggestion < 0.0) {
    double v16 = -querySuggestion;
  }
  long double v17 = round(v16);
  unint64_t v18 = (unint64_t)(fmod(v17, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v16 - v17, 0x40uLL);
  float image = self->_image;
  double v20 = image;
  if (image < 0.0) {
    double v20 = -image;
  }
  long double v21 = round(v20);
  return v10 ^ v14 ^ (2654435761 * self->_totalEngagements) ^ v18 ^ ((unint64_t)(fmod(v21, 1.84467441e19)
                                                                                        * 2654435760.0)
                                                                     + vcvtd_n_u64_f64(v20 - v21, 0x40uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_7;
  }
  float zkw = self->_zkw;
  [v4 zkw];
  if (zkw != v6) {
    goto LABEL_7;
  }
  float recentResult = self->_recentResult;
  [v4 recentResult];
  if (recentResult != v8) {
    goto LABEL_7;
  }
  float other = self->_other;
  [v4 other];
  if (other == v10
    && (float querySuggestion = self->_querySuggestion, [v4 querySuggestion], querySuggestion == v12)
    && (float image = self->_image, [v4 image], image == v14))
  {
    int totalEngagements = self->_totalEngagements;
    BOOL v15 = totalEngagements == [v4 totalEngagements];
  }
  else
  {
LABEL_7:
    BOOL v15 = 0;
  }

  return v15;
}

- (void)writeTo:(id)a3
{
  a3;
  [(_CPImagesUsagePropensity *)self zkw];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPImagesUsagePropensity *)self recentResult];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPImagesUsagePropensity *)self other];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPImagesUsagePropensity *)self querySuggestion];
  if (v7 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(_CPImagesUsagePropensity *)self image];
  if (v8 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPImagesUsagePropensity *)self totalEngagements]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPImagesUsagePropensityReadFrom(self, (uint64_t)a3, v3);
}

@end
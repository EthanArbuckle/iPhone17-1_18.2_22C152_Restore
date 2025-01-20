@interface CIBurstClusterDivider
- (float)actionAmount;
- (float)dividerScore;
- (float)highNoiseThreshold;
- (float)noiseThreshold;
- (int)leftImage;
- (int)trueLocalMaximum;
- (int64_t)compareActionAmounts:(id)a3;
- (int64_t)compareDividers:(id)a3;
- (int64_t)compareIndices:(id)a3;
- (void)setActionAmount:(float)a3;
- (void)setDividerScore:(float)a3;
- (void)setHighNoiseThreshold:(float)a3;
- (void)setLeftImage:(int)a3;
- (void)setNoiseThreshold:(float)a3;
- (void)setTrueLocalMaximum:(int)a3;
@end

@implementation CIBurstClusterDivider

- (int64_t)compareDividers:(id)a3
{
  [a3 dividerScore];
  float v6 = v5;
  [(CIBurstClusterDivider *)self dividerScore];
  if (v6 > v7) {
    return 1;
  }
  [a3 dividerScore];
  float v10 = v9;
  [(CIBurstClusterDivider *)self dividerScore];
  if (v10 >= v11) {
    return 0;
  }
  else {
    return -1;
  }
}

- (int64_t)compareIndices:(id)a3
{
  int v5 = [a3 leftImage];
  if (v5 > [(CIBurstClusterDivider *)self leftImage]) {
    return -1;
  }
  int v7 = [a3 leftImage];
  return v7 < [(CIBurstClusterDivider *)self leftImage];
}

- (int64_t)compareActionAmounts:(id)a3
{
  [a3 actionAmount];
  float v6 = v5;
  [(CIBurstClusterDivider *)self actionAmount];
  if (v6 > v7) {
    return 1;
  }
  [a3 actionAmount];
  float v10 = v9;
  [(CIBurstClusterDivider *)self actionAmount];
  if (v10 >= v11) {
    return 0;
  }
  else {
    return -1;
  }
}

- (float)dividerScore
{
  return self->dividerScore;
}

- (void)setDividerScore:(float)a3
{
  self->dividerScore = a3;
}

- (int)leftImage
{
  return self->leftImage;
}

- (void)setLeftImage:(int)a3
{
  self->leftImage = a3;
}

- (int)trueLocalMaximum
{
  return self->trueLocalMaximum;
}

- (void)setTrueLocalMaximum:(int)a3
{
  self->trueLocalMaximum = a3;
}

- (float)actionAmount
{
  return self->actionAmount;
}

- (void)setActionAmount:(float)a3
{
  self->actionAmount = a3;
}

- (float)noiseThreshold
{
  return self->noiseThreshold;
}

- (void)setNoiseThreshold:(float)a3
{
  self->noiseThreshold = a3;
}

- (float)highNoiseThreshold
{
  return self->highNoiseThreshold;
}

- (void)setHighNoiseThreshold:(float)a3
{
  self->highNoiseThreshold = a3;
}

@end
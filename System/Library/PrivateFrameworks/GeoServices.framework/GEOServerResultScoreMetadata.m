@interface GEOServerResultScoreMetadata
- (GEOServerResultScoreMetadata)initWithGEOServerResultScoreMetadata:(id)a3;
- (float)normalizedScore;
- (void)setNormalizedScore:(float)a3;
@end

@implementation GEOServerResultScoreMetadata

- (GEOServerResultScoreMetadata)initWithGEOServerResultScoreMetadata:(id)a3
{
  v4 = (float *)a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOServerResultScoreMetadata;
  v5 = [(GEOServerResultScoreMetadata *)&v9 init];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      float v7 = v4[4];
    }
    else {
      float v7 = 0.0;
    }
    v5->_normalizedScore = v7;
  }

  return v6;
}

- (float)normalizedScore
{
  return self->_normalizedScore;
}

- (void)setNormalizedScore:(float)a3
{
  self->_normalizedScore = a3;
}

@end
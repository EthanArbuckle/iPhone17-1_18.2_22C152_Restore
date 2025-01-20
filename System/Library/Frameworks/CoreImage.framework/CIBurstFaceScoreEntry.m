@interface CIBurstFaceScoreEntry
- (CIBurstFaceScoreEntry)initWithScore:(float)a3;
- (float)computeAverage;
- (float)computeStandardDeviation;
- (float)maxScore;
- (float)minScore;
- (int)numScores;
- (void)addScore:(float)a3;
- (void)setMaxScore:(float)a3;
- (void)setMinScore:(float)a3;
- (void)setNumScores:(int)a3;
@end

@implementation CIBurstFaceScoreEntry

- (CIBurstFaceScoreEntry)initWithScore:(float)a3
{
  self->maxScore = a3;
  self->minScore = a3;
  self->sumScores = a3;
  self->sumSqScores = a3 * a3;
  self->numScores = 1;
  return self;
}

- (void)addScore:(float)a3
{
  float maxScore = self->maxScore;
  float minScore = self->minScore;
  if (maxScore <= a3) {
    float maxScore = a3;
  }
  if (minScore >= a3) {
    float minScore = a3;
  }
  self->float maxScore = maxScore;
  self->float minScore = minScore;
  float v5 = self->sumScores + a3;
  float v6 = self->sumSqScores + (float)(a3 * a3);
  self->sumScores = v5;
  self->sumSqScores = v6;
  ++self->numScores;
}

- (float)computeAverage
{
  return self->sumScores / (float)self->numScores;
}

- (float)computeStandardDeviation
{
  [(CIBurstFaceScoreEntry *)self computeAverage];
  return sqrtf((float)(self->sumSqScores / (float)self->numScores) - (float)(v3 * v3));
}

- (float)maxScore
{
  return self->maxScore;
}

- (void)setMaxScore:(float)a3
{
  self->float maxScore = a3;
}

- (float)minScore
{
  return self->minScore;
}

- (void)setMinScore:(float)a3
{
  self->float minScore = a3;
}

- (int)numScores
{
  return self->numScores;
}

- (void)setNumScores:(int)a3
{
  self->numScores = a3;
}

@end
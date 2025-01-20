@interface CSKeywordAnalyzerNDEAPIResult
- (BOOL)isEarlyDetect;
- (BOOL)isSecondChance;
- (CSKeywordAnalyzerNDEAPIResult)init;
- (CSKeywordAnalyzerNDEAPIResult)initWithBlob:(id)a3 isEarlyDetected:(BOOL)a4;
- (NSDictionary)dictionary;
- (float)bestScore;
- (unint64_t)bestEnd;
- (unint64_t)bestStart;
- (unint64_t)samplesFed;
- (void)setBestEnd:(unint64_t)a3;
- (void)setBestScore:(float)a3;
- (void)setBestStart:(unint64_t)a3;
- (void)setIsEarlyDetect:(BOOL)a3;
- (void)setIsSecondChance:(BOOL)a3;
- (void)setSamplesFed:(unint64_t)a3;
@end

@implementation CSKeywordAnalyzerNDEAPIResult

- (void)setIsEarlyDetect:(BOOL)a3
{
  self->_isEarlyDetect = a3;
}

- (BOOL)isEarlyDetect
{
  return self->_isEarlyDetect;
}

- (void)setIsSecondChance:(BOOL)a3
{
  self->_isSecondChance = a3;
}

- (BOOL)isSecondChance
{
  return self->_isSecondChance;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestEnd:(unint64_t)a3
{
  self->_bestEnd = a3;
}

- (unint64_t)bestEnd
{
  return self->_bestEnd;
}

- (void)setBestStart:(unint64_t)a3
{
  self->_bestStart = a3;
}

- (unint64_t)bestStart
{
  return self->_bestStart;
}

- (void)setSamplesFed:(unint64_t)a3
{
  self->_samplesFed = a3;
}

- (unint64_t)samplesFed
{
  return self->_samplesFed;
}

- (NSDictionary)dictionary
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v12[0] = @"samples_fed";
  v3 = [NSNumber numberWithUnsignedInteger:self->_samplesFed];
  v13[0] = v3;
  v12[1] = @"best_start";
  v4 = [NSNumber numberWithUnsignedInteger:self->_bestStart];
  v13[1] = v4;
  v12[2] = @"best_end";
  v5 = [NSNumber numberWithUnsignedInteger:self->_bestEnd];
  v13[2] = v5;
  v12[3] = @"best_score";
  *(float *)&double v6 = self->_bestScore;
  v7 = [NSNumber numberWithFloat:v6];
  v13[3] = v7;
  v12[4] = @"is_secondchance";
  v8 = [NSNumber numberWithBool:self->_isSecondChance];
  v13[4] = v8;
  v12[5] = @"isEarlyDetect";
  v9 = [NSNumber numberWithBool:self->_isEarlyDetect];
  v13[5] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];

  return (NSDictionary *)v10;
}

- (CSKeywordAnalyzerNDEAPIResult)initWithBlob:(id)a3 isEarlyDetected:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSKeywordAnalyzerNDEAPIResult;
  v7 = [(CSKeywordAnalyzerNDEAPIResult *)&v12 init];
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      uint64_t v9 = [v6 bytes];
      *(void *)&long long v10 = *(void *)v9;
      *((void *)&v10 + 1) = HIDWORD(*(void *)v9);
      *(_OWORD *)&v8->_samplesFed = v10;
      v8->_bestEnd = *(unsigned int *)(v9 + 8);
      v8->_bestScore = *(float *)(v9 + 12);
      v8->_isSecondChance = *(unsigned char *)(v9 + 16);
      v8->_isEarlyDetect = a4;
    }
    else
    {
      v7->_bestScore = -1000000.0;
    }
  }

  return v8;
}

- (CSKeywordAnalyzerNDEAPIResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSKeywordAnalyzerNDEAPIResult;
  result = [(CSKeywordAnalyzerNDEAPIResult *)&v3 init];
  if (result) {
    result->_bestScore = -1000000.0;
  }
  return result;
}

@end
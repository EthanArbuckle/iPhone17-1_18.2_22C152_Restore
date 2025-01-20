@interface CSKeywordAnalyzerNDAPIResult
- (BOOL)isEarlyWarning;
- (BOOL)isRescoring;
- (CSKeywordAnalyzerNDAPIResult)init;
- (NSDictionary)dictionary;
- (float)bestScore;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)bestEnd;
- (unint64_t)bestPhrase;
- (unint64_t)bestStart;
- (unint64_t)phId;
- (unint64_t)samplesAtFire;
- (unint64_t)samplesFed;
- (unint64_t)startSampleCount;
- (void)setBestEnd:(unint64_t)a3;
- (void)setBestPhrase:(unint64_t)a3;
- (void)setBestScore:(float)a3;
- (void)setBestStart:(unint64_t)a3;
- (void)setIsEarlyWarning:(BOOL)a3;
- (void)setIsRescoring:(BOOL)a3;
- (void)setPhId:(unint64_t)a3;
- (void)setSamplesAtFire:(unint64_t)a3;
- (void)setSamplesFed:(unint64_t)a3;
- (void)setStartSampleCount:(unint64_t)a3;
@end

@implementation CSKeywordAnalyzerNDAPIResult

- (void)setStartSampleCount:(unint64_t)a3
{
  self->_startSampleCount = a3;
}

- (unint64_t)startSampleCount
{
  return self->_startSampleCount;
}

- (void)setSamplesAtFire:(unint64_t)a3
{
  self->_samplesAtFire = a3;
}

- (unint64_t)samplesAtFire
{
  return self->_samplesAtFire;
}

- (void)setIsRescoring:(BOOL)a3
{
  self->_isRescoring = a3;
}

- (BOOL)isRescoring
{
  return self->_isRescoring;
}

- (void)setIsEarlyWarning:(BOOL)a3
{
  self->_isEarlyWarning = a3;
}

- (BOOL)isEarlyWarning
{
  return self->_isEarlyWarning;
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

- (void)setBestPhrase:(unint64_t)a3
{
  self->_bestPhrase = a3;
}

- (unint64_t)bestPhrase
{
  return self->_bestPhrase;
}

- (void)setSamplesFed:(unint64_t)a3
{
  self->_samplesFed = a3;
}

- (unint64_t)samplesFed
{
  return self->_samplesFed;
}

- (void)setPhId:(unint64_t)a3
{
  self->_phId = a3;
}

- (unint64_t)phId
{
  return self->_phId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CSKeywordAnalyzerNDAPIResult);
  [(CSKeywordAnalyzerNDAPIResult *)v4 setPhId:self->_phId];
  [(CSKeywordAnalyzerNDAPIResult *)v4 setSamplesFed:self->_samplesFed];
  [(CSKeywordAnalyzerNDAPIResult *)v4 setBestPhrase:self->_bestPhrase];
  [(CSKeywordAnalyzerNDAPIResult *)v4 setBestStart:self->_bestStart];
  [(CSKeywordAnalyzerNDAPIResult *)v4 setBestEnd:self->_bestEnd];
  *(float *)&double v5 = self->_bestScore;
  [(CSKeywordAnalyzerNDAPIResult *)v4 setBestScore:v5];
  [(CSKeywordAnalyzerNDAPIResult *)v4 setIsEarlyWarning:self->_isEarlyWarning];
  [(CSKeywordAnalyzerNDAPIResult *)v4 setIsRescoring:self->_isRescoring];
  [(CSKeywordAnalyzerNDAPIResult *)v4 setSamplesAtFire:self->_samplesAtFire];
  [(CSKeywordAnalyzerNDAPIResult *)v4 setStartSampleCount:self->_startSampleCount];
  return v4;
}

- (NSDictionary)dictionary
{
  v16[9] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_samplesFed, @"samples_fed");
  v16[0] = v3;
  v15[1] = @"best_phrase";
  v4 = [NSNumber numberWithUnsignedInteger:self->_bestPhrase];
  v16[1] = v4;
  v15[2] = @"best_start";
  double v5 = [NSNumber numberWithUnsignedInteger:self->_bestStart];
  v16[2] = v5;
  v15[3] = @"best_end";
  v6 = [NSNumber numberWithUnsignedInteger:self->_bestEnd];
  v16[3] = v6;
  v15[4] = @"best_score";
  *(float *)&double v7 = self->_bestScore;
  v8 = [NSNumber numberWithFloat:v7];
  v16[4] = v8;
  v15[5] = @"early_warning";
  v9 = [NSNumber numberWithBool:self->_isEarlyWarning];
  v16[5] = v9;
  v15[6] = @"is_rescoring";
  v10 = [NSNumber numberWithBool:self->_isRescoring];
  v16[6] = v10;
  v15[7] = @"samples_at_fire";
  v11 = [NSNumber numberWithUnsignedInteger:self->_samplesAtFire];
  v16[7] = v11;
  v15[8] = @"start_sample_count";
  v12 = [NSNumber numberWithUnsignedInteger:self->_startSampleCount];
  v16[8] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:9];

  return (NSDictionary *)v13;
}

- (CSKeywordAnalyzerNDAPIResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSKeywordAnalyzerNDAPIResult;
  result = [(CSKeywordAnalyzerNDAPIResult *)&v3 init];
  if (result) {
    result->_bestScore = -1000000.0;
  }
  return result;
}

@end
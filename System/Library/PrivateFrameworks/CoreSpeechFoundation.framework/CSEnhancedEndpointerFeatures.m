@interface CSEnhancedEndpointerFeatures
- (CSEnhancedEndpointerFeatures)initWithTrailingSilenceDuration:(int64_t)a3 clientSilenceFramesCount:(double)a4 endOfSentenceLikelihood:(double)a5 wordCount:(int64_t)a6 serverFeaturesLatency:(double)a7 clientSilenceProbability:(double)a8 rcTrailingSilenceDuration:(int64_t)a9 rcEndOfSentenceLikelihood:(double)a10 rcWordCount:(int64_t)a11 rcServerFeaturesLatency:(double)a12 silencePosterior:(double)a13 acousticEndpointerScore:(double)a14 silencePosteriorNF:(float)a15;
- (double)acousticEndpointerScore;
- (double)clientSilenceFramesCount;
- (double)clientSilenceProbability;
- (double)endOfSentenceLikelihood;
- (double)rcEndOfSentenceLikelihood;
- (double)rcServerFeaturesLatency;
- (double)serverFeaturesLatency;
- (double)silencePosterior;
- (float)silencePosteriorNF;
- (id)toFeatureArray;
- (int64_t)rcTrailingSilenceDuration;
- (int64_t)rcWordCount;
- (int64_t)trailingSilenceDuration;
- (int64_t)wordCount;
@end

@implementation CSEnhancedEndpointerFeatures

- (float)silencePosteriorNF
{
  return self->_silencePosteriorNF;
}

- (double)acousticEndpointerScore
{
  return self->_acousticEndpointerScore;
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (double)rcServerFeaturesLatency
{
  return self->_rcServerFeaturesLatency;
}

- (int64_t)rcWordCount
{
  return self->_rcWordCount;
}

- (double)rcEndOfSentenceLikelihood
{
  return self->_rcEndOfSentenceLikelihood;
}

- (int64_t)rcTrailingSilenceDuration
{
  return self->_rcTrailingSilenceDuration;
}

- (double)clientSilenceProbability
{
  return self->_clientSilenceProbability;
}

- (double)serverFeaturesLatency
{
  return self->_serverFeaturesLatency;
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- (double)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (double)clientSilenceFramesCount
{
  return self->_clientSilenceFramesCount;
}

- (int64_t)trailingSilenceDuration
{
  return self->_trailingSilenceDuration;
}

- (id)toFeatureArray
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [NSNumber numberWithInteger:self->_trailingSilenceDuration];
  [v3 addObject:v4];

  v5 = [NSNumber numberWithDouble:self->_clientSilenceFramesCount];
  [v3 addObject:v5];

  v6 = [NSNumber numberWithDouble:self->_endOfSentenceLikelihood];
  [v3 addObject:v6];

  v7 = [NSNumber numberWithInteger:self->_wordCount];
  [v3 addObject:v7];

  v8 = [NSNumber numberWithDouble:self->_serverFeaturesLatency];
  [v3 addObject:v8];

  v9 = [NSNumber numberWithDouble:self->_clientSilenceProbability];
  [v3 addObject:v9];

  v10 = [NSNumber numberWithInteger:self->_rcTrailingSilenceDuration];
  [v3 addObject:v10];

  v11 = [NSNumber numberWithDouble:self->_rcEndOfSentenceLikelihood];
  [v3 addObject:v11];

  v12 = [NSNumber numberWithInteger:self->_rcWordCount];
  [v3 addObject:v12];

  v13 = [NSNumber numberWithDouble:self->_rcServerFeaturesLatency];
  [v3 addObject:v13];

  v14 = [NSNumber numberWithDouble:self->_silencePosterior];
  [v3 addObject:v14];

  v15 = [NSNumber numberWithDouble:self->_acousticEndpointerScore];
  [v3 addObject:v15];

  *(float *)&double v16 = self->_silencePosteriorNF;
  v17 = [NSNumber numberWithFloat:v16];
  [v3 addObject:v17];

  return v3;
}

- (CSEnhancedEndpointerFeatures)initWithTrailingSilenceDuration:(int64_t)a3 clientSilenceFramesCount:(double)a4 endOfSentenceLikelihood:(double)a5 wordCount:(int64_t)a6 serverFeaturesLatency:(double)a7 clientSilenceProbability:(double)a8 rcTrailingSilenceDuration:(int64_t)a9 rcEndOfSentenceLikelihood:(double)a10 rcWordCount:(int64_t)a11 rcServerFeaturesLatency:(double)a12 silencePosterior:(double)a13 acousticEndpointerScore:(double)a14 silencePosteriorNF:(float)a15
{
  v28.receiver = self;
  v28.super_class = (Class)CSEnhancedEndpointerFeatures;
  result = [(CSEnhancedEndpointerFeatures *)&v28 init];
  if (result)
  {
    result->_trailingSilenceDuration = a3;
    result->_clientSilenceFramesCount = a4;
    result->_endOfSentenceLikelihood = a5;
    result->_wordCount = a6;
    result->_serverFeaturesLatency = a7;
    result->_clientSilenceProbability = a8;
    result->_rcTrailingSilenceDuration = a9;
    result->_rcEndOfSentenceLikelihood = a10;
    result->_rcWordCount = a11;
    result->_rcServerFeaturesLatency = a12;
    result->_silencePosterior = a13;
    result->_acousticEndpointerScore = a14;
    result->_silencePosteriorNF = a15;
  }
  return result;
}

@end
@interface _EARDefaultServerEndpointFeatures
- (_EARDefaultServerEndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(float)a5 acousticEndpointerScore:(float)a6 silencePosterior:(float)a7;
- (_EARDefaultServerEndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(float)a5 silencePosterior:(float)a6;
- (float)acousticEndpointerScore;
- (float)endOfSentenceLikelihood;
- (float)silencePosterior;
- (int64_t)trailingSilenceDuration;
- (int64_t)wordCount;
- (void)setAcousticEndpointerScore:(float)a3;
- (void)setEndOfSentenceLikelihood:(float)a3;
- (void)setSilencePosterior:(float)a3;
- (void)setTrailingSilenceDuration:(int64_t)a3;
- (void)setWordCount:(int64_t)a3;
@end

@implementation _EARDefaultServerEndpointFeatures

- (_EARDefaultServerEndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(float)a5 acousticEndpointerScore:(float)a6 silencePosterior:(float)a7
{
  v13.receiver = self;
  v13.super_class = (Class)_EARDefaultServerEndpointFeatures;
  result = [(_EARDefaultServerEndpointFeatures *)&v13 init];
  if (result)
  {
    result->_wordCount = a3;
    result->_trailingSilenceDuration = a4;
    result->_endOfSentenceLikelihood = a5;
    result->_acousticEndpointerScore = a6;
    result->_silencePosterior = a7;
  }
  return result;
}

- (_EARDefaultServerEndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(float)a5 silencePosterior:(float)a6
{
  return -[_EARDefaultServerEndpointFeatures initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:silencePosterior:](self, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:silencePosterior:", a3, a4);
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- (void)setWordCount:(int64_t)a3
{
  self->_wordCount = a3;
}

- (int64_t)trailingSilenceDuration
{
  return self->_trailingSilenceDuration;
}

- (void)setTrailingSilenceDuration:(int64_t)a3
{
  self->_trailingSilenceDuration = a3;
}

- (float)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (void)setEndOfSentenceLikelihood:(float)a3
{
  self->_endOfSentenceLikelihood = a3;
}

- (float)acousticEndpointerScore
{
  return self->_acousticEndpointerScore;
}

- (void)setAcousticEndpointerScore:(float)a3
{
  self->_acousticEndpointerScore = a3;
}

- (float)silencePosterior
{
  return self->_silencePosterior;
}

- (void)setSilencePosterior:(float)a3
{
  self->_silencePosterior = a3;
}

@end
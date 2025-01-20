@interface _EAREndpointFeatures
- (NSArray)pauseCounts;
- (_EAREndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(double)a5 acousticEndpointerScore:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 clientSilenceFramesCountMs:(double)a9 clientSilenceProbability:(double)a10 silencePosteriorNF:(float)a11 serverFeaturesLatency:(float)a12 eagerResultEndTime:(int64_t)a13;
- (_EAREndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 clientSilenceFramesCountMs:(double)a8 clientSilenceProbability:(double)a9 silencePosteriorNF:(float)a10 serverFeaturesLatency:(float)a11;
- (_EAREndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 clientSilenceFramesCountMs:(double)a8 clientSilenceProbability:(double)a9 silencePosteriorNF:(float)a10 serverFeaturesLatency:(float)a11 eagerResultEndTime:(int64_t)a12;
- (double)acousticEndpointerScore;
- (double)clientSilenceFramesCountMs;
- (double)clientSilenceProbability;
- (double)endOfSentenceLikelihood;
- (double)silencePosterior;
- (float)serverFeaturesLatency;
- (float)silencePosteriorNF;
- (id)description;
- (int64_t)eagerResultEndTime;
- (int64_t)trailingSilenceDuration;
- (int64_t)wordCount;
- (void)setAcousticEndpointerScore:(double)a3;
- (void)setClientSilenceFramesCountMs:(double)a3;
- (void)setClientSilenceProbability:(double)a3;
- (void)setEagerResultEndTime:(int64_t)a3;
- (void)setEndOfSentenceLikelihood:(double)a3;
- (void)setPauseCounts:(id)a3;
- (void)setServerFeaturesLatency:(float)a3;
- (void)setSilencePosterior:(double)a3;
- (void)setSilencePosteriorNF:(float)a3;
- (void)setTrailingSilenceDuration:(int64_t)a3;
- (void)setWordCount:(int64_t)a3;
@end

@implementation _EAREndpointFeatures

- (_EAREndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 clientSilenceFramesCountMs:(double)a8 clientSilenceProbability:(double)a9 silencePosteriorNF:(float)a10 serverFeaturesLatency:(float)a11
{
  *(float *)&double v11 = a11;
  *(float *)&double v12 = a10;
  return [(_EAREndpointFeatures *)self initWithWordCount:a3 trailingSilenceDuration:a4 endOfSentenceLikelihood:a6 acousticEndpointerScore:0 pauseCounts:a5 silencePosterior:0.0 clientSilenceFramesCountMs:a7 clientSilenceProbability:a8 silencePosteriorNF:a9 serverFeaturesLatency:v12 eagerResultEndTime:v11];
}

- (_EAREndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(double)a5 pauseCounts:(id)a6 silencePosterior:(double)a7 clientSilenceFramesCountMs:(double)a8 clientSilenceProbability:(double)a9 silencePosteriorNF:(float)a10 serverFeaturesLatency:(float)a11 eagerResultEndTime:(int64_t)a12
{
  *(float *)&double v12 = a11;
  *(float *)&double v13 = a10;
  return [(_EAREndpointFeatures *)self initWithWordCount:a3 trailingSilenceDuration:a4 endOfSentenceLikelihood:a6 acousticEndpointerScore:a12 pauseCounts:a5 silencePosterior:0.0 clientSilenceFramesCountMs:a7 clientSilenceProbability:a8 silencePosteriorNF:a9 serverFeaturesLatency:v13 eagerResultEndTime:v12];
}

- (_EAREndpointFeatures)initWithWordCount:(int64_t)a3 trailingSilenceDuration:(int64_t)a4 endOfSentenceLikelihood:(double)a5 acousticEndpointerScore:(double)a6 pauseCounts:(id)a7 silencePosterior:(double)a8 clientSilenceFramesCountMs:(double)a9 clientSilenceProbability:(double)a10 silencePosteriorNF:(float)a11 serverFeaturesLatency:(float)a12 eagerResultEndTime:(int64_t)a13
{
  id v25 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_EAREndpointFeatures;
  v26 = [(_EAREndpointFeatures *)&v29 init];
  v27 = v26;
  if (v26)
  {
    v26->_wordCount = a3;
    v26->_trailingSilenceDuration = a4;
    v26->_endOfSentenceLikelihood = a5;
    v26->_acousticEndpointerScore = a6;
    objc_storeStrong((id *)&v26->_pauseCounts, a7);
    v27->_silencePosterior = a8;
    v27->_clientSilenceFramesCountMs = a9;
    v27->_clientSilenceProbability = a10;
    v27->_silencePosteriorNF = a11;
    v27->_serverFeaturesLatency = a12;
    v27->_eagerResultEndTime = a13;
  }

  return v27;
}

- (id)description
{
  v3 = NSString;
  int64_t wordCount = self->_wordCount;
  int64_t trailingSilenceDuration = self->_trailingSilenceDuration;
  double endOfSentenceLikelihood = self->_endOfSentenceLikelihood;
  v7 = [(NSArray *)self->_pauseCounts componentsJoinedByString:@", "];
  v8 = [v3 stringWithFormat:@"{ wordCount: %ld, trailingSilenceDuration: %ld, endOfSentenceLikelihood: %f, pauseCounts:(%@), silencePosterior: %f, clientSilenceFramesCountMs: %f, clientSilenceProbability: %f, silencePosteriorNF: %f, serverFeaturesLatency: %f, eagerResultEndTime: %ld }", wordCount, trailingSilenceDuration, *(void *)&endOfSentenceLikelihood, v7, *(void *)&self->_silencePosterior, *(void *)&self->_clientSilenceFramesCountMs, *(void *)&self->_clientSilenceProbability, self->_silencePosteriorNF, self->_serverFeaturesLatency, self->_eagerResultEndTime];

  return v8;
}

- (int64_t)wordCount
{
  return self->_wordCount;
}

- (void)setWordCount:(int64_t)a3
{
  self->_int64_t wordCount = a3;
}

- (int64_t)trailingSilenceDuration
{
  return self->_trailingSilenceDuration;
}

- (void)setTrailingSilenceDuration:(int64_t)a3
{
  self->_int64_t trailingSilenceDuration = a3;
}

- (double)endOfSentenceLikelihood
{
  return self->_endOfSentenceLikelihood;
}

- (void)setEndOfSentenceLikelihood:(double)a3
{
  self->_double endOfSentenceLikelihood = a3;
}

- (double)acousticEndpointerScore
{
  return self->_acousticEndpointerScore;
}

- (void)setAcousticEndpointerScore:(double)a3
{
  self->_acousticEndpointerScore = a3;
}

- (NSArray)pauseCounts
{
  return self->_pauseCounts;
}

- (void)setPauseCounts:(id)a3
{
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (void)setSilencePosterior:(double)a3
{
  self->_silencePosterior = a3;
}

- (double)clientSilenceFramesCountMs
{
  return self->_clientSilenceFramesCountMs;
}

- (void)setClientSilenceFramesCountMs:(double)a3
{
  self->_clientSilenceFramesCountMs = a3;
}

- (double)clientSilenceProbability
{
  return self->_clientSilenceProbability;
}

- (void)setClientSilenceProbability:(double)a3
{
  self->_clientSilenceProbability = a3;
}

- (float)silencePosteriorNF
{
  return self->_silencePosteriorNF;
}

- (void)setSilencePosteriorNF:(float)a3
{
  self->_silencePosteriorNF = a3;
}

- (float)serverFeaturesLatency
{
  return self->_serverFeaturesLatency;
}

- (void)setServerFeaturesLatency:(float)a3
{
  self->_serverFeaturesLatency = a3;
}

- (int64_t)eagerResultEndTime
{
  return self->_eagerResultEndTime;
}

- (void)setEagerResultEndTime:(int64_t)a3
{
  self->_eagerResultEndTime = a3;
}

- (void).cxx_destruct
{
}

@end
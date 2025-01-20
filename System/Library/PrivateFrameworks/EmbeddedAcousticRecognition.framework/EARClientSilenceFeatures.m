@interface EARClientSilenceFeatures
- (EARClientSilenceFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 silencePosterior:(double)a6 processedAudioMs:(double)a7;
- (EARClientSilenceFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 silencePosterior:(double)a6 processedAudioMs:(double)a7 inferenceTime:(unint64_t)a8;
- (double)processedAudioMs;
- (double)silenceDurationMs;
- (double)silenceFramesCountMs;
- (double)silencePosterior;
- (double)silenceProbability;
- (unint64_t)inferenceTime;
- (void)setInferenceTime:(unint64_t)a3;
- (void)setProcessedAudioMs:(double)a3;
- (void)setSilenceDurationMs:(double)a3;
- (void)setSilenceFramesCountMs:(double)a3;
- (void)setSilencePosterior:(double)a3;
- (void)setSilenceProbability:(double)a3;
@end

@implementation EARClientSilenceFeatures

- (EARClientSilenceFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 silencePosterior:(double)a6 processedAudioMs:(double)a7 inferenceTime:(unint64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)EARClientSilenceFeatures;
  result = [(EARClientSilenceFeatures *)&v15 init];
  if (result)
  {
    result->_silenceFramesCountMs = a3;
    result->_silenceProbability = a4;
    result->_silenceDurationMs = a5;
    result->_silencePosterior = a6;
    result->_processedAudioMs = a7;
    result->_inferenceTime = a8;
  }
  return result;
}

- (EARClientSilenceFeatures)initWithSilenceFramesCountMs:(double)a3 silenceProbability:(double)a4 silenceDurationMs:(double)a5 silencePosterior:(double)a6 processedAudioMs:(double)a7
{
  return [(EARClientSilenceFeatures *)self initWithSilenceFramesCountMs:0 silenceProbability:a3 silenceDurationMs:a4 silencePosterior:a5 processedAudioMs:a6 inferenceTime:a7];
}

- (double)silenceFramesCountMs
{
  return self->_silenceFramesCountMs;
}

- (void)setSilenceFramesCountMs:(double)a3
{
  self->_silenceFramesCountMs = a3;
}

- (double)silenceProbability
{
  return self->_silenceProbability;
}

- (void)setSilenceProbability:(double)a3
{
  self->_silenceProbability = a3;
}

- (double)silenceDurationMs
{
  return self->_silenceDurationMs;
}

- (void)setSilenceDurationMs:(double)a3
{
  self->_silenceDurationMs = a3;
}

- (double)silencePosterior
{
  return self->_silencePosterior;
}

- (void)setSilencePosterior:(double)a3
{
  self->_silencePosterior = a3;
}

- (double)processedAudioMs
{
  return self->_processedAudioMs;
}

- (void)setProcessedAudioMs:(double)a3
{
  self->_processedAudioMs = a3;
}

- (unint64_t)inferenceTime
{
  return self->_inferenceTime;
}

- (void)setInferenceTime:(unint64_t)a3
{
  self->_inferenceTime = a3;
}

@end
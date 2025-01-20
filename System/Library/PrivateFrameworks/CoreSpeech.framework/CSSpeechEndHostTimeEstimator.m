@interface CSSpeechEndHostTimeEstimator
- (BOOL)endPointNotified;
- (CSSpeechEndHostTimeEstimator)init;
- (double)trailingSilenceDurationAtEndpoint;
- (unint64_t)estimatedSpeechEndHostTime;
- (unint64_t)estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:(unint64_t)a3;
- (unint64_t)lastAudioChunkHostTime;
- (unint64_t)numAudioSampleForwarded;
- (void)addNumSamples:(unint64_t)a3 hostTime:(unint64_t)a4;
- (void)notifyTrailingSilenceDurationAtEndpoint:(double)a3;
- (void)reset;
- (void)setEndPointNotified:(BOOL)a3;
- (void)setLastAudioChunkHostTime:(unint64_t)a3;
- (void)setNumAudioSampleForwarded:(unint64_t)a3;
- (void)setTrailingSilenceDurationAtEndpoint:(double)a3;
@end

@implementation CSSpeechEndHostTimeEstimator

- (void)setTrailingSilenceDurationAtEndpoint:(double)a3
{
  self->_trailingSilenceDurationAtEndpoint = a3;
}

- (double)trailingSilenceDurationAtEndpoint
{
  return self->_trailingSilenceDurationAtEndpoint;
}

- (void)setEndPointNotified:(BOOL)a3
{
  self->_endPointNotified = a3;
}

- (BOOL)endPointNotified
{
  return self->_endPointNotified;
}

- (void)setLastAudioChunkHostTime:(unint64_t)a3
{
  self->_lastAudioChunkHostTime = a3;
}

- (unint64_t)lastAudioChunkHostTime
{
  return self->_lastAudioChunkHostTime;
}

- (void)setNumAudioSampleForwarded:(unint64_t)a3
{
  self->_numAudioSampleForwarded = a3;
}

- (unint64_t)numAudioSampleForwarded
{
  return self->_numAudioSampleForwarded;
}

- (unint64_t)estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:(unint64_t)a3
{
  double trailingSilenceDurationAtEndpoint = self->_trailingSilenceDurationAtEndpoint;
  *(float *)&double trailingSilenceDurationAtEndpoint = trailingSilenceDurationAtEndpoint;
  unint64_t v5 = a3
     - (void)+[CSFTimeUtils secondsToHostTime:trailingSilenceDurationAtEndpoint];
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    v9 = "-[CSSpeechEndHostTimeEstimator estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:]";
    __int16 v10 = 2050;
    unint64_t v11 = a3;
    __int16 v12 = 2050;
    unint64_t v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: lastAudioChunkHostTime = %{public}llu, estimatedSpeechEndHostTime = %{public}llu", (uint8_t *)&v8, 0x20u);
  }
  return v5;
}

- (unint64_t)estimatedSpeechEndHostTime
{
  return [(CSSpeechEndHostTimeEstimator *)self estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:self->_lastAudioChunkHostTime];
}

- (void)notifyTrailingSilenceDurationAtEndpoint:(double)a3
{
  unint64_t v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:]";
    __int16 v10 = 2050;
    double v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: trailingSilenceDuration = %{public}f", (uint8_t *)&v8, 0x16u);
  }
  if (a3 >= 2.5)
  {
    v7 = CSLogContextFacilityCoreSpeech;
    double v6 = 0.0;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      v9 = "-[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:]";
      __int16 v10 = 2050;
      double v11 = a3;
      __int16 v12 = 2050;
      uint64_t v13 = 0x4004000000000000;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: TrailingSilenceDuration at endpointer(%{public}f) is longer than threshold(%{public}f), force to make 0", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    double v6 = a3;
  }
  self->_double trailingSilenceDurationAtEndpoint = v6;
}

- (void)addNumSamples:(unint64_t)a3 hostTime:(unint64_t)a4
{
  self->_numAudioSampleForwarded += a3;
  self->_lastAudioChunkHostTime = a4;
}

- (void)reset
{
  self->_endPointNotified = 0;
  self->_lastAudioChunkHostTime = 0;
  self->_double trailingSilenceDurationAtEndpoint = 0.0;
  self->_numAudioSampleForwarded = 0;
}

- (CSSpeechEndHostTimeEstimator)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSSpeechEndHostTimeEstimator;
  v2 = [(CSSpeechEndHostTimeEstimator *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSSpeechEndHostTimeEstimator *)v2 reset];
  }
  return v3;
}

@end
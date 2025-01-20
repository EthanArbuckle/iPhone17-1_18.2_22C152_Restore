@interface MPCFirstFailureDetector
- (BOOL)processSample:(id)a3;
- (MPCAudioFailure)multiSamplesFailure;
- (MPCAudioFailure)singleSampleFailure;
- (MPCFirstFailureDetector)initWithSamplingTime:(double)a3 renderingLimit:(double)a4;
- (double)samplingTime;
@end

@implementation MPCFirstFailureDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSamplesFailure, 0);

  objc_storeStrong((id *)&self->_singleSampleFailure, 0);
}

- (MPCAudioFailure)multiSamplesFailure
{
  return self->_multiSamplesFailure;
}

- (MPCAudioFailure)singleSampleFailure
{
  return self->_singleSampleFailure;
}

- (double)samplingTime
{
  return self->_dT;
}

- (BOOL)processSample:(id)a3
{
  id v4 = a3;
  v5 = v4;
  ++self->_currentSample;
  switch(self->_state)
  {
    case 0:
      self->_state = 1;
      goto LABEL_3;
    case 1:
LABEL_3:
      [v4 time];
      if (v6 <= self->_limit) {
        goto LABEL_28;
      }
      unint64_t currentSample = self->_currentSample;
      if (self->_currentFailureStartSample == -1) {
        self->_unint64_t currentFailureStartSample = currentSample;
      }
      BOOL v8 = 1;
      self->_lastFailureSample = currentSample;
      self->_failureCount = 1;
      int64_t v9 = 2;
      goto LABEL_7;
    case 2:
      [v4 time];
      if (v10 >= self->_limit)
      {
        unint64_t v11 = self->_currentSample;
        if (v11 - self->_lastFailureSample <= 4)
        {
          unint64_t v12 = self->_failureCount + 1;
          self->_lastFailureSample = v11;
          self->_failureCount = v12;
          self->_state = 3;
          goto LABEL_14;
        }
      }
      [v5 time];
      if (v17 >= self->_limit) {
        goto LABEL_28;
      }
      unint64_t currentFailureStartSample = self->_currentFailureStartSample;
      if (self->_currentSample - currentFailureStartSample < 5) {
        goto LABEL_28;
      }
      if (self->_singleSampleFailure) {
        goto LABEL_26;
      }
      +[MPCAudioFailure singleSampleFailure:duration:](MPCAudioFailure, "singleSampleFailure:duration:", self->_dT / 1000.0 * (double)currentFailureStartSample);
      v19 = (MPCAudioFailure *)objc_claimAutoreleasedReturnValue();
      singleSampleFailure = self->_singleSampleFailure;
      self->_singleSampleFailure = v19;
      goto LABEL_24;
    case 3:
      [v4 time];
      if (v13 < self->_limit || (unint64_t v14 = self->_currentSample, v14 - self->_lastFailureSample > 4))
      {
        [v5 time];
        if (v21 >= self->_limit || self->_currentSample - self->_lastFailureSample < 5)
        {
LABEL_28:
          BOOL v8 = 0;
          goto LABEL_29;
        }
        if (!self->_multiSamplesFailure)
        {
          v22 = +[MPCAudioFailure multiSamplesFailure:self->_dT / 1000.0 * (double)self->_currentFailureStartSample duration:self->_dT / 1000.0 * (double)self->_failureCount];
          singleSampleFailure = self->_multiSamplesFailure;
          self->_multiSamplesFailure = v22;
LABEL_24:
        }
        if (self->_singleSampleFailure)
        {
LABEL_26:
          if (self->_multiSamplesFailure)
          {
            BOOL v8 = 0;
            int64_t v9 = 4;
LABEL_7:
            self->_state = v9;
            goto LABEL_29;
          }
        }
        BOOL v8 = 0;
        self->_failureCount = 0;
        *(void *)&long long v24 = -1;
        *((void *)&v24 + 1) = -1;
        *(_OWORD *)&self->_unint64_t currentFailureStartSample = v24;
        int64_t v9 = 1;
        goto LABEL_7;
      }
      unint64_t v15 = self->_failureCount + 1;
      self->_lastFailureSample = v14;
      self->_failureCount = v15;
LABEL_14:
      BOOL v8 = 1;
LABEL_29:

      return v8;
    case 4:
      [v4 time];
      BOOL v8 = v16 > self->_limit;
      goto LABEL_29;
    default:
      goto LABEL_28;
  }
}

- (MPCFirstFailureDetector)initWithSamplingTime:(double)a3 renderingLimit:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MPCFirstFailureDetector;
  result = [(MPCFirstFailureDetector *)&v7 init];
  if (result)
  {
    result->_dT = a3;
    result->_limit = a4;
    result->_unint64_t currentFailureStartSample = -1;
  }
  return result;
}

@end
@interface SHStreamingSessionDriver
- (BOOL)canPerformMatch;
- (NSDate)intermissionDeadline;
- (NSUUID)matchingSignatureID;
- (SHSessionDriverDelegate)sessionDriverDelegate;
- (SHSignatureBuffer)signatureBuffer;
- (SHSignatureMetrics)metrics;
- (SHStreamingSessionDriver)initWithMinimumSignatureDuration:(double)a3 maximumSignatureDuration:(double)a4 bufferDuration:(double)a5;
- (SHStreamingSessionDriver)initWithSignatureBuffer:(id)a3;
- (double)currentRequiredDuration;
- (id)signatureForMatching;
- (os_unfair_lock_s)lock;
- (void)flow:(id)a3 time:(id)a4;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)receivedSignature:(id)a3 retry:(double)a4 offset:(double)a5 intermission:(double)a6 dropCurrentSignature:(BOOL)a7;
- (void)setCurrentRequiredDuration:(double)a3;
- (void)setIntermissionDeadline:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMatchingSignatureID:(id)a3;
- (void)setSessionDriverDelegate:(id)a3;
- (void)setSignatureBuffer:(id)a3;
@end

@implementation SHStreamingSessionDriver

- (SHStreamingSessionDriver)initWithMinimumSignatureDuration:(double)a3 maximumSignatureDuration:(double)a4 bufferDuration:(double)a5
{
  v6 = [[SHSignatureBuffer alloc] initWithMinimumSignatureDuration:a3 maximumSignatureDuration:a4 bufferDuration:a5];
  v7 = [(SHStreamingSessionDriver *)self initWithSignatureBuffer:v6];

  return v7;
}

- (SHStreamingSessionDriver)initWithSignatureBuffer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHStreamingSessionDriver;
  v6 = [(SHStreamingSessionDriver *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signatureBuffer, a3);
    [v5 minimumSignatureDuration];
    v7->_currentRequiredDuration = v8;
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)flow:(id)a3 time:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  v7 = [(SHStreamingSessionDriver *)self sessionDriverDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(SHStreamingSessionDriver *)self sessionDriverDelegate];
    uint64_t v10 = [v9 shouldGenerateSpectralOutput];
    v11 = [(SHStreamingSessionDriver *)self signatureBuffer];
    [v11 setShouldGenerateSpectralOutput:v10];
  }
  os_unfair_lock_lock(&self->_lock);
  uint64_t v12 = [(SHStreamingSessionDriver *)self intermissionDeadline];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [MEMORY[0x263EFF910] date];
    v15 = [(SHStreamingSessionDriver *)self intermissionDeadline];
    v16 = [v14 laterDate:v15];
    v17 = [(SHStreamingSessionDriver *)self intermissionDeadline];

    if (v16 == v17) {
      goto LABEL_8;
    }
  }
  v18 = [(SHStreamingSessionDriver *)self signatureBuffer];
  [v18 flow:v22 time:v6];

  if (![(SHStreamingSessionDriver *)self canPerformMatch])
  {
LABEL_8:
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v19 = [(SHStreamingSessionDriver *)self signatureForMatching];
    v20 = [v19 _ID];
    [(SHStreamingSessionDriver *)self setMatchingSignatureID:v20];

    os_unfair_lock_unlock(&self->_lock);
    if (v19)
    {
      v21 = [(SHStreamingSessionDriver *)self sessionDriverDelegate];
      [v21 matchSignature:v19];
    }
  }
}

- (void)receivedSignature:(id)a3 retry:(double)a4 offset:(double)a5 intermission:(double)a6 dropCurrentSignature:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  v13 = sh_log_object();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 134218496;
    double v30 = a4;
    __int16 v31 = 2048;
    double v32 = a5;
    __int16 v33 = 2048;
    double v34 = a6;
    _os_log_impl(&dword_224B4B000, v13, OS_LOG_TYPE_DEBUG, "Asked to retry with %f at offset %f and intermission %f", (uint8_t *)&v29, 0x20u);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v15 = [(SHStreamingSessionDriver *)self matchingSignatureID];
  v16 = [v12 _ID];
  char v17 = [v15 isEqual:v16];

  if ((v17 & 1) == 0)
  {
    v23 = sh_log_object();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [v12 _ID];
      v25 = [(SHStreamingSessionDriver *)self matchingSignatureID];
      int v29 = 138412546;
      double v30 = *(double *)&v24;
      __int16 v31 = 2112;
      double v32 = *(double *)&v25;
      _os_log_impl(&dword_224B4B000, v23, OS_LOG_TYPE_ERROR, "StreamingSessionDriver received a response for signature %@ it was not expecting, it was expecting %@", (uint8_t *)&v29, 0x16u);
    }
    goto LABEL_14;
  }
  if (v7)
  {
    v18 = [(SHStreamingSessionDriver *)self signatureBuffer];
    v19 = [(SHStreamingSessionDriver *)self matchingSignatureID];
    [v18 discardSignatureWithID:v19];
  }
  [(SHStreamingSessionDriver *)self setMatchingSignatureID:0];
  v20 = [(SHStreamingSessionDriver *)self signatureBuffer];
  [v20 setSignatureOffset:a5];

  [(SHStreamingSessionDriver *)self setCurrentRequiredDuration:a4];
  if (a6 > 0.0)
  {
    v21 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a6];
    [(SHStreamingSessionDriver *)self setIntermissionDeadline:v21];

    id v22 = [(SHStreamingSessionDriver *)self signatureBuffer];
    [v22 reset];

LABEL_14:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_15;
  }
  if (![(SHStreamingSessionDriver *)self canPerformMatch]) {
    goto LABEL_14;
  }
  [(SHStreamingSessionDriver *)self setIntermissionDeadline:0];
  v26 = [(SHStreamingSessionDriver *)self signatureForMatching];
  v27 = [v26 _ID];
  [(SHStreamingSessionDriver *)self setMatchingSignatureID:v27];

  os_unfair_lock_unlock(&self->_lock);
  if (v26)
  {
    v28 = [(SHStreamingSessionDriver *)self sessionDriverDelegate];
    [v28 matchSignature:v26];
  }
LABEL_15:
}

- (BOOL)canPerformMatch
{
  v3 = [(SHStreamingSessionDriver *)self matchingSignatureID];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(SHStreamingSessionDriver *)self signatureBuffer];
    [v5 currentSignatureDuration];
    double v7 = v6;
    [(SHStreamingSessionDriver *)self currentRequiredDuration];
    BOOL v4 = v7 >= v8;
  }
  return v4;
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v32 = a4;
  uint64_t v5 = [v32 result];
  switch(v5)
  {
    case 1:
      [v32 retrySeconds];
      if (v9 == 0.0)
      {
        uint64_t v8 = 1;
        goto LABEL_18;
      }
      [v32 retrySeconds];
      double v11 = v10;
      break;
    case 2:
      [v32 retrySeconds];
      double v13 = v12;
      [v32 recordingSignatureOffset];
      double v11 = v13 - v14;
      break;
    case 3:
      double v6 = [v32 error];
      if ((objc_msgSend(v6, "sh_isSignatureInvalid") & 1) == 0)
      {
        double v7 = [v32 error];
        if (objc_msgSend(v7, "sh_isSignatureDurationInvalid"))
        {
          uint64_t v8 = 1;
        }
        else
        {
          v19 = [v32 error];
          uint64_t v8 = objc_msgSend(v19, "sh_isMatchAttemptFailed");
        }
        goto LABEL_16;
      }
      goto LABEL_11;
    default:
      uint64_t v8 = 0;
      goto LABEL_18;
  }
  double v6 = [(SHStreamingSessionDriver *)self signatureBuffer];
  [v6 maximumSignatureDuration];
  if (v11 <= v15)
  {
    [v32 retrySeconds];
    double v17 = v16;
    double v7 = [(SHStreamingSessionDriver *)self signatureBuffer];
    [v7 minimumSignatureDuration];
    uint64_t v8 = v17 < v18;
LABEL_16:

    goto LABEL_17;
  }
LABEL_11:
  uint64_t v8 = 1;
LABEL_17:

LABEL_18:
  [v32 recordingSignatureOffset];
  if (v20 >= 0.0) {
    double v21 = v20;
  }
  else {
    double v21 = 0.0;
  }
  id v22 = [(SHStreamingSessionDriver *)self signatureBuffer];
  [v22 minimumSignatureDuration];
  double v24 = v23;

  [v32 retrySeconds];
  if (v24 >= v25) {
    double v26 = v24;
  }
  else {
    double v26 = v25;
  }
  v27 = [(SHStreamingSessionDriver *)self signatureBuffer];
  [v27 maximumSignatureDuration];
  double v29 = v28;

  if (v26 < v29) {
    double v29 = v26;
  }
  double v30 = [v32 signature];
  [v32 recordingIntermission];
  [(SHStreamingSessionDriver *)self receivedSignature:v30 retry:v8 offset:v29 intermission:v21 dropCurrentSignature:v31];
}

- (id)signatureForMatching
{
  v3 = [(SHStreamingSessionDriver *)self signatureBuffer];
  BOOL v4 = [v3 generateCurrentSignature];

  uint64_t v5 = [SHSignatureMetrics alloc];
  double v6 = [(SHStreamingSessionDriver *)self metrics];
  double v7 = [v6 sessionStartDate];
  uint64_t v8 = [(SHStreamingSessionDriver *)self signatureBuffer];
  [v8 signatureOffset];
  double v9 = -[SHSignatureMetrics initWithSessionStartDate:signatureRecordingOffset:](v5, "initWithSessionStartDate:signatureRecordingOffset:", v7);
  [v4 setMetrics:v9];

  return v4;
}

- (SHSignatureMetrics)metrics
{
  metrics = self->_metrics;
  if (!metrics)
  {
    BOOL v4 = [SHSignatureMetrics alloc];
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    double v6 = [(SHSignatureMetrics *)v4 initWithSessionStartDate:v5 signatureRecordingOffset:0.0];
    double v7 = self->_metrics;
    self->_metrics = v6;

    metrics = self->_metrics;
  }

  return metrics;
}

- (SHSessionDriverDelegate)sessionDriverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDriverDelegate);

  return (SHSessionDriverDelegate *)WeakRetained;
}

- (void)setSessionDriverDelegate:(id)a3
{
}

- (NSDate)intermissionDeadline
{
  return self->_intermissionDeadline;
}

- (void)setIntermissionDeadline:(id)a3
{
}

- (double)currentRequiredDuration
{
  return self->_currentRequiredDuration;
}

- (void)setCurrentRequiredDuration:(double)a3
{
  self->_currentRequiredDuration = a3;
}

- (SHSignatureBuffer)signatureBuffer
{
  return self->_signatureBuffer;
}

- (void)setSignatureBuffer:(id)a3
{
}

- (NSUUID)matchingSignatureID
{
  return self->_matchingSignatureID;
}

- (void)setMatchingSignatureID:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingSignatureID, 0);
  objc_storeStrong((id *)&self->_signatureBuffer, 0);
  objc_storeStrong((id *)&self->_intermissionDeadline, 0);
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_destroyWeak((id *)&self->_sessionDriverDelegate);
}

@end
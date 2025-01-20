@interface SHSession
- (BOOL)_isSessionDriverSignature:(id)a3;
- (BOOL)shouldGenerateSpectralOutput;
- (BOOL)validateSignature:(id)a3 error:(id *)a4;
- (SHCatalog)catalog;
- (SHMatcher)matcher;
- (SHSession)init;
- (SHSession)initWithCatalog:(SHCatalog *)catalog;
- (SHSession)initWithCatalog:(id)a3 matcher:(id)a4 sessionDriver:(id)a5;
- (SHSessionDriver)sessionDriver;
- (id)delegate;
- (void)dealloc;
- (void)didCalculateSpectralData:(id)a3;
- (void)handleCommonActionsForResponse:(id)a3;
- (void)matchSignature:(SHSignature *)signature;
- (void)matchStreamingBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)time;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)sessionDriverEncounteredUnrecoverableError:(id)a3 forSignature:(id)a4;
- (void)setDelegate:(id)delegate;
@end

@implementation SHSession

- (void)dealloc
{
  [(SHMatcher *)self->_matcher stopRecognition];
  v3.receiver = self;
  v3.super_class = (Class)SHSession;
  [(SHSession *)&v3 dealloc];
}

- (SHSession)init
{
  objc_super v3 = objc_alloc_init(SHShazamCatalog);
  v4 = [(SHSession *)self initWithCatalog:v3];

  return v4;
}

- (SHSession)initWithCatalog:(SHCatalog *)catalog
{
  v4 = catalog;
  uint64_t v5 = [(SHCatalog *)v4 _createMatcher];
  if (!v5)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Could not find a valid matcher" userInfo:0];
    objc_exception_throw(v9);
  }
  v6 = (void *)v5;
  v7 = [(SHSession *)self initWithCatalog:v4 matcher:v5 sessionDriver:0];

  return v7;
}

- (SHSession)initWithCatalog:(id)a3 matcher:(id)a4 sessionDriver:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHSession;
  v12 = [(SHSession *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_catalog, a3);
    objc_storeStrong((id *)&v13->_matcher, a4);
    [(SHMatcher *)v13->_matcher setDelegate:v13];
    objc_storeStrong((id *)&v13->_sessionDriver, a5);
    [(SHSessionDriver *)v13->_sessionDriver setSessionDriverDelegate:v13];
  }

  return v13;
}

- (BOOL)validateSignature:(id)a3 error:(id *)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  [v6 duration];
  double v8 = v7;
  id v9 = [(SHSession *)self catalog];
  [v9 maximumQuerySignatureDuration];
  if (v8 > v10)
  {

    goto LABEL_5;
  }
  [v6 duration];
  double v12 = v11;
  v13 = [(SHSession *)self catalog];
  [v13 minimumQuerySignatureDuration];
  double v15 = v14;

  if (v12 < v15)
  {
LABEL_5:
    v17 = NSString;
    v18 = [(SHSession *)self catalog];
    [v18 minimumQuerySignatureDuration];
    uint64_t v20 = v19;
    v21 = [(SHSession *)self catalog];
    [v21 maximumQuerySignatureDuration];
    uint64_t v23 = v22;
    [v6 duration];
    v25 = [v17 stringWithFormat:@"The current Catalog accepts signatures in the range %f-%f, the current signature duration is %f", v20, v23, v24];

    uint64_t v28 = *MEMORY[0x263F08348];
    v29[0] = v25;
    v26 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    +[SHError annotateClientError:a4 code:201 underlyingError:0 keyOverrides:v26];

    BOOL v16 = 0;
    goto LABEL_6;
  }
  BOOL v16 = 1;
LABEL_6:

  return v16;
}

- (void)matchSignature:(SHSignature *)signature
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v4 = signature;
  uint64_t v5 = [(SHSession *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_8:
    id v33 = 0;
    BOOL v18 = [(SHSession *)self validateSignature:v4 error:&v33];
    id v15 = v33;
    if (v18)
    {
      uint64_t v19 = (SHSignature *)[(SHSignature *)v4 copy];

      uint64_t v20 = sh_log_object();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        [(SHSignature *)v19 duration];
        *(_DWORD *)buf = 134217984;
        id v35 = v21;
        _os_log_impl(&dword_224B4B000, v20, OS_LOG_TYPE_DEFAULT, "Matching signature with duration %f", buf, 0xCu);
      }

      uint64_t v22 = [(SHSession *)self catalog];
      uint64_t v23 = [v22 _configuration];
      uint64_t v24 = [v23 installationID];
      BOOL v16 = +[SHMatcherRequest requestToMatchSignature:v19 installationID:v24 sendNotifications:0];

      v25 = [(SHSession *)self matcher];
      [v25 startRecognitionForRequest:v16];

      v4 = v19;
    }
    else
    {
      v26 = sh_log_object();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v15;
        _os_log_impl(&dword_224B4B000, v26, OS_LOG_TYPE_DEBUG, "Failed validation for signature with error %@", buf, 0xCu);
      }

      BOOL v16 = +[SHMatcherResponse errorResponseForSignature:v4 error:v15];
      if ([(SHSession *)self _isSessionDriverSignature:v4])
      {
        v27 = [(SHSession *)self sessionDriver];
        uint64_t v28 = [(SHSession *)self matcher];
        [v27 matcher:v28 didProduceResponse:v16];
      }
      v29 = [(SHSession *)self delegate];
      char v30 = objc_opt_respondsToSelector();

      if (v30)
      {
        v31 = [(SHSession *)self delegate];
        v32 = +[SHError remapErrorToClientError:v15];
        [v31 session:self didNotFindMatchForSignature:v4 error:v32];
      }
      [(SHSession *)self handleCommonActionsForResponse:v16];
    }
    goto LABEL_19;
  }
  id v6 = [(SHSession *)self delegate];
  char v7 = [v6 session:self shouldAttemptToMatchSignature:v4];

  if (v7) {
    goto LABEL_8;
  }
  if ([(SHSession *)self _isSessionDriverSignature:v4])
  {
    [(SHSignature *)v4 duration];
    double v9 = v8;
    double v10 = [(SHSession *)self catalog];
    [v10 maximumQuerySignatureDuration];
    double v11 = 0.0;
    if (v9 < v12)
    {
      v13 = [(SHSession *)self catalog];
      [v13 maximumQuerySignatureDuration];
      double v11 = v14;
    }
    id v15 = +[SHMatcherResponse noMatchWithRecordingIntermission:v4 recordingSignatureOffset:0.0 retrySeconds:0.0 signature:v11];
    BOOL v16 = [(SHSession *)self sessionDriver];
    v17 = [(SHSession *)self matcher];
    [v16 matcher:v17 didProduceResponse:v15];

LABEL_19:
  }
}

- (void)matchStreamingBuffer:(AVAudioPCMBuffer *)buffer atTime:(AVAudioTime *)time
{
  id v6 = time;
  char v7 = buffer;
  id v8 = [(SHSession *)self sessionDriver];
  [v8 flow:v7 time:v6];
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 signature];
  BOOL v9 = [(SHSession *)self _isSessionDriverSignature:v8];

  if (!v9
    || ([(SHSession *)self sessionDriver],
        double v10 = objc_claimAutoreleasedReturnValue(),
        [v10 matcher:v6 didProduceResponse:v7],
        v10,
        [v7 result] != 2)
    || ([v7 retrySeconds], v11 <= 0.0))
  {
    uint64_t v12 = [v7 result];
    switch(v12)
    {
      case 1:
        v17 = [v7 match];
        v21 = sh_log_object();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v17 mediaItems];
          uint64_t v23 = [v22 firstObject];
          uint64_t v24 = [v23 valueForProperty:@"sh_title"];
          int v29 = 138412290;
          char v30 = v24;
          _os_log_impl(&dword_224B4B000, v21, OS_LOG_TYPE_DEFAULT, "SHSession: Match found %@", (uint8_t *)&v29, 0xCu);
        }
        v25 = [(SHSession *)self delegate];
        char v26 = objc_opt_respondsToSelector();

        if ((v26 & 1) == 0) {
          goto LABEL_17;
        }
        BOOL v18 = [(SHSession *)self delegate];
        [v18 session:self didFindMatch:v17];
        break;
      case 2:
        v27 = [(SHSession *)self delegate];
        char v28 = objc_opt_respondsToSelector();

        if ((v28 & 1) == 0)
        {
LABEL_18:
          [(SHSession *)self handleCommonActionsForResponse:v7];
          goto LABEL_19;
        }
        v17 = [(SHSession *)self delegate];
        BOOL v18 = [v7 signature];
        [v17 session:self didNotFindMatchForSignature:v18 error:0];
        break;
      case 3:
        v13 = [v7 error];
        char v14 = objc_msgSend(v13, "sh_isMatchAttemptCancelledError");

        if (v14) {
          goto LABEL_18;
        }
        id v15 = [(SHSession *)self delegate];
        char v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) == 0) {
          goto LABEL_18;
        }
        v17 = [(SHSession *)self delegate];
        BOOL v18 = [v7 signature];
        uint64_t v19 = [v7 error];
        uint64_t v20 = +[SHError remapErrorToClientError:v19];
        [v17 session:self didNotFindMatchForSignature:v18 error:v20];

        break;
      default:
        goto LABEL_18;
    }

LABEL_17:
    goto LABEL_18;
  }
LABEL_19:
}

- (void)handleCommonActionsForResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SHSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SHSession *)self delegate];
    [v7 session:self didProduceResponse:v4];
  }
  if (([v4 isStillRunningAssociatedRequest] & 1) == 0)
  {
    id v8 = [(SHSession *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      double v10 = sh_log_object();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_224B4B000, v10, OS_LOG_TYPE_DEBUG, "Returned all responses for request", v19, 2u);
      }

      double v11 = [(SHSession *)self delegate];
      [v11 finishedSession:self];
    }
  }
  uint64_t v12 = [v4 error];
  char v13 = objc_msgSend(v12, "sh_isMatchAttemptCancelledError");

  if ((v13 & 1) == 0)
  {
    char v14 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
    id v15 = [v4 error];
    [v14 setValue:v15 forKey:@"error"];

    char v16 = [v4 match];
    [v14 setValue:v16 forKey:@"match"];

    v17 = [v4 signature];
    [v14 setValue:v17 forKey:@"signature"];

    BOOL v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 postNotificationName:@"SHNotificationNameSessionResult" object:self userInfo:v14];
  }
}

- (void)sessionDriverEncounteredUnrecoverableError:(id)a3 forSignature:(id)a4
{
  id v6 = +[SHMatcherResponse errorResponseForSignature:a4 error:a3];
  uint64_t v5 = [(SHSession *)self matcher];
  [(SHSession *)self matcher:v5 didProduceResponse:v6];
}

- (BOOL)shouldGenerateSpectralOutput
{
  objc_super v3 = [(SHSession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(SHSession *)self delegate];
  char v6 = [v5 shouldGenerateSpectralOutput];

  return v6;
}

- (BOOL)_isSessionDriverSignature:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_sessionDriver)
  {
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  char v6 = [v4 _ID];
  id v7 = [(SHSession *)self sessionDriver];
  id v8 = [v7 matchingSignatureID];
  char v9 = [v6 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    if (self->_sessionDriver)
    {
      double v11 = [(SHSession *)self sessionDriver];
      uint64_t v12 = [v11 matchingSignatureID];

      if (v12)
      {
        char v13 = sh_log_object();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          char v14 = [v5 _ID];
          id v15 = [(SHSession *)self sessionDriver];
          char v16 = [v15 matchingSignatureID];
          int v18 = 138412546;
          uint64_t v19 = v14;
          __int16 v20 = 2112;
          v21 = v16;
          _os_log_impl(&dword_224B4B000, v13, OS_LOG_TYPE_DEBUG, "Session received a response for non streaming session signature %@, session is waiting for %@", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

- (SHSessionDriver)sessionDriver
{
  sessionDriver = self->_sessionDriver;
  if (!sessionDriver)
  {
    id v4 = [(SHSession *)self catalog];
    uint64_t v5 = [v4 _createSessionDriver];
    char v6 = self->_sessionDriver;
    self->_sessionDriver = v5;

    [(SHSessionDriver *)self->_sessionDriver setSessionDriverDelegate:self];
    sessionDriver = self->_sessionDriver;
  }

  return sessionDriver;
}

- (void)didCalculateSpectralData:(id)a3
{
  id v7 = a3;
  id v4 = [(SHSession *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(SHSession *)self delegate];
    [v6 didCalculateSpectralData:v7];
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (SHCatalog)catalog
{
  return self->_catalog;
}

- (SHMatcher)matcher
{
  return self->_matcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcher, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_sessionDriver, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
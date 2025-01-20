@interface SHMultipleConcurrentMatcher
- (BOOL)recognitionHasStopped;
- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4;
- (NSArray)matchers;
- (NSRecursiveLock)lock;
- (SHAudioRecordingManager)audioRecordingManager;
- (SHMatcherDelegate)delegate;
- (SHMultipleConcurrentMatcher)initWithMatchers:(id)a3 audioRecordingManager:(id)a4;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRecognitionHasStopped:(BOOL)a3;
- (void)startRecognitionForRequest:(id)a3;
- (void)stopRecognition;
- (void)stopRecognitionForRequestID:(id)a3;
@end

@implementation SHMultipleConcurrentMatcher

- (SHMultipleConcurrentMatcher)initWithMatchers:(id)a3 audioRecordingManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SHMultipleConcurrentMatcher;
  v9 = [(SHMultipleConcurrentMatcher *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_matchers, a3);
    objc_storeStrong((id *)&v10->_audioRecordingManager, a4);
    v11 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v10->_lock;
    v10->_lock = v11;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v17), "setDelegate:", v10, (void)v19);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }
  }
  return v10;
}

- (void)startRecognitionForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(SHMultipleConcurrentMatcher *)self lock];
  [v5 lock];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(SHMultipleConcurrentMatcher *)self matchers];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      if ([(SHMultipleConcurrentMatcher *)self recognitionHasStopped]) {
        break;
      }
      [v11 startRecognitionForRequest:v4];
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v12 = [(SHMultipleConcurrentMatcher *)self lock];
  [v12 unlock];
}

- (void)stopRecognitionForRequestID:(id)a3
{
  id v4 = a3;
  v5 = [(SHMultipleConcurrentMatcher *)self lock];
  [v5 lock];

  [(SHMultipleConcurrentMatcher *)self setRecognitionHasStopped:1];
  v6 = sh_log_object();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(SHMultipleConcurrentMatcher *)self matchers];
    *(_DWORD *)buf = 138412290;
    long long v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SHMultipleConcurrentMatcher Calling stop on child matchers %@", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(SHMultipleConcurrentMatcher *)self matchers];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) stopRecognitionForRequestID:v4];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  long long v13 = [(SHMultipleConcurrentMatcher *)self lock];
  [v13 unlock];
}

- (void)stopRecognition
{
  v3 = [(SHMultipleConcurrentMatcher *)self lock];
  [v3 lock];

  [(SHMultipleConcurrentMatcher *)self setRecognitionHasStopped:1];
  id v4 = sh_log_object();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = [(SHMultipleConcurrentMatcher *)self matchers];
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "SHMultipleConcurrentMatcher Calling stop on child matchers %@", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = [(SHMultipleConcurrentMatcher *)self matchers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) stopRecognition];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(SHMultipleConcurrentMatcher *)self lock];
  [v11 unlock];
}

- (BOOL)session:(id)a3 shouldAttemptToMatchSignature:(id)a4
{
  id v5 = a4;
  v6 = [v5 metrics];
  id v7 = [v6 recordingSource];
  id v8 = [(SHMultipleConcurrentMatcher *)self audioRecordingManager];
  id v9 = [v8 suggestedAudioRecordingSource];

  id v10 = sh_log_object();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [(SHMultipleConcurrentMatcher *)self audioRecordingManager];
    id v12 = [v11 suggestedAudioRecordingSource];
    long long v13 = [v5 metrics];
    int v15 = 134218496;
    id v16 = v12;
    __int16 v17 = 2048;
    id v18 = [v13 recordingSource];
    __int16 v19 = 1024;
    BOOL v20 = v7 == v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Suggested audio recording source %li signature source %li shouldAttempt %i", (uint8_t *)&v15, 0x1Cu);
  }
  return v7 == v9;
}

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(SHMultipleConcurrentMatcher *)self matchers];
  if ((unint64_t)[v7 count] <= 1)
  {

    goto LABEL_5;
  }
  id v8 = [v6 signature];
  id v9 = [v8 metrics];
  id v10 = [v9 recordingSource];
  uint64_t v11 = [(SHMultipleConcurrentMatcher *)self audioRecordingManager];
  id v12 = [v11 suggestedAudioRecordingSource];

  if (v10 == v12)
  {
LABEL_5:
    long long v13 = [(SHMultipleConcurrentMatcher *)self delegate];
    [v13 matcher:v14 didProduceResponse:v6];
  }
}

- (SHMatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SHMatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)matchers
{
  return self->_matchers;
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (BOOL)recognitionHasStopped
{
  return self->_recognitionHasStopped;
}

- (void)setRecognitionHasStopped:(BOOL)a3
{
  self->_recognitionHasStopped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_audioRecordingManager, 0);
  objc_storeStrong((id *)&self->_matchers, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end
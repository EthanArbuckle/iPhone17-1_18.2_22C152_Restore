@interface SHAudioRecordingManager
- (BOOL)hasActiveTaps;
- (BOOL)hasActiveTapsForRecordingSource:(int64_t)a3;
- (BOOL)isAudioSourceSupported:(int64_t)a3;
- (BOOL)shouldStartRecorder:(id)a3;
- (NSArray)recorders;
- (NSMutableSet)activeTaps;
- (NSMutableSet)silentRecorders;
- (NSRecursiveLock)lock;
- (OS_dispatch_group)startRecognitionGroup;
- (SHAudioEnvironment)audioEnvironment;
- (SHAudioRecordingManager)initWithRecorders:(id)a3;
- (SHAudioRecordingManagerDelegate)delegate;
- (id)recorderForSource:(int64_t)a3;
- (int64_t)previouslySuggestedAudioRecordingSource;
- (int64_t)suggestedAudioRecordingSource;
- (void)attachTap:(id)a3;
- (void)dealloc;
- (void)detachTap:(id)a3;
- (void)recorder:(id)a3 failedToStartWithError:(id)a4;
- (void)recorder:(id)a3 producedAudioBuffer:(id)a4 atTime:(id)a5;
- (void)setAudioEnvironment:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLock:(id)a3;
- (void)setPreviouslySuggestedAudioRecordingSource:(int64_t)a3;
- (void)startRecording;
- (void)stopRecordingForReason:(int64_t)a3;
@end

@implementation SHAudioRecordingManager

- (void)dealloc
{
  v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Deallocating recording service", buf, 2u);
  }

  [(SHAudioRecordingManager *)self stopRecordingForReason:2];
  v4.receiver = self;
  v4.super_class = (Class)SHAudioRecordingManager;
  [(SHAudioRecordingManager *)&v4 dealloc];
}

- (SHAudioRecordingManager)initWithRecorders:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SHAudioRecordingManager;
  v6 = [(SHAudioRecordingManager *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recorders, a3);
    uint64_t v8 = +[NSMutableSet set];
    activeTaps = v7->_activeTaps;
    v7->_activeTaps = (NSMutableSet *)v8;

    uint64_t v10 = +[NSMutableSet set];
    silentRecorders = v7->_silentRecorders;
    v7->_silentRecorders = (NSMutableSet *)v10;

    v12 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v7->_lock;
    v7->_lock = v12;

    v14 = objc_alloc_init(SHAudioEnvironment);
    audioEnvironment = v7->_audioEnvironment;
    v7->_audioEnvironment = v14;

    dispatch_group_t v16 = dispatch_group_create();
    startRecognitionGroup = v7->_startRecognitionGroup;
    v7->_startRecognitionGroup = (OS_dispatch_group *)v16;
  }
  return v7;
}

- (BOOL)shouldStartRecorder:(id)a3
{
  id v4 = a3;
  if ([v4 isRunning]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = -[SHAudioRecordingManager hasActiveTapsForRecordingSource:](self, "hasActiveTapsForRecordingSource:", [v4 recordingSource]);
  }

  return v5;
}

- (void)startRecording
{
  v3 = sh_log_object();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting recording", (uint8_t *)buf, 2u);
  }

  id v4 = [(SHAudioRecordingManager *)self startRecognitionGroup];
  dispatch_group_enter(v4);

  BOOL v5 = [(SHAudioRecordingManager *)self delegate];
  [v5 audioRecordingManagerWillStartRecording:self];

  v6 = [(SHAudioRecordingManager *)self recorders];
  v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);

  objc_initWeak(buf, self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [(SHAudioRecordingManager *)self recorders];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([(SHAudioRecordingManager *)self shouldStartRecorder:v12])
        {
          [v12 setDelegate:self];
          v13 = [(SHAudioRecordingManager *)self startRecognitionGroup];
          dispatch_group_enter(v13);

          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_1000366BC;
          v17[3] = &unk_100075BF0;
          objc_copyWeak(&v19, buf);
          v17[4] = v12;
          id v18 = v7;
          [v12 startRecordingWithCompletion:v17];

          objc_destroyWeak(&v19);
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }

  v14 = [(SHAudioRecordingManager *)self startRecognitionGroup];
  dispatch_group_leave(v14);

  v15 = [(SHAudioRecordingManager *)self startRecognitionGroup];
  dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

  if ([v7 count])
  {
    dispatch_group_t v16 = [(SHAudioRecordingManager *)self delegate];
    [v16 audioRecordingManager:self failedToStartRecorders:v7];
  }
  objc_destroyWeak(buf);
}

- (void)stopRecordingForReason:(int64_t)a3
{
  BOOL v5 = sh_log_object();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v51 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping recording for reason %lu", buf, 0xCu);
  }
  int64_t v38 = a3;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v37 = self;
  v6 = [(SHAudioRecordingManager *)self recorders];
  id v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        [v11 setDelegate:0];
        v12 = sh_log_object();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int64_t v51 = (int64_t)v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Stopping recorder: %@", buf, 0xCu);
        }

        id v43 = 0;
        unsigned __int8 v13 = [v11 stopRecordingWithError:&v43];
        id v14 = v43;
        if ((v13 & 1) == 0)
        {
          v15 = sh_log_object();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            int64_t v51 = (int64_t)v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to stop recorder with error: %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v8);
  }

  int64_t v16 = v38;
  if (v38 == 5 || v38 == 3)
  {
    if (v38 == 3) {
      uint64_t v17 = 104;
    }
    else {
      uint64_t v17 = 105;
    }
    id v18 = [(SHAudioRecordingManager *)v37 lock];
    [v18 lock];

    id v19 = [(SHAudioRecordingManager *)v37 activeTaps];
    id v20 = [v19 copy];

    long long v21 = [(SHAudioRecordingManager *)v37 lock];
    [v21 unlock];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v22 = v20;
    id v23 = [v22 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v40;
      uint64_t v26 = SHCoreErrorDomain;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v40 != v25) {
            objc_enumerationMutation(v22);
          }
          v28 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
          v29 = [v28 completion];

          if (v29)
          {
            v30 = [v28 completion];
            v31 = +[NSError errorWithDomain:v26 code:v17 userInfo:0];
            ((void (**)(void, void, void, void *))v30)[2](v30, 0, 0, v31);
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v24);
    }

    int64_t v16 = v38;
  }
  if ((v16 & 0xFFFFFFFFFFFFFFFDLL) != 4)
  {
    v32 = [(SHAudioRecordingManager *)v37 lock];
    [v32 lock];

    v33 = [(SHAudioRecordingManager *)v37 activeTaps];
    [v33 removeAllObjects];

    v34 = [(SHAudioRecordingManager *)v37 lock];
    [v34 unlock];
  }
  v35 = [(SHAudioRecordingManager *)v37 delegate];
  [v35 audioRecordingManagerDidStopRecording:v37];

  v36 = sh_log_object();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v51 = v16;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Stopped recording for reason %lu", buf, 0xCu);
  }
}

- (void)attachTap:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHAudioRecordingManager *)self activeTaps];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = sh_log_object();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not attaching tap: %@ it is already attached", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v8 = [(SHAudioRecordingManager *)self delegate];
    [v8 audioRecordingManager:self willAttachTap:v4];

    uint64_t v9 = [(SHAudioRecordingManager *)self lock];
    [v9 lock];

    uint64_t v10 = [(SHAudioRecordingManager *)self activeTaps];
    [v10 addObject:v4];

    v11 = [(SHAudioRecordingManager *)self lock];
    [v11 unlock];

    [(SHAudioRecordingManager *)self startRecording];
  }
}

- (void)detachTap:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SHAudioRecordingManager *)self hasActiveTaps];
  unsigned int v6 = [(SHAudioRecordingManager *)self lock];
  [v6 lock];

  id v7 = [(SHAudioRecordingManager *)self activeTaps];
  [v7 removeObject:v4];

  id v8 = [(SHAudioRecordingManager *)self lock];
  [v8 unlock];

  uint64_t v9 = [(SHAudioRecordingManager *)self delegate];
  [v9 audioRecordingManager:self didDetachTap:v4];

  uint64_t v10 = sh_log_object();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(SHAudioRecordingManager *)self activeTaps];
    int v12 = 138412546;
    id v13 = v4;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Detached tap: %@ taps remaining: %@", (uint8_t *)&v12, 0x16u);
  }
  if (v5 && ![(SHAudioRecordingManager *)self hasActiveTaps]) {
    [(SHAudioRecordingManager *)self stopRecordingForReason:1];
  }
}

- (BOOL)hasActiveTaps
{
  v3 = [(SHAudioRecordingManager *)self lock];
  [v3 lock];

  id v4 = [(SHAudioRecordingManager *)self activeTaps];
  id v5 = [v4 count];

  unsigned int v6 = [(SHAudioRecordingManager *)self lock];
  [v6 unlock];

  return v5 != 0;
}

- (BOOL)hasActiveTapsForRecordingSource:(int64_t)a3
{
  id v5 = [(SHAudioRecordingManager *)self lock];
  [v5 lock];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v6 = [(SHAudioRecordingManager *)self activeTaps];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * i) recordingSource] == (id)a3)
        {
          int v12 = [(SHAudioRecordingManager *)self lock];
          [v12 unlock];

          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  unsigned int v6 = [(SHAudioRecordingManager *)self lock];
  [v6 unlock];
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (int64_t)suggestedAudioRecordingSource
{
  v3 = [(SHAudioRecordingManager *)self recorders];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    id v5 = [(SHAudioRecordingManager *)self recorders];
    unsigned int v6 = [v5 firstObject];
    id v7 = [v6 recordingSource];

    return (int64_t)v7;
  }
  unsigned int v9 = [(SHAudioRecordingManager *)self isAudioSourceSupported:1];
  uint64_t v10 = [(SHAudioRecordingManager *)self audioEnvironment];
  unsigned int v11 = [v10 isUsingAlternativeOutputToBuiltInSpeaker];

  int v12 = [(SHAudioRecordingManager *)self audioEnvironment];
  unsigned int v13 = [v12 isOtherAudioPlaying];

  long long v14 = [(SHAudioRecordingManager *)self lock];
  [v14 lock];

  long long v15 = [(SHAudioRecordingManager *)self silentRecorders];
  long long v16 = [(SHAudioRecordingManager *)self recorderForSource:1];
  unsigned int v17 = [v15 containsObject:v16];

  id v18 = [(SHAudioRecordingManager *)self lock];
  [v18 unlock];

  if (v17) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 1;
  }
  if ((v9 & v11 & v13) != 0) {
    int64_t v20 = v19;
  }
  else {
    int64_t v20 = 2;
  }
  if ([(SHAudioRecordingManager *)self previouslySuggestedAudioRecordingSource] != v20)
  {
    if (v20 == 2)
    {
      long long v21 = sh_log_object();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24[0]) = 0;
        id v22 = "Marking the external audio source as preferred";
        goto LABEL_15;
      }
    }
    else
    {
      long long v21 = sh_log_object();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24[0]) = 0;
        id v22 = "Marking the internal audio source as preferred";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)v24, 2u);
      }
    }

    id v23 = sh_log_object();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24[0] = 67109888;
      v24[1] = v9;
      __int16 v25 = 1024;
      unsigned int v26 = v11;
      __int16 v27 = 1024;
      unsigned int v28 = v13;
      __int16 v29 = 1024;
      int v30 = v17 ^ 1;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Internal audio source support: %d is using alternative output to built-in speaker: %d other audio playing %d, internal recorder is producing audio %d", (uint8_t *)v24, 0x1Au);
    }

    [(SHAudioRecordingManager *)self setPreviouslySuggestedAudioRecordingSource:v20];
  }
  return v20;
}

- (BOOL)isAudioSourceSupported:(int64_t)a3
{
  v3 = [(SHAudioRecordingManager *)self recorderForSource:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)recorderForSource:(int64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(SHAudioRecordingManager *)self recorders];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 recordingSource] == (id)a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)recorder:(id)a3 producedAudioBuffer:(id)a4 atTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SHAudioRecordingManager *)self delegate];
  if (!v11
    || (long long v12 = (void *)v11,
        [(SHAudioRecordingManager *)self delegate],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 recorder:v8 shouldProcessAudioBuffer:v9 atTime:v10],
        v13,
        v12,
        v14))
  {
    id v15 = v9;
    [v15 audioBufferList];
    long long v16 = [v15 format];
    [v16 streamDescription];
    [v15 audioBufferList];

    cblas_sasum_NEWLAPACK();
    float v18 = v17;

    uint64_t v19 = [(SHAudioRecordingManager *)self lock];
    [v19 lock];

    int64_t v20 = [(SHAudioRecordingManager *)self silentRecorders];
    long long v21 = v20;
    if (v18 <= 1.1755e-38)
    {
      [v20 addObject:v8];

      v34 = [(SHAudioRecordingManager *)self lock];
      [v34 unlock];
    }
    else
    {
      [v20 removeObject:v8];

      id v22 = [(SHAudioRecordingManager *)self activeTaps];
      id v23 = [v22 copy];

      id v24 = [(SHAudioRecordingManager *)self lock];
      [v24 unlock];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v25 = v23;
      id v26 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v36;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v36 != v28) {
              objc_enumerationMutation(v25);
            }
            int v30 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v31 = objc_msgSend(v30, "recordingSource", (void)v35);
            if (v31 == [v8 recordingSource])
            {
              v32 = [v30 completion];

              if (v32)
              {
                v33 = [v30 completion];
                ((void (**)(void, id, id, void))v33)[2](v33, v15, v10, 0);
              }
            }
          }
          id v27 = [v25 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v27);
      }
    }
  }
}

- (void)recorder:(id)a3 failedToStartWithError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHAudioRecordingManager *)self delegate];
  [v8 recorder:v7 failedToStartWithError:v6];
}

- (SHAudioRecordingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SHAudioRecordingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)recorders
{
  return self->_recorders;
}

- (NSMutableSet)activeTaps
{
  return self->_activeTaps;
}

- (NSMutableSet)silentRecorders
{
  return self->_silentRecorders;
}

- (OS_dispatch_group)startRecognitionGroup
{
  return self->_startRecognitionGroup;
}

- (SHAudioEnvironment)audioEnvironment
{
  return self->_audioEnvironment;
}

- (void)setAudioEnvironment:(id)a3
{
}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (int64_t)previouslySuggestedAudioRecordingSource
{
  return self->_previouslySuggestedAudioRecordingSource;
}

- (void)setPreviouslySuggestedAudioRecordingSource:(int64_t)a3
{
  self->_previouslySuggestedAudioRecordingSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_audioEnvironment, 0);
  objc_storeStrong((id *)&self->_startRecognitionGroup, 0);
  objc_storeStrong((id *)&self->_silentRecorders, 0);
  objc_storeStrong((id *)&self->_activeTaps, 0);
  objc_storeStrong((id *)&self->_recorders, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface SoundDetectionKshotTrainingAudioManager
- (AXSDKShotDetector)targetDetector;
- (SoundDetectionKshotTrainingAudioManager)initWithTargetDetector:(id)a3;
- (SoundDetectionKshotTrainingAudioManagerDelegate)delegate;
- (id)_audioUIClient;
- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6;
- (int64_t)_stateForTargetDetector;
- (int64_t)state;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTargetDetector:(id)a3;
- (void)startListening;
- (void)stopListeningAndTrainIfPossible:(BOOL)a3;
- (void)updateState;
@end

@implementation SoundDetectionKshotTrainingAudioManager

- (SoundDetectionKshotTrainingAudioManager)initWithTargetDetector:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SoundDetectionKshotTrainingAudioManager;
  v5 = [(SoundDetectionKshotTrainingAudioManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SoundDetectionKshotTrainingAudioManager *)v5 setTargetDetector:v4];
    [(SoundDetectionKshotTrainingAudioManager *)v6 setState:6];
  }

  return v6;
}

- (void)dealloc
{
  [(AXUIClient *)self->_audioUIClient setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SoundDetectionKshotTrainingAudioManager;
  [(SoundDetectionKshotTrainingAudioManager *)&v3 dealloc];
}

- (void)setState:(int64_t)a3
{
  v5 = AXLogUltronKShot();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int64_t state = self->_state;
    int v8 = 134218240;
    int64_t v9 = state;
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Updating State from: %ld to: %ld", (uint8_t *)&v8, 0x16u);
  }

  self->_int64_t state = a3;
  v7 = [(SoundDetectionKshotTrainingAudioManager *)self delegate];
  [v7 stateDidUpdate:a3];
}

- (void)startListening
{
  objc_super v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Start listening for Kshot Training", buf, 2u);
  }

  [(SoundDetectionKshotTrainingAudioManager *)self setState:[(SoundDetectionKshotTrainingAudioManager *)self _stateForTargetDetector]];
  id v4 = +[AXSDKShotController sharedInstance];
  v5 = [(SoundDetectionKshotTrainingAudioManager *)self targetDetector];
  [v4 startListeningToTrainDetector:v5];

  v6 = +[AXSDKShotController sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __57__SoundDetectionKshotTrainingAudioManager_startListening__block_invoke;
  v7[3] = &unk_209140;
  v7[4] = self;
  [v6 registerListener:self forRecordingUpdates:v7];
}

id __57__SoundDetectionKshotTrainingAudioManager_startListening__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _stateForTargetDetector];
  objc_super v3 = *(void **)(a1 + 32);

  return [v3 setState:v2];
}

- (void)stopListeningAndTrainIfPossible:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = AXLogUltronKShot();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Stop listening for Kshot Training", v17, 2u);
  }

  [(SoundDetectionKshotTrainingAudioManager *)self setState:6];
  v6 = +[AXSDKShotController sharedInstance];
  [v6 stopListening];

  v7 = +[AXSDKShotController sharedInstance];
  [v7 deregisterListener:self];

  if (v3)
  {
    int v8 = [(SoundDetectionKshotTrainingAudioManager *)self targetDetector];
    int64_t v9 = [v8 recordings];
    if ((unint64_t)[v9 count] <= 4)
    {
    }
    else
    {
      __int16 v10 = [(SoundDetectionKshotTrainingAudioManager *)self targetDetector];
      int64_t v11 = [v10 identifier];

      if (v11)
      {
        v12 = [(SoundDetectionKshotTrainingAudioManager *)self _audioUIClient];
        uint64_t v18 = SoundDetectionModelCreationIdentifierKey;
        v13 = [(SoundDetectionKshotTrainingAudioManager *)self targetDetector];
        v14 = [v13 identifier];
        v19 = v14;
        v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        v16 = +[AXAccessQueue mainAccessQueue];
        [v12 sendAsynchronousMessage:v15 withIdentifier:10003 targetAccessQueue:v16 completion:0];

LABEL_10:
        return;
      }
    }
    v12 = AXLogUltronKShot();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SoundDetectionKshotTrainingAudioManager stopListeningAndTrainIfPossible:](self, v12);
    }
    goto LABEL_10;
  }
}

- (int64_t)_stateForTargetDetector
{
  id v2 = [(SoundDetectionKshotTrainingAudioManager *)self targetDetector];
  BOOL v3 = [v2 recordings];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 5) {
    return 5;
  }
  else {
    return (int64_t)v4;
  }
}

- (void)updateState
{
  int64_t v3 = [(SoundDetectionKshotTrainingAudioManager *)self _stateForTargetDetector];

  [(SoundDetectionKshotTrainingAudioManager *)self setState:v3];
}

- (id)_audioUIClient
{
  audioUIClient = self->_audioUIClient;
  if (!audioUIClient)
  {
    id v4 = (AXUIClient *)[objc_alloc((Class)AXUIClient) initWithIdentifier:@"SDSDAudioUIClient" serviceBundleName:@"AXUltronPluginService"];
    v5 = self->_audioUIClient;
    self->_audioUIClient = v4;

    [(AXUIClient *)self->_audioUIClient setDelegate:self];
    audioUIClient = self->_audioUIClient;
  }

  return audioUIClient;
}

- (id)userInterfaceClient:(id)a3 processMessageFromServer:(id)a4 withIdentifier:(unint64_t)a5 error:(id *)a6
{
  id v7 = a4;
  int v8 = AXLogUltronKShot();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    unint64_t v11 = a5;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Custom Detector Onboarding - Received IPC Message %lu\nDict:%@", (uint8_t *)&v10, 0x16u);
  }

  return 0;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __101__SoundDetectionKshotTrainingAudioManager_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke;
  block[3] = &unk_2087C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __101__SoundDetectionKshotTrainingAudioManager_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  int64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (int64_t)state
{
  return self->_state;
}

- (AXSDKShotDetector)targetDetector
{
  return self->_targetDetector;
}

- (void)setTargetDetector:(id)a3
{
}

- (SoundDetectionKshotTrainingAudioManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SoundDetectionKshotTrainingAudioManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetDetector, 0);

  objc_storeStrong((id *)&self->_audioUIClient, 0);
}

- (void)stopListeningAndTrainIfPossible:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  id v4 = [a1 targetDetector];
  v5 = [a1 targetDetector];
  v6 = [v5 recordings];
  int v7 = 138412546;
  int v8 = v4;
  __int16 v9 = 2048;
  id v10 = [v6 count];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unable to kick off training of detector: %@ with %lu recordings", (uint8_t *)&v7, 0x16u);
}

@end
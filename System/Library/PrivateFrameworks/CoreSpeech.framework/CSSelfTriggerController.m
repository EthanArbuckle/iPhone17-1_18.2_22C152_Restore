@interface CSSelfTriggerController
- (CSPolicy)enabledPolicyWithAVVCAudioSource;
- (CSPolicy)enabledPolicyWithTapAudioSource;
- (CSSelfTriggerController)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 avvcRefChannelAvailable:(BOOL)a5;
- (CSSelfTriggerDetector)selfTriggerWithAVVCAudioSource;
- (CSSelfTriggerDetector)selfTriggerWithTapAudioSource;
- (NSMutableArray)enabledStates;
- (OS_dispatch_queue)queue;
- (void)_handleEnabledPolicyEventForAudioSourceType:(unint64_t)a3 enabled:(BOOL)a4;
- (void)_handleEnabledStatesUpdate:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setAsset:(id)a3;
- (void)setEnabledPolicyWithAVVCAudioSource:(id)a3;
- (void)setEnabledPolicyWithTapAudioSource:(id)a3;
- (void)setEnabledStates:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSelfTriggerWithAVVCAudioSource:(id)a3;
- (void)setSelfTriggerWithTapAudioSource:(id)a3;
- (void)start;
- (void)unregisterObserver:(id)a3;
@end

@implementation CSSelfTriggerController

- (void)_handleEnabledPolicyEventForAudioSourceType:(unint64_t)a3 enabled:(BOOL)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003CB8;
  block[3] = &unk_100252F08;
  BOOL v6 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_enabledStates, 0);
  objc_storeStrong((id *)&self->_selfTriggerWithTapAudioSource, 0);
  objc_storeStrong((id *)&self->_selfTriggerWithAVVCAudioSource, 0);
  objc_storeStrong((id *)&self->_enabledPolicyWithTapAudioSource, 0);
  objc_storeStrong((id *)&self->_enabledPolicyWithAVVCAudioSource, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setEnabledStates:(id)a3
{
}

- (NSMutableArray)enabledStates
{
  return self->_enabledStates;
}

- (void)setSelfTriggerWithTapAudioSource:(id)a3
{
}

- (CSSelfTriggerDetector)selfTriggerWithTapAudioSource
{
  return self->_selfTriggerWithTapAudioSource;
}

- (void)setSelfTriggerWithAVVCAudioSource:(id)a3
{
}

- (CSSelfTriggerDetector)selfTriggerWithAVVCAudioSource
{
  return self->_selfTriggerWithAVVCAudioSource;
}

- (void)setEnabledPolicyWithTapAudioSource:(id)a3
{
}

- (CSPolicy)enabledPolicyWithTapAudioSource
{
  return self->_enabledPolicyWithTapAudioSource;
}

- (void)setEnabledPolicyWithAVVCAudioSource:(id)a3
{
}

- (CSPolicy)enabledPolicyWithAVVCAudioSource
{
  return self->_enabledPolicyWithAVVCAudioSource;
}

- (void)unregisterObserver:(id)a3
{
  selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
  id v5 = a3;
  [(CSSelfTriggerDetector *)selfTriggerWithAVVCAudioSource unregisterObserver:v5];
  [(CSSelfTriggerDetector *)self->_selfTriggerWithTapAudioSource unregisterObserver:v5];
}

- (void)registerObserver:(id)a3
{
  selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
  id v5 = a3;
  [(CSSelfTriggerDetector *)selfTriggerWithAVVCAudioSource registerObserver:v5];
  [(CSSelfTriggerDetector *)self->_selfTriggerWithTapAudioSource registerObserver:v5];
}

- (void)setAsset:(id)a3
{
  selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
  id v5 = a3;
  [(CSSelfTriggerDetector *)selfTriggerWithAVVCAudioSource setAsset:v5];
  [(CSSelfTriggerDetector *)self->_selfTriggerWithTapAudioSource setAsset:v5];
}

- (void)_handleEnabledStatesUpdate:(id)a3
{
  id v4 = a3;
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    enabledStates = self->_enabledStates;
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSSelfTriggerController _handleEnabledStatesUpdate:]";
    __int16 v27 = 2114;
    v28 = enabledStates;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s enabledStates : %{public}@", buf, 0x16u);
  }
  v7 = [v4 objectAtIndexedSubscript:0];
  unsigned int v8 = [v7 BOOLValue];

  v9 = [v4 objectAtIndexedSubscript:1];
  unsigned int v10 = [v9 BOOLValue];

  if (!v8)
  {
    selfTriggerWithAVVCAudioSource = self->_selfTriggerWithAVVCAudioSource;
    if (!v10)
    {
      [(CSSelfTriggerDetector *)selfTriggerWithAVVCAudioSource stopAnalyzeWithCompletion:0];
      selfTriggerWithTapAudioSource = self->_selfTriggerWithTapAudioSource;
      v12 = 0;
      goto LABEL_12;
    }
    if ((id)[(CSSelfTriggerDetector *)selfTriggerWithAVVCAudioSource currentState] == (id)1
      || (id)[(CSSelfTriggerDetector *)self->_selfTriggerWithAVVCAudioSource currentState] == (id)2)
    {
      selfTriggerWithTapAudioSource = self->_selfTriggerWithAVVCAudioSource;
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      v17 = sub_100057ABC;
      v18 = &unk_1002531E0;
      v19 = self;
      v12 = &v15;
      goto LABEL_12;
    }
    v14 = self->_selfTriggerWithTapAudioSource;
LABEL_16:
    [(CSSelfTriggerDetector *)v14 startAnalyze];
    goto LABEL_13;
  }
  if ((id)[(CSSelfTriggerDetector *)self->_selfTriggerWithTapAudioSource currentState] != (id)1
    && (id)[(CSSelfTriggerDetector *)self->_selfTriggerWithTapAudioSource currentState] != (id)2)
  {
    v14 = self->_selfTriggerWithAVVCAudioSource;
    goto LABEL_16;
  }
  selfTriggerWithTapAudioSource = self->_selfTriggerWithTapAudioSource;
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_100057AB0;
  v23 = &unk_1002531E0;
  v24 = self;
  v12 = &v20;
LABEL_12:
  -[CSSelfTriggerDetector stopAnalyzeWithCompletion:](selfTriggerWithTapAudioSource, "stopAnalyzeWithCompletion:", v12, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_13:
}

- (void)start
{
  [(CSSelfTriggerDetector *)self->_selfTriggerWithAVVCAudioSource start];
  [(CSSelfTriggerDetector *)self->_selfTriggerWithTapAudioSource start];
  objc_initWeak(&location, self);
  if (self->_selfTriggerWithAVVCAudioSource)
  {
    v3 = +[CSSelfTriggerDetectorEnabledPolicyFactory selfTriggerDetectorEnabledPolicyWithAudioSourceType:0];
    enabledPolicyWithAVVCAudioSource = self->_enabledPolicyWithAVVCAudioSource;
    self->_enabledPolicyWithAVVCAudioSource = v3;

    id v5 = self->_enabledPolicyWithAVVCAudioSource;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004AF4;
    v13[3] = &unk_100252EE0;
    objc_copyWeak(&v14, &location);
    [(CSPolicy *)v5 setCallback:v13];
    objc_destroyWeak(&v14);
  }
  if (self->_selfTriggerWithTapAudioSource)
  {
    BOOL v6 = +[CSSelfTriggerDetectorEnabledPolicyFactory selfTriggerDetectorEnabledPolicyWithAudioSourceType:1];
    enabledPolicyWithTapAudioSource = self->_enabledPolicyWithTapAudioSource;
    self->_enabledPolicyWithTapAudioSource = v6;

    unsigned int v8 = self->_enabledPolicyWithTapAudioSource;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100057CB4;
    v11[3] = &unk_100252EE0;
    objc_copyWeak(&v12, &location);
    [(CSPolicy *)v8 setCallback:v11];
    objc_destroyWeak(&v12);
  }
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100057D08;
  v10[3] = &unk_100253AE0;
  v10[4] = self;
  dispatch_async(queue, v10);
  objc_destroyWeak(&location);
}

- (CSSelfTriggerController)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 avvcRefChannelAvailable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CSSelfTriggerController;
  unsigned int v10 = [(CSSelfTriggerController *)&v20 init];
  if (v10)
  {
    uint64_t v11 = +[CSUtils getSerialQueue:@"CSSelfTriggerController Queue" qualityOfService:33];
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = +[NSMutableArray arrayWithCapacity:2];
    enabledStates = v10->_enabledStates;
    v10->_enabledStates = (NSMutableArray *)v13;

    [(NSMutableArray *)v10->_enabledStates addObject:&__kCFBooleanFalse];
    [(NSMutableArray *)v10->_enabledStates addObject:&__kCFBooleanFalse];
    if (v5)
    {
      v15 = [[CSSelfTriggerDetector alloc] initWithTargetQueue:v8 audioTapProvider:0 audioSourceType:0];
      selfTriggerWithAVVCAudioSource = v10->_selfTriggerWithAVVCAudioSource;
      v10->_selfTriggerWithAVVCAudioSource = v15;
    }
    if (v9)
    {
      v17 = [[CSSelfTriggerDetector alloc] initWithTargetQueue:v8 audioTapProvider:v9 audioSourceType:1];
      selfTriggerWithTapAudioSource = v10->_selfTriggerWithTapAudioSource;
      v10->_selfTriggerWithTapAudioSource = v17;
    }
  }

  return v10;
}

@end
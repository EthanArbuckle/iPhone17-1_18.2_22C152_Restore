@interface PHVoicemailGreetingModel
+ (id)greetingTempFileLocation;
+ (void)greetingTempFileLocation;
- (BOOL)greetingExists;
- (BOOL)isCallScreeningEnabled;
- (BOOL)isCustomized;
- (BOOL)isDefault;
- (BOOL)shouldShowPlayButtonForDefaultGreeting;
- (BOOL)shouldShowSaveButton;
- (MPGreetingAccount)account;
- (NSURL)defaultGreetingURL;
- (NSUUID)liveVoicMailAccountUUID;
- (PHAudioRecorder)greetingRecorder;
- (PHVoicemailGreetingModel)init;
- (PHVoicemailGreetingModel)initWithAccount:(id)a3;
- (PHVoicemailGreetingModelDelegate)delegate;
- (VMVoicemailGreeting)existingGreeting;
- (VMVoicemailGreeting)selectedGreeting;
- (VMVoicemailGreeting)tempCustomizedGreeting;
- (VMVoicemailManager)voicemailManager;
- (double)greetingDuration;
- (double)maximumGreetingDuration;
- (double)maximumGreetingDurationForAccount:(id)a3;
- (int64_t)greetingState;
- (void)_handlePlayerDidFinishPlaying:(id)a3;
- (void)_mediaserverReset:(id)a3;
- (void)audioRecorderContinuedWithFile:(id)a3 duration:(double)a4;
- (void)audioRecorderEndedWithFile:(id)a3 duration:(double)a4 error:(id)a5;
- (void)audioRecorderStartedWithFile:(id)a3;
- (void)dealloc;
- (void)didSelectCustomizedGreeting;
- (void)didSelectDefaultGreeting;
- (void)fetchGreeting;
- (void)loadGreeting:(id)a3;
- (void)pauseGreeting;
- (void)playGreeting;
- (void)resetPlayerToBeginning;
- (void)saveGreeting;
- (void)setDelegate:(id)a3;
- (void)setExistingGreeting:(id)a3;
- (void)setGreetingDuration:(double)a3;
- (void)setGreetingRecorder:(id)a3;
- (void)setGreetingState:(int64_t)a3;
- (void)setMaximumGreetingDuration:(double)a3;
- (void)setSelectedGreeting:(id)a3;
- (void)setTempCustomizedGreeting:(id)a3;
- (void)startRecording;
- (void)stopRecording;
@end

@implementation PHVoicemailGreetingModel

- (PHVoicemailGreetingModel)init
{
  return 0;
}

- (PHVoicemailGreetingModel)initWithAccount:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHVoicemailGreetingModel;
  v6 = [(PHVoicemailGreetingModel *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v7->_maximumGreetingDuration = -1.0;
    v7->_greetingState = 0;
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"_handlePlayerControllerRateOrStatusChange:" name:@"kPHVoicemailPlayerControllerStatusChangedNotification" object:0];
    [v8 addObserver:v7 selector:"_handlePlayerDidFinishPlaying:" name:@"kPHVoicemailPlayerControllerDidPlayToEndNotification" object:0];
    [v8 addObserver:v7 selector:"_mediaserverReset:" name:@"PHVoicemailPlayerControllerMediaServicesResetNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  if ([(PHAudioRecorder *)self->_greetingRecorder isRecording]) {
    [(PHAudioRecorder *)self->_greetingRecorder stop];
  }
  v3.receiver = self;
  v3.super_class = (Class)PHVoicemailGreetingModel;
  [(PHVoicemailGreetingModel *)&v3 dealloc];
}

- (double)maximumGreetingDuration
{
  double result = self->_maximumGreetingDuration;
  if (result < 0.0)
  {
    v4 = [(PHVoicemailGreetingModel *)self account];
    [(PHVoicemailGreetingModel *)self maximumGreetingDurationForAccount:v4];
    double v6 = v5;

    double result = fmax(v6, 0.0);
    self->_maximumGreetingDuration = result;
  }
  return result;
}

- (VMVoicemailManager)voicemailManager
{
  v2 = +[PHApplicationServices sharedInstance];
  objc_super v3 = [v2 accountManager];

  return (VMVoicemailManager *)v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (!a3)
  {
    double v5 = +[PHVoicemailPlayerController sharedPlayerController];
    [v5 endInterruption];

    [(PHAudioRecorder *)self->_greetingRecorder setAudioRecorderDelegate:0];
    if ([(PHAudioRecorder *)self->_greetingRecorder isRecording])
    {
      greetingRecorder = self->_greetingRecorder;
      [(PHAudioRecorder *)greetingRecorder stop];
    }
  }
}

- (void)setGreetingState:(int64_t)a3
{
  if (!+[NSThread isMainThread])
  {
    double v6 = +[NSString stringWithFormat:@"Attempted to change to greeting state: %li from a background thread. You must set the greeting state from the main thread.", a3];
    NSLog(@"** TUAssertion failure: %@", v6);

    if (_TUAssertShouldCrashApplication())
    {
      if (!+[NSThread isMainThread])
      {
        v7 = +[NSAssertionHandler currentHandler];
        [v7 handleFailureInMethod:a2 object:self file:@"PHVoicemailGreetingModel.m" lineNumber:84 description:@"Attempted to change to greeting state: %li from a background thread. You must set the greeting state from the main thread."];
      }
    }
  }
  if (self->_greetingState != a3)
  {
    self->_greetingState = a3;
    id v8 = [(PHVoicemailGreetingModel *)self delegate];
    [v8 voicemailGreetingAudioControllerDidChangeState:a3];
  }
}

- (void)startRecording
{
  id v14 = [(id)objc_opt_class() greetingTempFileLocation];
  if (!v14)
  {
    v4 = +[NSString stringWithFormat:@"Unable to start recording, output file is nil"];
    NSLog(@"** TUAssertion failure: %@", v4);

    if (_TUAssertShouldCrashApplication())
    {
      double v5 = +[NSAssertionHandler currentHandler];
      [v5 handleFailureInMethod:a2, self, @"PHVoicemailGreetingModel.m", 95, @"Unable to start recording, output file is nil" object file lineNumber description];
    }
  }
  double v6 = [(PHVoicemailGreetingModel *)self greetingRecorder];
  [v6 setOutputFile:v14];

  [(PHVoicemailGreetingModel *)self maximumGreetingDuration];
  double v8 = v7;
  v9 = [(PHVoicemailGreetingModel *)self greetingRecorder];
  [v9 setMaxRecordedDuration:v8];

  objc_super v10 = [(PHVoicemailGreetingModel *)self greetingRecorder];
  unsigned __int8 v11 = [v10 startWithError:0];

  if ((v11 & 1) == 0)
  {
    v12 = +[NSString stringWithFormat:@"Unable to start recording"];
    NSLog(@"** TUAssertion failure: %@", v12);

    if (_TUAssertShouldCrashApplication())
    {
      v13 = +[NSAssertionHandler currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PHVoicemailGreetingModel.m" lineNumber:99 description:@"Unable to start recording"];
    }
  }
  [(PHVoicemailGreetingModel *)self setGreetingState:4];
}

- (void)stopRecording
{
  objc_super v3 = [(PHVoicemailGreetingModel *)self greetingRecorder];
  [v3 stop];

  [(PHVoicemailGreetingModel *)self setGreetingState:2];
}

- (void)loadGreeting:(id)a3
{
  id v4 = a3;
  double v5 = +[PHVoicemailPlayerController sharedPlayerController];
  CMTimeMake(&v12, 1, 100);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __41__PHVoicemailGreetingModel_loadGreeting___block_invoke;
  v11[3] = &unk_10027E0D0;
  v11[4] = self;
  [v5 loadAudio:v4 withObserverForInterval:&v12 usingBlock:v11];

  double v6 = +[PHVoicemailPlayerController sharedPlayerController];
  long long v9 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v6 seekToTime:&v9];

  double v7 = +[PHVoicemailPlayerController sharedPlayerController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __41__PHVoicemailGreetingModel_loadGreeting___block_invoke_2;
  v8[3] = &unk_10027E0D0;
  v8[4] = self;
  [v7 currentAssetDurationWithBlock:v8];
}

void __41__PHVoicemailGreetingModel_loadGreeting___block_invoke(uint64_t a1, CMTime *a2)
{
  CMTime v5 = *a2;
  float Seconds = CMTimeGetSeconds(&v5);
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 voicemailGreetingPlayingProgressChanged:Seconds];
}

void __41__PHVoicemailGreetingModel_loadGreeting___block_invoke_2(uint64_t a1, long long *a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __41__PHVoicemailGreetingModel_loadGreeting___block_invoke_3;
  v2[3] = &unk_10027E0F8;
  v2[4] = *(void *)(a1 + 32);
  long long v3 = *a2;
  uint64_t v4 = *((void *)a2 + 2);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void __41__PHVoicemailGreetingModel_loadGreeting___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  CMTime v3 = *(CMTime *)(a1 + 40);
  [v2 voicemailGreetingDurationChanged:CMTimeGetSeconds(&v3)];
}

- (void)_mediaserverReset:(id)a3
{
  uint64_t v4 = [(PHVoicemailGreetingModel *)self existingGreeting];

  if (v4)
  {
    CMTime v5 = [(PHVoicemailGreetingModel *)self existingGreeting];
    double v6 = [v5 url];
    double v7 = +[AVAsset assetWithURL:v6];
    [(PHVoicemailGreetingModel *)self loadGreeting:v7];

    [(PHVoicemailGreetingModel *)self setGreetingState:2];
  }
}

- (void)resetPlayerToBeginning
{
  v2 = +[PHVoicemailPlayerController sharedPlayerController];
  long long v3 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v2 seekToTime:&v3];
}

- (void)playGreeting
{
  long long v3 = +[PHVoicemailPlayerController sharedPlayerController];
  unsigned int v4 = [v3 isAtEnd];

  if (v4)
  {
    CMTime v5 = +[PHVoicemailPlayerController sharedPlayerController];
    long long v7 = *(_OWORD *)&kCMTimeZero.value;
    CMTimeEpoch epoch = kCMTimeZero.epoch;
    [v5 seekToTime:&v7];
  }
  double v6 = +[PHVoicemailPlayerController sharedPlayerController];
  [v6 play];

  [(PHVoicemailGreetingModel *)self setGreetingState:3];
}

- (void)pauseGreeting
{
  long long v3 = +[PHVoicemailPlayerController sharedPlayerController];
  [v3 pause];

  [(PHVoicemailGreetingModel *)self setGreetingState:2];
}

- (PHAudioRecorder)greetingRecorder
{
  greetingRecorder = self->_greetingRecorder;
  if (!greetingRecorder)
  {
    unsigned int v4 = objc_alloc_init(PHAudioRecorder);
    CMTime v5 = self->_greetingRecorder;
    self->_greetingRecorder = v4;

    [(PHAudioRecorder *)self->_greetingRecorder setAudioRecorderDelegate:self];
    greetingRecorder = self->_greetingRecorder;
  }

  return greetingRecorder;
}

- (void)_handlePlayerDidFinishPlaying:(id)a3
{
}

- (void)audioRecorderStartedWithFile:(id)a3
{
  if ((id)[(PHVoicemailGreetingModel *)self greetingState] == (id)4)
  {
    CMTime v5 = +[NSString stringWithFormat:@"audioRecorderStartedWithFile: called, but we were already recording!  State was %ld.", [(PHVoicemailGreetingModel *)self greetingState]];
    NSLog(@"** TUAssertion failure: %@", v5);

    if (_TUAssertShouldCrashApplication())
    {
      if ((id)[(PHVoicemailGreetingModel *)self greetingState] == (id)4)
      {
        double v6 = +[NSAssertionHandler currentHandler];
        [v6 handleFailureInMethod:a2, self, @"PHVoicemailGreetingModel.m", 164, @"audioRecorderStartedWithFile: called, but we were already recording!  State was %ld.", -[PHVoicemailGreetingModel greetingState](self, "greetingState") object file lineNumber description];
      }
    }
  }

  [(PHVoicemailGreetingModel *)self setGreetingState:4];
}

- (void)audioRecorderContinuedWithFile:(id)a3 duration:(double)a4
{
  if ((id)[(PHVoicemailGreetingModel *)self greetingState] != (id)4)
  {
    long long v7 = +[NSString stringWithFormat:@"audioRecorderContinuedWithFile:duration: called, but we were not recording!  State was %ld.", [(PHVoicemailGreetingModel *)self greetingState]];
    NSLog(@"** TUAssertion failure: %@", v7);

    if (_TUAssertShouldCrashApplication())
    {
      if ((id)[(PHVoicemailGreetingModel *)self greetingState] != (id)4)
      {
        long long v9 = +[NSAssertionHandler currentHandler];
        [v9 handleFailureInMethod:a2, self, @"PHVoicemailGreetingModel.m", 169, @"audioRecorderContinuedWithFile:duration: called, but we were not recording!  State was %ld.", -[PHVoicemailGreetingModel greetingState](self, "greetingState") object file lineNumber description];
      }
    }
  }
  id v10 = [(PHVoicemailGreetingModel *)self delegate];
  [(PHVoicemailGreetingModel *)self maximumGreetingDuration];
  [v10 voicemailGreetingRecordingProgressChanged:a4 / v8];
}

- (void)audioRecorderEndedWithFile:(id)a3 duration:(double)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ((id)[(PHVoicemailGreetingModel *)self greetingState] != (id)4)
  {
    unsigned __int8 v11 = +[NSString stringWithFormat:@"audioRecorderEndedWithFile:duration:error: called, but we were not recording!  State was %ld.", [(PHVoicemailGreetingModel *)self greetingState]];
    NSLog(@"** TUAssertion failure: %@", v11);

    if (_TUAssertShouldCrashApplication())
    {
      if ((id)[(PHVoicemailGreetingModel *)self greetingState] != (id)4)
      {
        v23 = +[NSAssertionHandler currentHandler];
        [v23 handleFailureInMethod:a2, self, @"PHVoicemailGreetingModel.m", 174, @"audioRecorderEndedWithFile:duration:error: called, but we were not recording!  State was %ld.", -[PHVoicemailGreetingModel greetingState](self, "greetingState") object file lineNumber description];

        if (v10) {
          goto LABEL_5;
        }
LABEL_10:
        id v15 = objc_alloc_init((Class)VMVoicemailGreeting);
        [v15 setDuration:a4];
        v24 = +[NSURL fileURLWithPath:v9];
        [v15 setUrl:v24];

        [v15 setType:2];
        v25 = [v15 url];
        v26 = +[AVURLAsset assetWithURL:v25];
        [(PHVoicemailGreetingModel *)self loadGreeting:v26];

        [(PHVoicemailGreetingModel *)self setSelectedGreeting:v15];
        v27 = [(PHVoicemailGreetingModel *)self delegate];
        [v27 voicemailGreetingDidFinishRecording];

        goto LABEL_11;
      }
    }
  }
  if (!v10) {
    goto LABEL_10;
  }
LABEL_5:
  id v12 = [v10 code];
  v13 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  id v14 = v13;
  if (v12 == (id)-11810)
  {
    id v15 = [v13 localizedStringForKey:@"GREETING_TOO_LONG" value:&stru_100285990 table:@"Voicemail"];

    v16 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    v17 = v16;
    CFStringRef v18 = @"GREETING_TOO_LONG_DETAIL";
  }
  else
  {
    id v15 = [v13 localizedStringForKey:@"GREETING_FAILED" value:&stru_100285990 table:@"Voicemail"];

    v16 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
    v17 = v16;
    CFStringRef v18 = @"GREETING_FAILED_DETAIL";
  }
  v19 = [v16 localizedStringForKey:v18 value:&stru_100285990 table:@"Voicemail"];

  v28[0] = NSLocalizedDescriptionKey;
  v28[1] = NSLocalizedFailureReasonErrorKey;
  v29[0] = v15;
  v29[1] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  v21 = +[NSError errorWithDomain:@"com.apple.mobilephone" code:-1 userInfo:v20];

  v22 = [(PHVoicemailGreetingModel *)self delegate];
  [v22 voicemailGreetingFailedWithError:v21];

  [(PHVoicemailGreetingModel *)self setGreetingState:2];
LABEL_11:
}

+ (id)greetingTempFileLocation
{
  v2 = NSTemporaryDirectory();
  long long v3 = [v2 stringByAppendingPathComponent:@"greeting.XXXXXX"];

  id v4 = v3;
  [v4 fileSystemRepresentation];
  if ((unint64_t)__strlcpy_chk() >= 8)
  {
    if ((mkstemp(v11) & 0x80000000) == 0)
    {
      CMTime v5 = +[NSFileManager defaultManager];
      double v6 = +[NSURL fileURLWithFileSystemRepresentation:v11 isDirectory:0 relativeToURL:0];
      [v5 removeItemAtURL:v6 error:0];

      long long v7 = +[NSString stringWithUTF8String:v11];
      goto LABEL_8;
    }
    double v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[PHVoicemailGreetingModel greetingTempFileLocation];
    }
  }
  long long v7 = 0;
LABEL_8:
  id v9 = [v7 stringByAppendingString:@".amr"];

  return v9;
}

- (PHVoicemailGreetingModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHVoicemailGreetingModelDelegate *)WeakRetained;
}

- (int64_t)greetingState
{
  return self->_greetingState;
}

- (MPGreetingAccount)account
{
  return self->_account;
}

- (VMVoicemailGreeting)existingGreeting
{
  return self->_existingGreeting;
}

- (void)setExistingGreeting:(id)a3
{
}

- (VMVoicemailGreeting)selectedGreeting
{
  return self->_selectedGreeting;
}

- (void)setSelectedGreeting:(id)a3
{
}

- (VMVoicemailGreeting)tempCustomizedGreeting
{
  return self->_tempCustomizedGreeting;
}

- (void)setTempCustomizedGreeting:(id)a3
{
}

- (void)setMaximumGreetingDuration:(double)a3
{
  self->_maximumGreetingDuration = a3;
}

- (void)setGreetingRecorder:(id)a3
{
}

- (double)greetingDuration
{
  return self->_greetingDuration;
}

- (void)setGreetingDuration:(double)a3
{
  self->_greetingDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greetingRecorder, 0);
  objc_storeStrong((id *)&self->_tempCustomizedGreeting, 0);
  objc_storeStrong((id *)&self->_selectedGreeting, 0);
  objc_storeStrong((id *)&self->_existingGreeting, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)shouldShowSaveButton
{
  v2 = self;
  long long v3 = [(PHVoicemailGreetingModel *)v2 selectedGreeting];
  id v4 = [(PHVoicemailGreetingModel *)v2 existingGreeting];
  unsigned __int8 v5 = [(VMVoicemailGreeting *)v3 isEqual:v4];

  return v5 ^ 1;
}

- (NSURL)defaultGreetingURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  double v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  double v8 = (char *)&v19 - v7;
  id v9 = self;
  id v10 = self;
  id v11 = [v9 sharedInstance];
  id v12 = [v11 defaultGreeting];

  if (v12)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v13 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  outlined init with take of URL?((uint64_t)v6, (uint64_t)v8);

  type metadata accessor for URL();
  uint64_t v14 = *(void *)(v13 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    URL._bridgeToObjectiveC()(v15);
    v16 = v17;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }

  return (NSURL *)v16;
}

- (BOOL)greetingExists
{
  v2 = self;
  unsigned __int8 v3 = PHVoicemailGreetingModel.greetingExists.getter();

  return v3 & 1;
}

- (BOOL)isCustomized
{
  v2 = self;
  unsigned __int8 v3 = [(PHVoicemailGreetingModel *)v2 selectedGreeting];
  id v4 = [(VMVoicemailGreeting *)v3 type];

  return v4 == (id)2;
}

- (BOOL)isDefault
{
  v2 = self;
  unsigned __int8 v3 = [(PHVoicemailGreetingModel *)v2 selectedGreeting];
  id v4 = [(VMVoicemailGreeting *)v3 type];

  return v4 == 0;
}

- (BOOL)shouldShowPlayButtonForDefaultGreeting
{
  v2 = self;
  if ([(PHVoicemailGreetingModel *)v2 isCallScreeningEnabled]) {
    unsigned __int8 v3 = [(PHVoicemailGreetingModel *)v2 greetingExists];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)isCallScreeningEnabled
{
  uint64_t v2 = one-time initialization token for featureFlags;
  unsigned __int8 v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  char v4 = TUCallScreeningEnabled();

  return v4;
}

- (NSUUID)liveVoicMailAccountUUID
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  v6.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSUUID *)v6.super.isa;
}

- (void)saveGreeting
{
  uint64_t v2 = self;
  PHVoicemailGreetingModel.saveGreeting()();
}

- (void)fetchGreeting
{
  uint64_t v2 = self;
  PHVoicemailGreetingModel.fetchGreeting()();
}

- (void)didSelectDefaultGreeting
{
  uint64_t v2 = self;
  PHVoicemailGreetingModel.didSelectDefaultGreeting()();
}

- (void)didSelectCustomizedGreeting
{
  uint64_t v2 = self;
  PHVoicemailGreetingModel.didSelectCustomizedGreeting()();
}

- (double)maximumGreetingDurationForAccount:(id)a3
{
  if (*((unsigned char *)a3 + OBJC_IVAR___MPGreetingAccount_accountType + 8)) {
    return 120.0;
  }
  id v5 = a3;
  NSUUID v6 = self;
  uint64_t v7 = [(PHVoicemailGreetingModel *)v6 voicemailManager];
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  [(VMVoicemailManager *)v7 maximumGreetingDurationForAccountUUID:isa];
  double v10 = v9;

  return v10;
}

+ (void)greetingTempFileLocation
{
  int v4 = *__error();
  id v5 = __error();
  NSUUID v6 = strerror(*v5);
  int v7 = 136315650;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2080;
  id v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to create temp path for greeting file: %s: %d (%s)", (uint8_t *)&v7, 0x1Cu);
}

@end
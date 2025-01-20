@interface WFAudioRecorder
+ (id)formattedStringWithDuration:(double)a3 elapsedTime:(double)a4;
- (AVAudioRecorder)recorder;
- (BOOL)hasFinished;
- (BOOL)isRecording;
- (BOOL)paused;
- (BOOL)runningUpdateTimer;
- (NSTimer)updateTimer;
- (NSURL)outputURL;
- (WFAudioRecorder)initWithOutputFormat:(int64_t)a3 destinationURL:(id)a4;
- (WFAudioRecorderDelegate)delegate;
- (double)recordingDuration;
- (int64_t)outputFormat;
- (void)audioInterruption:(id)a3;
- (void)audioRecorderDidFinishRecording:(id)a3 successfully:(BOOL)a4;
- (void)audioRecorderEncodeErrorDidOccur:(id)a3 error:(id)a4;
- (void)countdownFire:(id)a3;
- (void)finishRecording;
- (void)pauseRecording;
- (void)recordForDuration:(double)a3;
- (void)resumeRecording;
- (void)setDelegate:(id)a3;
- (void)setHasFinished:(BOOL)a3;
- (void)setOutputFormat:(int64_t)a3;
- (void)setOutputURL:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRecorder:(id)a3;
- (void)setRecordingDuration:(double)a3;
- (void)setRunningUpdateTimer:(BOOL)a3;
- (void)setUpdateTimer:(id)a3;
- (void)startRecording;
@end

@implementation WFAudioRecorder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setHasFinished:(BOOL)a3
{
  self->_hasFinished = a3;
}

- (BOOL)hasFinished
{
  return self->_hasFinished;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setUpdateTimer:(id)a3
{
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setRecorder:(id)a3
{
}

- (AVAudioRecorder)recorder
{
  return self->_recorder;
}

- (void)setOutputURL:(id)a3
{
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setOutputFormat:(int64_t)a3
{
  self->_outputFormat = a3;
}

- (int64_t)outputFormat
{
  return self->_outputFormat;
}

- (void)setDelegate:(id)a3
{
}

- (WFAudioRecorderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFAudioRecorderDelegate *)WeakRetained;
}

- (void)audioRecorderEncodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v5 = a4;
  v6 = [(WFAudioRecorder *)self delegate];
  [v6 audioRecorder:self didFinishWithDestinationURL:0 error:v5];

  [(WFAudioRecorder *)self finishRecording];
}

- (void)audioRecorderDidFinishRecording:(id)a3 successfully:(BOOL)a4
{
  id v5 = [(WFAudioRecorder *)self delegate];
  v6 = [(WFAudioRecorder *)self outputURL];
  [v5 audioRecorder:self didFinishWithDestinationURL:v6 error:0];

  [(WFAudioRecorder *)self finishRecording];
}

- (void)setRunningUpdateTimer:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WFAudioRecorder *)self runningUpdateTimer] != a3)
  {
    if (v3)
    {
      id v5 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_countdownFire_ selector:0 userInfo:1 repeats:1.0];
      updateTimer = self->_updateTimer;
      self->_updateTimer = v5;

      v7 = self->_updateTimer;
      [(NSTimer *)v7 setTolerance:0.05];
    }
    else
    {
      [(NSTimer *)self->_updateTimer invalidate];
      v8 = self->_updateTimer;
      self->_updateTimer = 0;
    }
  }
}

- (BOOL)runningUpdateTimer
{
  v2 = [(WFAudioRecorder *)self updateTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)countdownFire:(id)a3
{
  v4 = [(WFAudioRecorder *)self recorder];
  [v4 currentTime];
  double v6 = v5;

  v7 = [(WFAudioRecorder *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(WFAudioRecorder *)self delegate];
    [v9 audioRecorder:self didProgressToTime:v6];
  }
}

- (void)audioInterruption:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  double v6 = (void *)getAVAudioSessionInterruptionTypeKeySymbolLoc_ptr;
  uint64_t v15 = getAVAudioSessionInterruptionTypeKeySymbolLoc_ptr;
  if (!getAVAudioSessionInterruptionTypeKeySymbolLoc_ptr)
  {
    v7 = AVFoundationLibrary_47129();
    v13[3] = (uint64_t)dlsym(v7, "AVAudioSessionInterruptionTypeKey");
    getAVAudioSessionInterruptionTypeKeySymbolLoc_ptr = v13[3];
    double v6 = (void *)v13[3];
  }
  _Block_object_dispose(&v12, 8);
  if (v6)
  {
    char v8 = [v5 objectForKey:*v6];
    uint64_t v9 = [v8 unsignedIntegerValue];

    if (v9)
    {
      if (v9 == 1) {
        [(WFAudioRecorder *)self pauseRecording];
      }
    }
    else
    {
      [(WFAudioRecorder *)self resumeRecording];
    }
  }
  else
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    v11 = [NSString stringWithUTF8String:"NSNotificationName getAVAudioSessionInterruptionTypeKey(void)"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"WFAudioRecorder.m", 31, @"%s", dlerror());

    __break(1u);
  }
}

- (void)resumeRecording
{
  if ([(WFAudioRecorder *)self paused])
  {
    [(WFAudioRecorder *)self setPaused:0];
    id v3 = [(WFAudioRecorder *)self recorder];
    [v3 record];
  }
}

- (void)pauseRecording
{
  if ([(WFAudioRecorder *)self isRecording] && ![(WFAudioRecorder *)self paused])
  {
    [(WFAudioRecorder *)self setPaused:1];
    id v3 = [(WFAudioRecorder *)self recorder];
    [v3 pause];
  }
}

- (void)recordForDuration:(double)a3
{
  [(WFAudioRecorder *)self setRecordingDuration:a3];
  [(WFAudioRecorder *)self startRecording];
}

- (void)finishRecording
{
  if (![(WFAudioRecorder *)self hasFinished])
  {
    [(WFAudioRecorder *)self setHasFinished:1];
    [(WFAudioRecorder *)self setRunningUpdateTimer:0];
    id v3 = [(WFAudioRecorder *)self recorder];
    [v3 stop];

    id v7 = [getAVAudioSessionClass_47144() sharedInstance];
    [v7 setActive:0 withOptions:1 error:0];
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    double v5 = getAVAudioSessionInterruptionNotification();
    [v4 removeObserver:self name:v5 object:v7];

    double v6 = +[WFRecordingStatusManager sharedManager];
    [v6 setRecording:0];
  }
}

- (void)startRecording
{
  [(WFAudioRecorder *)self setHasFinished:0];
  id v3 = [getAVAudioSessionClass_47144() sharedInstance];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  id v4 = (void **)getAVAudioSessionCategoryPlayAndRecordSymbolLoc_ptr;
  uint64_t v30 = getAVAudioSessionCategoryPlayAndRecordSymbolLoc_ptr;
  if (!getAVAudioSessionCategoryPlayAndRecordSymbolLoc_ptr)
  {
    v25[1] = (id)MEMORY[0x263EF8330];
    v25[2] = (id)3221225472;
    v25[3] = __getAVAudioSessionCategoryPlayAndRecordSymbolLoc_block_invoke;
    v25[4] = &unk_264E5EC88;
    v26 = &v27;
    double v5 = AVFoundationLibrary_47129();
    v28[3] = (uint64_t)dlsym(v5, "AVAudioSessionCategoryPlayAndRecord");
    getAVAudioSessionCategoryPlayAndRecordSymbolLoc_ptr = *(void *)(v26[1] + 24);
    id v4 = (void **)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (v4)
  {
    double v6 = *v4;
    v25[0] = 0;
    id v7 = v6;
    char v8 = [v3 setCategory:v7 withOptions:5 error:v25];
    id v9 = v25[0];

    if ((v8 & 1) == 0) {
      NSLog(&cfstr_FailedToSetAud.isa, v9);
    }
    id v24 = v9;
    char v10 = [v3 setActive:1 error:&v24];
    id v11 = v24;

    if ((v10 & 1) == 0) {
      NSLog(&cfstr_FailedToSetAud_0.isa, v11);
    }
    uint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
    v13 = getAVAudioSessionInterruptionNotification();
    [v12 addObserver:self selector:sel_audioInterruption_ name:v13 object:v3];

    uint64_t v14 = +[WFRecordingStatusManager sharedManager];
    [v14 setRecording:1];

    [(WFAudioRecorder *)self setRunningUpdateTimer:1];
    [(WFAudioRecorder *)self recordingDuration];
    double v16 = v15;
    v17 = [(WFAudioRecorder *)self recorder];
    v18 = v17;
    if (v16 == 0.0)
    {
      [v17 record];
    }
    else
    {
      [(WFAudioRecorder *)self recordingDuration];
      objc_msgSend(v18, "recordForDuration:");
    }

    v19 = [(WFAudioRecorder *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      v21 = [(WFAudioRecorder *)self delegate];
      [v21 audioRecorder:self didStartRecording:1 error:0];
    }
    [(WFAudioRecorder *)self countdownFire:self->_updateTimer];
  }
  else
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    v23 = [NSString stringWithUTF8String:"NSString *getAVAudioSessionCategoryPlayAndRecord(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFAudioRecorder.m", 29, @"%s", dlerror());

    __break(1u);
  }
}

- (BOOL)isRecording
{
  v2 = [(WFAudioRecorder *)self recorder];
  char v3 = [v2 isRecording];

  return v3;
}

- (WFAudioRecorder)initWithOutputFormat:(int64_t)a3 destinationURL:(id)a4
{
  v42[4] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WFAudioRecorder;
  char v8 = [(WFAudioRecorder *)&v31 init];
  id v9 = v8;
  if (!v8) {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v8->_outputURL, a4);
  if (a3)
  {
    if (a3 == 2)
    {
      char v10 = getAVFormatIDKey();
      v37[0] = v10;
      v38[0] = &unk_26F076518;
      id v11 = getAVSampleRateKey();
      v37[1] = v11;
      v38[1] = &unk_26F076AC0;
      uint64_t v12 = getAVNumberOfChannelsKey();
      v37[2] = v12;
      v38[2] = &unk_26F0764E8;
      v13 = getAVLinearPCMIsFloatKey();
      v37[3] = v13;
      uint64_t v19 = MEMORY[0x263EFFA80];
      v38[3] = MEMORY[0x263EFFA80];
      char v20 = getAVLinearPCMIsBigEndianKey();
      v37[4] = v20;
      v38[4] = v19;
      v21 = getAVLinearPCMBitDepthKey();
      v37[5] = v21;
      v38[5] = &unk_26F076530;
      v22 = getAVEncoderAudioQualityKey();
      v37[6] = v22;
      v38[6] = &unk_26F076500;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:7];
    }
    else
    {
      if (a3 != 1)
      {
        uint64_t v14 = 0;
        goto LABEL_10;
      }
      char v10 = getAVFormatIDKey();
      v41[0] = v10;
      v42[0] = &unk_26F0764D0;
      id v11 = getAVSampleRateKey();
      v41[1] = v11;
      v42[1] = &unk_26F076AC0;
      uint64_t v12 = getAVNumberOfChannelsKey();
      v41[2] = v12;
      v42[2] = &unk_26F0764E8;
      v13 = getAVEncoderAudioQualityKey();
      v41[3] = v13;
      v42[3] = &unk_26F076500;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
    }
  }
  else
  {
    char v10 = getAVFormatIDKey();
    v39[0] = v10;
    v40[0] = &unk_26F076518;
    id v11 = getAVSampleRateKey();
    v39[1] = v11;
    v40[1] = &unk_26F076AC0;
    uint64_t v12 = getAVNumberOfChannelsKey();
    v39[2] = v12;
    v40[2] = &unk_26F0764E8;
    v13 = getAVLinearPCMIsFloatKey();
    v39[3] = v13;
    uint64_t v15 = MEMORY[0x263EFFA80];
    v40[3] = MEMORY[0x263EFFA80];
    double v16 = getAVLinearPCMIsBigEndianKey();
    v39[4] = v16;
    v40[4] = v15;
    v17 = getAVLinearPCMBitDepthKey();
    v39[5] = v17;
    v40[5] = &unk_26F076530;
    v18 = getAVEncoderAudioQualityKey();
    v39[6] = v18;
    v40[6] = &unk_26F076500;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:7];
  }
LABEL_10:
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2050000000;
  v23 = (void *)getAVAudioRecorderClass_softClass;
  uint64_t v36 = getAVAudioRecorderClass_softClass;
  if (!getAVAudioRecorderClass_softClass)
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __getAVAudioRecorderClass_block_invoke;
    v32[3] = &unk_264E5EC88;
    v32[4] = &v33;
    __getAVAudioRecorderClass_block_invoke((uint64_t)v32);
    v23 = (void *)v34[3];
  }
  id v24 = v23;
  _Block_object_dispose(&v33, 8);
  id v30 = 0;
  uint64_t v25 = [[v24 alloc] initWithURL:v7 settings:v14 error:&v30];
  id v26 = v30;
  recorder = v9->_recorder;
  v9->_recorder = (AVAudioRecorder *)v25;

  if (v26) {
    NSLog(&cfstr_Avautorecorder.isa, v26);
  }
  [(AVAudioRecorder *)v9->_recorder setDelegate:v9];
  v9->_recordingDuration = 0.0;
  v28 = v9;

LABEL_15:
  return v9;
}

+ (id)formattedStringWithDuration:(double)a3 elapsedTime:(double)a4
{
  if (a3 == 0.0) {
    double v4 = a4;
  }
  else {
    double v4 = a3 - a4;
  }
  id v5 = objc_alloc_init(MEMORY[0x263F08780]);
  [v5 setUnitsStyle:0];
  [v5 setZeroFormattingBehavior:0x10000];
  [v5 setAllowedUnits:192];
  if (v4 >= 3600.0) {
    objc_msgSend(v5, "setAllowedUnits:", objc_msgSend(v5, "allowedUnits") | 0x20);
  }
  double v6 = [v5 stringFromTimeInterval:v4];

  return v6;
}

@end
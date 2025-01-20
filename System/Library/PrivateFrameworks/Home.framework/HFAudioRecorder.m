@interface HFAudioRecorder
- (AVAudioRecorder)audioRecorder;
- (BOOL)_isPowerMeteringTimerValid;
- (BOOL)isAudioSessionActive;
- (BOOL)isRecording;
- (HFAudioRecorder)initWithActivationMode:(int64_t)a3 delegate:(id)a4;
- (HFAudioRecorder)initWithAudioRecorderDelegate:(id)a3;
- (HFAudioRecorderDelegate)audioRecorderDelegate;
- (NSDateFormatter)dateFormatter;
- (NSNumber)routeChangeReason;
- (NSURL)recordingAudiofileURL;
- (OS_dispatch_source)powerMeteringTimer;
- (OpaqueAudioFileID)recordingAudiofileID;
- (double)currentRecordedDuration;
- (double)recordingDurationLimit;
- (double)recordingStartTimeInterval;
- (double)recordingStopTimeInterval;
- (id)_audioRecorderSettings;
- (int64_t)totalPacketsCount;
- (unint64_t)recordingStopSource;
- (unsigned)soundIDForRecordBegin;
- (unsigned)soundIDForRecordEnd;
- (void)_activateRecordingAudioSession;
- (void)_cleanup;
- (void)_createSystemSounds;
- (void)_deactivateRecordingAudioSession;
- (void)_deregisterAudioSessionObservers;
- (void)_playStartRecordingToneWithCompletion:(id)a3;
- (void)_playStopRecordingToneWithCompletion:(id)a3;
- (void)_registerAudioSessionObservers;
- (void)_setupAudioFileForRecording;
- (void)_startPowerMeteringTimer;
- (void)_stopPowerMeteringTimer;
- (void)audioRecorderDidFinishRecording:(id)a3 successfully:(BOOL)a4;
- (void)audioSessionDidInterrupt:(id)a3;
- (void)audioSessionMediaServicesWereLost:(id)a3;
- (void)audioSessionMediaServicesWereReset:(id)a3;
- (void)audioSessionRouteChanged:(id)a3;
- (void)dealloc;
- (void)playAlertSoundForType:(unint64_t)a3 withCompletion:(id)a4;
- (void)prepareRecording;
- (void)setAudioRecorder:(id)a3;
- (void)setAudioRecorderDelegate:(id)a3;
- (void)setAudioSessionIsActive:(BOOL)a3;
- (void)setDateFormatter:(id)a3;
- (void)setPowerMeteringTimer:(id)a3;
- (void)setRecording:(BOOL)a3;
- (void)setRecordingAudiofileID:(OpaqueAudioFileID *)a3;
- (void)setRecordingAudiofileURL:(id)a3;
- (void)setRecordingDurationLimit:(double)a3;
- (void)setRecordingStartTimeInterval:(double)a3;
- (void)setRecordingStopSource:(unint64_t)a3;
- (void)setRecordingStopTimeInterval:(double)a3;
- (void)setRouteChangeReason:(id)a3;
- (void)setSoundIDForRecordBegin:(unsigned int)a3;
- (void)setSoundIDForRecordEnd:(unsigned int)a3;
- (void)setTotalPacketsCount:(int64_t)a3;
- (void)startRecording;
- (void)stopRecording;
@end

@implementation HFAudioRecorder

- (HFAudioRecorder)initWithAudioRecorderDelegate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HFAudioRecorder;
  v5 = [(HFAudioRecorder *)&v20 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  objc_storeWeak((id *)&v5->_audioRecorderDelegate, v4);
  uint64_t v7 = objc_opt_new();
  dateFormatter = v6->_dateFormatter;
  v6->_dateFormatter = (NSDateFormatter *)v7;

  v6->_recordingDurationLimit = -1.0;
  v6->_recordingStopSource = 0;
  [(HFAudioRecorder *)v6 _createSystemSounds];
  [(HFAudioRecorder *)v6 _registerAudioSessionObservers];
  [(HFAudioRecorder *)v6 _setupAudioFileForRecording];
  id v9 = objc_alloc(MEMORY[0x263EF93D8]);
  v10 = [(HFAudioRecorder *)v6 recordingAudiofileURL];
  v11 = [(HFAudioRecorder *)v6 _audioRecorderSettings];
  id v19 = 0;
  v12 = (void *)[v9 initWithURL:v10 settings:v11 error:&v19];
  id v13 = v19;
  [(HFAudioRecorder *)v6 setAudioRecorder:v12];

  if (!v13)
  {
    v16 = [(HFAudioRecorder *)v6 audioRecorder];
    [v16 setDelegate:v6];

    v17 = [(HFAudioRecorder *)v6 audioRecorder];
    [v17 setMeteringEnabled:1];

LABEL_7:
    v15 = v6;
    goto LABEL_8;
  }
  v14 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v13;
    _os_log_error_impl(&dword_20B986000, v14, OS_LOG_TYPE_ERROR, "-[AVVoiceController initWithContext:...] failed with error %@", buf, 0xCu);
  }

  [(HFAudioRecorder *)v6 setAudioRecorder:0];
  v15 = 0;
LABEL_8:

  return v15;
}

- (HFAudioRecorder)initWithActivationMode:(int64_t)a3 delegate:(id)a4
{
  return [(HFAudioRecorder *)self initWithAudioRecorderDelegate:a4];
}

- (void)dealloc
{
  [(AVAudioRecorder *)self->_audioRecorder setDelegate:0];
  [(HFAudioRecorder *)self _deactivateRecordingAudioSession];
  [(HFAudioRecorder *)self _cleanup];
  audioRecorder = self->_audioRecorder;
  self->_audioRecorder = 0;

  v4.receiver = self;
  v4.super_class = (Class)HFAudioRecorder;
  [(HFAudioRecorder *)&v4 dealloc];
}

- (void)prepareRecording
{
  v3 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Calling prepareRecording", v4, 2u);
  }

  [(HFAudioRecorder *)self _activateRecordingAudioSession];
}

- (void)startRecording
{
  if (![(HFAudioRecorder *)self isAudioSessionActive]) {
    [(HFAudioRecorder *)self _activateRecordingAudioSession];
  }
  v3 = [(HFAudioRecorder *)self audioRecorder];
  [(HFAudioRecorder *)self recordingDurationLimit];
  char v4 = objc_msgSend(v3, "recordForDuration:");

  v5 = HFLogForCategory(0xBuLL);
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "AVAudioRecorder failed to start recording", buf, 2u);
    }

    v11 = [(HFAudioRecorder *)self audioRecorderDelegate];
    if ([v11 conformsToProtocol:&unk_26C182700])
    {
      v12 = [(HFAudioRecorder *)self audioRecorderDelegate];
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
      {
LABEL_16:
        [(HFAudioRecorder *)self _cleanup];
        return;
      }
      v11 = [(HFAudioRecorder *)self audioRecorderDelegate];
      v14 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
      [v11 audioRecorderFailedToStartRecording:v14];
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "AVAudioRecorder started recording successfully", v15, 2u);
  }

  uint64_t v7 = [MEMORY[0x263EFF910] date];
  [v7 timeIntervalSince1970];
  -[HFAudioRecorder setRecordingStartTimeInterval:](self, "setRecordingStartTimeInterval:");

  [(HFAudioRecorder *)self _startPowerMeteringTimer];
  [(HFAudioRecorder *)self setRecording:1];
  v8 = [(HFAudioRecorder *)self audioRecorderDelegate];
  if ([v8 conformsToProtocol:&unk_26C182700])
  {
    id v9 = [(HFAudioRecorder *)self audioRecorderDelegate];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      return;
    }
    v8 = [(HFAudioRecorder *)self audioRecorderDelegate];
    [v8 audioRecorderDidStartRecording:self];
  }
}

- (void)stopRecording
{
  [(HFAudioRecorder *)self _deregisterAudioSessionObservers];
  id v3 = [(HFAudioRecorder *)self audioRecorder];
  [v3 stop];
}

- (double)currentRecordedDuration
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(HFAudioRecorder *)self recordingStopTimeInterval];
  if (v3 == 0.0)
  {
    char v4 = [MEMORY[0x263EFF910] date];
    [v4 timeIntervalSince1970];
    double v6 = v5;
  }
  else
  {
    [(HFAudioRecorder *)self recordingStopTimeInterval];
    double v6 = v7;
  }
  [(HFAudioRecorder *)self recordingStartTimeInterval];
  double v9 = v6 - v8;
  char v10 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    double v13 = v9;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Recorded so far %f", (uint8_t *)&v12, 0xCu);
  }

  return v9;
}

- (void)playAlertSoundForType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 1)
  {
    id v8 = v6;
    id v6 = (id)[(HFAudioRecorder *)self _playStopRecordingToneWithCompletion:v6];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v8 = v6;
    id v6 = (id)[(HFAudioRecorder *)self _playStartRecordingToneWithCompletion:v6];
  }
  id v7 = v8;
LABEL_6:
  MEMORY[0x270F9A758](v6, v7);
}

- (void)audioRecorderDidFinishRecording:(id)a3 successfully:(BOOL)a4
{
  double v5 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "AVAudioRecorder stopped recording", v15, 2u);
  }

  id v6 = [MEMORY[0x263EFF910] date];
  [v6 timeIntervalSince1970];
  -[HFAudioRecorder setRecordingStopTimeInterval:](self, "setRecordingStopTimeInterval:");

  [(HFAudioRecorder *)self _stopPowerMeteringTimer];
  [(HFAudioRecorder *)self setRecording:0];
  id v7 = [(HFAudioRecorder *)self recordingAudiofileID];
  if (v7)
  {
    AudioFileClose(v7);
    id v8 = [(HFAudioRecorder *)self audioRecorderDelegate];
    if ([v8 conformsToProtocol:&unk_26C182700])
    {
      double v9 = [(HFAudioRecorder *)self audioRecorderDelegate];
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
      {
LABEL_8:
        [(HFAudioRecorder *)self _deactivateRecordingAudioSession];
        return;
      }
      id v8 = [(HFAudioRecorder *)self audioRecorderDelegate];
      v11 = [(HFAudioRecorder *)self recordingAudiofileURL];
      [v8 audioRecorderFinishedRecording:self audioFile:v11];
    }
    goto LABEL_8;
  }
  int v12 = [(HFAudioRecorder *)self audioRecorderDelegate];
  if (![v12 conformsToProtocol:&unk_26C182700]) {
    goto LABEL_12;
  }
  double v13 = [(HFAudioRecorder *)self audioRecorderDelegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    int v12 = [(HFAudioRecorder *)self audioRecorderDelegate];
    [v12 audioRecorderFailedToFinishRecording:self];
LABEL_12:
  }
  [(HFAudioRecorder *)self _cleanup];
}

- (void)audioSessionDidInterrupt:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Audio Session was interrupted [%@]", (uint8_t *)&v6, 0xCu);
  }

  [(HFAudioRecorder *)self setRecordingStopSource:1];
  [(HFAudioRecorder *)self stopRecording];
}

- (void)audioSessionMediaServicesWereLost:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Media Services Were Lost [%@]", (uint8_t *)&v6, 0xCu);
  }

  [(HFAudioRecorder *)self setRecordingStopSource:2];
  [(HFAudioRecorder *)self stopRecording];
}

- (void)audioSessionMediaServicesWereReset:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Media Services Were Reset [%@]", (uint8_t *)&v6, 0xCu);
  }

  [(HFAudioRecorder *)self setRecordingStopSource:2];
  [(HFAudioRecorder *)self stopRecording];
}

- (void)audioSessionRouteChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HFAudioRecorder *)self isAudioSessionActive])
  {
    double v5 = [v4 userInfo];
    int v6 = [v5 objectForKey:*MEMORY[0x263EF9268]];
    uint64_t v7 = [v6 unsignedIntegerValue];

    if ((unint64_t)(v7 - 1) <= 1)
    {
      uint64_t v8 = HFLogForCategory(0xBuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Audio Session Route Changed [%@]", (uint8_t *)&v10, 0xCu);
      }

      [(HFAudioRecorder *)self setRecordingStopSource:3];
      double v9 = [NSNumber numberWithUnsignedInteger:v7];
      [(HFAudioRecorder *)self setRouteChangeReason:v9];

      [(HFAudioRecorder *)self stopRecording];
    }
  }
}

- (id)_audioRecorderSettings
{
  v7[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EF92F8];
  v6[0] = *MEMORY[0x263EF92A8];
  v6[1] = v2;
  v7[0] = &unk_26C0F6A80;
  v7[1] = &unk_26C0F7FA8;
  uint64_t v3 = *MEMORY[0x263EF92E0];
  v6[2] = *MEMORY[0x263EF92C0];
  v6[3] = v3;
  v7[2] = &unk_26C0F6A98;
  v7[3] = &unk_26C0F6AB0;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  return v4;
}

- (void)_registerAudioSessionObservers
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_audioSessionDidInterrupt_ name:*MEMORY[0x263EF90A0] object:0];
  [v3 addObserver:self selector:sel_audioSessionRouteChanged_ name:*MEMORY[0x263EF9248] object:0];
  [v3 addObserver:self selector:sel_audioSessionMediaServicesWereLost_ name:*MEMORY[0x263EF90E8] object:0];
  [v3 addObserver:self selector:sel_audioSessionMediaServicesWereReset_ name:*MEMORY[0x263EF90F8] object:0];
}

- (void)_deregisterAudioSessionObservers
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EF90A0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263EF9248] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263EF90E8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263EF90F8] object:0];
}

- (void)_setupAudioFileForRecording
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  AudioFileID outAudioFile = 0;
  id v3 = [(HFAudioRecorder *)self dateFormatter];
  [v3 setDateFormat:@"MM-dd-yyyy"];

  id v4 = NSString;
  double v5 = [MEMORY[0x263F08C38] UUID];
  int v6 = [v5 UUIDString];
  uint64_t v7 = [(HFAudioRecorder *)self dateFormatter];
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  double v9 = [v7 stringFromDate:v8];
  int v10 = [v4 stringWithFormat:@"%@-%@.%@", v6, v9, @"caf"];

  id v11 = +[HFUtilities sharedAnnouncementsDirectoryURL];
  uint64_t v12 = [v11 path];
  double v13 = NSURL;
  char v14 = [v12 stringByAppendingPathComponent:v10];
  v15 = [v13 fileURLWithPath:v14];

  v16 = [MEMORY[0x263F08850] defaultManager];
  v17 = [v15 URLByDeletingLastPathComponent];
  id v27 = 0;
  [v16 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v27];
  id v18 = v27;

  if (!v18)
  {
    memset(&buf.mFormatID, 0, 32);
    buf.mSampleRate = 24000.0;
    buf.mChannelsPerFrame = 1;
    buf.mFormatID = 1869641075;
    buf.mFramesPerPacket = 480;
    UInt32 ioPropertyDataSize = 40;
    OSStatus Property = AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &buf);
    if (Property)
    {
      OSStatus v22 = Property;
      id v19 = HFLogForCategory(0xBuLL);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      objc_super v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v22 userInfo:0];
      *(_DWORD *)v29 = 138412290;
      v30 = v20;
      uint64_t v23 = "AudioFormatGetProperty failed with error [%@]";
    }
    else
    {
      OSStatus v24 = AudioFileCreateWithURL((CFURLRef)v15, 0x63616666u, &buf, 3u, &outAudioFile);
      if (!v24)
      {
        [(HFAudioRecorder *)self setRecordingAudiofileURL:v15];
        [(HFAudioRecorder *)self setRecordingAudiofileID:outAudioFile];
        goto LABEL_13;
      }
      OSStatus v25 = v24;
      id v19 = HFLogForCategory(0xBuLL);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      objc_super v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v25 userInfo:0];
      *(_DWORD *)v29 = 138412290;
      v30 = v20;
      uint64_t v23 = "AudioFileCreateWithURL error %@";
    }
    _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, v23, v29, 0xCu);
    goto LABEL_11;
  }
  id v19 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    objc_super v20 = [v15 URLByDeletingLastPathComponent];
    LODWORD(buf.mSampleRate) = 138412546;
    *(void *)((char *)&buf.mSampleRate + 4) = v20;
    LOWORD(buf.mFormatFlags) = 2112;
    *(void *)((char *)&buf.mFormatFlags + 2) = v18;
    _os_log_error_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "Error creating audio file at path [%@] - [%@]", (uint8_t *)&buf, 0x16u);
LABEL_11:
  }
LABEL_12:

LABEL_13:
}

- (void)_activateRecordingAudioSession
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)AudioStreamBasicDescription buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Now Activiation AudioSession", buf, 2u);
  }

  id v4 = [MEMORY[0x263EF93E0] sharedInstance];
  uint64_t v5 = *MEMORY[0x263EF9050];
  uint64_t v6 = *MEMORY[0x263EF9108];
  id v13 = 0;
  [v4 setCategory:v5 mode:v6 routeSharingPolicy:0 options:12 error:&v13];
  uint64_t v7 = v13;
  if (v7)
  {
    uint64_t v8 = v7;
    double v9 = HFLogForCategory(0xBuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
      v15 = v8;
      int v10 = "AudioSession error setting category - [%@]";
LABEL_9:
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  [v4 setInterruptionFadeDuration:&unk_26C0F7FB8 error:0];
  id v12 = 0;
  [v4 setActive:1 error:&v12];
  id v11 = v12;
  if (v11)
  {
    uint64_t v8 = v11;
    double v9 = HFLogForCategory(0xBuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
      v15 = v8;
      int v10 = "AudioSession error activating audio session - [%@]";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  [(HFAudioRecorder *)self setAudioSessionIsActive:1];
  uint64_t v8 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)AudioStreamBasicDescription buf = 0;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "AudioSession activated  successfully", buf, 2u);
  }
LABEL_11:
}

- (void)_deactivateRecordingAudioSession
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)AudioStreamBasicDescription buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Releasing Audio Session", buf, 2u);
  }

  id v4 = [MEMORY[0x263EF93E0] sharedInstance];
  id v7 = 0;
  [v4 setActive:0 withOptions:1 error:&v7];
  id v5 = v7;
  if (v5)
  {
    uint64_t v6 = HFLogForCategory(0xBuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Error Deactivating audio session - [%@]", buf, 0xCu);
    }
  }
  [(HFAudioRecorder *)self setAudioSessionIsActive:0];
}

- (void)_cleanup
{
  [(HFAudioRecorder *)self setRecording:0];
  [(HFAudioRecorder *)self setRecordingAudiofileID:0];
  [(HFAudioRecorder *)self setRecordingAudiofileURL:0];
  [(HFAudioRecorder *)self setTotalPacketsCount:0];
  [(HFAudioRecorder *)self setRecordingStartTimeInterval:0.0];
  [(HFAudioRecorder *)self setRecordingStopTimeInterval:0.0];
  id v3 = HFLogForCategory(0xBuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up current recording session is now complete", v4, 2u);
  }
}

- (void)_startPowerMeteringTimer
{
  id v3 = [(HFAudioRecorder *)self powerMeteringTimer];

  if (v3) {
    [(HFAudioRecorder *)self _stopPowerMeteringTimer];
  }
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  [(HFAudioRecorder *)self setPowerMeteringTimer:v4];

  id v5 = [(HFAudioRecorder *)self powerMeteringTimer];
  dispatch_source_set_timer(v5, 0, 0x3F940AAuLL, 0);

  objc_initWeak(&location, self);
  uint64_t v6 = [(HFAudioRecorder *)self powerMeteringTimer];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __43__HFAudioRecorder__startPowerMeteringTimer__block_invoke;
  id v11 = &unk_26408E550;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v6, &v8);

  id v7 = [(HFAudioRecorder *)self powerMeteringTimer];
  dispatch_resume(v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __43__HFAudioRecorder__startPowerMeteringTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained audioRecorder];
  [v1 updateMeters];

  uint64_t v2 = [WeakRetained audioRecorder];
  [v2 averagePowerForChannel:0];
  int v4 = v3;

  id v5 = [WeakRetained audioRecorderDelegate];
  if ([v5 conformsToProtocol:&unk_26C182700])
  {
    uint64_t v6 = [WeakRetained audioRecorderDelegate];
    char v7 = objc_opt_respondsToSelector();

    uint64_t v8 = WeakRetained;
    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
    id v5 = [WeakRetained audioRecorderDelegate];
    LODWORD(v9) = v4;
    [v5 didUpdateAveragePower:v9];
  }

  uint64_t v8 = WeakRetained;
LABEL_5:
}

- (void)_stopPowerMeteringTimer
{
  if ([(HFAudioRecorder *)self _isPowerMeteringTimerValid])
  {
    int v3 = [(HFAudioRecorder *)self powerMeteringTimer];
    dispatch_source_cancel(v3);
  }
}

- (BOOL)_isPowerMeteringTimerValid
{
  int v3 = [(HFAudioRecorder *)self powerMeteringTimer];
  if (v3)
  {
    int v4 = [(HFAudioRecorder *)self powerMeteringTimer];
    BOOL v5 = dispatch_source_testcancel(v4) == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_createSystemSounds
{
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v3 = [v7 pathForResource:@"mic_open-Announce" ofType:@"wav"];
  CFURLRef v4 = [NSURL fileURLWithPath:v3];
  BOOL v5 = [v7 pathForResource:@"mic_closed-Announce" ofType:@"wav"];
  CFURLRef v6 = [NSURL fileURLWithPath:v5];
  AudioServicesCreateSystemSoundID(v4, &self->_soundIDForRecordBegin);
  AudioServicesCreateSystemSoundID(v6, &self->_soundIDForRecordEnd);
}

- (void)_playStartRecordingToneWithCompletion:(id)a3
{
}

- (void)_playStopRecordingToneWithCompletion:(id)a3
{
}

- (double)recordingDurationLimit
{
  return self->_recordingDurationLimit;
}

- (void)setRecordingDurationLimit:(double)a3
{
  self->_recordingDurationLimit = a3;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (unint64_t)recordingStopSource
{
  return self->_recordingStopSource;
}

- (void)setRecordingStopSource:(unint64_t)a3
{
  self->_recordingStopSource = a3;
}

- (NSNumber)routeChangeReason
{
  return self->_routeChangeReason;
}

- (void)setRouteChangeReason:(id)a3
{
}

- (HFAudioRecorderDelegate)audioRecorderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioRecorderDelegate);
  return (HFAudioRecorderDelegate *)WeakRetained;
}

- (void)setAudioRecorderDelegate:(id)a3
{
}

- (OS_dispatch_source)powerMeteringTimer
{
  return self->_powerMeteringTimer;
}

- (void)setPowerMeteringTimer:(id)a3
{
}

- (BOOL)isAudioSessionActive
{
  return self->_audioSessionIsActive;
}

- (void)setAudioSessionIsActive:(BOOL)a3
{
  self->_audioSessionIsActive = a3;
}

- (AVAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAudioRecorder:(id)a3
{
}

- (double)recordingStartTimeInterval
{
  return self->_recordingStartTimeInterval;
}

- (void)setRecordingStartTimeInterval:(double)a3
{
  self->_recordingStartTimeInterval = a3;
}

- (double)recordingStopTimeInterval
{
  return self->_recordingStopTimeInterval;
}

- (void)setRecordingStopTimeInterval:(double)a3
{
  self->_recordingStopTimeInterval = a3;
}

- (OpaqueAudioFileID)recordingAudiofileID
{
  return self->_recordingAudiofileID;
}

- (void)setRecordingAudiofileID:(OpaqueAudioFileID *)a3
{
  self->_recordingAudiofileID = a3;
}

- (NSURL)recordingAudiofileURL
{
  return self->_recordingAudiofileURL;
}

- (void)setRecordingAudiofileURL:(id)a3
{
}

- (int64_t)totalPacketsCount
{
  return self->_totalPacketsCount;
}

- (void)setTotalPacketsCount:(int64_t)a3
{
  self->_totalPacketsCount = a3;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (unsigned)soundIDForRecordBegin
{
  return self->_soundIDForRecordBegin;
}

- (void)setSoundIDForRecordBegin:(unsigned int)a3
{
  self->_soundIDForRecordBegin = a3;
}

- (unsigned)soundIDForRecordEnd
{
  return self->_soundIDForRecordEnd;
}

- (void)setSoundIDForRecordEnd:(unsigned int)a3
{
  self->_soundIDForRecordEnd = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_recordingAudiofileURL, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_powerMeteringTimer, 0);
  objc_destroyWeak((id *)&self->_audioRecorderDelegate);
  objc_storeStrong((id *)&self->_routeChangeReason, 0);
}

@end
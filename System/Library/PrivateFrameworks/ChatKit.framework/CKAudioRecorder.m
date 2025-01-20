@interface CKAudioRecorder
- (BOOL)isCancelled;
- (BOOL)isPaused;
- (BOOL)isRecording;
- (BOOL)shouldPlayStartSound;
- (BOOL)shouldPlayStopSound;
- (CKAudioRecorder)init;
- (CKAudioRecorderDelegate)delegate;
- (CKVoiceController)voiceController;
- (NSDate)startDate;
- (NSURL)fileURL;
- (OpaqueAudioFileID)fileID;
- (double)duration;
- (float)averagePower;
- (id)completion;
- (int64_t)totalPacketsCount;
- (void)applicationDidEnterBackground:(id)a3;
- (void)cancelRecording;
- (void)createNewAudioFile;
- (void)dealloc;
- (void)openExistingAudioFile;
- (void)resetState;
- (void)resumeRecording;
- (void)setCancelled:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileID:(OpaqueAudioFileID *)a3;
- (void)setFileURL:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRecording:(BOOL)a3;
- (void)setShouldPlayStartSound:(BOOL)a3;
- (void)setShouldPlayStopSound:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setTotalPacketsCount:(int64_t)a3;
- (void)setVoiceController:(id)a3;
- (void)startRecordingAndPlaySound:(BOOL)a3;
- (void)startRecordingForRaiseGesture;
- (void)startRecordingForRaiseGesture:(BOOL)a3 shouldPlaySound:(BOOL)a4;
- (void)stopRecording:(id)a3;
- (void)stopRecordingAndPlaySound:(BOOL)a3 completion:(id)a4;
- (void)voiceController:(id)a3 didUpdateAveragePower:(float)a4;
- (void)voiceControllerDidFinishRecording:(id)a3 successfully:(BOOL)a4;
- (void)voiceControllerDidStartRecording:(id)a3;
- (void)voiceControllerRecordBufferAvailable:(id)a3 buffer:(id)a4;
@end

@implementation CKAudioRecorder

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CKVoiceController *)self->_voiceController setDelegate:0];
  [(CKVoiceController *)self->_voiceController releaseAudioSession];
  v4 = [MEMORY[0x1E4F42738] sharedApplication];
  [v4 setIdleTimerDisabled:0];

  v5.receiver = self;
  v5.super_class = (Class)CKAudioRecorder;
  [(CKAudioRecorder *)&v5 dealloc];
}

- (CKAudioRecorder)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKAudioRecorder;
  v2 = [(CKAudioRecorder *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4F43660] object:0];
    [(CKAudioRecorder *)v2 resetState];
  }
  return v2;
}

- (double)duration
{
  v2 = [(CKAudioRecorder *)self startDate];
  if (v2)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = v3;
    [v2 timeIntervalSinceReferenceDate];
    double v6 = v4 - v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void)startRecordingForRaiseGesture
{
}

- (void)startRecordingAndPlaySound:(BOOL)a3
{
}

- (void)startRecordingForRaiseGesture:(BOOL)a3 shouldPlaySound:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = v5;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "startRecordingForRaiseGesture: %d", buf, 8u);
    }
  }
  [(CKAudioRecorder *)self setRecording:1];
  v8 = [MEMORY[0x1E4F42738] sharedApplication];
  [v8 setIdleTimerDisabled:1];

  if (v5) {
    uint64_t v9 = 1768764005;
  }
  else {
    uint64_t v9 = 1768780647;
  }
  [(CKAudioRecorder *)self setShouldPlayStartSound:v4 & ~v5];
  v10 = [(CKAudioRecorder *)self voiceController];
  v11 = v10;
  if (v10)
  {
    [(CKVoiceController *)v10 setActivationMode:v9];
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4F15270];
    v17[0] = *MEMORY[0x1E4F151C0];
    v17[1] = v12;
    v18[0] = &unk_1EDF16880;
    v18[1] = &unk_1EDF172D8;
    uint64_t v13 = *MEMORY[0x1E4F15228];
    v17[2] = *MEMORY[0x1E4F151E0];
    v17[3] = v13;
    v18[2] = &unk_1EDF16898;
    v18[3] = &unk_1EDF168B0;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
    v15 = [CKVoiceController alloc];
    v16 = +[CKAudioSessionController queue];
    v11 = [(CKVoiceController *)v15 initWithActivationMode:v9 recordSettings:v14 queue:v16];

    [(CKVoiceController *)v11 setDelegate:self];
    [(CKAudioRecorder *)self setVoiceController:v11];
  }
  if ([(CKAudioRecorder *)self isPaused]) {
    [(CKAudioRecorder *)self openExistingAudioFile];
  }
  else {
    [(CKAudioRecorder *)self createNewAudioFile];
  }
  [(CKVoiceController *)v11 record];
}

- (void)openExistingAudioFile
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  AudioFileID outAudioFile = [(CKAudioRecorder *)self fileID];
  CFURLRef v3 = [(CKAudioRecorder *)self fileURL];
  OSStatus v4 = AudioFileOpenURL(v3, kAudioFileReadWritePermission, 0x63616666u, &outAudioFile);

  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v4 userInfo:0];
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "AudioFileOpenURL error %@", buf, 0xCu);
      }
    }
    v8 = [(CKAudioRecorder *)self voiceController];
    [(CKAudioRecorder *)self voiceControllerDidFinishRecording:v8 successfully:0];
  }
  else
  {
    if (v5)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [(CKAudioRecorder *)self fileURL];
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Opened existing audio file with fileURL: %@", buf, 0xCu);
      }
    }
    [(CKAudioRecorder *)self setFileID:outAudioFile];
  }
}

- (void)createNewAudioFile
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  AudioFileID outAudioFile = 0;
  CFURLRef v3 = CKAttachmentTmpFileURL(@"Audio Message.caf");
  OSStatus v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = [v3 URLByDeletingLastPathComponent];
  id v20 = 0;
  [v4 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v6 = v20;

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = [v3 URLByDeletingLastPathComponent];
        LODWORD(buf.mSampleRate) = 138412546;
        *(void *)((char *)&buf.mSampleRate + 4) = v8;
        LOWORD(buf.mFormatFlags) = 2112;
        *(void *)((char *)&buf.mFormatFlags + 2) = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "-[NSFileManager createDirectoryAtURL:%@ withIntermediateDirectories:YES...] failed with error %@", (uint8_t *)&buf, 0x16u);
      }
    }
    uint64_t v9 = [(CKAudioRecorder *)self voiceController];
    [(CKAudioRecorder *)self voiceControllerDidFinishRecording:v9 successfully:0];

    goto LABEL_24;
  }
  memset(&buf.mFormatID, 0, 32);
  buf.mSampleRate = 24000.0;
  buf.mChannelsPerFrame = 1;
  buf.mFormatID = 1869641075;
  buf.mFramesPerPacket = 480;
  UInt32 ioPropertyDataSize = 40;
  OSStatus Property = AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &buf);
  if (Property)
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:Property userInfo:0];
        *(_DWORD *)v22 = 138412290;
        v23 = v12;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "AudioFormatGetProperty failed with error %@", v22, 0xCu);
      }
    }
LABEL_12:
    uint64_t v13 = [(CKAudioRecorder *)self voiceController];
    [(CKAudioRecorder *)self voiceControllerDidFinishRecording:v13 successfully:0];

    goto LABEL_24;
  }
  OSStatus v14 = AudioFileCreateWithURL((CFURLRef)v3, 0x63616666u, &buf, 3u, &outAudioFile);
  int v15 = IMOSLoggingEnabled();
  if (v14)
  {
    if (v15)
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
        *(_DWORD *)v22 = 138412290;
        v23 = v17;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "AudioFileCreateWithURL error %@", v22, 0xCu);
      }
    }
    goto LABEL_12;
  }
  if (v15)
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v22 = 138412290;
      v23 = v3;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Created new audio file with fileURL: %@", v22, 0xCu);
    }
  }
  [(CKAudioRecorder *)self setFileURL:v3];
  [(CKAudioRecorder *)self setFileID:outAudioFile];
LABEL_24:
}

- (void)stopRecording:(id)a3
{
}

- (void)stopRecordingAndPlaySound:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = _Block_copy(v6);
      v17[0] = 67109890;
      v17[1] = v4;
      __int16 v18 = 2112;
      v19 = v8;
      __int16 v20 = 1024;
      BOOL v21 = [(CKAudioRecorder *)self isCancelled];
      __int16 v22 = 1024;
      BOOL v23 = [(CKAudioRecorder *)self isRecording];
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "stopRecordingAndPlaySound: %d completion: %@ (cancelled: %d isRecording: %d)", (uint8_t *)v17, 0x1Eu);
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F42738] sharedApplication];
  [v9 setIdleTimerDisabled:0];

  if ([(CKAudioRecorder *)self isRecording])
  {
    v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    char v11 = [v10 isAudioMessagesEntryViewRecordingEnabled];

    if ((v11 & 1) != 0
      || ([(CKAudioRecorder *)self completion],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = v12 == 0,
          v12,
          v13))
    {
      [(CKAudioRecorder *)self setShouldPlayStopSound:v4];
      [(CKAudioRecorder *)self setCompletion:v6];
      v16 = [(CKAudioRecorder *)self voiceController];
      [v16 stop];
    }
    else if (IMOSLoggingEnabled())
    {
      OSStatus v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "No-op already stopped recording", (uint8_t *)v17, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17[0]) = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Can't stop audio recording which hasn't started", (uint8_t *)v17, 2u);
      }
    }
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)cancelRecording
{
  if (IMOSLoggingEnabled())
  {
    CFURLRef v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)AudioStreamBasicDescription buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Cancel recording", buf, 2u);
    }
  }
  BOOL v4 = [(CKAudioRecorder *)self completion];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "No-op already stopped recording", v6, 2u);
      }
    }
  }
  else
  {
    [(CKAudioRecorder *)self setCancelled:1];
    [(CKAudioRecorder *)self stopRecording:0];
  }
}

- (void)voiceControllerDidStartRecording:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3);
  [(CKAudioRecorder *)self setStartDate:v4];

  int v5 = [(CKAudioRecorder *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CKAudioRecorder *)self delegate];
    [v7 audioRecorderDidStartRecording:self];
  }
  if ([(CKAudioRecorder *)self shouldPlayStartSound])
  {
    id v8 = [(CKAudioRecorder *)self voiceController];
    [v8 playAlertSoundForType:1];
  }
}

- (void)voiceControllerDidFinishRecording:(id)a3 successfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)AudioStreamBasicDescription buf = 67109120;
      BOOL v29 = v4;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "voiceControllerDidFinishRecording:successfully: %d", buf, 8u);
    }
  }
  if (v4)
  {
    [(CKAudioRecorder *)self duration];
    if (v8 < 0.5)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)AudioStreamBasicDescription buf = 0;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Recording cancelled because it is too short.", buf, 2u);
        }
      }
      [(CKAudioRecorder *)self setCancelled:1];
    }
  }
  v10 = [(CKAudioRecorder *)self fileURL];
  char v11 = [(CKAudioRecorder *)self fileID];
  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)AudioStreamBasicDescription buf = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Closing Audio File", buf, 2u);
      }
    }
    AudioFileClose(v11);
  }
  if (v4 && ![(CKAudioRecorder *)self isCancelled])
  {
    uint64_t v26 = *MEMORY[0x1E4F6D3A0];
    uint64_t v27 = MEMORY[0x1E4F1CC38];
    OSStatus v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    int v15 = +[CKMediaObjectManager sharedInstance];
    v16 = [v15 mediaObjectWithFileURL:v10 filename:0 transcoderUserInfo:v14];

    [v16 setTemporaryFileURL:v10];
    objc_msgSend(v16, "setTotalPacketsCount:", -[CKAudioRecorder totalPacketsCount](self, "totalPacketsCount"));
    BOOL v13 = +[CKComposition audioCompositionWithMediaObject:v16];
  }
  else
  {
    BOOL v13 = 0;
  }
  v17 = [(CKAudioRecorder *)self voiceController];
  if ([(CKAudioRecorder *)self shouldPlayStopSound])
  {
    if (v4)
    {
      if ([(CKAudioRecorder *)self isCancelled]) {
        uint64_t v18 = 3;
      }
      else {
        uint64_t v18 = 2;
      }
    }
    else
    {
      uint64_t v18 = 3;
    }
    [v17 playAlertSoundForType:v18];
  }
  [v17 releaseAudioSession];
  [(CKAudioRecorder *)self setRecording:0];
  uint64_t v19 = [(CKAudioRecorder *)self completion];
  __int16 v20 = (void *)v19;
  if (v19) {
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v13);
  }
  if (!v4)
  {
    BOOL v21 = [(CKAudioRecorder *)self delegate];
    [v21 audioRecorderRecordingDidFail:self];
  }
  __int16 v22 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v23 = [v22 isAudioMessagesEntryViewRecordingEnabled];

  if (v23)
  {
    if (![(CKAudioRecorder *)self isPaused] || [(CKAudioRecorder *)self isCancelled])
    {
      [(CKAudioRecorder *)self resetState];
      uint64_t v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v24 removeItemAtURL:v10 error:0];
    }
  }
  else
  {
    uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v25 removeItemAtURL:v10 error:0];

    [(CKAudioRecorder *)self resetState];
  }
}

- (void)voiceControllerRecordBufferAvailable:(id)a3 buffer:(id)a4
{
  *(void *)&v25[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 packetDescriptionCount];
  UInt32 v9 = [v7 bytesDataSize];
  UInt32 v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = [v7 packetDescriptions];
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = *(void *)v11;
      if ((*(void *)v11 & 0x8000000000000000) != 0)
      {
        if ((IMOSLoggingEnabled() & 1) == 0) {
          goto LABEL_20;
        }
        v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = [NSNumber numberWithLongLong:v13];
          *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
          *(void *)uint64_t v25 = v17;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Bad packet start offset %@. Skipping rest of record buffer.", buf, 0xCu);
        }
        goto LABEL_19;
      }
      uint64_t v14 = *(unsigned int *)(v11 + 12);
      if (v14 > v10) {
        break;
      }
      ++v12;
      v11 += 16;
      if (v8 == v12)
      {
        LODWORD(v12) = v8;
        goto LABEL_20;
      }
    }
    if ((IMOSLoggingEnabled() & 1) == 0) {
      goto LABEL_20;
    }
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = [NSNumber numberWithUnsignedInt:v14];
      *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
      *(void *)uint64_t v25 = v18;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Bad packet size %@. Skipping rest of record buffer.", buf, 0xCu);
    }
LABEL_19:

LABEL_20:
    UInt32 ioNumPackets = v12;
    SInt64 v19 = [(CKAudioRecorder *)self totalPacketsCount];
    OSStatus v20 = AudioFileWritePackets(-[CKAudioRecorder fileID](self, "fileID"), 0, v10, (const AudioStreamPacketDescription *)[v7 packetDescriptions], v19, &ioNumPackets, (const void *)objc_msgSend(v7, "data"));
    if (v20 && IMOSLoggingEnabled())
    {
      BOOL v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        __int16 v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v20 userInfo:0];
        *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
        *(void *)uint64_t v25 = v22;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "AudioFileWritePackets failed with error %@", buf, 0xCu);
      }
    }
    [(CKAudioRecorder *)self setTotalPacketsCount:v19 + ioNumPackets];
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)AudioStreamBasicDescription buf = 67109376;
      v25[0] = v8;
      LOWORD(v25[1]) = 1024;
      *(_DWORD *)((char *)&v25[1] + 2) = v10;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "AVVCAudioBuffer contains %d packet descriptions, size %d. Ignoring", buf, 0xEu);
    }
  }
}

- (void)voiceController:(id)a3 didUpdateAveragePower:(float)a4
{
  id v6 = [(CKAudioRecorder *)self delegate];
  *(float *)&double v5 = a4;
  [v6 audioRecorderDidUpdateAveragePower:v5];
}

- (void)resumeRecording
{
  if ([(CKAudioRecorder *)self isPaused])
  {
    [(CKAudioRecorder *)self startRecordingForRaiseGesture:0 shouldPlaySound:1];
  }
  else if (IMOSLoggingEnabled())
  {
    CFURLRef v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Cannot resume recording because the recording is not paused.", v4, 2u);
    }
  }
}

- (float)averagePower
{
  v2 = [(CKAudioRecorder *)self voiceController];
  [v2 averagePower];
  float v4 = v3;

  return v4;
}

- (void)setRecording:(BOOL)a3
{
  if (self->_recording != a3)
  {
    self->_recording = a3;
    id v4 = [(CKAudioRecorder *)self delegate];
    [v4 audioRecorderRecordingDidChange:self];
  }
}

- (void)resetState
{
  if (IMOSLoggingEnabled())
  {
    float v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Reseting audio recorder state", v6, 2u);
    }
  }
  id v4 = [(CKAudioRecorder *)self voiceController];
  [v4 setDelegate:0];

  double v5 = [(CKAudioRecorder *)self voiceController];
  [v5 cleanup];

  [(CKAudioRecorder *)self setVoiceController:0];
  [(CKAudioRecorder *)self setRecording:0];
  [(CKAudioRecorder *)self setCancelled:0];
  [(CKAudioRecorder *)self setFileURL:0];
  [(CKAudioRecorder *)self setStartDate:0];
  [(CKAudioRecorder *)self setCompletion:0];
  [(CKAudioRecorder *)self setShouldPlayStopSound:0];
  [(CKAudioRecorder *)self setFileID:0];
  [(CKAudioRecorder *)self setTotalPacketsCount:0];
  [(CKAudioRecorder *)self setPaused:0];
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  char v5 = [v4 isAudioMessagesEntryViewRecordingEnabled];

  if ((v5 & 1) == 0 && [(CKAudioRecorder *)self isRecording])
  {
    [(CKAudioRecorder *)self cancelRecording];
  }
}

- (CKAudioRecorderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAudioRecorderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
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

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (CKVoiceController)voiceController
{
  return self->_voiceController;
}

- (void)setVoiceController:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (BOOL)shouldPlayStartSound
{
  return self->_shouldPlayStartSound;
}

- (void)setShouldPlayStartSound:(BOOL)a3
{
  self->_shouldPlayStartSound = a3;
}

- (BOOL)shouldPlayStopSound
{
  return self->_shouldPlayStopSound;
}

- (void)setShouldPlayStopSound:(BOOL)a3
{
  self->_shouldPlayStopSound = a3;
}

- (OpaqueAudioFileID)fileID
{
  return self->_fileID;
}

- (void)setFileID:(OpaqueAudioFileID *)a3
{
  self->_fileID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_voiceController, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
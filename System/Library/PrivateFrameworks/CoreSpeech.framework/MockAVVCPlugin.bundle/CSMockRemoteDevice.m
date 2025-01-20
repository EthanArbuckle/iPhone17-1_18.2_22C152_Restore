@interface CSMockRemoteDevice
+ (id)opusAudioFormat;
- (AVAudioFormat)format;
- (BOOL)isRecording;
- (CSMockRemoteDevice)initWithDeviceName:(id)a3;
- (CSMockRemotePlugin)plugin;
- (NSArray)supportedFormats;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (NSString)identifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)audioFeedTimer;
- (OS_os_log)logger;
- (OpaqueAudioFileID)audioFile;
- (id)audioInputBlock;
- (id)deviceUUID;
- (unint64_t)totalAudioPacketCount;
- (unsigned)readAudioPacketCount;
- (void)_readAudioBufferAndFeed;
- (void)_startAudioFeedingTimer;
- (void)injectAudioWithURL:(id)a3;
- (void)invalidate;
- (void)setAudioFeedTimer:(id)a3;
- (void)setAudioFile:(OpaqueAudioFileID *)a3;
- (void)setAudioInputBlock:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setFormat:(id)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReadAudioPacketCount:(unsigned int)a3;
- (void)setSupportedFormats:(id)a3;
- (void)setTotalAudioPacketCount:(unint64_t)a3;
- (void)speakAudio:(id)a3 playbackStarted:(id)a4 completion:(id)a5;
- (void)startRecordingWithCompletionBlock:(id)a3;
- (void)stopRecordingWithCompletionBlock:(id)a3;
@end

@implementation CSMockRemoteDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_audioFeedTimer, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_plugin);
  objc_storeStrong((id *)&self->format, 0);
  objc_storeStrong((id *)&self->supportedFormats, 0);
  objc_storeStrong(&self->audioInputBlock, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setDeviceName:(id)a3
{
}

- (void)setAudioFeedTimer:(id)a3
{
}

- (OS_dispatch_source)audioFeedTimer
{
  return self->_audioFeedTimer;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setReadAudioPacketCount:(unsigned int)a3
{
  self->_readAudioPacketCount = a3;
}

- (unsigned)readAudioPacketCount
{
  return self->_readAudioPacketCount;
}

- (void)setTotalAudioPacketCount:(unint64_t)a3
{
  self->_totalAudioPacketCount = a3;
}

- (unint64_t)totalAudioPacketCount
{
  return self->_totalAudioPacketCount;
}

- (void)setAudioFile:(OpaqueAudioFileID *)a3
{
  self->_audioFile = a3;
}

- (OpaqueAudioFileID)audioFile
{
  return self->_audioFile;
}

- (void)setLogger:(id)a3
{
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setPlugin:(id)a3
{
}

- (CSMockRemotePlugin)plugin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plugin);
  return (CSMockRemotePlugin *)WeakRetained;
}

- (void)setFormat:(id)a3
{
}

- (AVAudioFormat)format
{
  return self->format;
}

- (void)setSupportedFormats:(id)a3
{
}

- (NSArray)supportedFormats
{
  return self->supportedFormats;
}

- (void)setAudioInputBlock:(id)a3
{
}

- (id)audioInputBlock
{
  return self->audioInputBlock;
}

- (void)invalidate
{
  logger = self->_logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, (os_log_t)logger, OS_LOG_TYPE_DEFAULT, "Invalidate MockRemoteDevice", v5, 2u);
  }
  audioFile = self->_audioFile;
  if (audioFile) {
    AudioFileClose(audioFile);
  }
  [(CSMockRemoteDevice *)self setPlugin:0];
}

- (void)_readAudioBufferAndFeed
{
  UInt32 ioNumBytes = 100;
  UInt32 ioNumPackets = 1;
  outPacketDescriptions.mStartOffset = 0;
  *(void *)&outPacketDescriptions.mVariableFramesInPacket = 0;
  AudioFileReadPacketData(self->_audioFile, 1u, &ioNumBytes, &outPacketDescriptions, self->_readAudioPacketCount, &ioNumPackets, outBuffer);
  unint64_t v3 = self->_readAudioPacketCount + ioNumPackets;
  if (self->_totalAudioPacketCount <= v3) {
    LODWORD(v3) = 0;
  }
  self->_readAudioPacketCount = v3;
  v4 = [(CSMockRemoteDevice *)self audioInputBlock];
  if (v4)
  {
    BOOL isRecording = self->_isRecording;

    if (isRecording)
    {
      v6 = +[NSData dataWithBytes:outBuffer length:ioNumBytes];
      uint64_t v7 = ioNumBytes;
      id v8 = objc_alloc((Class)AVAudioCompressedBuffer);
      v9 = [(CSMockRemoteDevice *)self format];
      id v10 = [v8 initWithFormat:v9 packetCapacity:1 maximumPacketSize:94];

      objc_msgSend(v6, "getBytes:range:", objc_msgSend(v10, "data"), 0, (int)v7);
      v11 = (AudioStreamPacketDescription *)[v10 packetDescriptions];
      AudioStreamPacketDescription *v11 = outPacketDescriptions;
      [v10 setPacketCount:ioNumPackets];
      [v10 setByteLength:v7];
      uint64_t v18 = AVAudioRemoteInputBufferGainKey;
      v19 = &off_8538;
      v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v13 = [objc_alloc((Class)AVAudioTime) initWithHostTime:mach_absolute_time()];
      v14 = [(CSMockRemoteDevice *)self audioInputBlock];
      ((void (**)(void, id, id, void *))v14)[2](v14, v10, v13, v12);
    }
  }
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4FB0;
  v7[3] = &unk_8470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_startAudioFeedingTimer
{
  unint64_t v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  audioFeedTimer = self->_audioFeedTimer;
  self->_audioFeedTimer = v3;

  dispatch_source_set_timer((dispatch_source_t)self->_audioFeedTimer, 0, 0x26259FFuLL, 0x5F5E100uLL);
  [(CSMockRemoteDevice *)self setIsRecording:1];
  self->_readAudioPacketCount = 0;
  objc_initWeak(&location, self);
  v5 = self->_audioFeedTimer;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_511C;
  v6[3] = &unk_8498;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume((dispatch_object_t)self->_audioFeedTimer);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)startRecordingWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_51F4;
  v7[3] = &unk_8470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (NSString)deviceIdentifier
{
  return self->_deviceName;
}

- (id)deviceUUID
{
  return self->_uuid;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)injectAudioWithURL:(id)a3
{
  id v4 = a3;
  logger = self->_logger;
  BOOL v6 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v6) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v15 = "URL was nil";
    v16 = logger;
    uint32_t v17 = 2;
LABEL_9:
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_14;
  }
  if (v6)
  {
    id v7 = logger;
    id v8 = [v4 path];
    *(_DWORD *)buf = 138412290;
    unint64_t v25 = (unint64_t)v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Trying to open url: %@", buf, 0xCu);
  }
  OSStatus v9 = AudioFileOpenURL((CFURLRef)v4, kAudioFileReadPermission, 0, &self->_audioFile);
  if (v9)
  {
    OSStatus v10 = v9;
    v11 = self->_logger;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      id v13 = [v4 path];
      *(_DWORD *)buf = 138412546;
      unint64_t v25 = (unint64_t)v13;
      __int16 v26 = 1024;
      OSStatus v27 = v10;
      v14 = "Error opening file : %@ : %d";
LABEL_13:
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x12u);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  UInt32 ioDataSize = 8;
  p_totalAudioPacketCount = &self->_totalAudioPacketCount;
  OSStatus Property = AudioFileGetProperty(self->_audioFile, 0x70636E74u, &ioDataSize, &self->_totalAudioPacketCount);
  v20 = self->_logger;
  BOOL v21 = os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT);
  if (!Property)
  {
    if (!v21) {
      goto LABEL_14;
    }
    unint64_t v22 = *p_totalAudioPacketCount;
    *(_DWORD *)buf = 134217984;
    unint64_t v25 = v22;
    v15 = "total packet count : %llu";
    v16 = v20;
    uint32_t v17 = 12;
    goto LABEL_9;
  }
  if (v21)
  {
    v12 = v20;
    id v13 = [v4 path];
    *(_DWORD *)buf = 138412546;
    unint64_t v25 = (unint64_t)v13;
    __int16 v26 = 1024;
    OSStatus v27 = Property;
    v14 = "Error getting packet count for file : %@ : %d";
    goto LABEL_13;
  }
LABEL_14:
}

- (void)speakAudio:(id)a3 playbackStarted:(id)a4 completion:(id)a5
{
  OSStatus v9 = (void (**)(id, void))a5;
  id v8 = (void (**)(id, void))a4;
  [(CSMockRemoteDevice *)self injectAudioWithURL:a3];
  v8[2](v8, 0);

  v9[2](v9, 0);
}

- (CSMockRemoteDevice)initWithDeviceName:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSMockRemoteDevice;
  BOOL v6 = [(CSMockRemoteDevice *)&v17 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("CSMockRemoteDevice", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    os_log_t v9 = os_log_create("com.apple.corespeech", "remote_mock_device");
    logger = v6->_logger;
    v6->_logger = (OS_os_log *)v9;

    objc_storeStrong((id *)&v6->_deviceName, a3);
    uint64_t v11 = +[NSUUID UUID];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v11;
  }
  [(CSMockRemoteDevice *)v6 setIsRecording:0];
  id v13 = +[CSMockRemoteDevice opusAudioFormat];
  uint64_t v18 = v13;
  v14 = +[NSArray arrayWithObjects:&v18 count:1];
  [(CSMockRemoteDevice *)v6 setSupportedFormats:v14];

  v15 = +[CSMockRemoteDevice opusAudioFormat];
  [(CSMockRemoteDevice *)v6 setFormat:v15];

  return v6;
}

+ (id)opusAudioFormat
{
  id v2 = [objc_alloc((Class)AVAudioFormat) initWithStreamDescription:&unk_D288];
  return v2;
}

@end
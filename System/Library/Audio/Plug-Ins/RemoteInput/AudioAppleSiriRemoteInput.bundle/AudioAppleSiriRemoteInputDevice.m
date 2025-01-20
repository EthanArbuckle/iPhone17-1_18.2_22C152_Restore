@interface AudioAppleSiriRemoteInputDevice
- (AVAudioFormat)format;
- (AudioAppleSiriRemoteInputDevice)initWithInfo:(id)a3;
- (AudioAppleSiriRemoteInputPlugin)plugin;
- (NSArray)supportedFormats;
- (NSString)codec;
- (NSString)deviceIdentifier;
- (NSString)identifier;
- (NSString)remoteInputDeviceName;
- (NSString)resolvedDeviceIdentifier;
- (__CFDictionary)getMatchingDict:(int64_t)a3;
- (id)_audioBufferForFrame:(id)a3;
- (id)_audioTimeForFrame:(id)a3;
- (id)_gainForDoapFrame:(id)a3;
- (id)_gainForFrame:(id)a3;
- (id)_gainForTVRemoteFrame:(id)a3;
- (id)_qualityForSpeexFrame:(id)a3;
- (id)_supportedFormats;
- (id)audioInputBlock;
- (id)startCompletionBlock;
- (id)statusChangeBlock;
- (id)stopCompletionBlock;
- (int)frameLength;
- (int)frameLengthOffset;
- (int)rmsOffset;
- (int)timeOffset;
- (int64_t)deviceType;
- (unsigned)deviceCategory;
- (unsigned)doapCodecType;
- (unsigned)pidNum;
- (void)_processAudioFrame:(id)a3;
- (void)handleAudioFrameMsg:(id)a3;
- (void)handleStreamDidCancelMsg:(id)a3;
- (void)handleTransportDidStartMsg:(id)a3;
- (void)handleTransportDidStopMsg:(id)a3;
- (void)invalidate;
- (void)setAudioInputBlock:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setDoapCodecType:(unsigned __int8)a3;
- (void)setFormat:(id)a3;
- (void)setFrameLength:(int)a3;
- (void)setFrameLengthOffset:(int)a3;
- (void)setPidNum:(unsigned __int16)a3;
- (void)setPlugin:(id)a3;
- (void)setResolvedDeviceIdentifier:(id)a3;
- (void)setRmsOffset:(int)a3;
- (void)setStartCompletionBlock:(id)a3;
- (void)setStatusChangeBlock:(id)a3;
- (void)setStopCompletionBlock:(id)a3;
- (void)setSupportedFormats:(id)a3;
- (void)setTimeOffset:(int)a3;
- (void)startRecordingWithCompletionBlock:(id)a3;
- (void)stopRecordingWithCompletionBlock:(id)a3;
@end

@implementation AudioAppleSiriRemoteInputDevice

- (AudioAppleSiriRemoteInputDevice)initWithInfo:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)AudioAppleSiriRemoteInputDevice;
  v5 = [(AudioAppleSiriRemoteInputDevice *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kMsgDeviceType"];
    v5->_int64_t deviceType = (int64_t)[v6 integerValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"kMsgArgIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    switch(v5->_deviceType)
    {
      case 1:
        v9 = [v4 objectForKeyedSubscript:@"kMsgPidNum"];
        v5->_int pidNum = (unsigned __int16)[v9 unsignedShortValue];

        int pidNum = v5->_pidNum;
        if ((pidNum - 788) < 2 || pidNum == 621) {
          goto LABEL_7;
        }
        if (pidNum == 614)
        {
          codec = v5->_codec;
          int v12 = 76;
          int v13 = 74;
          v5->_codec = (NSString *)@"speex";
          int v14 = 70;
          uint64_t v15 = 24;
          uint64_t v16 = 20;
          uint64_t v17 = 12;
          goto LABEL_15;
        }
        v33 = v5->_codec;
        v5->_codec = (NSString *)@"unknown";

        if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
          sub_4EEC();
        }
        goto LABEL_24;
      case 2:
LABEL_7:
        int v14 = 0;
        codec = v5->_codec;
        int v12 = 4;
        v5->_codec = (NSString *)@"opus";
        goto LABEL_14;
      case 3:
        v18 = [v4 objectForKeyedSubscript:@"kMsgCodecType"];
        v5->_doapCodecType = [v18 unsignedShortValue];

        codec = v5->_codec;
        if (v5->_doapCodecType == 7) {
          goto LABEL_13;
        }
        v5->_codec = (NSString *)@"unknown";

        if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
          goto LABEL_10;
        }
        goto LABEL_24;
      case 4:
        if (!_os_feature_enabled_impl()) {
          goto LABEL_24;
        }
        v19 = [v4 objectForKeyedSubscript:@"kMsgCodecType"];
        v5->_doapCodecType = [v19 unsignedShortValue];

        codec = v5->_codec;
        if (v5->_doapCodecType == 7)
        {
LABEL_13:
          int v14 = 0;
          v5->_codec = (NSString *)@"opus";
          int v12 = 4;
LABEL_14:
          int v13 = 2;
          uint64_t v15 = 16;
          uint64_t v16 = 24;
          uint64_t v17 = 20;
LABEL_15:

          *(_DWORD *)((char *)&v5->super.isa + v17) = v14;
          *(_DWORD *)((char *)&v5->super.isa + v16) = v13;
          *(_DWORD *)((char *)&v5->super.isa + v15) = v12;
          uint64_t v20 = [(AudioAppleSiriRemoteInputDevice *)v5 _supportedFormats];
          supportedFormats = v5->supportedFormats;
          v5->supportedFormats = (NSArray *)v20;

          v22 = [(AudioAppleSiriRemoteInputDevice *)v5 supportedFormats];
          uint64_t v23 = [v22 objectAtIndexedSubscript:0];
          format = v5->format;
          v5->format = (AVAudioFormat *)v23;

          v25 = (void *)qword_D420;
          if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
          {
            int64_t deviceType = v5->_deviceType;
            v28 = v5->_identifier;
            v27 = v5->_codec;
            v29 = v25;
            v30 = [v4 description];
            *(_DWORD *)buf = 134218754;
            int64_t v37 = deviceType;
            __int16 v38 = 2112;
            v39 = v27;
            __int16 v40 = 2112;
            v41 = v28;
            __int16 v42 = 2112;
            v43 = v30;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Initialized AudioAppleSiriRemoteInputDevice type %lu, %@ codec with identifier %@, info %@", buf, 0x2Au);
          }
          goto LABEL_17;
        }
        v5->_codec = (NSString *)@"unknown";

        if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
LABEL_10:
        }
          sub_4F58();
LABEL_24:
        v31 = 0;
        break;
      default:
        v32 = (void *)qword_D420;
        if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
          sub_4E5C(v32);
        }
        goto LABEL_24;
    }
  }
  else
  {
LABEL_17:
    v31 = v5;
  }

  return v31;
}

- (__CFDictionary)getMatchingDict:(int64_t)a3
{
  if (a3 == 1)
  {
    id v4 = IOServiceMatching("IOHIDEventDriver");
    CFDictionarySetValue(v4, @"DeviceUsagePage", &off_8558);
    CFDictionarySetValue(v4, @"DeviceUsage", &off_8570);
  }
  else if (a3)
  {
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_4FC4();
    }
    return 0;
  }
  else
  {
    id v4 = IOServiceMatching("AppleEmbeddedBluetoothButtons");
    v5 = [(AudioAppleSiriRemoteInputDevice *)self identifier];
    CFDictionarySetValue(v4, @"PhysicalDeviceUniqueID", v5);
  }
  return v4;
}

- (NSString)deviceIdentifier
{
  if ((char *)[(AudioAppleSiriRemoteInputDevice *)self deviceType] - 1 >= (unsigned char *)&dword_0 + 2)
  {
    v3 = [(AudioAppleSiriRemoteInputDevice *)self identifier];
    goto LABEL_17;
  }
  id v4 = [(AudioAppleSiriRemoteInputDevice *)self resolvedDeviceIdentifier];

  if (v4) {
    goto LABEL_13;
  }
  uint64_t v5 = 0;
  char v6 = 1;
  while (1)
  {
    char v7 = v6;
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, [(AudioAppleSiriRemoteInputDevice *)self getMatchingDict:v5]);
    if (MatchingService) {
      break;
    }
LABEL_8:
    char v6 = 0;
    uint64_t v5 = 1;
    if ((v7 & 1) == 0) {
      goto LABEL_13;
    }
  }
  io_object_t v9 = MatchingService;
  uint64_t entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(MatchingService, &entryID))
  {
    IOObjectRelease(v9);
    goto LABEL_8;
  }
  v10 = +[NSNumber numberWithUnsignedLongLong:entryID];
  v11 = [v10 stringValue];
  [(AudioAppleSiriRemoteInputDevice *)self setResolvedDeviceIdentifier:v11];

  int v12 = (void *)qword_D420;
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = v12;
    int v14 = [(AudioAppleSiriRemoteInputDevice *)self identifier];
    uint64_t v15 = [(AudioAppleSiriRemoteInputDevice *)self resolvedDeviceIdentifier];
    *(_DWORD *)buf = 138412546;
    v21 = v14;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Device with identifier %@ resolved to %@", buf, 0x16u);
  }
  IOObjectRelease(v9);
LABEL_13:
  uint64_t v16 = [(AudioAppleSiriRemoteInputDevice *)self resolvedDeviceIdentifier];

  if (!v16)
  {
    uint64_t v17 = (void *)qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
      sub_5038(v17);
    }
  }
  v3 = [(AudioAppleSiriRemoteInputDevice *)self resolvedDeviceIdentifier];
LABEL_17:

  return (NSString *)v3;
}

- (unsigned)deviceCategory
{
  if ((char *)[(AudioAppleSiriRemoteInputDevice *)self deviceType] - 3 >= (unsigned char *)&dword_0 + 2) {
    return 1919513718;
  }
  else {
    return 1919510644;
  }
}

- (NSString)remoteInputDeviceName
{
  return +[NSString stringWithFormat:@"%d", [(AudioAppleSiriRemoteInputDevice *)self pidNum]];
}

- (void)startRecordingWithCompletionBlock:(id)a3
{
  [(AudioAppleSiriRemoteInputDevice *)self setStartCompletionBlock:a3];
  id v4 = [(AudioAppleSiriRemoteInputDevice *)self plugin];
  CFStringRef v7 = @"kMsgArgIdentifier";
  uint64_t v5 = [(AudioAppleSiriRemoteInputDevice *)self identifier];
  v8 = v5;
  char v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 sendMsg:@"StartStream" args:v6];
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  [(AudioAppleSiriRemoteInputDevice *)self setStopCompletionBlock:a3];
  id v4 = [(AudioAppleSiriRemoteInputDevice *)self plugin];
  CFStringRef v7 = @"kMsgArgIdentifier";
  uint64_t v5 = [(AudioAppleSiriRemoteInputDevice *)self identifier];
  v8 = v5;
  char v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v4 sendMsg:@"StopStream" args:v6];
}

- (void)handleTransportDidStartMsg:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AudioAppleSiriRemoteInputDevice *)self startCompletionBlock];

  if (v5)
  {
    char v6 = [v4 objectForKeyedSubscript:@"kMsgArgError"];
    if (v6)
    {
      id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:0];
      v8 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"kMsgArgError"];
    }
    else
    {
      v8 = 0;
    }
    v10 = [(AudioAppleSiriRemoteInputDevice *)self startCompletionBlock];
    ((void (**)(void, void *))v10)[2](v10, v8);

    v11 = qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      int v13 = v8;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "startCompletionBlock is successfully invoked with error %@", (uint8_t *)&v12, 0xCu);
    }
    [(AudioAppleSiriRemoteInputDevice *)self setStartCompletionBlock:0];
  }
  else
  {
    io_object_t v9 = qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "startCompletionBlock is nil", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)handleTransportDidStopMsg:(id)a3
{
  id v9 = a3;
  id v4 = [(AudioAppleSiriRemoteInputDevice *)self stopCompletionBlock];

  if (v4)
  {
    uint64_t v5 = [v9 objectForKeyedSubscript:@"kMsgArgError"];
    if (v5)
    {
      id v6 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:0];
      id v7 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"kMsgArgError"];
    }
    else
    {
      id v7 = 0;
    }
    v8 = [(AudioAppleSiriRemoteInputDevice *)self stopCompletionBlock];
    ((void (**)(void, void *))v8)[2](v8, v7);

    [(AudioAppleSiriRemoteInputDevice *)self setStopCompletionBlock:0];
  }
  [(AudioAppleSiriRemoteInputDevice *)self setStatusChangeBlock:0];
}

- (void)handleAudioFrameMsg:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"kMsgArgData"];
  [(AudioAppleSiriRemoteInputDevice *)self _processAudioFrame:v4];
}

- (void)handleStreamDidCancelMsg:(id)a3
{
  id v4 = [(AudioAppleSiriRemoteInputDevice *)self statusChangeBlock];

  if (v4)
  {
    uint64_t v5 = qword_D420;
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "handle stream Cancel message", v7, 2u);
    }
    id v6 = [(AudioAppleSiriRemoteInputDevice *)self statusChangeBlock];
    v6[2](v6, 1919115630, 0);

    [(AudioAppleSiriRemoteInputDevice *)self setStatusChangeBlock:0];
  }
}

- (void)invalidate
{
  [(AudioAppleSiriRemoteInputDevice *)self setStopCompletionBlock:0];
  [(AudioAppleSiriRemoteInputDevice *)self setStartCompletionBlock:0];

  [(AudioAppleSiriRemoteInputDevice *)self setPlugin:0];
}

- (id)_supportedFormats
{
  long long v14 = 0u;
  LODWORD(v14) = 1936745848;
  DWORD2(v14) = 70;
  v3 = [(AudioAppleSiriRemoteInputDevice *)self codec];
  unsigned __int8 v4 = [v3 isEqualToString:@"opus"];

  if (v4)
  {
    uint64_t v5 = &v12;
  }
  else
  {
    id v6 = [(AudioAppleSiriRemoteInputDevice *)self codec];
    unsigned __int8 v7 = [v6 isEqualToString:@"speex"];

    if (v7)
    {
      uint64_t v5 = &v13;
    }
    else
    {
      v8 = (void *)qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
        sub_50C8(v8);
      }
      uint64_t v5 = 0;
    }
  }
  id v9 = [objc_alloc((Class)AVAudioFormat) initWithStreamDescription:v5];
  id v15 = v9;
  v10 = +[NSArray arrayWithObjects:&v15 count:1];

  return v10;
}

- (void)_processAudioFrame:(id)a3
{
  id v4 = a3;
  if ([(AudioAppleSiriRemoteInputDevice *)self pidNum] == 621)
  {
    uint64_t v5 = [(AudioAppleSiriRemoteInputDevice *)self _audioBufferForFrame:v4];
    id v6 = [(AudioAppleSiriRemoteInputDevice *)self _audioTimeForFrame:v4];
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = [(AudioAppleSiriRemoteInputDevice *)self _gainForFrame:v4];
    [v7 setObject:v8 forKey:AVAudioRemoteInputBufferGainKey];

    id v9 = [(AudioAppleSiriRemoteInputDevice *)self codec];
    unsigned int v10 = [v9 isEqualToString:@"speex"];

    if (v10)
    {
      v11 = [(AudioAppleSiriRemoteInputDevice *)self _qualityForSpeexFrame:v4];
      [v7 setObject:v11 forKey:AVAudioRemoteInputBufferSpeexFrameQualitiesKey];
    }
    uint64_t v12 = [(AudioAppleSiriRemoteInputDevice *)self audioInputBlock];

    if (v12)
    {
      uint64_t v13 = [(AudioAppleSiriRemoteInputDevice *)self audioInputBlock];
      ((void (**)(void, void *, void *, id))v13)[2](v13, v5, v6, v7);
    }
    goto LABEL_31;
  }
  id v14 = [v4 length];
  if ((uint64_t)v14 < 6) {
    goto LABEL_31;
  }
  uint64_t v16 = (uint64_t)v14;
  uint64_t v40 = 0;
  uint64_t v17 = 0;
  uint64_t v39 = AVAudioRemoteInputBufferGainKey;
  uint64_t v38 = AVAudioRemoteInputBufferSpeexFrameQualitiesKey;
  *(void *)&long long v15 = 134217984;
  long long v37 = v15;
  while (1)
  {
    v18 = [(AudioAppleSiriRemoteInputDevice *)self codec];
    unsigned __int8 v19 = [v18 isEqualToString:@"speex"];

    if (v19)
    {
      uint64_t v20 = 78;
      goto LABEL_15;
    }
    v21 = [(AudioAppleSiriRemoteInputDevice *)self codec];
    unsigned int v22 = [v21 isEqualToString:@"opus"];

    uint64_t v20 = v40;
    if (v22) {
      break;
    }
LABEL_15:
    uint64_t v23 = qword_D420;
    if (v16 < (unint64_t)(unsigned __int16)v20)
    {
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
        sub_5158(v20, v16, v23);
      }
      goto LABEL_31;
    }
    if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v43 = v16;
      __int16 v44 = 1024;
      int v45 = (unsigned __int16)v20;
      _os_log_debug_impl(&dword_0, v23, OS_LOG_TYPE_DEBUG, "Received BufferLength %ld, FrameLength %d", buf, 0x12u);
    }
    uint64_t v40 = v20;
    uint64_t v41 = v16;
    uint64_t v24 = (unsigned __int16)v20;
    id v25 = v4;
    v26 = objc_msgSend(v4, "subdataWithRange:", v17, (unsigned __int16)v20);
    v27 = [(AudioAppleSiriRemoteInputDevice *)self _audioBufferForFrame:v26];
    v28 = [(AudioAppleSiriRemoteInputDevice *)self _audioTimeForFrame:v26];
    id v29 = objc_alloc_init((Class)NSMutableDictionary);
    v30 = [(AudioAppleSiriRemoteInputDevice *)self _gainForFrame:v26];
    [v29 setObject:v30 forKey:v39];

    v31 = [(AudioAppleSiriRemoteInputDevice *)self codec];
    unsigned __int8 v32 = [v31 isEqualToString:@"speex"];

    if (v32)
    {
      v33 = [(AudioAppleSiriRemoteInputDevice *)self _qualityForSpeexFrame:v26];
      [v29 setObject:v33 forKey:v38];
    }
    v34 = [(AudioAppleSiriRemoteInputDevice *)self audioInputBlock];

    if (v34)
    {
      objc_super v35 = [(AudioAppleSiriRemoteInputDevice *)self audioInputBlock];
      ((void (**)(void, void *, void *, id))v35)[2](v35, v27, v28, v29);
    }
    id v4 = v25;
    uint64_t v16 = v41 - v24;
    if (v41 - v24 < 0)
    {
      v36 = qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v37;
        uint64_t v43 = v41 - v24;
        _os_log_error_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Buffer length should be negative value %ld", buf, 0xCu);
      }
    }
    v17 += v24;

    if (v16 <= 5) {
      goto LABEL_31;
    }
  }
  buf[0] = 0;
  objc_msgSend(v4, "getBytes:range:", buf, v17 + self->_frameLengthOffset, 1);
  if (buf[0] < 0x5Fu)
  {
    if (!buf[0]) {
      goto LABEL_31;
    }
    uint64_t v20 = buf[0] + 5;
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
    sub_51E4();
  }
LABEL_31:
}

- (id)_audioBufferForFrame:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AudioAppleSiriRemoteInputDevice *)self codec];
  unsigned int v6 = [v5 isEqualToString:@"opus"];

  if (v6)
  {
    unsigned __int8 v15 = 0;
    objc_msgSend(v4, "getBytes:range:", &v15, self->_frameLengthOffset, 1);
    uint64_t v7 = v15;
    id v8 = objc_alloc((Class)AVAudioCompressedBuffer);
    id v9 = [(AudioAppleSiriRemoteInputDevice *)self format];
    id v10 = [v8 initWithFormat:v9 packetCapacity:1 maximumPacketSize:94];

    objc_msgSend(v4, "getBytes:range:", objc_msgSend(v10, "data"), self->_frameLengthOffset + 1, v7);
    v11 = [v10 packetDescriptions];
    *(void *)v11 = 0;
    v11[2] = 0;
    v11[3] = v7;
  }
  else
  {
    id v12 = objc_alloc((Class)AVAudioCompressedBuffer);
    uint64_t v13 = [(AudioAppleSiriRemoteInputDevice *)self format];
    id v10 = [v12 initWithFormat:v13 packetCapacity:1];

    objc_msgSend(v4, "getBytes:length:", objc_msgSend(v10, "data"), self->_frameLength);
  }
  [v10 setPacketCount:1];

  return v10;
}

- (id)_audioTimeForFrame:(id)a3
{
  unsigned __int16 v6 = 0;
  objc_msgSend(a3, "getBytes:range:", &v6, self->_timeOffset, 2);
  id v3 = objc_alloc((Class)AVAudioTime);
  id v4 = [v3 initWithSampleTime:v6 atRate:1.0];

  return v4;
}

- (id)_gainForFrame:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AudioAppleSiriRemoteInputDevice *)self deviceType];
  if ((unint64_t)(v5 - 1) < 2)
  {
    uint64_t v7 = [(AudioAppleSiriRemoteInputDevice *)self _gainForTVRemoteFrame:v4];
  }
  else
  {
    if (v5 != 3 && v5 != 4)
    {
      unsigned __int16 v6 = (void *)qword_D420;
      if (os_log_type_enabled((os_log_t)qword_D420, OS_LOG_TYPE_ERROR)) {
        sub_526C(v6);
      }
    }
    uint64_t v7 = [(AudioAppleSiriRemoteInputDevice *)self _gainForDoapFrame:v4];
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)_gainForTVRemoteFrame:(id)a3
{
  __int16 v6 = 0;
  objc_msgSend(a3, "getBytes:range:", &v6, self->_rmsOffset, 2);
  LOWORD(v3) = v6;
  id v4 = +[NSNumber numberWithDouble:(double)v3 * 0.0000305175781];

  return v4;
}

- (id)_gainForDoapFrame:(id)a3
{
  __int16 v5 = 0;
  objc_msgSend(a3, "getBytes:range:", &v5, self->_rmsOffset, 2);
  unint64_t v3 = +[NSData dataWithBytes:&v5 length:2];

  return v3;
}

- (id)_qualityForSpeexFrame:(id)a3
{
  __int16 v6 = 0;
  objc_msgSend(a3, "getBytes:range:", &v6, 72, 2);
  LOWORD(v3) = v6;
  id v4 = +[NSNumber numberWithDouble:(double)v3 * 0.00048828125];

  return v4;
}

- (id)audioInputBlock
{
  return self->audioInputBlock;
}

- (void)setAudioInputBlock:(id)a3
{
}

- (NSArray)supportedFormats
{
  return self->supportedFormats;
}

- (void)setSupportedFormats:(id)a3
{
}

- (AVAudioFormat)format
{
  return self->format;
}

- (void)setFormat:(id)a3
{
}

- (id)statusChangeBlock
{
  return self->statusChangeBlock;
}

- (void)setStatusChangeBlock:(id)a3
{
}

- (AudioAppleSiriRemoteInputPlugin)plugin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plugin);

  return (AudioAppleSiriRemoteInputPlugin *)WeakRetained;
}

- (void)setPlugin:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)codec
{
  return self->_codec;
}

- (NSString)resolvedDeviceIdentifier
{
  return self->_resolvedDeviceIdentifier;
}

- (void)setResolvedDeviceIdentifier:(id)a3
{
}

- (int)frameLength
{
  return self->_frameLength;
}

- (void)setFrameLength:(int)a3
{
  self->_frameLength = a3;
}

- (int)frameLengthOffset
{
  return self->_frameLengthOffset;
}

- (void)setFrameLengthOffset:(int)a3
{
  self->_frameLengthOffset = a3;
}

- (int)rmsOffset
{
  return self->_rmsOffset;
}

- (void)setRmsOffset:(int)a3
{
  self->_rmsOffset = a3;
}

- (int)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(int)a3
{
  self->_timeOffset = a3;
}

- (unsigned)pidNum
{
  return self->_pidNum;
}

- (void)setPidNum:(unsigned __int16)a3
{
  self->_int pidNum = a3;
}

- (unsigned)doapCodecType
{
  return self->_doapCodecType;
}

- (void)setDoapCodecType:(unsigned __int8)a3
{
  self->_doapCodecType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_int64_t deviceType = a3;
}

- (id)startCompletionBlock
{
  return self->_startCompletionBlock;
}

- (void)setStartCompletionBlock:(id)a3
{
}

- (id)stopCompletionBlock
{
  return self->_stopCompletionBlock;
}

- (void)setStopCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopCompletionBlock, 0);
  objc_storeStrong(&self->_startCompletionBlock, 0);
  objc_storeStrong((id *)&self->_resolvedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_plugin);
  objc_storeStrong(&self->statusChangeBlock, 0);
  objc_storeStrong((id *)&self->format, 0);
  objc_storeStrong((id *)&self->supportedFormats, 0);

  objc_storeStrong(&self->audioInputBlock, 0);
}

@end
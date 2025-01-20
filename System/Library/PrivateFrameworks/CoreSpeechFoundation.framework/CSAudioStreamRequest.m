@interface CSAudioStreamRequest
+ (id)defaultRequestWithContext:(id)a3;
+ (id)requestForLpcmRecordSettingsWithContext:(id)a3;
+ (id)requestForOpusRecordSettingsWithContext:(id)a3;
+ (id)requestForSpeexRecordSettingsWithContext:(id)a3;
- (BOOL)lpcmIsFloat;
- (BOOL)requestExclaveAudio;
- (BOOL)requestListeningMicIndicatorLock;
- (BOOL)requestRecordModeLock;
- (BOOL)requestSkipClientMonitorUpdate;
- (BOOL)requiresHistoricalBuffer;
- (BOOL)useCustomizedRecordSettings;
- (CSAudioRecordContext)recordContext;
- (CSAudioStreamRequest)initWithXPCObject:(id)a3;
- (OS_xpc_object)xpcObject;
- (double)sampleRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initTandemWithRequest:(id)a3;
- (int64_t)audioFormat;
- (unint64_t)clientIdentity;
- (unsigned)encoderBitRate;
- (unsigned)lpcmBitDepth;
- (unsigned)numberOfChannels;
- (void)setAudioFormat:(int64_t)a3;
- (void)setClientIdentity:(unint64_t)a3;
- (void)setEncoderBitRate:(unsigned int)a3;
- (void)setLpcmBitDepth:(unsigned int)a3;
- (void)setLpcmIsFloat:(BOOL)a3;
- (void)setNumberOfChannels:(unsigned int)a3;
- (void)setRecordContext:(id)a3;
- (void)setRequestExclaveAudio:(BOOL)a3;
- (void)setRequestListeningMicIndicatorLock:(BOOL)a3;
- (void)setRequestRecordModeLock:(BOOL)a3;
- (void)setRequestSkipClientMonitorUpdate:(BOOL)a3;
- (void)setRequiresHistoricalBuffer:(BOOL)a3;
- (void)setSampleRate:(double)a3;
- (void)setUseCustomizedRecordSettings:(BOOL)a3;
@end

@implementation CSAudioStreamRequest

- (void).cxx_destruct
{
}

- (void)setRequestExclaveAudio:(BOOL)a3
{
  self->_requestExclaveAudio = a3;
}

- (BOOL)requestExclaveAudio
{
  return self->_requestExclaveAudio;
}

- (void)setRequestListeningMicIndicatorLock:(BOOL)a3
{
  self->_requestListeningMicIndicatorLock = a3;
}

- (BOOL)requestListeningMicIndicatorLock
{
  return self->_requestListeningMicIndicatorLock;
}

- (void)setRequestRecordModeLock:(BOOL)a3
{
  self->_requestRecordModeLock = a3;
}

- (BOOL)requestRecordModeLock
{
  return self->_requestRecordModeLock;
}

- (void)setRequestSkipClientMonitorUpdate:(BOOL)a3
{
  self->_requestSkipClientMonitorUpdate = a3;
}

- (BOOL)requestSkipClientMonitorUpdate
{
  return self->_requestSkipClientMonitorUpdate;
}

- (void)setClientIdentity:(unint64_t)a3
{
  self->_clientIdentity = a3;
}

- (unint64_t)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setEncoderBitRate:(unsigned int)a3
{
  self->_encoderBitRate = a3;
}

- (unsigned)encoderBitRate
{
  return self->_encoderBitRate;
}

- (void)setNumberOfChannels:(unsigned int)a3
{
  self->_numberOfChannels = a3;
}

- (unsigned)numberOfChannels
{
  return self->_numberOfChannels;
}

- (void)setLpcmIsFloat:(BOOL)a3
{
  self->_lpcmIsFloat = a3;
}

- (BOOL)lpcmIsFloat
{
  return self->_lpcmIsFloat;
}

- (void)setLpcmBitDepth:(unsigned int)a3
{
  self->_lpcmBitDepth = a3;
}

- (unsigned)lpcmBitDepth
{
  return self->_lpcmBitDepth;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setAudioFormat:(int64_t)a3
{
  self->_audioFormat = a3;
}

- (int64_t)audioFormat
{
  return self->_audioFormat;
}

- (void)setUseCustomizedRecordSettings:(BOOL)a3
{
  self->_useCustomizedRecordSettings = a3;
}

- (BOOL)useCustomizedRecordSettings
{
  return self->_useCustomizedRecordSettings;
}

- (void)setRequiresHistoricalBuffer:(BOOL)a3
{
  self->_requiresHistoricalBuffer = a3;
}

- (BOOL)requiresHistoricalBuffer
{
  return self->_requiresHistoricalBuffer;
}

- (void)setRecordContext:(id)a3
{
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = v3;
  if (self->_requiresHistoricalBuffer) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@"[requiresHistoricalBuffer = %@]", v5];
  if (self->_useCustomizedRecordSettings) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v4 appendFormat:@"[useCustomizedRecordSettings = %@]", v6];
  if (self->_lpcmIsFloat) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v4 appendFormat:@"[lpcmIsFloat = %@]", v7];
  objc_msgSend(v4, "appendFormat:", @"[clientIdentity = %llu]", self->_clientIdentity);
  objc_msgSend(v4, "appendFormat:", @"[sampleRate = %lf]", *(void *)&self->_sampleRate);
  objc_msgSend(v4, "appendFormat:", @"[numberOfChannels = %lu]", self->_numberOfChannels);
  objc_msgSend(v4, "appendFormat:", @"[requestSkipClientMonitorUpdate = %d]", self->_requestSkipClientMonitorUpdate);
  if (self->_requestRecordModeLock) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v4 appendFormat:@"[requestRecordModeLock = %@]", v8];
  if (self->_requestListeningMicIndicatorLock) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v4 appendFormat:@"[requestListeningMicIndicatorLock = %@]", v9];
  if (self->_requestExclaveAudio) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v4 appendFormat:@"[requestExclaveAudio = %@]", v10];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CSAudioStreamRequest);
  [(CSAudioStreamRequest *)v4 setRequiresHistoricalBuffer:self->_requiresHistoricalBuffer];
  [(CSAudioStreamRequest *)v4 setUseCustomizedRecordSettings:self->_useCustomizedRecordSettings];
  [(CSAudioStreamRequest *)v4 setAudioFormat:self->_audioFormat];
  [(CSAudioStreamRequest *)v4 setSampleRate:self->_sampleRate];
  [(CSAudioStreamRequest *)v4 setLpcmBitDepth:self->_lpcmBitDepth];
  [(CSAudioStreamRequest *)v4 setLpcmIsFloat:self->_lpcmIsFloat];
  [(CSAudioStreamRequest *)v4 setNumberOfChannels:self->_numberOfChannels];
  [(CSAudioStreamRequest *)v4 setEncoderBitRate:self->_encoderBitRate];
  [(CSAudioStreamRequest *)v4 setClientIdentity:self->_clientIdentity];
  [(CSAudioStreamRequest *)v4 setRecordContext:self->_recordContext];
  [(CSAudioStreamRequest *)v4 setRequestSkipClientMonitorUpdate:self->_requestSkipClientMonitorUpdate];
  [(CSAudioStreamRequest *)v4 setRequestRecordModeLock:self->_requestRecordModeLock];
  [(CSAudioStreamRequest *)v4 setRequestListeningMicIndicatorLock:self->_requestListeningMicIndicatorLock];
  [(CSAudioStreamRequest *)v4 setRequestExclaveAudio:self->_requestExclaveAudio];
  return v4;
}

- (OS_xpc_object)xpcObject
{
  keys[13] = *(char **)MEMORY[0x1E4F143B8];
  keys[0] = "requiresHistoricalBuffer";
  keys[1] = "useCustomizedRecordSettings";
  keys[2] = "audioFormat";
  keys[3] = "sampleRate";
  keys[4] = "lpcmBitDepth";
  keys[5] = "lpcmIsFloat";
  keys[6] = "NumberOfChannels";
  keys[7] = "encoderBitRate";
  keys[8] = "audioClientIdentity";
  keys[9] = "requestSkipClientMonitorUpdate";
  keys[10] = "requestRecordModeLock";
  keys[11] = "requestListeningMicIndicatorLock";
  keys[12] = "requestExclaveAudio";
  values[0] = xpc_BOOL_create(self->_requiresHistoricalBuffer);
  values[1] = xpc_BOOL_create(self->_useCustomizedRecordSettings);
  values[2] = xpc_int64_create(self->_audioFormat);
  values[3] = xpc_double_create(self->_sampleRate);
  values[4] = xpc_int64_create(self->_lpcmBitDepth);
  values[5] = xpc_BOOL_create(self->_lpcmIsFloat);
  values[6] = xpc_int64_create(self->_numberOfChannels);
  values[7] = xpc_int64_create(self->_encoderBitRate);
  values[8] = xpc_uint64_create(self->_clientIdentity);
  values[9] = xpc_BOOL_create(self->_requestSkipClientMonitorUpdate);
  values[10] = xpc_BOOL_create(self->_requestRecordModeLock);
  values[11] = xpc_BOOL_create(self->_requestListeningMicIndicatorLock);
  values[12] = xpc_BOOL_create(self->_requestExclaveAudio);
  xpc_object_t v3 = xpc_dictionary_create((const char *const *)keys, values, 0xDuLL);
  recordContext = self->_recordContext;
  if (recordContext)
  {
    v5 = [(CSAudioRecordContext *)recordContext xpcObject];
    xpc_dictionary_set_value(v3, "recordContext", v5);
  }
  for (uint64_t i = 12; i != -1; --i)

  return (OS_xpc_object *)v3;
}

- (CSAudioStreamRequest)initWithXPCObject:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSAudioStreamRequest;
  v5 = [(CSAudioStreamRequest *)&v10 init];
  if (v5)
  {
    v5->_requiresHistoricalBuffer = xpc_dictionary_get_BOOL(v4, "requiresHistoricalBuffer");
    v5->_useCustomizedRecordSettings = xpc_dictionary_get_BOOL(v4, "useCustomizedRecordSettings");
    v5->_audioFormat = xpc_dictionary_get_int64(v4, "audioFormat");
    v5->_sampleRate = xpc_dictionary_get_double(v4, "sampleRate");
    v5->_lpcmBitDepth = xpc_dictionary_get_int64(v4, "lpcmBitDepth");
    v5->_lpcmIsFloat = xpc_dictionary_get_BOOL(v4, "lpcmIsFloat");
    v5->_numberOfChannels = xpc_dictionary_get_int64(v4, "NumberOfChannels");
    v5->_encoderBitRate = xpc_dictionary_get_int64(v4, "encoderBitRate");
    v5->_clientIdentity = xpc_dictionary_get_uint64(v4, "audioClientIdentity");
    v5->_requestSkipClientMonitorUpdate = xpc_dictionary_get_BOOL(v4, "requestSkipClientMonitorUpdate");
    v5->_requestRecordModeLock = xpc_dictionary_get_BOOL(v4, "requestRecordModeLock");
    v5->_requestListeningMicIndicatorLock = xpc_dictionary_get_BOOL(v4, "requestListeningMicIndicatorLock");
    v5->_requestExclaveAudio = xpc_dictionary_get_BOOL(v4, "requestExclaveAudio");
    v6 = xpc_dictionary_get_value(v4, "recordContext");
    if (v6)
    {
      v7 = [[CSAudioRecordContext alloc] initWithXPCObject:v6];
      recordContext = v5->_recordContext;
      v5->_recordContext = v7;
    }
  }

  return v5;
}

- (id)initTandemWithRequest:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CSAudioStreamRequest);
  v6 = [v4 recordContext];
  [(CSAudioStreamRequest *)v5 setRecordContext:v6];

  -[CSAudioStreamRequest setRequiresHistoricalBuffer:](v5, "setRequiresHistoricalBuffer:", [v4 requiresHistoricalBuffer]);
  -[CSAudioStreamRequest setUseCustomizedRecordSettings:](v5, "setUseCustomizedRecordSettings:", [v4 useCustomizedRecordSettings]);
  -[CSAudioStreamRequest setAudioFormat:](v5, "setAudioFormat:", [v4 audioFormat]);
  [v4 sampleRate];
  -[CSAudioStreamRequest setSampleRate:](v5, "setSampleRate:");
  -[CSAudioStreamRequest setLpcmBitDepth:](v5, "setLpcmBitDepth:", [v4 lpcmBitDepth]);
  -[CSAudioStreamRequest setLpcmIsFloat:](v5, "setLpcmIsFloat:", [v4 lpcmIsFloat]);
  -[CSAudioStreamRequest setNumberOfChannels:](v5, "setNumberOfChannels:", [v4 numberOfChannels]);
  -[CSAudioStreamRequest setEncoderBitRate:](v5, "setEncoderBitRate:", [v4 encoderBitRate]);
  uint64_t v7 = [v4 requestExclaveAudio];

  [(CSAudioStreamRequest *)v5 setRequestExclaveAudio:v7];
  return v5;
}

+ (id)requestForSpeexRecordSettingsWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    objc_super v10 = "+[CSAudioStreamRequest requestForSpeexRecordSettingsWithContext:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  v5 = objc_alloc_init(CSAudioStreamRequest);
  [(CSAudioStreamRequest *)v5 setUseCustomizedRecordSettings:1];
  [(CSAudioStreamRequest *)v5 setAudioFormat:2];
  [(CSAudioStreamRequest *)v5 setEncoderBitRate:+[CSConfig audioConverterBitrate]];
  +[CSConfig inputRecordingSampleRate];
  [(CSAudioStreamRequest *)v5 setSampleRate:v6];
  [(CSAudioStreamRequest *)v5 setNumberOfChannels:1];
  uint64_t v7 = (void *)[v3 copy];
  [(CSAudioStreamRequest *)v5 setRecordContext:v7];

  return v5;
}

+ (id)requestForOpusRecordSettingsWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    objc_super v10 = "+[CSAudioStreamRequest requestForOpusRecordSettingsWithContext:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  v5 = objc_alloc_init(CSAudioStreamRequest);
  [(CSAudioStreamRequest *)v5 setUseCustomizedRecordSettings:1];
  [(CSAudioStreamRequest *)v5 setAudioFormat:1];
  +[CSConfig inputRecordingSampleRate];
  [(CSAudioStreamRequest *)v5 setSampleRate:v6];
  [(CSAudioStreamRequest *)v5 setLpcmBitDepth:+[CSConfig inputRecordingSampleBitDepth]];
  [(CSAudioStreamRequest *)v5 setLpcmIsFloat:0];
  [(CSAudioStreamRequest *)v5 setNumberOfChannels:1];
  uint64_t v7 = (void *)[v3 copy];
  [(CSAudioStreamRequest *)v5 setRecordContext:v7];

  return v5;
}

+ (id)requestForLpcmRecordSettingsWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    objc_super v10 = "+[CSAudioStreamRequest requestForLpcmRecordSettingsWithContext:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  v5 = objc_alloc_init(CSAudioStreamRequest);
  [(CSAudioStreamRequest *)v5 setUseCustomizedRecordSettings:1];
  [(CSAudioStreamRequest *)v5 setAudioFormat:0];
  +[CSConfig inputRecordingSampleRate];
  [(CSAudioStreamRequest *)v5 setSampleRate:v6];
  [(CSAudioStreamRequest *)v5 setLpcmBitDepth:+[CSConfig inputRecordingSampleBitDepth]];
  [(CSAudioStreamRequest *)v5 setLpcmIsFloat:+[CSConfig inputRecordingIsFloat]];
  [(CSAudioStreamRequest *)v5 setNumberOfChannels:+[CSConfig inputRecordingNumberOfChannels]];
  uint64_t v7 = (void *)[v3 copy];
  [(CSAudioStreamRequest *)v5 setRecordContext:v7];

  return v5;
}

+ (id)defaultRequestWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "+[CSAudioStreamRequest defaultRequestWithContext:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  v5 = objc_alloc_init(CSAudioStreamRequest);
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  int v6 = CSIsHorseman_isHorseman;
  [(CSAudioStreamRequest *)v5 setAudioFormat:0];
  +[CSConfig inputRecordingSampleRate];
  [(CSAudioStreamRequest *)v5 setSampleRate:v7];
  [(CSAudioStreamRequest *)v5 setLpcmBitDepth:+[CSConfig inputRecordingSampleBitDepth]];
  [(CSAudioStreamRequest *)v5 setLpcmIsFloat:+[CSConfig inputRecordingIsFloat]];
  [(CSAudioStreamRequest *)v5 setNumberOfChannels:+[CSConfig inputRecordingNumberOfChannels]];
  if (!v6)
  {
    v8 = (void *)[v3 copy];
    [(CSAudioStreamRequest *)v5 setRecordContext:v8];
  }
  return v5;
}

@end
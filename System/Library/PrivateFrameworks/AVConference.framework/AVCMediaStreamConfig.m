@interface AVCMediaStreamConfig
+ (id)dictionaryForCommonStreamConfig:(id)a3;
+ (int)streamJitterBufferModeWithClientJitterBufferMode:(unsigned int)a3;
+ (int64_t)cipherSuiteWithClientCipherSuite:(int64_t)a3;
+ (int64_t)clientCipherSuiteWithCipherSuite:(int64_t)a3;
+ (int64_t)clientStreamDirectionWithDirection:(int64_t)a3;
+ (int64_t)streamDirectionWithClientDirection:(int64_t)a3;
- (AVCAudioStreamConfig)audio;
- (AVCMediaStreamConfig)init;
- (AVCNetworkAddress)localAddress;
- (AVCNetworkAddress)remoteAddress;
- (AVCTextStreamConfig)text;
- (AVCVideoStreamConfig)video;
- (BOOL)isAudioCodecMaskValid;
- (BOOL)isAudioCodecValid;
- (BOOL)isDSCPTagValid;
- (BOOL)isJitterBufferModeValid;
- (BOOL)isRTCPEnabled;
- (BOOL)isRTCPTimeOutEnabled;
- (BOOL)isRTCPXREnabled;
- (BOOL)isRTPTimeOutEnabled;
- (BOOL)isRateAdaptationEnabled;
- (BOOL)isStreamInputIDValid;
- (BOOL)isValidAudioConfig;
- (BOOL)isValidTextConfig;
- (BOOL)isValidVideoConfig;
- (BOOL)outOfProcessCodecsEnabled;
- (NSData)receiveMediaKey;
- (NSData)sendMediaKey;
- (NSString)cName;
- (double)rtcpSendInterval;
- (double)rtcpTimeOutInterval;
- (double)rtpTimeOutInterval;
- (id)description;
- (id)dictionary;
- (int64_t)SRTCPCipherSuite;
- (int64_t)SRTPCipherSuite;
- (int64_t)accessNetworkType;
- (int64_t)direction;
- (int64_t)streamInputID;
- (unint64_t)fixedJitterBufferSize;
- (unint64_t)networkClockID;
- (unint64_t)recommendedMTU;
- (unint64_t)rxPayloadType;
- (unint64_t)txPayloadType;
- (unsigned)dscpTag;
- (unsigned)jitterBufferMode;
- (unsigned)localSSRC;
- (unsigned)remoteSSRC;
- (unsigned)rtcpRemotePort;
- (void)dealloc;
- (void)isValidVideoConfig;
- (void)setAccessNetworkType:(int64_t)a3;
- (void)setAudio:(id)a3;
- (void)setCName:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setDscpTag:(unsigned __int8)a3;
- (void)setFixedJitterBufferSize:(unint64_t)a3;
- (void)setJitterBufferMode:(unsigned int)a3;
- (void)setLocalAddress:(id)a3;
- (void)setLocalSSRC:(unsigned int)a3;
- (void)setNetworkClockID:(unint64_t)a3;
- (void)setOutOfProcessCodecsEnabled:(BOOL)a3;
- (void)setRateAdaptationEnabled:(BOOL)a3;
- (void)setReceiveMediaKey:(id)a3;
- (void)setRecommendedMTU:(unint64_t)a3;
- (void)setRemoteAddress:(id)a3;
- (void)setRemoteSSRC:(unsigned int)a3;
- (void)setRtcpEnabled:(BOOL)a3;
- (void)setRtcpRemotePort:(unsigned __int16)a3;
- (void)setRtcpSendInterval:(double)a3;
- (void)setRtcpTimeOutEnabled:(BOOL)a3;
- (void)setRtcpTimeOutInterval:(double)a3;
- (void)setRtcpXREnabled:(BOOL)a3;
- (void)setRtpTimeOutEnabled:(BOOL)a3;
- (void)setRtpTimeOutInterval:(double)a3;
- (void)setRxPayloadType:(unint64_t)a3;
- (void)setSRTCPCipherSuite:(int64_t)a3;
- (void)setSRTPCipherSuite:(int64_t)a3;
- (void)setSendMediaKey:(id)a3;
- (void)setStreamInputID:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTxPayloadType:(unint64_t)a3;
- (void)setUpWithDictionary:(id)a3;
- (void)setVideo:(id)a3;
@end

@implementation AVCMediaStreamConfig

- (AVCMediaStreamConfig)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AVCMediaStreamConfig;
  v2 = [(AVCMediaStreamConfig *)&v4 init];
  if (v2)
  {
    v2->_remoteAddress = (AVCNetworkAddress *)objc_opt_new();
    v2->_localAddress = (AVCNetworkAddress *)objc_opt_new();
    v2->_cName = (NSString *)objc_opt_new();
    v2->_direction = 3;
    v2->_sendMediaKey = (NSData *)objc_opt_new();
    v2->_receiveMediaKey = (NSData *)objc_opt_new();
    v2->_audio = (AVCAudioStreamConfig *)objc_opt_new();
    v2->_video = (AVCVideoStreamConfig *)objc_opt_new();
    v2->_text = (AVCTextStreamConfig *)objc_opt_new();
    v2->_networkClockID = *MEMORY[0x1E4FAF2F0];
    v2->_dscpTag = 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCMediaStreamConfig;
  [(AVCMediaStreamConfig *)&v3 dealloc];
}

- (BOOL)isValidAudioConfig
{
  if (![(AVCAudioStreamConfig *)[(AVCMediaStreamConfig *)self audio] isValid]
    || ![(AVCMediaStreamConfig *)self isAudioCodecValid]
    || ![(AVCMediaStreamConfig *)self isAudioCodecMaskValid]
    || ![(AVCMediaStreamConfig *)self isStreamInputIDValid]
    || ![(AVCMediaStreamConfig *)self isJitterBufferModeValid])
  {
    return 0;
  }

  return [(AVCMediaStreamConfig *)self isDSCPTagValid];
}

- (BOOL)isValidVideoConfig
{
  BOOL v3 = [(AVCVideoStreamConfig *)[(AVCMediaStreamConfig *)self video] captureSource] != 3
    || self->_streamInputID != 0;
  if ([(AVCVideoStreamConfig *)[(AVCMediaStreamConfig *)self video] videoStreamMode] == 1
    || ![(AVCVideoStreamConfig *)[(AVCMediaStreamConfig *)self video] isFoveationEnabled])
  {
    if ([(AVCMediaStreamConfig *)self txPayloadType] > 0x7F
      || [(AVCMediaStreamConfig *)self txPayloadType] < 0x60
      || [(AVCMediaStreamConfig *)self rxPayloadType] > 0x7F
      || [(AVCMediaStreamConfig *)self rxPayloadType] < 0x60)
    {
      goto LABEL_14;
    }
    LOBYTE(v6) = [(AVCVideoStreamConfig *)[(AVCMediaStreamConfig *)self video] isValidForDirection:[(AVCMediaStreamConfig *)self direction]]&& v3;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_14:
      LOBYTE(v6) = 0;
      return v6;
    }
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v6)
    {
      [(AVCMediaStreamConfig *)v4 isValidVideoConfig];
      goto LABEL_14;
    }
  }
  return v6;
}

- (BOOL)isValidTextConfig
{
  if ([(AVCMediaStreamConfig *)self txPayloadType] > 0x7F
    || [(AVCMediaStreamConfig *)self txPayloadType] < 0x60
    || [(AVCMediaStreamConfig *)self rxPayloadType] > 0x7F
    || [(AVCMediaStreamConfig *)self rxPayloadType] < 0x60)
  {
    return 0;
  }
  BOOL v3 = [(AVCMediaStreamConfig *)self text];

  return [(AVCTextStreamConfig *)v3 isValid];
}

- (id)description
{
  id v2 = [(AVCMediaStreamConfig *)self dictionary];

  return (id)[v2 description];
}

+ (int64_t)streamDirectionWithClientDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int)streamJitterBufferModeWithClientJitterBufferMode:(unsigned int)a3
{
  if (a3 < 3) {
    return dword_1E25A32C8[a3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[AVCMediaStreamConfig streamJitterBufferModeWithClientJitterBufferMode:]();
    }
  }
  return 1;
}

+ (int64_t)clientStreamDirectionWithDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)cipherSuiteWithClientCipherSuite:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return qword_1E25A32D8[a3 - 1];
  }
}

+ (int64_t)clientCipherSuiteWithCipherSuite:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 0;
  }
  else {
    return qword_1E25A3300[a3 - 1];
  }
}

- (void)setUpWithDictionary:(id)a3
{
  -[AVCNetworkAddress setIp:](self->_remoteAddress, "setIp:", [a3 objectForKeyedSubscript:@"vcMediaStreamDestIp"]);
  -[AVCNetworkAddress setPort:](self->_remoteAddress, "setPort:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDestPort"), "shortValue"));
  -[AVCNetworkAddress setIsIPv6:](self->_remoteAddress, "setIsIPv6:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDestIsIPv6"), "BOOLValue"));
  -[AVCNetworkAddress setIp:](self->_localAddress, "setIp:", [a3 objectForKeyedSubscript:@"vcMediaStreamSourceIP"]);
  -[AVCNetworkAddress setPort:](self->_localAddress, "setPort:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSourcePort"), "shortValue"));
  -[AVCNetworkAddress setIsIPv6:](self->_localAddress, "setIsIPv6:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSourceIsIPv6"), "BOOLValue"));
  -[AVCNetworkAddress setInterfaceName:](self->_localAddress, "setInterfaceName:", [a3 objectForKeyedSubscript:@"vcMediaStreamSourceInterfaceName"]);
  self->_cName = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamCName"];
  self->_direction = +[AVCMediaStreamConfig clientStreamDirectionWithDirection:](AVCMediaStreamConfig, "clientStreamDirectionWithDirection:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDirection"), "integerValue"));
  self->_txPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTxPayloadType"), "integerValue");
  self->_rxPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRxPayloadType"), "integerValue");
  self->_remoteSSRC = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRemoteSSRC"), "integerValue");
  self->_localSSRC = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamLocalSSRC"), "integerValue");
  self->_rateAdaptationEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRateAdaptationEnabled"), "BOOLValue");
  self->_rtcpEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPEnabled"), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPSendInterval"), "doubleValue");
  self->_rtcpSendInterval = v5;
  self->_rtcpRemotePort = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPRemotePort"), "integerValue");
  self->_rtcpTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPTimeoutEnabled"), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPTimeoutInterval"), "doubleValue");
  self->_rtcpTimeOutInterval = v6;
  self->_rtcpXREnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPXREnabled"), "BOOLValue");
  self->_rtpTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTPTimeoutEnabled"), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTPTimeoutInterval"), "doubleValue");
  self->_rtpTimeOutInterval = v7;
  self->_sendMediaKey = (NSData *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamSRTPSendMediaKey"];
  self->_recommendedMTU = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRecommendedMTU"), "integerValue");
  self->_receiveMediaKey = (NSData *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamSRTPReceiveMediaKey"];
  self->_SRTPCipherSuite = +[AVCMediaStreamConfig clientCipherSuiteWithCipherSuite:](AVCMediaStreamConfig, "clientCipherSuiteWithCipherSuite:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSRTPCipherSuite"), "integerValue"));
  self->_SRTCPCipherSuite = +[AVCMediaStreamConfig clientCipherSuiteWithCipherSuite:](AVCMediaStreamConfig, "clientCipherSuiteWithCipherSuite:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSRTCPCipherSuite"), "integerValue"));
  self->_streamInputID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamStreamInputID"), "integerValue");
  self->_jitterBufferMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamJitterBufferMode"), "unsignedIntValue");
  self->_fixedJitterBufferSize = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamFixedJitterBufferSize"), "unsignedLongValue");
  self->_accessNetworkType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAccessNetworkType"), "integerValue");
  self->_outOfProcessCodecsEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamOutOfProcessCodecsEnabled"), "BOOLValue");
  self->_dscpTag = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDSCPTag"), "unsignedCharValue");
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamNetworkClockID"]) {
    self->_networkClockID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamNetworkClockID"), "unsignedLongLongValue");
  }
}

- (id)dictionary
{
  BOOL v3 = objc_msgSend(+[AVCMediaStreamConfig dictionaryForCommonStreamConfig:](AVCMediaStreamConfig, "dictionaryForCommonStreamConfig:", self), "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", -[AVCAudioStreamConfig dictionary](self->_audio, "dictionary"));
  objc_msgSend(v3, "addEntriesFromDictionary:", -[AVCVideoStreamConfig dictionary](self->_video, "dictionary"));
  objc_msgSend(v3, "addEntriesFromDictionary:", -[AVCTextStreamConfig dictionary](self->_text, "dictionary"));

  return v3;
}

+ (id)dictionaryForCommonStreamConfig:(id)a3
{
  v9[34] = *MEMORY[0x1E4F143B8];
  v8[0] = @"vcMediaStreamDestIp";
  v9[0] = objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "ip");
  v8[1] = @"vcMediaStreamDestPort";
  v9[1] = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "port"));
  v8[2] = @"vcMediaStreamDestIsIPv6";
  v9[2] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "isIPv6"));
  v8[3] = @"vcMediaStreamSourceIP";
  v9[3] = objc_msgSend((id)objc_msgSend(a3, "localAddress"), "ip");
  v8[4] = @"vcMediaStreamSourcePort";
  v9[4] = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend(a3, "localAddress"), "port"));
  v8[5] = @"vcMediaStreamSourceIsIPv6";
  v9[5] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)objc_msgSend(a3, "localAddress"), "isIPv6"));
  v8[6] = @"vcMediaStreamSourceInterfaceName";
  v9[6] = objc_msgSend((id)objc_msgSend(a3, "localAddress"), "interfaceName");
  v8[7] = @"vcMediaStreamCName";
  v9[7] = [a3 cName];
  v8[8] = @"vcMediaStreamDirection";
  v9[8] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCMediaStreamConfig streamDirectionWithClientDirection:](AVCMediaStreamConfig, "streamDirectionWithClientDirection:", objc_msgSend(a3, "direction")));
  v8[9] = @"vcMediaStreamTxPayloadType";
  v9[9] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "txPayloadType"));
  v8[10] = @"vcMediaStreamRxPayloadType";
  v9[10] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "rxPayloadType"));
  v8[11] = @"vcMediaStreamRemoteSSRC";
  v9[11] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "remoteSSRC"));
  v8[12] = @"vcMediaStreamLocalSSRC";
  v9[12] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "localSSRC"));
  v8[13] = @"vcMediaStreamRateAdaptationEnabled";
  v9[13] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isRateAdaptationEnabled"));
  v8[14] = @"vcMediaStreamRTCPEnabled";
  v9[14] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isRTCPEnabled"));
  v8[15] = @"vcMediaStreamRTCPSendInterval";
  uint64_t v4 = NSNumber;
  [a3 rtcpSendInterval];
  v9[15] = objc_msgSend(v4, "numberWithDouble:");
  v8[16] = @"vcMediaStreamRTCPRemotePort";
  v9[16] = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(a3, "rtcpRemotePort"));
  v8[17] = @"vcMediaStreamRTCPTimeoutEnabled";
  v9[17] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isRTCPTimeOutEnabled"));
  v8[18] = @"vcMediaStreamRTCPTimeoutInterval";
  double v5 = NSNumber;
  [a3 rtcpTimeOutInterval];
  v9[18] = objc_msgSend(v5, "numberWithDouble:");
  v8[19] = @"vcMediaStreamRTCPXREnabled";
  v9[19] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isRTCPXREnabled"));
  v8[20] = @"vcMediaStreamRTPTimeoutEnabled";
  v9[20] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isRTPTimeOutEnabled"));
  v8[21] = @"vcMediaStreamRTPTimeoutInterval";
  double v6 = NSNumber;
  [a3 rtpTimeOutInterval];
  v9[21] = objc_msgSend(v6, "numberWithDouble:");
  v8[22] = @"vcMediaStreamRecommendedMTU";
  v9[22] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "recommendedMTU"));
  v8[23] = @"vcMediaStreamSRTPSendMediaKey";
  v9[23] = [a3 sendMediaKey];
  v8[24] = @"vcMediaStreamSRTPReceiveMediaKey";
  v9[24] = [a3 receiveMediaKey];
  v8[25] = @"vcMediaStreamSRTPCipherSuite";
  v9[25] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCMediaStreamConfig cipherSuiteWithClientCipherSuite:](AVCMediaStreamConfig, "cipherSuiteWithClientCipherSuite:", objc_msgSend(a3, "SRTPCipherSuite")));
  v8[26] = @"vcMediaStreamSRTCPCipherSuite";
  v9[26] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCMediaStreamConfig cipherSuiteWithClientCipherSuite:](AVCMediaStreamConfig, "cipherSuiteWithClientCipherSuite:", objc_msgSend(a3, "SRTCPCipherSuite")));
  v8[27] = @"vcMediaStreamStreamInputID";
  v9[27] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "streamInputID"));
  v8[28] = @"vcMediaStreamNetworkClockID";
  v9[28] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "networkClockID"));
  v8[29] = @"vcMediaStreamJitterBufferMode";
  v9[29] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "jitterBufferMode"));
  v8[30] = @"vcMediaStreamFixedJitterBufferSize";
  v9[30] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "fixedJitterBufferSize"));
  v8[31] = @"vcMediaStreamAccessNetworkType";
  v9[31] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "accessNetworkType"));
  v8[32] = @"vcMediaStreamOutOfProcessCodecsEnabled";
  v9[32] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "outOfProcessCodecsEnabled"));
  v8[33] = @"vcMediaStreamDSCPTag";
  v9[33] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(a3, "dscpTag"));
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:34];
}

- (unsigned)jitterBufferMode
{
  if (self->_jitterBufferModeSet) {
    return self->_jitterBufferMode;
  }
  if ([(AVCAudioStreamConfig *)self->_audio isLatencySensitiveMode]) {
    return 0;
  }
  return ![(AVCVideoStreamConfig *)self->_video isLatencySensitiveModeEnabled];
}

- (void)setJitterBufferMode:(unsigned int)a3
{
  self->_jitterBufferMode = a3;
  self->_jitterBufferModeSet = 1;
}

- (BOOL)isAudioCodecValid
{
  unint64_t v3 = [(AVCAudioStreamConfig *)[(AVCMediaStreamConfig *)self audio] codecType];
  BOOL result = 0;
  if (v3 <= 0x11)
  {
    if (((1 << v3) & 0x3FE73) != 0)
    {
      if ([(AVCMediaStreamConfig *)self txPayloadType] <= 0x7F
        && [(AVCMediaStreamConfig *)self txPayloadType] >= 0x60
        && [(AVCMediaStreamConfig *)self rxPayloadType] <= 0x7F)
      {
        return [(AVCMediaStreamConfig *)self rxPayloadType] > 0x5F;
      }
      return 0;
    }
    if (v3 == 2)
    {
      if ([(AVCMediaStreamConfig *)self rxPayloadType]) {
        return 0;
      }
      return [(AVCMediaStreamConfig *)self txPayloadType] == 0;
    }
    else
    {
      if (v3 != 3) {
        return result;
      }
      if ([(AVCMediaStreamConfig *)self rxPayloadType] != 8) {
        return 0;
      }
      return [(AVCMediaStreamConfig *)self txPayloadType] == 8;
    }
  }
  return result;
}

- (BOOL)isAudioCodecMaskValid
{
  unsigned int v3 = [(AVCAudioStreamConfig *)[(AVCMediaStreamConfig *)self audio] codecBandwidthMask];
  int64_t v4 = [(AVCAudioStreamConfig *)[(AVCMediaStreamConfig *)self audio] codecType];
  BOOL v6 = v3 < 5 || v3 == 7;
  unsigned int v7 = (0xDu >> (v3 & 0xF)) & 1;
  if (v3 >= 4) {
    LOBYTE(v7) = 0;
  }
  if (v4 != 12) {
    LOBYTE(v7) = v3 == 0;
  }
  if (v4 != 13) {
    BOOL v6 = v7;
  }
  if (v4 == 14) {
    return v3 < 2;
  }
  else {
    return v6;
  }
}

- (BOOL)isStreamInputIDValid
{
  return [(AVCAudioStreamConfig *)[(AVCMediaStreamConfig *)self audio] audioStreamMode] != 7
      || (self->_direction | 2) != 3
      || self->_streamInputID != 0;
}

- (BOOL)isJitterBufferModeValid
{
  return [(AVCMediaStreamConfig *)self jitterBufferMode] != 2 || self->_fixedJitterBufferSize != 0;
}

- (BOOL)isDSCPTagValid
{
  HIDWORD(v2) = [(AVCMediaStreamConfig *)self dscpTag];
  LODWORD(v2) = HIDWORD(v2);
  return ((v2 >> 1) < 0x1D) & (0x11BFFFF1u >> (v2 >> 1));
}

- (AVCNetworkAddress)localAddress
{
  return self->_localAddress;
}

- (void)setLocalAddress:(id)a3
{
}

- (AVCNetworkAddress)remoteAddress
{
  return self->_remoteAddress;
}

- (void)setRemoteAddress:(id)a3
{
}

- (NSString)cName
{
  return self->_cName;
}

- (void)setCName:(id)a3
{
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (unint64_t)txPayloadType
{
  return self->_txPayloadType;
}

- (void)setTxPayloadType:(unint64_t)a3
{
  self->_txPayloadType = a3;
}

- (unint64_t)rxPayloadType
{
  return self->_rxPayloadType;
}

- (void)setRxPayloadType:(unint64_t)a3
{
  self->_rxPayloadType = a3;
}

- (unsigned)remoteSSRC
{
  return self->_remoteSSRC;
}

- (void)setRemoteSSRC:(unsigned int)a3
{
  self->_remoteSSRC = a3;
}

- (unsigned)localSSRC
{
  return self->_localSSRC;
}

- (void)setLocalSSRC:(unsigned int)a3
{
  self->_localSSRC = a3;
}

- (BOOL)isRateAdaptationEnabled
{
  return self->_rateAdaptationEnabled;
}

- (void)setRateAdaptationEnabled:(BOOL)a3
{
  self->_rateAdaptationEnabled = a3;
}

- (BOOL)isRTCPEnabled
{
  return self->_rtcpEnabled;
}

- (void)setRtcpEnabled:(BOOL)a3
{
  self->_rtcpEnabled = a3;
}

- (BOOL)isRTCPXREnabled
{
  return self->_rtcpXREnabled;
}

- (void)setRtcpXREnabled:(BOOL)a3
{
  self->_rtcpXREnabled = a3;
}

- (unsigned)rtcpRemotePort
{
  return self->_rtcpRemotePort;
}

- (void)setRtcpRemotePort:(unsigned __int16)a3
{
  self->_rtcpRemotePort = a3;
}

- (double)rtcpSendInterval
{
  return self->_rtcpSendInterval;
}

- (void)setRtcpSendInterval:(double)a3
{
  self->_rtcpSendInterval = a3;
}

- (BOOL)isRTPTimeOutEnabled
{
  return self->_rtpTimeOutEnabled;
}

- (void)setRtpTimeOutEnabled:(BOOL)a3
{
  self->_rtpTimeOutEnabled = a3;
}

- (BOOL)isRTCPTimeOutEnabled
{
  return self->_rtcpTimeOutEnabled;
}

- (void)setRtcpTimeOutEnabled:(BOOL)a3
{
  self->_rtcpTimeOutEnabled = a3;
}

- (double)rtpTimeOutInterval
{
  return self->_rtpTimeOutInterval;
}

- (void)setRtpTimeOutInterval:(double)a3
{
  self->_rtpTimeOutInterval = a3;
}

- (double)rtcpTimeOutInterval
{
  return self->_rtcpTimeOutInterval;
}

- (void)setRtcpTimeOutInterval:(double)a3
{
  self->_rtcpTimeOutInterval = a3;
}

- (unint64_t)recommendedMTU
{
  return self->_recommendedMTU;
}

- (void)setRecommendedMTU:(unint64_t)a3
{
  self->_recommendedMTU = a3;
}

- (NSData)sendMediaKey
{
  return self->_sendMediaKey;
}

- (void)setSendMediaKey:(id)a3
{
}

- (NSData)receiveMediaKey
{
  return self->_receiveMediaKey;
}

- (void)setReceiveMediaKey:(id)a3
{
}

- (int64_t)SRTPCipherSuite
{
  return self->_SRTPCipherSuite;
}

- (void)setSRTPCipherSuite:(int64_t)a3
{
  self->_SRTPCipherSuite = a3;
}

- (int64_t)SRTCPCipherSuite
{
  return self->_SRTCPCipherSuite;
}

- (void)setSRTCPCipherSuite:(int64_t)a3
{
  self->_SRTCPCipherSuite = a3;
}

- (AVCAudioStreamConfig)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
}

- (AVCVideoStreamConfig)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
}

- (AVCTextStreamConfig)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (int64_t)streamInputID
{
  return self->_streamInputID;
}

- (void)setStreamInputID:(int64_t)a3
{
  self->_streamInputID = a3;
}

- (unint64_t)networkClockID
{
  return self->_networkClockID;
}

- (void)setNetworkClockID:(unint64_t)a3
{
  self->_networkClockID = a3;
}

- (unint64_t)fixedJitterBufferSize
{
  return self->_fixedJitterBufferSize;
}

- (void)setFixedJitterBufferSize:(unint64_t)a3
{
  self->_fixedJitterBufferSize = a3;
}

- (int64_t)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int64_t)a3
{
  self->_accessNetworkType = a3;
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

- (unsigned)dscpTag
{
  return self->_dscpTag;
}

- (void)setDscpTag:(unsigned __int8)a3
{
  self->_dscpTag = a3;
}

- (void)isValidVideoConfig
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a2, "video"), "videoStreamMode");
  int v7 = 136316162;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v10 = 220;
  __int16 v11 = 2048;
  v12 = a2;
  __int16 v13 = 2048;
  uint64_t v14 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p Foveation not supported for videoStreamMode=%ld", (uint8_t *)&v7, 0x30u);
}

+ (void)streamJitterBufferModeWithClientJitterBufferMode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unknown AVCJitterBufferMode=%d", v2, v3, v4, 261);
}

@end
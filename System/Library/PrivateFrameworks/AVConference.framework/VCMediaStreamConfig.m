@interface VCMediaStreamConfig
- (BOOL)isDecryptionTimeOutEnabled;
- (BOOL)isEnhancedJBAdaptationsEnabled;
- (BOOL)isExtraDelayForPacketRetransmissionsEnabled;
- (BOOL)isRTCPEnabled;
- (BOOL)isRTCPForLossFeedbackEnabled;
- (BOOL)isRTCPReceiveCallbackEnabled;
- (BOOL)isRTCPTimeOutEnabled;
- (BOOL)isRTCPXREnabled;
- (BOOL)isRTPTimeOutEnabled;
- (BOOL)isRateAdaptationEnabled;
- (BOOL)isRedundancyControlEnabled;
- (BOOL)isServerPacketRetransmissionEnabled;
- (BOOL)isUplinkRetransmissionEnabled;
- (BOOL)outOfProcessCodecsEnabled;
- (BOOL)rtcpPSFB_LTRAckEnabled;
- (NSData)receiveMediaKey;
- (NSData)sendMediaKey;
- (NSDictionary)allRxPayloadMap;
- (NSDictionary)allTxPayloadMap;
- (NSDictionary)rxPayloadMap;
- (NSDictionary)txPayloadMap;
- (NSString)cName;
- (VCMediaStreamConfig)init;
- (VCMediaStreamConfig)initWithClientDictionary:(id)a3;
- (VCMediaStreamMultiwayConfig)multiwayConfig;
- (VCMediaStreamRateControlConfig)rateControlConfig;
- (VCNetworkAddress)localAddress;
- (VCNetworkAddress)remoteAddress;
- (VCNetworkFeedbackController)networkFeedbackController;
- (double)decryptionMKMRecoveryInterval;
- (double)decryptionTimeOutInterval;
- (double)rtcpSendInterval;
- (double)rtcpTimeOutInterval;
- (double)rtpTimeOutInterval;
- (id)description;
- (int)accessNetworkType;
- (int)captureSource;
- (int)jitterBufferMode;
- (int)jitterBufferModeFromAVCJitterBufferMode:(unsigned int)a3;
- (int)sframeCipherSuite;
- (int64_t)SRTCPCipherSuite;
- (int64_t)SRTPCipherSuite;
- (int64_t)direction;
- (int64_t)overlayToken;
- (int64_t)primaryTxCodecType;
- (int64_t)streamInputID;
- (tagVCJBTargetEstimatorSynchronizer)jbTargetEstimatorSynchronizer;
- (tagVCSecurityKeyHolder)securityKeyHolder;
- (unint64_t)fixedJitterBufferSize;
- (unint64_t)networkClockID;
- (unint64_t)recommendedMTU;
- (unsigned)cellularUniqueTag;
- (unsigned)dscpTag;
- (unsigned)localSSRC;
- (unsigned)maxRedundancyPercentage;
- (unsigned)nackGeneratorStorebagConfigVersion;
- (unsigned)redundancyControllerFECVersion;
- (unsigned)redundancyControllerMode;
- (unsigned)remoteSSRC;
- (unsigned)rtcpRemotePort;
- (unsigned)rtpTimestampRate;
- (void)addRxPayloadType:(int)a3;
- (void)addRxPayloadType:(int)a3 networkPayload:(unsigned int)a4;
- (void)addTxPayloadType:(int)a3;
- (void)addTxPayloadType:(int)a3 networkPayload:(unsigned int)a4;
- (void)applyMediaStreamClientDictionary:(id)a3;
- (void)dealloc;
- (void)setAccessNetworkType:(int)a3;
- (void)setCName:(id)a3;
- (void)setCaptureSource:(int)a3;
- (void)setCellularUniqueTag:(unsigned int)a3;
- (void)setDecryptionMKMRecoveryInterval:(double)a3;
- (void)setDecryptionTimeOutEnabled:(BOOL)a3;
- (void)setDecryptionTimeOutInterval:(double)a3;
- (void)setDirection:(int64_t)a3;
- (void)setDscpTag:(unsigned __int8)a3;
- (void)setFixedJitterBufferSize:(unint64_t)a3;
- (void)setIsEnhancedJBAdaptationsEnabled:(BOOL)a3;
- (void)setIsExtraDelayForPacketRetransmissionsEnabled:(BOOL)a3;
- (void)setIsRTCPForLossFeedbackEnabled:(BOOL)a3;
- (void)setIsRedundancyControlEnabled:(BOOL)a3;
- (void)setIsServerPacketRetransmissionEnabled:(BOOL)a3;
- (void)setIsUplinkRetransmissionEnabled:(BOOL)a3;
- (void)setJbTargetEstimatorSynchronizer:(tagVCJBTargetEstimatorSynchronizer *)a3;
- (void)setJitterBufferMode:(int)a3;
- (void)setLocalAddress:(id)a3;
- (void)setLocalSSRC:(unsigned int)a3;
- (void)setMaxRedundancyPercentage:(unsigned int)a3;
- (void)setMultiwayConfig:(id)a3;
- (void)setNackGeneratorStorebagConfigVersion:(unsigned int)a3;
- (void)setNetworkClockID:(unint64_t)a3;
- (void)setNetworkFeedbackController:(id)a3;
- (void)setOutOfProcessCodecsEnabled:(BOOL)a3;
- (void)setOverlayToken:(int64_t)a3;
- (void)setRateAdaptationEnabled:(BOOL)a3;
- (void)setRateControlConfig:(id)a3;
- (void)setReceiveMediaKey:(id)a3;
- (void)setRecommendedMTU:(unint64_t)a3;
- (void)setRedundancyControllerFECVersion:(unsigned __int8)a3;
- (void)setRedundancyControllerMode:(unsigned int)a3;
- (void)setRemoteAddress:(id)a3;
- (void)setRemoteSSRC:(unsigned int)a3;
- (void)setRtcpEnabled:(BOOL)a3;
- (void)setRtcpPSFB_LTRAckEnabled:(BOOL)a3;
- (void)setRtcpReceiveCallbackEnabled:(BOOL)a3;
- (void)setRtcpRemotePort:(unsigned __int16)a3;
- (void)setRtcpSendInterval:(double)a3;
- (void)setRtcpTimeOutEnabled:(BOOL)a3;
- (void)setRtcpTimeOutInterval:(double)a3;
- (void)setRtcpXREnabled:(BOOL)a3;
- (void)setRtpTimeOutEnabled:(BOOL)a3;
- (void)setRtpTimeOutInterval:(double)a3;
- (void)setRtpTimestampRate:(unsigned int)a3;
- (void)setSRTCPCipherSuite:(int64_t)a3;
- (void)setSRTPCipherSuite:(int64_t)a3;
- (void)setSecurityKeyHolder:(tagVCSecurityKeyHolder *)a3;
- (void)setSendMediaKey:(id)a3;
- (void)setSframeCipherSuite:(int)a3;
- (void)setStreamInputID:(int64_t)a3;
- (void)setupMediaStreamConfig;
@end

@implementation VCMediaStreamConfig

- (NSDictionary)allTxPayloadMap
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[VCMediaStreamConfig txPayloadMap](self, "txPayloadMap"));
  v4 = [(VCMediaStreamConfig *)self multiwayConfig];
  if (v4) {
    objc_msgSend(v3, "addEntriesFromDictionary:", -[VCMediaStreamMultiwayConfig txPayloadMap](v4, "txPayloadMap"));
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)allRxPayloadMap
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithDictionary:", -[VCMediaStreamConfig rxPayloadMap](self, "rxPayloadMap"));
  v4 = [(VCMediaStreamConfig *)self multiwayConfig];
  if (v4) {
    objc_msgSend(v3, "addEntriesFromDictionary:", -[VCMediaStreamMultiwayConfig rxPayloadMap](v4, "rxPayloadMap"));
  }

  return (NSDictionary *)v3;
}

- (VCMediaStreamConfig)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamConfig;
  v2 = [(VCMediaStreamConfig *)&v5 init];
  v3 = v2;
  if (v2) {
    [(VCMediaStreamConfig *)v2 setupMediaStreamConfig];
  }
  return v3;
}

- (VCMediaStreamConfig)initWithClientDictionary:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaStreamConfig;
  v4 = [(VCMediaStreamConfig *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    [(VCMediaStreamConfig *)v4 setupMediaStreamConfig];
    if (a3) {
      [(VCMediaStreamConfig *)v5 applyMediaStreamClientDictionary:a3];
    }
  }
  return v5;
}

- (void)setSecurityKeyHolder:(tagVCSecurityKeyHolder *)a3
{
  securityKeyHolder = self->_securityKeyHolder;
  self->_securityKeyHolder = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (securityKeyHolder)
  {
    CFRelease(securityKeyHolder);
  }
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];

  securityKeyHolder = self->_securityKeyHolder;
  if (securityKeyHolder) {
    CFRelease(securityKeyHolder);
  }
  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer)
  {
    CFRelease(jbTargetEstimatorSynchronizer);
    self->_jbTargetEstimatorSynchronizer = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamConfig;
  [(VCMediaStreamConfig *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ (%p)", NSStringFromClass(v4), self];
}

- (void)addRxPayloadType:(int)a3
{
}

- (void)addRxPayloadType:(int)a3 networkPayload:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  rxPayloadMap = self->_rxPayloadMap;
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v4];

  [(NSMutableDictionary *)rxPayloadMap setObject:v6 forKeyedSubscript:v8];
}

- (void)addTxPayloadType:(int)a3
{
}

- (void)addTxPayloadType:(int)a3 networkPayload:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  txPayloadMap = self->_txPayloadMap;
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v4];

  [(NSMutableDictionary *)txPayloadMap setObject:v6 forKeyedSubscript:v8];
}

- (int64_t)primaryTxCodecType
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = (void *)[(NSMutableDictionary *)self->_txPayloadMap allKeys];
  int64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (result)
  {
    int64_t v4 = result;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v2);
      }
      if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) integerValue] != 20)
      {
        int64_t result = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:");
        if ((unint64_t)(result - 11) < 0xFFFFFFFFFFFFFFFELL) {
          break;
        }
      }
      if (v4 == ++v6)
      {
        int64_t result = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
        int64_t v4 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (void)setupMediaStreamConfig
{
  self->_txPayloadMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_rxPayloadMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_remoteAddress = objc_alloc_init(VCNetworkAddress);
  self->_localAddress = objc_alloc_init(VCNetworkAddress);
  self->_cName = (NSString *)[[NSString alloc] initWithString:&stru_1F3D3E450];
  self->_rtcpReceiveCallbackEnabled = 1;
  self->_networkClockID = *MEMORY[0x1E4FAF2F0];
}

- (void)applyMediaStreamClientDictionary:(id)a3
{
  -[VCNetworkAddress setIp:](self->_remoteAddress, "setIp:", [a3 objectForKeyedSubscript:@"vcMediaStreamDestIp"]);
  -[VCNetworkAddress setPort:](self->_remoteAddress, "setPort:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDestPort"), "shortValue"));
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDestIsIPv6"), "BOOLValue"))uint64_t v5 = 6; {
  else
  }
    uint64_t v5 = 4;
  [(VCNetworkAddress *)self->_remoteAddress setIpVersion:v5];
  self->_remoteSSRC = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRemoteSSRC"), "integerValue");
  -[VCNetworkAddress setIp:](self->_localAddress, "setIp:", [a3 objectForKeyedSubscript:@"vcMediaStreamSourceIP"]);
  -[VCNetworkAddress setPort:](self->_localAddress, "setPort:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSourcePort"), "shortValue"));
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSourceIsIPv6"), "BOOLValue"))uint64_t v6 = 6; {
  else
  }
    uint64_t v6 = 4;
  [(VCNetworkAddress *)self->_localAddress setIpVersion:v6];
  -[VCNetworkAddress setInterfaceName:](self->_localAddress, "setInterfaceName:", [a3 objectForKeyedSubscript:@"vcMediaStreamSourceInterfaceName"]);
  self->_localSSRC = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamLocalSSRC"), "integerValue");
  self->_cName = (NSString *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamCName"];
  self->_recommendedMTU = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRecommendedMTU"), "integerValue");
  self->_direction = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDirection"), "integerValue");
  self->_rateAdaptationEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRateAdaptationEnabled"), "BOOLValue");
  self->_rtpTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTPTimeoutEnabled"), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTPTimeoutInterval"), "doubleValue");
  self->_rtpTimeOutInterval = v7;
  self->_decryptionTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDecryptionTimeoutEnabled"), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDecryptionTimeoutInterval"), "doubleValue");
  self->_decryptionTimeOutInterval = v8;
  self->_SRTPCipherSuite = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSRTPCipherSuite"), "integerValue");
  self->_rtcpEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPEnabled"), "BOOLValue");
  self->_rtcpXREnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPXREnabled"), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPSendInterval"), "doubleValue");
  self->_rtcpSendInterval = v9;
  self->_rtcpRemotePort = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPRemotePort"), "integerValue");
  self->_rtcpTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPTimeoutEnabled"), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRTCPTimeoutInterval"), "doubleValue");
  self->_rtcpTimeOutInterval = v10;
  self->_SRTCPCipherSuite = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamSRTCPCipherSuite"), "integerValue");
  self->_sendMediaKey = (NSData *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamSRTPSendMediaKey"];
  self->_receiveMediaKey = (NSData *)(id)[a3 objectForKeyedSubscript:@"vcMediaStreamSRTPReceiveMediaKey"];
  self->_captureSource = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamCaptureSource"), "integerValue");
  self->_streamInputID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamStreamInputID"), "integerValue");
  if ([a3 objectForKeyedSubscript:@"vcMediaStreamNetworkClockID"]) {
    self->_networkClockID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamNetworkClockID"), "unsignedLongLongValue");
  }
  self->_jitterBufferMode = -[VCMediaStreamConfig jitterBufferModeFromAVCJitterBufferMode:](self, "jitterBufferModeFromAVCJitterBufferMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamJitterBufferMode"), "unsignedIntValue"));
  self->_fixedJitterBufferSize = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamFixedJitterBufferSize"), "unsignedLongValue");
  self->_outOfProcessCodecsEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamOutOfProcessCodecsEnabled"), "BOOLValue");
  self->_accessNetworkType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamAccessNetworkType"), "integerValue");
  self->_dscpTag = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamDSCPTag"), "unsignedCharValue");
}

- (int)jitterBufferModeFromAVCJitterBufferMode:(unsigned int)a3
{
  if (a3 == 2) {
    return 3;
  }
  else {
    return a3 == 0;
  }
}

- (tagVCJBTargetEstimatorSynchronizer)jbTargetEstimatorSynchronizer
{
  return self->_jbTargetEstimatorSynchronizer;
}

- (void)setJbTargetEstimatorSynchronizer:(tagVCJBTargetEstimatorSynchronizer *)a3
{
  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer) {
    CFRelease(jbTargetEstimatorSynchronizer);
  }
  self->_jbTargetEstimatorSynchronizer = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (VCNetworkAddress)localAddress
{
  return self->_localAddress;
}

- (void)setLocalAddress:(id)a3
{
}

- (VCNetworkAddress)remoteAddress
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

- (unsigned)localSSRC
{
  return self->_localSSRC;
}

- (void)setLocalSSRC:(unsigned int)a3
{
  self->_localSSRC = a3;
}

- (unsigned)remoteSSRC
{
  return self->_remoteSSRC;
}

- (void)setRemoteSSRC:(unsigned int)a3
{
  self->_remoteSSRC = a3;
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

- (unsigned)rtpTimestampRate
{
  return self->_rtpTimestampRate;
}

- (void)setRtpTimestampRate:(unsigned int)a3
{
  self->_rtpTimestampRate = a3;
}

- (BOOL)isDecryptionTimeOutEnabled
{
  return self->_decryptionTimeOutEnabled;
}

- (void)setDecryptionTimeOutEnabled:(BOOL)a3
{
  self->_decryptionTimeOutEnabled = a3;
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

- (double)decryptionTimeOutInterval
{
  return self->_decryptionTimeOutInterval;
}

- (void)setDecryptionTimeOutInterval:(double)a3
{
  self->_decryptionTimeOutInterval = a3;
}

- (double)decryptionMKMRecoveryInterval
{
  return self->_decryptionMKMRecoveryInterval;
}

- (void)setDecryptionMKMRecoveryInterval:(double)a3
{
  self->_decryptionMKMRecoveryInterval = a3;
}

- (unsigned)cellularUniqueTag
{
  return self->_cellularUniqueTag;
}

- (void)setCellularUniqueTag:(unsigned int)a3
{
  self->_cellularUniqueTag = a3;
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

- (tagVCSecurityKeyHolder)securityKeyHolder
{
  return self->_securityKeyHolder;
}

- (int)sframeCipherSuite
{
  return self->_sframeCipherSuite;
}

- (void)setSframeCipherSuite:(int)a3
{
  self->_sframeCipherSuite = a3;
}

- (NSDictionary)rxPayloadMap
{
  return &self->_rxPayloadMap->super;
}

- (NSDictionary)txPayloadMap
{
  return &self->_txPayloadMap->super;
}

- (BOOL)isRateAdaptationEnabled
{
  return self->_rateAdaptationEnabled;
}

- (void)setRateAdaptationEnabled:(BOOL)a3
{
  self->_rateAdaptationEnabled = a3;
}

- (VCMediaStreamMultiwayConfig)multiwayConfig
{
  return self->_multiwayConfig;
}

- (void)setMultiwayConfig:(id)a3
{
}

- (BOOL)isRTCPReceiveCallbackEnabled
{
  return self->_rtcpReceiveCallbackEnabled;
}

- (void)setRtcpReceiveCallbackEnabled:(BOOL)a3
{
  self->_rtcpReceiveCallbackEnabled = a3;
}

- (VCMediaStreamRateControlConfig)rateControlConfig
{
  return self->_rateControlConfig;
}

- (void)setRateControlConfig:(id)a3
{
}

- (int)captureSource
{
  return self->_captureSource;
}

- (void)setCaptureSource:(int)a3
{
  self->_captureSource = a3;
}

- (VCNetworkFeedbackController)networkFeedbackController
{
  return self->_networkFeedbackController;
}

- (void)setNetworkFeedbackController:(id)a3
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

- (int)jitterBufferMode
{
  return self->_jitterBufferMode;
}

- (void)setJitterBufferMode:(int)a3
{
  self->_jitterBufferMode = a3;
}

- (unint64_t)fixedJitterBufferSize
{
  return self->_fixedJitterBufferSize;
}

- (void)setFixedJitterBufferSize:(unint64_t)a3
{
  self->_fixedJitterBufferSize = a3;
}

- (BOOL)isServerPacketRetransmissionEnabled
{
  return self->_isServerPacketRetransmissionEnabled;
}

- (void)setIsServerPacketRetransmissionEnabled:(BOOL)a3
{
  self->_isServerPacketRetransmissionEnabled = a3;
}

- (BOOL)isUplinkRetransmissionEnabled
{
  return self->_isUplinkRetransmissionEnabled;
}

- (void)setIsUplinkRetransmissionEnabled:(BOOL)a3
{
  self->_isUplinkRetransmissionEnabled = a3;
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

- (int64_t)overlayToken
{
  return self->_overlayToken;
}

- (void)setOverlayToken:(int64_t)a3
{
  self->_overlayToken = a3;
}

- (BOOL)isEnhancedJBAdaptationsEnabled
{
  return self->_isEnhancedJBAdaptationsEnabled;
}

- (void)setIsEnhancedJBAdaptationsEnabled:(BOOL)a3
{
  self->_isEnhancedJBAdaptationsEnabled = a3;
}

- (unsigned)dscpTag
{
  return self->_dscpTag;
}

- (void)setDscpTag:(unsigned __int8)a3
{
  self->_dscpTag = a3;
}

- (BOOL)isRTCPForLossFeedbackEnabled
{
  return self->_isRTCPForLossFeedbackEnabled;
}

- (void)setIsRTCPForLossFeedbackEnabled:(BOOL)a3
{
  self->_isRTCPForLossFeedbackEnabled = a3;
}

- (BOOL)rtcpPSFB_LTRAckEnabled
{
  return self->_rtcpPSFB_LTRAckEnabled;
}

- (void)setRtcpPSFB_LTRAckEnabled:(BOOL)a3
{
  self->_rtcpPSFB_LTRAckEnabled = a3;
}

- (unsigned)nackGeneratorStorebagConfigVersion
{
  return self->_nackGeneratorStorebagConfigVersion;
}

- (void)setNackGeneratorStorebagConfigVersion:(unsigned int)a3
{
  self->_nackGeneratorStorebagConfigVersion = a3;
}

- (BOOL)isExtraDelayForPacketRetransmissionsEnabled
{
  return self->_isExtraDelayForPacketRetransmissionsEnabled;
}

- (void)setIsExtraDelayForPacketRetransmissionsEnabled:(BOOL)a3
{
  self->_isExtraDelayForPacketRetransmissionsEnabled = a3;
}

- (BOOL)isRedundancyControlEnabled
{
  return self->_isRedundancyControlEnabled;
}

- (void)setIsRedundancyControlEnabled:(BOOL)a3
{
  self->_isRedundancyControlEnabled = a3;
}

- (unsigned)maxRedundancyPercentage
{
  return self->_maxRedundancyPercentage;
}

- (void)setMaxRedundancyPercentage:(unsigned int)a3
{
  self->_maxRedundancyPercentage = a3;
}

- (unsigned)redundancyControllerMode
{
  return self->_redundancyControllerMode;
}

- (void)setRedundancyControllerMode:(unsigned int)a3
{
  self->_redundancyControllerMode = a3;
}

- (unsigned)redundancyControllerFECVersion
{
  return self->_redundancyControllerFECVersion;
}

- (void)setRedundancyControllerFECVersion:(unsigned __int8)a3
{
  self->_redundancyControllerFECVersion = a3;
}

- (int)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int)a3
{
  self->_accessNetworkType = a3;
}

@end
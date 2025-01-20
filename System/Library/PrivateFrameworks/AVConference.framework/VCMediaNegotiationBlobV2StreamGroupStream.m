@interface VCMediaNegotiationBlobV2StreamGroupStream
+ (BOOL)isDefaultPayloadConfigsWithStreamConfig:(id)a3 payloadConfigs:(id)a4 streamGroupID:(unsigned int)a5;
+ (BOOL)isFallbackStreamWithStreamGroupID:(unsigned int)a3 streamConfig:(id)a4;
+ (BOOL)payloadSpecWithStreamConfig:(id)a3 payloadConfigs:(id)a4 payloadSpecs:(unsigned int *)a5;
+ (BOOL)payloadsWithStreamConfig:(id)a3 payloadBitmap:(unsigned int *)a4;
+ (BOOL)qualityIndex:(unsigned int *)a3 isFallbackStream:(BOOL *)a4 forStreamGroupID:(unsigned int)a5 streamIndex:(unsigned __int8)a6;
+ (BOOL)streamIndex:(char *)a3 forStreamGroupID:(unsigned int)a4 qualityIndex:(unsigned int)a5 isFallbackStream:(BOOL)a6;
+ (id)defaultsForStreamGroupID:(unsigned int)a3 streamIndex:(unsigned __int8)a4;
+ (int)payloadsWithPayloadBit:(int)a3;
+ (unsigned)metadataWithStreamConfig:(id)a3;
+ (unsigned)payloadFlagWithPayload:(int)a3;
+ (void)appendMetadata:(unsigned int)a3 toString:(id)a4;
+ (void)appendPayloadsSpecsToString:(id)a3 streamConfig:(id)a4;
+ (void)appendPayloadsToString:(id)a3 streamConfig:(id)a4;
+ (void)printWithLogFile:(void *)a3 prefix:(id)a4 streamConfig:(id)a5;
+ (void)updateStreamConfig:(id)a3 withMetadata:(unsigned int)a4;
- (BOOL)hasAudioChannelCount;
- (BOOL)hasCoordinateSystem;
- (BOOL)hasMaxNetworkBitrate;
- (BOOL)hasMaxNetworkBitrateV2;
- (BOOL)hasMetadata;
- (BOOL)hasOptionalPackedPayload;
- (BOOL)hasPayloadSpecOrPayloads;
- (BOOL)hasPayloadsVersion;
- (BOOL)hasQualityIndex;
- (BOOL)hasRepairedMaxNetworkBitrate;
- (BOOL)hasRepairedMaxNetworkBitrateV2;
- (BOOL)hasRequiredPackedPayload;
- (BOOL)hasRtpSSRC;
- (BOOL)hasStreamID;
- (BOOL)hasStreamIndex;
- (BOOL)initSSRC:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)readOptionalPacketPayload:(tagStreamGroupStreamOptionalPackedPayload *)a3;
- (BOOL)readRequiredPacketPayloadWithStreamConfig:(id)a3;
- (BOOL)setNegotiatedCoordinateSystemFromCoordinateSystem:(unsigned int)a3;
- (BOOL)updatePayloadSpecsForConfig:(id)a3 defaultConfig:(id)a4;
- (BOOL)updatePayloadSpecsForConfig:(id)a3 defaultConfig:(id)a4 payloadConfigs:(id)a5;
- (BOOL)usesPayloadConfigsWithGroupID:(unsigned int)a3;
- (NSData)optionalPackedPayload;
- (NSData)requiredPackedPayload;
- (VCMediaNegotiationBlobV2StreamGroupStream)initWithStreamConfig:(id)a3 payloadConfigs:(id)a4 streamGroupID:(unsigned int)a5;
- (VCMediaNegotiationBlobV2StreamGroupStream)initWithStreamConfig:(id)a3 payloadConfigs:(id)a4 streamGroupID:(unsigned int)a5 defaultConfig:(id)a6;
- (id)compressWithConfig:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRequiredPacketPayload;
- (id)description;
- (id)dictionaryRepresentation;
- (id)optionalPackedPayloaWithDefaultConfig:(id)a3;
- (id)optionalPayloadCompressWithConfig:(id)a3;
- (id)requiredPayloadCompressWithConfig:(id)a3;
- (id)streamConfigWithPayloadConfigs:(id)a3 payloadConfigSampleRates:(id)a4 streamGroupID:(unsigned int)a5;
- (unint64_t)hash;
- (unsigned)actualAudioChannelCountWithDefaultConfig:(id)a3;
- (unsigned)actualMaxNetworkBitrateWithDefaultConfig:(id)a3;
- (unsigned)actualMaxRepairedNetworkBitrateWithDefaultConfig:(id)a3;
- (unsigned)actualMetadataWithDefaultConfig:(id)a3;
- (unsigned)actualQualityIndexWithDefaultConfig:(id)a3;
- (unsigned)actualStreamIndex;
- (unsigned)audioChannelCount;
- (unsigned)coordinateSystem;
- (unsigned)maxNetworkBitrate;
- (unsigned)maxNetworkBitrateV2;
- (unsigned)mediaStreamGroupCoordinateSystem;
- (unsigned)metadata;
- (unsigned)payloadSpecOrPayloads;
- (unsigned)payloadsVersion;
- (unsigned)qualityIndex;
- (unsigned)repairedMaxNetworkBitrate;
- (unsigned)repairedMaxNetworkBitrateV2;
- (unsigned)rtpSSRC;
- (unsigned)streamID;
- (unsigned)streamIndex;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAudioChannelCount:(unsigned int)a3;
- (void)setCoordinateSystem:(unsigned int)a3;
- (void)setHasAudioChannelCount:(BOOL)a3;
- (void)setHasCoordinateSystem:(BOOL)a3;
- (void)setHasMaxNetworkBitrate:(BOOL)a3;
- (void)setHasMaxNetworkBitrateV2:(BOOL)a3;
- (void)setHasMetadata:(BOOL)a3;
- (void)setHasPayloadSpecOrPayloads:(BOOL)a3;
- (void)setHasPayloadsVersion:(BOOL)a3;
- (void)setHasQualityIndex:(BOOL)a3;
- (void)setHasRepairedMaxNetworkBitrate:(BOOL)a3;
- (void)setHasRepairedMaxNetworkBitrateV2:(BOOL)a3;
- (void)setHasRtpSSRC:(BOOL)a3;
- (void)setHasStreamID:(BOOL)a3;
- (void)setHasStreamIndex:(BOOL)a3;
- (void)setMaxNetworkBitrate:(unsigned int)a3;
- (void)setMaxNetworkBitrateV2:(unsigned int)a3;
- (void)setMetadata:(unsigned int)a3;
- (void)setOptionalPackedPayload:(id)a3;
- (void)setPayloadSpecOrPayloads:(unsigned int)a3;
- (void)setPayloadsVersion:(unsigned int)a3;
- (void)setQualityIndex:(unsigned int)a3;
- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3;
- (void)setRepairedMaxNetworkBitrateV2:(unsigned int)a3;
- (void)setRequiredPackedPayload:(id)a3;
- (void)setRtpSSRC:(unsigned int)a3;
- (void)setStreamID:(unsigned int)a3;
- (void)setStreamIndex:(unsigned int)a3;
- (void)usePayloadSpecWithGroupID:(unsigned int)a3 qualityIndexForPayloadSpecIndex:(id)a4 defaultPayloadSpecsForQualityIndex:(id)a5;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2StreamGroupStream

- (VCMediaNegotiationBlobV2StreamGroupStream)initWithStreamConfig:(id)a3 payloadConfigs:(id)a4 streamGroupID:(unsigned int)a5 defaultConfig:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v9 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self init];
  if (v9)
  {
    -[VCMediaNegotiationBlobV2StreamGroupStream setStreamIndex:](v9, "setStreamIndex:", [a6 streamIndex]);
    if (![(VCMediaNegotiationBlobV2StreamGroupStream *)v9 initSSRC:a3])
    {
LABEL_43:

      return 0;
    }
    int v10 = [a3 maxNetworkBitrate];
    if (v10 != [a6 maxNetworkBitrate]) {
      -[VCMediaNegotiationBlobV2StreamGroupStream setMaxNetworkBitrateV2:](v9, "setMaxNetworkBitrateV2:", [a3 maxNetworkBitrate]);
    }
    if ([a3 repairedStreamID])
    {
      int v11 = [a3 repairedMaxNetworkBitrate];
      if (v11 != [a6 repairedMaxNetworkBitrate]) {
        -[VCMediaNegotiationBlobV2StreamGroupStream setRepairedMaxNetworkBitrateV2:](v9, "setRepairedMaxNetworkBitrateV2:", [a3 repairedMaxNetworkBitrate]);
      }
    }
    if ([a3 repairedStreamID]
      && ![a6 repairedMaxNetworkBitrate])
    {
      -[VCMediaNegotiationBlobV2StreamGroupStream setRepairedMaxNetworkBitrate:](v9, "setRepairedMaxNetworkBitrate:", [a3 repairedMaxNetworkBitrate]);
    }
    if (![a3 repairedStreamID]
      && [a6 repairedMaxNetworkBitrate])
    {
      [(VCMediaNegotiationBlobV2StreamGroupStream *)v9 setRepairedMaxNetworkBitrate:0];
    }
    int v12 = [a3 audioChannelCount];
    if (v12 != [a6 audioChannelCount]) {
      -[VCMediaNegotiationBlobV2StreamGroupStream setAudioChannelCount:](v9, "setAudioChannelCount:", [a3 audioChannelCount]);
    }
    uint64_t v13 = +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:a3];
    if (v13 != +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:a6])[(VCMediaNegotiationBlobV2StreamGroupStream *)v9 setMetadata:v13]; {
    if (objc_msgSend((id)objc_msgSend(a3, "codecs", 0), "count"))
    }
    {
      if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecWithStreamConfig:a3 payloadConfigs:a4 payloadSpecs:&v17])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:].cold.5();
          }
        }
        goto LABEL_43;
      }
      if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecWithStreamConfig:a6 payloadConfigs:0 payloadSpecs:&v16])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:].cold.4();
          }
        }
        goto LABEL_43;
      }
    }
    else
    {
      if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadsWithStreamConfig:a3 payloadBitmap:&v17])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:]();
          }
        }
        goto LABEL_43;
      }
      if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadsWithStreamConfig:a6 payloadBitmap:&v16])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:]();
          }
        }
        goto LABEL_43;
      }
    }
    if (v17 != v16) {
      -[VCMediaNegotiationBlobV2StreamGroupStream setPayloadSpecOrPayloads:](v9, "setPayloadSpecOrPayloads:");
    }
    int v14 = [a3 coordinateSystem];
    if (v14 != [a6 coordinateSystem]
      && !-[VCMediaNegotiationBlobV2StreamGroupStream setNegotiatedCoordinateSystemFromCoordinateSystem:](v9, "setNegotiatedCoordinateSystemFromCoordinateSystem:", [a3 coordinateSystem]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:defaultConfig:]();
        }
      }
      goto LABEL_43;
    }
  }
  return v9;
}

- (VCMediaNegotiationBlobV2StreamGroupStream)initWithStreamConfig:(id)a3 payloadConfigs:(id)a4 streamGroupID:(unsigned int)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:]();
      }
    }
    goto LABEL_48;
  }
  uint64_t v6 = *(void *)&a5;
  if (objc_msgSend((id)objc_msgSend(a3, "codecs"), "count") && objc_msgSend((id)objc_msgSend(a3, "payloads"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v25 = v21;
        __int16 v26 = 2080;
        v27 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:]";
        __int16 v28 = 1024;
        int v29 = 387;
        __int16 v30 = 2080;
        v31 = FourccToCStr(v6);
        __int16 v32 = 1024;
        int v33 = [a3 qualityIndex];
        __int16 v34 = 2112;
        uint64_t v35 = [a3 payloads];
        __int16 v36 = 2112;
        uint64_t v37 = [a3 codecs];
        _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d groupID='%s' qualityIndex=%u Unable to encode both payload and payload specs. payloads=%@ codecs=%@", buf, 0x40u);
      }
    }
    goto LABEL_48;
  }
  unsigned __int8 v23 = -1;
  if (+[VCMediaNegotiationBlobV2StreamGroupStream streamIndex:forStreamGroupID:qualityIndex:isFallbackStream:](VCMediaNegotiationBlobV2StreamGroupStream, "streamIndex:forStreamGroupID:qualityIndex:isFallbackStream:", &v23, v6, [a3 qualityIndex], +[VCMediaNegotiationBlobV2StreamGroupStream isFallbackStreamWithStreamGroupID:streamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "isFallbackStreamWithStreamGroupID:streamConfig:", v6, a3)))
  {
    id v9 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:v6 streamIndex:v23];
    if (v9)
    {
      id v10 = v9;
      self = [(VCMediaNegotiationBlobV2StreamGroupStream *)self initWithStreamConfig:a3 payloadConfigs:a4 streamGroupID:v6 defaultConfig:v9];
      goto LABEL_30;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:]();
      }
    }
LABEL_48:

    return 0;
  }
  uint64_t v11 = +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:a3];
  if ([(VCMediaNegotiationBlobV2StreamGroupStream *)self metadata] != v11) {
    [(VCMediaNegotiationBlobV2StreamGroupStream *)self setMetadata:v11];
  }
  *(_DWORD *)buf = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "codecs"), "count"))
  {
    if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadSpecWithStreamConfig:a3 payloadConfigs:a4 payloadSpecs:buf])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:].cold.5();
        }
      }
      goto LABEL_48;
    }
  }
  else if (!+[VCMediaNegotiationBlobV2StreamGroupStream payloadsWithStreamConfig:a3 payloadBitmap:buf])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:].cold.4();
      }
    }
    goto LABEL_48;
  }
  unsigned int v12 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self payloadSpecOrPayloads];
  if (v12 != *(_DWORD *)buf) {
    -[VCMediaNegotiationBlobV2StreamGroupStream setPayloadSpecOrPayloads:](self, "setPayloadSpecOrPayloads:");
  }
  unsigned int v13 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self qualityIndex];
  if (v13 != [a3 qualityIndex]) {
    -[VCMediaNegotiationBlobV2StreamGroupStream setQualityIndex:](self, "setQualityIndex:", [a3 qualityIndex]);
  }
  if (![(VCMediaNegotiationBlobV2StreamGroupStream *)self initSSRC:a3]) {
    goto LABEL_48;
  }
  unsigned int v14 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self maxNetworkBitrateV2];
  if (v14 != [a3 maxNetworkBitrate]) {
    -[VCMediaNegotiationBlobV2StreamGroupStream setMaxNetworkBitrateV2:](self, "setMaxNetworkBitrateV2:", [a3 maxNetworkBitrate]);
  }
  if ([a3 repairedStreamID])
  {
    unsigned int v15 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self repairedMaxNetworkBitrateV2];
    if (v15 != [a3 repairedMaxNetworkBitrate]) {
      -[VCMediaNegotiationBlobV2StreamGroupStream setRepairedMaxNetworkBitrateV2:](self, "setRepairedMaxNetworkBitrateV2:", [a3 repairedMaxNetworkBitrate]);
    }
  }
  unsigned int v16 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self audioChannelCount];
  if (v16 != [a3 audioChannelCount]) {
    -[VCMediaNegotiationBlobV2StreamGroupStream setAudioChannelCount:](self, "setAudioChannelCount:", [a3 audioChannelCount]);
  }
  unsigned int v17 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self coordinateSystem];
  if (v17 != [a3 coordinateSystem]
    && !-[VCMediaNegotiationBlobV2StreamGroupStream setNegotiatedCoordinateSystemFromCoordinateSystem:](self, "setNegotiatedCoordinateSystemFromCoordinateSystem:", [a3 coordinateSystem]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initWithStreamConfig:payloadConfigs:streamGroupID:]();
      }
    }
    goto LABEL_48;
  }
  id v10 = 0;
LABEL_30:
  id v18 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self compressWithConfig:v10];
  if (v18)
  {
    v19 = v18;

    return (VCMediaNegotiationBlobV2StreamGroupStream *)v19;
  }
  return self;
}

- (BOOL)initSSRC:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self rtpSSRC];
  if (v5 == [a3 ssrc]) {
    goto LABEL_13;
  }
  unsigned __int16 v6 = [a3 ssrc];
  if ([a3 streamID] != v6)
  {
    -[VCMediaNegotiationBlobV2StreamGroupStream setStreamID:](self, "setStreamID:", [a3 streamID]);
    unsigned __int16 v6 = [a3 streamID];
  }
  if (![a3 v2StreamID]) {
    goto LABEL_10;
  }
  if (v6 >= 0xFF9Bu) {
    int v7 = -65435;
  }
  else {
    int v7 = 100;
  }
  int v8 = v7 + v6;
  if (v8 == [a3 v2StreamID])
  {
    [(VCMediaNegotiationBlobV2StreamGroupStream *)self setPayloadsVersion:2];
LABEL_10:
    if (![a3 repairedStreamID]
      || (unsigned __int16 v9 = v6 + 1, [a3 repairedStreamID] == (unsigned __int16)(v6 + 1)))
    {
      -[VCMediaNegotiationBlobV2StreamGroupStream setRtpSSRC:](self, "setRtpSSRC:", [a3 ssrc]);
LABEL_13:
      LOBYTE(v10) = 1;
      return v10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      unsigned int v12 = *MEMORY[0x1E4F47A50];
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v10) {
        return v10;
      }
      int v16 = 136316162;
      uint64_t v17 = v14;
      __int16 v18 = 2080;
      v19 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initSSRC:]";
      __int16 v20 = 1024;
      int v21 = 463;
      __int16 v22 = 1024;
      int v23 = [a3 repairedStreamID];
      __int16 v24 = 1024;
      int v25 = v9;
      unsigned int v13 = " [%s] %s:%d repairedStreamID=%u does not match lower 16 bits of SSRC + 1 (%u)";
LABEL_21:
      _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v16, 0x28u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    unsigned int v12 = *MEMORY[0x1E4F47A50];
    BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v10) {
      return v10;
    }
    int v16 = 136316162;
    uint64_t v17 = v11;
    __int16 v18 = 2080;
    v19 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) initSSRC:]";
    __int16 v20 = 1024;
    int v21 = 457;
    __int16 v22 = 1024;
    int v23 = [a3 v2StreamID];
    __int16 v24 = 1024;
    int v25 = v8;
    unsigned int v13 = " [%s] %s:%d v2StreamID=%u does not match lower 16 bits of SSRC + 100 (%u)";
    goto LABEL_21;
  }
LABEL_22:
  LOBYTE(v10) = 0;
  return v10;
}

- (id)streamConfigWithPayloadConfigs:(id)a3 payloadConfigSampleRates:(id)a4 streamGroupID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [a3 count];
  if (v9 != [a4 count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:].cold.6();
      }
    }
    goto LABEL_46;
  }
  unsigned int v10 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self actualStreamIndex];
  unsigned int v29 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self qualityIndex];
  if (v10 == 255)
  {
    if ((*(_WORD *)&self->_has & 0x80) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        unsigned int v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:](v11, v5, v12);
        }
      }
LABEL_46:
      unsigned int v15 = 0;
LABEL_47:
      int v23 = 0;
      goto LABEL_36;
    }
  }
  else
  {
    char v28 = 0;
    if (!+[VCMediaNegotiationBlobV2StreamGroupStream qualityIndex:&v29 isFallbackStream:&v28 forStreamGroupID:v5 streamIndex:v10])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        uint64_t v26 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          v27 = FourccToCStr(v5);
          *(_DWORD *)buf = 136316162;
          uint64_t v31 = v25;
          __int16 v32 = 2080;
          int v33 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRat"
                "es:streamGroupID:]";
          __int16 v34 = 1024;
          int v35 = 486;
          __int16 v36 = 2080;
          uint64_t v37 = v27;
          __int16 v38 = 1024;
          unsigned int v39 = v10;
          _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to determine the quality index. streamGroupID=%s streamIndex=%d", buf, 0x2Cu);
        }
      }
      goto LABEL_46;
    }
    id v13 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:v5 streamIndex:v10];
    if (v13)
    {
      uint64_t v14 = v13;
      unsigned int v15 = (VCMediaNegotiatorStreamGroupStreamConfiguration *)v13;
      char v16 = 0;
      goto LABEL_11;
    }
  }
  unsigned int v15 = objc_alloc_init(VCMediaNegotiatorStreamGroupStreamConfiguration);
  uint64_t v14 = 0;
  char v16 = 1;
LABEL_11:
  if (![(VCMediaNegotiationBlobV2StreamGroupStream *)self readRequiredPacketPayloadWithStreamConfig:v15])
  {
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setStreamIndex:v10];
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setSsrc:[(VCMediaNegotiationBlobV2StreamGroupStream *)self rtpSSRC]];
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      unsigned __int16 v17 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self streamID];
    }
    else {
      unsigned __int16 v17 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self rtpSSRC];
    }
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setStreamID:v17];
  }
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setQualityIndex:v29];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setRepairedMaxNetworkBitrate:[(VCMediaNegotiationBlobV2StreamGroupStream *)self actualMaxRepairedNetworkBitrateWithDefaultConfig:v14]];
  if ([(VCMediaNegotiationBlobV2StreamGroupStream(Utils) *)self payloadsVersion] == 2)
  {
    unsigned int v18 = [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 streamID];
    if (v18 < 0xFF9B) {
      __int16 v19 = 100;
    }
    else {
      __int16 v19 = 101;
    }
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setV2StreamID:(unsigned __int16)(v19 + v18)];
  }
  if ([(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 repairedMaxNetworkBitrate]) {
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setRepairedStreamID:(unsigned __int16)([(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 streamID] + 1)];
  }
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setAudioChannelCount:[(VCMediaNegotiationBlobV2StreamGroupStream *)self actualAudioChannelCountWithDefaultConfig:v14]];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setMaxNetworkBitrate:[(VCMediaNegotiationBlobV2StreamGroupStream *)self actualMaxNetworkBitrateWithDefaultConfig:v14]];
  uint64_t v20 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self actualMetadataWithDefaultConfig:v14];
  if (v20 >= 0x10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:]();
      }
    }
    goto LABEL_47;
  }
  +[VCMediaNegotiationBlobV2StreamGroupStream updateStreamConfig:v15 withMetadata:v20];
  if ((v20 & 8) != 0)
  {
    if (![(VCMediaNegotiationBlobV2StreamGroupStream *)self updatePayloadSpecsForConfig:v15 defaultConfig:v14 payloadConfigs:a3])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:].cold.5();
        }
      }
      goto LABEL_47;
    }
    if (![a4 count])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:].cold.4();
        }
      }
      goto LABEL_47;
    }
    uint64_t v22 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", objc_msgSend(-[NSArray firstObject](-[VCMediaNegotiatorStreamGroupStreamConfiguration codecs](v15, "codecs"), "firstObject"), "unsignedIntValue")), "unsignedIntValue");
    goto LABEL_32;
  }
  if (![(VCMediaNegotiationBlobV2StreamGroupStream *)self updatePayloadSpecsForConfig:v15 defaultConfig:v14])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:]();
      }
    }
    goto LABEL_47;
  }
  if ((v16 & 1) == 0)
  {
    uint64_t v22 = [v14 rtpTimestampRate];
LABEL_32:
    uint64_t v21 = v22;
    goto LABEL_33;
  }
  uint64_t v21 = 24000;
LABEL_33:
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setRtpTimestampRate:v21];
  if ((*(_WORD *)&self->_has & 2) != 0) {
    [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v15 setCoordinateSystem:[(VCMediaNegotiationBlobV2StreamGroupStream *)self mediaStreamGroupCoordinateSystem]];
  }
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setSerializedSize:](v15, "setSerializedSize:", objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupStream data](self, "data"), "length"));
  int v23 = v15;
  unsigned int v15 = 0;
LABEL_36:

  return v23;
}

- (void)usePayloadSpecWithGroupID:(unsigned int)a3 qualityIndexForPayloadSpecIndex:(id)a4 defaultPayloadSpecsForQualityIndex:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    id v8 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:*(void *)&a3 streamIndex:[(VCMediaNegotiationBlobV2StreamGroupStream *)self streamIndex]];
  }
  else {
    id v8 = 0;
  }
  uint64_t v9 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self actualQualityIndexWithDefaultConfig:v8];
  if (([(VCMediaNegotiationBlobV2StreamGroupStream *)self actualMetadataWithDefaultConfig:v8] & 8) != 0)
  {
    if (!v8 || (*(_WORD *)&self->_has & 0x20) != 0)
    {
      unsigned int v15 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self payloadSpecOrPayloads];
      if (v15)
      {
        unsigned int v16 = v15;
        uint64_t v17 = 0;
        do
        {
          if (((1 << v17) & v16) != 0)
          {
            uint64_t v18 = [NSNumber numberWithUnsignedInt:v9];
            objc_msgSend(a4, "setObject:forKeyedSubscript:", v18, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v17));
            v16 &= ~(1 << v17);
          }
          uint64_t v17 = (v17 + 1);
        }
        while (v16);
      }
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      unsigned int v10 = (void *)[v8 codecs];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(a5, "setObject:forKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * i), objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9));
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v19 count:16];
        }
        while (v12);
      }
    }
  }
}

+ (void)printWithLogFile:(void *)a3 prefix:(id)a4 streamConfig:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v7 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@", objc_msgSend(a5, "serializedSize"), a4];
  objc_msgSend(v7, "appendFormat:", @"Stream: QualityIndex=%4d", objc_msgSend(a5, "qualityIndex"));
  objc_msgSend(v7, "appendFormat:", @" SSRC=%08x StreamID=%5d NetworkBitrate=%6d", objc_msgSend(a5, "ssrc"), objc_msgSend(a5, "streamID"), objc_msgSend(a5, "maxNetworkBitrate"));
  if ([a5 v2StreamID]) {
    objc_msgSend(v7, "appendFormat:", @" v2StreamID=%5d", objc_msgSend(a5, "v2StreamID"));
  }
  if ([a5 repairedStreamID]) {
    objc_msgSend(v7, "appendFormat:", @" Repair[ID=%5d NetworkBitrate=%6d]", objc_msgSend(a5, "repairedStreamID"), objc_msgSend(a5, "repairedMaxNetworkBitrate"));
  }
  +[VCMediaNegotiationBlobV2StreamGroupStream appendMetadata:toString:](VCMediaNegotiationBlobV2StreamGroupStream, "appendMetadata:toString:", +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:a5], v7);
  if (objc_msgSend((id)objc_msgSend(a5, "codecs"), "count")) {
    +[VCMediaNegotiationBlobV2StreamGroupStream appendPayloadsSpecsToString:v7 streamConfig:a5];
  }
  else {
    +[VCMediaNegotiationBlobV2StreamGroupStream appendPayloadsToString:v7 streamConfig:a5];
  }
  objc_msgSend(v7, "appendFormat:", @" RTPSampleRate=%d", objc_msgSend(a5, "rtpTimestampRate"));
  if ([a5 audioChannelCount]) {
    objc_msgSend(v7, "appendFormat:", @" channels=%u", objc_msgSend(a5, "audioChannelCount"));
  }
  char v8 = [v7 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v9, v10, v11, v12, v13, v14, v8);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    unsigned int v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = v15;
      __int16 v19 = 2080;
      long long v20 = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) printWithLogFile:prefix:streamConfig:]";
      __int16 v21 = 1024;
      int v22 = 592;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

+ (BOOL)isDefaultPayloadConfigsWithStreamConfig:(id)a3 payloadConfigs:(id)a4 streamGroupID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v15 = -1;
  LODWORD(v8) = +[VCMediaNegotiationBlobV2StreamGroupStream streamIndex:forStreamGroupID:qualityIndex:isFallbackStream:](VCMediaNegotiationBlobV2StreamGroupStream, "streamIndex:forStreamGroupID:qualityIndex:isFallbackStream:", &v15, *(void *)&a5, [a3 qualityIndex], +[VCMediaNegotiationBlobV2StreamGroupStream isFallbackStreamWithStreamGroupID:streamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "isFallbackStreamWithStreamGroupID:streamConfig:", *(void *)&a5, a3));
  if (v8)
  {
    id v8 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:v5 streamIndex:v15];
    if (v8)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id obj = (id)[a3 codecs];
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v16 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(obj);
          }
          LODWORD(v8) = +[VCMediaNegotiationBlobV2StreamGroupPayload isDefaultPayloadConfig:index:rtpSampleRate:streamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "isDefaultPayloadConfig:index:rtpSampleRate:streamGroupID:", objc_msgSend(a4, "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "integerValue")), objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "integerValue"), objc_msgSend(a3, "rtpTimestampRate"), v5);
          if (!v8) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [obj countByEnumeratingWithState:&v17 objects:v16 count:16];
            LOBYTE(v8) = 1;
            if (v10) {
              goto LABEL_5;
            }
            return (char)v8;
          }
        }
      }
      else
      {
        LOBYTE(v8) = 1;
      }
    }
  }
  return (char)v8;
}

- (BOOL)usesPayloadConfigsWithGroupID:(unsigned int)a3
{
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    id v4 = +[VCMediaNegotiationBlobV2StreamGroupStream defaultsForStreamGroupID:*(void *)&a3 streamIndex:[(VCMediaNegotiationBlobV2StreamGroupStream *)self streamIndex]];
  }
  else {
    id v4 = 0;
  }
  return ([(VCMediaNegotiationBlobV2StreamGroupStream *)self actualMetadataWithDefaultConfig:v4] >> 3) & 1;
}

+ (BOOL)streamIndex:(char *)a3 forStreamGroupID:(unsigned int)a4 qualityIndex:(unsigned int)a5 isFallbackStream:(BOOL)a6
{
  if (a4 == 1835623282 && a5 == 25 && !a6) {
    goto LABEL_23;
  }
  BOOL v9 = a6;
  if (a4 == 1835623282 && a5 == 200 && !a6) {
    goto LABEL_11;
  }
  int64_t v13 = +[VCHardwareSettings deviceClass];
  if (a4 == 1835623282 && a5 == 240 && v13 == 8 && !v9) {
    goto LABEL_19;
  }
  if (a4 == 1667329381 && a5 == 35 && !v9) {
    goto LABEL_23;
  }
  if (a4 == 1667329381 && a5 == 62 && !v9) {
    goto LABEL_11;
  }
  if (a4 == 1667329381 && a5 == 125 && !v9) {
    goto LABEL_19;
  }
  if (a4 == 1667329381 && a5 == 250 && !v9)
  {
LABEL_35:
    char v12 = 3;
    goto LABEL_24;
  }
  if (a4 == 1667329381 && a5 == 425 && !v9)
  {
LABEL_39:
    char v12 = 4;
    goto LABEL_24;
  }
  if (a4 == 1667329381 && a5 == 1000 && !v9)
  {
LABEL_43:
    char v12 = 5;
    goto LABEL_24;
  }
  if (a4 == 1667329381 && a5 == 1800 && !v9)
  {
LABEL_47:
    char v12 = 6;
    goto LABEL_24;
  }
  if (a4 == 1937339233 && a5 == 101 && !v9) {
    goto LABEL_23;
  }
  if (a4 == 1937339233 && a5 == 332 && !v9) {
    goto LABEL_11;
  }
  if (a4 == 1935897189 && a5 == 100 && !v9) {
    goto LABEL_23;
  }
  BOOL v16 = a4 == 1935897189 && a5 == 120;
  int v17 = !v16;
  if (v16 && !v9) {
    goto LABEL_11;
  }
  BOOL v18 = a4 == 1935897189 && a5 == 150;
  BOOL v19 = !v18;
  if (v18 && !v9)
  {
LABEL_19:
    char v12 = 2;
    goto LABEL_24;
  }
  BOOL v20 = a4 == 1935897189 && a5 == 350;
  int v21 = !v20;
  if (v20 && !v9) {
    goto LABEL_35;
  }
  BOOL v22 = a4 == 1935897189 && a5 == 390;
  int v23 = !v22;
  if (v22 && !v9) {
    goto LABEL_39;
  }
  if (a4 == 1935897189 && a5 == 450 && !v9) {
    goto LABEL_43;
  }
  if (a4 == 1935897189 && a5 == 700 && !v9) {
    goto LABEL_47;
  }
  if (a4 == 1935897189 && a5 == 950 && !v9)
  {
    char v12 = 7;
    goto LABEL_24;
  }
  int v24 = !v9;
  if ((!v9 | v17) != 1)
  {
    char v12 = 8;
    goto LABEL_24;
  }
  if ((v24 | v19) != 1)
  {
    char v12 = 9;
    goto LABEL_24;
  }
  if ((v24 | v21) != 1)
  {
    char v12 = 10;
    goto LABEL_24;
  }
  if ((v24 | v23) != 1)
  {
    char v12 = 11;
    goto LABEL_24;
  }
  if (a4 == 1667329399 && a5 == 93 && !v9) {
    goto LABEL_23;
  }
  if (a4 == 1667329399 && a5 == 400 && !v9) {
    goto LABEL_11;
  }
  if (a4 == 1667329399 && a5 == 1250 && !v9) {
    goto LABEL_19;
  }
  if (a4 == 1835623287 && a5 == 27 && !v9) {
    goto LABEL_23;
  }
  if (a4 == 1835623287 && a5 == 162 && !v9) {
    goto LABEL_11;
  }
  if (a4 == 1667330164 && a5 == 15 && !v9 || a4 == 1718909044 && a5 == 96 && !v9) {
    goto LABEL_23;
  }
  if (a4 == 1718909044 && a5 == 135 && !v9)
  {
LABEL_11:
    char v12 = 1;
LABEL_24:
    *a3 = v12;
    return 1;
  }
  if (a4 == 1718909044 && a5 == 275 && !v9) {
    goto LABEL_19;
  }
  if (a4 == 1650745716 && a5 == 98 && !v9) {
    goto LABEL_11;
  }
  if (a4 == 1650745716 && a5 == 140 && !v9) {
    goto LABEL_19;
  }
  if (a4 == 1936290409 && a5 == 30 && !v9) {
    goto LABEL_23;
  }
  if (a4 == 1936290409 && a5 == 210 && !v9) {
    goto LABEL_11;
  }
  if (a4 == 1717854580 && a5 == 99 && !v9)
  {
LABEL_23:
    char v12 = 0;
    goto LABEL_24;
  }
  BOOL result = 0;
  if (a4 == 1717854580 && a5 == 145 && !v9) {
    goto LABEL_11;
  }
  return result;
}

+ (BOOL)qualityIndex:(unsigned int *)a3 isFallbackStream:(BOOL *)a4 forStreamGroupID:(unsigned int)a5 streamIndex:(unsigned __int8)a6
{
  if (a5 == 1835623282 && a6 == 0)
  {
    BOOL v11 = 0;
    unsigned int v12 = 25;
    goto LABEL_9;
  }
  int v9 = a6;
  if (a5 == 1835623282 && a6 == 1)
  {
    BOOL v11 = 0;
    unsigned int v12 = 200;
LABEL_9:
    *a3 = v12;
    *a4 = v11;
    return 1;
  }
  int64_t v14 = +[VCHardwareSettings deviceClass];
  if (a5 == 1835623282 && v9 == 2 && v14 == 8)
  {
    BOOL v11 = 0;
    unsigned int v12 = 240;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && !v9)
  {
    BOOL v11 = 0;
    unsigned int v12 = 35;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 1)
  {
    BOOL v11 = 0;
    unsigned int v12 = 62;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 2)
  {
    BOOL v11 = 0;
    unsigned int v12 = 125;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 3)
  {
    BOOL v11 = 0;
    unsigned int v12 = 250;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 4)
  {
    BOOL v11 = 0;
    unsigned int v12 = 425;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 5)
  {
    BOOL v11 = 0;
    unsigned int v12 = 1000;
    goto LABEL_9;
  }
  if (a5 == 1667329381 && v9 == 6)
  {
    BOOL v11 = 0;
    unsigned int v12 = 1800;
    goto LABEL_9;
  }
  if (a5 == 1937339233 && !v9)
  {
    BOOL v11 = 0;
    unsigned int v12 = 101;
    goto LABEL_9;
  }
  if (a5 == 1937339233 && v9 == 1)
  {
    BOOL v11 = 0;
    unsigned int v12 = 332;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && !v9)
  {
    BOOL v11 = 0;
    unsigned int v12 = 100;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 1)
  {
    BOOL v11 = 0;
LABEL_48:
    unsigned int v12 = 120;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 2)
  {
    BOOL v11 = 0;
LABEL_52:
    unsigned int v12 = 150;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 3)
  {
    BOOL v11 = 0;
LABEL_56:
    unsigned int v12 = 350;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 4)
  {
    BOOL v11 = 0;
LABEL_60:
    unsigned int v12 = 390;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 5)
  {
    BOOL v11 = 0;
    unsigned int v12 = 450;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 6)
  {
    BOOL v11 = 0;
    unsigned int v12 = 700;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 7)
  {
    BOOL v11 = 0;
    unsigned int v12 = 950;
    goto LABEL_9;
  }
  if (a5 == 1935897189 && v9 == 8)
  {
    BOOL v11 = 1;
    goto LABEL_48;
  }
  if (a5 == 1935897189 && v9 == 9)
  {
    BOOL v11 = 1;
    goto LABEL_52;
  }
  if (a5 == 1935897189 && v9 == 10)
  {
    BOOL v11 = 1;
    goto LABEL_56;
  }
  if (a5 == 1935897189 && v9 == 11)
  {
    BOOL v11 = 1;
    goto LABEL_60;
  }
  if (a5 == 1667329399 && !v9)
  {
    BOOL v11 = 0;
    unsigned int v12 = 93;
    goto LABEL_9;
  }
  if (a5 == 1667329399 && v9 == 1)
  {
    BOOL v11 = 0;
    unsigned int v12 = 400;
    goto LABEL_9;
  }
  if (a5 == 1667329399 && v9 == 2)
  {
    BOOL v11 = 0;
    unsigned int v12 = 1250;
    goto LABEL_9;
  }
  if (a5 == 1835623287 && !v9)
  {
    BOOL v11 = 0;
    unsigned int v12 = 27;
    goto LABEL_9;
  }
  if (a5 == 1835623287 && v9 == 1)
  {
    BOOL v11 = 0;
    unsigned int v12 = 162;
    goto LABEL_9;
  }
  if (a5 == 1667330164 && !v9)
  {
    BOOL v11 = 0;
    unsigned int v12 = 15;
    goto LABEL_9;
  }
  if (a5 == 1718909044 && !v9)
  {
    BOOL v11 = 0;
    unsigned int v12 = 96;
    goto LABEL_9;
  }
  if (a5 == 1718909044 && v9 == 1)
  {
    BOOL v11 = 0;
    unsigned int v12 = 135;
    goto LABEL_9;
  }
  if (a5 == 1718909044 && v9 == 2)
  {
    BOOL v11 = 0;
    unsigned int v12 = 275;
    goto LABEL_9;
  }
  if (a5 == 1650745716 && v9 == 1)
  {
    BOOL v11 = 0;
    unsigned int v12 = 98;
    goto LABEL_9;
  }
  if (a5 == 1650745716 && v9 == 2)
  {
    BOOL v11 = 0;
    unsigned int v12 = 140;
    goto LABEL_9;
  }
  if (a5 == 1936290409 && !v9)
  {
    BOOL v11 = 0;
    unsigned int v12 = 30;
    goto LABEL_9;
  }
  if (a5 == 1936290409 && v9 == 1)
  {
    BOOL v11 = 0;
    unsigned int v12 = 210;
    goto LABEL_9;
  }
  if (a5 == 1717854580 && !v9)
  {
    BOOL v11 = 0;
    unsigned int v12 = 99;
    goto LABEL_9;
  }
  if (a5 != 1717854580) {
    return 0;
  }
  BOOL result = 0;
  if (v9 == 1)
  {
    BOOL v11 = 0;
    unsigned int v12 = 145;
    goto LABEL_9;
  }
  return result;
}

+ (id)defaultsForStreamGroupID:(unsigned int)a3 streamIndex:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((int)a3 <= 1718909043)
  {
    if ((int)a3 <= 1667329398)
    {
      if (a3 != 1650745716)
      {
        if (a3 == 1667329381)
        {
          switch(a4)
          {
            case 0u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 0;
              LODWORD(v20) = 0;
              BOOL v18 = &unk_1F3DC7290;
              uint64_t v19 = 0x6000000060;
              LOWORD(v17) = 0;
              uint64_t v16 = 0x5DC00000000FLL;
              uint64_t v6 = 35;
              uint64_t v7 = 35100;
              uint64_t v9 = 20000;
              goto LABEL_52;
            case 1u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 1;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 62, 63900, 50000, 15, 130000, 0, 0x5DC00000000FLL, v17, 0, &unk_1F3DC72A8, 0xC0000000C0, v20, v21);
              goto LABEL_90;
            case 2u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 2;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 125, 114000, 100000, 15, 230000, 0, 0x5DC00000000FLL, v17, 0, &unk_1F3DC72C0, 0xF0000000F0, v20, v21);
              goto LABEL_90;
            case 3u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 3;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 250, 225400, 200000, 30, 460500, 0, 0x5DC00000001ELL, v17, 0, &unk_1F3DC72D8, 0x14000000140, v20, v21);
              goto LABEL_90;
            case 4u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 4;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 425, 451000, 400000, 30, 961000, 0, 0x5DC00000001ELL, v17, 0, &unk_1F3DC72F0, 0x1E0000001E0, v20, v21);
              goto LABEL_90;
            case 5u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 5;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 1000, 902000, 800000, 30, 1370000, 0, 0x5DC00000001ELL, v17, 0, &unk_1F3DC7308, 0x2D0000002D0, v20, v21);
              goto LABEL_90;
            case 6u:
              LODWORD(v21) = 3;
              BYTE4(v20) = 6;
              LODWORD(v20) = 0;
              LOWORD(v17) = 0;
              id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 1800, 1780000, 1600000, 30, 2710000, 0, 0x5DC00000001ELL, v17, 0, &unk_1F3DC7320, 0x44000000440, v20, v21);
              goto LABEL_90;
            default:
              goto LABEL_91;
          }
        }
        goto LABEL_91;
      }
      if (a4 != 2)
      {
        if (a4 != 1) {
          goto LABEL_91;
        }
        uint64_t v9 = 70000;
        uint64_t v7 = 80560;
        LODWORD(v21) = 0;
        BYTE4(v20) = 1;
        LODWORD(v20) = 0;
        BOOL v18 = &unk_1F3DC7560;
        uint64_t v19 = 0;
        LOWORD(v17) = 1;
        uint64_t v16 = 0x5DC000000000;
        uint64_t v6 = 98;
LABEL_52:
        uint64_t v11 = 15;
        goto LABEL_89;
      }
      uint64_t v7 = 130640;
      LODWORD(v21) = 0;
      BYTE4(v20) = 2;
      LODWORD(v20) = 0;
      BOOL v18 = &unk_1F3DC7578;
      uint64_t v19 = 0;
      LOWORD(v17) = 1;
      uint64_t v16 = 0x5DC000000000;
      uint64_t v6 = 140;
      unsigned __int16 v12 = -21072;
    }
    else
    {
      if (a3 == 1667329399)
      {
        if (a4 == 2)
        {
          uint64_t v7 = 882600;
          LODWORD(v21) = 3;
          BYTE4(v20) = 2;
          LODWORD(v20) = 0;
          uint64_t v19 = 0x2D0000002D0;
          BOOL v18 = &unk_1F3DC74B8;
          LOWORD(v17) = 0;
          uint64_t v16 = 0x15F900000001ELL;
          uint64_t v6 = 1250;
          uint64_t v9 = 800000;
        }
        else
        {
          if (a4 != 1)
          {
            if (a4) {
              goto LABEL_91;
            }
            LODWORD(v21) = 3;
            BYTE4(v20) = 0;
            LODWORD(v20) = 0;
            BOOL v18 = &unk_1F3DC7488;
            uint64_t v19 = 0xC0000000C0;
            LOWORD(v17) = 0;
            uint64_t v16 = 0x15F900000000FLL;
            uint64_t v6 = 93;
            uint64_t v7 = 63300;
LABEL_37:
            uint64_t v9 = 50000;
            goto LABEL_52;
          }
          LODWORD(v21) = 3;
          BYTE4(v20) = 1;
          LODWORD(v20) = 0;
          uint64_t v19 = 0x14000000140;
          BOOL v18 = &unk_1F3DC74A0;
          LOWORD(v17) = 0;
          uint64_t v16 = 0x15F900000001ELL;
          uint64_t v6 = 400;
          uint64_t v7 = 220640;
          uint64_t v9 = 200000;
        }
LABEL_86:
        uint64_t v11 = 30;
        goto LABEL_89;
      }
      if (a3 == 1667330164)
      {
        if (a4 != 2)
        {
          if (a4 != 1)
          {
            if (a4) {
              goto LABEL_91;
            }
            LODWORD(v21) = 0;
            BYTE4(v20) = 0;
            LODWORD(v20) = 0;
            LOWORD(v17) = 0;
            +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 15, 5000, 5000, 2, 0, 0, 0x5DC000000000, v17, 0, &unk_1F3DC7500, 0, v20, v21);
LABEL_42:
            LODWORD(v21) = 0;
            BYTE4(v20) = v4;
            LODWORD(v20) = 0;
            LOWORD(v17) = 0;
            id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 96, 172772, 149252, 30, 344104, 0, 0x5DC00000001ELL, v17, 0, &unk_1F3DC7518, 0x30000000100, v20, v21);
            goto LABEL_90;
          }
LABEL_54:
          LODWORD(v21) = 0;
          BYTE4(v20) = a4;
          LODWORD(v20) = 0;
          LOWORD(v17) = 0;
          id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 135, 261812, 239252, 30, 522664, 0, 0x5DC00000001ELL, v17, 0, &unk_1F3DC7530, 0x30000000100, v20, v21);
          goto LABEL_90;
        }
LABEL_53:
        LODWORD(v21) = 0;
        BYTE4(v20) = a4;
        LODWORD(v20) = 0;
        LOWORD(v17) = 0;
        id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 275, 502452, 459252, 30, 864558, 0, 0x5DC00000001ELL, v17, 0, &unk_1F3DC7548, 0x30000000100, v20, v21);
        goto LABEL_90;
      }
      if (a3 != 1717854580) {
        goto LABEL_91;
      }
      if (a4 != 1)
      {
        if (a4) {
          goto LABEL_91;
        }
        LODWORD(v21) = 0;
        BYTE4(v20) = 0;
        LODWORD(v20) = 0;
        BOOL v18 = &unk_1F3DC75C0;
        uint64_t v19 = 0;
        LOWORD(v17) = 1;
        uint64_t v16 = 0x5DC000000000;
        uint64_t v6 = 99;
        uint64_t v7 = 59720;
        goto LABEL_37;
      }
      LODWORD(v21) = 0;
      BYTE4(v20) = 1;
      LODWORD(v20) = 0;
      BOOL v18 = &unk_1F3DC75D8;
      uint64_t v19 = 0;
      LOWORD(v17) = 1;
      uint64_t v16 = 0x5DC000000000;
      uint64_t v6 = 145;
      uint64_t v7 = 118960;
      unsigned __int16 v12 = -31072;
    }
    uint64_t v9 = v12 | 0x10000u;
    goto LABEL_86;
  }
  if ((int)a3 <= 1935897188)
  {
    if (a3 != 1718909044)
    {
      if (a3 == 1835623282)
      {
        if (a4 != 1)
        {
          if (!a4)
          {
            LODWORD(v21) = 0;
            BYTE4(v20) = 0;
            LODWORD(v20) = 1;
            LOWORD(v17) = 0;
            id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 25, 28933, 13200, 16, 0, 0, 0x5DC000000000, v17, 0, &unk_1F3DC7248, 0, v20, v21);
            goto LABEL_90;
          }
          int64_t v13 = +[VCHardwareSettings deviceClass];
          if (v4 == 2 && v13 == 8)
          {
            LODWORD(v21) = 0;
            BYTE4(v20) = 2;
            LODWORD(v20) = 1;
            LOWORD(v17) = 0;
            id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 240, 156800, 64000, 100, 0, 0, 0x5DC000000000, v17, 0, &unk_1F3DC7278, 0, v20, v21);
            goto LABEL_90;
          }
          goto LABEL_91;
        }
        LODWORD(v21) = 0;
        BYTE4(v20) = 1;
        LODWORD(v20) = 1;
        BOOL v18 = &unk_1F3DC7260;
        uint64_t v19 = 0;
        LOWORD(v17) = 0;
        uint64_t v16 = 0x5DC000000000;
        uint64_t v6 = 200;
      }
      else
      {
        if (a3 != 1835623287) {
          goto LABEL_91;
        }
        if (a4 != 1)
        {
          if (!a4)
          {
            LODWORD(v21) = 0;
            BYTE4(v20) = 0;
            LODWORD(v20) = 1;
            BOOL v18 = &unk_1F3DC74D0;
            uint64_t v19 = 0;
            LOWORD(v17) = 0;
            uint64_t v16 = 0xBB8000000000;
            uint64_t v6 = 27;
LABEL_48:
            uint64_t v7 = 27066;
            uint64_t v9 = 13200;
            uint64_t v11 = 17;
LABEL_89:
            id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", v6, v7, v9, v11, 0, 0, v16, v17, 0, v18, v19, v20, v21);
LABEL_90:
            if (result) {
              return result;
            }
            goto LABEL_91;
          }
          goto LABEL_91;
        }
        LODWORD(v21) = 0;
        BYTE4(v20) = 1;
        LODWORD(v20) = 1;
        BOOL v18 = &unk_1F3DC74E8;
        uint64_t v19 = 0;
        LOWORD(v17) = 0;
        uint64_t v16 = 0xBB8000000000;
        uint64_t v6 = 162;
      }
      goto LABEL_63;
    }
    if (a4 != 2)
    {
      if (a4 != 1)
      {
        if (a4) {
          goto LABEL_91;
        }
        goto LABEL_42;
      }
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  if (a3 == 1935897189)
  {
    switch(a4)
    {
      case 0u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 0;
        LODWORD(v20) = 0;
        LOWORD(v17) = 0;
        id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 100, 366666, 333333, 10, 0, 0, 0xBB800000000ALL, v17, 0, &unk_1F3DC7368, 0x41A00000672, v20, v21);
        goto LABEL_90;
      case 1u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 1;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC7380;
        LOWORD(v17) = 1;
        uint64_t v16 = 0xBB800000003CLL;
        uint64_t v6 = 120;
        uint64_t v7 = 550000;
        uint64_t v9 = 500000;
        break;
      case 2u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 2;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC7398;
        LOWORD(v17) = 1;
        uint64_t v16 = 0xBB800000003CLL;
        uint64_t v6 = 150;
        uint64_t v7 = 880000;
        uint64_t v9 = 800000;
        break;
      case 3u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 3;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC73B0;
        LOWORD(v17) = 1;
        uint64_t v16 = 0xBB800000003CLL;
        uint64_t v6 = 350;
        uint64_t v7 = 1430000;
        uint64_t v9 = 1300000;
        break;
      case 4u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 4;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC73C8;
        LOWORD(v17) = 1;
        uint64_t v16 = 0xBB800000003CLL;
        uint64_t v6 = 390;
        uint64_t v7 = 2310000;
        uint64_t v9 = 2100000;
        break;
      case 5u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 5;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC73E0;
        LOWORD(v17) = 1;
        uint64_t v16 = 0xBB800000003CLL;
        uint64_t v6 = 450;
        uint64_t v7 = 3520000;
        uint64_t v9 = 3200000;
        break;
      case 6u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 6;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC73F8;
        LOWORD(v17) = 1;
        uint64_t v16 = 0xBB800000003CLL;
        uint64_t v6 = 700;
        uint64_t v7 = 4620000;
        uint64_t v9 = 4200000;
        break;
      case 7u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 7;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC7410;
        LOWORD(v17) = 1;
        uint64_t v16 = 0xBB800000003CLL;
        uint64_t v6 = 950;
        uint64_t v7 = 5500000;
        uint64_t v9 = 5000000;
        break;
      case 8u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 8;
        LODWORD(v20) = 0;
        LOWORD(v17) = 0;
        id result = +[VCMediaNegotiatorStreamGroupStreamConfiguration configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:](VCMediaNegotiatorStreamGroupStreamConfiguration, "configWithQualityIndex:nwBitrate:mediaBitrate:maxPacketsPerSecond:repairedNwBitrate:keyFrameInterval:framerate:rtpSampleRate:isTemporal:isSubStream:metadata:payloads:codecs:width:height:audioChannelCount:streamIndex:coordinateSystem:", 120, 1100000, 1000000, 5, 0, 0, 0xBB8000000005, v17, 0, &unk_1F3DC7428, 0x41A00000672, v20, v21);
        goto LABEL_90;
      case 9u:
        LODWORD(v21) = 1;
        BYTE4(v20) = 9;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC7440;
        LOWORD(v17) = 0;
        uint64_t v16 = 0xBB800000000FLL;
        uint64_t v6 = 150;
        uint64_t v7 = 2200000;
        uint64_t v9 = 2000000;
        goto LABEL_52;
      case 0xAu:
        LODWORD(v21) = 1;
        BYTE4(v20) = 10;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC7458;
        LOWORD(v17) = 0;
        uint64_t v16 = 0xBB800000001ELL;
        uint64_t v6 = 350;
        uint64_t v7 = 3300000;
        uint64_t v9 = 3000000;
        goto LABEL_86;
      case 0xBu:
        LODWORD(v21) = 1;
        BYTE4(v20) = 11;
        LODWORD(v20) = 0;
        uint64_t v19 = 0x41A00000672;
        BOOL v18 = &unk_1F3DC7470;
        LOWORD(v17) = 0;
        uint64_t v16 = 0xBB800000003CLL;
        uint64_t v6 = 390;
        uint64_t v7 = 4400000;
        uint64_t v9 = 4000000;
        break;
      default:
        goto LABEL_91;
    }
    uint64_t v11 = 60;
    goto LABEL_89;
  }
  if (a3 != 1936290409)
  {
    if (a3 != 1937339233) {
      goto LABEL_91;
    }
    if (a4 == 1)
    {
      uint64_t v7 = 157600;
      LODWORD(v21) = 0;
      BYTE4(v20) = 1;
      LODWORD(v20) = 2;
      BOOL v18 = &unk_1F3DC7350;
      uint64_t v19 = 0;
      LOWORD(v17) = 0;
      uint64_t v16 = 0xBB8000000000;
      uint64_t v6 = 332;
      uint64_t v9 = 128000;
LABEL_65:
      uint64_t v11 = 25;
      goto LABEL_89;
    }
    if (a4) {
      goto LABEL_91;
    }
    LODWORD(v21) = 0;
    BYTE4(v20) = 0;
    LODWORD(v20) = 2;
    BOOL v18 = &unk_1F3DC7338;
    uint64_t v19 = 0;
    LOWORD(v17) = 0;
    uint64_t v16 = 0xBB8000000000;
    uint64_t v6 = 101;
    unsigned __int16 v8 = 14064;
LABEL_64:
    uint64_t v7 = v8 | 0x10000u;
    uint64_t v9 = 48000;
    goto LABEL_65;
  }
  if (a4 == 1)
  {
    LODWORD(v21) = 0;
    BYTE4(v20) = 1;
    LODWORD(v20) = 1;
    BOOL v18 = &unk_1F3DC75A8;
    uint64_t v19 = 0;
    LOWORD(v17) = 0;
    uint64_t v16 = 0xBB8000000000;
    uint64_t v6 = 332;
LABEL_63:
    unsigned __int16 v8 = 5664;
    goto LABEL_64;
  }
  if (!a4)
  {
    LODWORD(v21) = 0;
    BYTE4(v20) = 0;
    LODWORD(v20) = 1;
    BOOL v18 = &unk_1F3DC7590;
    uint64_t v19 = 0;
    LOWORD(v17) = 0;
    uint64_t v16 = 0xBB8000000000;
    uint64_t v6 = 101;
    goto LABEL_48;
  }
LABEL_91:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    unsigned __int8 v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = v14;
      __int16 v24 = 2080;
      uint64_t v25 = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) defaultsForStreamGroupID:streamIndex:]";
      __int16 v26 = 1024;
      int v27 = 869;
      __int16 v28 = 2080;
      unsigned int v29 = FourccToCStr(a3);
      __int16 v30 = 1024;
      int v31 = v4;
      _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate config for known stream type. streamGroupID=%s streamIndex=%d!", buf, 0x2Cu);
    }
  }
  return 0;
}

+ (BOOL)isFallbackStreamWithStreamGroupID:(unsigned int)a3 streamConfig:(id)a4
{
  if (a3 != 1935897189) {
    return 0;
  }
  if ([a4 isTemporalStream]) {
    return 0;
  }
  return [a4 qualityIndex] > 0x77;
}

+ (unsigned)metadataWithStreamConfig:(id)a3
{
  if ([a3 isTemporalStream]) {
    int v4 = 2;
  }
  else {
    int v4 = 0;
  }
  int v5 = v4 | [a3 isSubStream];
  int v6 = v5 | (4 * ([a3 keyFrameInterval] == 0));
  return v6 | (8 * (objc_msgSend((id)objc_msgSend(a3, "codecs"), "count") != 0));
}

+ (void)updateStreamConfig:(id)a3 withMetadata:(unsigned int)a4
{
  [a3 setIsSubStream:a4 & 1];
  [a3 setIsTemporalStream:(a4 >> 1) & 1];

  [a3 setKeyFrameInterval:((a4 >> 2) & 1) == 0];
}

+ (unsigned)payloadFlagWithPayload:(int)a3
{
  if (a3 > 118)
  {
    switch(a3)
    {
      case 'w':
        unsigned int result = 8;
        break;
      case '{':
        unsigned int result = 1;
        break;
      case '|':
        unsigned int result = 512;
        break;
      case '}':
        unsigned int result = 1024;
        break;
      default:
LABEL_17:
        unsigned int result = 0;
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        return 2;
      case 'e':
        return 64;
      case 'f':
      case 'g':
      case 'i':
      case 'j':
      case 'k':
      case 'm':
        goto LABEL_17;
      case 'h':
        return 16;
      case 'l':
        return 32;
      case 'n':
        return 4;
      default:
        if (a3 == 13)
        {
          unsigned int result = 256;
        }
        else
        {
          if (a3 != 20) {
            goto LABEL_17;
          }
          unsigned int result = 128;
        }
        break;
    }
  }
  return result;
}

+ (BOOL)payloadsWithStreamConfig:(id)a3 payloadBitmap:(unsigned int *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v5 = (void *)[a3 payloads];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unsigned int v8 = 0;
      uint64_t v9 = *(void *)v16;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        unsigned int v11 = +[VCMediaNegotiationBlobV2StreamGroupStream payloadFlagWithPayload:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadFlagWithPayload:", [*(id *)(*((void *)&v15 + 1) + 8 * v10) unsignedIntValue]);
        if (!v11) {
          break;
        }
        v8 |= v11;
        if (v7 == ++v10)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_17;
      }
      VRTraceErrorLogLevelToCSTR();
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v12)
      {
        +[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithStreamConfig:payloadBitmap:]();
        goto LABEL_17;
      }
    }
    else
    {
      unsigned int v8 = 0;
LABEL_12:
      *a4 = v8;
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v12) {
        return v12;
      }
      +[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithStreamConfig:payloadBitmap:]();
    }
LABEL_17:
    LOBYTE(v12) = 0;
  }
  return v12;
}

+ (BOOL)payloadSpecWithStreamConfig:(id)a3 payloadConfigs:(id)a4 payloadSpecs:(unsigned int *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = (void *)[a3 codecs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unsigned int v10 = 0;
    uint64_t v11 = *(void *)v30;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v7);
      }
      unsigned int v13 = [*(id *)(*((void *)&v29 + 1) + 8 * v12) unsignedIntValue];
      if (a4)
      {
        if ([a4 count] <= (unint64_t)v13) {
          break;
        }
      }
      v10 |= 1 << v13;
      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v28 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      long long v16 = *MEMORY[0x1E4F47A50];
      BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v14) {
        return v14;
      }
      int v18 = 136316162;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      uint64_t v21 = "+[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadSpecWithStreamConfig:payloadConfigs:payloadSpecs:]";
      __int16 v22 = 1024;
      int v23 = 937;
      __int16 v24 = 1024;
      unsigned int v25 = v13;
      __int16 v26 = 2048;
      uint64_t v27 = [a4 count];
      _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid index=%u in payload configs (%lul)", (uint8_t *)&v18, 0x2Cu);
    }
    LOBYTE(v14) = 0;
  }
  else
  {
    unsigned int v10 = 0;
LABEL_12:
    *a5 = v10;
    LOBYTE(v14) = 1;
  }
  return v14;
}

+ (int)payloadsWithPayloadBit:(int)a3
{
  if (a3 > 63)
  {
    if (a3 <= 255)
    {
      if (a3 == 64) {
        return 101;
      }
      if (a3 == 128) {
        return 20;
      }
    }
    else
    {
      switch(a3)
      {
        case 256:
          return 13;
        case 512:
          return 124;
        case 1024:
          return 125;
      }
    }
LABEL_15:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCMediaNegotiationBlobV2StreamGroupStream(Utils) payloadsWithPayloadBit:]();
      }
    }
    return 128;
  }
  else
  {
    switch(a3)
    {
      case 1:
        return 123;
      case 2:
        return 100;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_15;
      case 4:
        return 110;
      case 8:
        return 119;
      default:
        if (a3 == 16)
        {
          int result = 104;
        }
        else
        {
          if (a3 != 32) {
            goto LABEL_15;
          }
          int result = 108;
        }
        break;
    }
  }
  return result;
}

- (unsigned)actualStreamIndex
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)&v4[3] = 0;
  *(_DWORD *)int v4 = 0;
  if ([(NSData *)self->_requiredPackedPayload length] < 7)
  {
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      return self->_streamIndex;
    }
    else {
      return 255;
    }
  }
  else
  {
    [(NSData *)self->_requiredPackedPayload getBytes:v4 length:7];
    return v4[0];
  }
}

- (unsigned)actualMaxNetworkBitrateWithDefaultConfig:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    uint64_t v6 = &OBJC_IVAR___VCMediaNegotiationBlobV2StreamGroupStream__maxNetworkBitrateV2;
    return *(_DWORD *)((char *)&self->super.super.isa + *v6);
  }
  char v9 = 0;
  int v8 = 0;
  if ([(VCMediaNegotiationBlobV2StreamGroupStream *)self readOptionalPacketPayload:&v8]) {
    return HIWORD(v8);
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    uint64_t v6 = &OBJC_IVAR___VCMediaNegotiationBlobV2StreamGroupStream__maxNetworkBitrate;
    return *(_DWORD *)((char *)&self->super.super.isa + *v6);
  }
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = self;
  }
  return [v7 maxNetworkBitrate];
}

- (unsigned)actualMaxRepairedNetworkBitrateWithDefaultConfig:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    int v4 = &OBJC_IVAR___VCMediaNegotiationBlobV2StreamGroupStream__repairedMaxNetworkBitrateV2;
    return *(_DWORD *)((char *)&self->super.super.isa + *v4);
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    int v4 = &OBJC_IVAR___VCMediaNegotiationBlobV2StreamGroupStream__repairedMaxNetworkBitrate;
    return *(_DWORD *)((char *)&self->super.super.isa + *v4);
  }
  if (a3) {
    self = (VCMediaNegotiationBlobV2StreamGroupStream *)a3;
  }
  return [(VCMediaNegotiationBlobV2StreamGroupStream *)self repairedMaxNetworkBitrate];
}

- (unsigned)actualAudioChannelCountWithDefaultConfig:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v8 = 0;
  int v7 = 0;
  if ([(VCMediaNegotiationBlobV2StreamGroupStream *)self readOptionalPacketPayload:&v7]) {
    return v8;
  }
  if (*(_WORD *)&self->_has) {
    return self->_audioChannelCount;
  }
  if (a3) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = self;
  }
  return [v6 audioChannelCount];
}

- (unsigned)actualMetadataWithDefaultConfig:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v7 = 0;
  int v6 = 0;
  if ([(VCMediaNegotiationBlobV2StreamGroupStream *)self readOptionalPacketPayload:&v6]) {
    return (unsigned __int16)v6;
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_metadata;
  }
  if (a3) {
    return +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:a3];
  }
  return [(VCMediaNegotiationBlobV2StreamGroupStream *)self metadata];
}

- (unsigned)actualQualityIndexWithDefaultConfig:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_qualityIndex;
  }
  if (a3) {
    self = (VCMediaNegotiationBlobV2StreamGroupStream *)a3;
  }
  return [(VCMediaNegotiationBlobV2StreamGroupStream *)self qualityIndex];
}

- (BOOL)updatePayloadSpecsForConfig:(id)a3 defaultConfig:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [a3 resetCodecs];
  if (a4 && (*(_WORD *)&self->_has & 0x20) == 0)
  {
    if (a3 != a4)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      char v7 = (void *)[a4 payloads];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(a3, "addPayload:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "unsignedIntValue"));
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v17 count:16];
        }
        while (v9);
      }
    }
LABEL_22:
    LOBYTE(v15) = 1;
    return v15;
  }
  unsigned int v12 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self payloadSpecOrPayloads];
  [a3 resetPayloads];
  if ((v12 & 0x7FF) != 0)
  {
    uint64_t v13 = 1;
    do
    {
      if ((v12 & v13) != 0)
      {
        objc_msgSend(a3, "addPayload:", +[VCMediaNegotiationBlobV2StreamGroupStream payloadsWithPayloadBit:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadsWithPayloadBit:", v13));
        v12 &= ~v13;
      }
      uint64_t v13 = (2 * v13);
    }
    while ((v12 & 0x7FF) != 0);
  }
  if (!v12) {
    goto LABEL_22;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_21;
  }
  uint64_t v14 = VRTraceErrorLogLevelToCSTR();
  BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v15)
  {
    -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:](v14, self);
LABEL_21:
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (BOOL)updatePayloadSpecsForConfig:(id)a3 defaultConfig:(id)a4 payloadConfigs:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [a3 resetPayloads];
  if (!a4 || (*(_WORD *)&self->_has & 0x20) != 0)
  {
    unsigned int v16 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self payloadSpecOrPayloads];
    [a3 resetCodecs];
    if ([a5 count])
    {
      unint64_t v17 = 0;
      do
      {
        if ((v16 & (1 << v17)) != 0)
        {
          [a3 addCodec:v17];
          v16 &= ~(1 << v17);
        }
        unint64_t v17 = (v17 + 1);
      }
      while ([a5 count] > v17);
    }
    if (v16)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v15) {
          return v15;
        }
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:](v18, self);
      }
LABEL_38:
      LOBYTE(v15) = 0;
      return v15;
    }
    goto LABEL_34;
  }
  if (a3 != a4)
  {
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    uint64_t v9 = (void *)[a4 codecs];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v32 + 1) + 8 * v13) unsignedIntValue];
        if ([a5 count] <= (unint64_t)v14) {
          break;
        }
        [a3 addCodec:v14];
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v31 count:16];
          LOBYTE(v15) = 1;
          if (v11) {
            goto LABEL_6;
          }
          return v15;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_38;
      }
      VRTraceErrorLogLevelToCSTR();
      BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v15)
      {
        -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]();
        goto LABEL_38;
      }
      return v15;
    }
LABEL_34:
    LOBYTE(v15) = 1;
    return v15;
  }
  long long v29 = 0uLL;
  long long v30 = 0uLL;
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  long long v19 = (void *)[a4 codecs];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (!v20) {
    goto LABEL_34;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v28;
LABEL_27:
  uint64_t v23 = 0;
  while (1)
  {
    if (*(void *)v28 != v22) {
      objc_enumerationMutation(v19);
    }
    unsigned int v24 = [*(id *)(*((void *)&v27 + 1) + 8 * v23) unsignedIntValue];
    if ([a5 count] <= (unint64_t)v24) {
      break;
    }
    if (v21 == ++v23)
    {
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v26 count:16];
      LOBYTE(v15) = 1;
      if (v21) {
        goto LABEL_27;
      }
      return v15;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_38;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v15)
  {
    -[VCMediaNegotiationBlobV2StreamGroupStream(Utils) updatePayloadSpecsForConfig:defaultConfig:payloadConfigs:]();
    goto LABEL_38;
  }
  return v15;
}

+ (void)appendMetadata:(unsigned int)a3 toString:(id)a4
{
  [a4 appendFormat:@" metadata=["];
  if ((a3 & 0xF) != 0)
  {
    int v6 = @"%@";
    uint64_t v7 = 1;
    do
    {
      if ((v7 & a3) != 0)
      {
        uint64_t v8 = @"SubStream";
        switch((int)v7)
        {
          case 1:
            break;
          case 2:
            uint64_t v8 = @"TemporalStream";
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_8;
          case 4:
            uint64_t v8 = @"onDemand";
            break;
          case 8:
            uint64_t v8 = @"UsePayloadSpec";
            break;
          default:
            if (v7 == 15) {
              uint64_t v8 = @"SupportedMask";
            }
            else {
LABEL_8:
            }
              uint64_t v8 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
            break;
        }
        objc_msgSend(a4, "appendFormat:", v6, v8);
        int v6 = @",%@";
      }
      a3 &= ~v7;
      uint64_t v7 = (2 * v7);
    }
    while ((a3 & 0xF) != 0);
  }

  [a4 appendString:@"]"];
}

+ (void)appendPayloadsToString:(id)a3 streamConfig:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a3 appendFormat:@" payloads=["];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v6 = (void *)[a4 payloads];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = @"%@";
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = +[VCMediaNegotiationBlobV2StreamGroupStream payloadFlagWithPayload:](VCMediaNegotiationBlobV2StreamGroupStream, "payloadFlagWithPayload:", [*(id *)(*((void *)&v15 + 1) + 8 * v11) unsignedIntValue]);
        if ((int)v12 <= 31)
        {
          uint64_t v13 = @"Invalid";
          switch((int)v12)
          {
            case 0:
              break;
            case 1:
              uint64_t v13 = @"H264";
              break;
            case 2:
              uint64_t v13 = @"HEVC";
              break;
            case 3:
            case 5:
            case 6:
            case 7:
              goto LABEL_26;
            case 4:
              uint64_t v13 = @"Data";
              break;
            case 8:
              uint64_t v13 = @"OPUS";
              break;
            default:
              if (v12 != 16) {
                goto LABEL_26;
              }
              uint64_t v13 = @"AACELD_24000";
              break;
          }
        }
        else if ((int)v12 <= 255)
        {
          switch(v12)
          {
            case 0x20:
              uint64_t v13 = @"EVS_32000";
              break;
            case 0x40:
              uint64_t v13 = @"AACELD_48000";
              break;
            case 0x80:
              uint64_t v13 = @"RED";
              break;
            default:
              goto LABEL_26;
          }
        }
        else if ((int)v12 > 1023)
        {
          if (v12 != 1024)
          {
            if (v12 == 2047)
            {
              uint64_t v13 = @"SupportedMask";
              goto LABEL_31;
            }
            goto LABEL_26;
          }
          uint64_t v13 = @"MMJI";
        }
        else
        {
          if (v12 != 256)
          {
            if (v12 == 512)
            {
              uint64_t v13 = @"MOCAP";
              goto LABEL_31;
            }
LABEL_26:
            uint64_t v13 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
            goto LABEL_31;
          }
          uint64_t v13 = @"CN";
        }
LABEL_31:
        objc_msgSend(a3, "appendFormat:", v9, v13);
        ++v11;
        uint64_t v9 = @",%@";
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
      uint64_t v9 = @",%@";
    }
    while (v8);
  }
  [a3 appendString:@"]"];
}

+ (void)appendPayloadsSpecsToString:(id)a3 streamConfig:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [a3 appendFormat:@" payloadSpecs=["];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v6 = (void *)[a4 codecs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    uint64_t v10 = &stru_1F3D3E450;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [a3 appendFormat:@"%@%@", v10, *(void *)(*((void *)&v13 + 1) + 8 * v11++)];
        uint64_t v10 = @",";
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
      uint64_t v10 = @",";
    }
    while (v8);
  }
  [a3 appendString:@"]"];
}

- (id)dataRequiredPacketPayload
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0) {
    unsigned int streamIndex = self->_streamIndex;
  }
  else {
    LOBYTE(streamIndex) = -1;
  }
  char v7 = streamIndex;
  unsigned int rtpSSRC = self->_rtpSSRC;
  unsigned int v8 = bswap32(rtpSSRC);
  if ((has & 0x800) != 0) {
    unsigned int streamID = self->_streamID;
  }
  else {
    unsigned int streamID = (unsigned __int16)rtpSSRC;
  }
  __int16 v9 = bswap32(streamID) >> 16;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:&v7 length:7];
}

- (BOOL)readRequiredPacketPayloadWithStreamConfig:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)&v7[3] = 0;
  *(_DWORD *)char v7 = 0;
  NSUInteger v5 = [(NSData *)self->_requiredPackedPayload length];
  if (v5 >= 7)
  {
    [(NSData *)self->_requiredPackedPayload getBytes:v7 length:7];
    [a3 setSsrc:bswap32(*(unsigned int *)&v7[1])];
    [a3 setStreamID:bswap32(*(unsigned __int16 *)&v7[5]) >> 16];
    [a3 setStreamIndex:v7[0]];
  }
  return v5 > 6;
}

- (id)optionalPackedPayloaWithDefaultConfig:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3) {
    unsigned int metadata = +[VCMediaNegotiationBlobV2StreamGroupStream metadataWithStreamConfig:a3];
  }
  else {
    unsigned int metadata = 0;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    unsigned int metadata = self->_metadata;
  }
  if (metadata >= 0x10000)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = v11;
    __int16 v22 = 2080;
    uint64_t v23 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) optionalPackedPayloaWithDefaultConfig:]";
    __int16 v24 = 1024;
    int v25 = 1169;
    __int16 v26 = 1024;
    unsigned int v27 = metadata;
    long long v13 = " [%s] %s:%d The metadata field doesn't fit in a uint16. metadata=%x";
LABEL_23:
    long long v15 = v12;
    goto LABEL_27;
  }
  v18[0] = bswap32(metadata) >> 16;
  if ((has & 4) != 0) {
    unsigned int maxNetworkBitrate = self->_maxNetworkBitrate;
  }
  else {
    unsigned int maxNetworkBitrate = [a3 maxNetworkBitrate];
  }
  unsigned int v8 = maxNetworkBitrate / 0x3E8;
  if (maxNetworkBitrate >> 19 >= 0x7D)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = v14;
    __int16 v22 = 2080;
    uint64_t v23 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) optionalPackedPayloaWithDefaultConfig:]";
    __int16 v24 = 1024;
    int v25 = 1174;
    __int16 v26 = 1024;
    unsigned int v27 = v8;
    long long v13 = " [%s] %s:%d The maxNetworkBitrate field doesn't fit in a uint16. maxNetworkBitrate=%x";
    goto LABEL_23;
  }
  v18[1] = bswap32(v8) >> 16;
  if (*(_WORD *)&self->_has) {
    unsigned int audioChannelCount = self->_audioChannelCount;
  }
  else {
    unsigned int audioChannelCount = [a3 audioChannelCount];
  }
  if (audioChannelCount >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = v16;
    __int16 v22 = 2080;
    uint64_t v23 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) optionalPackedPayloaWithDefaultConfig:]";
    __int16 v24 = 1024;
    int v25 = 1178;
    __int16 v26 = 1024;
    unsigned int v27 = audioChannelCount;
    long long v13 = " [%s] %s:%d The audioChannelCount field doesn't fit in a uint8. audioChannelCount=%x";
    long long v15 = v17;
LABEL_27:
    _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v13, buf, 0x22u);
    return 0;
  }
  char v19 = audioChannelCount;
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v18 length:5];
}

- (BOOL)readOptionalPacketPayload:(tagStreamGroupStreamOptionalPackedPayload *)a3
{
  if (!a3) {
    return 0;
  }
  if ([(NSData *)self->_optionalPackedPayload length] < 5) {
    return 0;
  }
  [(NSData *)self->_optionalPackedPayload getBytes:a3 length:5];
  a3->var0 = bswap32(a3->var0) >> 16;
  a3->var1 = 1000 * (bswap32(a3->var1) >> 16);
  return 1;
}

- (id)requiredPayloadCompressWithConfig:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self dataRequiredPacketPayload];
  uint64_t v5 = objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupStream data](self, "data"), "length");
  if (!v4) {
    return 0;
  }
  unint64_t v6 = v5;
  id v7 = (id)[(VCMediaNegotiationBlobV2StreamGroupStream *)self copy];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        long long v15 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) requiredPayloadCompressWithConfig:]";
        __int16 v16 = 1024;
        int v17 = 1208;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to copy the stream config for required fields compression", (uint8_t *)&v12, 0x1Cu);
      }
    }
    return 0;
  }
  unsigned int v8 = v7;
  [v7 setRequiredPackedPayload:v4];
  [v8 setHasStreamIndex:0];
  [v8 setHasRtpSSRC:0];
  [v8 setHasStreamID:0];
  if (v6 <= objc_msgSend((id)objc_msgSend(v8, "data"), "length")) {
    return 0;
  }
  else {
    return v8;
  }
}

- (id)optionalPayloadCompressWithConfig:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(VCMediaNegotiationBlobV2StreamGroupStream *)self optionalPackedPayloaWithDefaultConfig:a3];
  uint64_t v5 = objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupStream data](self, "data"), "length");
  if (!v4) {
    return 0;
  }
  unint64_t v6 = v5;
  id v7 = (id)[(VCMediaNegotiationBlobV2StreamGroupStream *)self copy];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        long long v15 = "-[VCMediaNegotiationBlobV2StreamGroupStream(Utils) optionalPayloadCompressWithConfig:]";
        __int16 v16 = 1024;
        int v17 = 1230;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to copy the stream config for optional fields compression", (uint8_t *)&v12, 0x1Cu);
      }
    }
    return 0;
  }
  unsigned int v8 = v7;
  [v7 setOptionalPackedPayload:v4];
  [v8 setHasMetadata:0];
  [v8 setHasMaxNetworkBitrate:0];
  [v8 setHasAudioChannelCount:0];
  if (v6 <= objc_msgSend((id)objc_msgSend(v8, "data"), "length")) {
    return 0;
  }
  else {
    return v8;
  }
}

- (id)compressWithConfig:(id)a3
{
  uint64_t v5 = -[VCMediaNegotiationBlobV2StreamGroupStream requiredPayloadCompressWithConfig:](self, "requiredPayloadCompressWithConfig:");
  unint64_t v6 = v5;
  if (!v5) {
    uint64_t v5 = self;
  }
  id result = [(VCMediaNegotiationBlobV2StreamGroupStream *)v5 optionalPayloadCompressWithConfig:a3];
  if (!result) {
    return v6;
  }
  return result;
}

- (unsigned)mediaStreamGroupCoordinateSystem
{
  if ([(VCMediaNegotiationBlobV2StreamGroupStream *)self coordinateSystem] > 3
    || ![(VCMediaNegotiationBlobV2StreamGroupStream *)self coordinateSystem])
  {
    return 0;
  }

  return [(VCMediaNegotiationBlobV2StreamGroupStream *)self coordinateSystem];
}

- (BOOL)setNegotiatedCoordinateSystemFromCoordinateSystem:(unsigned int)a3
{
  if (a3 <= 3) {
    [(VCMediaNegotiationBlobV2StreamGroupStream *)self setCoordinateSystem:*(void *)&a3];
  }
  return a3 < 4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2StreamGroupStream *)self setRequiredPackedPayload:0];
  [(VCMediaNegotiationBlobV2StreamGroupStream *)self setOptionalPackedPayload:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupStream;
  [(VCMediaNegotiationBlobV2StreamGroupStream *)&v3 dealloc];
}

- (void)setMetadata:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int metadata = a3;
}

- (void)setHasMetadata:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMetadata
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPayloadSpecOrPayloads:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_payloadSpecOrPayloads = a3;
}

- (void)setHasPayloadSpecOrPayloads:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPayloadSpecOrPayloads
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setQualityIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_qualityIndex = a3;
}

- (void)setHasQualityIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasQualityIndex
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRtpSSRC:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unsigned int rtpSSRC = a3;
}

- (void)setHasRtpSSRC:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRtpSSRC
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setStreamID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unsigned int streamID = a3;
}

- (void)setHasStreamID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasStreamID
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setMaxNetworkBitrate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int maxNetworkBitrate = a3;
}

- (void)setHasMaxNetworkBitrate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMaxNetworkBitrate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_repairedMaxNetworkBitrate = a3;
}

- (void)setHasRepairedMaxNetworkBitrate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRepairedMaxNetworkBitrate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (unsigned)audioChannelCount
{
  if (*(_WORD *)&self->_has) {
    return self->_audioChannelCount;
  }
  else {
    return 1;
  }
}

- (void)setAudioChannelCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int audioChannelCount = a3;
}

- (void)setHasAudioChannelCount:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAudioChannelCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setStreamIndex:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_unsigned int streamIndex = a3;
}

- (void)setHasStreamIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasStreamIndex
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasRequiredPackedPayload
{
  return self->_requiredPackedPayload != 0;
}

- (BOOL)hasOptionalPackedPayload
{
  return self->_optionalPackedPayload != 0;
}

- (void)setCoordinateSystem:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_coordinateSystem = a3;
}

- (void)setHasCoordinateSystem:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCoordinateSystem
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPayloadsVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_payloadsVersion = a3;
}

- (void)setHasPayloadsVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPayloadsVersion
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMaxNetworkBitrateV2:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_maxNetworkBitrateV2 = a3;
}

- (void)setHasMaxNetworkBitrateV2:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMaxNetworkBitrateV2
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRepairedMaxNetworkBitrateV2:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_repairedMaxNetworkBitrateV2 = a3;
}

- (void)setHasRepairedMaxNetworkBitrateV2:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRepairedMaxNetworkBitrateV2
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupStream;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2StreamGroupStream description](&v3, sel_description), -[VCMediaNegotiationBlobV2StreamGroupStream dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_metadata), @"metadata");
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_payloadSpecOrPayloads), @"payloadSpecOrPayloads");
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_qualityIndex), @"qualityIndex");
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtpSSRC), @"rtpSSRC");
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_streamID), @"streamID");
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxNetworkBitrate), @"maxNetworkBitrate");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_repairedMaxNetworkBitrate), @"repairedMaxNetworkBitrate");
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_audioChannelCount), @"audioChannelCount");
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_10:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_streamIndex), @"streamIndex");
LABEL_11:
  requiredPackedPayload = self->_requiredPackedPayload;
  if (requiredPackedPayload) {
    [v3 setObject:requiredPackedPayload forKey:@"requiredPackedPayload"];
  }
  optionalPackedPayload = self->_optionalPackedPayload;
  if (optionalPackedPayload) {
    [v3 setObject:optionalPackedPayload forKey:@"optionalPackedPayload"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_coordinateSystem), @"coordinateSystem");
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x40) == 0)
    {
LABEL_17:
      if ((v7 & 8) == 0) {
        goto LABEL_18;
      }
LABEL_32:
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxNetworkBitrateV2), @"maxNetworkBitrateV2");
      if ((*(_WORD *)&self->_has & 0x200) == 0) {
        return v3;
      }
      goto LABEL_19;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_payloadsVersion), @"payloadsVersion");
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0) {
    goto LABEL_32;
  }
LABEL_18:
  if ((v7 & 0x200) != 0) {
LABEL_19:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_repairedMaxNetworkBitrateV2), @"repairedMaxNetworkBitrateV2");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2StreamGroupStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
  if (self->_requiredPackedPayload) {
    PBDataWriterWriteDataField();
  }
  if (self->_optionalPackedPayload) {
    PBDataWriterWriteDataField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x40) == 0)
    {
LABEL_17:
      if ((v5 & 8) == 0) {
        goto LABEL_18;
      }
LABEL_31:
      PBDataWriterWriteUint32Field();
      if ((*(_WORD *)&self->_has & 0x200) == 0) {
        return;
      }
      goto LABEL_32;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 8) != 0) {
    goto LABEL_31;
  }
LABEL_18:
  if ((v5 & 0x200) == 0) {
    return;
  }
LABEL_32:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_metadata;
    *((_WORD *)a3 + 42) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 10) = self->_payloadSpecOrPayloads;
  *((_WORD *)a3 + 42) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 12) = self->_qualityIndex;
  *((_WORD *)a3 + 42) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 18) = self->_rtpSSRC;
  *((_WORD *)a3 + 42) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 19) = self->_streamID;
  *((_WORD *)a3 + 42) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 4) = self->_maxNetworkBitrate;
  *((_WORD *)a3 + 42) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 13) = self->_repairedMaxNetworkBitrate;
  *((_WORD *)a3 + 42) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_28:
  *((_DWORD *)a3 + 2) = self->_audioChannelCount;
  *((_WORD *)a3 + 42) |= 1u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    *((_DWORD *)a3 + 20) = self->_streamIndex;
    *((_WORD *)a3 + 42) |= 0x1000u;
  }
LABEL_11:
  if (self->_requiredPackedPayload) {
    objc_msgSend(a3, "setRequiredPackedPayload:");
  }
  if (self->_optionalPackedPayload) {
    objc_msgSend(a3, "setOptionalPackedPayload:");
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_coordinateSystem;
    *((_WORD *)a3 + 42) |= 2u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_17:
      if ((v6 & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_32;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)a3 + 11) = self->_payloadsVersion;
  *((_WORD *)a3 + 42) |= 0x40u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_18:
    if ((v6 & 0x200) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_32:
  *((_DWORD *)a3 + 5) = self->_maxNetworkBitrateV2;
  *((_WORD *)a3 + 42) |= 8u;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    return;
  }
LABEL_19:
  *((_DWORD *)a3 + 14) = self->_repairedMaxNetworkBitrateV2;
  *((_WORD *)a3 + 42) |= 0x200u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_metadata;
    *(_WORD *)(v5 + 84) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_payloadSpecOrPayloads;
  *(_WORD *)(v5 + 84) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 48) = self->_qualityIndex;
  *(_WORD *)(v5 + 84) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 72) = self->_rtpSSRC;
  *(_WORD *)(v5 + 84) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 76) = self->_streamID;
  *(_WORD *)(v5 + 84) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 16) = self->_maxNetworkBitrate;
  *(_WORD *)(v5 + 84) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 52) = self->_repairedMaxNetworkBitrate;
  *(_WORD *)(v5 + 84) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_24:
  *(_DWORD *)(v5 + 8) = self->_audioChannelCount;
  *(_WORD *)(v5 + 84) |= 1u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 80) = self->_streamIndex;
    *(_WORD *)(v5 + 84) |= 0x1000u;
  }
LABEL_11:

  *(void *)(v6 + 64) = [(NSData *)self->_requiredPackedPayload copyWithZone:a3];
  *(void *)(v6 + 32) = [(NSData *)self->_optionalPackedPayload copyWithZone:a3];
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_coordinateSystem;
    *(_WORD *)(v6 + 84) |= 2u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x40) == 0)
    {
LABEL_13:
      if ((v8 & 8) == 0) {
        goto LABEL_14;
      }
LABEL_28:
      *(_DWORD *)(v6 + 20) = self->_maxNetworkBitrateV2;
      *(_WORD *)(v6 + 84) |= 8u;
      if ((*(_WORD *)&self->_has & 0x200) == 0) {
        return (id)v6;
      }
      goto LABEL_15;
    }
  }
  else if ((v8 & 0x40) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 44) = self->_payloadsVersion;
  *(_WORD *)(v6 + 84) |= 0x40u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 8) != 0) {
    goto LABEL_28;
  }
LABEL_14:
  if ((v8 & 0x200) != 0)
  {
LABEL_15:
    *(_DWORD *)(v6 + 56) = self->_repairedMaxNetworkBitrateV2;
    *(_WORD *)(v6 + 84) |= 0x200u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 42);
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_metadata != *((_DWORD *)a3 + 6)) {
        goto LABEL_70;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
LABEL_70:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_payloadSpecOrPayloads != *((_DWORD *)a3 + 10)) {
        goto LABEL_70;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_70;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_qualityIndex != *((_DWORD *)a3 + 12)) {
        goto LABEL_70;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_70;
    }
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x400) == 0 || self->_rtpSSRC != *((_DWORD *)a3 + 18)) {
        goto LABEL_70;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x400) != 0)
    {
      goto LABEL_70;
    }
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x800) == 0 || self->_streamID != *((_DWORD *)a3 + 19)) {
        goto LABEL_70;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x800) != 0)
    {
      goto LABEL_70;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_maxNetworkBitrate != *((_DWORD *)a3 + 4)) {
        goto LABEL_70;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_70;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x100) == 0 || self->_repairedMaxNetworkBitrate != *((_DWORD *)a3 + 13)) {
        goto LABEL_70;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x100) != 0)
    {
      goto LABEL_70;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_audioChannelCount != *((_DWORD *)a3 + 2)) {
        goto LABEL_70;
      }
    }
    else if (v7)
    {
      goto LABEL_70;
    }
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 42) & 0x1000) == 0 || self->_streamIndex != *((_DWORD *)a3 + 20)) {
        goto LABEL_70;
      }
    }
    else if ((*((_WORD *)a3 + 42) & 0x1000) != 0)
    {
      goto LABEL_70;
    }
    requiredPackedPayload = self->_requiredPackedPayload;
    if (!((unint64_t)requiredPackedPayload | *((void *)a3 + 8))
      || (int v5 = -[NSData isEqual:](requiredPackedPayload, "isEqual:")) != 0)
    {
      optionalPackedPayload = self->_optionalPackedPayload;
      if (!((unint64_t)optionalPackedPayload | *((void *)a3 + 4))
        || (int v5 = -[NSData isEqual:](optionalPackedPayload, "isEqual:")) != 0)
      {
        __int16 v10 = (__int16)self->_has;
        __int16 v11 = *((_WORD *)a3 + 42);
        if ((v10 & 2) != 0)
        {
          if ((v11 & 2) == 0 || self->_coordinateSystem != *((_DWORD *)a3 + 3)) {
            goto LABEL_70;
          }
        }
        else if ((v11 & 2) != 0)
        {
          goto LABEL_70;
        }
        if ((v10 & 0x40) != 0)
        {
          if ((v11 & 0x40) == 0 || self->_payloadsVersion != *((_DWORD *)a3 + 11)) {
            goto LABEL_70;
          }
        }
        else if ((v11 & 0x40) != 0)
        {
          goto LABEL_70;
        }
        if ((v10 & 8) != 0)
        {
          if ((v11 & 8) == 0 || self->_maxNetworkBitrateV2 != *((_DWORD *)a3 + 5)) {
            goto LABEL_70;
          }
        }
        else if ((v11 & 8) != 0)
        {
          goto LABEL_70;
        }
        LOBYTE(v5) = (v11 & 0x200) == 0;
        if ((*(_WORD *)&self->_has & 0x200) != 0)
        {
          if ((*((_WORD *)a3 + 42) & 0x200) == 0 || self->_repairedMaxNetworkBitrateV2 != *((_DWORD *)a3 + 14)) {
            goto LABEL_70;
          }
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v20 = 2654435761 * self->_metadata;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v19 = 2654435761 * self->_payloadSpecOrPayloads;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v18 = 2654435761 * self->_qualityIndex;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_rtpSSRC;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_streamID;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_maxNetworkBitrate;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v7 = 2654435761 * self->_repairedMaxNetworkBitrate;
    if (has) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v8 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v7 = 0;
  if ((has & 1) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_audioChannelCount;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_10:
    uint64_t v9 = 2654435761 * self->_streamIndex;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
LABEL_20:
  uint64_t v10 = [(NSData *)self->_requiredPackedPayload hash];
  uint64_t v11 = [(NSData *)self->_optionalPackedPayload hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 2) != 0)
  {
    uint64_t v13 = 2654435761 * self->_coordinateSystem;
    if ((v12 & 0x40) != 0)
    {
LABEL_22:
      uint64_t v14 = 2654435761 * self->_payloadsVersion;
      if ((v12 & 8) != 0) {
        goto LABEL_23;
      }
LABEL_27:
      uint64_t v15 = 0;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_24;
      }
LABEL_28:
      uint64_t v16 = 0;
      return v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((v12 & 0x40) != 0) {
      goto LABEL_22;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 8) == 0) {
    goto LABEL_27;
  }
LABEL_23:
  uint64_t v15 = 2654435761 * self->_maxNetworkBitrateV2;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_28;
  }
LABEL_24:
  uint64_t v16 = 2654435761 * self->_repairedMaxNetworkBitrateV2;
  return v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x10) != 0)
  {
    self->_unsigned int metadata = *((_DWORD *)a3 + 6);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v5 = *((_WORD *)a3 + 42);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_payloadSpecOrPayloads = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_qualityIndex = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_unsigned int rtpSSRC = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_unsigned int streamID = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_unsigned int maxNetworkBitrate = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_repairedMaxNetworkBitrate = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_28:
  self->_unsigned int audioChannelCount = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 42) & 0x1000) != 0)
  {
LABEL_10:
    self->_unsigned int streamIndex = *((_DWORD *)a3 + 20);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_11:
  if (*((void *)a3 + 8)) {
    -[VCMediaNegotiationBlobV2StreamGroupStream setRequiredPackedPayload:](self, "setRequiredPackedPayload:");
  }
  if (*((void *)a3 + 4)) {
    -[VCMediaNegotiationBlobV2StreamGroupStream setOptionalPackedPayload:](self, "setOptionalPackedPayload:");
  }
  __int16 v6 = *((_WORD *)a3 + 42);
  if ((v6 & 2) != 0)
  {
    self->_coordinateSystem = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    __int16 v6 = *((_WORD *)a3 + 42);
    if ((v6 & 0x40) == 0)
    {
LABEL_17:
      if ((v6 & 8) == 0) {
        goto LABEL_18;
      }
      goto LABEL_32;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_17;
  }
  self->_payloadsVersion = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v6 = *((_WORD *)a3 + 42);
  if ((v6 & 8) == 0)
  {
LABEL_18:
    if ((v6 & 0x200) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_32:
  self->_maxNetworkBitrateV2 = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 42) & 0x200) == 0) {
    return;
  }
LABEL_19:
  self->_repairedMaxNetworkBitrateV2 = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x200u;
}

- (unsigned)metadata
{
  return self->_metadata;
}

- (unsigned)payloadSpecOrPayloads
{
  return self->_payloadSpecOrPayloads;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (unsigned)repairedMaxNetworkBitrate
{
  return self->_repairedMaxNetworkBitrate;
}

- (unsigned)streamIndex
{
  return self->_streamIndex;
}

- (NSData)requiredPackedPayload
{
  return self->_requiredPackedPayload;
}

- (void)setRequiredPackedPayload:(id)a3
{
}

- (NSData)optionalPackedPayload
{
  return self->_optionalPackedPayload;
}

- (void)setOptionalPackedPayload:(id)a3
{
}

- (unsigned)coordinateSystem
{
  return self->_coordinateSystem;
}

- (unsigned)payloadsVersion
{
  return self->_payloadsVersion;
}

- (unsigned)maxNetworkBitrateV2
{
  return self->_maxNetworkBitrateV2;
}

- (unsigned)repairedMaxNetworkBitrateV2
{
  return self->_repairedMaxNetworkBitrateV2;
}

@end
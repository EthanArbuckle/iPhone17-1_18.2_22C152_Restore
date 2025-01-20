@interface VCMediaNegotiatorStreamGroupStreamConfiguration
+ (id)configWithQualityIndex:(unsigned int)a3 nwBitrate:(unsigned int)a4 mediaBitrate:(unsigned int)a5 maxPacketsPerSecond:(unsigned int)a6 repairedNwBitrate:(unsigned int)a7 keyFrameInterval:(unsigned int)a8 framerate:(unsigned int)a9 rtpSampleRate:(unsigned int)a10 isTemporal:(BOOL)a11 isSubStream:(BOOL)a12 metadata:(unsigned int)a13 payloads:(id)a14 codecs:(id)a15 width:(unsigned int)a16 height:(unsigned int)a17 audioChannelCount:(unsigned int)a18 streamIndex:(unsigned __int8)a19 coordinateSystem:(unsigned int)a20;
- (BOOL)applyCipherSuiteOnMediaStreamConfig:(id)a3 codecConfigs:(id)a4;
- (BOOL)areCodecsEqualTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualPayloads:(id)a3;
- (BOOL)isSubStream;
- (BOOL)isTemporalStream;
- (CGSize)resolution;
- (NSArray)codecs;
- (NSSet)payloads;
- (VCMediaNegotiatorStreamGroupStreamConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)serializedSize;
- (unsigned)audioChannelCount;
- (unsigned)coordinateSystem;
- (unsigned)framerate;
- (unsigned)keyFrameInterval;
- (unsigned)maxMediaBitrate;
- (unsigned)maxNetworkBitrate;
- (unsigned)maxPacketsPerSecond;
- (unsigned)metadata;
- (unsigned)parentStreamID;
- (unsigned)qualityIndex;
- (unsigned)repairedMaxNetworkBitrate;
- (unsigned)repairedStreamID;
- (unsigned)rtpTimestampRate;
- (unsigned)ssrc;
- (unsigned)streamID;
- (unsigned)streamIndex;
- (unsigned)v2StreamID;
- (void)addCodec:(unsigned int)a3;
- (void)addPayload:(int)a3;
- (void)dealloc;
- (void)removeCodec:(unsigned int)a3;
- (void)resetCodecs;
- (void)resetPayloads;
- (void)setAudioChannelCount:(unsigned int)a3;
- (void)setCoordinateSystem:(unsigned int)a3;
- (void)setFramerate:(unsigned int)a3;
- (void)setIsSubStream:(BOOL)a3;
- (void)setIsTemporalStream:(BOOL)a3;
- (void)setKeyFrameInterval:(unsigned int)a3;
- (void)setMaxMediaBitrate:(unsigned int)a3;
- (void)setMaxNetworkBitrate:(unsigned int)a3;
- (void)setMaxPacketsPerSecond:(unsigned int)a3;
- (void)setMetadata:(unsigned int)a3;
- (void)setParentStreamID:(unsigned __int16)a3;
- (void)setQualityIndex:(unsigned int)a3;
- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3;
- (void)setRepairedStreamID:(unsigned __int16)a3;
- (void)setResolution:(CGSize)a3;
- (void)setRtpTimestampRate:(unsigned int)a3;
- (void)setSerializedSize:(unint64_t)a3;
- (void)setSsrc:(unsigned int)a3;
- (void)setStreamID:(unsigned __int16)a3;
- (void)setStreamIndex:(unsigned __int8)a3;
- (void)setV2StreamID:(unsigned __int16)a3;
@end

@implementation VCMediaNegotiatorStreamGroupStreamConfiguration

- (VCMediaNegotiatorStreamGroupStreamConfiguration)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorStreamGroupStreamConfiguration;
  v2 = [(VCMediaNegotiatorStreamGroupStreamConfiguration *)&v4 init];
  if (v2)
  {
    v2->_payloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_codecs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_coordinateSystem = 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorStreamGroupStreamConfiguration;
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)&v3 dealloc];
}

- (void)addPayload:(int)a3
{
  payloads = self->_payloads;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(NSMutableSet *)payloads addObject:v4];
}

- (void)resetPayloads
{
}

- (void)addCodec:(unsigned int)a3
{
  codecs = self->_codecs;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(NSMutableArray *)codecs addObject:v4];
}

- (void)removeCodec:(unsigned int)a3
{
  codecs = self->_codecs;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(NSMutableArray *)codecs removeObject:v4];
}

- (void)resetCodecs
{
}

- (BOOL)areCodecsEqualTo:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x1E4F28BD0] setWithArray:self->_codecs];
  uint64_t v5 = [MEMORY[0x1E4F28BD0] setWithArray:a3];

  return [v4 isEqualToSet:v5];
}

- (BOOL)applyCipherSuiteOnMediaStreamConfig:(id)a3 codecConfigs:(id)a4
{
  if ([(NSMutableArray *)self->_codecs count])
  {
    v7 = objc_msgSend(a4, "objectAtIndex:", (int)objc_msgSend((id)-[NSMutableArray firstObject](self->_codecs, "firstObject"), "intValue"));
    switch([v7 cipherSuite])
    {
      case 0u:
        if (![+[VCDefaults sharedInstance] forceDisableMediaEncryption])goto LABEL_6; {
        [a3 setSRTPCipherSuite:0];
        }
        [a3 setSRTCPCipherSuite:0];
        id v8 = a3;
        uint64_t v9 = 0;
LABEL_12:
        [v8 setSframeCipherSuite:v9];
        return 1;
      case 1u:
        BOOL v12 = 1;
        [a3 setSframeCipherSuite:1];
        return v12;
      case 2u:
        id v8 = a3;
        uint64_t v9 = 2;
        goto LABEL_12;
      case 3u:
        break;
      default:
LABEL_6:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiatorStreamGroupStreamConfiguration applyCipherSuiteOnMediaStreamConfig:codecConfigs:](v10, v7, v11);
          }
        }
        return 0;
    }
  }
  [a3 setSRTPCipherSuite:3];
  [a3 setSRTCPCipherSuite:3];
  return 1;
}

- (BOOL)isEqualPayloads:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 count];
  if (v5 == [(NSMutableSet *)self->_payloads count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        int v10 = [(NSMutableSet *)self->_payloads containsObject:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
        if (!v10) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v12 count:16];
          LOBYTE(v10) = 1;
          if (v7) {
            goto LABEL_4;
          }
          return v10;
        }
      }
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([a3 streamIndex] != self->_streamIndex) {
    return 0;
  }
  if ([a3 ssrc] != self->_ssrc) {
    return 0;
  }
  if ([a3 streamID] != self->_streamID) {
    return 0;
  }
  if ([a3 metadata] != self->_metadata) {
    return 0;
  }
  if ([a3 qualityIndex] != self->_qualityIndex) {
    return 0;
  }
  if ([a3 maxNetworkBitrate] != self->_maxNetworkBitrate) {
    return 0;
  }
  if ([a3 maxMediaBitrate] != self->_maxMediaBitrate) {
    return 0;
  }
  if ([a3 maxPacketsPerSecond] != self->_maxPacketsPerSecond) {
    return 0;
  }
  if ([a3 repairedStreamID] != self->_repairedStreamID) {
    return 0;
  }
  if ([a3 repairedMaxNetworkBitrate] != self->_repairedMaxNetworkBitrate) {
    return 0;
  }
  [a3 resolution];
  if (v5 != self->_resolution.width) {
    return 0;
  }
  [a3 resolution];
  if (v6 != self->_resolution.height
    || [a3 framerate] != self->_framerate
    || [a3 keyFrameInterval] != self->_keyFrameInterval
    || [a3 rtpTimestampRate] != self->_rtpTimestampRate
    || [a3 parentStreamID] != self->_parentStreamID
    || [a3 audioChannelCount] != self->_audioChannelCount
    || [a3 coordinateSystem] != self->_coordinateSystem
    || [a3 v2StreamID] != self->_v2StreamID
    || !-[VCMediaNegotiatorStreamGroupStreamConfiguration areCodecsEqualTo:](self, "areCodecsEqualTo:", [a3 codecs]))
  {
    return 0;
  }
  uint64_t v7 = [a3 payloads];

  return [(VCMediaNegotiatorStreamGroupStreamConfiguration *)self isEqualPayloads:v7];
}

+ (id)configWithQualityIndex:(unsigned int)a3 nwBitrate:(unsigned int)a4 mediaBitrate:(unsigned int)a5 maxPacketsPerSecond:(unsigned int)a6 repairedNwBitrate:(unsigned int)a7 keyFrameInterval:(unsigned int)a8 framerate:(unsigned int)a9 rtpSampleRate:(unsigned int)a10 isTemporal:(BOOL)a11 isSubStream:(BOOL)a12 metadata:(unsigned int)a13 payloads:(id)a14 codecs:(id)a15 width:(unsigned int)a16 height:(unsigned int)a17 audioChannelCount:(unsigned int)a18 streamIndex:(unsigned __int8)a19 coordinateSystem:(unsigned int)a20
{
  uint64_t v20 = *(void *)&a7;
  uint64_t v21 = *(void *)&a6;
  uint64_t v22 = *(void *)&a5;
  uint64_t v23 = *(void *)&a4;
  uint64_t v24 = *(void *)&a3;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v25 = objc_alloc_init(VCMediaNegotiatorStreamGroupStreamConfiguration);
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setStreamIndex:a19];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setQualityIndex:v24];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setMaxNetworkBitrate:v23];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setMaxMediaBitrate:v22];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setMaxPacketsPerSecond:v21];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setRepairedMaxNetworkBitrate:v20];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setKeyFrameInterval:a8];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setFramerate:a9];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setRtpTimestampRate:a10];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setIsTemporalStream:a11];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setIsSubStream:a12];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setMetadata:a13];
  LODWORD(v26) = a16;
  LODWORD(v27) = a17;
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setResolution:](v25, "setResolution:", (double)v26, (double)v27);
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setAudioChannelCount:a18];
  [(VCMediaNegotiatorStreamGroupStreamConfiguration *)v25 setCoordinateSystem:a20];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v28 = [a14 countByEnumeratingWithState:&v44 objects:v43 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(a14);
        }
        -[VCMediaNegotiatorStreamGroupStreamConfiguration addPayload:](v25, "addPayload:", [*(id *)(*((void *)&v44 + 1) + 8 * i) unsignedIntValue]);
      }
      uint64_t v29 = [a14 countByEnumeratingWithState:&v44 objects:v43 count:16];
    }
    while (v29);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v32 = [a15 countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(a15);
        }
        -[VCMediaNegotiatorStreamGroupStreamConfiguration addCodec:](v25, "addCodec:", [*(id *)(*((void *)&v39 + 1) + 8 * j) unsignedIntValue]);
      }
      uint64_t v33 = [a15 countByEnumeratingWithState:&v39 objects:v38 count:16];
    }
    while (v33);
  }
  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  double v5 = v4;
  if (v4)
  {
    [v4 setSsrc:self->_ssrc];
    [v5 setStreamID:self->_streamID];
    [v5 setIsTemporalStream:self->_isTemporalStream];
    [v5 setIsSubStream:self->_isSubStream];
    [v5 setQualityIndex:self->_qualityIndex];
    [v5 setMaxNetworkBitrate:self->_maxNetworkBitrate];
    [v5 setMaxMediaBitrate:self->_maxMediaBitrate];
    [v5 setMaxPacketsPerSecond:self->_maxPacketsPerSecond];
    [v5 setRepairedStreamID:self->_repairedStreamID];
    [v5 setRepairedMaxNetworkBitrate:self->_repairedMaxNetworkBitrate];
    objc_msgSend(v5, "setResolution:", self->_resolution.width, self->_resolution.height);
    [v5 setFramerate:self->_framerate];
    [v5 setKeyFrameInterval:self->_keyFrameInterval];
    [v5 setRtpTimestampRate:self->_rtpTimestampRate];
    [v5 setParentStreamID:self->_parentStreamID];
    [v5 setAudioChannelCount:self->_audioChannelCount];
    [v5 setCoordinateSystem:self->_coordinateSystem];
    [v5 setV2StreamID:self->_v2StreamID];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    payloads = self->_payloads;
    uint64_t v7 = [(NSMutableSet *)payloads countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(payloads);
          }
          objc_msgSend(v5, "addPayload:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "unsignedIntValue"));
        }
        uint64_t v8 = [(NSMutableSet *)payloads countByEnumeratingWithState:&v23 objects:v22 count:16];
      }
      while (v8);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    codecs = self->_codecs;
    uint64_t v12 = [(NSMutableArray *)codecs countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(codecs);
          }
          objc_msgSend(v5, "addCodec:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "unsignedIntValue"));
        }
        uint64_t v13 = [(NSMutableArray *)codecs countByEnumeratingWithState:&v18 objects:v17 count:16];
      }
      while (v13);
    }
  }
  return v5;
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_ssrc = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (NSSet)payloads
{
  return &self->_payloads->super;
}

- (unsigned)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(unsigned int)a3
{
  self->_metadata = a3;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (void)setMaxNetworkBitrate:(unsigned int)a3
{
  self->_maxNetworkBitrate = a3;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (void)setMaxMediaBitrate:(unsigned int)a3
{
  self->_maxMediaBitrate = a3;
}

- (unsigned)maxPacketsPerSecond
{
  return self->_maxPacketsPerSecond;
}

- (void)setMaxPacketsPerSecond:(unsigned int)a3
{
  self->_maxPacketsPerSecond = a3;
}

- (unsigned)repairedStreamID
{
  return self->_repairedStreamID;
}

- (void)setRepairedStreamID:(unsigned __int16)a3
{
  self->_repairedStreamID = a3;
}

- (unsigned)repairedMaxNetworkBitrate
{
  return self->_repairedMaxNetworkBitrate;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  self->_repairedMaxNetworkBitrate = a3;
}

- (CGSize)resolution
{
  double width = self->_resolution.width;
  double height = self->_resolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setResolution:(CGSize)a3
{
  self->_resolution = a3;
}

- (unsigned)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unsigned int)a3
{
  self->_framerate = a3;
}

- (unsigned)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unsigned int)a3
{
  self->_keyFrameInterval = a3;
}

- (unsigned)rtpTimestampRate
{
  return self->_rtpTimestampRate;
}

- (void)setRtpTimestampRate:(unsigned int)a3
{
  self->_rtpTimestampRate = a3;
}

- (NSArray)codecs
{
  return &self->_codecs->super;
}

- (unsigned)parentStreamID
{
  return self->_parentStreamID;
}

- (void)setParentStreamID:(unsigned __int16)a3
{
  self->_parentStreamID = a3;
}

- (BOOL)isTemporalStream
{
  return self->_isTemporalStream;
}

- (void)setIsTemporalStream:(BOOL)a3
{
  self->_isTemporalStream = a3;
}

- (BOOL)isSubStream
{
  return self->_isSubStream;
}

- (void)setIsSubStream:(BOOL)a3
{
  self->_isSubStream = a3;
}

- (unsigned)audioChannelCount
{
  return self->_audioChannelCount;
}

- (void)setAudioChannelCount:(unsigned int)a3
{
  self->_audioChannelCount = a3;
}

- (unint64_t)serializedSize
{
  return self->_serializedSize;
}

- (void)setSerializedSize:(unint64_t)a3
{
  self->_serializedSize = a3;
}

- (unsigned)coordinateSystem
{
  return self->_coordinateSystem;
}

- (void)setCoordinateSystem:(unsigned int)a3
{
  self->_coordinateSystem = a3;
}

- (unsigned)v2StreamID
{
  return self->_v2StreamID;
}

- (void)setV2StreamID:(unsigned __int16)a3
{
  self->_v2StreamID = a3;
}

- (unsigned)streamIndex
{
  return self->_streamIndex;
}

- (void)setStreamIndex:(unsigned __int8)a3
{
  self->_streamIndex = a3;
}

- (void)applyCipherSuiteOnMediaStreamConfig:(NSObject *)a3 codecConfigs:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[VCMediaNegotiatorStreamGroupStreamConfiguration applyCipherSuiteOnMediaStreamConfig:codecConfigs:]";
  __int16 v8 = 1024;
  int v9 = 127;
  __int16 v10 = 2048;
  uint64_t v11 = [a2 cipherSuite];
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to convert negotiatorStreamGroupConfig cipherSuite(%ld) to mediaStreamConfig cipherSuite", (uint8_t *)&v4, 0x26u);
}

@end
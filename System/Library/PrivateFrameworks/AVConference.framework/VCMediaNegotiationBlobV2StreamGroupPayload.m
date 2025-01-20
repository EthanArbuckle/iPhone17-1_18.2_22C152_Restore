@interface VCMediaNegotiationBlobV2StreamGroupPayload
+ (BOOL)isDefaultPayloadConfig:(id)a3 index:(unsigned int)a4 rtpSampleRate:(unsigned int)a5 streamGroupID:(unsigned int)a6;
+ (BOOL)isNegotiationCodecTypeAudio:(unsigned int)a3;
+ (BOOL)isPTimePackable:(unsigned int)a3;
+ (id)defaultDataCodecConfig;
+ (id)defaultFTXTCodecConfig;
+ (id)defaultMMJIConfig;
+ (id)defaultMoCapConfig;
+ (id)defaultPayloadConfigurationsForStreamGroupID:(unsigned int)a3;
+ (id)rtcpFlagStringWithPayloadConfig:(id)a3;
+ (int)negotiationPackedRtpSampleRateWithRTPSampleRate:(unsigned int)a3;
+ (int64_t)codecTypeWithNegotiationCodecType:(unsigned int)a3;
+ (unsigned)cipherSuiteWithNegotiationCipherSuite:(unsigned int)a3;
+ (unsigned)defaultRTPSampleRateForStreamGroupID:(unsigned int)a3;
+ (unsigned)mediaFlagsWithPayloadConfig:(id)a3;
+ (unsigned)negotiationCipherSuiteWithCipherSuite:(unsigned int)a3;
+ (unsigned)negotiationCodecTypeWithCodecType:(int64_t)a3;
+ (unsigned)negotiationPackedPTimeWithPTime:(unsigned int)a3;
+ (unsigned)pTimeWithNegotiationPackedPTime:(unsigned __int8)a3;
+ (unsigned)rtcpFlagsWithPayloadConfig:(id)a3;
+ (unsigned)rtpSampleRateWithNegotiationPackedSampleRate:(int)a3;
+ (void)printWithLogFile:(void *)a3 prefix:(id)a4 payloadConfig:(id)a5;
- (BOOL)hasCipherSuite;
- (BOOL)hasCodecType;
- (BOOL)hasEncoderUsage;
- (BOOL)hasMediaFlags;
- (BOOL)hasPTime;
- (BOOL)hasPackedPayload;
- (BOOL)hasProfileLevelId;
- (BOOL)hasRtcpFlags;
- (BOOL)hasRtpPayload;
- (BOOL)hasRtpSampleRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)packedPayload;
- (VCMediaNegotiationBlobV2StreamGroupPayload)initWithPayloadConfig:(id)a3 index:(unsigned int)a4 rtpSampleRate:(unsigned int)a5 streamGroupID:(unsigned int)a6;
- (VCMediaNegotiationBlobV2StreamGroupPayload)initWithPayloadConfig:(id)a3 rtpSampleRate:(unsigned int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)newCompactPayloadWithPayloadConfig:(id)a3 rtpSampleRate:(unsigned int)a4;
- (id)payloadConfigurationWithPayloadConfig:(id)a3;
- (id)payloadConfigurationWithStreamGroupID:(unsigned int)a3 index:(unsigned int)a4;
- (unint64_t)hash;
- (unsigned)cipherSuite;
- (unsigned)codecType;
- (unsigned)encoderUsage;
- (unsigned)mediaFlags;
- (unsigned)pTime;
- (unsigned)profileLevelId;
- (unsigned)rtcpFlags;
- (unsigned)rtpPayload;
- (unsigned)rtpSampleRate;
- (unsigned)rtpSampleRateWithStreamGroupID:(unsigned int)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)getStreamGroupPayload:(tagStreamGroupPayload *)a3;
- (void)mergeFrom:(id)a3;
- (void)setCipherSuite:(unsigned int)a3;
- (void)setCodecType:(unsigned int)a3;
- (void)setEncoderUsage:(unsigned int)a3;
- (void)setHasCipherSuite:(BOOL)a3;
- (void)setHasCodecType:(BOOL)a3;
- (void)setHasEncoderUsage:(BOOL)a3;
- (void)setHasMediaFlags:(BOOL)a3;
- (void)setHasPTime:(BOOL)a3;
- (void)setHasProfileLevelId:(BOOL)a3;
- (void)setHasRtcpFlags:(BOOL)a3;
- (void)setHasRtpPayload:(BOOL)a3;
- (void)setHasRtpSampleRate:(BOOL)a3;
- (void)setMediaFlags:(unsigned int)a3;
- (void)setNegotiationPackedPayloadWithStreamGroupPayload:(tagStreamGroupPayload *)a3;
- (void)setPTime:(unsigned int)a3;
- (void)setPackedPayload:(id)a3;
- (void)setProfileLevelId:(unsigned int)a3;
- (void)setRtcpFlags:(unsigned int)a3;
- (void)setRtpPayload:(unsigned int)a3;
- (void)setRtpSampleRate:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2StreamGroupPayload

+ (id)defaultFTXTCodecConfig
{
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setCodecType:102];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setRtpPayload:100];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setH264PacketizationMode:1];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setCipherSuite:3];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setEncoderUsage:4];
  [v2 addObject:v3];

  return v2;
}

+ (id)defaultDataCodecConfig
{
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setCodecType:102];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setRtpPayload:110];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setH264PacketizationMode:1];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setCipherSuite:3];
  [v2 addObject:v3];

  return v2;
}

+ (id)defaultMoCapConfig
{
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setCodecType:301];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setRtpPayload:124];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setH264PacketizationMode:1];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setCipherSuite:3];
  [v2 addObject:v3];

  return v2;
}

+ (id)defaultMMJIConfig
{
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setCodecType:302];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setRtpPayload:125];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setH264PacketizationMode:1];
  [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v3 setCipherSuite:3];
  [v2 addObject:v3];

  return v2;
}

+ (id)defaultPayloadConfigurationsForStreamGroupID:(unsigned int)a3
{
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ((int)a3 > 1835623281)
  {
    if ((int)a3 <= 1935897188)
    {
      if (a3 == 1835623282)
      {
        v13 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v13 setCodecType:4];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v13 setPTime:20];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v13 setCipherSuite:3];
        [v4 addObject:v13];

        v14 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v14 setCodecType:9];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v14 setPTime:20];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v14 setCipherSuite:3];
        [v4 addObject:v14];

        v15 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v15 setCodecType:8];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v15 setPTime:20];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v15 setCipherSuite:3];
        [v4 addObject:v15];

        if (+[VCHardwareSettings deviceClass] != 8) {
          return v4;
        }
        v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setCodecType:16];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setRtpPayload:101];
        v7 = v6;
        uint64_t v8 = 10;
LABEL_29:
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v7 setPTime:v8];
        goto LABEL_30;
      }
      if (a3 != 1835623287) {
        return v4;
      }
    }
    else
    {
      if (a3 == 1935897189)
      {
LABEL_16:
        v9 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v9 setCodecType:100];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v9 setRtpPayload:123];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v9 setH264PacketizationMode:1];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v9 setCipherSuite:3];
        [v4 addObject:v9];

        v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setCodecType:102];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setRtpPayload:100];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setH264PacketizationMode:1];
LABEL_30:
        v11 = v6;
        uint64_t v12 = 3;
        goto LABEL_31;
      }
      if (a3 != 1936290409)
      {
        if (a3 != 1937339233) {
          return v4;
        }
        v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setCodecType:16];
        [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setRtpPayload:96];
        v7 = v6;
        uint64_t v8 = 60;
        goto LABEL_29;
      }
    }
    v10 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v10 setCodecType:12];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v10 setRtpPayload:96];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v10 setPTime:60];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v10 setUseInBandFEC:0];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v10 setRtcpSREnabled:1];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v10 setCipherSuite:2];
    [v4 addObject:v10];

    v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setCodecType:11];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setRtpPayload:97];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setPTime:40];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setUseInBandFEC:1];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setRtcpSREnabled:1];
    v11 = v6;
    uint64_t v12 = 2;
LABEL_31:
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v11 setCipherSuite:v12];
    [v4 addObject:v6];

    return v4;
  }
  if ((int)a3 <= 1667329398)
  {
    if (a3 == 1650745716)
    {
      return +[VCMediaNegotiationBlobV2StreamGroupPayload defaultMoCapConfig];
    }
    if (a3 != 1667329381) {
      return v4;
    }
    goto LABEL_16;
  }
  if (a3 == 1667329399)
  {
    v6 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setCodecType:100];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setRtpPayload:123];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setRtcpPSFB_PLIEnabled:1];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setRtcpPSFB_FIREnabled:1];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setRtcpSREnabled:1];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setH264LevelAsymmetryAllowed:0];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setH264PacketizationMode:1];
    [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v6 setProfileLevelId:4374559];
    v11 = v6;
    uint64_t v12 = 1;
    goto LABEL_31;
  }
  if (a3 != 1717854580)
  {
    if (a3 == 1718909044)
    {
      return +[VCMediaNegotiationBlobV2StreamGroupPayload defaultFTXTCodecConfig];
    }
    return v4;
  }

  return +[VCMediaNegotiationBlobV2StreamGroupPayload defaultMMJIConfig];
}

+ (unsigned)defaultRTPSampleRateForStreamGroupID:(unsigned int)a3
{
  if ((int)a3 <= 1835623281)
  {
    if ((int)a3 <= 1667329398)
    {
      if (a3 == 1650745716) {
        return 24000;
      }
      int v3 = 1667329381;
    }
    else
    {
      if (a3 == 1667329399) {
        return 90000;
      }
      if (a3 == 1717854580) {
        return 24000;
      }
      int v3 = 1718909044;
    }
    if (a3 != v3) {
      return 0;
    }
    return 24000;
  }
  unsigned int result = 48000;
  if ((int)a3 <= 1935897188)
  {
    if (a3 == 1835623282) {
      return 24000;
    }
    int v5 = 1835623287;
  }
  else
  {
    if (a3 == 1935897189 || a3 == 1936290409) {
      return result;
    }
    int v5 = 1937339233;
  }
  if (a3 != v5) {
    return 0;
  }
  return result;
}

+ (BOOL)isDefaultPayloadConfig:(id)a3 index:(unsigned int)a4 rtpSampleRate:(unsigned int)a5 streamGroupID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:*(void *)&a6];
  if ([v10 count] <= (unint64_t)a4) {
    goto LABEL_20;
  }
  uint64_t v11 = [v10 objectAtIndex:a4];
  if (!v11) {
    return v11;
  }
  uint64_t v12 = (void *)v11;
  unsigned int v13 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:v6];
  uint64_t v14 = [v12 codecType];
  if (v14 != [a3 codecType]) {
    goto LABEL_20;
  }
  int v15 = [v12 rtpPayload];
  if (v15 != [a3 rtpPayload]) {
    goto LABEL_20;
  }
  uint64_t v16 = [v12 pTime];
  if (v16 != [a3 pTime]) {
    goto LABEL_20;
  }
  int v17 = objc_msgSend(v12, "rtcpRTPFB_GNACKEnabled");
  if (v17 != objc_msgSend(a3, "rtcpRTPFB_GNACKEnabled")
    || (int v18 = objc_msgSend(v12, "rtcpPSFB_PLIEnabled"), v18 != objc_msgSend(a3, "rtcpPSFB_PLIEnabled"))
    || (int v19 = objc_msgSend(v12, "rtcpPSFB_FIREnabled"), v19 != objc_msgSend(a3, "rtcpPSFB_FIREnabled"))
    || (int v20 = [v12 rtcpSREnabled], v20 != objc_msgSend(a3, "rtcpSREnabled"))
    || (int v21 = [v12 H264LevelAsymmetryAllowed],
        v21 != [a3 H264LevelAsymmetryAllowed])
    || (int v22 = [v12 H264PacketizationMode], v22 != objc_msgSend(a3, "H264PacketizationMode"))
    || (int v23 = [v12 useInBandFEC], v23 != objc_msgSend(a3, "useInBandFEC"))
    || (uint64_t v24 = [v12 profileLevelId], v24 != objc_msgSend(a3, "profileLevelId")))
  {
LABEL_20:
    LOBYTE(v11) = 0;
    return v11;
  }
  int v25 = [v12 cipherSuite];
  LOBYTE(v11) = v25 == [a3 cipherSuite] && v13 == a5;
  return v11;
}

+ (unsigned)negotiationCodecTypeWithCodecType:(int64_t)a3
{
  if (a3 > 99)
  {
    if (a3 <= 299)
    {
      if (a3 == 100) {
        return 1;
      }
      if (a3 == 102) {
        return 2;
      }
    }
    else
    {
      switch(a3)
      {
        case 300:
          return 6;
        case 301:
          return 10;
        case 302:
          return 11;
      }
    }
    return 0;
  }
  else
  {
    switch(a3)
    {
      case 4:
        unsigned int result = 8;
        break;
      case 8:
        unsigned int result = 7;
        break;
      case 9:
        unsigned int result = 9;
        break;
      case 11:
        unsigned int result = 4;
        break;
      case 12:
        unsigned int result = 3;
        break;
      case 16:
        unsigned int result = 5;
        break;
      default:
        return 0;
    }
  }
  return result;
}

+ (BOOL)isNegotiationCodecTypeAudio:(unsigned int)a3
{
  return (a3 < 9) & (0x1B8u >> a3);
}

+ (int64_t)codecTypeWithNegotiationCodecType:(unsigned int)a3
{
  if (a3 - 1 > 0xA) {
    return 0;
  }
  else {
    return qword_1E25A1F58[a3 - 1];
  }
}

+ (unsigned)rtcpFlagsWithPayloadConfig:(id)a3
{
  int v4 = objc_msgSend(a3, "rtcpPSFB_PLIEnabled");
  if (objc_msgSend(a3, "rtcpPSFB_FIREnabled")) {
    int v5 = 2;
  }
  else {
    int v5 = 0;
  }
  int v6 = v5 | v4;
  if ([a3 rtcpSREnabled]) {
    int v7 = 4;
  }
  else {
    int v7 = 0;
  }
  return v6 | v7;
}

+ (unsigned)mediaFlagsWithPayloadConfig:(id)a3
{
  return [a3 useInBandFEC];
}

+ (id)rtcpFlagStringWithPayloadConfig:(id)a3
{
  unsigned int v3 = +[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagsWithPayloadConfig:a3];
  int v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = 1;
  do
  {
    if ((v5 & v3) != 0)
    {
      if v5 < 5 && ((0x17u >> v5)) {
        int v6 = off_1E6DB8EA8[v5];
      }
      else {
        int v6 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      }
      [v4 addObject:v6];
    }
    BOOL v7 = v5 >= 4;
    uint64_t v5 = (2 * v5);
  }
  while (!v7);

  return (id)[v4 componentsJoinedByString:@","];
}

+ (unsigned)negotiationCipherSuiteWithCipherSuite:(unsigned int)a3
{
  if (a3 < 4) {
    return a3 + 1;
  }
  else {
    return -1;
  }
}

+ (unsigned)cipherSuiteWithNegotiationCipherSuite:(unsigned int)a3
{
  if (a3 - 1 >= 4) {
    return -1;
  }
  else {
    return a3 - 1;
  }
}

- (void)setNegotiationPackedPayloadWithStreamGroupPayload:(tagStreamGroupPayload *)a3
{
  if (a3)
  {
    int v4 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:10];
    if (![(VCMediaNegotiationBlobV2StreamGroupPayload *)self packedPayload]
      || (objc_msgSend(v4, "isEqualToData:", -[VCMediaNegotiationBlobV2StreamGroupPayload packedPayload](self, "packedPayload")) & 1) == 0)
    {
      [(VCMediaNegotiationBlobV2StreamGroupPayload *)self setPackedPayload:v4];
    }
  }
}

- (void)getStreamGroupPayload:(tagStreamGroupPayload *)a3
{
  if (a3)
  {
    int v4 = [(VCMediaNegotiationBlobV2StreamGroupPayload *)self packedPayload];
    [(NSData *)v4 getBytes:a3 length:10];
  }
}

+ (int)negotiationPackedRtpSampleRateWithRTPSampleRate:(unsigned int)a3
{
  if ((int)a3 > 31999)
  {
    if ((int)a3 > 47999)
    {
      if (a3 == 48000) {
        return 7;
      }
      if (a3 == 90000) {
        return 8;
      }
    }
    else
    {
      if (a3 == 32000) {
        return 5;
      }
      if (a3 == 44100) {
        return 6;
      }
    }
  }
  else if ((int)a3 > 22049)
  {
    if (a3 == 22050) {
      return 3;
    }
    if (a3 == 24000) {
      return 4;
    }
  }
  else
  {
    if (a3 == 8000) {
      return 1;
    }
    if (a3 == 16000) {
      return 2;
    }
  }
  return 0;
}

+ (unsigned)rtpSampleRateWithNegotiationPackedSampleRate:(int)a3
{
  if ((a3 - 1) > 7) {
    return 0;
  }
  else {
    return dword_1E25A1FB0[a3 - 1];
  }
}

+ (BOOL)isPTimePackable:(unsigned int)a3
{
  return a3 < 0x500 && -858993459 * a3 < 0x33333334;
}

+ (unsigned)negotiationPackedPTimeWithPTime:(unsigned int)a3
{
  return a3 / 5;
}

+ (unsigned)pTimeWithNegotiationPackedPTime:(unsigned __int8)a3
{
  return 5 * a3;
}

- (VCMediaNegotiationBlobV2StreamGroupPayload)initWithPayloadConfig:(id)a3 rtpSampleRate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:rtpSampleRate:]();
      }
    }
  }
  BOOL v7 = [(VCMediaNegotiationBlobV2StreamGroupPayload *)self init];
  if (v7)
  {
    uint64_t v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCodecTypeWithCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCodecTypeWithCodecType:", [a3 codecType]);
    if (v8)
    {
      uint64_t v9 = v8;
      if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 codecType] != v8) {
        [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 setCodecType:v9];
      }
      unsigned int v10 = [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 rtpPayload];
      if (v10 != [a3 rtpPayload]) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload setRtpPayload:](v7, "setRtpPayload:", [a3 rtpPayload]);
      }
      unsigned int v11 = [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 pTime];
      if ([a3 pTime] != v11) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload setPTime:](v7, "setPTime:", [a3 pTime]);
      }
      uint64_t v12 = +[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagsWithPayloadConfig:a3];
      if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 rtcpFlags] != v12) {
        [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 setRtcpFlags:v12];
      }
      uint64_t v13 = +[VCMediaNegotiationBlobV2StreamGroupPayload mediaFlagsWithPayloadConfig:a3];
      if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 mediaFlags] != v13) {
        [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 setMediaFlags:v13];
      }
      unsigned int v14 = [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 profileLevelId];
      if ([a3 profileLevelId] != v14) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload setProfileLevelId:](v7, "setProfileLevelId:", [a3 profileLevelId]);
      }
      unsigned int v15 = [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 encoderUsage];
      if (v15 != [a3 encoderUsage]) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload setEncoderUsage:](v7, "setEncoderUsage:", [a3 encoderUsage]);
      }
      if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 rtpSampleRate] != v4) {
        [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 setRtpSampleRate:v4];
      }
      uint64_t v16 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCipherSuiteWithCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCipherSuiteWithCipherSuite:", [a3 cipherSuite]);
      if (v16 != -1)
      {
        uint64_t v17 = v16;
        if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 cipherSuite] != v16) {
          [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 setCipherSuite:v17];
        }
        int v18 = [(VCMediaNegotiationBlobV2StreamGroupPayload *)v7 newCompactPayloadWithPayloadConfig:a3 rtpSampleRate:v4];
        if (v18
          && (unint64_t v19 = objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](v7, "data"), "length"),
              v19 > objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](v18, "data"), "length")))
        {

          return v18;
        }
        else
        {
        }
        return v7;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:rtpSampleRate:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:rtpSampleRate:]();
      }
    }

    return 0;
  }
  return v7;
}

- (VCMediaNegotiationBlobV2StreamGroupPayload)initWithPayloadConfig:(id)a3 index:(unsigned int)a4 rtpSampleRate:(unsigned int)a5 streamGroupID:(unsigned int)a6
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:]();
      }
    }
    goto LABEL_39;
  }
  uint64_t v7 = *(void *)&a6;
  uint64_t v8 = *(void *)&a5;
  id v11 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:*(void *)&a6];
  if ([v11 count] > (unint64_t)a4)
  {
    uint64_t v12 = [v11 objectAtIndex:a4];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      self = [(VCMediaNegotiationBlobV2StreamGroupPayload *)self init];
      if (!self) {
        return self;
      }
      int v14 = [v13 H264PacketizationMode];
      if (v14 == [a3 H264PacketizationMode])
      {
        int v15 = [v13 H264LevelAsymmetryAllowed];
        if (v15 == [a3 H264LevelAsymmetryAllowed])
        {
          unsigned int v16 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:v7];
          uint64_t v17 = [v13 codecType];
          if (v17 == [a3 codecType])
          {
LABEL_10:
            int v19 = [v13 rtpPayload];
            if (v19 != [a3 rtpPayload]) {
              -[VCMediaNegotiationBlobV2StreamGroupPayload setRtpPayload:](self, "setRtpPayload:", [a3 rtpPayload]);
            }
            uint64_t v20 = [v13 pTime];
            if (v20 != [a3 pTime]) {
              -[VCMediaNegotiationBlobV2StreamGroupPayload setPTime:](self, "setPTime:", [a3 pTime]);
            }
            int v21 = objc_msgSend(v13, "rtcpRTPFB_GNACKEnabled");
            if (v21 != objc_msgSend(a3, "rtcpRTPFB_GNACKEnabled")
              || (int v22 = objc_msgSend(v13, "rtcpPSFB_PLIEnabled"),
                  v22 != objc_msgSend(a3, "rtcpPSFB_PLIEnabled"))
              || (int v23 = objc_msgSend(v13, "rtcpPSFB_FIREnabled"),
                  v23 != objc_msgSend(a3, "rtcpPSFB_FIREnabled"))
              || (int v24 = [v13 rtcpSREnabled], v24 != objc_msgSend(a3, "rtcpSREnabled")))
            {
              [(VCMediaNegotiationBlobV2StreamGroupPayload *)self setRtcpFlags:+[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagsWithPayloadConfig:a3]];
            }
            int v25 = [v13 useInBandFEC];
            if (v25 != [a3 useInBandFEC]) {
              [(VCMediaNegotiationBlobV2StreamGroupPayload *)self setMediaFlags:+[VCMediaNegotiationBlobV2StreamGroupPayload mediaFlagsWithPayloadConfig:a3]];
            }
            uint64_t v26 = [v13 profileLevelId];
            if (v26 != [a3 profileLevelId]) {
              -[VCMediaNegotiationBlobV2StreamGroupPayload setProfileLevelId:](self, "setProfileLevelId:", [a3 profileLevelId]);
            }
            int v27 = [v13 encoderUsage];
            if (v27 != [a3 encoderUsage]) {
              -[VCMediaNegotiationBlobV2StreamGroupPayload setEncoderUsage:](self, "setEncoderUsage:", [a3 encoderUsage]);
            }
            if (v16 != v8) {
              [(VCMediaNegotiationBlobV2StreamGroupPayload *)self setRtpSampleRate:v8];
            }
            int v28 = [v13 cipherSuite];
            if (v28 == [a3 cipherSuite]) {
              goto LABEL_30;
            }
            uint64_t v29 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCipherSuiteWithCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCipherSuiteWithCipherSuite:", [a3 cipherSuite]);
            if (v29 != -1)
            {
              [(VCMediaNegotiationBlobV2StreamGroupPayload *)self setCipherSuite:v29];
LABEL_30:
              v30 = [(VCMediaNegotiationBlobV2StreamGroupPayload *)self newCompactPayloadWithPayloadConfig:a3 rtpSampleRate:v8];
              if (v30
                && (unint64_t v31 = objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](self, "data"), "length"),
                    v31 > objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](v30, "data"), "length")))
              {

                return v30;
              }
              else
              {
              }
              return self;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:].cold.4();
              }
            }
            goto LABEL_39;
          }
          uint64_t v18 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCodecTypeWithCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCodecTypeWithCodecType:", [a3 codecType]);
          if (v18)
          {
            [(VCMediaNegotiationBlobV2StreamGroupPayload *)self setCodecType:v18];
            goto LABEL_10;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:].cold.5();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) initWithPayloadConfig:index:rtpSampleRate:streamGroupID:]();
        }
      }
LABEL_39:

      return 0;
    }
  }

  return [(VCMediaNegotiationBlobV2StreamGroupPayload *)self initWithPayloadConfig:a3 rtpSampleRate:v8];
}

- (id)newCompactPayloadWithPayloadConfig:(id)a3 rtpSampleRate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v17 = 0;
  unsigned int v16 = 0;
  uint64_t v6 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCodecTypeWithCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCodecTypeWithCodecType:", [a3 codecType]);
  uint64_t v7 = v6;
  if (v6 >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:]();
      }
    }
    return 0;
  }
  v15[0] = v6;
  if ([a3 rtpPayload] >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:]();
      }
    }
    return 0;
  }
  v15[1] = [a3 rtpPayload];
  unsigned int v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagsWithPayloadConfig:a3];
  if (v8 >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:]();
      }
    }
    return 0;
  }
  v15[2] = v8;
  unsigned int v9 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationPackedRtpSampleRateWithRTPSampleRate:v4];
  if (v9 >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.4();
      }
    }
    return 0;
  }
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.5();
      }
    }
    return 0;
  }
  v15[3] = v9;
  unsigned int v10 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCipherSuiteWithCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCipherSuiteWithCipherSuite:", [a3 cipherSuite]);
  if (v10 >= 0x100)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.6();
      }
    }
    return 0;
  }
  v15[4] = v10;
  if (+[VCMediaNegotiationBlobV2StreamGroupPayload isNegotiationCodecTypeAudio:v7])
  {
    unsigned int v11 = +[VCMediaNegotiationBlobV2StreamGroupPayload mediaFlagsWithPayloadConfig:a3];
    if (v11 >= 0x100)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.7();
        }
      }
      return 0;
    }
    BYTE1(v16) = v11;
    if (!+[VCMediaNegotiationBlobV2StreamGroupPayload isPTimePackable:](VCMediaNegotiationBlobV2StreamGroupPayload, "isPTimePackable:", [a3 pTime]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.9();
        }
      }
      return 0;
    }
    LOBYTE(v16) = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationPackedPTimeWithPTime:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationPackedPTimeWithPTime:", [a3 pTime]);
  }
  else
  {
    unsigned int v16 = bswap32([a3 profileLevelId]);
    char v17 = [a3 encoderUsage];
  }
  uint64_t v12 = objc_alloc_init(VCMediaNegotiationBlobV2StreamGroupPayload);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) newCompactPayloadWithPayloadConfig:rtpSampleRate:].cold.8();
      }
    }
    return 0;
  }
  uint64_t v13 = v12;
  -[VCMediaNegotiationBlobV2StreamGroupPayload setPackedPayload:](v12, "setPackedPayload:", [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:10]);
  return v13;
}

- (unsigned)rtpSampleRateWithStreamGroupID:(unsigned int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:*(void *)&a3];
  if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasPackedPayload])
  {
    __int16 v7 = 0;
    uint64_t v6 = 0;
    [(VCMediaNegotiationBlobV2StreamGroupPayload *)self getStreamGroupPayload:&v6];
    return +[VCMediaNegotiationBlobV2StreamGroupPayload rtpSampleRateWithNegotiationPackedSampleRate:BYTE3(v6)];
  }
  else if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasRtpSampleRate])
  {
    return self->_rtpSampleRate;
  }
  return v4;
}

- (id)payloadConfigurationWithStreamGroupID:(unsigned int)a3 index:(unsigned int)a4
{
  id v6 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:*(void *)&a3];
  if ([v6 count] > (unint64_t)a4 && (uint64_t v7 = objc_msgSend(v6, "objectAtIndex:", a4)) != 0)
  {
    uint64_t v8 = (VCMediaNegotiatorStreamGroupCodecConfiguration *)v7;
    int v9 = 0;
  }
  else
  {
    uint64_t v8 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
    int v9 = 1;
  }
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setSerializedSize:](v8, "setSerializedSize:", objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](self, "data"), "length"));
  if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasPackedPayload])
  {
    return [(VCMediaNegotiationBlobV2StreamGroupPayload *)self payloadConfigurationWithPayloadConfig:v8];
  }
  else
  {
    if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasCodecType]) {
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setCodecType:+[VCMediaNegotiationBlobV2StreamGroupPayload codecTypeWithNegotiationCodecType:self->_codecType]];
    }
    if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasRtpPayload]) {
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setRtpPayload:self->_rtpPayload];
    }
    if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasPTime]) {
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setPTime:self->_pTime];
    }
    if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasRtcpFlags])
    {
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setRtcpPSFB_PLIEnabled:self->_rtcpFlags & 1];
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setRtcpPSFB_FIREnabled:(self->_rtcpFlags >> 1) & 1];
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setRtcpSREnabled:(self->_rtcpFlags >> 2) & 1];
    }
    if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasMediaFlags]) {
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setUseInBandFEC:self->_mediaFlags & 1];
    }
    if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasProfileLevelId]) {
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setProfileLevelId:self->_profileLevelId];
    }
    if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasEncoderUsage]) {
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setEncoderUsage:self->_encoderUsage];
    }
    if (v9 && [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 codecType] == 100)
    {
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setH264LevelAsymmetryAllowed:1];
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setH264PacketizationMode:1];
    }
    if ([(VCMediaNegotiationBlobV2StreamGroupPayload *)self hasCipherSuite]) {
      [(VCMediaNegotiatorStreamGroupCodecConfiguration *)v8 setCipherSuite:+[VCMediaNegotiationBlobV2StreamGroupPayload cipherSuiteWithNegotiationCipherSuite:self->_cipherSuite]];
    }
    -[VCMediaNegotiatorStreamGroupCodecConfiguration setSerializedSize:](v8, "setSerializedSize:", objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](self, "data"), "length"));
    return v8;
  }
}

- (id)payloadConfigurationWithPayloadConfig:(id)a3
{
  v6[2] = *MEMORY[0x1E4F143B8];
  memset(v6, 0, 10);
  [(VCMediaNegotiationBlobV2StreamGroupPayload *)self getStreamGroupPayload:v6];
  objc_msgSend(a3, "setCodecType:", +[VCMediaNegotiationBlobV2StreamGroupPayload codecTypeWithNegotiationCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "codecTypeWithNegotiationCodecType:", LOBYTE(v6[0])));
  [a3 setRtpPayload:BYTE1(v6[0])];
  objc_msgSend(a3, "setRtcpPSFB_PLIEnabled:", BYTE2(v6[0]) & 1);
  objc_msgSend(a3, "setRtcpPSFB_FIREnabled:", (BYTE2(v6[0]) >> 1) & 1);
  [a3 setRtcpSREnabled:(BYTE2(v6[0]) >> 2) & 1];
  objc_msgSend(a3, "setCipherSuite:", +[VCMediaNegotiationBlobV2StreamGroupPayload cipherSuiteWithNegotiationCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "cipherSuiteWithNegotiationCipherSuite:", BYTE4(v6[0])));
  if (+[VCMediaNegotiationBlobV2StreamGroupPayload isNegotiationCodecTypeAudio:LOBYTE(v6[0])])
  {
    objc_msgSend(a3, "setPTime:", +[VCMediaNegotiationBlobV2StreamGroupPayload pTimeWithNegotiationPackedPTime:](VCMediaNegotiationBlobV2StreamGroupPayload, "pTimeWithNegotiationPackedPTime:", BYTE5(v6[0])));
    [a3 setUseInBandFEC:BYTE6(v6[0]) & 1];
  }
  else
  {
    [a3 setProfileLevelId:bswap32(*(unsigned int *)((char *)v6 + 5))];
    [a3 setEncoderUsage:BYTE1(v6[1])];
    if ([a3 codecType] == 100)
    {
      [a3 setH264LevelAsymmetryAllowed:1];
      [a3 setH264PacketizationMode:1];
    }
  }
  objc_msgSend(a3, "setSerializedSize:", objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroupPayload data](self, "data"), "length"));
  return a3;
}

+ (void)printWithLogFile:(void *)a3 prefix:(id)a4 payloadConfig:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@", objc_msgSend(a5, "serializedSize"), a4];
  [v7 appendString:@"Payload config:"];
  if (!a5)
  {
    unsigned int v10 = @" <failed to decode>";
LABEL_19:
    objc_msgSend(v7, "appendFormat:", v10, v22);
    goto LABEL_20;
  }
  uint64_t v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCodecTypeWithCodecType:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCodecTypeWithCodecType:", [a5 codecType]);
  if (v8 >= 0xC) {
    int v9 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
  }
  else {
    int v9 = off_1E6DB8ED0[(int)v8];
  }
  [v7 appendFormat:@" CodecType=%@", v9];
  if ([a5 rtpPayload]) {
    objc_msgSend(v7, "appendFormat:", @" RTPPayload=%u", objc_msgSend(a5, "rtpPayload"));
  }
  if ([a5 pTime]) {
    objc_msgSend(v7, "appendFormat:", @" pTime=%lu", objc_msgSend(a5, "pTime"));
  }
  [v7 appendFormat:@" rtcpFlags=[%@]", +[VCMediaNegotiationBlobV2StreamGroupPayload rtcpFlagStringWithPayloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "rtcpFlagStringWithPayloadConfig:", a5)];
  if ([a5 useInBandFEC]) {
    [v7 appendFormat:@" useInBandFEC=1"];
  }
  if ([a5 profileLevelId]) {
    objc_msgSend(v7, "appendFormat:", @" profileLevelID=%lx", objc_msgSend(a5, "profileLevelId"));
  }
  uint64_t v11 = +[VCMediaNegotiationBlobV2StreamGroupPayload negotiationCipherSuiteWithCipherSuite:](VCMediaNegotiationBlobV2StreamGroupPayload, "negotiationCipherSuiteWithCipherSuite:", [a5 cipherSuite]);
  if ((v11 - 1) >= 4) {
    uint64_t v12 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
  }
  else {
    uint64_t v12 = off_1E6DB8F30[(int)v11 - 1];
  }
  [v7 appendFormat:@" cipherSuite=%@", v12];
  if ([a5 encoderUsage])
  {
    uint64_t v22 = [a5 encoderUsage];
    unsigned int v10 = @" encoderUsage=%u";
    goto LABEL_19;
  }
LABEL_20:
  char v13 = [v7 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v14, v15, v16, v17, v18, v19, v13);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    int v21 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v24 = v20;
      __int16 v25 = 2080;
      uint64_t v26 = "+[VCMediaNegotiationBlobV2StreamGroupPayload(Utils) printWithLogFile:prefix:payloadConfig:]";
      __int16 v27 = 1024;
      int v28 = 901;
      __int16 v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2StreamGroupPayload *)self setPackedPayload:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupPayload;
  [(VCMediaNegotiationBlobV2StreamGroupPayload *)&v3 dealloc];
}

- (void)setCodecType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_codecType = a3;
}

- (void)setHasCodecType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCodecType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setRtpPayload:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rtpPayload = a3;
}

- (void)setHasRtpPayload:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRtpPayload
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPTime:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pTime = a3;
}

- (void)setHasPTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPTime
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRtcpFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rtcpFlags = a3;
}

- (void)setHasRtcpFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRtcpFlags
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMediaFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_mediaFlags = a3;
}

- (void)setHasMediaFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMediaFlags
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setProfileLevelId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_profileLevelId = a3;
}

- (void)setHasProfileLevelId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasProfileLevelId
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRtpSampleRate:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rtpSampleRate = a3;
}

- (void)setHasRtpSampleRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRtpSampleRate
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setCipherSuite:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_cipherSuite = a3;
}

- (void)setHasCipherSuite:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCipherSuite
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasPackedPayload
{
  return self->_packedPayload != 0;
}

- (void)setEncoderUsage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_encoderUsage = a3;
}

- (void)setHasEncoderUsage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEncoderUsage
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupPayload;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2StreamGroupPayload description](&v3, sel_description), -[VCMediaNegotiationBlobV2StreamGroupPayload dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_codecType), @"codecType");
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtpPayload), @"rtpPayload");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_pTime), @"pTime");
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtcpFlags), @"rtcpFlags");
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_mediaFlags), @"mediaFlags");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_profileLevelId), @"profileLevelId");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_21:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtpSampleRate), @"rtpSampleRate");
  if (*(_WORD *)&self->_has) {
LABEL_9:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cipherSuite), @"cipherSuite");
LABEL_10:
  packedPayload = self->_packedPayload;
  if (packedPayload) {
    [v3 setObject:packedPayload forKey:@"packedPayload"];
  }
  if ((*(_WORD *)&self->_has & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_encoderUsage), @"encoderUsage");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2StreamGroupPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  if (*(_WORD *)&self->_has) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
  if (self->_packedPayload) {
    PBDataWriterWriteDataField();
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_codecType;
    *((_WORD *)a3 + 28) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 12) = self->_rtpPayload;
  *((_WORD *)a3 + 28) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 6) = self->_pTime;
  *((_WORD *)a3 + 28) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 11) = self->_rtcpFlags;
  *((_WORD *)a3 + 28) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 5) = self->_mediaFlags;
  *((_WORD *)a3 + 28) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 10) = self->_profileLevelId;
  *((_WORD *)a3 + 28) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_21:
  *((_DWORD *)a3 + 13) = self->_rtpSampleRate;
  *((_WORD *)a3 + 28) |= 0x100u;
  if (*(_WORD *)&self->_has)
  {
LABEL_9:
    *((_DWORD *)a3 + 2) = self->_cipherSuite;
    *((_WORD *)a3 + 28) |= 1u;
  }
LABEL_10:
  if (self->_packedPayload) {
    objc_msgSend(a3, "setPackedPayload:");
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_encoderUsage;
    *((_WORD *)a3 + 28) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_codecType;
    *(_WORD *)(v5 + 56) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 48) = self->_rtpPayload;
  *(_WORD *)(v5 + 56) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 24) = self->_pTime;
  *(_WORD *)(v5 + 56) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 44) = self->_rtcpFlags;
  *(_WORD *)(v5 + 56) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 20) = self->_mediaFlags;
  *(_WORD *)(v5 + 56) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 40) = self->_profileLevelId;
  *(_WORD *)(v5 + 56) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  *(_DWORD *)(v5 + 52) = self->_rtpSampleRate;
  *(_WORD *)(v5 + 56) |= 0x100u;
  if (*(_WORD *)&self->_has)
  {
LABEL_9:
    *(_DWORD *)(v5 + 8) = self->_cipherSuite;
    *(_WORD *)(v5 + 56) |= 1u;
  }
LABEL_10:

  *(void *)(v6 + 32) = [(NSData *)self->_packedPayload copyWithZone:a3];
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_encoderUsage;
    *(_WORD *)(v6 + 56) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 28);
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_codecType != *((_DWORD *)a3 + 3)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 2) != 0)
    {
LABEL_49:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_rtpPayload != *((_DWORD *)a3 + 12)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_pTime != *((_DWORD *)a3 + 6)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_rtcpFlags != *((_DWORD *)a3 + 11)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_mediaFlags != *((_DWORD *)a3 + 5)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_profileLevelId != *((_DWORD *)a3 + 10)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_49;
    }
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 28) & 0x100) == 0 || self->_rtpSampleRate != *((_DWORD *)a3 + 13)) {
        goto LABEL_49;
      }
    }
    else if ((*((_WORD *)a3 + 28) & 0x100) != 0)
    {
      goto LABEL_49;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_cipherSuite != *((_DWORD *)a3 + 2)) {
        goto LABEL_49;
      }
    }
    else if (v7)
    {
      goto LABEL_49;
    }
    packedPayload = self->_packedPayload;
    if ((unint64_t)packedPayload | *((void *)a3 + 4))
    {
      int v5 = -[NSData isEqual:](packedPayload, "isEqual:");
      if (!v5) {
        return v5;
      }
      __int16 has = (__int16)self->_has;
    }
    __int16 v9 = *((_WORD *)a3 + 28);
    LOBYTE(v5) = (v9 & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((v9 & 4) == 0 || self->_encoderUsage != *((_DWORD *)a3 + 4)) {
        goto LABEL_49;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v14 = 2654435761 * self->_codecType;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_rtpPayload;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_pTime;
    if ((has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_rtcpFlags;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_mediaFlags;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_profileLevelId;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v9 = 0;
    if (has) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_rtpSampleRate;
  if (has)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_cipherSuite;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = 0;
LABEL_18:
  uint64_t v11 = [(NSData *)self->_packedPayload hash];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_encoderUsage;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 2) != 0)
  {
    self->_codecType = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)a3 + 28);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_rtpPayload = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_pTime = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_rtcpFlags = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_mediaFlags = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_profileLevelId = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 28);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_21:
  self->_rtpSampleRate = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  if (*((_WORD *)a3 + 28))
  {
LABEL_9:
    self->_cipherSuite = *((_DWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_10:
  if (*((void *)a3 + 4)) {
    -[VCMediaNegotiationBlobV2StreamGroupPayload setPackedPayload:](self, "setPackedPayload:");
  }
  if ((*((_WORD *)a3 + 28) & 4) != 0)
  {
    self->_encoderUsage = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 4u;
  }
}

- (unsigned)codecType
{
  return self->_codecType;
}

- (unsigned)rtpPayload
{
  return self->_rtpPayload;
}

- (unsigned)pTime
{
  return self->_pTime;
}

- (unsigned)rtcpFlags
{
  return self->_rtcpFlags;
}

- (unsigned)mediaFlags
{
  return self->_mediaFlags;
}

- (unsigned)profileLevelId
{
  return self->_profileLevelId;
}

- (unsigned)rtpSampleRate
{
  return self->_rtpSampleRate;
}

- (unsigned)cipherSuite
{
  return self->_cipherSuite;
}

- (NSData)packedPayload
{
  return self->_packedPayload;
}

- (void)setPackedPayload:(id)a3
{
}

- (unsigned)encoderUsage
{
  return self->_encoderUsage;
}

@end
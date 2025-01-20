@interface VCPayloadUtils
+ (BOOL)canBundleExternallyForPayload:(int)a3 forBundlingScheme:(int)a4 operatingMode:(int)a5;
+ (BOOL)canSetBitrateForPayload:(int)a3;
+ (BOOL)isAMRCodecModeSupported:(int)a3 forBandwidth:(int)a4;
+ (BOOL)isCodecModeSupported:(int)a3 forBandwidth:(int)a4 withPayload:(int)a5;
+ (BOOL)isEVSCodecModeSupported:(int)a3 forBandwidth:(int)a4;
+ (BOOL)isEVSPayload:(int)a3;
+ (BOOL)isFormatAACELDNonSBR48KHzStereo:(const AudioStreamBasicDescription *)a3;
+ (BOOL)isOpus4Channel48KhzPayload:(int)a3 outFormat:(const AudioStreamBasicDescription *)a4;
+ (BOOL)isPayloadSupportedInFaceTime:(int)a3;
+ (BOOL)isUseCaseWatchContinuity:(int)a3 primaryPayload:(int)a4;
+ (BOOL)shouldEnablePacketSizeLimitForAudioFormat:(AudioStreamBasicDescription *)a3;
+ (BOOL)shouldUseCookieForPayload:(int)a3;
+ (BOOL)skipBandWidthCheckForCodecRateModes:(int)a3 supportedBitrates:(id)a4;
+ (BOOL)supportsCodecBandwidthUpdateForCodecType:(int64_t)a3;
+ (BOOL)supportsCodecRateModesForCodecType:(int64_t)a3;
+ (double)blockSizeForPayload:(int)a3 sampleRate:(unsigned int)a4;
+ (double)opusSamplesPerFrameForSampleRate:(unsigned int)a3 blockSize:(double)a4;
+ (float)qualityForPayload:(int)a3 forBitrate:(unsigned int)a4;
+ (id)allowedBitratesForPayload:(int)a3 supportedBitrates:(id)a4 supportedBandwidths:(id)a5;
+ (id)codecModesForAMR16kHz;
+ (id)codecModesForAMR8kHz;
+ (id)codecModesForEVS16kHz;
+ (id)codecModesForEVS32kHz;
+ (id)codecModesForEVS8kHz;
+ (id)supportedCodecModesForBandwidth:(int)a3 payload:(int)a4;
+ (int)audioCodecBandwidthForVCAudioCodecBandwidth:(int)a3;
+ (int)codecBandwidthForPayload:(int)a3;
+ (int)codecRateModeForDesiredANBR:(unsigned int)a3 payload:(int)a4 supportedBitrates:(id)a5 supportedBandwidths:(id)a6;
+ (int)payloadForCodecType:(int64_t)a3;
+ (int)vcAudioCodecBandwidthForAudioCodecBandwidth:(int)a3;
+ (int64_t)codecTypeForPayload:(int)a3;
+ (int64_t)ctAudioCodecEVSBandwidthForAudioCodecBandwidth:(int)a3;
+ (int64_t)ctAudioCodecEVSBitrateForBitrate:(unsigned int)a3;
+ (int64_t)ctAudioCodecTypeForMediaStreamCodec:(int64_t)a3;
+ (unsigned)audioCodecTypeForPayload:(int)a3;
+ (unsigned)bitrateForAMRCodecMode:(int)a3;
+ (unsigned)bitrateForAMRWBCodecMode:(int)a3;
+ (unsigned)bitrateForCodecType:(int64_t)a3 mode:(int)a4;
+ (unsigned)bitrateForEVSCodecMode:(int)a3;
+ (unsigned)codecSamplesPerFrameForPayload:(int)a3 blockSize:(double)a4;
+ (unsigned)codecSamplesPerFrameForPayload:(int)a3 blockSize:(double)a4 sampleRate:(unsigned int)a5;
+ (unsigned)internalBundleFactorForPayload:(int)a3;
+ (unsigned)sampleRateForCodecBandwidth:(int)a3;
+ (unsigned)sampleRateForPayload:(int)a3;
@end

@implementation VCPayloadUtils

+ (BOOL)isUseCaseWatchContinuity:(int)a3 primaryPayload:(int)a4
{
  BOOL v5 = a4 == 98 || a4 == 108;
  return a3 && v5;
}

+ (BOOL)isPayloadSupportedInFaceTime:(int)a3
{
  BOOL result = 1;
  if ((a3 - 97) <= 0x19)
  {
    if (((1 << (a3 - 97)) & 0x3400F83) != 0) {
      return result;
    }
    if (a3 == 99) {
      return 0;
    }
  }
  if (a3 > 0x14 || ((1 << a3) & 0x2301) == 0) {
    return 0;
  }
  return result;
}

+ (unsigned)sampleRateForPayload:(int)a3
{
  unsigned int result = 8000;
  if (a3 <= 12)
  {
    if (a3 && a3 != 8)
    {
      if (a3 == 9) {
        return 16000;
      }
      else {
        return 0;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 'a':
      case 'c':
      case 'o':
      case 'z':
        return result;
      case 'b':
      case 'j':
      case 'k':
      case 'y':
        return 16000;
      case 'd':
      case 'f':
      case 'g':
      case 'm':
      case 'n':
      case 'r':
      case 's':
      case 't':
      case 'u':
      case 'v':
      case 'x':
        return 0;
      case 'e':
        return 48000;
      case 'h':
      case 'p':
      case 'q':
      case 'w':
        goto LABEL_3;
      case 'i':
        return 22050;
      case 'l':
        return 32000;
      default:
        if (a3 != 13) {
          return 0;
        }
LABEL_3:
        unsigned int result = 24000;
        break;
    }
  }
  return result;
}

+ (unsigned)sampleRateForCodecBandwidth:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 8000;
  }
  else {
    return 16000 * (a3 - 1) + 16000;
  }
}

+ (unsigned)audioCodecTypeForPayload:(int)a3
{
  unsigned int result = 1935767394;
  switch(a3)
  {
    case 'a':
      unsigned int result = 1935764850;
      break;
    case 'b':
      return result;
    case 'c':
      unsigned int result = 1953790320;
      break;
    case 'd':
    case 'f':
    case 'g':
    case 'i':
    case 'm':
    case 'n':
    case 'p':
    case 'r':
    case 's':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_7;
    case 'e':
    case 'h':
    case 'j':
      unsigned int result = 1633772390;
      break;
    case 'k':
    case 'l':
    case 'o':
      unsigned int result = 1936029299;
      break;
    case 'q':
      unsigned int result = 1633903462;
      break;
    case 'w':
      unsigned int result = 1869641075;
      break;
    default:
      if (a3)
      {
        if (a3 == 8)
        {
          unsigned int result = 1634492791;
        }
        else
        {
LABEL_7:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              +[VCPayloadUtils audioCodecTypeForPayload:]();
            }
          }
          unsigned int result = -1;
        }
      }
      else
      {
        unsigned int result = 1970037111;
      }
      break;
  }
  return result;
}

+ (unsigned)codecSamplesPerFrameForPayload:(int)a3 blockSize:(double)a4
{
  return +[VCPayloadUtils codecSamplesPerFrameForPayload:*(void *)&a3 blockSize:0 sampleRate:a4];
}

+ (double)opusSamplesPerFrameForSampleRate:(unsigned int)a3 blockSize:(double)a4
{
  return dbl_1E259DC90[a3 == 48000] * a4;
}

+ (double)blockSizeForPayload:(int)a3 sampleRate:(unsigned int)a4
{
  BOOL v4 = a4 == 48000 && a3 == 119;
  double result = 0.02;
  if (v4) {
    return 0.01;
  }
  return result;
}

+ (unsigned)codecSamplesPerFrameForPayload:(int)a3 blockSize:(double)a4 sampleRate:(unsigned int)a5
{
  if (a3 > 12)
  {
    double v5 = 480.0;
    switch(a3)
    {
      case 'a':
      case 'o':
      case 'z':
        goto LABEL_8;
      case 'b':
      case 'k':
      case 'y':
        goto LABEL_7;
      case 'c':
        double v5 = 1408.0;
        return vcvtad_u64_f64(v5);
      case 'd':
      case 'f':
      case 'g':
      case 'm':
      case 'n':
      case 'r':
      case 's':
      case 't':
      case 'u':
      case 'v':
      case 'x':
        goto LABEL_13;
      case 'e':
      case 'h':
      case 'i':
      case 'j':
      case 'p':
      case 'q':
        return vcvtad_u64_f64(v5);
      case 'l':
        double v6 = 32000.0;
        goto LABEL_9;
      case 'w':
        [a1 opusSamplesPerFrameForSampleRate:*(void *)&a5 blockSize:a4];
        double v5 = v8;
        return vcvtad_u64_f64(v5);
      default:
        if (a3 != 13) {
          goto LABEL_13;
        }
        double v6 = 24000.0;
        goto LABEL_9;
    }
  }
  if (!a3 || a3 == 8)
  {
LABEL_8:
    double v6 = 8000.0;
    goto LABEL_9;
  }
  if (a3 == 9)
  {
LABEL_7:
    double v6 = 16000.0;
LABEL_9:
    double v5 = a4 * v6;
    return vcvtad_u64_f64(v5);
  }
LABEL_13:
  double v5 = 0.0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCPayloadUtils codecSamplesPerFrameForPayload:blockSize:sampleRate:]();
    }
  }
  return vcvtad_u64_f64(v5);
}

+ (BOOL)canSetBitrateForPayload:(int)a3
{
  return ((a3 - 97) < 0x17) & (0x41CF93u >> (a3 - 97));
}

+ (int)codecBandwidthForPayload:(int)a3
{
  int result = 0;
  if (a3 > 106)
  {
    if (a3 == 111) {
      return result;
    }
    if (a3 != 107) {
      return 2;
    }
  }
  else
  {
    if (a3 == 97) {
      return result;
    }
    if (a3 != 98) {
      return 2;
    }
  }
  return 1;
}

+ (id)codecModesForAMR8kHz
{
  return &unk_1F3DC7188;
}

+ (id)codecModesForAMR16kHz
{
  return &unk_1F3DC71A0;
}

+ (id)codecModesForEVS8kHz
{
  return &unk_1F3DC71B8;
}

+ (id)codecModesForEVS16kHz
{
  return &unk_1F3DC71D0;
}

+ (id)codecModesForEVS32kHz
{
  return &unk_1F3DC71E8;
}

+ (id)supportedCodecModesForBandwidth:(int)a3 payload:(int)a4
{
  if (a4 <= 106)
  {
    if (a4 != 97)
    {
      if (a4 == 98) {
        return (id)objc_msgSend(a1, "codecModesForAMR16kHz", *(void *)&a3);
      }
      return 0;
    }
    return (id)objc_msgSend(a1, "codecModesForAMR8kHz", *(void *)&a3);
  }
  else
  {
    if ((a4 - 107) >= 2 && a4 != 111) {
      return 0;
    }
    switch(a3)
    {
      case 2:
        return (id)[a1 codecModesForEVS32kHz];
      case 1:
        return (id)[a1 codecModesForEVS16kHz];
      case 0:
        return (id)[a1 codecModesForEVS8kHz];
      default:
        return 0;
    }
  }
}

+ (id)allowedBitratesForPayload:(int)a3 supportedBitrates:(id)a4 supportedBandwidths:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend(a1, "codecBandwidthForPayload:");
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", objc_msgSend(a1, "supportedCodecModesForBandwidth:payload:", v9, v7));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [a5 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(a5);
        }
        if (v9 != [*(id *)(*((void *)&v18 + 1) + 8 * i) integerValue]) {
          objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(a1, "supportedCodecModesForBandwidth:payload:"));
        }
      }
      uint64_t v12 = [a5 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v12);
  }
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCPayloadUtils allowedBitratesForPayload:supportedBitrates:supportedBandwidths:]();
      }
    }
    goto LABEL_19;
  }
  objc_msgSend(v10, "intersectSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", a4));
  v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "allObjects"), "sortedArrayUsingSelector:", sel_compare_), "copy");
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCPayloadUtils allowedBitratesForPayload:supportedBitrates:supportedBandwidths:]();
      }
    }
LABEL_19:
    v15 = 0;
  }

  return v15;
}

+ (int)codecRateModeForDesiredANBR:(unsigned int)a3 payload:(int)a4 supportedBitrates:(id)a5 supportedBandwidths:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v8 = (void *)[a1 allowedBitratesForPayload:*(void *)&a4 supportedBitrates:a5 supportedBandwidths:a6];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      +[VCPayloadUtils codecRateModeForDesiredANBR:payload:supportedBitrates:supportedBandwidths:]();
    }
    return 0;
  }
  uint64_t v9 = v8;
  v10 = (void *)[v8 objectAtIndex:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_4:
    uint64_t v14 = 0;
    v15 = v10;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v9);
      }
      v10 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      if ([v10 unsignedIntValue] > a3) {
        break;
      }
      ++v14;
      v15 = v10;
      if (v12 == v14)
      {
        uint64_t v12 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
        v15 = v10;
        if (v12) {
          goto LABEL_4;
        }
        return VCPayloadUtils_AudioCodecRateModeForBitrate(a4, [v15 unsignedIntValue]);
      }
    }
  }
  else
  {
    v15 = v10;
  }
  return VCPayloadUtils_AudioCodecRateModeForBitrate(a4, [v15 unsignedIntValue]);
}

+ (BOOL)isEVSCodecModeSupported:(int)a3 forBandwidth:(int)a4
{
  if (a3 < 9) {
    return 1;
  }
  switch(a4)
  {
    case 0:
      unsigned int v5 = a3 - 10;
      goto LABEL_9;
    case 1:
      BOOL v6 = (a3 - 10) >= 0xC;
      goto LABEL_10;
    case 2:
      BOOL v6 = (a3 - 13) >= 9;
      goto LABEL_10;
    case 3:
      unsigned int v5 = a3 - 15;
LABEL_9:
      BOOL v6 = v5 >= 7;
LABEL_10:
      BOOL result = !v6;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

+ (BOOL)isAMRCodecModeSupported:(int)a3 forBandwidth:(int)a4
{
  BOOL v4 = a3 < 8;
  if (a4) {
    BOOL v4 = 0;
  }
  if (a4 == 1) {
    return a3 < 9;
  }
  else {
    return v4;
  }
}

+ (BOOL)isCodecModeSupported:(int)a3 forBandwidth:(int)a4 withPayload:(int)a5
{
  if ((a5 - 97) > 0xE) {
    return 0;
  }
  int v5 = 1 << (a5 - 97);
  if ((v5 & 0x4C00) != 0) {
    return [a1 isEVSCodecModeSupported:*(void *)&a3 forBandwidth:*(void *)&a4];
  }
  if ((v5 & 3) != 0) {
    return [a1 isAMRCodecModeSupported:*(void *)&a3 forBandwidth:*(void *)&a4];
  }
  else {
    return 0;
  }
}

+ (BOOL)isEVSPayload:(int)a3
{
  return ((a3 - 107) < 5) & (0x13u >> (a3 - 107));
}

+ (BOOL)isOpus4Channel48KhzPayload:(int)a3 outFormat:(const AudioStreamBasicDescription *)a4
{
  return a3 == 119 && a4->mSampleRate == 48000.0 && a4->mChannelsPerFrame == 4;
}

+ (BOOL)isFormatAACELDNonSBR48KHzStereo:(const AudioStreamBasicDescription *)a3
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v3 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v3) {
        return v3;
      }
      +[VCPayloadUtils isFormatAACELDNonSBR48KHzStereo:]();
    }
LABEL_8:
    LOBYTE(v3) = 0;
    return v3;
  }
  if (a3->mFormatID != 1633772389 || (int)a3->mSampleRate != 48000) {
    goto LABEL_8;
  }
  LOBYTE(v3) = a3->mChannelsPerFrame == 2;
  return v3;
}

+ (BOOL)skipBandWidthCheckForCodecRateModes:(int)a3 supportedBitrates:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  LODWORD(v5) = [a1 isEVSPayload:*(void *)&a3];
  if (!v5) {
    return v5;
  }
  uint64_t v5 = [a4 count];
  if (!v5) {
    return v5;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (!v6)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(a4);
      }
      int v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) unsignedIntValue];
      if (v10 <= 24399)
      {
        if (v10 > 9599)
        {
          BOOL v11 = v10 == 9600 || v10 == 13200;
          int v12 = 16400;
        }
        else
        {
          BOOL v11 = v10 == 5900 || v10 == 7200;
          int v12 = 8000;
        }
        goto LABEL_23;
      }
      if (v10 <= 63999)
      {
        BOOL v11 = v10 == 24400 || v10 == 32000;
        int v12 = 48000;
LABEL_23:
        if (v11 || v10 == v12) {
          goto LABEL_39;
        }
        continue;
      }
      if (v10 == 64000 || v10 == 96000 || v10 == 128000)
      {
LABEL_39:
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    uint64_t v7 = [a4 countByEnumeratingWithState:&v18 objects:v17 count:16];
    LOBYTE(v5) = 1;
    if (v7) {
      continue;
    }
    return v5;
  }
}

+ (BOOL)shouldUseCookieForPayload:(int)a3
{
  return ((a3 - 101) < 0x13) & (0x40039u >> (a3 - 101));
}

+ (BOOL)canBundleExternallyForPayload:(int)a3 forBundlingScheme:(int)a4 operatingMode:(int)a5
{
  if (a4 != 2)
  {
    if (a4 == 1 && (a3 - 98) <= 0x15)
    {
      BOOL result = 1;
      if (((1 << (a3 - 98)) & 0x20C5C8) != 0) {
        return result;
      }
      if (a3 == 98) {
        return a5 == 6;
      }
    }
    return 0;
  }
  if ((a3 - 101) <= 5) {
    return (0x29u >> (a3 - 101)) & 1;
  }
  else {
    return 0;
  }
}

+ (unsigned)internalBundleFactorForPayload:(int)a3
{
  if ((a3 - 121) >= 2) {
    return 1;
  }
  else {
    return 3;
  }
}

+ (BOOL)shouldEnablePacketSizeLimitForAudioFormat:(AudioStreamBasicDescription *)a3
{
  if (a3)
  {
    if (a3->mFormatID == 1869641075
      || (BOOL v3 = +[VCPayloadUtils isFormatAACELDNonSBR48KHzStereo:](VCPayloadUtils, "isFormatAACELDNonSBR48KHzStereo:")))
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v3 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v3) {
        return v3;
      }
      +[VCPayloadUtils shouldEnablePacketSizeLimitForAudioFormat:]();
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (float)qualityForPayload:(int)a3 forBitrate:(unsigned int)a4
{
  switch(a3)
  {
    case 'a':
      BOOL v5 = a4 >> 5 > 0x176;
      float result = 0.5;
      float v6 = 0.0;
      goto LABEL_34;
    case 'b':
      float result = 0.5;
      if (a4 >> 6 < 0x7D) {
        return result;
      }
      float result = 0.75;
      if (a4 < 0x2EE1) {
        return result;
      }
      return 1.0;
    case 'e':
      float result = 0.5;
      if (a4 >> 4 < 0x753) {
        return result;
      }
      unsigned int v7 = 48001;
      goto LABEL_26;
    case 'h':
      float result = 0.5;
      if (a4 >> 5 < 0x271) {
        return result;
      }
      unsigned int v7 = 24001;
LABEL_26:
      if (a4 < v7) {
        return 0.66;
      }
      return 1.0;
    case 'j':
      float result = 0.5;
      if (a4 > 0x5DC0) {
        return result;
      }
      if (a4 > 0x4E20) {
        return 0.66;
      }
      if (a4 == 20000) {
        return 0.8;
      }
      return 1.0;
    case 'k':
    case 'l':
    case 'o':
      float result = 0.0;
      if (a4 >> 3 <= 0xC34)
      {
        if (a4 >> 5 <= 0x176)
        {
          if (a4 >> 3 <= 0x464)
          {
            BOOL v5 = a4 >> 6 > 0x7C;
            float result = 0.4;
            float v6 = 0.75;
LABEL_34:
            if (v5) {
              return v6;
            }
          }
          else
          {
            return 0.85;
          }
        }
        else
        {
          return 0.93;
        }
      }
      return result;
    case 'p':
    case 'q':
      float result = 0.0;
      if (a4 >> 3 <= 0xC34)
      {
        if (a4 >> 5 <= 0x176)
        {
          if (a4 >> 3 <= 0x464) {
            return flt_1E259DCB0[a4 >> 6 > 0x7C];
          }
          else {
            return 0.86;
          }
        }
        else
        {
          return 0.94;
        }
      }
      return result;
    case 'w':
      float result = 0.0;
      if (a4 >> 6 <= 0x176)
      {
        float result = 0.75;
        if (a4 >> 5 <= 0x270)
        {
          float result = 0.5;
          if (a4 <= 0x3E80)
          {
            float result = 0.33;
            if (a4 >> 5 <= 0x176) {
              return 0.0;
            }
          }
        }
      }
      return result;
    default:
      return 1.0;
  }
}

+ (int64_t)codecTypeForPayload:(int)a3
{
  return VCPayloadUtils_CodecTypeForPayload(a3);
}

+ (int)payloadForCodecType:(int64_t)a3
{
  int v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 > 99)
  {
    if (a3 <= 199)
    {
      switch(a3)
      {
        case 'd':
          return 123;
        case 'e':
          return 126;
        case 'f':
          return 100;
      }
    }
    else if (a3 > 300)
    {
      if (a3 == 301) {
        return 124;
      }
      if (a3 == 302) {
        return 125;
      }
    }
    else
    {
      if (a3 == 200) {
        return 109;
      }
      if (a3 == 300) {
        return 110;
      }
    }
LABEL_36:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      float v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        int v10 = "+[VCPayloadUtils payloadForCodecType:]";
        __int16 v11 = 1024;
        int v12 = 669;
        __int16 v13 = 1024;
        int v14 = v3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unsupported codec type %d", (uint8_t *)&v7, 0x22u);
      }
    }
    return 128;
  }
  else
  {
    int result = 0;
    switch(a3)
    {
      case 1:
        int result = 97;
        break;
      case 2:
        int result = 98;
        break;
      case 3:
        int result = 107;
        break;
      case 4:
        int result = 108;
        break;
      case 5:
        return result;
      case 6:
        int result = 8;
        break;
      case 7:
        int result = 106;
        break;
      case 8:
        int result = 104;
        break;
      case 9:
        int result = 13;
        break;
      case 10:
        int result = 117;
        break;
      case 11:
      case 12:
      case 19:
        int result = 119;
        break;
      case 13:
        int result = 99;
        break;
      case 14:
        int result = 122;
        break;
      case 15:
        int result = 121;
        break;
      case 16:
        int result = 101;
        break;
      case 17:
        int result = 111;
        break;
      case 18:
        int result = 112;
        break;
      case 20:
        int result = 113;
        break;
      default:
        goto LABEL_36;
    }
  }
  return result;
}

+ (unsigned)bitrateForCodecType:(int64_t)a3 mode:(int)a4
{
  unsigned int result = 24000;
  switch(a3)
  {
    case 1:
      unsigned int result = +[VCPayloadUtils bitrateForAMRCodecMode:*(void *)&a4];
      break;
    case 2:
      unsigned int result = +[VCPayloadUtils bitrateForAMRWBCodecMode:*(void *)&a4];
      break;
    case 3:
    case 4:
    case 17:
      unsigned int result = +[VCPayloadUtils bitrateForEVSCodecMode:*(void *)&a4];
      break;
    case 8:
    case 19:
      unsigned int result = 48000;
      break;
    case 11:
      if (VCDefaults_GetBoolValueForKey(@"useStandardsBasedOpusCodec", 0)) {
        unsigned int result = 48000;
      }
      else {
        unsigned int result = 32000;
      }
      break;
    case 12:
      return result;
    case 16:
      unsigned int result = 64000;
      break;
    default:
      unsigned int result = 0;
      break;
  }
  return result;
}

+ (BOOL)supportsCodecRateModesForCodecType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x12) & (0x2001Eu >> a3);
}

+ (BOOL)supportsCodecBandwidthUpdateForCodecType:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

+ (unsigned)bitrateForAMRCodecMode:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 < 8) {
    return dword_1E259DCD8[a3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    float v6 = *MEMORY[0x1E4F47A50];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    unsigned int result = 0;
    if (!v7) {
      return result;
    }
    int v8 = 136315906;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    __int16 v11 = "+[VCPayloadUtils bitrateForAMRCodecMode:]";
    __int16 v12 = 1024;
    int v13 = 742;
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unsupported mode %d", (uint8_t *)&v8, 0x22u);
  }
  return 0;
}

+ (unsigned)bitrateForAMRWBCodecMode:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 < 9) {
    return dword_1E259DCF8[a3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    float v6 = *MEMORY[0x1E4F47A50];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    unsigned int result = 0;
    if (!v7) {
      return result;
    }
    int v8 = 136315906;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    __int16 v11 = "+[VCPayloadUtils bitrateForAMRWBCodecMode:]";
    __int16 v12 = 1024;
    int v13 = 768;
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unsupported mode %d", (uint8_t *)&v8, 0x22u);
  }
  return 0;
}

+ (unsigned)bitrateForEVSCodecMode:(int)a3
{
  if ((a3 - 10) >= 0xC) {
    return +[VCPayloadUtils bitrateForAMRWBCodecMode:](VCPayloadUtils, "bitrateForAMRWBCodecMode:");
  }
  else {
    return dword_1E259DD1C[a3 - 10];
  }
}

+ (int64_t)ctAudioCodecTypeForMediaStreamCodec:(int64_t)a3
{
  if (a3 <= 2)
  {
    if (a3 == 1) {
      return 0;
    }
    if (a3 == 2) {
      return 1;
    }
  }
  else if ((unint64_t)(a3 - 3) < 2 || a3 == 17)
  {
    return 2;
  }
  return 5;
}

+ (int64_t)ctAudioCodecEVSBandwidthForAudioCodecBandwidth:(int)a3
{
  if (a3 >= 3) {
    return 3;
  }
  else {
    return a3;
  }
}

+ (int64_t)ctAudioCodecEVSBitrateForBitrate:(unsigned int)a3
{
  if ((int)a3 <= 24399)
  {
    signed int v3 = 9599;
    uint64_t v11 = 5;
    if (a3 != 16400) {
      uint64_t v11 = 0;
    }
    if (a3 == 13200) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = v11;
    }
    if (a3 == 9600) {
      int64_t v6 = 3;
    }
    else {
      int64_t v6 = v12;
    }
    int v7 = 7200;
    uint64_t v8 = 1;
    uint64_t v10 = 2;
    if (a3 != 8000) {
      uint64_t v10 = 0;
    }
  }
  else
  {
    signed int v3 = 63999;
    uint64_t v4 = 11;
    if (a3 != 128000) {
      uint64_t v4 = 0;
    }
    if (a3 == 96000) {
      uint64_t v5 = 10;
    }
    else {
      uint64_t v5 = v4;
    }
    if (a3 == 64000) {
      int64_t v6 = 9;
    }
    else {
      int64_t v6 = v5;
    }
    int v7 = 24400;
    uint64_t v8 = 6;
    uint64_t v9 = 8;
    if (a3 != 48000) {
      uint64_t v9 = 0;
    }
    if (a3 == 32000) {
      uint64_t v10 = 7;
    }
    else {
      uint64_t v10 = v9;
    }
  }
  if (a3 == v7) {
    int64_t v13 = v8;
  }
  else {
    int64_t v13 = v10;
  }
  if ((int)a3 <= v3) {
    return v13;
  }
  else {
    return v6;
  }
}

+ (int)vcAudioCodecBandwidthForAudioCodecBandwidth:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int)audioCodecBandwidthForVCAudioCodecBandwidth:(int)a3
{
  if ((a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (void)audioCodecTypeForPayload:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v4[6] = "+[VCPayloadUtils audioCodecTypeForPayload:]";
  OUTLINED_FUNCTION_3();
  LOWORD(v5) = 0;
  HIWORD(v5) = v0;
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v1, v2, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCPayloadUtils.m:%d: Unsupported payload type: %d", v3, *(const char **)v4, (unint64_t)"+[VCPayloadUtils audioCodecTypeForPayload:]" >> 16, 133, v5);
}

+ (void)codecSamplesPerFrameForPayload:blockSize:sampleRate:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "+[VCPayloadUtils codecSamplesPerFrameForPayload:blockSize:sampleRate:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported payload %d", v2, *(const char **)v3, (unint64_t)"+[VCPayloadUtils codecSamplesPerFrameForPayload:blockSize:sampleRate:]" >> 16, 200);
}

+ (void)allowedBitratesForPayload:supportedBitrates:supportedBandwidths:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate standardsBitrateSet", v2, v3, v4, v5, v6);
}

+ (void)allowedBitratesForPayload:supportedBitrates:supportedBandwidths:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate filteredAndSortedBitrates", v2, v3, v4, v5, v6);
}

+ (void)codecRateModeForDesiredANBR:payload:supportedBitrates:supportedBandwidths:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate primaryBitrates", v2, v3, v4, v5, v6);
}

+ (void)isFormatAACELDNonSBR48KHzStereo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio format cannot be nil", v2, v3, v4, v5, v6);
}

+ (void)shouldEnablePacketSizeLimitForAudioFormat:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio format cannot be nil", v2, v3, v4, v5, v6);
}

@end
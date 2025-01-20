@interface VCAudioTier
+ (BOOL)bundlingAppliedByCodecForPayload:(int)a3 mode:(int)a4;
+ (unsigned)redPayloadOverheadBytesWithNumPayloads:(unsigned int)a3;
+ (unsigned)totalAudioBitrateWithTierConfig:(const tagVCAudioTierConfig *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shortREDEnabled;
- (VCAudioPayloadConfig)payloadConfig;
- (VCAudioTier)initWithConfig:(const tagVCAudioTierConfig *)a3;
- (id)description;
- (id)dictionary;
- (unsigned)audioCodecBitrate;
- (unsigned)networkBitrate;
- (unsigned)packetsPerBundle;
- (unsigned)redMaxDelay20ms;
- (unsigned)redNumPayloads;
- (unsigned)redPayloadBitrate;
- (unsigned)redPayloadSize;
- (void)setShortREDEnabled:(BOOL)a3;
- (void)setUpAssignedPropertiesWithConfig:(const tagVCAudioTierConfig *)a3;
- (void)setUpCalculatedPropertiesWithConfig:(const tagVCAudioTierConfig *)a3;
@end

@implementation VCAudioTier

+ (BOOL)bundlingAppliedByCodecForPayload:(int)a3 mode:(int)a4
{
  BOOL v5 = !+[VCPayloadUtils canBundleExternallyForPayload:*(void *)&a3 forBundlingScheme:1 operatingMode:*(void *)&a4];
  return a3 != 13 && v5;
}

+ (unsigned)totalAudioBitrateWithTierConfig:(const tagVCAudioTierConfig *)a3
{
  unsigned int result = a3->var2;
  unsigned int var4 = a3->var4;
  if (var4)
  {
    unsigned int var6 = a3->var6;
    unsigned int v6 = result + result * var4;
    unsigned int v7 = result + var6 * var4;
    if (var6) {
      return v7;
    }
    else {
      return v6;
    }
  }
  return result;
}

+ (unsigned)redPayloadOverheadBytesWithNumPayloads:(unsigned int)a3
{
  if (a3) {
    return (4 * a3) | 1;
  }
  else {
    return 0;
  }
}

- (void)setUpAssignedPropertiesWithConfig:(const tagVCAudioTierConfig *)a3
{
  self->audioCodecBitrate = a3->var2;
  p_audioCodecBitrate = &self->audioCodecBitrate;
  self->packetsPerBundle = a3->var3;
  unsigned int var4 = a3->var4;
  self->redNumPayloads = var4;
  self->payloadConfig = (VCAudioPayloadConfig *)a3->var0;
  self->_headerSize = a3->var5;
  unsigned int var6 = a3->var6;
  p_unsigned int var6 = &a3->var6;
  self->_bundlingAppliedByCodec = *((unsigned char *)p_var6 - 20);
  BOOL v7 = var6 == 0;
  self->_isShortREDEnabled = var6 != 0;
  if (var4)
  {
    if (!v7) {
      p_audioCodecBitrate = p_var6;
    }
    self->_redPayloadBitrate = *p_audioCodecBitrate;
  }
}

- (void)setUpCalculatedPropertiesWithConfig:(const tagVCAudioTierConfig *)a3
{
  unsigned int v5 = +[VCAudioTier totalAudioBitrateWithTierConfig:](VCAudioTier, "totalAudioBitrateWithTierConfig:");
  unsigned int v6 = +[VCAudioTier redPayloadOverheadBytesWithNumPayloads:a3->var4];
  double v7 = (double)[a3->var0 inputSampleRate];
  unsigned int v8 = [a3->var0 samplesPerFrame];
  LODWORD(v9) = a3->var3;
  double v10 = v7 / (double)v8 / (double)v9;
  self->networkBitrate = v5
                       + vcvtpd_u64_f64(v10* ((double)(a3->var5 + [a3->var0 bundleHeaderBytes] + v6)* 8.0));
  double v11 = (double)v5 / v10 * 0.125;
  unsigned int v12 = vcvtad_u64_f64(v11);
  self->_payloadSize = v12;
  unsigned int redNumPayloads = self->redNumPayloads;
  if (redNumPayloads)
  {
    LODWORD(v11) = self->audioCodecBitrate;
    unsigned int v14 = vcvtpd_u64_f64((double)(v12 - vcvtpd_u64_f64((double)*(unint64_t *)&v11 / v10 * 0.125)) / (double)redNumPayloads);
  }
  else
  {
    unsigned int v14 = 0;
  }
  self->_redPayloadSize = v14;
  if (self->_bundlingAppliedByCodec) {
    unsigned int packetsPerBundle = [(VCAudioPayloadConfig *)self->payloadConfig internalBundleFactor];
  }
  else {
    unsigned int packetsPerBundle = self->packetsPerBundle;
  }
  self->redMaxDelay20ms = packetsPerBundle * redNumPayloads;
}

- (VCAudioTier)initWithConfig:(const tagVCAudioTierConfig *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)VCAudioTier;
    unsigned int v5 = [(VCAudioTier *)&v10 init];
    unsigned int v6 = v5;
    if (v5)
    {
      [(VCAudioTier *)v5 setUpAssignedPropertiesWithConfig:a3];
      [(VCAudioTier *)v6 setUpCalculatedPropertiesWithConfig:a3];
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      unint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioTier initWithConfig:](v8, v9);
      }
    }

    return 0;
  }
  return v6;
}

- (id)description
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)VCAudioTier;
  id v4 = [(VCAudioTier *)&v10 description];
  uint64_t v5 = [(VCAudioPayloadConfig *)self->payloadConfig payload];
  if (self->_bundlingAppliedByCodec)
  {
    uint64_t packetsPerBundle = [(VCAudioPayloadConfig *)self->payloadConfig internalBundleFactor];
    if (self->_bundlingAppliedByCodec) {
      double v7 = "*";
    }
    else {
      double v7 = "";
    }
  }
  else
  {
    uint64_t packetsPerBundle = self->packetsPerBundle;
    double v7 = "";
  }
  if (self->_isShortREDEnabled) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  return (id)[v3 stringWithFormat:@"{ %@ payload=%d bundle=%d%s audioCodecBitrate=%d redNumPayloads=%d redMaxDelay20ms=%d networkBitrate=%d packetSize=%d payloadSize=%d headerSize=%d redPayloadSize=%u shortREDEnabled=%s }", v4, v5, packetsPerBundle, v7, self->audioCodecBitrate, self->redNumPayloads, self->redMaxDelay20ms, self->networkBitrate, self->_payloadSize + self->_headerSize, self->_payloadSize, self->_headerSize, self->_redPayloadSize, v8];
}

- (id)dictionary
{
  v7[7] = *MEMORY[0x1E4F143B8];
  v6[0] = @"payload";
  v7[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCAudioPayloadConfig payload](self->payloadConfig, "payload"));
  v6[1] = @"bundle";
  v3 = NSNumber;
  if (self->_bundlingAppliedByCodec) {
    uint64_t packetsPerBundle = [(VCAudioPayloadConfig *)self->payloadConfig internalBundleFactor];
  }
  else {
    uint64_t packetsPerBundle = self->packetsPerBundle;
  }
  v7[1] = [v3 numberWithUnsignedInt:packetsPerBundle];
  v6[2] = @"audioCodecBitrate";
  v7[2] = [NSNumber numberWithUnsignedInt:self->audioCodecBitrate];
  v6[3] = @"redNumPayloads";
  v7[3] = [NSNumber numberWithUnsignedInt:self->redNumPayloads];
  v6[4] = @"redMaxDelay";
  v7[4] = [NSNumber numberWithUnsignedInt:self->redMaxDelay20ms];
  v6[5] = @"networkBitrate";
  v7[5] = [NSNumber numberWithUnsignedInt:self->networkBitrate];
  v6[6] = @"shortREDEnabled";
  v7[6] = [NSNumber numberWithBool:self->_isShortREDEnabled];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:7];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  unsigned int networkBitrate = self->networkBitrate;
  if (networkBitrate != [a3 networkBitrate]) {
    return 0;
  }
  unsigned int audioCodecBitrate = self->audioCodecBitrate;
  if (audioCodecBitrate != [a3 audioCodecBitrate]) {
    return 0;
  }
  unsigned int packetsPerBundle = self->packetsPerBundle;
  if (packetsPerBundle != [a3 packetsPerBundle]) {
    return 0;
  }
  unsigned int redNumPayloads = self->redNumPayloads;
  if (redNumPayloads != [a3 redNumPayloads]) {
    return 0;
  }
  int v9 = [(VCAudioPayloadConfig *)self->payloadConfig payload];
  return v9 == objc_msgSend((id)objc_msgSend(a3, "payloadConfig"), "payload");
}

- (unsigned)networkBitrate
{
  return self->networkBitrate;
}

- (unsigned)audioCodecBitrate
{
  return self->audioCodecBitrate;
}

- (unsigned)packetsPerBundle
{
  return self->packetsPerBundle;
}

- (unsigned)redNumPayloads
{
  return self->redNumPayloads;
}

- (unsigned)redMaxDelay20ms
{
  return self->redMaxDelay20ms;
}

- (VCAudioPayloadConfig)payloadConfig
{
  return self->payloadConfig;
}

- (unsigned)redPayloadSize
{
  return self->_redPayloadSize;
}

- (BOOL)shortREDEnabled
{
  return self->_isShortREDEnabled;
}

- (void)setShortREDEnabled:(BOOL)a3
{
  self->_isShortREDEnabled = a3;
}

- (unsigned)redPayloadBitrate
{
  return self->_redPayloadBitrate;
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCAudioTier initWithConfig:]";
  __int16 v6 = 1024;
  int v7 = 92;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Attempting to create an audio tier with a nil configuration reference.", (uint8_t *)&v2, 0x1Cu);
}

@end
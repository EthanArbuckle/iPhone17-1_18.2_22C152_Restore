@interface VCMediaNegotiatorAudioConfiguration
- (BOOL)allowAudioRecording;
- (BOOL)allowAudioSwitching;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSecondaryPayload:(int)a3;
- (BOOL)useSBR;
- (NSSet)audioPayloads;
- (VCMediaNegotiatorAudioConfiguration)initWithAllowAudioSwitching:(BOOL)a3 allowAudioRecording:(BOOL)a4 useSBR:(BOOL)a5 ssrc:(unsigned int)a6 audioUnitNumber:(unsigned int)a7;
- (VCMediaNegotiatorAudioConfiguration)initWithAllowAudioSwitching:(BOOL)a3 allowAudioRecording:(BOOL)a4 useSBR:(BOOL)a5 ssrc:(unsigned int)a6 audioUnitNumber:(unsigned int)a7 audioRuleCollection:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)audioUnitNumber;
- (void)addAudioPayload:(int)a3 isSecondary:(BOOL)a4;
- (void)dealloc;
- (void)setAllowAudioRecording:(BOOL)a3;
- (void)setAllowAudioSwitching:(BOOL)a3;
- (void)setAudioUnitNumber:(unsigned int)a3;
- (void)setUseSBR:(BOOL)a3;
@end

@implementation VCMediaNegotiatorAudioConfiguration

- (VCMediaNegotiatorAudioConfiguration)initWithAllowAudioSwitching:(BOOL)a3 allowAudioRecording:(BOOL)a4 useSBR:(BOOL)a5 ssrc:(unsigned int)a6 audioUnitNumber:(unsigned int)a7
{
  return [(VCMediaNegotiatorAudioConfiguration *)self initWithAllowAudioSwitching:a3 allowAudioRecording:a4 useSBR:a5 ssrc:*(void *)&a6 audioUnitNumber:*(void *)&a7 audioRuleCollection:0];
}

- (VCMediaNegotiatorAudioConfiguration)initWithAllowAudioSwitching:(BOOL)a3 allowAudioRecording:(BOOL)a4 useSBR:(BOOL)a5 ssrc:(unsigned int)a6 audioUnitNumber:(unsigned int)a7 audioRuleCollection:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VCMediaNegotiatorAudioConfiguration;
  v14 = [(VCMediaNegotiatorAudioConfiguration *)&v24 init];
  if (v14)
  {
    v14->_audioPayloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v14->_secondaryPayloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(VCMediaNegotiatorCommonConfiguration *)v14 setSsrc:v10];
    v14->_allowAudioSwitching = a3;
    v14->_allowAudioRecording = a4;
    v14->_useSBR = a5;
    v14->_audioUnitNumber = a7;
    if (a8)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = (id)[a8 rules];
      uint64_t v15 = [obj countByEnumeratingWithState:&v26 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v20 = [v19 payload];
            v21 = (void *)[a8 secondaryPayloads];
            -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v14, "addAudioPayload:isSecondary:", v20, objc_msgSend(v21, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "payload"))));
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v26 objects:v25 count:16];
        }
        while (v16);
      }
    }
  }
  return v14;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorAudioConfiguration;
  [(VCMediaNegotiatorAudioConfiguration *)&v3 dealloc];
}

- (void)addAudioPayload:(int)a3 isSecondary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (+[VCMediaNegotiationBlobAudioSettings isAudioPayloadSupported:](VCMediaNegotiationBlobAudioSettings, "isAudioPayloadSupported:"))
  {
    -[NSMutableSet addObject:](self->_audioPayloads, "addObject:", [NSNumber numberWithUnsignedInt:v5]);
    if (v4)
    {
      secondaryPayloads = self->_secondaryPayloads;
      uint64_t v8 = [NSNumber numberWithUnsignedInt:v5];
      [(NSMutableSet *)secondaryPayloads addObject:v8];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      uint64_t v12 = v9;
      __int16 v13 = 2080;
      v14 = "-[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:]";
      __int16 v15 = 1024;
      int v16 = 73;
      __int16 v17 = 1024;
      int v18 = v5;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Payload cannot be negotiated: %d", (uint8_t *)&v11, 0x22u);
    }
  }
}

- (BOOL)isSecondaryPayload:(int)a3
{
  secondaryPayloads = self->_secondaryPayloads;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  return [(NSMutableSet *)secondaryPayloads containsObject:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:", self->_allowAudioSwitching, self->_allowAudioRecording, self->_useSBR, -[VCMediaNegotiatorCommonConfiguration ssrc](self, "ssrc"), self->_audioUnitNumber);
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    audioPayloads = self->_audioPayloads;
    uint64_t v6 = [(NSMutableSet *)audioPayloads countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(audioPayloads);
          }
          uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) intValue];
          objc_msgSend(v4, "addAudioPayload:isSecondary:", v10, -[VCMediaNegotiatorAudioConfiguration isSecondaryPayload:](self, "isSecondaryPayload:", v10));
        }
        uint64_t v7 = [(NSMutableSet *)audioPayloads countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)VCMediaNegotiatorAudioConfiguration;
  unsigned int v5 = -[VCMediaNegotiatorCommonConfiguration isEqual:](&v20, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int allowAudioSwitching = self->_allowAudioSwitching,
          allowAudioSwitching == [a3 allowAudioSwitching])
      && (int allowAudioRecording = self->_allowAudioRecording,
          allowAudioRecording == [a3 allowAudioRecording])
      && (int useSBR = self->_useSBR, useSBR == [a3 useSBR])
      && (unsigned int audioUnitNumber = self->_audioUnitNumber, audioUnitNumber == [a3 audioUnitNumber])
      && (uint64_t v10 = [(NSMutableSet *)self->_audioPayloads count],
          v10 == objc_msgSend((id)objc_msgSend(a3, "audioPayloads"), "count")))
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      int v11 = (void *)[a3 audioPayloads];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
LABEL_10:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * v15);
          uint64_t v17 = [v16 intValue];
          unsigned int v5 = [(NSMutableSet *)self->_audioPayloads containsObject:v16];
          if (!v5) {
            break;
          }
          int v18 = [(VCMediaNegotiatorAudioConfiguration *)self isSecondaryPayload:v17];
          if (v18 != [a3 isSecondaryPayload:v17]) {
            goto LABEL_18;
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v21 count:16];
            LOBYTE(v5) = 1;
            if (v13) {
              goto LABEL_10;
            }
            return v5;
          }
        }
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
LABEL_18:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)allowAudioSwitching
{
  return self->_allowAudioSwitching;
}

- (void)setAllowAudioSwitching:(BOOL)a3
{
  self->_int allowAudioSwitching = a3;
}

- (BOOL)allowAudioRecording
{
  return self->_allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->_int allowAudioRecording = a3;
}

- (BOOL)useSBR
{
  return self->_useSBR;
}

- (void)setUseSBR:(BOOL)a3
{
  self->_int useSBR = a3;
}

- (unsigned)audioUnitNumber
{
  return self->_audioUnitNumber;
}

- (void)setAudioUnitNumber:(unsigned int)a3
{
  self->_unsigned int audioUnitNumber = a3;
}

- (NSSet)audioPayloads
{
  return &self->_audioPayloads->super;
}

@end
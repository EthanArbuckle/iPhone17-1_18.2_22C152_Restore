@interface VCAudioRuleCollection
+ (int)getForcedPayload;
- (BOOL)allowAudioRecording;
- (BOOL)allowAudioSwitching;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHigherAudioREDCutoverU1Enabled;
- (BOOL)isPayloadSupported:(int)a3;
- (NSArray)rules;
- (NSArray)secondaryPayloads;
- (VCAudioRuleCollection)init;
- (VCAudioRuleCollection)initWithPhoneContinuity:(BOOL)a3 allowAudioSwitching:(BOOL)a4 sbr:(BOOL)a5 aacBlockSize:(int)a6;
- (VCAudioRuleCollection)initWithPhoneContinuity:(BOOL)a3 allowAudioSwitching:(BOOL)a4 sbr:(BOOL)a5 aacBlockSize:(int)a6 isLowLatencyAudio:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPrimaryPayload:(int)a3 dtxPayload:(int)a4 redPayload:(int)a5 secondaryPayloads:(id)a6 allowAudioSwitching:(BOOL)a7 sbr:(BOOL)a8 aacBlockSize:(int)a9;
- (int)aacBlockSize;
- (void)addAudioPayload:(int)a3 isSecondary:(BOOL)a4 sbr:(BOOL)a5;
- (void)addAudioRule:(id)a3;
- (void)addAudioRules:(id)a3;
- (void)clearAudioRules;
- (void)dealloc;
- (void)setAacBlockSize:(int)a3;
- (void)setAllowAudioRecording:(BOOL)a3;
- (void)setAllowAudioSwitching:(BOOL)a3;
- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3;
- (void)setRules:(id)a3;
- (void)setupAudioRulesWithSBR:(BOOL)a3 isContinuity:(BOOL)a4;
@end

@implementation VCAudioRuleCollection

- (VCAudioRuleCollection)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCAudioRuleCollection;
  v2 = [(VCAudioRuleCollection *)&v4 init];
  if (v2)
  {
    v2->_rules = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_secondaryPayloads = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (VCAudioRuleCollection)initWithPhoneContinuity:(BOOL)a3 allowAudioSwitching:(BOOL)a4 sbr:(BOOL)a5 aacBlockSize:(int)a6
{
  BOOL v7 = a5;
  BOOL v9 = a3;
  v10 = [(VCAudioRuleCollection *)self init];
  v11 = v10;
  if (v10)
  {
    v10->_aacBlockSize = a6;
    v10->_allowAudioSwitching = a4;
    [(VCAudioRuleCollection *)v10 setupAudioRulesWithSBR:v7 isContinuity:v9];
  }
  return v11;
}

- (VCAudioRuleCollection)initWithPhoneContinuity:(BOOL)a3 allowAudioSwitching:(BOOL)a4 sbr:(BOOL)a5 aacBlockSize:(int)a6 isLowLatencyAudio:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a5;
  BOOL v9 = [(VCAudioRuleCollection *)self initWithPhoneContinuity:a3 allowAudioSwitching:a4 sbr:a5 aacBlockSize:*(void *)&a6];
  v10 = v9;
  if (v9 && v7) {
    [(VCAudioRuleCollection *)v9 addAudioPayload:101 isSecondary:0 sbr:v8];
  }
  return v10;
}

- (id)initPrimaryPayload:(int)a3 dtxPayload:(int)a4 redPayload:(int)a5 secondaryPayloads:(id)a6 allowAudioSwitching:(BOOL)a7 sbr:(BOOL)a8 aacBlockSize:(int)a9
{
  BOOL v9 = a8;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v15 = [(VCAudioRuleCollection *)self init];
  v16 = v15;
  if (v15)
  {
    v15->_aacBlockSize = a9;
    v15->_allowAudioSwitching = a7;
    [(VCAudioRuleCollection *)v15 addAudioPayload:v14 isSecondary:0 sbr:v9];
    if (v13 != 128) {
      [(VCAudioRuleCollection *)v16 addAudioPayload:v13 isSecondary:1 sbr:v9];
    }
    if (v12 != 128) {
      [(VCAudioRuleCollection *)v16 addAudioPayload:v12 isSecondary:1 sbr:0];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v17 = [a6 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(a6);
          }
          -[VCAudioRuleCollection addAudioPayload:isSecondary:sbr:](v16, "addAudioPayload:isSecondary:sbr:", [*(id *)(*((void *)&v23 + 1) + 8 * v20++) unsignedIntValue], 1, v9);
        }
        while (v18 != v20);
        uint64_t v18 = [a6 countByEnumeratingWithState:&v23 objects:v22 count:16];
      }
      while (v18);
    }
  }
  return v16;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioRuleCollection;
  [(VCAudioRuleCollection *)&v3 dealloc];
}

- (void)addAudioPayload:(int)a3 isSecondary:(BOOL)a4 sbr:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  BOOL v9 = [VCAudioRule alloc];
  uint64_t aacBlockSize = 0;
  if ((v7 - 101) <= 5 && ((1 << (v7 - 101)) & 0x39) != 0) {
    uint64_t aacBlockSize = self->_aacBlockSize;
  }
  BOOL v12 = (v7 == 101 || (v7 - 104) < 3) && v5;
  uint64_t v13 = [(VCAudioRule *)v9 initWithPayload:v7 isSecondary:v6 sbr:v12 samplesPerBlock:aacBlockSize];
  [(VCAudioRuleCollection *)self addAudioRule:v13];
}

- (void)setupAudioRulesWithSBR:(BOOL)a3 isContinuity:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v7 = +[VCAudioRuleCollection getForcedPayload];
  if (v7 == 128)
  {
    BOOL v8 = +[GKSConnectivitySettings supportsEVSCodec];
    BOOL v9 = +[GKSConnectivitySettings supportsRedAudio];
    BOOL v10 = v9;
    if (a4)
    {
      if (v8)
      {
        v11 = (void *)[&unk_1F3DC7158 arrayByAddingObject:&unk_1F3DC31E0];
        if (!v10) {
          goto LABEL_16;
        }
      }
      else
      {
        v11 = &unk_1F3DC7158;
        if (!v9) {
          goto LABEL_16;
        }
      }
    }
    else
    {
      if (v8) {
        v11 = (void *)[&unk_1F3DC7140 arrayByAddingObject:&unk_1F3DC31E0];
      }
      else {
        v11 = &unk_1F3DC7140;
      }
      if (!v10) {
        goto LABEL_16;
      }
    }
    v11 = (void *)[v11 arrayByAddingObject:&unk_1F3DC31F8];
LABEL_16:
    BOOL v12 = self->_allowAudioSwitching && v8;
    if (self->_allowAudioSwitching) {
      uint64_t v13 = &unk_1F3DC7170;
    }
    else {
      uint64_t v13 = 0;
    }
    if (v12) {
      uint64_t v13 = (void *)[&unk_1F3DC7170 arrayByAddingObject:&unk_1F3DC31E0];
    }
    if ([v11 count])
    {
      uint64_t v14 = 0;
      unsigned int v15 = 1;
      do
      {
        -[VCAudioRuleCollection addAudioPayload:isSecondary:sbr:](self, "addAudioPayload:isSecondary:sbr:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", v14), "unsignedIntValue"), objc_msgSend(v13, "containsObject:", objc_msgSend(v11, "objectAtIndexedSubscript:", v14)), v5);
        uint64_t v14 = v15;
      }
      while ([v11 count] > (unint64_t)v15++);
    }
    return;
  }
  uint64_t v17 = [[VCAudioRule alloc] initWithPayload:v7 isSecondary:0 sbr:v5 samplesPerBlock:self->_aacBlockSize];
  [(VCAudioRuleCollection *)self addAudioRule:v17];
}

+ (int)getForcedPayload
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = [+[VCDefaults sharedInstance] forceAudioPayload];
  int v3 = v2;
  if (v2 - 97 <= 0x1F)
  {
    if (((1 << (v2 - 97)) & 0x3418B93) != 0)
    {
LABEL_8:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        BOOL v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315906;
          uint64_t v11 = v5;
          __int16 v12 = 2080;
          uint64_t v13 = "+[VCAudioRuleCollection getForcedPayload]";
          __int16 v14 = 1024;
          int v15 = 225;
          __int16 v16 = 1024;
          int v17 = v3;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing audio payload: %d", (uint8_t *)&v10, 0x22u);
        }
      }
      return v3;
    }
    if (v2 == 128) {
      return v3;
    }
  }
  if (v2 <= 0xD && ((1 << v2) & 0x2201) != 0) {
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    BOOL v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      uint64_t v13 = "+[VCAudioRuleCollection getForcedPayload]";
      __int16 v14 = 1024;
      int v15 = 230;
      __int16 v16 = 1024;
      int v17 = v3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid payload (%d) for forceAudioPayload. Forcing PureVoice.", (uint8_t *)&v10, 0x22u);
    }
  }
  return 128;
}

- (void)setRules:(id)a3
{
  if (self->_rules != a3)
  {
    [(VCAudioRuleCollection *)self clearAudioRules];
    [(VCAudioRuleCollection *)self addAudioRules:a3];
  }
}

- (void)addAudioRule:(id)a3
{
  -[NSMutableArray addObject:](self->_rules, "addObject:");
  if ([a3 isSecondary])
  {
    secondaryPayloads = self->_secondaryPayloads;
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "payload"));
    [(NSMutableArray *)secondaryPayloads addObject:v6];
  }
}

- (void)addAudioRules:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        [(VCAudioRuleCollection *)self addAudioRule:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (void)clearAudioRules
{
  [(NSMutableArray *)self->_rules removeAllObjects];
  secondaryPayloads = self->_secondaryPayloads;

  [(NSMutableArray *)secondaryPayloads removeAllObjects];
}

- (BOOL)isPayloadSupported:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  rules = self->_rules;
  uint64_t v5 = [(NSMutableArray *)rules countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(rules);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v8) payload] == a3)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(NSMutableArray *)rules countByEnumeratingWithState:&v11 objects:v10 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    int allowAudioRecording = self->_allowAudioRecording;
    if (allowAudioRecording == [a3 allowAudioRecording]
      && (int allowAudioSwitching = self->_allowAudioSwitching,
          allowAudioSwitching == [a3 allowAudioSwitching])
      && (uint64_t v8 = -[NSMutableArray count](self->_rules, "count"), v8 == objc_msgSend((id)objc_msgSend(a3, "rules"), "count")))
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      rules = self->_rules;
      uint64_t v10 = [(NSMutableArray *)rules countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
LABEL_7:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(rules);
          }
          int v5 = objc_msgSend((id)objc_msgSend(a3, "rules"), "containsObject:", *(void *)(*((void *)&v16 + 1) + 8 * v13));
          if (!v5) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [(NSMutableArray *)rules countByEnumeratingWithState:&v16 objects:v15 count:16];
            LOBYTE(v5) = 1;
            if (v11) {
              goto LABEL_7;
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
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [+[VCAudioRuleCollection allocWithZone:a3] init];
  [(VCAudioRuleCollection *)v4 setAllowAudioRecording:self->_allowAudioRecording];
  [(VCAudioRuleCollection *)v4 setAllowAudioSwitching:self->_allowAudioSwitching];
  [(VCAudioRuleCollection *)v4 setAacBlockSize:self->_aacBlockSize];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  rules = self->_rules;
  uint64_t v6 = [(NSMutableArray *)rules countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(rules);
        }
        [(VCAudioRuleCollection *)v4 addAudioRule:*(void *)(*((void *)&v12 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)rules countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
  return v4;
}

- (NSArray)rules
{
  return &self->_rules->super;
}

- (NSArray)secondaryPayloads
{
  return &self->_secondaryPayloads->super;
}

- (BOOL)allowAudioRecording
{
  return self->_allowAudioRecording;
}

- (void)setAllowAudioRecording:(BOOL)a3
{
  self->_int allowAudioRecording = a3;
}

- (BOOL)allowAudioSwitching
{
  return self->_allowAudioSwitching;
}

- (void)setAllowAudioSwitching:(BOOL)a3
{
  self->_int allowAudioSwitching = a3;
}

- (int)aacBlockSize
{
  return self->_aacBlockSize;
}

- (void)setAacBlockSize:(int)a3
{
  self->_uint64_t aacBlockSize = a3;
}

- (BOOL)isHigherAudioREDCutoverU1Enabled
{
  return self->_isHigherAudioREDCutoverU1Enabled;
}

- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3
{
  self->_isHigherAudioREDCutoverU1Enabled = a3;
}

@end
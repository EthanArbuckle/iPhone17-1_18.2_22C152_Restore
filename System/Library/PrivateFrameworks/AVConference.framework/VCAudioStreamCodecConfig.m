@interface VCAudioStreamCodecConfig
- (BOOL)evsHeaderFullOnly;
- (BOOL)isComfortNoise;
- (BOOL)isDTMF;
- (BOOL)isDTXEnabled;
- (BOOL)isOctetAligned;
- (BOOL)isOpusInBandFecEnabled;
- (NSArray)supportedBandwidths;
- (NSArray)supportedModes;
- (VCAudioStreamCodecConfig)initWithCodecType:(int64_t)a3;
- (int)evsCMRMode;
- (int)preferredMode;
- (int64_t)codecType;
- (unint64_t)pTime;
- (unsigned)evsChannelAwareOffset;
- (unsigned)networkPayload;
- (void)dealloc;
- (void)setDtmf:(BOOL)a3;
- (void)setDtxEnabled:(BOOL)a3;
- (void)setEvsCMRMode:(int)a3;
- (void)setEvsChannelAwareOffset:(unsigned __int16)a3;
- (void)setEvsHeaderFullOnly:(BOOL)a3;
- (void)setIsOpusInBandFecEnabled:(BOOL)a3;
- (void)setNetworkPayload:(unsigned int)a3;
- (void)setOctetAligned:(BOOL)a3;
- (void)setPTime:(unint64_t)a3;
- (void)setPreferredMode:(int)a3;
- (void)setPreferredModeWithClientMode:(int)a3;
- (void)setSupportedBandwidths:(id)a3;
- (void)setSupportedModes:(id)a3;
- (void)setupAMRModesWithClientModeMask:(unsigned int)a3;
- (void)setupAMRWBModesWithClientModeMask:(unsigned int)a3;
- (void)setupCodecBandwidthsWithClientBandwidthMask:(unsigned int)a3;
- (void)setupEVSModesWithClientModeMask:(unsigned int)a3;
- (void)setupModesWithClientModeMask:(unsigned int)a3;
@end

@implementation VCAudioStreamCodecConfig

- (VCAudioStreamCodecConfig)initWithCodecType:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioStreamCodecConfig;
  v4 = [(VCAudioStreamCodecConfig *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_codecType = a3;
    v4->_supportedModes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_supportedBandwidths = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_networkPayload = 0xFFFF;
    v5->_pTime = 20;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamCodecConfig;
  [(VCAudioStreamCodecConfig *)&v3 dealloc];
}

- (unsigned)networkPayload
{
  if (self->_networkPayload == 0xFFFF) {
    return +[VCPayloadUtils payloadForCodecType:self->_codecType];
  }
  else {
    return self->_networkPayload;
  }
}

- (BOOL)isComfortNoise
{
  return self->_codecType == 9;
}

- (void)setupModesWithClientModeMask:(unsigned int)a3
{
  int64_t codecType = self->_codecType;
  if (codecType <= 2)
  {
    if (codecType == 1)
    {
      [(VCAudioStreamCodecConfig *)self setupAMRModesWithClientModeMask:*(void *)&a3];
    }
    else if (codecType == 2)
    {
      [(VCAudioStreamCodecConfig *)self setupAMRWBModesWithClientModeMask:*(void *)&a3];
    }
  }
  else if ((unint64_t)(codecType - 3) < 2 || codecType == 17)
  {
    [(VCAudioStreamCodecConfig *)self setupEVSModesWithClientModeMask:*(void *)&a3];
  }
}

- (void)setupCodecBandwidthsWithClientBandwidthMask:(unsigned int)a3
{
  char v3 = a3;
  int64_t codecType = self->_codecType;
  if (codecType == 4)
  {
    [(NSMutableArray *)self->_supportedBandwidths removeAllObjects];
    if (v3)
    {
      [(NSMutableArray *)self->_supportedBandwidths setObject:&unk_1F3DC2EB0 atIndexedSubscript:[(NSMutableArray *)self->_supportedBandwidths count]];
      if ((v3 & 2) == 0)
      {
LABEL_9:
        if ((v3 & 4) == 0) {
          return;
        }
LABEL_13:
        supportedBandwidths = self->_supportedBandwidths;
        uint64_t v7 = [(NSMutableArray *)supportedBandwidths count];
        uint64_t v8 = &unk_1F3DC2EE0;
        goto LABEL_14;
      }
    }
    else if ((v3 & 2) == 0)
    {
      goto LABEL_9;
    }
    [(NSMutableArray *)self->_supportedBandwidths setObject:&unk_1F3DC2EC8 atIndexedSubscript:[(NSMutableArray *)self->_supportedBandwidths count]];
    if ((v3 & 4) == 0) {
      return;
    }
    goto LABEL_13;
  }
  if (codecType == 3)
  {
    [(NSMutableArray *)self->_supportedBandwidths removeAllObjects];
    if (v3) {
      [(NSMutableArray *)self->_supportedBandwidths setObject:&unk_1F3DC2EB0 atIndexedSubscript:[(NSMutableArray *)self->_supportedBandwidths count]];
    }
    if ((v3 & 2) != 0)
    {
      supportedBandwidths = self->_supportedBandwidths;
      uint64_t v7 = [(NSMutableArray *)supportedBandwidths count];
      uint64_t v8 = &unk_1F3DC2EC8;
LABEL_14:
      [(NSMutableArray *)supportedBandwidths setObject:v8 atIndexedSubscript:v7];
    }
  }
}

- (void)setPreferredModeWithClientMode:(int)a3
{
  self->_preferredMode = a3;
}

- (void)setupAMRModesWithClientModeMask:(unsigned int)a3
{
  char v3 = a3;
  [(NSMutableArray *)self->_supportedModes removeAllObjects];
  if (v3)
  {
    [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2EB0 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2EC8 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2EE0 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2EF8 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2F10 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2F40 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
    if ((v3 & 0x80) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2F28 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 0x40) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((v3 & 0x80) == 0) {
    return;
  }
LABEL_17:
  supportedModes = self->_supportedModes;
  uint64_t v6 = [(NSMutableArray *)supportedModes count];

  [(NSMutableArray *)supportedModes setObject:&unk_1F3DC2F58 atIndexedSubscript:v6];
}

- (void)setupAMRWBModesWithClientModeMask:(unsigned int)a3
{
  __int16 v3 = a3;
  [(NSMutableArray *)self->_supportedModes removeAllObjects];
  if (v3)
  {
    [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2EB0 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2EC8 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2EE0 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2EF8 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2F10 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2F28 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2F58 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
    if ((v3 & 0x100) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_17:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2F40 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((v3 & 0x80) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((v3 & 0x100) == 0) {
    return;
  }
LABEL_19:
  supportedModes = self->_supportedModes;
  uint64_t v6 = [(NSMutableArray *)supportedModes count];

  [(NSMutableArray *)supportedModes setObject:&unk_1F3DC2F70 atIndexedSubscript:v6];
}

- (void)setupEVSModesWithClientModeMask:(unsigned int)a3
{
  -[VCAudioStreamCodecConfig setupAMRWBModesWithClientModeMask:](self, "setupAMRWBModesWithClientModeMask:");
  if ((a3 & 0x400) != 0)
  {
    [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2F88 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
    if ((a3 & 0x800) == 0)
    {
LABEL_3:
      if ((a3 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((a3 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2FA0 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((a3 & 0x1000) == 0)
  {
LABEL_4:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2FB8 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((a3 & 0x2000) == 0)
  {
LABEL_5:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2FD0 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((a3 & 0x4000) == 0)
  {
LABEL_6:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC2FE8 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((a3 & 0x8000) == 0)
  {
LABEL_7:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC3000 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((a3 & 0x10000) == 0)
  {
LABEL_8:
    if ((a3 & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC3018 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((a3 & 0x20000) == 0)
  {
LABEL_9:
    if ((a3 & 0x40000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC3030 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((a3 & 0x40000) == 0)
  {
LABEL_10:
    if ((a3 & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC3048 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((a3 & 0x80000) == 0)
  {
LABEL_11:
    if ((a3 & 0x100000) == 0) {
      goto LABEL_12;
    }
LABEL_24:
    [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC3078 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
    if ((a3 & 0x200000) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_23:
  [(NSMutableArray *)self->_supportedModes setObject:&unk_1F3DC3060 atIndexedSubscript:[(NSMutableArray *)self->_supportedModes count]];
  if ((a3 & 0x100000) != 0) {
    goto LABEL_24;
  }
LABEL_12:
  if ((a3 & 0x200000) == 0) {
    return;
  }
LABEL_25:
  supportedModes = self->_supportedModes;
  uint64_t v6 = [(NSMutableArray *)supportedModes count];

  [(NSMutableArray *)supportedModes setObject:&unk_1F3DC3090 atIndexedSubscript:v6];
}

- (int64_t)codecType
{
  return self->_codecType;
}

- (BOOL)isDTXEnabled
{
  return self->_dtxEnabled;
}

- (void)setDtxEnabled:(BOOL)a3
{
  self->_dtxEnabled = a3;
}

- (int)preferredMode
{
  return self->_preferredMode;
}

- (void)setPreferredMode:(int)a3
{
  self->_preferredMode = a3;
}

- (NSArray)supportedModes
{
  return &self->_supportedModes->super;
}

- (void)setSupportedModes:(id)a3
{
}

- (NSArray)supportedBandwidths
{
  return &self->_supportedBandwidths->super;
}

- (void)setSupportedBandwidths:(id)a3
{
}

- (BOOL)isOctetAligned
{
  return self->_octetAligned;
}

- (void)setOctetAligned:(BOOL)a3
{
  self->_octetAligned = a3;
}

- (BOOL)isDTMF
{
  return self->_dtmf;
}

- (void)setDtmf:(BOOL)a3
{
  self->_dtmf = a3;
}

- (void)setNetworkPayload:(unsigned int)a3
{
  self->_networkPayload = a3;
}

- (unsigned)evsChannelAwareOffset
{
  return self->_evsChannelAwareOffset;
}

- (void)setEvsChannelAwareOffset:(unsigned __int16)a3
{
  self->_evsChannelAwareOffset = a3;
}

- (BOOL)evsHeaderFullOnly
{
  return self->_evsHeaderFullOnly;
}

- (void)setEvsHeaderFullOnly:(BOOL)a3
{
  self->_evsHeaderFullOnly = a3;
}

- (unint64_t)pTime
{
  return self->_pTime;
}

- (void)setPTime:(unint64_t)a3
{
  self->_pTime = a3;
}

- (int)evsCMRMode
{
  return self->_evsCMRMode;
}

- (void)setEvsCMRMode:(int)a3
{
  self->_evsCMRMode = a3;
}

- (BOOL)isOpusInBandFecEnabled
{
  return self->_isOpusInBandFecEnabled;
}

- (void)setIsOpusInBandFecEnabled:(BOOL)a3
{
  self->_isOpusInBandFecEnabled = a3;
}

@end
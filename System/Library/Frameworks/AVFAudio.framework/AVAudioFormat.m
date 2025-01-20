@interface AVAudioFormat
+ (AVAudioFormat)formatWithInvalidSampleRateAndChannelCount;
+ (BOOL)supportsSecureCoding;
+ (id)settingsFromASBD:(const AudioStreamBasicDescription *)a3 channelLayout:(id)a4;
- (AVAudioChannelCount)channelCount;
- (AVAudioChannelLayout)channelLayout;
- (AVAudioCommonFormat)commonFormat;
- (AVAudioFormat)initStandardFormatWithSampleRate:(double)sampleRate channelLayout:(AVAudioChannelLayout *)layout;
- (AVAudioFormat)initStandardFormatWithSampleRate:(double)sampleRate channels:(AVAudioChannelCount)channels;
- (AVAudioFormat)initWithCMAudioFormatDescription:(CMAudioFormatDescriptionRef)formatDescription;
- (AVAudioFormat)initWithCoder:(id)a3;
- (AVAudioFormat)initWithCommonFormat:(AVAudioCommonFormat)format sampleRate:(double)sampleRate channels:(AVAudioChannelCount)channels interleaved:(BOOL)interleaved;
- (AVAudioFormat)initWithCommonFormat:(AVAudioCommonFormat)format sampleRate:(double)sampleRate interleaved:(BOOL)interleaved channelLayout:(AVAudioChannelLayout *)layout;
- (AVAudioFormat)initWithSettings:(NSDictionary *)settings;
- (AVAudioFormat)initWithStreamDescription:(const AudioStreamBasicDescription *)asbd;
- (AVAudioFormat)initWithStreamDescription:(const AudioStreamBasicDescription *)asbd channelLayout:(AVAudioChannelLayout *)layout;
- (BOOL)isEqual:(id)object;
- (BOOL)isInterleaved;
- (BOOL)isStandard;
- (CMAudioFormatDescriptionRef)formatDescription;
- (NSData)magicCookie;
- (NSDictionary)settings;
- (const)streamDescription;
- (double)sampleRate;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMagicCookie:(NSData *)magicCookie;
@end

@implementation AVAudioFormat

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5 = [(AVAudioFormat *)self streamDescription];
  [a3 encodeDouble:@"mSampleRate" forKey:v5->mSampleRate];
  [a3 encodeInteger:v5->mFormatID forKey:@"mFormatID"];
  [a3 encodeInteger:v5->mFormatFlags forKey:@"mFormatFlags"];
  [a3 encodeInteger:v5->mBytesPerPacket forKey:@"mBytesPerPacket"];
  [a3 encodeInteger:v5->mFramesPerPacket forKey:@"mFramesPerPacket"];
  [a3 encodeInteger:v5->mBytesPerFrame forKey:@"mBytesPerFrame"];
  [a3 encodeInteger:v5->mChannelsPerFrame forKey:@"mChannelsPerFrame"];
  [a3 encodeInteger:v5->mBitsPerChannel forKey:@"mBitsPerChannel"];
  objc_msgSend(a3, "encodeObject:forKey:", -[AVAudioFormat channelLayout](self, "channelLayout"), @"channelLayout");
  v6 = [(AVAudioFormat *)self magicCookie];

  [a3 encodeObject:v6 forKey:@"magicCookie"];
}

- (const)streamDescription
{
  return &self->_asbd;
}

- (NSData)magicCookie
{
  reserved = self->_reserved;
  if (reserved) {
    return (NSData *)*((void *)reserved + 1);
  }
  else {
    return 0;
  }
}

- (AVAudioChannelLayout)channelLayout
{
  return self->_layout;
}

- (void)dealloc
{
  reserved = (id *)self->_reserved;
  if (reserved)
  {

    MEMORY[0x19F3ABB30](reserved, 0x80C40803F642BLL);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAudioFormat;
  [(AVAudioFormat *)&v4 dealloc];
}

- (AVAudioFormat)initWithCommonFormat:(AVAudioCommonFormat)format sampleRate:(double)sampleRate channels:(AVAudioChannelCount)channels interleaved:(BOOL)interleaved
{
  if (channels < 3)
  {
    BOOL v7 = interleaved;
    v17.receiver = self;
    v17.super_class = (Class)AVAudioFormat;
    v6 = [(AVAudioFormat *)&v17 init];
    if (v6)
    {
      if (format - 1 > 3) {
        int v11 = 0;
      }
      else {
        int v11 = dword_19D8B1E70[format - 1];
      }
      CAStreamBasicDescription::CAStreamBasicDescription((uint64_t)v15, channels, v11, v7, sampleRate);
      long long v12 = v15[0];
      uint64_t v13 = v16;
      *(_OWORD *)(v6 + 24) = v15[1];
      *(_OWORD *)(v6 + 8) = v12;
      *((void *)v6 + 5) = v13;
      *((void *)v6 + 6) = 0;
      *((void *)v6 + 7) = format;
      *((void *)v6 + 8) = 0;
    }
  }
  else
  {

    return 0;
  }
  return (AVAudioFormat *)v6;
}

- (AVAudioFormat)initWithSettings:(NSDictionary *)settings
{
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [(NSDictionary *)settings objectForKey:@"AVFormatIDKey"];
  if (v5)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_30;
    }
    int v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    int v7 = 1819304813;
  }
  LODWORD(v31) = v7;
  id v8 = [(NSDictionary *)settings objectForKey:@"AVSampleRateKey"];
  if (v8)
  {
    v9 = v8;
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_30;
    }
    [v9 doubleValue];
    uint64_t v11 = 0x40BF400000000000;
    if (v10 >= 8000.0)
    {
      uint64_t v11 = *(void *)&v10;
      if (v10 > 192000.0) {
        uint64_t v11 = 0x4107700000000000;
      }
    }
  }
  else
  {
    uint64_t v11 = qword_19D8B1DA0[v7 == 1768710755];
  }
  uint64_t v30 = v11;
  id v12 = [(NSDictionary *)settings objectForKey:@"AVNumberOfChannelsKey"];
  if (!v12)
  {
    int v15 = 1;
    goto LABEL_17;
  }
  uint64_t v13 = v12;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_30:

    return 0;
  }
  unsigned int v14 = [v13 unsignedIntegerValue];
  if (v14 <= 1) {
    int v15 = 1;
  }
  else {
    int v15 = v14;
  }
LABEL_17:
  DWORD1(v32) = v15;
  if (v7 == 1819304813)
  {
    int v16 = 8;
    DWORD1(v31) = 8;
    id v17 = [(NSDictionary *)settings objectForKey:@"AVLinearPCMIsBigEndianKey"];
    if (v17)
    {
      v18 = v17;
      if (objc_opt_respondsToSelector())
      {
        if ([v18 unsignedIntegerValue]) {
          int v16 = 10;
        }
        else {
          int v16 = 8;
        }
      }
    }
    id v19 = [(NSDictionary *)settings objectForKey:@"AVLinearPCMIsFloatKey"];
    if (v19)
    {
      v20 = v19;
      if (objc_opt_respondsToSelector())
      {
        if ([v20 unsignedIntegerValue])
        {
          v16 |= 1u;
          unsigned int v21 = 32;
          DWORD2(v32) = 32;
          goto LABEL_34;
        }
      }
    }
    id v22 = [(NSDictionary *)settings objectForKey:@"AVLinearPCMBitDepthKey"];
    if (v22)
    {
      v23 = v22;
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_30;
      }
      unsigned int v21 = ([v23 unsignedIntegerValue] + 7) & 0xFFFFFFF8;
      DWORD2(v32) = v21;
      if (v21 - 33 < 0xFFFFFFE0) {
        goto LABEL_30;
      }
      if (v21 == 8)
      {
LABEL_34:
        unsigned int v25 = v21 >> 3;
        id v26 = [(NSDictionary *)settings objectForKey:@"AVLinearPCMIsNonInterleaved"];
        if (v26
          && (v27 = v26, (objc_opt_respondsToSelector() & 1) != 0)
          && [v27 unsignedIntegerValue])
        {
          DWORD1(v31) = v16 | 0x20;
        }
        else
        {
          DWORD1(v31) = v16;
          v25 *= v15;
        }
        *((void *)&v31 + 1) = v25 | 0x100000000;
        LODWORD(v32) = v25;
        goto LABEL_40;
      }
    }
    else
    {
      unsigned int v21 = 16;
      DWORD2(v32) = 16;
    }
    v16 |= 4u;
    goto LABEL_34;
  }
LABEL_40:
  id v28 = [(NSDictionary *)settings objectForKey:@"AVChannelLayoutKey"];
  if (v28) {
    v29 = -[AVAudioChannelLayout initWithLayout:]([AVAudioChannelLayout alloc], "initWithLayout:", [v28 bytes]);
  }
  else {
    v29 = 0;
  }
  return [(AVAudioFormat *)self initWithStreamDescription:&v30 channelLayout:v29];
}

- (AVAudioFormat)initWithCoder:(id)a3
{
  [a3 decodeDoubleForKey:@"mSampleRate"];
  uint64_t v11 = v5;
  int v12 = [a3 decodeIntegerForKey:@"mFormatID"];
  int v13 = [a3 decodeIntegerForKey:@"mFormatFlags"];
  int v14 = [a3 decodeIntegerForKey:@"mBytesPerPacket"];
  int v15 = [a3 decodeIntegerForKey:@"mFramesPerPacket"];
  int v16 = [a3 decodeIntegerForKey:@"mBytesPerFrame"];
  int v17 = [a3 decodeIntegerForKey:@"mChannelsPerFrame"];
  uint64_t v18 = [a3 decodeIntegerForKey:@"mBitsPerChannel"];
  uint64_t v6 = [a3 decodeObjectOfClass:self forKey:@"channelLayout"];
  uint64_t v7 = [a3 decodeObjectOfClass:self forKey:@"magicCookie"];
  id v8 = [(AVAudioFormat *)self initWithStreamDescription:&v11 channelLayout:v6];
  v9 = v8;
  if (v7) {
    [(AVAudioFormat *)v8 setMagicCookie:v7];
  }
  return v9;
}

- (AVAudioFormat)initWithStreamDescription:(const AudioStreamBasicDescription *)asbd channelLayout:(AVAudioChannelLayout *)layout
{
  if (layout)
  {
    if ([(AVAudioChannelLayout *)layout channelCount] == asbd->mChannelsPerFrame) {
      goto LABEL_3;
    }
LABEL_8:

    return 0;
  }
  if (asbd->mChannelsPerFrame > 2) {
    goto LABEL_8;
  }
LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)AVAudioFormat;
  uint64_t v7 = [(AVAudioFormat *)&v17 init];
  id v8 = (AVAudioFormat *)v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)&asbd->mBytesPerPacket;
    v15[0] = *(_OWORD *)&asbd->mSampleRate;
    v15[1] = v9;
    uint64_t v16 = *(void *)&asbd->mBitsPerChannel;
    uint64_t v10 = v16;
    *(_OWORD *)(v7 + 8) = v15[0];
    *((void *)v7 + 5) = v10;
    *(_OWORD *)(v7 + 24) = v9;
    int v14 = 0;
    if (CAStreamBasicDescription::IdentifyCommonPCMFormat(v15, &v14) && (v14 - 1) <= 4) {
      unint64_t v11 = qword_19D8B1F40[v14 - 1];
    }
    else {
      unint64_t v11 = 0;
    }
    v8->_layout = layout;
    v8->_commonFormat = v11;
    int v12 = layout;
    v8->_reserved = 0;
  }
  return v8;
}

- (id)description
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int16x8_t v3 = *(int16x8_t *)&self->_asbd.mBytesPerPacket;
  *(_OWORD *)&v5.var0 = *(_OWORD *)&self->_asbd.mSampleRate;
  *(int16x8_t *)&v5.var3 = v3;
  *(void *)&v5.var7 = *(void *)&self->_asbd.mBitsPerChannel;
  CAStreamBasicDescription::AsString(&v5, v6, 0x80uLL, v5.var0, v3);
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<AVAudioFormat %p: %s>", self, v6);
}

- (void)setMagicCookie:(NSData *)magicCookie
{
  reserved = (NSData *)self->_reserved;
  if (reserved)
  {
    AVAudioFormatImpl::setMagicCookie(reserved, magicCookie);
  }
  else if (magicCookie)
  {
    operator new();
  }
}

- (NSDictionary)settings
{
  return (NSDictionary *)+[AVAudioFormat settingsFromASBD:&self->_asbd channelLayout:self->_layout];
}

- (BOOL)isInterleaved
{
  return (self->_asbd.mFormatFlags & 0x20) == 0;
}

- (double)sampleRate
{
  return self->_asbd.mSampleRate;
}

- (AVAudioChannelCount)channelCount
{
  return self->_asbd.mChannelsPerFrame;
}

- (AVAudioCommonFormat)commonFormat
{
  return self->_commonFormat;
}

- (BOOL)isStandard
{
  if (self->_commonFormat == 1) {
    return (LOBYTE(self->_asbd.mFormatFlags) >> 5) & 1;
  }
  else {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (unint64_t)hash
{
  AudioFormatID v2 = self->_asbd.mFormatID - (int)self->_asbd.mSampleRate + 32 * (int)self->_asbd.mSampleRate;
  UInt32 v3 = self->_asbd.mBytesPerFrame - v2 + 32 * v2;
  UInt32 v4 = self->_asbd.mFramesPerPacket - v3 + 32 * v3;
  UInt32 v5 = self->_asbd.mChannelsPerFrame - v4 + 32 * v4;
  return (int)(self->_asbd.mBitsPerChannel - v5 + 32 * v5 + 887503681);
}

- (BOOL)isEqual:(id)object
{
  if (object == self)
  {
    LOBYTE(v12) = 1;
    return v12;
  }
  uint64_t v19 = v6;
  uint64_t v20 = v5;
  uint64_t v21 = v4;
  uint64_t v22 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_asbd.mSampleRate != *((double *)object + 1)
    || self->_asbd.mFormatID != *((_DWORD *)object + 4)
    || self->_asbd.mBytesPerPacket != *((_DWORD *)object + 6)
    || self->_asbd.mFramesPerPacket != *((_DWORD *)object + 7)
    || self->_asbd.mChannelsPerFrame != *((_DWORD *)object + 9)
    || self->_asbd.mBitsPerChannel != *((_DWORD *)object + 10))
  {
    LOBYTE(v12) = 0;
    return v12;
  }
  BOOL v11 = CA::Implementation::EquivalentFormatFlags((CA::Implementation *)&self->_asbd, (const AudioStreamBasicDescription *)((char *)object + 8), 0, 0);
  LOBYTE(v12) = 0;
  if (v11)
  {
    int v13 = (NSData *)[object magicCookie];
    int v14 = v13;
    if ([(AVAudioFormat *)self magicCookie]) {
      int v14 = [(AVAudioFormat *)self magicCookie];
    }
    if (![(AVAudioFormat *)self magicCookie]) {
      int v13 = [(AVAudioFormat *)self magicCookie];
    }
    if (!v14 || (int v12 = [(NSData *)v14 isEqual:v13]) != 0)
    {
      uint64_t v15 = [object channelLayout];
      layout = self->_layout;
      if ((v15 != 0) != (layout != 0))
      {
        if (layout) {
          objc_super v17 = self->_layout;
        }
        else {
          objc_super v17 = (AVAudioChannelLayout *)v15;
        }
        if ([(AVAudioChannelLayout *)v17 layoutTag] != 6553601)
        {
          LOBYTE(v12) = [(AVAudioChannelLayout *)v17 layoutTag] == 6619138;
          return v12;
        }
LABEL_27:
        LOBYTE(v12) = 1;
        return v12;
      }
      if (!layout) {
        goto LABEL_27;
      }
      int v12 = -[AVAudioChannelLayout isEqual:](layout, "isEqual:");
      if (v12) {
        goto LABEL_27;
      }
    }
  }
  return v12;
}

- (CMAudioFormatDescriptionRef)formatDescription
{
  CFTypeRef arg = 0;
  uint64_t v3 = [(AVAudioFormat *)self streamDescription];
  uint64_t v4 = [(AVAudioChannelLayout *)[(AVAudioFormat *)self channelLayout] layout];
  uint64_t v5 = [(AVAudioFormat *)self magicCookie];
  uint64_t v6 = v5;
  if (!v4)
  {
    uint64_t v7 = 0;
    if (v5) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  if (!v4->mChannelLayoutTag)
  {
    uint64_t v7 = 20 * v4->mNumberChannelDescriptions + 12;
    if (v5) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  uint64_t v7 = 12;
  if (!v5) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v8 = [(NSData *)v5 length];
  uint64_t v6 = [(NSData *)v6 bytes];
LABEL_9:
  long long v9 = sCMAudioFormatDescriptionCreate;
  if (sCMAudioFormatDescriptionCreate) {
    goto LABEL_13;
  }
  if (sLoadCoreMediaOnce != -1) {
    dispatch_once(&sLoadCoreMediaOnce, &__block_literal_global_6093);
  }
  long long v9 = sCMAudioFormatDescriptionCreate;
  if (sCMAudioFormatDescriptionCreate)
  {
LABEL_13:
    uint64_t v10 = ((uint64_t (*)(void, const AudioStreamBasicDescription *, uint64_t, const AudioChannelLayout *, uint64_t, NSData *, void, CFTypeRef *))v9)(*MEMORY[0x1E4F1CF80], v3, v7, v4, v8, v6, 0, &arg);
    if (v10) {
      NSLog(&cfstr_CannotConvertT.isa, v10);
    }
  }
  CMAudioFormatDescriptionRef result = (CMAudioFormatDescriptionRef)arg;
  if (arg) {
    return (CMAudioFormatDescriptionRef)CFAutorelease(arg);
  }
  return result;
}

- (AVAudioFormat)initWithCMAudioFormatDescription:(CMAudioFormatDescriptionRef)formatDescription
{
  if (!formatDescription)
  {

    return 0;
  }
  uint64_t v17 = 0;
  uint64_t v5 = (uint64_t (*)(CMAudioFormatDescriptionRef, SEL))sCMAudioFormatDescriptionGetStreamBasicDescription;
  if (sCMAudioFormatDescriptionGetStreamBasicDescription) {
    goto LABEL_6;
  }
  if (sLoadCoreMediaOnce != -1) {
    dispatch_once(&sLoadCoreMediaOnce, &__block_literal_global_6093);
  }
  uint64_t v5 = (uint64_t (*)(CMAudioFormatDescriptionRef, SEL))sCMAudioFormatDescriptionGetStreamBasicDescription;
  if (sCMAudioFormatDescriptionGetStreamBasicDescription) {
LABEL_6:
  }
    uint64_t v6 = v5(formatDescription, a2);
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = (uint64_t (*)(CMAudioFormatDescriptionRef, uint64_t *))sCMAudioFormatDescriptionGetChannelLayout;
  if (sCMAudioFormatDescriptionGetChannelLayout) {
    goto LABEL_11;
  }
  if (sLoadCoreMediaOnce != -1) {
    dispatch_once(&sLoadCoreMediaOnce, &__block_literal_global_6093);
  }
  uint64_t v7 = (uint64_t (*)(CMAudioFormatDescriptionRef, uint64_t *))sCMAudioFormatDescriptionGetChannelLayout;
  if (sCMAudioFormatDescriptionGetChannelLayout) {
LABEL_11:
  }
    uint64_t v8 = v7(formatDescription, &v17);
  else {
    uint64_t v8 = 0;
  }
  uint64_t v16 = 0;
  long long v9 = &AudioDataAnalysisManagerLibraryLoader(void)::libSym;
  uint64_t v10 = (uint64_t (*)(CMAudioFormatDescriptionRef, uint64_t *))sCMAudioFormatDescriptionGetMagicCookie;
  if (sCMAudioFormatDescriptionGetMagicCookie) {
    goto LABEL_16;
  }
  if (sLoadCoreMediaOnce != -1)
  {
    dispatch_once(&sLoadCoreMediaOnce, &__block_literal_global_6093);
    long long v9 = &AudioDataAnalysisManagerLibraryLoader(void)::libSym;
  }
  uint64_t v10 = (uint64_t (*)(CMAudioFormatDescriptionRef, uint64_t *))v9[35];
  if (v10)
  {
LABEL_16:
    uint64_t v11 = v10(formatDescription, &v16);
    if (v6) {
      goto LABEL_17;
    }
    return 0;
  }
  uint64_t v11 = 0;
  if (!v6) {
    return 0;
  }
LABEL_17:
  if (v17 && v8) {
    int v12 = [(AVAudioFormat *)self initWithStreamDescription:v6 channelLayout:+[AVAudioChannelLayout layoutWithLayout:v8]];
  }
  else {
    int v12 = -[AVAudioFormat initWithStreamDescription:](self, "initWithStreamDescription:", v6, v16);
  }
  int v13 = v12;
  if (v11 && v16)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    -[AVAudioFormat setMagicCookie:](v13, "setMagicCookie:", (id)[v14 initWithBytes:v11 length:v16]);
  }
  return v13;
}

- (AVAudioFormat)initWithCommonFormat:(AVAudioCommonFormat)format sampleRate:(double)sampleRate interleaved:(BOOL)interleaved channelLayout:(AVAudioChannelLayout *)layout
{
  if (layout)
  {
    BOOL v7 = interleaved;
    v19.receiver = self;
    v19.super_class = (Class)AVAudioFormat;
    uint64_t v10 = [(AVAudioFormat *)&v19 init];
    if (v10)
    {
      int v11 = [(AVAudioChannelLayout *)layout channelCount];
      if (format - 1 > 3) {
        int v12 = 0;
      }
      else {
        int v12 = dword_19D8B1E70[format - 1];
      }
      CAStreamBasicDescription::CAStreamBasicDescription((uint64_t)v17, v11, v12, v7, sampleRate);
      long long v13 = v17[0];
      uint64_t v14 = v18;
      *(_OWORD *)(v10 + 24) = v17[1];
      *(_OWORD *)(v10 + 8) = v13;
      *((void *)v10 + 6) = layout;
      *((void *)v10 + 7) = format;
      *((void *)v10 + 5) = v14;
      uint64_t v15 = layout;
      *((void *)v10 + 8) = 0;
    }
  }
  else
  {

    return 0;
  }
  return (AVAudioFormat *)v10;
}

- (AVAudioFormat)initStandardFormatWithSampleRate:(double)sampleRate channelLayout:(AVAudioChannelLayout *)layout
{
  if (layout)
  {
    v10.receiver = self;
    v10.super_class = (Class)AVAudioFormat;
    uint64_t v6 = [(AVAudioFormat *)&v10 init];
    if (v6)
    {
      AVAudioChannelCount v7 = [(AVAudioChannelLayout *)layout channelCount];
      v6->_asbd.mSampleRate = sampleRate;
      *(_OWORD *)&v6->_asbd.mFormatID = xmmword_19D8B1DB0;
      v6->_asbd.mBytesPerFrame = 4;
      v6->_asbd.mChannelsPerFrame = v7;
      *(void *)&v6->_asbd.mBitsPerChannel = 32;
      v6->_layout = layout;
      v6->_commonFormat = 1;
      uint64_t v8 = layout;
      v6->_reserved = 0;
    }
  }
  else
  {

    return 0;
  }
  return v6;
}

- (AVAudioFormat)initStandardFormatWithSampleRate:(double)sampleRate channels:(AVAudioChannelCount)channels
{
  if (channels < 3)
  {
    v7.receiver = self;
    v7.super_class = (Class)AVAudioFormat;
    CMAudioFormatDescriptionRef result = [(AVAudioFormat *)&v7 init];
    if (result)
    {
      result->_asbd.mSampleRate = sampleRate;
      *(_OWORD *)&result->_asbd.mFormatID = xmmword_19D8B1DB0;
      result->_asbd.mBytesPerFrame = 4;
      result->_asbd.mChannelsPerFrame = channels;
      *(void *)&result->_asbd.mBitsPerChannel = 32;
      result->_layout = 0;
      result->_commonFormat = 1;
      result->_reserved = 0;
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (AVAudioFormat)initWithStreamDescription:(const AudioStreamBasicDescription *)asbd
{
  return [(AVAudioFormat *)self initWithStreamDescription:asbd channelLayout:0];
}

+ (id)settingsFromASBD:(const AudioStreamBasicDescription *)a3 channelLayout:(id)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3->mFormatID), @"AVFormatIDKey");
  objc_msgSend(v6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a3->mSampleRate), @"AVSampleRateKey");
  objc_msgSend(v6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3->mChannelsPerFrame), @"AVNumberOfChannelsKey");
  uint64_t v7 = [a4 layoutSize];
  if (v7) {
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(a4, "layout"), v7), @"AVChannelLayoutKey");
  }
  if (a3->mFormatID == 1819304813)
  {
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3->mBitsPerChannel), @"AVLinearPCMBitDepthKey");
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3->mFormatFlags & 1), @"AVLinearPCMIsFloatKey");
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", ((unint64_t)a3->mFormatFlags >> 1) & 1), @"AVLinearPCMIsBigEndianKey");
    objc_msgSend(v6, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", ((unint64_t)a3->mFormatFlags >> 5) & 1), @"AVLinearPCMIsNonInterleaved");
  }
  return v6;
}

+ (AVAudioFormat)formatWithInvalidSampleRateAndChannelCount
{
  AudioFormatID v2 = [[AVAudioFormat alloc] initStandardFormatWithSampleRate:0 channels:0.0];

  return v2;
}

@end
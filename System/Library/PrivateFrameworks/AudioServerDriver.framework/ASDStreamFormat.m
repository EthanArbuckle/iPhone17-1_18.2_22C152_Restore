@interface ASDStreamFormat
- (ASDStreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3;
- (ASDStreamFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3;
- (ASDStreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6;
- (AudioStreamBasicDescription)audioStreamBasicDescription;
- (AudioStreamRangedDescription)audioStreamRangedDescription;
- (BOOL)isCompatible:(id)a3;
- (BOOL)isEqual:(id)a3;
- (double)maximumSampleRate;
- (double)minimumSampleRate;
- (double)sampleRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)bitsPerChannel;
- (unsigned)bytesPerFrame;
- (unsigned)bytesPerPacket;
- (unsigned)channelsPerFrame;
- (unsigned)formatFlags;
- (unsigned)formatID;
- (unsigned)framesPerPacket;
- (unsigned)framesToBytes:(unsigned int)a3;
- (void)setBitsPerChannel:(unsigned int)a3;
- (void)setBytesPerFrame:(unsigned int)a3;
- (void)setBytesPerPacket:(unsigned int)a3;
- (void)setChannelsPerFrame:(unsigned int)a3;
- (void)setFormatFlags:(unsigned int)a3;
- (void)setFormatID:(unsigned int)a3;
- (void)setFramesPerPacket:(unsigned int)a3;
- (void)setMaximumSampleRate:(double)a3;
- (void)setMinimumSampleRate:(double)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation ASDStreamFormat

- (ASDStreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6
{
  BOOL v6 = a6;
  v15.receiver = self;
  v15.super_class = (Class)ASDStreamFormat;
  result = [(ASDStreamFormat *)&v15 init];
  if (result)
  {
    result->_sampleRate = a3;
    result->_minimumSampleRate = a3;
    result->_maximumSampleRate = a3;
    *(void *)&result->_formatID = 0x86C70636DLL;
    result->_framesPerPacket = 1;
    result->_channelsPerFrame = a4;
    signed int v11 = a5 - 1;
    if (a5 - 1 > 4)
    {
      unsigned int v14 = 0;
      unsigned int v13 = 40;
    }
    else
    {
      unsigned int v12 = dword_225D3B610[v11];
      unsigned int v13 = dword_225D3B624[v11];
      unsigned int v14 = dword_225D3B638[v11];
      result->_formatFlags = v12;
    }
    result->_bitsPerChannel = 8 * v14;
    if (v6) {
      v14 *= a4;
    }
    else {
      result->_formatFlags = v13;
    }
    result->_bytesPerPacket = v14;
    result->_bytesPerFrame = v14;
  }
  return result;
}

- (ASDStreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASDStreamFormat;
  result = [(ASDStreamFormat *)&v8 init];
  if (result)
  {
    double mSampleRate = a3->mSampleRate;
    result->_formatID = a3->mFormatID;
    result->_formatFlags = a3->mFormatFlags;
    result->_bytesPerPacket = a3->mBytesPerPacket;
    UInt32 mFramesPerPacket = a3->mFramesPerPacket;
    result->_framesPerPacket = mFramesPerPacket;
    result->_channelsPerFrame = a3->mChannelsPerFrame;
    UInt32 mBytesPerFrame = a3->mBytesPerFrame;
    result->_bytesPerFrame = mBytesPerFrame;
    result->_bitsPerChannel = a3->mBitsPerChannel;
    result->_sampleRate = mSampleRate;
    result->_minimudouble mSampleRate = mSampleRate;
    result->_maximudouble mSampleRate = mSampleRate;
    if (a3->mFormatID == 1819304813) {
      result->_bytesPerPacket = mBytesPerFrame * mFramesPerPacket;
    }
  }
  return result;
}

- (ASDStreamFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASDStreamFormat;
  result = [(ASDStreamFormat *)&v7 init];
  if (result)
  {
    result->_sampleRate = a3->mFormat.mSampleRate;
    result->_formatID = a3->mFormat.mFormatID;
    result->_formatFlags = a3->mFormat.mFormatFlags;
    result->_bytesPerPacket = a3->mFormat.mBytesPerPacket;
    UInt32 mFramesPerPacket = a3->mFormat.mFramesPerPacket;
    result->_framesPerPacket = mFramesPerPacket;
    result->_channelsPerFrame = a3->mFormat.mChannelsPerFrame;
    UInt32 mBytesPerFrame = a3->mFormat.mBytesPerFrame;
    result->_bytesPerFrame = mBytesPerFrame;
    result->_bitsPerChannel = a3->mFormat.mBitsPerChannel;
    result->_minimudouble mSampleRate = a3->mSampleRateRange.mMinimum;
    result->_maximudouble mSampleRate = a3->mSampleRateRange.mMaximum;
    if (a3->mFormat.mFormatID == 1819304813) {
      result->_bytesPerPacket = mBytesPerFrame * mFramesPerPacket;
    }
  }
  return result;
}

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->double mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  [(ASDStreamFormat *)self sampleRate];
  retstr->double mSampleRate = v5;
  retstr->mFormatID = [(ASDStreamFormat *)self formatID];
  retstr->mFormatFlags = [(ASDStreamFormat *)self formatFlags];
  retstr->mBytesPerPacket = [(ASDStreamFormat *)self bytesPerPacket];
  retstr->UInt32 mFramesPerPacket = [(ASDStreamFormat *)self framesPerPacket];
  retstr->UInt32 mBytesPerFrame = [(ASDStreamFormat *)self bytesPerFrame];
  retstr->mChannelsPerFrame = [(ASDStreamFormat *)self channelsPerFrame];
  result = (AudioStreamBasicDescription *)[(ASDStreamFormat *)self bitsPerChannel];
  retstr->mBitsPerChannel = result;
  return result;
}

- (AudioStreamRangedDescription)audioStreamRangedDescription
{
  retstr->mSampleRateRange.mMaximum = 0.0;
  *(_OWORD *)&retstr->mFormat.mBytesPerPacket = 0u;
  *(_OWORD *)&retstr->mFormat.mBitsPerChannel = 0u;
  *(_OWORD *)&retstr->mFormat.double mSampleRate = 0u;
  [(ASDStreamFormat *)self audioStreamBasicDescription];
  long long v5 = v10;
  *(_OWORD *)&retstr->mFormat.double mSampleRate = v9;
  *(_OWORD *)&retstr->mFormat.mBytesPerPacket = v5;
  *(void *)&retstr->mFormat.mBitsPerChannel = v11;
  [(ASDStreamFormat *)self minimumSampleRate];
  retstr->mSampleRateRange.mMinimum = v6;
  result = (AudioStreamRangedDescription *)[(ASDStreamFormat *)self maximumSampleRate];
  retstr->mSampleRateRange.mMaximum = v8;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(ASDStreamFormat *)self sampleRate];
  objc_msgSend(v4, "setSampleRate:");
  objc_msgSend(v4, "setFormatID:", -[ASDStreamFormat formatID](self, "formatID"));
  objc_msgSend(v4, "setFormatFlags:", -[ASDStreamFormat formatFlags](self, "formatFlags"));
  objc_msgSend(v4, "setBytesPerPacket:", -[ASDStreamFormat bytesPerPacket](self, "bytesPerPacket"));
  objc_msgSend(v4, "setFramesPerPacket:", -[ASDStreamFormat framesPerPacket](self, "framesPerPacket"));
  objc_msgSend(v4, "setBytesPerFrame:", -[ASDStreamFormat bytesPerFrame](self, "bytesPerFrame"));
  objc_msgSend(v4, "setChannelsPerFrame:", -[ASDStreamFormat channelsPerFrame](self, "channelsPerFrame"));
  objc_msgSend(v4, "setBitsPerChannel:", -[ASDStreamFormat bitsPerChannel](self, "bitsPerChannel"));
  [(ASDStreamFormat *)self minimumSampleRate];
  objc_msgSend(v4, "setMinimumSampleRate:");
  [(ASDStreamFormat *)self maximumSampleRate];
  objc_msgSend(v4, "setMaximumSampleRate:");
  return v4;
}

- (unint64_t)hash
{
  unsigned int v3 = [(ASDStreamFormat *)self formatID];
  unsigned int v4 = [(ASDStreamFormat *)self formatFlags] | v3;
  unsigned int v5 = [(ASDStreamFormat *)self bytesPerPacket];
  unsigned int v6 = v4 | v5 | [(ASDStreamFormat *)self framesPerPacket];
  unsigned int v7 = [(ASDStreamFormat *)self bytesPerFrame];
  unsigned int v8 = v7 | [(ASDStreamFormat *)self channelsPerFrame];
  return *(void *)&self->_sampleRate | v6 | v8 | [(ASDStreamFormat *)self bitsPerChannel];
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (ASDStreamFormat *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = v4;
      unsigned int v6 = [(ASDStreamFormat *)v5 formatID];
      if (v6 == [(ASDStreamFormat *)self formatID]
        && (unsigned int v7 = [(ASDStreamFormat *)v5 formatFlags],
            v7 == [(ASDStreamFormat *)self formatFlags])
        && (unsigned int v8 = [(ASDStreamFormat *)v5 bytesPerPacket],
            v8 == [(ASDStreamFormat *)self bytesPerPacket])
        && (unsigned int v9 = [(ASDStreamFormat *)v5 framesPerPacket],
            v9 == [(ASDStreamFormat *)self framesPerPacket])
        && (unsigned int v10 = [(ASDStreamFormat *)v5 bytesPerFrame],
            v10 == [(ASDStreamFormat *)self bytesPerFrame])
        && (unsigned int v11 = [(ASDStreamFormat *)v5 channelsPerFrame],
            v11 == [(ASDStreamFormat *)self channelsPerFrame])
        && (unsigned int v12 = [(ASDStreamFormat *)v5 bitsPerChannel],
            v12 == [(ASDStreamFormat *)self bitsPerChannel]))
      {
        [(ASDStreamFormat *)v5 sampleRate];
        double v14 = v13;
        [(ASDStreamFormat *)self sampleRate];
        BOOL v16 = vabdd_f64(v14, v15) < 0.001;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (BOOL)isCompatible:(id)a3
{
  id v4 = a3;
  int v5 = [v4 formatID];
  if (v5 != [(ASDStreamFormat *)self formatID]) {
    goto LABEL_12;
  }
  int v6 = [v4 formatFlags];
  if (v6 != [(ASDStreamFormat *)self formatFlags]) {
    goto LABEL_12;
  }
  int v7 = [v4 bytesPerPacket];
  if (v7 != [(ASDStreamFormat *)self bytesPerPacket]) {
    goto LABEL_12;
  }
  int v8 = [v4 framesPerPacket];
  if (v8 != [(ASDStreamFormat *)self framesPerPacket]) {
    goto LABEL_12;
  }
  int v9 = [v4 bytesPerFrame];
  if (v9 != [(ASDStreamFormat *)self bytesPerFrame]) {
    goto LABEL_12;
  }
  int v10 = [v4 channelsPerFrame];
  if (v10 != [(ASDStreamFormat *)self channelsPerFrame]) {
    goto LABEL_12;
  }
  int v11 = [v4 bitsPerChannel];
  if (v11 != [(ASDStreamFormat *)self bitsPerChannel]) {
    goto LABEL_12;
  }
  [v4 minimumSampleRate];
  double v13 = v12;
  [(ASDStreamFormat *)self sampleRate];
  if (vabdd_f64(v13, v14) < 0.001) {
    goto LABEL_14;
  }
  [v4 maximumSampleRate];
  double v16 = v15;
  [(ASDStreamFormat *)self sampleRate];
  if (vabdd_f64(v16, v17) < 0.001
    || ([v4 minimumSampleRate], double v19 = v18, -[ASDStreamFormat sampleRate](self, "sampleRate"), v19 <= v20)
    && ([v4 maximumSampleRate], double v22 = v21, -[ASDStreamFormat sampleRate](self, "sampleRate"), v22 >= v23))
  {
LABEL_14:
    BOOL v24 = 1;
  }
  else
  {
LABEL_12:
    BOOL v24 = 0;
  }

  return v24;
}

- (id)description
{
  unsigned int v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [(ASDStreamFormat *)self sampleRate];
  uint64_t v7 = v6;
  if ((int)[(ASDStreamFormat *)self formatID] < 0x20000000
    || (int)[(ASDStreamFormat *)self formatID] > 2130706431)
  {
    uint64_t v8 = 32;
  }
  else
  {
    uint64_t v8 = ((int)[(ASDStreamFormat *)self formatID] >> 24);
  }
  if ((int)([(ASDStreamFormat *)self formatID] << 8) < 0x20000000
    || (int)([(ASDStreamFormat *)self formatID] << 8) > 2130706431)
  {
    uint64_t v9 = 32;
  }
  else
  {
    uint64_t v9 = ((int)([(ASDStreamFormat *)self formatID] << 8) >> 24);
  }
  v26 = (void *)v5;
  BOOL v24 = v3;
  uint64_t v25 = v8;
  if ((int)([(ASDStreamFormat *)self formatID] << 16) < 0x20000000
    || (int)([(ASDStreamFormat *)self formatID] << 16) > 2130706431)
  {
    uint64_t v10 = 32;
  }
  else
  {
    uint64_t v10 = ((__int16)[(ASDStreamFormat *)self formatID] >> 8);
  }
  uint64_t v11 = v9;
  if ((int)([(ASDStreamFormat *)self formatID] << 24) < 520093697
    || [(ASDStreamFormat *)self formatID] == 127)
  {
    uint64_t v12 = 32;
  }
  else
  {
    uint64_t v12 = (char)[(ASDStreamFormat *)self formatID];
  }
  uint64_t v13 = [(ASDStreamFormat *)self formatFlags];
  uint64_t v14 = [(ASDStreamFormat *)self bytesPerPacket];
  uint64_t v15 = [(ASDStreamFormat *)self framesPerPacket];
  uint64_t v16 = [(ASDStreamFormat *)self bytesPerFrame];
  uint64_t v17 = [(ASDStreamFormat *)self channelsPerFrame];
  uint64_t v18 = [(ASDStreamFormat *)self bitsPerChannel];
  [(ASDStreamFormat *)self minimumSampleRate];
  uint64_t v20 = v19;
  [(ASDStreamFormat *)self maximumSampleRate];
  double v22 = [v24 stringWithFormat:@"<%@ sampleRate:%f formatID:%c%c%c%c formatFlags:0x%08x bytesPerPacket:%u framesPerPacket:%u bytesPerFrame:%u channelsPerFrame:%u bitsPerChannel:%u minimumSampleRate:%f maximumSampleRate:%f>", v26, v7, v25, v11, v10, v12, v13, v14, v15, v16, v17, v18, v20, v21];

  return v22;
}

- (unsigned)framesToBytes:(unsigned int)a3
{
  return [(ASDStreamFormat *)self bytesPerFrame] * a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (unsigned)formatID
{
  return self->_formatID;
}

- (void)setFormatID:(unsigned int)a3
{
  self->_formatID = a3;
}

- (unsigned)formatFlags
{
  return self->_formatFlags;
}

- (void)setFormatFlags:(unsigned int)a3
{
  self->_formatFlags = a3;
}

- (unsigned)bytesPerPacket
{
  return self->_bytesPerPacket;
}

- (void)setBytesPerPacket:(unsigned int)a3
{
  self->_bytesPerPacket = a3;
}

- (unsigned)framesPerPacket
{
  return self->_framesPerPacket;
}

- (void)setFramesPerPacket:(unsigned int)a3
{
  self->_framesPerPacket = a3;
}

- (unsigned)bytesPerFrame
{
  return self->_bytesPerFrame;
}

- (void)setBytesPerFrame:(unsigned int)a3
{
  self->_bytesPerFrame = a3;
}

- (unsigned)channelsPerFrame
{
  return self->_channelsPerFrame;
}

- (void)setChannelsPerFrame:(unsigned int)a3
{
  self->_channelsPerFrame = a3;
}

- (unsigned)bitsPerChannel
{
  return self->_bitsPerChannel;
}

- (void)setBitsPerChannel:(unsigned int)a3
{
  self->_bitsPerChannel = a3;
}

- (double)minimumSampleRate
{
  return self->_minimumSampleRate;
}

- (void)setMinimumSampleRate:(double)a3
{
  self->_minimudouble mSampleRate = a3;
}

- (double)maximumSampleRate
{
  return self->_maximumSampleRate;
}

- (void)setMaximumSampleRate:(double)a3
{
  self->_maximudouble mSampleRate = a3;
}

@end
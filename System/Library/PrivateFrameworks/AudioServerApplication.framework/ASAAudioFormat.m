@interface ASAAudioFormat
- (ASAAudioFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3;
- (ASAAudioFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3;
- (AudioStreamBasicDescription)audioStreamBasicDescription;
- (AudioStreamRangedDescription)audioStreamRangedDescription;
- (double)maximumSampleRate;
- (double)minimumSampleRate;
- (double)sampleRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)bitsPerChannel;
- (unsigned)bytesPerFrame;
- (unsigned)bytesPerPacket;
- (unsigned)channelsPerFrame;
- (unsigned)formatFlags;
- (unsigned)formatID;
- (unsigned)framesPerPacket;
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

@implementation ASAAudioFormat

- (ASAAudioFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  result = [(ASAAudioFormat *)self init];
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
    result->_bytesPerPacket = mBytesPerFrame * mFramesPerPacket;
    result->_sampleRate = mSampleRate;
    result->_minimudouble mSampleRate = mSampleRate;
    result->_maximudouble mSampleRate = mSampleRate;
  }
  return result;
}

- (ASAAudioFormat)initWithAudioStreamRangedDescription:(AudioStreamRangedDescription *)a3
{
  result = [(ASAAudioFormat *)self init];
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
    result->_bytesPerPacket = mBytesPerFrame * mFramesPerPacket;
    result->_minimudouble mSampleRate = a3->mSampleRateRange.mMinimum;
    result->_maximudouble mSampleRate = a3->mSampleRateRange.mMaximum;
  }
  return result;
}

- (void)setChannelsPerFrame:(unsigned int)a3
{
  self->_channelsPerFrame = a3;
  [(ASAAudioFormat *)self setBytesPerFrame:4 * a3];
  unsigned int v4 = [(ASAAudioFormat *)self framesPerPacket];
  uint64_t v5 = [(ASAAudioFormat *)self bytesPerFrame] * v4;
  [(ASAAudioFormat *)self setBytesPerPacket:v5];
}

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->double mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  [(ASAAudioFormat *)self sampleRate];
  retstr->double mSampleRate = v5;
  retstr->mFormatID = [(ASAAudioFormat *)self formatID];
  retstr->mFormatFlags = [(ASAAudioFormat *)self formatFlags];
  retstr->mBytesPerPacket = [(ASAAudioFormat *)self bytesPerPacket];
  retstr->UInt32 mFramesPerPacket = [(ASAAudioFormat *)self framesPerPacket];
  retstr->UInt32 mBytesPerFrame = [(ASAAudioFormat *)self bytesPerFrame];
  retstr->mChannelsPerFrame = [(ASAAudioFormat *)self channelsPerFrame];
  result = (AudioStreamBasicDescription *)[(ASAAudioFormat *)self bitsPerChannel];
  retstr->mBitsPerChannel = result;
  return result;
}

- (AudioStreamRangedDescription)audioStreamRangedDescription
{
  retstr->mSampleRateRange.mMaximum = 0.0;
  *(_OWORD *)&retstr->mFormat.mBytesPerPacket = 0u;
  *(_OWORD *)&retstr->mFormat.mBitsPerChannel = 0u;
  *(_OWORD *)&retstr->mFormat.double mSampleRate = 0u;
  [(ASAAudioFormat *)self audioStreamBasicDescription];
  long long v5 = v10;
  *(_OWORD *)&retstr->mFormat.double mSampleRate = v9;
  *(_OWORD *)&retstr->mFormat.mBytesPerPacket = v5;
  *(void *)&retstr->mFormat.mBitsPerChannel = v11;
  [(ASAAudioFormat *)self minimumSampleRate];
  retstr->mSampleRateRange.mMinimum = v6;
  result = (AudioStreamRangedDescription *)[(ASAAudioFormat *)self maximumSampleRate];
  retstr->mSampleRateRange.mMaximum = v8;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(ASAAudioFormat *)self sampleRate];
  objc_msgSend(v4, "setSampleRate:");
  objc_msgSend(v4, "setFormatID:", -[ASAAudioFormat formatID](self, "formatID"));
  objc_msgSend(v4, "setFormatFlags:", -[ASAAudioFormat formatFlags](self, "formatFlags"));
  objc_msgSend(v4, "setBytesPerPacket:", -[ASAAudioFormat bytesPerPacket](self, "bytesPerPacket"));
  objc_msgSend(v4, "setFramesPerPacket:", -[ASAAudioFormat framesPerPacket](self, "framesPerPacket"));
  objc_msgSend(v4, "setBytesPerFrame:", -[ASAAudioFormat bytesPerFrame](self, "bytesPerFrame"));
  objc_msgSend(v4, "setChannelsPerFrame:", -[ASAAudioFormat channelsPerFrame](self, "channelsPerFrame"));
  objc_msgSend(v4, "setBitsPerChannel:", -[ASAAudioFormat bitsPerChannel](self, "bitsPerChannel"));
  [(ASAAudioFormat *)self minimumSampleRate];
  objc_msgSend(v4, "setMinimumSampleRate:");
  [(ASAAudioFormat *)self maximumSampleRate];
  objc_msgSend(v4, "setMaximumSampleRate:");
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [(ASAAudioFormat *)self sampleRate];
  uint64_t v7 = v6;
  if ((int)[(ASAAudioFormat *)self formatID] < 0x20000000
    || (int)[(ASAAudioFormat *)self formatID] > 2130706431)
  {
    uint64_t v8 = 32;
  }
  else
  {
    uint64_t v8 = ((int)[(ASAAudioFormat *)self formatID] >> 24);
  }
  if ((int)([(ASAAudioFormat *)self formatID] << 8) < 0x20000000
    || (int)([(ASAAudioFormat *)self formatID] << 8) > 2130706431)
  {
    uint64_t v9 = 32;
  }
  else
  {
    uint64_t v9 = ((int)([(ASAAudioFormat *)self formatID] << 8) >> 24);
  }
  v26 = (void *)v5;
  v24 = v3;
  uint64_t v25 = v8;
  if ((int)([(ASAAudioFormat *)self formatID] << 16) < 0x20000000
    || (int)([(ASAAudioFormat *)self formatID] << 16) > 2130706431)
  {
    uint64_t v10 = 32;
  }
  else
  {
    uint64_t v10 = ((__int16)[(ASAAudioFormat *)self formatID] >> 8);
  }
  uint64_t v11 = v9;
  if ((int)([(ASAAudioFormat *)self formatID] << 24) < 520093697
    || [(ASAAudioFormat *)self formatID] == 127)
  {
    uint64_t v12 = 32;
  }
  else
  {
    uint64_t v12 = (char)[(ASAAudioFormat *)self formatID];
  }
  uint64_t v13 = [(ASAAudioFormat *)self formatFlags];
  uint64_t v14 = [(ASAAudioFormat *)self bytesPerPacket];
  uint64_t v15 = [(ASAAudioFormat *)self framesPerPacket];
  uint64_t v16 = [(ASAAudioFormat *)self bytesPerFrame];
  uint64_t v17 = [(ASAAudioFormat *)self channelsPerFrame];
  uint64_t v18 = [(ASAAudioFormat *)self bitsPerChannel];
  [(ASAAudioFormat *)self minimumSampleRate];
  uint64_t v20 = v19;
  [(ASAAudioFormat *)self maximumSampleRate];
  v22 = [v24 stringWithFormat:@"<%@ sampleRate:%f formatID:%c%c%c%c formatFlags:0x%08x bytesPerPacket:%u framesPerPacket:%u bytesPerFrame:%u channelsPerFrame:%u bitsPerChannel:%u minimumSampleRate:%f maximumSampleRate:%f>", v26, v7, v25, v11, v10, v12, v13, v14, v15, v16, v17, v18, v20, v21];

  return v22;
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
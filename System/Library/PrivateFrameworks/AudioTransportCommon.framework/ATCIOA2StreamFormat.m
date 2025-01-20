@interface ATCIOA2StreamFormat
+ (id)aeaStreamFormatWithDictionary:(id)a3;
+ (id)aeaStreamFormatsWithRangedDictionary:(id)a3;
- (ATCIOA2StreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3;
- (ATCIOA2StreamFormat)initWithIOAudio2Dictionary:(id)a3;
- (ATCIOA2StreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6;
- (AudioStreamBasicDescription)audioStreamBasicDescription;
- (BOOL)isEqual:(id)a3;
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
- (void)setSampleRate:(double)a3;
@end

@implementation ATCIOA2StreamFormat

+ (id)aeaStreamFormatWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIOAudio2Dictionary:v3];

  return v4;
}

+ (id)aeaStreamFormatsWithRangedDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v23 = [MEMORY[0x263EFF980] array];
  v4 = [v3 objectForKeyedSubscript:@"min sample rate"];
  v5 = [v3 objectForKeyedSubscript:@"max sample rate"];
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  if (v7 == v8)
  {
    v21 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIOAudio2Dictionary:v3];
    if (v21) {
      [v23 addObject:v21];
    }
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [&unk_26D923410 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(&unk_26D923410);
          }
          v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v13 doubleValue];
          double v15 = v14;
          [v4 doubleValue];
          if (v15 >= v16)
          {
            [v13 doubleValue];
            double v18 = v17;
            [v5 doubleValue];
            if (v18 <= v19)
            {
              v20 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIOAudio2Dictionary:v3];
              if (v20)
              {
                [v13 doubleValue];
                objc_msgSend(v20, "setSampleRate:");
                [v23 addObject:v20];
              }
            }
          }
        }
        uint64_t v10 = [&unk_26D923410 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }
  }

  return v23;
}

- (ATCIOA2StreamFormat)initWithSampleRate:(double)a3 numChannels:(unsigned int)a4 commonPCMFormat:(unsigned int)a5 isInterleaved:(BOOL)a6
{
  BOOL v6 = a6;
  v15.receiver = self;
  v15.super_class = (Class)ATCIOA2StreamFormat;
  result = [(ATCIOA2StreamFormat *)&v15 init];
  if (result)
  {
    result->_sampleRate = a3;
    *(void *)&result->_formatID = 0x86C70636DLL;
    result->_framesPerPacket = 1;
    result->_channelsPerFrame = a4;
    signed int v11 = a5 - 1;
    if (a5 - 1 > 3)
    {
      unsigned int v14 = 0;
      unsigned int v13 = 40;
    }
    else
    {
      unsigned int v12 = dword_2259957C0[v11];
      unsigned int v13 = dword_2259957D0[v11];
      unsigned int v14 = dword_2259957E0[v11];
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

- (ATCIOA2StreamFormat)initWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ATCIOA2StreamFormat;
  result = [(ATCIOA2StreamFormat *)&v7 init];
  if (result)
  {
    result->_sampleRate = a3->mSampleRate;
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
  }
  return result;
}

- (ATCIOA2StreamFormat)initWithIOAudio2Dictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATCIOA2StreamFormat;
  v5 = [(ATCIOA2StreamFormat *)&v17 init];
  if (v5)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:@"sample rate"];

    if (v6) {
      objc_super v7 = @"sample rate";
    }
    else {
      objc_super v7 = @"min sample rate";
    }
    double v8 = [v4 objectForKeyedSubscript:v7];
    v5->_sampleRate = IOAudio2Fixed64ToFloat64([v8 longLongValue]);

    uint64_t v9 = [v4 objectForKeyedSubscript:@"format ID"];
    v5->_formatID = [v9 unsignedIntValue];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"format flags"];
    v5->_formatFlags = [v10 unsignedIntValue];

    signed int v11 = [v4 objectForKeyedSubscript:@"bytes per packet"];
    v5->_bytesPerPacket = [v11 unsignedIntValue];

    unsigned int v12 = [v4 objectForKeyedSubscript:@"frames per packet"];
    v5->_framesPerPacket = [v12 unsignedIntValue];

    unsigned int v13 = [v4 objectForKeyedSubscript:@"channels per frame"];
    v5->_channelsPerFrame = [v13 unsignedIntValue];

    unsigned int v14 = [v4 objectForKeyedSubscript:@"bytes per frame"];
    v5->_bytesPerFrame = [v14 unsignedIntValue];

    objc_super v15 = [v4 objectForKeyedSubscript:@"bits per channel"];
    v5->_bitsPerChannel = [v15 unsignedIntValue];
  }
  return v5;
}

- (AudioStreamBasicDescription)audioStreamBasicDescription
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  [(ATCIOA2StreamFormat *)self sampleRate];
  retstr->mSampleRate = v5;
  retstr->mFormatID = [(ATCIOA2StreamFormat *)self formatID];
  retstr->mFormatFlags = [(ATCIOA2StreamFormat *)self formatFlags];
  retstr->mBytesPerPacket = [(ATCIOA2StreamFormat *)self bytesPerPacket];
  retstr->UInt32 mFramesPerPacket = [(ATCIOA2StreamFormat *)self framesPerPacket];
  retstr->UInt32 mBytesPerFrame = [(ATCIOA2StreamFormat *)self bytesPerFrame];
  retstr->mChannelsPerFrame = [(ATCIOA2StreamFormat *)self channelsPerFrame];
  result = (AudioStreamBasicDescription *)[(ATCIOA2StreamFormat *)self bitsPerChannel];
  retstr->mBitsPerChannel = result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(ATCIOA2StreamFormat *)self sampleRate];
  objc_msgSend(v4, "setSampleRate:");
  objc_msgSend(v4, "setFormatID:", -[ATCIOA2StreamFormat formatID](self, "formatID"));
  objc_msgSend(v4, "setFormatFlags:", -[ATCIOA2StreamFormat formatFlags](self, "formatFlags"));
  objc_msgSend(v4, "setBytesPerPacket:", -[ATCIOA2StreamFormat bytesPerPacket](self, "bytesPerPacket"));
  objc_msgSend(v4, "setFramesPerPacket:", -[ATCIOA2StreamFormat framesPerPacket](self, "framesPerPacket"));
  objc_msgSend(v4, "setBytesPerFrame:", -[ATCIOA2StreamFormat bytesPerFrame](self, "bytesPerFrame"));
  objc_msgSend(v4, "setChannelsPerFrame:", -[ATCIOA2StreamFormat channelsPerFrame](self, "channelsPerFrame"));
  objc_msgSend(v4, "setBitsPerChannel:", -[ATCIOA2StreamFormat bitsPerChannel](self, "bitsPerChannel"));
  return v4;
}

- (unint64_t)hash
{
  unsigned int v3 = [(ATCIOA2StreamFormat *)self formatID];
  unsigned int v4 = [(ATCIOA2StreamFormat *)self formatFlags] | v3;
  unsigned int v5 = [(ATCIOA2StreamFormat *)self bytesPerPacket];
  unsigned int v6 = v4 | v5 | [(ATCIOA2StreamFormat *)self framesPerPacket];
  unsigned int v7 = [(ATCIOA2StreamFormat *)self bytesPerFrame];
  unsigned int v8 = v7 | [(ATCIOA2StreamFormat *)self channelsPerFrame];
  return *(void *)&self->_sampleRate | v6 | v8 | [(ATCIOA2StreamFormat *)self bitsPerChannel];
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (ATCIOA2StreamFormat *)a3;
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
      unsigned int v6 = [(ATCIOA2StreamFormat *)v5 formatID];
      if (v6 == [(ATCIOA2StreamFormat *)self formatID]
        && (unsigned int v7 = [(ATCIOA2StreamFormat *)v5 formatFlags],
            v7 == [(ATCIOA2StreamFormat *)self formatFlags])
        && (unsigned int v8 = [(ATCIOA2StreamFormat *)v5 bytesPerPacket],
            v8 == [(ATCIOA2StreamFormat *)self bytesPerPacket])
        && (unsigned int v9 = [(ATCIOA2StreamFormat *)v5 framesPerPacket],
            v9 == [(ATCIOA2StreamFormat *)self framesPerPacket])
        && (unsigned int v10 = [(ATCIOA2StreamFormat *)v5 bytesPerFrame],
            v10 == [(ATCIOA2StreamFormat *)self bytesPerFrame])
        && (unsigned int v11 = [(ATCIOA2StreamFormat *)v5 channelsPerFrame],
            v11 == [(ATCIOA2StreamFormat *)self channelsPerFrame])
        && (unsigned int v12 = [(ATCIOA2StreamFormat *)v5 bitsPerChannel],
            v12 == [(ATCIOA2StreamFormat *)self bitsPerChannel]))
      {
        [(ATCIOA2StreamFormat *)v5 sampleRate];
        double v14 = v13;
        [(ATCIOA2StreamFormat *)self sampleRate];
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

- (id)description
{
  unsigned int v8 = NSString;
  unsigned int v3 = (objc_class *)objc_opt_class();
  unsigned int v4 = NSStringFromClass(v3);
  [(ATCIOA2StreamFormat *)self sampleRate];
  unsigned int v6 = [v8 stringWithFormat:@"<%@ sampleRate:%f formatID:%c%c%c%c formatFlags:0x%08x bytesPerPacket:%u framesPerPacket:%u bytesPerFrame:%u channelsPerFrame:%u bitsPerChannel:%u>", v4, v5, ((int)-[ATCIOA2StreamFormat formatID](self, "formatID") >> 24), ((int)(-[ATCIOA2StreamFormat formatID](self, "formatID") << 8) >> 24), ((__int16)-[ATCIOA2StreamFormat formatID](self, "formatID") >> 8), (char)-[ATCIOA2StreamFormat formatID](self, "formatID"), -[ATCIOA2StreamFormat formatFlags](self, "formatFlags"), -[ATCIOA2StreamFormat bytesPerPacket](self, "bytesPerPacket"), -[ATCIOA2StreamFormat framesPerPacket](self, "framesPerPacket"), -[ATCIOA2StreamFormat bytesPerFrame](self, "bytesPerFrame"), -[ATCIOA2StreamFormat channelsPerFrame](self, "channelsPerFrame"), -[ATCIOA2StreamFormat bitsPerChannel](self, "bitsPerChannel")];

  return v6;
}

- (unsigned)framesToBytes:(unsigned int)a3
{
  return [(ATCIOA2StreamFormat *)self bytesPerFrame] * a3;
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

@end
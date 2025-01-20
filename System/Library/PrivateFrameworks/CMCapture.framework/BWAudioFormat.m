@interface BWAudioFormat
+ (BOOL)compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:(id)a3;
+ (id)formatForAVAudioSettings:(id)a3 inputFormat:(id)a4;
+ (id)formatWithAudioFormatDescription:(opaqueCMFormatDescription *)a3;
+ (void)initialize;
- (NSDictionary)audioCompressionSBPOptions;
- (id)debugDescription;
- (id)description;
- (opaqueCMFormatDescription)audioFormatDescription;
- (opaqueCMFormatDescription)formatDescription;
- (unsigned)mediaType;
- (void)_initForAVAudioSettings:(unint64_t)a3 inputFormat:;
- (void)_initWithAudioFormatDescription:(void *)a1;
- (void)dealloc;
@end

@implementation BWAudioFormat

- (void)dealloc
{
  audioFormatDescription = self->_audioFormatDescription;
  if (audioFormatDescription) {
    CFRelease(audioFormatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWAudioFormat;
  [(BWAudioFormat *)&v4 dealloc];
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_audioFormatDescription;
}

+ (id)formatWithAudioFormatDescription:(opaqueCMFormatDescription *)a3
{
  v3 = -[BWAudioFormat _initWithAudioFormatDescription:]([BWAudioFormat alloc], a3);
  return v3;
}

- (void)_initWithAudioFormatDescription:(void *)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2)
  {

    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)BWAudioFormat;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = CFRetain(a2);
  }
  return v3;
}

+ (void)initialize
{
  objc_opt_class();
  objc_opt_class();
}

+ (BOOL)compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:(id)a3
{
  if ([a3 objectForKeyedSubscript:@"AVEncoderBitRateKey"]
    || (uint64_t v4 = [a3 objectForKeyedSubscript:@"AVEncoderBitRatePerChannelKey"]) != 0)
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (id)formatForAVAudioSettings:(id)a3 inputFormat:(id)a4
{
  uint64_t v4 = -[BWAudioFormat _initForAVAudioSettings:inputFormat:]([BWAudioFormat alloc], (unint64_t)a3, (unint64_t)a4);
  return v4;
}

- (void)_initForAVAudioSettings:(unint64_t)a3 inputFormat:
{
  uint64_t v4 = a1;
  if (!a1) {
    return v4;
  }
  if (!(a2 | a3))
  {
    fig_log_get_emitter();
    uint64_t v27 = v3;
    LODWORD(v26) = 0;
    FigDebugAssert3();
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    v25 = @"Can't make a BWAudioFormat when audioSettings and inputFormat are both nil";
    goto LABEL_49;
  }
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  v6 = (const opaqueCMFormatDescription *)[(id)a3 formatDescription];
  v7 = v6;
  if (a2)
  {
    memset(&outPropertyData.mFormatID, 0, 32);
    AudioFormatID mFormatID = objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", @"AVFormatIDKey"), "intValue");
    outPropertyData.AudioFormatID mFormatID = mFormatID;
    objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", @"AVSampleRateKey"), "doubleValue");
    double v10 = v9;
    outPropertyData.mSampleRate = v9;
    UInt32 mChannelsPerFrame = objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", @"AVNumberOfChannelsKey"), "intValue");
    outPropertyData.UInt32 mChannelsPerFrame = mChannelsPerFrame;
    if (mFormatID == 1819304813)
    {
      UInt32 mBitsPerChannel = objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", @"AVLinearPCMBitDepthKey"), "intValue");
      outPropertyData.UInt32 mBitsPerChannel = mBitsPerChannel;
      if (objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", @"AVLinearPCMIsBigEndianKey"), "BOOLValue"))
      {
        AudioFormatFlags v13 = 2;
        outPropertyData.mFormatFlags = 2;
      }
      else
      {
        AudioFormatFlags v13 = 0;
      }
      v15 = (void *)[(id)a2 objectForKeyedSubscript:@"AVLinearPCMIsFloatKey"];
      if (v15)
      {
        if ([v15 BOOLValue]) {
          int v16 = 1;
        }
        else {
          int v16 = 4;
        }
        v13 |= v16 | 8;
        outPropertyData.mFormatFlags = v13;
      }
      if (objc_msgSend((id)objc_msgSend((id)a2, "objectForKeyedSubscript:", @"AVLinearPCMIsNonInterleaved"), "BOOLValue"))
      {
        v13 |= 0x20u;
        outPropertyData.mFormatFlags = v13;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
      UInt32 mBitsPerChannel = 0;
    }
    v17 = (void *)[(id)a2 objectForKeyedSubscript:@"AVChannelLayoutKey"];
    v18 = v17;
    if (v17)
    {
      v19 = (const AudioChannelLayout *)[v17 bytes];
      v18 = (void *)[v18 length];
      if (!v7) {
        goto LABEL_28;
      }
    }
    else
    {
      v19 = 0;
      if (!v7) {
        goto LABEL_28;
      }
    }
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v7);
    if (!mFormatID)
    {
      AudioFormatID mFormatID = StreamBasicDescription->mFormatID;
      outPropertyData.AudioFormatID mFormatID = mFormatID;
    }
    if (v10 == 0.0) {
      outPropertyData.mSampleRate = StreamBasicDescription->mSampleRate;
    }
    if (!mChannelsPerFrame)
    {
      UInt32 mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
      outPropertyData.UInt32 mChannelsPerFrame = mChannelsPerFrame;
    }
LABEL_28:
    if (mFormatID != 1819304813) {
      goto LABEL_38;
    }
    if (v7 && !mBitsPerChannel)
    {
      UInt32 mBitsPerChannel = CMAudioFormatDescriptionGetStreamBasicDescription(v7)->mBitsPerChannel;
      outPropertyData.UInt32 mBitsPerChannel = mBitsPerChannel;
    }
    outPropertyData.mFramesPerPacket = 1;
    if (!mBitsPerChannel) {
      goto LABEL_38;
    }
    if ((v13 & 0x20) != 0)
    {
      UInt32 v21 = mBitsPerChannel >> 3;
    }
    else
    {
      if (!mChannelsPerFrame) {
        goto LABEL_38;
      }
      UInt32 v21 = mChannelsPerFrame * (mBitsPerChannel >> 3);
    }
    outPropertyData.mBytesPerPacket = v21;
    outPropertyData.mBytesPerFrame = v21;
LABEL_38:
    UInt32 ioPropertyDataSize = 40;
    if (AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &outPropertyData)
      || CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &outPropertyData, (size_t)v18, v19, 0, 0, 0, &formatDescriptionOut))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    v14 = formatDescriptionOut;
    goto LABEL_41;
  }
  if (!v6)
  {
    fig_log_get_emitter();
    uint64_t v27 = v3;
    LODWORD(v26) = 0;
    FigDebugAssert3();
    v23 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v24 = *MEMORY[0x1E4F1C3C8];
    v25 = @"Can't make a BWAudioFormat because the provided input format produced a NULL CMFormatDescription";
LABEL_49:
    objc_exception_throw((id)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v25, 0, v26, v27));
  }
  v14 = (const opaqueCMFormatDescription *)CFRetain(v6);
  CMAudioFormatDescriptionRef formatDescriptionOut = v14;
LABEL_41:
  uint64_t v4 = -[BWAudioFormat _initWithAudioFormatDescription:](v4, v14);
  if (v4) {
    v4[2] = [(id)a2 copy];
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  return v4;
}

- (opaqueCMFormatDescription)audioFormatDescription
{
  return self->_audioFormatDescription;
}

- (NSDictionary)audioCompressionSBPOptions
{
  uint64_t v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(NSDictionary *)self->_avAudioSettings objectForKeyedSubscript:@"AVEncoderBitRateKey"];
  objc_super v5 = (void *)MEMORY[0x1E4F32600];
  if (v4) {
    [(NSDictionary *)v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F32600]];
  }
  id v6 = [(NSDictionary *)self->_avAudioSettings objectForKeyedSubscript:@"AVEncoderBitRatePerChannelKey"];
  if (v6)
  {
    v7 = v6;
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(self->_audioFormatDescription);
    if (StreamBasicDescription) {
      -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", StreamBasicDescription->mChannelsPerFrame * objc_msgSend(v7, "intValue")), *v5);
    }
  }
  if (+[BWAudioFormat compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:self->_avAudioSettings])
  {
    [(NSDictionary *)v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F32640]];
  }
  Float64 v9 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", @"AVAudioEncoderSpecificationKey"), "objectForKeyedSubscript:", @"AVAudioEncoderSpecificationUseHardwareEncoderIfAvailableKey");
  if (v9) {
    uint64_t v10 = [v9 BOOLValue];
  }
  else {
    uint64_t v10 = 1;
  }
  uint64_t v11 = [NSNumber numberWithBool:v10];
  [(NSDictionary *)v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F32648]];
  id v12 = [(NSDictionary *)self->_avAudioSettings objectForKeyedSubscript:@"AVEncoderBitRateStrategyKey"];
  if (v12)
  {
    AudioFormatFlags v13 = v12;
    if ([v12 isEqualToString:@"AVAudioBitRateStrategy_Constant"])
    {
      v14 = &unk_1EFAFE6B8;
LABEL_16:
      v15 = (void *)MEMORY[0x1E4F32618];
LABEL_17:
      [(NSDictionary *)v3 setObject:v14 forKeyedSubscript:*v15];
      goto LABEL_18;
    }
    if ([v13 isEqualToString:@"AVAudioBitRateStrategy_LongTermAverage"])
    {
      v14 = &unk_1EFAFE6D0;
      goto LABEL_16;
    }
    char v20 = [v13 isEqualToString:@"AVAudioBitRateStrategy_VariableConstrained"];
    v15 = (void *)MEMORY[0x1E4F32618];
    if (v20)
    {
      v14 = &unk_1EFAFE6E8;
      goto LABEL_17;
    }
    if ([v13 isEqualToString:@"AVAudioBitRateStrategy_Variable"])
    {
      [(NSDictionary *)v3 setObject:&unk_1EFAFE700 forKeyedSubscript:*v15];
      id v21 = [(NSDictionary *)self->_avAudioSettings objectForKeyedSubscript:@"AVEncoderQualityForVBRKey"];
      if (v21)
      {
        v14 = v21;
        v15 = (void *)MEMORY[0x1E4F32638];
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  id v16 = [(NSDictionary *)self->_avAudioSettings objectForKeyedSubscript:@"AVSampleRateConverterAlgorithmKey"];
  if (v16)
  {
    v17 = v16;
    if ([v16 isEqualToString:@"AVSampleRateConverterAlgorithm_Normal"])
    {
      v18 = &unk_1EFAFE718;
LABEL_23:
      [(NSDictionary *)v3 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F32608]];
      goto LABEL_24;
    }
    if ([v17 isEqualToString:@"AVSampleRateConverterAlgorithm_Normal"])
    {
      v18 = &unk_1EFAFE730;
      goto LABEL_23;
    }
  }
LABEL_24:
  [(NSDictionary *)v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kFigAudioCompressionOption_UseAudioConverterForMixing"];
  return v3;
}

- (id)description
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] stringWithCapacity:0];
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(self->_audioFormatDescription);
  if (!StreamBasicDescription) {
    return v3;
  }
  objc_super v5 = StreamBasicDescription;
  [v3 appendFormat:@"'%@'@%.0fHz, %d Chn", BWStringForOSType(StreamBasicDescription->mFormatID), *(void *)&v5->mSampleRate, v5->mChannelsPerFrame];
  if (v5->mFormatID == 1819304813)
  {
    id v6 = "BE";
    uint64_t mFormatFlags = v5->mFormatFlags;
    if ((mFormatFlags & 2) == 0) {
      id v6 = "LE";
    }
    v8 = "Int";
    if (mFormatFlags) {
      v8 = "Float";
    }
    [v3 appendFormat:@", %d-bit %s %s (mFormatFlags: 0x%0x)", v5->mBitsPerChannel, v6, v8, mFormatFlags];
    Float64 v9 = "Non-interleaved";
    if ((mFormatFlags & 0x20) == 0) {
      Float64 v9 = "Interleaved";
    }
    [v3 appendFormat:@", %s", v9];
  }
  else
  {
    [v3 appendFormat:@", %d FPP", v5->mFramesPerPacket];
  }
  avAudioSettings = self->_avAudioSettings;
  if (!avAudioSettings) {
    return v3;
  }
  id v11 = [(NSDictionary *)avAudioSettings objectForKeyedSubscript:@"AVEncoderBitRateKey"];
  if (v11) {
    [v3 appendFormat:@", %d bps", objc_msgSend(v11, "intValue")];
  }
  id v12 = [(NSDictionary *)self->_avAudioSettings objectForKeyedSubscript:@"AVEncoderBitRatePerChannelKey"];
  if (v12) {
    [v3 appendFormat:@", %d bps", v5->mChannelsPerFrame * objc_msgSend(v12, "intValue")];
  }
  AudioFormatFlags v13 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_avAudioSettings, "objectForKeyedSubscript:", @"AVAudioEncoderSpecificationKey"), "objectForKeyedSubscript:", @"AVAudioEncoderSpecificationUseHardwareEncoderIfAvailableKey");
  if (v13 && ([v13 BOOLValue] & 1) == 0) {
    [v3 appendString:@", SOFTWARE"];
  }
  id v14 = [(NSDictionary *)self->_avAudioSettings objectForKeyedSubscript:@"AVEncoderBitRateStrategyKey"];
  if (v14)
  {
    v15 = v14;
    if ([v14 isEqualToString:@"AVAudioBitRateStrategy_Constant"])
    {
      id v16 = @", Constant BRCM";
LABEL_26:
      [v3 appendString:v16];
      goto LABEL_27;
    }
    if ([v15 isEqualToString:@"AVAudioBitRateStrategy_LongTermAverage"])
    {
      id v16 = @", LongTermAvg BRCM";
      goto LABEL_26;
    }
    if ([v15 isEqualToString:@"AVAudioBitRateStrategy_VariableConstrained"])
    {
      id v16 = @", VariableConstrained BRCM";
      goto LABEL_26;
    }
    if ([v15 isEqualToString:@"AVAudioBitRateStrategy_Variable"])
    {
      [v3 appendString:@", Variable BRCM"];
      id v21 = [(NSDictionary *)self->_avAudioSettings objectForKeyedSubscript:@"AVEncoderQualityForVBRKey"];
      if (v21) {
        [v3 appendFormat:@", Quality %d", objc_msgSend(v21, "intValue")];
      }
    }
  }
LABEL_27:
  id v17 = [(NSDictionary *)self->_avAudioSettings objectForKeyedSubscript:@"AVSampleRateConverterAlgorithmKey"];
  if (v17)
  {
    v18 = v17;
    if ([v17 isEqualToString:@"AVSampleRateConverterAlgorithm_Normal"])
    {
      v19 = @", Mastering SRC";
LABEL_32:
      [v3 appendString:v19];
      return v3;
    }
    if ([v18 isEqualToString:@"AVSampleRateConverterAlgorithm_Normal"])
    {
      v19 = @", Normal SRC";
      goto LABEL_32;
    }
  }
  return v3;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> %@", NSStringFromClass(v4), self, -[BWAudioFormat description](self, "description")];
}

- (unsigned)mediaType
{
  return 1936684398;
}

@end
@interface AVAudioSettingsValueConstrainer
- (AVAudioSettingsValueConstrainer)init;
- (float)_getAvailableOutputSampleRateFor:(float)a3 rounding:(int64_t)a4;
- (float)applicableOutputSampleRateForDesiredSampleRate:(float)a3 rounding:(int64_t)a4;
- (float)outputSampleRate;
- (id)_fetchApplicableOutputDataRates;
- (unsigned)availableOutputChannelCountForDesiredChannelCount:(unsigned int)a3 rounding:(int64_t)a4;
- (unsigned)outputBitsPerChannel;
- (unsigned)outputChannelCount;
- (unsigned)outputDataRate;
- (unsigned)outputFormat;
- (unsigned)outputFormatFlags;
- (void)_bringUpToDate;
- (void)_buildApplicableDataRatesForSampleRates;
- (void)_buildAudioConverter;
- (void)_buildAvailableSampleRates;
- (void)dealloc;
- (void)setInputPropertiesFromASBD:(AudioStreamBasicDescription *)a3;
- (void)setOutputBitsPerChannel:(unsigned int)a3;
- (void)setOutputChannelCount:(unsigned int)a3;
- (void)setOutputDataRate:(unsigned int)a3;
- (void)setOutputFormat:(unsigned int)a3;
- (void)setOutputFormatFlags:(unsigned int)a3;
- (void)setOutputSampleRate:(float)a3;
@end

@implementation AVAudioSettingsValueConstrainer

- (AVAudioSettingsValueConstrainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVAudioSettingsValueConstrainer;
  result = [(AVAudioSettingsValueConstrainer *)&v3 init];
  if (result)
  {
    *(void *)&result->_inputASBD.mBitsPerChannel = 0;
    *(_OWORD *)&result->_inputASBD.mBytesPerPacket = 0u;
    *(_OWORD *)&result->_inputASBD.mSampleRate = 0u;
    *(_OWORD *)&result->_outputASBD.mSampleRate = 0u;
    *(_OWORD *)&result->_outputASBD.mBytesPerPacket = 0u;
    *(void *)&result->_outputASBD.mBitsPerChannel = 0;
    *(_WORD *)&result->_needNewConverter = 257;
    result->_needApplicableParameters = 1;
  }
  return result;
}

- (void)dealloc
{
  audioConverter = self->_audioConverter;
  if (audioConverter) {
    AudioConverterDispose(audioConverter);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAudioSettingsValueConstrainer;
  [(AVAudioSettingsValueConstrainer *)&v4 dealloc];
}

- (void)_buildAudioConverter
{
  UInt32 ioPropertyDataSize = 40;
  p_audioConverter = &self->_audioConverter;
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    AudioConverterDispose(audioConverter);
    *p_audioConverter = 0;
  }
  AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &self->_inputASBD);
  AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &self->_outputASBD);
  long long v5 = *(_OWORD *)&self->_outputASBD.mBytesPerPacket;
  *(_OWORD *)&v7.mSampleRate = *(_OWORD *)&self->_outputASBD.mSampleRate;
  *(_OWORD *)&v7.mBytesPerPacket = v5;
  *(void *)&v7.mBitsPerChannel = *(void *)&self->_outputASBD.mBitsPerChannel;
  if (v7.mFormatID == 1819304813 && HIDWORD(v5) == 0) {
    v7.mChannelsPerFrame = self->_inputASBD.mChannelsPerFrame;
  }
  AudioFormatGetProperty(0x666D7469u, 0, 0, &ioPropertyDataSize, &v7);
  AudioConverterNew(&self->_inputASBD, &v7, p_audioConverter);
  self->_needNewConverter = 0;
}

- (void)_buildAvailableSampleRates
{
  UInt32 outSize = 0;
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    availableOutputSampleRates = self->_availableOutputSampleRates;
    if (availableOutputSampleRates)
    {

      self->_availableOutputSampleRates = 0;
      audioConverter = self->_audioConverter;
    }
    long long v5 = 0;
    if (!AudioConverterGetPropertyInfo(audioConverter, 0x76657372u, &outSize, 0))
    {
      long long v5 = malloc_type_malloc(outSize, 0x3F695FC0uLL);
      if (v5)
      {
        if (!AudioConverterGetProperty(self->_audioConverter, 0x76657372u, &outSize, v5)) {
          self->_availableOutputSampleRates = (NSArray *)audioValueRangeArrayWithAudioValueRanges((uint64_t)v5, (unint64_t)outSize >> 4);
        }
      }
    }
  }
  else
  {
    long long v5 = 0;
  }
  free(v5);
  self->_needAvailableSampleRates = 0;
}

- (void)_buildApplicableDataRatesForSampleRates
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  Float64 mSampleRate = self->_outputASBD.mSampleRate;
  availableOutputDataRates = self->_availableOutputDataRates;
  if (availableOutputDataRates)
  {

    self->_availableOutputDataRates = 0;
  }
  self->_availableOutputDataRates = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  applicableOutputSampleRatesForDataRate = self->_applicableOutputSampleRatesForDataRate;
  if (applicableOutputSampleRatesForDataRate)
  {

    self->_applicableOutputSampleRatesForDataRate = 0;
  }
  self->_applicableOutputSampleRatesForDataRate = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  applicableOutputDataRatesForSampleRate = self->_applicableOutputDataRatesForSampleRate;
  if (applicableOutputDataRatesForSampleRate)
  {

    self->_applicableOutputDataRatesForSampleRate = 0;
  }
  self->_applicableOutputDataRatesForSampleRate = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = self->_availableOutputSampleRates;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * i) minimum];
        self->_outputASBD.Float64 mSampleRate = v11;
        [(AVAudioSettingsValueConstrainer *)self _buildAudioConverter];
        id v12 = [(AVAudioSettingsValueConstrainer *)self _fetchApplicableOutputDataRates];
        [(NSMutableArray *)self->_applicableOutputDataRatesForSampleRate addObject:v12];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v34 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * j);
              if ([(NSMutableArray *)self->_availableOutputDataRates indexOfObject:v17] == 0x7FFFFFFFFFFFFFFFLL) {
                [(NSMutableArray *)self->_availableOutputDataRates addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v14);
        }
      }
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v8);
  }
  if ([(NSMutableArray *)self->_availableOutputDataRates count])
  {
    unint64_t v18 = 0;
    do
    {
      -[NSMutableArray addObject:](self->_applicableOutputSampleRatesForDataRate, "addObject:", [MEMORY[0x1E4F1CA48] array]);
      ++v18;
    }
    while (v18 < [(NSMutableArray *)self->_availableOutputDataRates count]);
  }
  if ([(NSArray *)self->_availableOutputSampleRates count])
  {
    unint64_t v19 = 0;
    do
    {
      id v20 = [(NSArray *)self->_availableOutputSampleRates objectAtIndex:v19];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v21 = (void *)[(NSMutableArray *)self->_applicableOutputDataRatesForSampleRate objectAtIndex:v19];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v30;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v30 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = [(NSMutableArray *)self->_availableOutputDataRates indexOfObject:*(void *)(*((void *)&v29 + 1) + 8 * k)];
            if (v26 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v27 = (void *)[(NSMutableArray *)self->_applicableOutputSampleRatesForDataRate objectAtIndex:v26];
              if ([v27 indexOfObject:v20] == 0x7FFFFFFFFFFFFFFFLL) {
                [v27 addObject:v20];
              }
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
        }
        while (v23);
      }
      ++v19;
    }
    while (v19 < [(NSArray *)self->_availableOutputSampleRates count]);
  }
  self->_outputASBD.Float64 mSampleRate = mSampleRate;
  self->_needNewConverter = 1;
  self->_needApplicableParameters = 0;
}

- (id)_fetchApplicableOutputDataRates
{
  UInt32 outSize = 0;
  objc_super v3 = (void *)[MEMORY[0x1E4F1C978] array];
  audioConverter = self->_audioConverter;
  if (audioConverter && !AudioConverterGetPropertyInfo(audioConverter, 0x61656272u, &outSize, 0))
  {
    long long v5 = malloc_type_malloc(outSize, 0x334E525EuLL);
    if (v5 && !AudioConverterGetProperty(self->_audioConverter, 0x61656272u, &outSize, v5)) {
      objc_super v3 = audioValueRangeArrayWithAudioValueRanges((uint64_t)v5, (unint64_t)outSize >> 4);
    }
  }
  else
  {
    long long v5 = 0;
  }
  free(v5);
  return v3;
}

- (void)_bringUpToDate
{
  UInt32 ioPropertyDataSize = 40;
  if (self->_needNewConverter)
  {
    [(AVAudioSettingsValueConstrainer *)self _buildAudioConverter];
    *(_WORD *)&self->_needAvailableSampleRates = 257;
  }
  else if (!self->_needAvailableSampleRates)
  {
    goto LABEL_5;
  }
  [(AVAudioSettingsValueConstrainer *)self _buildAvailableSampleRates];
LABEL_5:
  if (self->_needApplicableParameters) {
    [(AVAudioSettingsValueConstrainer *)self _buildApplicableDataRatesForSampleRates];
  }
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    if (self->_needNewConverter)
    {
      [(AVAudioSettingsValueConstrainer *)self _buildAudioConverter];
      audioConverter = self->_audioConverter;
    }
    AudioConverterGetProperty(audioConverter, 0x61636964u, &ioPropertyDataSize, &self->_inputASBD);
    AudioConverterGetProperty(self->_audioConverter, 0x61636F64u, &ioPropertyDataSize, &self->_outputASBD);
  }
}

- (void)setInputPropertiesFromASBD:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_inputASBD.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_inputASBD.mBytesPerPacket = v4;
  *(_OWORD *)&self->_inputASBD.Float64 mSampleRate = v3;
  self->_needNewConverter = 1;
}

- (float)outputSampleRate
{
  return self->_outputASBD.mSampleRate;
}

- (void)setOutputSampleRate:(float)a3
{
  double v3 = a3;
  if (self->_outputASBD.mSampleRate != v3)
  {
    self->_outputASBD.Float64 mSampleRate = v3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputFormat
{
  return self->_outputASBD.mFormatID;
}

- (void)setOutputFormat:(unsigned int)a3
{
  if (self->_outputASBD.mFormatID != a3)
  {
    self->_outputASBD.mFormatID = a3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputFormatFlags
{
  return self->_outputASBD.mFormatFlags;
}

- (void)setOutputFormatFlags:(unsigned int)a3
{
  if (self->_outputASBD.mFormatFlags != a3)
  {
    self->_outputASBD.mFormatFlags = a3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputBitsPerChannel
{
  return self->_outputASBD.mBitsPerChannel;
}

- (void)setOutputBitsPerChannel:(unsigned int)a3
{
  if (self->_outputASBD.mBitsPerChannel != a3)
  {
    self->_outputASBD.mBitsPerChannel = a3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputChannelCount
{
  return self->_outputASBD.mChannelsPerFrame;
}

- (void)setOutputChannelCount:(unsigned int)a3
{
  if (self->_outputASBD.mChannelsPerFrame != a3)
  {
    self->_outputASBD.mChannelsPerFrame = a3;
    self->_needNewConverter = 1;
  }
}

- (unsigned)outputDataRate
{
  return self->_outputDataRate;
}

- (void)setOutputDataRate:(unsigned int)a3
{
  self->_outputDataRate = a3;
}

- (float)applicableOutputSampleRateForDesiredSampleRate:(float)a3 rounding:(int64_t)a4
{
  [(AVAudioSettingsValueConstrainer *)self _bringUpToDate];
  unsigned int v7 = [(AVAudioSettingsValueConstrainer *)self outputDataRate];
  if (v7)
  {
    uint64_t v9 = indexOfValueInAudioValueRangeArray(self->_availableOutputDataRates, a4, (double)v7);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)[(NSMutableArray *)self->_applicableOutputSampleRatesForDataRate objectAtIndex:v9];
      uint64_t v11 = indexOfValueInAudioValueRangeArray(v10, a4, a3);
      a3 = 0.0;
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v11), "minimum");
        return v12;
      }
    }
    return a3;
  }
  else
  {
    *(float *)&double v8 = a3;
    [(AVAudioSettingsValueConstrainer *)self _getAvailableOutputSampleRateFor:a4 rounding:v8];
  }
  return result;
}

- (unsigned)availableOutputChannelCountForDesiredChannelCount:(unsigned int)a3 rounding:(int64_t)a4
{
  UInt32 outPropertyDataSize = 0;
  p_outputASBD = &self->_outputASBD;
  if (AudioFormatGetPropertyInfo(0x61766E63u, 0x28u, &self->_outputASBD, &outPropertyDataSize))
  {
    unsigned int v7 = 0;
  }
  else
  {
    unsigned int v7 = (unsigned int *)malloc_type_malloc(outPropertyDataSize, 0x33B701BuLL);
    if (v7)
    {
      if (!AudioFormatGetProperty(0x61766E63u, 0x28u, p_outputASBD, &outPropertyDataSize, v7))
      {
        UInt32 v8 = outPropertyDataSize;
        unint64_t v9 = (unint64_t)outPropertyDataSize >> 2;
        if (v9 != 1 || *v7 != -1)
        {
          v10 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:(unint64_t)outPropertyDataSize >> 2];
          if (v8 >= 4)
          {
            if (v9 <= 1) {
              unint64_t v9 = 1;
            }
            uint64_t v11 = v7;
            do
            {
              unsigned int v12 = *v11++;
              objc_msgSend(v10, "addObject:", +[AVFloat64Range float64RangeWithMinimum:maximum:](AVFloat64Range, "float64RangeWithMinimum:maximum:", (double)v12, (double)v12));
              --v9;
            }
            while (v9);
          }
          uint64_t v13 = indexOfValueInAudioValueRangeArray(v10, a4, (double)a3);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            a3 = 0;
          }
          else
          {
            objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", v13), "minimum");
            a3 = v14;
          }
        }
      }
    }
  }
  free(v7);
  return a3;
}

- (float)_getAvailableOutputSampleRateFor:(float)a3 rounding:(int64_t)a4
{
  [(AVAudioSettingsValueConstrainer *)self _bringUpToDate];
  availableOutputSampleRates = self->_availableOutputSampleRates;
  if (availableOutputSampleRates)
  {
    uint64_t v8 = indexOfValueInAudioValueRangeArray(availableOutputSampleRates, a4, a3);
    a3 = 0.0;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(-[NSArray objectAtIndex:](availableOutputSampleRates, "objectAtIndex:", v8), "minimum");
      return v9;
    }
  }
  return a3;
}

@end
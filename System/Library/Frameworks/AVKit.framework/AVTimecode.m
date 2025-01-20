@interface AVTimecode
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- (AVTimecode)initWithTimecodeString:(id)a3;
- (BOOL)stringIsValidNumericValue:(id)a3;
- (CVSMPTETime)timecodeStruct;
- (int64_t)frameNumber;
- (unsigned)tc_flags;
- (void)setFrameDuration:(id *)a3;
- (void)setFrameNumber:(int64_t)a3;
- (void)setTc_flags:(unsigned int)a3;
- (void)setTimecodeStruct:(CVSMPTETime *)a3;
@end

@implementation AVTimecode

- (void)setTc_flags:(unsigned int)a3
{
  self->_tc_flags = a3;
}

- (unsigned)tc_flags
{
  return self->_tc_flags;
}

- (void)setFrameDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_frameDuration.epoch = a3->var3;
  *(_OWORD *)&self->_frameDuration.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setFrameNumber:(int64_t)a3
{
  self->_frameNumber = a3;
}

- (int64_t)frameNumber
{
  return self->_frameNumber;
}

- (void)setTimecodeStruct:(CVSMPTETime *)a3
{
  long long v3 = *(_OWORD *)&a3->subframes;
  *(void *)&self->_timecodeStruct.hours = *(void *)&a3->hours;
  *(_OWORD *)&self->_timecodeStruct.subframes = v3;
}

- (CVSMPTETime)timecodeStruct
{
  *retstr = self[1];
  return self;
}

- (BOOL)stringIsValidNumericValue:(id)a3
{
  long long v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 decimalDigitCharacterSet];
  v6 = [v5 invertedSet];

  uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];
  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (AVTimecode)initWithTimecodeString:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AVTimecode;
  v5 = [(AVTimecode *)&v23 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    uint64_t v7 = [v4 componentsSeparatedByCharactersInSet:v6];

    long long v19 = 0u;
    long long v20 = 0u;
    int v8 = [v7 count] == 4;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v8 &= -[AVTimecode stringIsValidNumericValue:](v5, "stringIsValidNumericValue:", *(void *)(*((void *)&v19 + 1) + 8 * v13++), (void)v19);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }

    if (v8)
    {
      v14 = [v9 objectAtIndex:3];
      v5->_timecodeStruct.frames = [v14 intValue];

      v15 = [v9 objectAtIndex:2];
      v5->_timecodeStruct.seconds = [v15 intValue];

      v16 = [v9 objectAtIndex:1];
      v5->_timecodeStruct.minutes = [v16 intValue];

      v17 = [v9 objectAtIndex:0];
      v5->_timecodeStruct.hours = [v17 intValue];
    }
    else
    {
      v17 = v5;
      v5 = 0;
    }
  }
  return v5;
}

@end
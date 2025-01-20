@interface SHAudioUtilities
+ (BOOL)isAudioFormatSupported:(id)a3;
+ (BOOL)willAudioFormatCauseBufferMutation:(id)a3;
+ (double)durationOfBuffer:(id)a3;
+ (id)appendBuffer:(id)a3 toBuffer:(id)a4;
+ (id)audioBufferFromData:(void *)a3 byteSize:(unint64_t)a4 inFormat:(id)a5;
+ (id)bufferHead:(id)a3 duration:(double)a4;
+ (id)bufferTail:(id)a3 duration:(double)a4;
+ (id)extractFromBuffer:(id)a3 atPosition:(unsigned int)a4 length:(unsigned int)a5;
+ (id)splitBuffer:(id)a3 atPosition:(unsigned int)a4;
+ (id)splitBuffer:(id)a3 fromStartPosition:(unsigned int)a4 intoDurationsOfSize:(double)a5;
@end

@implementation SHAudioUtilities

+ (id)bufferHead:(id)a3 duration:(double)a4
{
  id v7 = a3;
  [a1 durationOfBuffer:v7];
  if (v8 <= a4)
  {
    id v11 = v7;
  }
  else
  {
    v9 = [v7 format];
    [v9 sampleRate];
    LODWORD(v4) = vcvtad_u64_f64(v10 * a4);

    id v11 = [a1 extractFromBuffer:v7 atPosition:0 length:v4];
  }
  v12 = v11;

  return v12;
}

+ (id)bufferTail:(id)a3 duration:(double)a4
{
  id v7 = a3;
  [a1 durationOfBuffer:v7];
  if (v8 <= a4)
  {
    id v15 = v7;
  }
  else
  {
    double v9 = v8 - a4;
    double v10 = [v7 format];
    [v10 sampleRate];
    uint64_t v12 = (v9 * v11);

    v13 = [v7 format];
    [v13 sampleRate];
    LODWORD(v4) = vcvtad_u64_f64(v14 * a4);

    id v15 = [a1 extractFromBuffer:v7 atPosition:v12 length:v4];
  }
  v16 = v15;

  return v16;
}

+ (double)durationOfBuffer:(id)a3
{
  id v3 = a3;
  double v4 = (double)[v3 frameLength];
  v5 = [v3 format];

  [v5 sampleRate];
  double v7 = v4 / v6;

  return v7;
}

+ (id)extractFromBuffer:(id)a3 atPosition:(unsigned int)a4 length:(unsigned int)a5
{
  id v7 = a3;
  if ([v7 frameLength] >= a4)
  {
    unsigned int v9 = [v7 frameLength] - a4;
    if (v9 >= a5) {
      uint64_t v10 = a5;
    }
    else {
      uint64_t v10 = v9;
    }
    id v11 = objc_alloc(MEMORY[0x263EF93B0]);
    uint64_t v12 = [v7 format];
    id v8 = (id)[v11 initWithPCMFormat:v12 frameCapacity:v10];

    [v8 setFrameLength:v10];
    if (*(_DWORD *)[v7 audioBufferList])
    {
      unint64_t v13 = 0;
      uint64_t v14 = 16;
      do
      {
        id v15 = [v8 format];
        int v16 = *(_DWORD *)([v15 streamDescription] + 24);

        memcpy(*(void **)([v8 audioBufferList] + v14), (const void *)(*(void *)(objc_msgSend(v7, "audioBufferList") + v14) + v16 * a4), objc_msgSend(v8, "frameLength") * v16);
        ++v13;
        v14 += 16;
      }
      while (v13 < *(unsigned int *)[v7 audioBufferList]);
    }
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

+ (id)splitBuffer:(id)a3 fromStartPosition:(unsigned int)a4 intoDurationsOfSize:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v9 = [MEMORY[0x263EFF980] array];
  if (v6)
  {
    unsigned int v10 = [v8 frameLength];
    if (v10 >= v6) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = [a1 extractFromBuffer:v8 atPosition:0 length:v11];
    [v9 addObject:v12];
  }
  unint64_t v13 = [v8 format];
  [v13 sampleRate];
  double v15 = v14;

  if ([v8 frameLength] > v6)
  {
    unsigned int v16 = (v15 * a5);
    do
    {
      LODWORD(v17) = v6 + v16;
      unsigned int v18 = [v8 frameLength];
      if (v6 + v16 >= v18) {
        uint64_t v17 = v18;
      }
      else {
        uint64_t v17 = v17;
      }
      v19 = [a1 extractFromBuffer:v8 atPosition:v6 length:(v17 - v6)];
      [v9 addObject:v19];

      uint64_t v6 = v17;
    }
    while (v17 < [v8 frameLength]);
  }

  return v9;
}

+ (id)splitBuffer:(id)a3 atPosition:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  double v7 = (double)[v6 frameLength];
  id v8 = [v6 format];
  [v8 sampleRate];
  unsigned int v10 = [a1 splitBuffer:v6 fromStartPosition:v4 intoDurationsOfSize:v7 / v9];

  return v10;
}

+ (BOOL)willAudioFormatCauseBufferMutation:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 commonFormat] != 3 || objc_msgSend(v3, "channelCount") != 1;

  return v4;
}

+ (BOOL)isAudioFormatSupported:(id)a3
{
  id v3 = a3;
  if (*(_DWORD *)([v3 streamDescription] + 8) == 1819304813
    && [v3 channelCount] <= 2
    && [v3 commonFormat] != 4
    && [v3 commonFormat] != 2
    && (([v3 isInterleaved] & 1) != 0 || objc_msgSend(v3, "channelCount") != 2))
  {
    [v3 sampleRate];
    uint64_t v7 = (uint64_t)v6;
    BOOL v4 = 1;
    if ((uint64_t)v6 > 44099)
    {
      if (v7 == 44100) {
        goto LABEL_6;
      }
      uint64_t v8 = 48000;
    }
    else
    {
      if (v7 == 16000) {
        goto LABEL_6;
      }
      uint64_t v8 = 32000;
    }
    if (v7 == v8) {
      goto LABEL_6;
    }
  }
  BOOL v4 = 0;
LABEL_6:

  return v4;
}

+ (id)audioBufferFromData:(void *)a3 byteSize:(unint64_t)a4 inFormat:(id)a5
{
  id v7 = a5;
  unint64_t v8 = a4 / *(unsigned int *)([v7 streamDescription] + 24);
  double v9 = (void *)[objc_alloc(MEMORY[0x263EF93B0]) initWithPCMFormat:v7 frameCapacity:v8];

  [v9 setFrameLength:v8];
  memcpy(*(void **)([v9 audioBufferList] + 16), a3, a4);

  return v9;
}

+ (id)appendBuffer:(id)a3 toBuffer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 format];
  int v8 = *(_DWORD *)([v7 streamDescription] + 8);
  double v9 = [v5 format];
  int v10 = *(_DWORD *)([v9 streamDescription] + 8);

  if (v8 == v10)
  {
    int v11 = [v6 frameLength];
    uint64_t v12 = [v5 frameLength] + v11;
    if (v12 <= [v6 frameCapacity])
    {
      id v15 = v6;
      if (*(_DWORD *)[v15 audioBufferList])
      {
        unint64_t v19 = 0;
        uint64_t v20 = 16;
        do
        {
          int v21 = [v15 frameLength];
          v22 = [v5 format];
          uint64_t v23 = (*(_DWORD *)([v22 streamDescription] + 24) * v21);

          v24 = (void *)(*(void *)([v15 audioBufferList] + v20) + v23);
          v25 = *(const void **)([v5 audioBufferList] + v20);
          int v26 = [v5 frameLength];
          v27 = [v5 format];
          memcpy(v24, v25, (*(_DWORD *)([v27 streamDescription] + 24) * v26));

          ++v19;
          v20 += 16;
        }
        while (v19 < *(unsigned int *)[v15 audioBufferList]);
      }
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x263EF93B0]);
      double v14 = [v6 format];
      id v15 = (id)[v13 initWithPCMFormat:v14 frameCapacity:v12];

      if (*(_DWORD *)[v6 audioBufferList])
      {
        uint64_t v16 = 0;
        unint64_t v17 = 0;
        do
        {
          unsigned int v18 = objc_msgSend(MEMORY[0x263EFF990], "dataWithBytes:length:", *(void *)(objc_msgSend(v6, "audioBufferList") + v16 + 16), *(unsigned int *)(objc_msgSend(v6, "audioBufferList") + v16 + 12));
          objc_msgSend(v18, "appendBytes:length:", *(void *)(objc_msgSend(v5, "audioBufferList") + v16 + 16), *(unsigned int *)(objc_msgSend(v5, "audioBufferList") + v16 + 12));
          objc_msgSend(v18, "getBytes:length:", *(void *)(objc_msgSend(v15, "audioBufferList") + v16 + 16), objc_msgSend(v18, "length"));

          ++v17;
          v16 += 16;
        }
        while (v17 < *(unsigned int *)[v6 audioBufferList]);
      }
    }
    [v15 setFrameLength:v12];
  }
  else
  {
    id v15 = v6;
  }

  return v15;
}

@end
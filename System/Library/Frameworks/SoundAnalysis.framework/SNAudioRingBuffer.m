@interface SNAudioRingBuffer
+ (BOOL)copyRecentFramesFrom:(id)a3 to:(id)a4 error:(id *)a5;
+ (id)copyRecentFramesOfAudioRingBufferToAVAudioBufferFrom:(id)a3 frameCount:(int64_t)a4 ringBufferStartSampleTime:(int64_t *)a5;
+ (id)copyToAVAudioBufferFrom:(id)a3 ringBufferStartSampleTime:(int64_t *)a4 error:(id *)a5;
- (BOOL)fetch:(AudioBufferList *)a3 frameCount:(unsigned int)a4 frameNumber:(int64_t)a5 error:(id *)a6;
- (BOOL)getTimeBoundsWithStartTime:(int64_t *)a3 endTime:(int64_t *)a4;
- (BOOL)resizeWithFormat:(id)a3 newCapacityFrames:(unsigned int)a4 error:(id *)a5;
- (BOOL)store:(const AudioBufferList *)a3 frameCount:(unsigned int)a4 frameNumber:(int64_t)a5 error:(id *)a6;
- (SNAudioRingBuffer)initWithFormat:(id)a3 capacityFrames:(int64_t)a4 error:(id *)a5;
- (id).cxx_construct;
- (id)capacityFramesWithError:(id *)a3;
- (id)formatWithError:(id *)a3;
@end

@implementation SNAudioRingBuffer

- (SNAudioRingBuffer)initWithFormat:(id)a3 capacityFrames:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SNAudioRingBuffer;
  id v9 = [(SNAudioRingBuffer *)&v27 init];
  if (v9)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3812000000;
    v23 = sub_1DCB6D834;
    uint64_t v25 = 0;
    v26 = 0;
    v24 = sub_1DCB6D844;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1DCB6D850;
    v16[3] = &unk_1E6CA8060;
    v18 = &v20;
    id v17 = v8;
    int64_t v19 = a4;
    if (sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v16, (uint64_t)a5))
    {
      v10 = (AT::RingBuffer *)v21[6];
      v21[6] = 0;
      sub_1DCB6E2F4((AT::RingBuffer **)v9 + 1, v10);
    }
    else
    {

      id v9 = 0;
    }

    _Block_object_dispose(&v20, 8);
    v11 = v26;
    v26 = 0;
    if (v11)
    {
      AT::RingBuffer::~RingBuffer(v11);
      MEMORY[0x1E01A8C50](v12, 0x1020C4047CAF6D5, v13, v14);
    }
  }

  return (SNAudioRingBuffer *)v9;
}

- (id)formatWithError:(id *)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1DCB6D978;
  v5[3] = &unk_1E6CA8088;
  v5[4] = self;
  v3 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v5, (uint64_t)a3);

  return v3;
}

- (BOOL)resizeWithFormat:(id)a3 newCapacityFrames:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DCB6DA94;
  v11[3] = &unk_1E6CA80B0;
  v11[4] = self;
  id v12 = v8;
  unsigned int v13 = a4;
  id v9 = v8;
  LOBYTE(a5) = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v11, (uint64_t)a5);

  return (char)a5;
}

- (id)capacityFramesWithError:(id *)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1DCB6DC1C;
  v5[3] = &unk_1E6CA7B78;
  v5[4] = self;
  v3 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v5, (uint64_t)a3);

  return v3;
}

- (BOOL)getTimeBoundsWithStartTime:(int64_t *)a3 endTime:(int64_t *)a4
{
  id v8 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DCB6DD10;
  v9[3] = &unk_1E6CA80D8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  v4 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v9, (uint64_t)&v8);
  id v5 = v8;
  char v6 = [v4 BOOLValue];

  return v6;
}

- (BOOL)store:(const AudioBufferList *)a3 frameCount:(unsigned int)a4 frameNumber:(int64_t)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DCB6DDE8;
  v7[3] = &unk_1E6CA8100;
  v7[4] = self;
  v7[5] = a3;
  unsigned int v8 = a4;
  v7[6] = a5;
  return sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v7, (uint64_t)a6);
}

- (BOOL)fetch:(AudioBufferList *)a3 frameCount:(unsigned int)a4 frameNumber:(int64_t)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1DCB6DEA0;
  v7[3] = &unk_1E6CA8100;
  v7[4] = self;
  v7[5] = a3;
  unsigned int v8 = a4;
  v7[6] = a5;
  return sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v7, (uint64_t)a6);
}

+ (id)copyToAVAudioBufferFrom:(id)a3 ringBufferStartSampleTime:(int64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DCB6DFA0;
  v11[3] = &unk_1E6CA8128;
  id v12 = v7;
  unsigned int v13 = a4;
  id v8 = v7;
  id v9 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v11, (uint64_t)a5);

  return v9;
}

+ (id)copyRecentFramesOfAudioRingBufferToAVAudioBufferFrom:(id)a3 frameCount:(int64_t)a4 ringBufferStartSampleTime:(int64_t *)a5
{
  id v7 = a3;
  id v12 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1DCB6E1A4;
  v13[3] = &unk_1E6CA8150;
  id v14 = v7;
  int64_t v15 = a4;
  v16 = a5;
  id v8 = v7;
  id v9 = sub_1DCB68388((uint64_t)SNDSPGraphUtilities, v13, (uint64_t)&v12);
  id v10 = v12;

  return v9;
}

+ (BOOL)copyRecentFramesFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DCB6E2B8;
  v12[3] = &unk_1E6CA7CE0;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  LOBYTE(a5) = sub_1DCB69898((uint64_t)SNDSPGraphUtilities, v12, (uint64_t)a5);

  return (char)a5;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end
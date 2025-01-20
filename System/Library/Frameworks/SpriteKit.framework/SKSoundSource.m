@interface SKSoundSource
+ (SKSoundSource)sourceWithBuffer:(id)a3;
+ (id)source;
- (BOOL)isPlaying;
- (BOOL)play;
- (BOOL)shouldLoop;
- (CGPoint)position;
- (SKSoundSource)init;
- (double)gain;
- (id)description;
- (int)completedBufferCount;
- (int)queuedBufferCount;
- (void)dealloc;
- (void)pause;
- (void)purgeCompletedBuffers;
- (void)queueBuffer:(id)a3;
- (void)setGain:(double)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setShouldLoop:(BOOL)a3;
- (void)stop;
@end

@implementation SKSoundSource

- (SKSoundSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)SKSoundSource;
  v2 = [(SKSoundSource *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_sourceId = 0;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    buffers = v3->_buffers;
    v3->_buffers = (NSMutableArray *)v4;
  }
  return v3;
}

+ (id)source
{
  v2 = objc_alloc_init(SKSoundSource);
  ALuint sources = 0;
  alGenSources(1, &sources);
  v2->_sourceId = sources;

  return v2;
}

+ (SKSoundSource)sourceWithBuffer:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = +[SKSoundSource source];
    [v4 queueBuffer:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (SKSoundSource *)v4;
}

- (void)queueBuffer:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_sourceId)
  {
    ALuint bids = [v4 bufferId];
    alSourceQueueBuffers(self->_sourceId, 1, &bids);
    [(NSMutableArray *)self->_buffers addObject:v5];
  }
}

- (BOOL)play
{
  ALuint sourceId = self->_sourceId;
  BOOL result = 1;
  if (sourceId)
  {
    alSourcePlay(sourceId);
    if (alGetError()) {
      return 0;
    }
  }
  return result;
}

- (void)pause
{
  ALuint sourceId = self->_sourceId;
  if (sourceId) {
    alSourcePause(sourceId);
  }
}

- (void)stop
{
  ALuint sourceId = self->_sourceId;
  if (sourceId) {
    alSourceStop(sourceId);
  }
}

- (BOOL)shouldLoop
{
  unsigned int sourceId = self->_sourceId;
  if (sourceId)
  {
    ALint value = 0;
    alGetSourcei(sourceId, 4103, &value);
    LOBYTE(sourceId) = value == 1;
  }
  return sourceId;
}

- (void)setShouldLoop:(BOOL)a3
{
  ALuint sourceId = self->_sourceId;
  if (sourceId) {
    alSourcei(sourceId, 4103, a3);
  }
}

- (double)gain
{
  ALuint sourceId = self->_sourceId;
  if (!sourceId) {
    return 0.0;
  }
  ALfloat value = 0.0;
  alGetSourcef(sourceId, 4106, &value);
  return value;
}

- (void)setGain:(double)a3
{
  ALuint sourceId = self->_sourceId;
  if (sourceId)
  {
    ALfloat v4 = a3;
    alSourcef(sourceId, 4106, v4);
  }
}

- (CGPoint)position
{
  ALuint sourceId = self->_sourceId;
  if (sourceId)
  {
    ALfloat value1 = 0.0;
    ALfloat value3 = 0.0;
    ALfloat value2 = 0.0;
    alGetSource3f(sourceId, 4100, &value1, &value2, &value3);
    double v3 = value1;
    double v4 = value2;
  }
  else
  {
    double v3 = *MEMORY[0x263F00148];
    double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  ALuint sourceId = self->_sourceId;
  if (sourceId)
  {
    ALfloat x = a3.x;
    ALfloat y = a3.y;
    alSource3f(sourceId, 4100, x, y, 0.0);
  }
}

- (BOOL)isPlaying
{
  unsigned int sourceId = self->_sourceId;
  if (sourceId)
  {
    ALint value = 0;
    alGetSourcei(sourceId, 4112, &value);
    LOBYTE(sourceId) = value == 4114;
  }
  return sourceId;
}

- (int)completedBufferCount
{
  int result = self->_sourceId;
  if (result)
  {
    ALint value = 0;
    alGetSourcei(result, 4118, &value);
    return value;
  }
  return result;
}

- (int)queuedBufferCount
{
  int result = self->_sourceId;
  if (result)
  {
    ALint value = 0;
    alGetSourcei(result, 4117, &value);
    ALint v4 = value;
    return v4 - [(SKSoundSource *)self completedBufferCount];
  }
  return result;
}

- (void)purgeCompletedBuffers
{
  v7[1] = *MEMORY[0x263EF8340];
  if (self->_sourceId)
  {
    int v3 = [(SKSoundSource *)self completedBufferCount];
    if (v3 >= 1)
    {
      uint64_t v4 = v3;
      MEMORY[0x270FA5388]();
      alSourceUnqueueBuffers(self->_sourceId, v6, (ALuint *)((char *)v7 - v5));
      -[NSMutableArray removeObjectsInRange:](self->_buffers, "removeObjectsInRange:", 0, v4);
    }
  }
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v3 = self->_buffers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    objc_super v7 = &stru_26BEEFD10;
    do
    {
      uint64_t v8 = 0;
      v9 = v7;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * v8) description];
        objc_super v7 = [(__CFString *)v9 stringByAppendingFormat:@"\n\t%@", v10];

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    objc_super v7 = &stru_26BEEFD10;
  }

  uint64_t v11 = [(SKSoundSource *)self queuedBufferCount];
  uint64_t v12 = [(SKSoundSource *)self completedBufferCount];
  v13 = NSString;
  BOOL v14 = [(SKSoundSource *)self isPlaying];
  v15 = @"NO";
  if (v14) {
    v15 = @"YES";
  }
  v16 = [v13 stringWithFormat:@"paused:%@ totalBuffers:%d completed:%d queued:%d buffers = {%@\n}", v15, (v12 + v11), v12, v11, v7];

  return v16;
}

- (void)dealloc
{
  [(SKSoundSource *)self stop];
  [(SKSoundSource *)self purgeCompletedBuffers];
  [(NSMutableArray *)self->_buffers removeAllObjects];
  if (self->_sourceId)
  {
    alDeleteSources(1, &self->_sourceId);
    self->_unsigned int sourceId = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SKSoundSource;
  [(SKSoundSource *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end
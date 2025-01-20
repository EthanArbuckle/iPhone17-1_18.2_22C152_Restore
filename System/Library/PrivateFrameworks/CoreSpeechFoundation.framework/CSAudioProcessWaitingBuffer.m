@interface CSAudioProcessWaitingBuffer
- (CSAudioProcessWaitingBuffer)initWithUUID:(id)a3 waitingBufferMaxLengthInSec:(float)a4;
- (NSMutableArray)buffer;
- (NSString)uuid;
- (id)fetchAudioChunksFromBuffer;
- (unint64_t)bufferedSampleCount;
- (unint64_t)maxWaitingBufferSizeInSampleCount;
- (void)addAudioChunk:(id)a3;
- (void)addAudioChunk:(id)a3 withBufferedTimestamp:(id)a4;
- (void)dealloc;
- (void)setBuffer:(id)a3;
- (void)setBufferedSampleCount:(unint64_t)a3;
- (void)setMaxWaitingBufferSizeInSampleCount:(unint64_t)a3;
@end

@implementation CSAudioProcessWaitingBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setBufferedSampleCount:(unint64_t)a3
{
  self->_bufferedSampleCount = a3;
}

- (unint64_t)bufferedSampleCount
{
  return self->_bufferedSampleCount;
}

- (void)setMaxWaitingBufferSizeInSampleCount:(unint64_t)a3
{
  self->_maxWaitingBufferSizeInSampleCount = a3;
}

- (unint64_t)maxWaitingBufferSizeInSampleCount
{
  return self->_maxWaitingBufferSizeInSampleCount;
}

- (void)setBuffer:(id)a3
{
}

- (NSMutableArray)buffer
{
  return self->_buffer;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)fetchAudioChunksFromBuffer
{
  return self->_buffer;
}

- (void)addAudioChunk:(id)a3 withBufferedTimestamp:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10)
  {
    unint64_t bufferedSampleCount = self->_bufferedSampleCount;
    if ([v10 numSamples] + bufferedSampleCount <= self->_maxWaitingBufferSizeInSampleCount)
    {
      buffer = self->_buffer;
      v9 = [[CSAudioChunkWithBufferedTimestamp alloc] initWithAudioChunk:v10 bufferedTimestamp:v6];
      [(NSMutableArray *)buffer addObject:v9];

      self->_bufferedSampleCount += [v10 numSamples];
    }
  }
}

- (void)addAudioChunk:(id)a3
{
  v4 = (objc_class *)NSNumber;
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithUnsignedLongLong:0];
  [(CSAudioProcessWaitingBuffer *)self addAudioChunk:v5 withBufferedTimestamp:v6];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSAudioProcessWaitingBuffer dealloc]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s CSAudioProcessWaitingBuffer deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioProcessWaitingBuffer;
  [(CSAudioProcessWaitingBuffer *)&v4 dealloc];
}

- (CSAudioProcessWaitingBuffer)initWithUUID:(id)a3 waitingBufferMaxLengthInSec:(float)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSAudioProcessWaitingBuffer;
  v8 = [(CSAudioProcessWaitingBuffer *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    buffer = v8->_buffer;
    v8->_buffer = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v8->_uuid, a3);
    +[CSConfig inputRecordingSampleRate];
    v8->_maxWaitingBufferSizeInSampleCount = (unint64_t)(float)(v11 * a4);
    v8->_unint64_t bufferedSampleCount = 0;
    v12 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSAudioProcessWaitingBuffer initWithUUID:waitingBufferMaxLengthInSec:]";
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s uuid = %{public}@", buf, 0x16u);
    }
  }

  return v8;
}

@end
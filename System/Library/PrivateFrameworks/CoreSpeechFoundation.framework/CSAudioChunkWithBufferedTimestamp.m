@interface CSAudioChunkWithBufferedTimestamp
- (CSAudioChunk)audioChunk;
- (CSAudioChunkWithBufferedTimestamp)initWithAudioChunk:(id)a3 bufferedTimestamp:(id)a4;
- (NSNumber)bufferedTimestamp;
- (void)setAudioChunk:(id)a3;
- (void)setBufferedTimestamp:(id)a3;
@end

@implementation CSAudioChunkWithBufferedTimestamp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferedTimestamp, 0);
  objc_storeStrong((id *)&self->_audioChunk, 0);
}

- (void)setBufferedTimestamp:(id)a3
{
}

- (NSNumber)bufferedTimestamp
{
  return self->_bufferedTimestamp;
}

- (void)setAudioChunk:(id)a3
{
}

- (CSAudioChunk)audioChunk
{
  return self->_audioChunk;
}

- (CSAudioChunkWithBufferedTimestamp)initWithAudioChunk:(id)a3 bufferedTimestamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSAudioChunkWithBufferedTimestamp;
  v9 = [(CSAudioChunkWithBufferedTimestamp *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_audioChunk, a3);
    objc_storeStrong((id *)&v10->_bufferedTimestamp, a4);
  }

  return v10;
}

@end
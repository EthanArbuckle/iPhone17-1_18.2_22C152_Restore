@interface AXSDTimedAudioBuffer
- (AVAudioPCMBuffer)buffer;
- (AVAudioTime)time;
- (AXSDTimedAudioBuffer)initWithBuffer:(id)a3 atTime:(id)a4;
- (void)setBuffer:(id)a3;
- (void)setTime:(id)a3;
@end

@implementation AXSDTimedAudioBuffer

- (AXSDTimedAudioBuffer)initWithBuffer:(id)a3 atTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXSDTimedAudioBuffer;
  v8 = [(AXSDTimedAudioBuffer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AXSDTimedAudioBuffer *)v8 setBuffer:v6];
    [(AXSDTimedAudioBuffer *)v9 setTime:v7];
  }

  return v9;
}

- (AVAudioPCMBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (AVAudioTime)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
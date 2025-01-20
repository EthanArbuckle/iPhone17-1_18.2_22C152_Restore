@interface AVMIDINoteEvent
- (AVMIDINoteEvent)initWithChannel:(UInt32)channel key:(UInt32)keyNum velocity:(UInt32)velocity duration:(AVMusicTimeStamp)duration;
- (AVMIDINoteEvent)initWithMessage:(MIDINoteMessage *)a3;
- (AVMusicTimeStamp)duration;
- (BOOL)isEqualTo:(id)a3;
- (MIDINoteMessage)message;
- (UInt32)channel;
- (UInt32)key;
- (UInt32)velocity;
- (void)setChannel:(UInt32)channel;
- (void)setDuration:(AVMusicTimeStamp)duration;
- (void)setKey:(UInt32)key;
- (void)setVelocity:(UInt32)velocity;
@end

@implementation AVMIDINoteEvent

- (BOOL)isEqualTo:(id)a3
{
  return *(void *)&self->_msg == *(void *)[a3 message];
}

- (MIDINoteMessage)message
{
  return &self->_msg;
}

- (AVMIDINoteEvent)initWithMessage:(MIDINoteMessage *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMIDINoteEvent;
  result = [(AVMIDINoteEvent *)&v5 init];
  if (result) {
    result->_msg = *a3;
  }
  return result;
}

- (void)setDuration:(AVMusicTimeStamp)duration
{
  Float32 v3 = fmin(duration, 0.0);
  self->_msg.duration = v3;
}

- (AVMusicTimeStamp)duration
{
  return self->_msg.duration;
}

- (void)setVelocity:(UInt32)velocity
{
  self->_msg.velocity = velocity;
}

- (UInt32)velocity
{
  return self->_msg.velocity;
}

- (void)setKey:(UInt32)key
{
  self->_msg.note = key;
}

- (UInt32)key
{
  return self->_msg.note;
}

- (void)setChannel:(UInt32)channel
{
  self->_msg.channel = channel;
}

- (UInt32)channel
{
  return self->_msg.channel;
}

- (AVMIDINoteEvent)initWithChannel:(UInt32)channel key:(UInt32)keyNum velocity:(UInt32)velocity duration:(AVMusicTimeStamp)duration
{
  UInt8 v7 = velocity;
  UInt8 v8 = keyNum;
  UInt8 v9 = channel;
  v12.receiver = self;
  v12.super_class = (Class)AVMIDINoteEvent;
  result = [(AVMIDINoteEvent *)&v12 init];
  if (result)
  {
    result->_msg.channel = v9;
    result->_msg.note = v8;
    result->_msg.velocity = v7;
    result->_msg.releaseVelocity = 0;
    Float32 v11 = duration;
    result->_msg.duration = v11;
  }
  return result;
}

@end
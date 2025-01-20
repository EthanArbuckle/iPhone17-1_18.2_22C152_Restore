@interface AVMIDIChannelEvent
- (AVMIDIChannelEvent)initWithChannel:(unsigned __int8)a3 status:(unsigned __int8)a4 data1:(unsigned __int8)a5 data2:(unsigned __int8)a6;
- (AVMIDIChannelEvent)initWithMessage:(MIDIChannelMessage *)a3;
- (BOOL)isEqualTo:(id)a3;
- (MIDIChannelMessage)message;
- (UInt32)channel;
- (unsigned)data1;
- (unsigned)data2;
- (void)setChannel:(UInt32)channel;
- (void)setData1:(unsigned __int8)a3;
- (void)setData2:(unsigned __int8)a3;
@end

@implementation AVMIDIChannelEvent

- (void)setData2:(unsigned __int8)a3
{
  *(unsigned char *)([(AVMIDIChannelEvent *)self message] + 2) = a3;
}

- (unsigned)data2
{
  return [(AVMIDIChannelEvent *)self message][2];
}

- (void)setData1:(unsigned __int8)a3
{
  *(unsigned char *)([(AVMIDIChannelEvent *)self message] + 1) = a3;
}

- (unsigned)data1
{
  return [(AVMIDIChannelEvent *)self message][1];
}

- (MIDIChannelMessage)message
{
  return &self->_msg;
}

- (BOOL)isEqualTo:(id)a3
{
  return *(void *)&self->_msg.status == *(void *)[a3 message];
}

- (AVMIDIChannelEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMIDIChannelEvent;
  result = [(AVMIDIChannelEvent *)&v5 init];
  if (result) {
    result->_msg = *a3;
  }
  return result;
}

- (AVMIDIChannelEvent)initWithChannel:(unsigned __int8)a3 status:(unsigned __int8)a4 data1:(unsigned __int8)a5 data2:(unsigned __int8)a6
{
  v11.receiver = self;
  v11.super_class = (Class)AVMIDIChannelEvent;
  result = [(AVMIDIChannelEvent *)&v11 init];
  if (result)
  {
    result->_msg.status = a3 & 0xF | a4;
    result->_msg.data1 = a5;
    result->_msg.data2 = a6;
    result->_msg.reserved = 0;
  }
  return result;
}

- (void)setChannel:(UInt32)channel
{
  self->_msg.status = self->_msg.status & 0x80 | channel;
}

- (UInt32)channel
{
  return self->_msg.status & 0xF;
}

@end
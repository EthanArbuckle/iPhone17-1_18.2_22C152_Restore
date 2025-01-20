@interface AVMIDIControlChangeEvent
- (AVMIDIControlChangeEvent)initWithChannel:(UInt32)channel messageType:(AVMIDIControlChangeMessageType)messageType value:(UInt32)value;
- (AVMIDIControlChangeEvent)initWithMessage:(MIDIChannelMessage *)a3;
- (AVMIDIControlChangeMessageType)messageType;
- (UInt32)value;
@end

@implementation AVMIDIControlChangeEvent

- (AVMIDIControlChangeEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMIDIControlChangeEvent;
  return [(AVMIDIChannelEvent *)&v4 initWithMessage:a3];
}

- (UInt32)value
{
  return [(AVMIDIChannelEvent *)self data2];
}

- (AVMIDIControlChangeMessageType)messageType
{
  return (unint64_t)[(AVMIDIChannelEvent *)self data1];
}

- (AVMIDIControlChangeEvent)initWithChannel:(UInt32)channel messageType:(AVMIDIControlChangeMessageType)messageType value:(UInt32)value
{
  v6.receiver = self;
  v6.super_class = (Class)AVMIDIControlChangeEvent;
  return [(AVMIDIChannelEvent *)&v6 initWithChannel:channel status:176 data1:messageType data2:value];
}

@end
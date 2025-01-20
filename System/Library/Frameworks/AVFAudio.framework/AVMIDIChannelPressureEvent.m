@interface AVMIDIChannelPressureEvent
- (AVMIDIChannelPressureEvent)initWithChannel:(UInt32)channel pressure:(UInt32)pressure;
- (AVMIDIChannelPressureEvent)initWithMessage:(MIDIChannelMessage *)a3;
- (UInt32)pressure;
- (void)setPressure:(UInt32)pressure;
@end

@implementation AVMIDIChannelPressureEvent

- (AVMIDIChannelPressureEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMIDIChannelPressureEvent;
  return [(AVMIDIChannelEvent *)&v4 initWithMessage:a3];
}

- (void)setPressure:(UInt32)pressure
{
}

- (UInt32)pressure
{
  return [(AVMIDIChannelEvent *)self data1];
}

- (AVMIDIChannelPressureEvent)initWithChannel:(UInt32)channel pressure:(UInt32)pressure
{
  v5.receiver = self;
  v5.super_class = (Class)AVMIDIChannelPressureEvent;
  return [(AVMIDIChannelEvent *)&v5 initWithChannel:channel status:208 data1:pressure data2:0];
}

@end
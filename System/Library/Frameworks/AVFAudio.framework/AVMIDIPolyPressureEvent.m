@interface AVMIDIPolyPressureEvent
- (AVMIDIPolyPressureEvent)initWithChannel:(UInt32)channel key:(UInt32)key pressure:(UInt32)pressure;
- (AVMIDIPolyPressureEvent)initWithMessage:(MIDIChannelMessage *)a3;
- (UInt32)key;
- (UInt32)pressure;
- (void)setKey:(UInt32)key;
- (void)setPressure:(UInt32)pressure;
@end

@implementation AVMIDIPolyPressureEvent

- (AVMIDIPolyPressureEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMIDIPolyPressureEvent;
  return [(AVMIDIChannelEvent *)&v4 initWithMessage:a3];
}

- (void)setPressure:(UInt32)pressure
{
}

- (UInt32)pressure
{
  return [(AVMIDIChannelEvent *)self data2];
}

- (void)setKey:(UInt32)key
{
}

- (UInt32)key
{
  return [(AVMIDIChannelEvent *)self data1];
}

- (AVMIDIPolyPressureEvent)initWithChannel:(UInt32)channel key:(UInt32)key pressure:(UInt32)pressure
{
  v6.receiver = self;
  v6.super_class = (Class)AVMIDIPolyPressureEvent;
  return [(AVMIDIChannelEvent *)&v6 initWithChannel:channel status:160 data1:key data2:pressure];
}

@end
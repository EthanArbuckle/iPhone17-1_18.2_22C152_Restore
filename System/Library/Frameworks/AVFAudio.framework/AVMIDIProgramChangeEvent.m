@interface AVMIDIProgramChangeEvent
- (AVMIDIProgramChangeEvent)initWithChannel:(UInt32)channel programNumber:(UInt32)programNumber;
- (AVMIDIProgramChangeEvent)initWithMessage:(MIDIChannelMessage *)a3;
- (UInt32)programNumber;
- (void)setProgramNumber:(UInt32)programNumber;
@end

@implementation AVMIDIProgramChangeEvent

- (AVMIDIProgramChangeEvent)initWithMessage:(MIDIChannelMessage *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVMIDIProgramChangeEvent;
  return [(AVMIDIChannelEvent *)&v4 initWithMessage:a3];
}

- (void)setProgramNumber:(UInt32)programNumber
{
}

- (UInt32)programNumber
{
  return [(AVMIDIChannelEvent *)self data1];
}

- (AVMIDIProgramChangeEvent)initWithChannel:(UInt32)channel programNumber:(UInt32)programNumber
{
  v5.receiver = self;
  v5.super_class = (Class)AVMIDIProgramChangeEvent;
  return [(AVMIDIChannelEvent *)&v5 initWithChannel:channel status:192 data1:programNumber data2:0];
}

@end
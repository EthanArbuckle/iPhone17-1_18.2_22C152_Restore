@interface NSNumber(AXMIDIExtras)
- (uint64_t)MIDIDevice;
- (uint64_t)MIDIEndpoint;
- (uint64_t)MIDIEntity;
- (uint64_t)MIDIObject;
@end

@implementation NSNumber(AXMIDIExtras)

- (uint64_t)MIDIObject
{
  return [a1 unsignedIntegerValue];
}

- (uint64_t)MIDIDevice
{
  return [a1 unsignedIntegerValue];
}

- (uint64_t)MIDIEntity
{
  return [a1 unsignedIntegerValue];
}

- (uint64_t)MIDIEndpoint
{
  return [a1 unsignedIntegerValue];
}

@end
@interface AVCPacketFilter
- (BOOL)isMatchedPacket:(const void *)a3 size:(int)a4;
- (BOOL)isRTPFilter;
@end

@implementation AVCPacketFilter

- (BOOL)isMatchedPacket:(const void *)a3 size:(int)a4
{
}

- (BOOL)isRTPFilter
{
  return self->_isRTPFilter;
}

@end
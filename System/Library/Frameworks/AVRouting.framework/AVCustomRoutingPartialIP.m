@interface AVCustomRoutingPartialIP
- (AVCustomRoutingPartialIP)initWithAddress:(NSData *)address mask:(NSData *)mask;
- (NSData)address;
- (NSData)mask;
- (void)dealloc;
@end

@implementation AVCustomRoutingPartialIP

- (AVCustomRoutingPartialIP)initWithAddress:(NSData *)address mask:(NSData *)mask
{
  v8.receiver = self;
  v8.super_class = (Class)AVCustomRoutingPartialIP;
  v6 = [(AVCustomRoutingPartialIP *)&v8 init];
  if (v6)
  {
    v6->_address = address;
    v6->_mask = mask;
  }
  return v6;
}

- (void)dealloc
{
  self->_address = 0;
  self->_mask = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVCustomRoutingPartialIP;
  [(AVCustomRoutingPartialIP *)&v3 dealloc];
}

- (NSData)address
{
  return self->_address;
}

- (NSData)mask
{
  return self->_mask;
}

@end
@interface _TKSmartCardSlotReservation
- (BOOL)exclusive;
- (NSNumber)protocols;
- (void)setExclusive:(BOOL)a3;
- (void)setProtocols:(id)a3;
@end

@implementation _TKSmartCardSlotReservation

- (NSNumber)protocols
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProtocols:(id)a3
{
}

- (BOOL)exclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)a3
{
  self->_exclusive = a3;
}

- (void).cxx_destruct
{
}

@end
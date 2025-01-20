@interface CTXPCSlotIDPlaceholder
- (CTXPCSlotIDPlaceholder)initWithSlot:(int)a3;
- (int)slot;
- (void)setSlot:(int)a3;
@end

@implementation CTXPCSlotIDPlaceholder

- (int)slot
{
  return self->_slot;
}

- (CTXPCSlotIDPlaceholder)initWithSlot:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CTXPCSlotIDPlaceholder;
  result = [(CTXPCSlotIDPlaceholder *)&v5 init];
  if (result) {
    result->_slot = a3;
  }
  return result;
}

- (void)setSlot:(int)a3
{
  self->_slot = a3;
}

@end
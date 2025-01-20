@interface HUCharacteristicEventUnknownItem
- (NSSet)services;
- (id)accessories;
@end

@implementation HUCharacteristicEventUnknownItem

- (NSSet)services
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (id)accessories
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

@end
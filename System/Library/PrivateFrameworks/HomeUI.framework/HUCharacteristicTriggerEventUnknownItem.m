@interface HUCharacteristicTriggerEventUnknownItem
- (NSSet)services;
- (id)accessories;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUCharacteristicTriggerEventUnknownItem

- (NSSet)services
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (id)accessories
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();

  return objc_alloc_init(v3);
}

@end
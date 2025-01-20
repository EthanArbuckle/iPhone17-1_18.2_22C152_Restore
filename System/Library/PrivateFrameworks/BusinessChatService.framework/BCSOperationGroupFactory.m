@interface BCSOperationGroupFactory
- (id)makeOperationGroup;
@end

@implementation BCSOperationGroupFactory

- (id)makeOperationGroup
{
  id v2 = objc_alloc_init(MEMORY[0x263EFD780]);

  return v2;
}

@end
@interface BCSQueryOperationFactory
- (id)makeQueryOperation;
@end

@implementation BCSQueryOperationFactory

- (id)makeQueryOperation
{
  id v2 = objc_alloc_init(MEMORY[0x263EFD7C0]);

  return v2;
}

@end
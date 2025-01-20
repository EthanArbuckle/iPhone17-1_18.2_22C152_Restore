@interface CRKConcreteIDSAddressTranslator
- (id)destinationAddressForAppleID:(id)a3;
@end

@implementation CRKConcreteIDSAddressTranslator

- (id)destinationAddressForAppleID:(id)a3
{
  v3 = (void *)MEMORY[0x22A620140](a3, a2);

  return v3;
}

@end
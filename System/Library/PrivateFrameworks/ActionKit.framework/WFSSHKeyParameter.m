@interface WFSSHKeyParameter
- (Class)singleStateClass;
- (id)defaultSerializedRepresentation;
@end

@implementation WFSSHKeyParameter

- (id)defaultSerializedRepresentation
{
  return (id)MEMORY[0x263EFFA78];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end
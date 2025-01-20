@interface WFSSHKeyParameterState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (WFPropertyListObject)serializedRepresentation;
- (WFSSHKeyParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFSSHKeyParameterState

- (WFPropertyListObject)serializedRepresentation
{
  return (WFPropertyListObject *)MEMORY[0x263EFFA78];
}

- (WFSSHKeyParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  v6 = (WFSSHKeyParameterState *)objc_alloc_init((Class)objc_opt_class());

  return v6;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)WFSSHKeyParameterState;
  return [(WFSSHKeyParameterState *)&v3 hash];
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFSSHKeyParameterState;
  return [(WFSSHKeyParameterState *)&v4 isEqual:a3];
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
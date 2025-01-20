@interface BKSSecureModeViolation
- (BKSSecureModeViolation)initWithProcessId:(id)a3 contextIds:(id)a4;
- (NSArray)contextIds;
- (NSDictionary)layerNamesByContext;
- (NSNumber)processId;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setContextIds:(id)a3;
- (void)setLayerNamesByContext:(id)a3;
- (void)setProcessId:(id)a3;
@end

@implementation BKSSecureModeViolation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerNamesByContext, 0);
  objc_storeStrong((id *)&self->_contextIds, 0);
  objc_storeStrong((id *)&self->_processId, 0);
}

- (void)setLayerNamesByContext:(id)a3
{
}

- (NSDictionary)layerNamesByContext
{
  return self->_layerNamesByContext;
}

- (void)setContextIds:(id)a3
{
}

- (NSArray)contextIds
{
  return self->_contextIds;
}

- (void)setProcessId:(id)a3
{
}

- (NSNumber)processId
{
  return self->_processId;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(BKSSecureModeViolation *)self succinctDescriptionBuilder];
  [v5 appendDictionarySection:self->_layerNamesByContext withName:@"layerNamesByContext" multilinePrefix:v4 skipIfEmpty:1];

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSSecureModeViolation *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[NSNumber integerValue](self->_processId, "integerValue"), @"processId");
  [v3 appendArraySection:self->_contextIds withName:@"contextIds" skipIfEmpty:1 objectTransformer:&__block_literal_global_4583];
  return v3;
}

uint64_t __52__BKSSecureModeViolation_succinctDescriptionBuilder__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"0x%x", objc_msgSend(a2, "unsignedIntValue"));
}

- (id)succinctDescription
{
  v2 = [(BKSSecureModeViolation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(BKSSecureModeViolation *)self descriptionWithMultilinePrefix:0];
}

- (BKSSecureModeViolation)initWithProcessId:(id)a3 contextIds:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKSSecureModeViolation;
  v9 = [(BKSSecureModeViolation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processId, a3);
    uint64_t v11 = [v8 copy];
    contextIds = v10->_contextIds;
    v10->_contextIds = (NSArray *)v11;
  }
  return v10;
}

@end
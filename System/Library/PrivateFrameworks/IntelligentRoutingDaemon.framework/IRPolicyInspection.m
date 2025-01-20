@interface IRPolicyInspection
- (IRPolicyInspection)initWithName:(id)a3;
- (NSDictionary)generatorNegativeInputs;
- (NSSet)candidates;
- (NSString)name;
- (int64_t)stateMachineClassification;
- (void)addCandidate:(id)a3;
- (void)setGeneratorNegativeInputs:(id)a3;
- (void)setStateMachineClassification:(int64_t)a3;
@end

@implementation IRPolicyInspection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_generatorNegativeInputs, 0);

  objc_storeStrong((id *)&self->_internalCandidates, 0);
}

- (IRPolicyInspection)initWithName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRPolicyInspection;
  v6 = [(IRPolicyInspection *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    internalCandidates = v6->_internalCandidates;
    v6->_internalCandidates = (NSMutableSet *)v7;

    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v6;
}

- (void)setStateMachineClassification:(int64_t)a3
{
  self->_stateMachineClassification = a3;
}

- (void)setGeneratorNegativeInputs:(id)a3
{
}

- (void)addCandidate:(id)a3
{
}

- (NSSet)candidates
{
  v2 = (void *)[(NSMutableSet *)self->_internalCandidates copy];

  return (NSSet *)v2;
}

- (NSDictionary)generatorNegativeInputs
{
  return self->_generatorNegativeInputs;
}

- (int64_t)stateMachineClassification
{
  return self->_stateMachineClassification;
}

- (NSString)name
{
  return self->_name;
}

@end
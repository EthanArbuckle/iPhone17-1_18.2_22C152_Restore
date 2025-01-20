@interface MPCPolicyEvaluation
- (BOOL)canBeOverriden;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldDisableVocalAttenuation;
- (NSString)explanation;
- (int64_t)policyType;
- (void)setCanBeOverriden:(BOOL)a3;
- (void)setDisableVocalAttenuation:(BOOL)a3;
- (void)setExplanation:(id)a3;
- (void)setPolicyType:(int64_t)a3;
@end

@implementation MPCPolicyEvaluation

- (void).cxx_destruct
{
}

- (void)setCanBeOverriden:(BOOL)a3
{
  self->_canBeOverriden = a3;
}

- (BOOL)canBeOverriden
{
  return self->_canBeOverriden;
}

- (void)setExplanation:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setPolicyType:(int64_t)a3
{
  self->_policyType = a3;
}

- (int64_t)policyType
{
  return self->_policyType;
}

- (void)setDisableVocalAttenuation:(BOOL)a3
{
  self->_disableVocalAttenuation = a3;
}

- (BOOL)shouldDisableVocalAttenuation
{
  return self->_disableVocalAttenuation;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPCPolicyEvaluation *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_policyType == v4->_policyType;
  }

  return v5;
}

@end
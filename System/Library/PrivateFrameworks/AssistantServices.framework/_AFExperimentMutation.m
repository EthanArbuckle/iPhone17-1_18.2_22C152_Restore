@interface _AFExperimentMutation
- (BOOL)isDirty;
- (_AFExperimentMutation)initWithBase:(id)a3;
- (id)getConfigurationIdentifier;
- (id)getConfigurationVersion;
- (id)getDeploymentGroupIdentifier;
- (id)getDeploymentGroupProperties;
- (int64_t)getDeploymentReason;
- (void)setConfigurationIdentifier:(id)a3;
- (void)setConfigurationVersion:(id)a3;
- (void)setDeploymentGroupIdentifier:(id)a3;
- (void)setDeploymentGroupProperties:(id)a3;
- (void)setDeploymentReason:(int64_t)a3;
@end

@implementation _AFExperimentMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentGroupProperties, 0);
  objc_storeStrong((id *)&self->_deploymentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationVersion, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDeploymentReason:(int64_t)a3
{
  self->_deploymentReason = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (int64_t)getDeploymentReason
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0) {
    return self->_deploymentReason;
  }
  else {
    return [(AFExperiment *)self->_base deploymentReason];
  }
}

- (void)setDeploymentGroupProperties:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getDeploymentGroupProperties
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_deploymentGroupProperties;
  }
  else
  {
    v2 = [(AFExperiment *)self->_base deploymentGroupProperties];
  }
  return v2;
}

- (void)setDeploymentGroupIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getDeploymentGroupIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_deploymentGroupIdentifier;
  }
  else
  {
    v2 = [(AFExperiment *)self->_base deploymentGroupIdentifier];
  }
  return v2;
}

- (void)setConfigurationVersion:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getConfigurationVersion
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_configurationVersion;
  }
  else
  {
    v2 = [(AFExperiment *)self->_base configurationVersion];
  }
  return v2;
}

- (void)setConfigurationIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getConfigurationIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_configurationIdentifier;
  }
  else
  {
    v2 = [(AFExperiment *)self->_base configurationIdentifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFExperimentMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentMutation;
  v6 = [(_AFExperimentMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
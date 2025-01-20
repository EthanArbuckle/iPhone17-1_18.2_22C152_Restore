@interface _AFExperimentServerConfigurationInfoMutation
- (BOOL)isDirty;
- (_AFExperimentServerConfigurationInfoMutation)initWithBase:(id)a3;
- (double)getMaxTimeToSync;
- (id)getConfigurationIdentifier;
- (id)getConfigurationURL;
- (void)setConfigurationIdentifier:(id)a3;
- (void)setConfigurationURL:(id)a3;
- (void)setMaxTimeToSync:(double)a3;
@end

@implementation _AFExperimentServerConfigurationInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setMaxTimeToSync:(double)a3
{
  self->_maxTimeToSync = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (double)getMaxTimeToSync
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_maxTimeToSync;
  }
  [(AFExperimentServerConfigurationInfo *)self->_base maxTimeToSync];
  return result;
}

- (void)setConfigurationURL:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getConfigurationURL
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_configurationURL;
  }
  else
  {
    v2 = [(AFExperimentServerConfigurationInfo *)self->_base configurationURL];
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
    v2 = [(AFExperimentServerConfigurationInfo *)self->_base configurationIdentifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFExperimentServerConfigurationInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentServerConfigurationInfoMutation;
  v6 = [(_AFExperimentServerConfigurationInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
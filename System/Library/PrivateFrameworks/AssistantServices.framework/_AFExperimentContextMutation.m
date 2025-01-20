@interface _AFExperimentContextMutation
- (BOOL)isDirty;
- (_AFExperimentContextMutation)initWithBase:(id)a3;
- (id)getExperimentsByConfigurationIdentifier;
- (void)setExperimentsByConfigurationIdentifier:(id)a3;
@end

@implementation _AFExperimentContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentsByConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setExperimentsByConfigurationIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getExperimentsByConfigurationIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_experimentsByConfigurationIdentifier;
  }
  else
  {
    v2 = [(AFExperimentContext *)self->_base experimentsByConfigurationIdentifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFExperimentContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentContextMutation;
  v6 = [(_AFExperimentContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
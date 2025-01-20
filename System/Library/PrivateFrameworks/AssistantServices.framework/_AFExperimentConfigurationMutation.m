@interface _AFExperimentConfigurationMutation
- (BOOL)isDirty;
- (_AFExperimentConfigurationMutation)initWithBase:(id)a3;
- (id)getControlGroup;
- (id)getExperimentGroups;
- (id)getIdentifier;
- (id)getSalt;
- (id)getVersion;
- (int64_t)getType;
- (void)setControlGroup:(id)a3;
- (void)setExperimentGroups:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSalt:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation _AFExperimentConfigurationMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_experimentGroups, 0);
  objc_storeStrong((id *)&self->_controlGroup, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSalt:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x41u;
}

- (id)getSalt
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_salt;
  }
  else
  {
    v2 = [(AFExperimentConfiguration *)self->_base salt];
  }
  return v2;
}

- (void)setExperimentGroups:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getExperimentGroups
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_experimentGroups;
  }
  else
  {
    v2 = [(AFExperimentConfiguration *)self->_base experimentGroups];
  }
  return v2;
}

- (void)setControlGroup:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getControlGroup
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_controlGroup;
  }
  else
  {
    v2 = [(AFExperimentConfiguration *)self->_base controlGroup];
  }
  return v2;
}

- (void)setVersion:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getVersion
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_version;
  }
  else
  {
    v2 = [(AFExperimentConfiguration *)self->_base version];
  }
  return v2;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_identifier;
  }
  else
  {
    v2 = [(AFExperimentConfiguration *)self->_base identifier];
  }
  return v2;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getType
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_type;
  }
  else {
    return [(AFExperimentConfiguration *)self->_base type];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFExperimentConfigurationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentConfigurationMutation;
  v6 = [(_AFExperimentConfigurationMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
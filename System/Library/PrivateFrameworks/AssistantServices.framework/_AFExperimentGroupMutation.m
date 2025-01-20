@interface _AFExperimentGroupMutation
- (BOOL)isDirty;
- (_AFExperimentGroupMutation)initWithBase:(id)a3;
- (id)getIdentifier;
- (id)getProperties;
- (unint64_t)getAllocation;
- (void)setAllocation:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation _AFExperimentGroupMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setProperties:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getProperties
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_properties;
  }
  else
  {
    v2 = [(AFExperimentGroup *)self->_base properties];
  }
  return v2;
}

- (void)setAllocation:(unint64_t)a3
{
  self->_allocation = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getAllocation
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_allocation;
  }
  else {
    return [(AFExperimentGroup *)self->_base allocation];
  }
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_identifier;
  }
  else
  {
    v2 = [(AFExperimentGroup *)self->_base identifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFExperimentGroupMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFExperimentGroupMutation;
  v6 = [(_AFExperimentGroupMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
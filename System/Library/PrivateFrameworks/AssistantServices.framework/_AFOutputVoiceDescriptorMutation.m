@interface _AFOutputVoiceDescriptorMutation
- (BOOL)isDirty;
- (_AFOutputVoiceDescriptorMutation)initWithBase:(id)a3;
- (id)getLocalizedDisplay;
- (id)getLocalizedDisplayWithRegion;
- (void)setLocalizedDisplay:(id)a3;
- (void)setLocalizedDisplayWithRegion:(id)a3;
@end

@implementation _AFOutputVoiceDescriptorMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayWithRegion, 0);
  objc_storeStrong((id *)&self->_localizedDisplay, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setLocalizedDisplayWithRegion:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getLocalizedDisplayWithRegion
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_localizedDisplayWithRegion;
  }
  else
  {
    v2 = [(AFOutputVoiceDescriptor *)self->_base localizedDisplayWithRegion];
  }
  return v2;
}

- (void)setLocalizedDisplay:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getLocalizedDisplay
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_localizedDisplay;
  }
  else
  {
    v2 = [(AFOutputVoiceDescriptor *)self->_base localizedDisplay];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFOutputVoiceDescriptorMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFOutputVoiceDescriptorMutation;
  v6 = [(_AFOutputVoiceDescriptorMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
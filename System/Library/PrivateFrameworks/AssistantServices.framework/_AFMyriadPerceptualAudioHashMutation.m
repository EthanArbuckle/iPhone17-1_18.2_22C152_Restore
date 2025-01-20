@interface _AFMyriadPerceptualAudioHashMutation
- (BOOL)isDirty;
- (_AFMyriadPerceptualAudioHashMutation)initWithBase:(id)a3;
- (id)getData;
- (void)setData:(id)a3;
@end

@implementation _AFMyriadPerceptualAudioHashMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setData:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getData
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_data;
  }
  else
  {
    v2 = [(AFMyriadPerceptualAudioHash *)self->_base data];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFMyriadPerceptualAudioHashMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMyriadPerceptualAudioHashMutation;
  v6 = [(_AFMyriadPerceptualAudioHashMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
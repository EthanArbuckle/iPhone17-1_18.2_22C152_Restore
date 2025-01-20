@interface _AFSpeechTestRequestOptionsMutation
- (BOOL)isDirty;
- (_AFSpeechTestRequestOptionsMutation)initWithBase:(id)a3;
- (id)getJitContext;
- (id)getOverrideModelPath;
- (void)setJitContext:(id)a3;
- (void)setOverrideModelPath:(id)a3;
@end

@implementation _AFSpeechTestRequestOptionsMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideModelPath, 0);
  objc_storeStrong((id *)&self->_jitContext, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setOverrideModelPath:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getOverrideModelPath
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_overrideModelPath;
  }
  else
  {
    v2 = [(AFSpeechTestRequestOptions *)self->_base overrideModelPath];
  }
  return v2;
}

- (void)setJitContext:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getJitContext
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_jitContext;
  }
  else
  {
    v2 = [(AFSpeechTestRequestOptions *)self->_base jitContext];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSpeechTestRequestOptionsMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechTestRequestOptionsMutation;
  v6 = [(_AFSpeechTestRequestOptionsMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
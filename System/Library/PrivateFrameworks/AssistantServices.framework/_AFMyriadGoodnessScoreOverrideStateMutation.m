@interface _AFMyriadGoodnessScoreOverrideStateMutation
- (BOOL)isDirty;
- (_AFMyriadGoodnessScoreOverrideStateMutation)initWithBase:(id)a3;
- (id)getReason;
- (int64_t)getOverrideOption;
- (void)setOverrideOption:(int64_t)a3;
- (void)setReason:(id)a3;
@end

@implementation _AFMyriadGoodnessScoreOverrideStateMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setReason:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getReason
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_reason;
  }
  else
  {
    v2 = [(AFMyriadGoodnessScoreOverrideState *)self->_base reason];
  }
  return v2;
}

- (void)setOverrideOption:(int64_t)a3
{
  self->_overrideOption = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getOverrideOption
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_overrideOption;
  }
  else {
    return [(AFMyriadGoodnessScoreOverrideState *)self->_base overrideOption];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFMyriadGoodnessScoreOverrideStateMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMyriadGoodnessScoreOverrideStateMutation;
  v6 = [(_AFMyriadGoodnessScoreOverrideStateMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
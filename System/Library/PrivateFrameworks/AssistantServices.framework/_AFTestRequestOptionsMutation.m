@interface _AFTestRequestOptionsMutation
- (BOOL)isDirty;
- (_AFTestRequestOptionsMutation)initWithBase:(id)a3;
- (id)getInputOrigin;
- (id)getIsEyesFree;
- (int64_t)getRequestPath;
- (void)setInputOrigin:(id)a3;
- (void)setIsEyesFree:(id)a3;
- (void)setRequestPath:(int64_t)a3;
@end

@implementation _AFTestRequestOptionsMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isEyesFree, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setIsEyesFree:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getIsEyesFree
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_isEyesFree;
  }
  else
  {
    v2 = [(AFTestRequestOptions *)self->_base isEyesFree];
  }
  return v2;
}

- (void)setInputOrigin:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getInputOrigin
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_inputOrigin;
  }
  else
  {
    v2 = [(AFTestRequestOptions *)self->_base inputOrigin];
  }
  return v2;
}

- (void)setRequestPath:(int64_t)a3
{
  self->_requestPath = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getRequestPath
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_requestPath;
  }
  else {
    return [(AFTestRequestOptions *)self->_base requestPath];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFTestRequestOptionsMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFTestRequestOptionsMutation;
  v6 = [(_AFTestRequestOptionsMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
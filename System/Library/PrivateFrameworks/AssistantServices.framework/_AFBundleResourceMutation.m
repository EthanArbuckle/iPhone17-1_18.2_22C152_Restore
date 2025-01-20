@interface _AFBundleResourceMutation
- (BOOL)isDirty;
- (_AFBundleResourceMutation)initWithBase:(id)a3;
- (id)getExtension;
- (id)getName;
- (void)setExtension:(id)a3;
- (void)setName:(id)a3;
@end

@implementation _AFBundleResourceMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setExtension:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getExtension
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_extension;
  }
  else
  {
    v2 = [(AFBundleResource *)self->_base extension];
  }
  return v2;
}

- (void)setName:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getName
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_name;
  }
  else
  {
    v2 = [(AFBundleResource *)self->_base name];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFBundleResourceMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFBundleResourceMutation;
  v6 = [(_AFBundleResourceMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
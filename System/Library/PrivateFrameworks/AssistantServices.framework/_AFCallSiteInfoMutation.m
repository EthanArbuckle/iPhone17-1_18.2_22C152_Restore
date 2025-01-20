@interface _AFCallSiteInfoMutation
- (BOOL)isDirty;
- (_AFCallSiteInfoMutation)initWithBase:(id)a3;
- (id)getImagePath;
- (id)getSymbolName;
- (void)setImagePath:(id)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation _AFCallSiteInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSymbolName:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setImagePath:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFCallSiteInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCallSiteInfoMutation;
  v6 = [(_AFCallSiteInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

- (id)getSymbolName
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_symbolName;
  }
  else
  {
    v2 = [(AFCallSiteInfo *)self->_base symbolName];
  }
  return v2;
}

- (id)getImagePath
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_imagePath;
  }
  else
  {
    v2 = [(AFCallSiteInfo *)self->_base imagePath];
  }
  return v2;
}

@end
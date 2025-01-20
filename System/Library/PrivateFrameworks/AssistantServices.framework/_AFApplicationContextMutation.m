@interface _AFApplicationContextMutation
- (BOOL)isDirty;
- (_AFApplicationContextMutation)initWithBase:(id)a3;
- (id)getAceContext;
- (id)getAceContexts;
- (id)getAssociatedBundleIdentifier;
- (id)getBulletin;
- (id)getContextDictionary;
- (void)setAceContext:(id)a3;
- (void)setAceContexts:(id)a3;
- (void)setAssociatedBundleIdentifier:(id)a3;
- (void)setBulletin:(id)a3;
- (void)setContextDictionary:(id)a3;
@end

@implementation _AFApplicationContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceContexts, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_storeStrong((id *)&self->_aceContext, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setAceContexts:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getAceContexts
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_aceContexts;
  }
  else
  {
    v2 = [(AFApplicationContext *)self->_base aceContexts];
  }
  return v2;
}

- (void)setContextDictionary:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getContextDictionary
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_contextDictionary;
  }
  else
  {
    v2 = [(AFApplicationContext *)self->_base contextDictionary];
  }
  return v2;
}

- (void)setAceContext:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getAceContext
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_aceContext;
  }
  else
  {
    v2 = [(AFApplicationContext *)self->_base aceContext];
  }
  return v2;
}

- (void)setBulletin:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getBulletin
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_bulletin;
  }
  else
  {
    v2 = [(AFApplicationContext *)self->_base bulletin];
  }
  return v2;
}

- (void)setAssociatedBundleIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getAssociatedBundleIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_associatedBundleIdentifier;
  }
  else
  {
    v2 = [(AFApplicationContext *)self->_base associatedBundleIdentifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFApplicationContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFApplicationContextMutation;
  v6 = [(_AFApplicationContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
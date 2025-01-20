@interface _AFEndpointInfoMutation
- (BOOL)isDirty;
- (_AFEndpointInfoMutation)initWithBase:(id)a3;
- (id)getIdentifier;
- (id)getMediaRouteIdentifier;
- (void)setIdentifier:(id)a3;
- (void)setMediaRouteIdentifier:(id)a3;
@end

@implementation _AFEndpointInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setMediaRouteIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getMediaRouteIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_mediaRouteIdentifier;
  }
  else
  {
    v2 = [(AFEndpointInfo *)self->_base mediaRouteIdentifier];
  }
  return v2;
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
    v2 = [(AFEndpointInfo *)self->_base identifier];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFEndpointInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFEndpointInfoMutation;
  v6 = [(_AFEndpointInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
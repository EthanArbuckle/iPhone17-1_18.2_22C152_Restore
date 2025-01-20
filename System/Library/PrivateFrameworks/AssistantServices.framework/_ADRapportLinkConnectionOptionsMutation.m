@interface _ADRapportLinkConnectionOptionsMutation
- (BOOL)isDirty;
- (_ADRapportLinkConnectionOptionsMutation)initWithBase:(id)a3;
- (int64_t)getUsesOnDemandConnection;
- (void)setUsesOnDemandConnection:(int64_t)a3;
@end

@implementation _ADRapportLinkConnectionOptionsMutation

- (void).cxx_destruct
{
}

- (void)setUsesOnDemandConnection:(int64_t)a3
{
  self->_usesOnDemandConnection = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (int64_t)getUsesOnDemandConnection
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_usesOnDemandConnection;
  }
  else {
    return [(ADRapportLinkConnectionOptions *)self->_base usesOnDemandConnection];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADRapportLinkConnectionOptionsMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADRapportLinkConnectionOptionsMutation;
  v6 = [(_ADRapportLinkConnectionOptionsMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
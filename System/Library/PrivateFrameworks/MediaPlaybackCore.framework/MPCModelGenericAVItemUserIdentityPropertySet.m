@interface MPCModelGenericAVItemUserIdentityPropertySet
- (ICUserIdentityProperties)delegatedIdentityProperties;
- (ICUserIdentityProperties)identityProperties;
- (MPCModelGenericAVItemUserIdentityPropertySet)initWithRequestContext:(id)a3 error:(id *)a4;
- (void)setDelegatedIdentityProperties:(id)a3;
- (void)setIdentityProperties:(id)a3;
@end

@implementation MPCModelGenericAVItemUserIdentityPropertySet

- (MPCModelGenericAVItemUserIdentityPropertySet)initWithRequestContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MPCModelGenericAVItemUserIdentityPropertySet;
  v7 = [(MPCModelGenericAVItemUserIdentityPropertySet *)&v18 init];
  if (!v7) {
    goto LABEL_13;
  }
  v8 = [v6 identity];
  if (!v8)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCError", 67, @"No user identity for requestContext: %@", v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  v9 = [v6 identityStore];
  uint64_t v10 = [v9 getPropertiesForUserIdentity:v8 error:a4];
  identityProperties = v7->_identityProperties;
  v7->_identityProperties = (ICUserIdentityProperties *)v10;

  if (!a4 || !*a4)
  {
    v12 = [v6 delegatedIdentity];
    if (v12)
    {
      v13 = [v6 identityStore];
      uint64_t v14 = [v13 getPropertiesForUserIdentity:v12 error:a4];
      delegatedIdentityProperties = v7->_delegatedIdentityProperties;
      v7->_delegatedIdentityProperties = (ICUserIdentityProperties *)v14;

      if (a4)
      {
        if (*a4)
        {

          goto LABEL_11;
        }
      }
    }

LABEL_13:
    v16 = v7;
    goto LABEL_14;
  }
LABEL_11:

  v16 = 0;
LABEL_14:

  return v16;
}

- (ICUserIdentityProperties)identityProperties
{
  return self->_identityProperties;
}

- (ICUserIdentityProperties)delegatedIdentityProperties
{
  return self->_delegatedIdentityProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatedIdentityProperties, 0);

  objc_storeStrong((id *)&self->_identityProperties, 0);
}

- (void)setDelegatedIdentityProperties:(id)a3
{
}

- (void)setIdentityProperties:(id)a3
{
}

@end
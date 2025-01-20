@interface DIIdentityProvisioningSession
- (DIIdentityProvisioningSession)init;
- (_TtC7CoreIDV27IdentityProvisioningSession)provisioningSession;
- (void)generateIdentityProvisioningAttestationsWithCredential:(id)a3 pairingID:(id)a4 completion:(id)a5;
- (void)setProvisioningSession:(id)a3;
@end

@implementation DIIdentityProvisioningSession

- (DIIdentityProvisioningSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)DIIdentityProvisioningSession;
  v2 = [(DIIdentityProvisioningSession *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC7CoreIDV27IdentityProvisioningSession);
    [(DIIdentityProvisioningSession *)v2 setProvisioningSession:v3];
  }
  return v2;
}

- (void)generateIdentityProvisioningAttestationsWithCredential:(id)a3 pairingID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DIIdentityProvisioningSession *)self provisioningSession];
  [v11 generateIdentityProvisioningAttestationsWithCredentialIdentifier:v10 pairingID:v9 completionHandler:v8];
}

- (_TtC7CoreIDV27IdentityProvisioningSession)provisioningSession
{
  return self->_provisioningSession;
}

- (void)setProvisioningSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface DIIdentityProvisioningAttestations
+ (BOOL)supportsSecureCoding;
- (DIIdentityProvisioningAttestations)initWithAuthorizationKeyAttestation:(id)a3 deviceEncryptionKeyAttestation:(id)a4 deviceEncryptionKeyAuthorization:(id)a5 progenitorKeyCASDAttestation:(id)a6 transactionKeys:(id)a7 serverAttestedProvisioningData:(id)a8;
- (DIIdentityProvisioningAttestations)initWithCoder:(id)a3;
- (NSArray)authorizationKeyAttestation;
- (NSArray)deviceEncryptionKeyAttestation;
- (NSArray)transactionKeys;
- (NSData)deviceEncryptionKeyAuthorization;
- (NSData)progenitorKeyCASDAttestation;
- (NSData)serverAttestedProvisioningData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DIIdentityProvisioningAttestations

- (DIIdentityProvisioningAttestations)initWithAuthorizationKeyAttestation:(id)a3 deviceEncryptionKeyAttestation:(id)a4 deviceEncryptionKeyAuthorization:(id)a5 progenitorKeyCASDAttestation:(id)a6 transactionKeys:(id)a7 serverAttestedProvisioningData:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)DIIdentityProvisioningAttestations;
  v18 = [(DIIdentityProvisioningAttestations *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_authorizationKeyAttestation, a3);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAttestation, a4);
    objc_storeStrong((id *)&v19->_deviceEncryptionKeyAuthorization, a5);
    objc_storeStrong((id *)&v19->_progenitorKeyCASDAttestation, a6);
    objc_storeStrong((id *)&v19->_transactionKeys, a7);
    objc_storeStrong((id *)&v19->_serverAttestedProvisioningData, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DIIdentityProvisioningAttestations *)self authorizationKeyAttestation];
  [v4 encodeObject:v5 forKey:@"authorizationKeyAttestation"];

  v6 = [(DIIdentityProvisioningAttestations *)self deviceEncryptionKeyAttestation];
  [v4 encodeObject:v6 forKey:@"deviceEncryptionKeyAttestation"];

  v7 = [(DIIdentityProvisioningAttestations *)self deviceEncryptionKeyAuthorization];
  [v4 encodeObject:v7 forKey:@"deviceEncryptionKeyAuthorization"];

  v8 = [(DIIdentityProvisioningAttestations *)self progenitorKeyCASDAttestation];
  [v4 encodeObject:v8 forKey:@"progenitorKeyCASDAttestation"];

  v9 = [(DIIdentityProvisioningAttestations *)self transactionKeys];
  [v4 encodeObject:v9 forKey:@"transactionKeys"];

  id v10 = [(DIIdentityProvisioningAttestations *)self serverAttestedProvisioningData];
  [v4 encodeObject:v10 forKey:@"serverAttestedProvisioningData"];
}

- (DIIdentityProvisioningAttestations)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DIIdentityProvisioningAttestations;
  v5 = [(DIIdentityProvisioningAttestations *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"authorizationKeyAttestation"];
    authorizationKeyAttestation = v5->_authorizationKeyAttestation;
    v5->_authorizationKeyAttestation = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"deviceEncryptionKeyAttestation"];
    deviceEncryptionKeyAttestation = v5->_deviceEncryptionKeyAttestation;
    v5->_deviceEncryptionKeyAttestation = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"deviceEncryptionKeyAuthorization"];
    deviceEncryptionKeyAuthorization = v5->_deviceEncryptionKeyAuthorization;
    v5->_deviceEncryptionKeyAuthorization = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"progenitorKeyCASDAttestation"];
    progenitorKeyCASDAttestation = v5->_progenitorKeyCASDAttestation;
    v5->_progenitorKeyCASDAttestation = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"transactionKeys"];
    transactionKeys = v5->_transactionKeys;
    v5->_transactionKeys = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"serverAttestedProvisioningData"];
    serverAttestedProvisioningData = v5->_serverAttestedProvisioningData;
    v5->_serverAttestedProvisioningData = (NSData *)v16;
  }
  return v5;
}

- (NSArray)authorizationKeyAttestation
{
  return self->_authorizationKeyAttestation;
}

- (NSArray)deviceEncryptionKeyAttestation
{
  return self->_deviceEncryptionKeyAttestation;
}

- (NSData)deviceEncryptionKeyAuthorization
{
  return self->_deviceEncryptionKeyAuthorization;
}

- (NSData)progenitorKeyCASDAttestation
{
  return self->_progenitorKeyCASDAttestation;
}

- (NSArray)transactionKeys
{
  return self->_transactionKeys;
}

- (NSData)serverAttestedProvisioningData
{
  return self->_serverAttestedProvisioningData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverAttestedProvisioningData, 0);
  objc_storeStrong((id *)&self->_transactionKeys, 0);
  objc_storeStrong((id *)&self->_progenitorKeyCASDAttestation, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeyAuthorization, 0);
  objc_storeStrong((id *)&self->_deviceEncryptionKeyAttestation, 0);
  objc_storeStrong((id *)&self->_authorizationKeyAttestation, 0);
}

@end
@interface HAPAccessoryPairingRequest
- (BOOL)doNetworkScan;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOwnerPairing;
- (BOOL)requiresUserConsent;
- (HAPPairingIdentity)pairingIdentity;
- (NSData)ownershipToken;
- (NSData)psk;
- (NSNumber)chipFabricID;
- (NSString)isoCountryCode;
- (NSString)ssid;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setChipFabricID:(id)a3;
- (void)setDoNetworkScan:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setOwnerPairing:(BOOL)a3;
- (void)setOwnershipToken:(id)a3;
- (void)setPairingIdentity:(id)a3;
- (void)setPsk:(id)a3;
- (void)setRequiresUserConsent:(BOOL)a3;
- (void)setSsid:(id)a3;
@end

@implementation HAPAccessoryPairingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chipFabricID, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_psk, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_ownershipToken, 0);

  objc_storeStrong((id *)&self->_pairingIdentity, 0);
}

- (void)setOwnerPairing:(BOOL)a3
{
  self->_ownerPairing = a3;
}

- (BOOL)isOwnerPairing
{
  return self->_ownerPairing;
}

- (void)setDoNetworkScan:(BOOL)a3
{
  self->_doNetworkScan = a3;
}

- (BOOL)doNetworkScan
{
  return self->_doNetworkScan;
}

- (void)setChipFabricID:(id)a3
{
}

- (NSNumber)chipFabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)isoCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPsk:(id)a3
{
}

- (NSData)psk
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSsid:(id)a3
{
}

- (NSString)ssid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOwnershipToken:(id)a3
{
}

- (NSData)ownershipToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setPairingIdentity:(id)a3
{
}

- (HAPPairingIdentity)pairingIdentity
{
  return (HAPPairingIdentity *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HAPAccessoryPairingRequest *)self pairingIdentity];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
    v6 = [(HAPAccessoryPairingRequest *)self pairingIdentity];
    v7 = (void *)[v5 initWithName:@"Pairing Identity" value:v6];
    [v3 addObject:v7];
  }
  if ([(HAPAccessoryPairingRequest *)self requiresUserConsent])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HAPAccessoryPairingRequest *)self requiresUserConsent];
    v9 = HMFBooleanToString();
    v10 = (void *)[v8 initWithName:@"Requires User Consent" value:v9];
    [v3 addObject:v10];
  }
  v11 = [(HAPAccessoryPairingRequest *)self ownershipToken];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
    v13 = [(HAPAccessoryPairingRequest *)self ownershipToken];
    v14 = (void *)[v12 initWithName:@"Ownership Token" value:v13];
    [v3 addObject:v14];
  }
  v15 = [(HAPAccessoryPairingRequest *)self ssid];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
    v17 = [(HAPAccessoryPairingRequest *)self ssid];
    v18 = (void *)[v16 initWithName:@"SSID" value:v17];
    [v3 addObject:v18];
  }
  v19 = [(HAPAccessoryPairingRequest *)self psk];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F653F8]);
    v21 = [(HAPAccessoryPairingRequest *)self psk];
    v22 = (void *)[v20 initWithName:@"PSK" value:v21];
    [v3 addObject:v22];
  }
  v23 = [(HAPAccessoryPairingRequest *)self isoCountryCode];

  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F653F8]);
    v25 = [(HAPAccessoryPairingRequest *)self isoCountryCode];
    v26 = (void *)[v24 initWithName:@"ISO Country Code" value:v25];
    [v3 addObject:v26];
  }
  v27 = [(HAPAccessoryPairingRequest *)self chipFabricID];

  if (v27)
  {
    id v28 = objc_alloc(MEMORY[0x1E4F653F8]);
    v29 = [(HAPAccessoryPairingRequest *)self chipFabricID];
    v30 = (void *)[v28 initWithName:@"CHIP Fabric ID" value:v29];
    [v3 addObject:v30];
  }
  if ([(HAPAccessoryPairingRequest *)self doNetworkScan])
  {
    id v31 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HAPAccessoryPairingRequest *)self doNetworkScan];
    v32 = HMFBooleanToString();
    v33 = (void *)[v31 initWithName:@"Do Network Scan" value:v32];
    [v3 addObject:v33];
  }
  v34 = (void *)[v3 copy];

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[HAPAccessoryPairingRequest allocWithZone:a3] init];
  id v5 = [(HAPAccessoryPairingRequest *)self pairingIdentity];
  [(HAPAccessoryPairingRequest *)v4 setPairingIdentity:v5];

  [(HAPAccessoryPairingRequest *)v4 setRequiresUserConsent:[(HAPAccessoryPairingRequest *)self requiresUserConsent]];
  v6 = [(HAPAccessoryPairingRequest *)self ownershipToken];
  [(HAPAccessoryPairingRequest *)v4 setOwnershipToken:v6];

  v7 = [(HAPAccessoryPairingRequest *)self ssid];
  [(HAPAccessoryPairingRequest *)v4 setSsid:v7];

  id v8 = [(HAPAccessoryPairingRequest *)self psk];
  [(HAPAccessoryPairingRequest *)v4 setPsk:v8];

  v9 = [(HAPAccessoryPairingRequest *)self isoCountryCode];
  [(HAPAccessoryPairingRequest *)v4 setIsoCountryCode:v9];

  v10 = [(HAPAccessoryPairingRequest *)self chipFabricID];
  [(HAPAccessoryPairingRequest *)v4 setChipFabricID:v10];

  [(HAPAccessoryPairingRequest *)v4 setDoNetworkScan:[(HAPAccessoryPairingRequest *)self doNetworkScan]];
  return v4;
}

- (unint64_t)hash
{
  v3 = [(HAPAccessoryPairingRequest *)self pairingIdentity];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(HAPAccessoryPairingRequest *)self requiresUserConsent];
  v6 = [(HAPAccessoryPairingRequest *)self ownershipToken];
  uint64_t v7 = v4 ^ [v6 hash] ^ v5;

  id v8 = [(HAPAccessoryPairingRequest *)self ssid];
  uint64_t v9 = [v8 hash];

  v10 = [(HAPAccessoryPairingRequest *)self psk];
  uint64_t v11 = v9 ^ [v10 hash];

  id v12 = [(HAPAccessoryPairingRequest *)self isoCountryCode];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];

  v14 = [(HAPAccessoryPairingRequest *)self chipFabricID];
  uint64_t v15 = [v14 hash];

  return v13 ^ v15 ^ [(HAPAccessoryPairingRequest *)self doNetworkScan];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_13;
  }
  uint64_t v7 = [(HAPAccessoryPairingRequest *)self pairingIdentity];
  id v8 = [v6 pairingIdentity];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_13;
  }
  int v10 = [(HAPAccessoryPairingRequest *)self requiresUserConsent];
  if (v10 != [v6 requiresUserConsent]) {
    goto LABEL_13;
  }
  uint64_t v11 = [(HAPAccessoryPairingRequest *)self ownershipToken];
  id v12 = [v6 ownershipToken];
  int v13 = HMFEqualObjects();

  if (!v13) {
    goto LABEL_13;
  }
  v14 = [(HAPAccessoryPairingRequest *)self ssid];
  uint64_t v15 = [v6 ssid];
  int v16 = HMFEqualObjects();

  if (!v16) {
    goto LABEL_13;
  }
  v17 = [(HAPAccessoryPairingRequest *)self psk];
  v18 = [v6 psk];
  int v19 = HMFEqualObjects();

  if (!v19) {
    goto LABEL_13;
  }
  id v20 = [(HAPAccessoryPairingRequest *)self isoCountryCode];
  v21 = [v6 isoCountryCode];
  int v22 = HMFEqualObjects();

  if (!v22) {
    goto LABEL_13;
  }
  v23 = [(HAPAccessoryPairingRequest *)self chipFabricID];
  id v24 = [v6 chipFabricID];
  int v25 = HMFEqualObjects();

  if (v25)
  {
    BOOL v26 = [(HAPAccessoryPairingRequest *)self doNetworkScan];
    int v27 = v26 ^ [v6 doNetworkScan] ^ 1;
  }
  else
  {
LABEL_13:
    LOBYTE(v27) = 0;
  }

  return v27;
}

@end
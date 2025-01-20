@interface HMMTRFabricDataSnapshot
- (HMMTRFabricDataSnapshot)initWithRootPublicKey:(id)a3 fabricID:(id)a4 ipk:(id)a5 residentNodeID:(id)a6 rootKeyPair:(id)a7 rootCert:(id)a8;
- (HMMTRMatterKeypair)rootKeyPair;
- (NSData)ipk;
- (NSData)rootCert;
- (NSData)rootPublicKey;
- (NSNumber)fabricID;
- (NSNumber)residentNodeID;
@end

@implementation HMMTRFabricDataSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootCert, 0);
  objc_storeStrong((id *)&self->_rootKeyPair, 0);
  objc_storeStrong((id *)&self->_residentNodeID, 0);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
}

- (NSData)rootCert
{
  return self->_rootCert;
}

- (HMMTRMatterKeypair)rootKeyPair
{
  return self->_rootKeyPair;
}

- (NSNumber)residentNodeID
{
  return self->_residentNodeID;
}

- (NSData)ipk
{
  return self->_ipk;
}

- (NSNumber)fabricID
{
  return self->_fabricID;
}

- (NSData)rootPublicKey
{
  return self->_rootPublicKey;
}

- (HMMTRFabricDataSnapshot)initWithRootPublicKey:(id)a3 fabricID:(id)a4 ipk:(id)a5 residentNodeID:(id)a6 rootKeyPair:(id)a7 rootCert:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HMMTRFabricDataSnapshot;
  v20 = [(HMMTRFabricDataSnapshot *)&v30 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    rootPublicKey = v20->_rootPublicKey;
    v20->_rootPublicKey = (NSData *)v21;

    objc_storeStrong((id *)&v20->_fabricID, a4);
    uint64_t v23 = [v16 copy];
    ipk = v20->_ipk;
    v20->_ipk = (NSData *)v23;

    objc_storeStrong((id *)&v20->_residentNodeID, a6);
    uint64_t v25 = [v18 copyV0KeyPair];
    rootKeyPair = v20->_rootKeyPair;
    v20->_rootKeyPair = (HMMTRMatterKeypair *)v25;

    uint64_t v27 = [v19 copy];
    rootCert = v20->_rootCert;
    v20->_rootCert = (NSData *)v27;
  }
  return v20;
}

@end
@interface HMMTRCachedFabricCertificateData
- (HMMTRCachedFabricCertificateData)initWithFabricID:(id)a3 rootCert:(id)a4 operationalCert:(id)a5 ownerNode:(id)a6 ipk:(id)a7;
- (NSData)ipk;
- (NSData)operationalCert;
- (NSData)rootCert;
- (NSNumber)fabricID;
- (NSNumber)ownerNode;
@end

@implementation HMMTRCachedFabricCertificateData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_ownerNode, 0);
  objc_storeStrong((id *)&self->_operationalCert, 0);
  objc_storeStrong((id *)&self->_rootCert, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
}

- (NSData)ipk
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)ownerNode
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)operationalCert
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)rootCert
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)fabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (HMMTRCachedFabricCertificateData)initWithFabricID:(id)a3 rootCert:(id)a4 operationalCert:(id)a5 ownerNode:(id)a6 ipk:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMMTRCachedFabricCertificateData;
  v17 = [(HMMTRCachedFabricCertificateData *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fabricID, a3);
    objc_storeStrong((id *)&v18->_rootCert, a4);
    objc_storeStrong((id *)&v18->_operationalCert, a5);
    objc_storeStrong((id *)&v18->_ownerNode, a6);
    objc_storeStrong((id *)&v18->_ipk, a7);
  }

  return v18;
}

@end
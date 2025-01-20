@interface UARPPayloadPersonalizationInfo
- (NSData)manifest;
- (NSData)nonce;
- (NSData)personalizedData;
- (NSData)personalizedMetaData;
- (NSDictionary)tssOptions;
- (NSMutableArray)trimmedTlvs;
- (NSNumber)boardID;
- (NSNumber)chipID;
- (NSNumber)ecID;
- (NSNumber)productionMode;
- (NSNumber)securityDomain;
- (NSNumber)securityMode;
- (NSString)keyManifest;
- (UARPPayloadPersonalizationInfo)init;
- (unint64_t)unitNumber;
- (void)setBoardID:(id)a3;
- (void)setChipID:(id)a3;
- (void)setEcID:(id)a3;
- (void)setKeyManifest:(id)a3;
- (void)setManifest:(id)a3;
- (void)setNonce:(id)a3;
- (void)setPersonalizedData:(id)a3;
- (void)setPersonalizedMetaData:(id)a3;
- (void)setProductionMode:(id)a3;
- (void)setSecurityDomain:(id)a3;
- (void)setSecurityMode:(id)a3;
- (void)setTrimmedTlvs:(id)a3;
- (void)setTssOptions:(id)a3;
- (void)setUnitNumber:(unint64_t)a3;
@end

@implementation UARPPayloadPersonalizationInfo

- (UARPPayloadPersonalizationInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)UARPPayloadPersonalizationInfo;
  v2 = [(UARPPayloadPersonalizationInfo *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    trimmedTlvs = v2->_trimmedTlvs;
    v2->_trimmedTlvs = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    tssOptions = v2->_tssOptions;
    v2->_tssOptions = (NSDictionary *)v5;
  }
  return v2;
}

- (unint64_t)unitNumber
{
  return self->_unitNumber;
}

- (void)setUnitNumber:(unint64_t)a3
{
  self->_unitNumber = a3;
}

- (NSString)keyManifest
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeyManifest:(id)a3
{
}

- (NSNumber)boardID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBoardID:(id)a3
{
}

- (NSNumber)chipID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChipID:(id)a3
{
}

- (NSNumber)ecID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEcID:(id)a3
{
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNonce:(id)a3
{
}

- (NSNumber)productionMode
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProductionMode:(id)a3
{
}

- (NSNumber)securityDomain
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSecurityDomain:(id)a3
{
}

- (NSNumber)securityMode
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSecurityMode:(id)a3
{
}

- (NSDictionary)tssOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTssOptions:(id)a3
{
}

- (NSData)manifest
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setManifest:(id)a3
{
}

- (NSData)personalizedData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPersonalizedData:(id)a3
{
}

- (NSMutableArray)trimmedTlvs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTrimmedTlvs:(id)a3
{
}

- (NSData)personalizedMetaData
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPersonalizedMetaData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizedMetaData, 0);
  objc_storeStrong((id *)&self->_trimmedTlvs, 0);
  objc_storeStrong((id *)&self->_personalizedData, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_tssOptions, 0);
  objc_storeStrong((id *)&self->_securityMode, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_productionMode, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ecID, 0);
  objc_storeStrong((id *)&self->_chipID, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_keyManifest, 0);
}

@end
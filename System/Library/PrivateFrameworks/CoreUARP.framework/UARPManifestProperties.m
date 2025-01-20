@interface UARPManifestProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)effectiveProductionMode;
- (BOOL)effectiveSecurityMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)productionMode;
- (BOOL)securityMode;
- (BOOL)supportsImg4;
- (NSData)nonce;
- (NSNumber)chipEpoch;
- (NSNumber)ecID;
- (NSNumber)enableMixMatch;
- (UARPManifestProperties)initWithBoardID:(unsigned int)a3 chipID:(unsigned int)a4 securityDomain:(unint64_t)a5 securityMode:(BOOL)a6 productionMode:(BOOL)a7;
- (UARPManifestProperties)initWithCoder:(id)a3;
- (const)securityDomainString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)securityDomain;
- (unsigned)boardID;
- (unsigned)chipID;
- (void)encodeWithCoder:(id)a3;
- (void)setChipEpoch:(id)a3;
- (void)setEcID:(id)a3;
- (void)setEffectiveProductionMode:(BOOL)a3;
- (void)setEffectiveSecurityMode:(BOOL)a3;
- (void)setEnableMixMatch:(id)a3;
- (void)setNonce:(id)a3;
- (void)setSupportsImg4:(BOOL)a3;
@end

@implementation UARPManifestProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPManifestProperties)initWithBoardID:(unsigned int)a3 chipID:(unsigned int)a4 securityDomain:(unint64_t)a5 securityMode:(BOOL)a6 productionMode:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)UARPManifestProperties;
  result = [(UARPManifestProperties *)&v13 init];
  if (result)
  {
    result->_boardID = a3;
    result->_chipID = a4;
    result->_securityDomain = a5;
    result->_securityMode = a6;
    result->_productionMode = a7;
  }
  return result;
}

- (UARPManifestProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)UARPManifestProperties;
  v5 = [(UARPManifestProperties *)&v23 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boardID"];
    v5->_boardID = [v6 unsignedIntValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chipID"];
    v5->_chipID = [v7 unsignedIntValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityDomain"];
    v5->_securityDomain = [v8 unsignedIntegerValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityMode"];
    v5->_securityMode = [v9 BOOLValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productionMode"];
    v5->_productionMode = [v10 BOOLValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ecID"];
    ecID = v5->_ecID;
    v5->_ecID = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"chipEpoch"];
    chipEpoch = v5->_chipEpoch;
    v5->_chipEpoch = (NSNumber *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enableMixMatch"];
    enableMixMatch = v5->_enableMixMatch;
    v5->_enableMixMatch = (NSNumber *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectiveProductionMode"];
    v5->_effectiveProductionMode = [v19 BOOLValue];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectiveSecurityMode"];
    v5->_effectiveSecurityMode = [v20 BOOLValue];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsImg4"];
    v5->_supportsImg4 = [v21 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  uint64_t boardID = self->_boardID;
  id v6 = a3;
  v7 = [v4 numberWithUnsignedInt:boardID];
  [v6 encodeObject:v7 forKey:@"boardID"];

  v8 = [NSNumber numberWithUnsignedInt:self->_chipID];
  [v6 encodeObject:v8 forKey:@"chipID"];

  v9 = [NSNumber numberWithUnsignedInteger:self->_securityDomain];
  [v6 encodeObject:v9 forKey:@"securityDomain"];

  v10 = [NSNumber numberWithBool:self->_securityMode];
  [v6 encodeObject:v10 forKey:@"securityMode"];

  uint64_t v11 = [NSNumber numberWithBool:self->_productionMode];
  [v6 encodeObject:v11 forKey:@"productionMode"];

  [v6 encodeObject:self->_ecID forKey:@"ecID"];
  [v6 encodeObject:self->_nonce forKey:@"nonce"];
  [v6 encodeObject:self->_chipEpoch forKey:@"chipEpoch"];
  [v6 encodeObject:self->_enableMixMatch forKey:@"enableMixMatch"];
  v12 = [NSNumber numberWithBool:self->_effectiveProductionMode];
  [v6 encodeObject:v12 forKey:@"effectiveProductionMode"];

  uint64_t v13 = [NSNumber numberWithBool:self->_effectiveSecurityMode];
  [v6 encodeObject:v13 forKey:@"effectiveSecurityMode"];

  id v14 = [NSNumber numberWithBool:self->_supportsImg4];
  [v6 encodeObject:v14 forKey:@"supportsImg4"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UARPManifestProperties);
  v4->_uint64_t boardID = self->_boardID;
  v4->_chipID = self->_chipID;
  v4->_securityDomain = self->_securityDomain;
  v4->_securityMode = self->_securityMode;
  v4->_productionMode = self->_productionMode;
  [(UARPManifestProperties *)v4 setEcID:self->_ecID];
  [(UARPManifestProperties *)v4 setNonce:self->_nonce];
  [(UARPManifestProperties *)v4 setChipEpoch:self->_chipEpoch];
  [(UARPManifestProperties *)v4 setEnableMixMatch:self->_enableMixMatch];
  [(UARPManifestProperties *)v4 setEffectiveProductionMode:self->_effectiveProductionMode];
  [(UARPManifestProperties *)v4 setEffectiveSecurityMode:self->_effectiveSecurityMode];
  [(UARPManifestProperties *)v4 setSupportsImg4:self->_supportsImg4];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPManifestProperties *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      BOOL v22 = 1;
    }
    else
    {
      v5 = v4;
      unsigned int boardID = self->_boardID;
      if (boardID == [(UARPManifestProperties *)v5 boardID]
        && (unsigned int chipID = self->_chipID, chipID == [(UARPManifestProperties *)v5 chipID])
        && (unint64_t securityDomain = self->_securityDomain,
            securityDomain == [(UARPManifestProperties *)v5 securityDomain])
        && (BOOL securityMode = self->_securityMode,
            securityMode == [(UARPManifestProperties *)v5 securityMode])
        && (BOOL productionMode = self->_productionMode,
            productionMode == [(UARPManifestProperties *)v5 productionMode]))
      {
        ecID = self->_ecID;
        v12 = [(UARPManifestProperties *)v5 ecID];
        if (nullableObjectsEqual(ecID, (uint64_t)v12))
        {
          nonce = self->_nonce;
          id v14 = [(UARPManifestProperties *)v5 nonce];
          if (nullableObjectsEqual(nonce, (uint64_t)v14))
          {
            chipEpoch = self->_chipEpoch;
            v16 = [(UARPManifestProperties *)v5 chipEpoch];
            if (nullableObjectsEqual(chipEpoch, (uint64_t)v16))
            {
              enableMixMatch = self->_enableMixMatch;
              v18 = [(UARPManifestProperties *)v5 enableMixMatch];
              if (nullableObjectsEqual(enableMixMatch, (uint64_t)v18)
                && (BOOL effectiveProductionMode = self->_effectiveProductionMode,
                    effectiveProductionMode == [(UARPManifestProperties *)v5 effectiveProductionMode])&& (BOOL effectiveSecurityMode = self->_effectiveSecurityMode, effectiveSecurityMode == [(UARPManifestProperties *)v5 effectiveSecurityMode]))
              {
                BOOL supportsImg4 = self->_supportsImg4;
                BOOL v22 = supportsImg4 == [(UARPManifestProperties *)v5 supportsImg4];
              }
              else
              {
                BOOL v22 = 0;
              }
            }
            else
            {
              BOOL v22 = 0;
            }
          }
          else
          {
            BOOL v22 = 0;
          }
        }
        else
        {
          BOOL v22 = 0;
        }
      }
      else
      {
        BOOL v22 = 0;
      }
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (const)securityDomainString
{
  unint64_t securityDomain = self->_securityDomain;
  if (securityDomain > 3) {
    return "unrecognized";
  }
  else {
    return off_264492E70[securityDomain];
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:", v5];

  objc_msgSend(v6, "appendFormat:", @" boardID=0x%x", self->_boardID);
  objc_msgSend(v6, "appendFormat:", @" chipID=0x%x", self->_chipID);
  ecID = self->_ecID;
  if (ecID) {
    objc_msgSend(v6, "appendFormat:", @" ecID=0x%llx", -[NSNumber unsignedLongLongValue](ecID, "unsignedLongLongValue"));
  }
  if (self->_nonce) {
    [v6 appendFormat:@" nonce=%@", self->_nonce];
  }
  objc_msgSend(v6, "appendFormat:", @" securityDomain=%s", -[UARPManifestProperties securityDomainString](self, "securityDomainString"));
  if (self->_securityMode) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  objc_msgSend(v6, "appendFormat:", @" securityMode=%s", v8);
  if (self->_productionMode) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  objc_msgSend(v6, "appendFormat:", @" productionMode=%s", v9);
  chipEpoch = self->_chipEpoch;
  if (chipEpoch) {
    objc_msgSend(v6, "appendFormat:", @" chipEpoch=0x%x", -[NSNumber unsignedIntValue](chipEpoch, "unsignedIntValue"));
  }
  if (self->_enableMixMatch) {
    [v6 appendFormat:@" enableMixMatch=%@", self->_enableMixMatch];
  }
  [v6 appendString:@">"];
  uint64_t v11 = [NSString stringWithString:v6];

  return v11;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unint64_t)securityDomain
{
  return self->_securityDomain;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (BOOL)productionMode
{
  return self->_productionMode;
}

- (NSNumber)ecID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEcID:(id)a3
{
}

- (NSData)nonce
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNonce:(id)a3
{
}

- (NSNumber)chipEpoch
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setChipEpoch:(id)a3
{
}

- (NSNumber)enableMixMatch
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEnableMixMatch:(id)a3
{
}

- (BOOL)effectiveProductionMode
{
  return self->_effectiveProductionMode;
}

- (void)setEffectiveProductionMode:(BOOL)a3
{
  self->_BOOL effectiveProductionMode = a3;
}

- (BOOL)effectiveSecurityMode
{
  return self->_effectiveSecurityMode;
}

- (void)setEffectiveSecurityMode:(BOOL)a3
{
  self->_BOOL effectiveSecurityMode = a3;
}

- (BOOL)supportsImg4
{
  return self->_supportsImg4;
}

- (void)setSupportsImg4:(BOOL)a3
{
  self->_BOOL supportsImg4 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableMixMatch, 0);
  objc_storeStrong((id *)&self->_chipEpoch, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_ecID, 0);
}

@end
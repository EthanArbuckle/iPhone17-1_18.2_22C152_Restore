@interface NEVPNIKEv2SecurityAssociationParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEVPNIKEv2DiffieHellmanGroup)diffieHellmanGroup;
- (NEVPNIKEv2EncryptionAlgorithm)encryptionAlgorithm;
- (NEVPNIKEv2IntegrityAlgorithm)integrityAlgorithm;
- (NEVPNIKEv2SecurityAssociationParameters)init;
- (NEVPNIKEv2SecurityAssociationParameters)initWithCoder:(id)a3;
- (id)copyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (int32_t)lifetimeMinutes;
- (void)encodeWithCoder:(id)a3;
- (void)setDiffieHellmanGroup:(NEVPNIKEv2DiffieHellmanGroup)diffieHellmanGroup;
- (void)setEncryptionAlgorithm:(NEVPNIKEv2EncryptionAlgorithm)encryptionAlgorithm;
- (void)setIntegrityAlgorithm:(NEVPNIKEv2IntegrityAlgorithm)integrityAlgorithm;
- (void)setLifetimeMinutes:(int32_t)lifetimeMinutes;
@end

@implementation NEVPNIKEv2SecurityAssociationParameters

- (void).cxx_destruct
{
}

- (void)setLifetimeMinutes:(int32_t)lifetimeMinutes
{
  self->_lifetimeMinutes = lifetimeMinutes;
}

- (int32_t)lifetimeMinutes
{
  return self->_lifetimeMinutes;
}

- (void)setDiffieHellmanGroup:(NEVPNIKEv2DiffieHellmanGroup)diffieHellmanGroup
{
  self->_diffieHellmanGroup = diffieHellmanGroup;
}

- (NEVPNIKEv2DiffieHellmanGroup)diffieHellmanGroup
{
  return self->_diffieHellmanGroup;
}

- (void)setIntegrityAlgorithm:(NEVPNIKEv2IntegrityAlgorithm)integrityAlgorithm
{
  self->_integrityAlgorithm = integrityAlgorithm;
}

- (NEVPNIKEv2IntegrityAlgorithm)integrityAlgorithm
{
  return self->_integrityAlgorithm;
}

- (void)setEncryptionAlgorithm:(NEVPNIKEv2EncryptionAlgorithm)encryptionAlgorithm
{
  self->_encryptionAlgorithm = encryptionAlgorithm;
}

- (NEVPNIKEv2EncryptionAlgorithm)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NEVPNIKEv2SecurityAssociationParameters *)self lifetimeMinutes] < 10
    || [(NEVPNIKEv2SecurityAssociationParameters *)self lifetimeMinutes] >= 1441)
  {
    [NSString stringWithFormat:@"Invalid SA life time (%d), valid range is %d to %d inclusive", -[NEVPNIKEv2SecurityAssociationParameters lifetimeMinutes](self, "lifetimeMinutes"), 10, 1440];
    goto LABEL_4;
  }
  if ([(NEVPNIKEv2SecurityAssociationParameters *)self diffieHellmanGroup] != NEVPNIKEv2DiffieHellmanGroup1
    && [(NEVPNIKEv2SecurityAssociationParameters *)self diffieHellmanGroup] != NEVPNIKEv2DiffieHellmanGroup2
    && [(NEVPNIKEv2SecurityAssociationParameters *)self diffieHellmanGroup] != NEVPNIKEv2DiffieHellmanGroup5
    && [(NEVPNIKEv2SecurityAssociationParameters *)self diffieHellmanGroup] != NEVPNIKEv2DiffieHellmanGroup31
    && [(NEVPNIKEv2SecurityAssociationParameters *)self diffieHellmanGroup] != NEVPNIKEv2DiffieHellmanGroup32
    && ([(NEVPNIKEv2SecurityAssociationParameters *)self diffieHellmanGroup] < NEVPNIKEv2DiffieHellmanGroup14
     || [(NEVPNIKEv2SecurityAssociationParameters *)self diffieHellmanGroup] >= (NEVPNIKEv2DiffieHellmanGroup20|NEVPNIKEv2DiffieHellmanGroup2)))
  {
    [NSString stringWithFormat:@"Invalid DH group (%ld), valid values are 1, 2, 5, 14-21, 31, and 32", -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup"), v29, v30];
    goto LABEL_4;
  }
  if (!self) {
    goto LABEL_39;
  }
  BOOL v6 = 1;
  if (objc_getProperty(self, v8, 40, 1))
  {
    if ((unint64_t)objc_msgSend(objc_getProperty(self, v9, 40, 1), "count") < 8)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(objc_getProperty(self, v12, 40, 1), "count") + 1);
      v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup"));
      [v13 addObject:v14];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v16 = objc_getProperty(self, v15, 40, 1);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v17) {
        goto LABEL_38;
      }
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      while (1)
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v31 + 1) + 8 * v20);
          if (!isa_nsnumber(v21))
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Additional key method not a number", v4);
            goto LABEL_41;
          }
          id v22 = v21;
          unint64_t v23 = [v22 integerValue];
          unint64_t v24 = v23;
          BOOL v25 = v23 > 0x20 || ((1 << v23) & 0x180000027) == 0;
          if (v25 && v23 - 22 <= 0xFFFFFFFFFFFFFFF7)
          {
            v28 = [NSString stringWithFormat:@"Invalid KE Method (%ld), valid values are 0, 1, 2, 5, 14-21, 31, and 32", v23];
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v28, v4);

LABEL_41:
            goto LABEL_5;
          }
          if ([v13 containsObject:v22])
          {
            v26 = objc_msgSend(NSString, "stringWithFormat:", @"Duplicated KE method (%ld)", v24);
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v26, v4);
          }
          else if (v24)
          {
            [v13 addObject:v22];
          }

          ++v20;
        }
        while (v18 != v20);
        uint64_t v27 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
        uint64_t v18 = v27;
        if (!v27)
        {
LABEL_38:

LABEL_39:
          BOOL v6 = 1;
          goto LABEL_6;
        }
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Too many additional key methods (%zu > 7)", objc_msgSend(objc_getProperty(self, v10, 40, 1), "count"), v29, v30);
    v5 = LABEL_4:;
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v5, v4);

LABEL_5:
    BOOL v6 = 0;
  }
LABEL_6:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEVPNIKEv2SecurityAssociationParameters allocWithZone:a3] init];
  if (v4)
  {
    [(NEVPNIKEv2SecurityAssociationParameters *)v4 setEncryptionAlgorithm:[(NEVPNIKEv2SecurityAssociationParameters *)self encryptionAlgorithm]];
    [(NEVPNIKEv2SecurityAssociationParameters *)v4 setIntegrityAlgorithm:[(NEVPNIKEv2SecurityAssociationParameters *)self integrityAlgorithm]];
    [(NEVPNIKEv2SecurityAssociationParameters *)v4 setDiffieHellmanGroup:[(NEVPNIKEv2SecurityAssociationParameters *)self diffieHellmanGroup]];
    if (self && objc_getProperty(self, v5, 40, 1))
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
      v8 = objc_msgSend(v6, "initWithArray:copyItems:", objc_getProperty(self, v7, 40, 1), 1);
      objc_setProperty_atomic(v4, v9, v8, 40);
    }
    [(NEVPNIKEv2SecurityAssociationParameters *)v4 setLifetimeMinutes:[(NEVPNIKEv2SecurityAssociationParameters *)self lifetimeMinutes]];
  }
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([(NEVPNIKEv2SecurityAssociationParameters *)self encryptionAlgorithm] == NEVPNIKEv2EncryptionAlgorithmDES)
  {
    v8 = @"DES";
  }
  else if ([(NEVPNIKEv2SecurityAssociationParameters *)self encryptionAlgorithm] == NEVPNIKEv2EncryptionAlgorithm3DES)
  {
    v8 = @"3DES";
  }
  else if ([(NEVPNIKEv2SecurityAssociationParameters *)self encryptionAlgorithm] == NEVPNIKEv2EncryptionAlgorithmAES128)
  {
    v8 = @"AES-128";
  }
  else if ([(NEVPNIKEv2SecurityAssociationParameters *)self encryptionAlgorithm] == NEVPNIKEv2EncryptionAlgorithmAES256)
  {
    v8 = @"AES-256";
  }
  else if ([(NEVPNIKEv2SecurityAssociationParameters *)self encryptionAlgorithm] == NEVPNIKEv2EncryptionAlgorithmAES128GCM)
  {
    v8 = @"AES-128-GCM";
  }
  else if ([(NEVPNIKEv2SecurityAssociationParameters *)self encryptionAlgorithm] == NEVPNIKEv2EncryptionAlgorithmAES256GCM)
  {
    v8 = @"AES-256-GCM";
  }
  else
  {
    if ([(NEVPNIKEv2SecurityAssociationParameters *)self encryptionAlgorithm] != NEVPNIKEv2EncryptionAlgorithmChaCha20Poly1305) {
      goto LABEL_16;
    }
    v8 = @"ChaCha20Poly1305";
  }
  [v7 appendPrettyObject:v8 withName:@"encryptionAlgorithm" andIndent:v5 options:a4];
LABEL_16:
  if ([(NEVPNIKEv2SecurityAssociationParameters *)self integrityAlgorithm] == NEVPNIKEv2IntegrityAlgorithmSHA96)
  {
    SEL v9 = @"SHA1-96";
  }
  else if ([(NEVPNIKEv2SecurityAssociationParameters *)self integrityAlgorithm] == NEVPNIKEv2IntegrityAlgorithmSHA160)
  {
    SEL v9 = @"SHA1-160";
  }
  else if ([(NEVPNIKEv2SecurityAssociationParameters *)self integrityAlgorithm] == NEVPNIKEv2IntegrityAlgorithmSHA256)
  {
    SEL v9 = @"SHA2-256";
  }
  else if ([(NEVPNIKEv2SecurityAssociationParameters *)self integrityAlgorithm] == NEVPNIKEv2IntegrityAlgorithmSHA384)
  {
    SEL v9 = @"SHA2-384";
  }
  else
  {
    if ([(NEVPNIKEv2SecurityAssociationParameters *)self integrityAlgorithm] != NEVPNIKEv2IntegrityAlgorithmSHA512) {
      goto LABEL_27;
    }
    SEL v9 = @"SHA2-512";
  }
  [v7 appendPrettyObject:v9 withName:@"integrityAlgorithm" andIndent:v5 options:a4];
LABEL_27:
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup"), @"diffieHellmanGroup", v5, a4);
  if (self) {
    id Property = objc_getProperty(self, v10, 40, 1);
  }
  else {
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"additionalKeyExchangeMethods" andIndent:v5 options:a4];
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNIKEv2SecurityAssociationParameters lifetimeMinutes](self, "lifetimeMinutes"), @"lifetimeMinutes", v5, a4);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInt32:forKey:", -[NEVPNIKEv2SecurityAssociationParameters encryptionAlgorithm](self, "encryptionAlgorithm"), @"EncryptionAlgorithm");
  objc_msgSend(v6, "encodeInt32:forKey:", -[NEVPNIKEv2SecurityAssociationParameters integrityAlgorithm](self, "integrityAlgorithm"), @"IntegrityAlgorithm");
  objc_msgSend(v6, "encodeInt32:forKey:", -[NEVPNIKEv2SecurityAssociationParameters diffieHellmanGroup](self, "diffieHellmanGroup"), @"DiffieHellmanGroup");
  if (self) {
    id Property = objc_getProperty(self, v4, 40, 1);
  }
  else {
    id Property = 0;
  }
  [v6 encodeObject:Property forKey:@"AdditionalKeyExchangeMethods"];
  objc_msgSend(v6, "encodeInt32:forKey:", -[NEVPNIKEv2SecurityAssociationParameters lifetimeMinutes](self, "lifetimeMinutes"), @"LifeTime");
}

- (NEVPNIKEv2SecurityAssociationParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEVPNIKEv2SecurityAssociationParameters *)self init];
  if (v5)
  {
    v5->_encryptionAlgorithm = (int)[v4 decodeInt32ForKey:@"EncryptionAlgorithm"];
    v5->_integrityAlgorithm = (int)[v4 decodeInt32ForKey:@"IntegrityAlgorithm"];
    v5->_diffieHellmanGroup = (int)[v4 decodeInt32ForKey:@"DiffieHellmanGroup"];
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"AdditionalKeyExchangeMethods"];
    additionalKeyExchangeMethods = v5->_additionalKeyExchangeMethods;
    v5->_additionalKeyExchangeMethods = (NSArray *)v6;

    v5->_lifetimeMinutes = [v4 decodeInt32ForKey:@"LifeTime"];
  }

  return v5;
}

- (NEVPNIKEv2SecurityAssociationParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEVPNIKEv2SecurityAssociationParameters;
  result = [(NEVPNIKEv2SecurityAssociationParameters *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_encryptionAlgorithm = xmmword_19DF9BFB0;
    result->_diffieHellmanGroup = 14;
    result->_lifetimeMinutes = 10;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyDictionary
{
  if (!a1) {
    return 0;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([a1 encryptionAlgorithm] == 1)
  {
    objc_super v3 = kNEIKEv2EncryptionAlgorithmDESValue;
  }
  else if ([a1 encryptionAlgorithm] == 2)
  {
    objc_super v3 = kNEIKEv2EncryptionAlgorithm3DESValue;
  }
  else if ([a1 encryptionAlgorithm] == 3)
  {
    objc_super v3 = kNEIKEv2EncryptionAlgorithmAES128Value;
  }
  else if ([a1 encryptionAlgorithm] == 4)
  {
    objc_super v3 = kNEIKEv2EncryptionAlgorithmAES256Value;
  }
  else if ([a1 encryptionAlgorithm] == 5)
  {
    objc_super v3 = kNEIKEv2EncryptionAlgorithmAES128GCMValue;
  }
  else if ([a1 encryptionAlgorithm] == 6)
  {
    objc_super v3 = kNEIKEv2EncryptionAlgorithmAES256GCMValue;
  }
  else
  {
    if ([a1 encryptionAlgorithm] != 7) {
      goto LABEL_17;
    }
    objc_super v3 = kNEIKEv2EncryptionAlgorithmChaCha20Poly1305Value;
  }
  [v2 setObject:*v3 forKeyedSubscript:@"EncryptionAlgorithm"];
LABEL_17:
  if ([a1 integrityAlgorithm] == 1)
  {
    id v4 = kNEIKEv2IntegrityAlgorithmSHA96Value;
LABEL_27:
    [v2 setObject:*v4 forKeyedSubscript:@"IntegrityAlgorithm"];
    goto LABEL_28;
  }
  if ([a1 integrityAlgorithm] == 2)
  {
    id v4 = kNEIKEv2IntegrityAlgorithmSHA160Value;
    goto LABEL_27;
  }
  if ([a1 integrityAlgorithm] == 3)
  {
    id v4 = kNEIKEv2IntegrityAlgorithmSHA256Value;
    goto LABEL_27;
  }
  if ([a1 integrityAlgorithm] == 4)
  {
    id v4 = kNEIKEv2IntegrityAlgorithmSHA384Value;
    goto LABEL_27;
  }
  if ([a1 integrityAlgorithm] == 5)
  {
    id v4 = kNEIKEv2IntegrityAlgorithmSHA512Value;
    goto LABEL_27;
  }
LABEL_28:
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "diffieHellmanGroup"));
  [v2 setObject:v5 forKeyedSubscript:@"DiffieHellmanGroup"];

  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_getProperty(a1, v6, 40, 1), @"AdditionalKeyExchangeMethods");
  id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "lifetimeMinutes"));
  [v2 setObject:v7 forKeyedSubscript:@"LifeTimeInMinutes"];

  return v2;
}

@end
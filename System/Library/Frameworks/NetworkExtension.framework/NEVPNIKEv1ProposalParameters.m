@interface NEVPNIKEv1ProposalParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEVPNIKEv1ProposalParameters)init;
- (NEVPNIKEv1ProposalParameters)initWithCoder:(id)a3;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (int)diffieHellmanGroup;
- (int)lifetimeSeconds;
- (int64_t)encryptionAlgorithm;
- (int64_t)integrityAlgorithm;
- (void)encodeWithCoder:(id)a3;
- (void)setDiffieHellmanGroup:(int)a3;
- (void)setEncryptionAlgorithm:(int64_t)a3;
- (void)setIntegrityAlgorithm:(int64_t)a3;
- (void)setLifetimeSeconds:(int)a3;
@end

@implementation NEVPNIKEv1ProposalParameters

- (void)setLifetimeSeconds:(int)a3
{
  self->_lifetimeSeconds = a3;
}

- (int)lifetimeSeconds
{
  return self->_lifetimeSeconds;
}

- (void)setDiffieHellmanGroup:(int)a3
{
  self->_diffieHellmanGroup = a3;
}

- (int)diffieHellmanGroup
{
  return self->_diffieHellmanGroup;
}

- (void)setIntegrityAlgorithm:(int64_t)a3
{
  self->_integrityAlgorithm = a3;
}

- (int64_t)integrityAlgorithm
{
  return self->_integrityAlgorithm;
}

- (void)setEncryptionAlgorithm:(int64_t)a3
{
  self->_encryptionAlgorithm = a3;
}

- (int64_t)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NEVPNIKEv1ProposalParameters *)self encryptionAlgorithm] == 1)
  {
    v4 = kNEIKEv1EncryptionAlgorithmDESValue;
  }
  else if ([(NEVPNIKEv1ProposalParameters *)self encryptionAlgorithm] == 2)
  {
    v4 = kNEIKEv1EncryptionAlgorithm3DESValue;
  }
  else if ([(NEVPNIKEv1ProposalParameters *)self encryptionAlgorithm] == 3)
  {
    v4 = kNEIKEv1EncryptionAlgorithmAESValue;
  }
  else
  {
    if ([(NEVPNIKEv1ProposalParameters *)self encryptionAlgorithm] != 4) {
      goto LABEL_10;
    }
    v4 = kNEIKEv1EncryptionAlgorithmAES256Value;
  }
  [v3 setObject:*v4 forKeyedSubscript:@"EncryptionAlgorithm"];
LABEL_10:
  if ([(NEVPNIKEv1ProposalParameters *)self integrityAlgorithm] == 1)
  {
    v5 = kNEIKEv1IntegrityAlgorithmSHA1Value;
LABEL_14:
    [v3 setObject:*v5 forKeyedSubscript:@"HashAlgorithm"];
    goto LABEL_15;
  }
  if ([(NEVPNIKEv1ProposalParameters *)self integrityAlgorithm] == 2)
  {
    v5 = kNEIKEv1IntegrityAlgorithmMD5Value;
    goto LABEL_14;
  }
LABEL_15:
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[NEVPNIKEv1ProposalParameters diffieHellmanGroup](self, "diffieHellmanGroup"));
  [v3 setObject:v6 forKeyedSubscript:@"DHGroup"];

  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"));
  [v3 setObject:v7 forKeyedSubscript:@"Lifetime"];

  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NEVPNIKEv1ProposalParameters;
  v5 = [(NEVPNIKEv1ProposalParameters *)&v31 init];
  if (!v5) {
    goto LABEL_22;
  }
  v6 = [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
  int v7 = isa_nsstring(v6);

  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
    char v9 = [@"DES" isEqualToString:v8];

    if (v9)
    {
      uint64_t v10 = 1;
    }
    else
    {
      v11 = [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
      char v12 = [@"3DES" isEqualToString:v11];

      if (v12)
      {
        uint64_t v10 = 2;
      }
      else
      {
        v13 = [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
        char v14 = [@"AES" isEqualToString:v13];

        if (v14)
        {
          uint64_t v10 = 3;
        }
        else
        {
          v15 = [v4 objectForKeyedSubscript:@"EncryptionAlgorithm"];
          int v16 = [@"AES256" isEqualToString:v15];

          if (!v16) {
            goto LABEL_12;
          }
          uint64_t v10 = 4;
        }
      }
    }
    [(NEVPNIKEv1ProposalParameters *)v5 setEncryptionAlgorithm:v10];
  }
LABEL_12:
  v17 = [v4 objectForKeyedSubscript:@"HashAlgorithm"];
  int v18 = isa_nsstring(v17);

  if (v18)
  {
    v19 = [v4 objectForKeyedSubscript:@"HashAlgorithm"];
    char v20 = [@"SHA1" isEqualToString:v19];

    if (v20)
    {
      uint64_t v21 = 1;
LABEL_17:
      [(NEVPNIKEv1ProposalParameters *)v5 setIntegrityAlgorithm:v21];
      goto LABEL_18;
    }
    v22 = [v4 objectForKeyedSubscript:@"HashAlgorithm"];
    int v23 = [@"MD5" isEqualToString:v22];

    if (v23)
    {
      uint64_t v21 = 2;
      goto LABEL_17;
    }
  }
LABEL_18:
  v24 = [v4 objectForKeyedSubscript:@"DHGroup"];
  int v25 = isa_nsnumber(v24);

  if (v25)
  {
    v26 = [v4 objectForKeyedSubscript:@"DHGroup"];
    -[NEVPNIKEv1ProposalParameters setDiffieHellmanGroup:](v5, "setDiffieHellmanGroup:", [v26 intValue]);
  }
  v27 = [v4 objectForKeyedSubscript:@"Lifetime"];
  int v28 = isa_nsnumber(v27);

  if (v28)
  {
    v29 = [v4 objectForKeyedSubscript:@"Lifetime"];
    -[NEVPNIKEv1ProposalParameters setLifetimeSeconds:](v5, "setLifetimeSeconds:", [v29 intValue]);
  }
LABEL_22:

  return v5;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  if ([(NEVPNIKEv1ProposalParameters *)self lifetimeSeconds] >= 600
    && [(NEVPNIKEv1ProposalParameters *)self lifetimeSeconds] <= 86400)
  {
    BOOL v6 = 1;
  }
  else
  {
    v5 = [NSString stringWithFormat:@"Invalid SA lifetime seconds (%d), valid range is %d to %d inclusive", -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"), 600, 86400];
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v5, v4);

    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEVPNIKEv1ProposalParameters allocWithZone:a3] init];
  if (v4)
  {
    [(NEVPNIKEv1ProposalParameters *)v4 setEncryptionAlgorithm:[(NEVPNIKEv1ProposalParameters *)self encryptionAlgorithm]];
    [(NEVPNIKEv1ProposalParameters *)v4 setIntegrityAlgorithm:[(NEVPNIKEv1ProposalParameters *)self integrityAlgorithm]];
    [(NEVPNIKEv1ProposalParameters *)v4 setDiffieHellmanGroup:[(NEVPNIKEv1ProposalParameters *)self diffieHellmanGroup]];
    [(NEVPNIKEv1ProposalParameters *)v4 setLifetimeSeconds:[(NEVPNIKEv1ProposalParameters *)self lifetimeSeconds]];
  }
  return v4;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([(NEVPNIKEv1ProposalParameters *)self encryptionAlgorithm] == 1)
  {
    v8 = @"DES";
  }
  else if ([(NEVPNIKEv1ProposalParameters *)self encryptionAlgorithm] == 2)
  {
    v8 = @"3DES";
  }
  else if ([(NEVPNIKEv1ProposalParameters *)self encryptionAlgorithm] == 3)
  {
    v8 = @"AES";
  }
  else
  {
    if ([(NEVPNIKEv1ProposalParameters *)self encryptionAlgorithm] != 4) {
      goto LABEL_10;
    }
    v8 = @"AES-256";
  }
  [v7 appendPrettyObject:v8 withName:@"encryptionAlgorithm" andIndent:v5 options:a4];
LABEL_10:
  if ([(NEVPNIKEv1ProposalParameters *)self integrityAlgorithm] == 1)
  {
    char v9 = @"SHA1";
  }
  else
  {
    if ([(NEVPNIKEv1ProposalParameters *)self integrityAlgorithm] != 2) {
      goto LABEL_15;
    }
    char v9 = @"MD5";
  }
  [v7 appendPrettyObject:v9 withName:@"integrityAlgorithm" andIndent:v5 options:a4];
LABEL_15:
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNIKEv1ProposalParameters diffieHellmanGroup](self, "diffieHellmanGroup"), @"diffieHellmanGroup", v5, a4);
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"), @"lifetimeSeconds", v5, a4);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNIKEv1ProposalParameters encryptionAlgorithm](self, "encryptionAlgorithm"), @"LegacyEncryptionAlgorithm");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNIKEv1ProposalParameters integrityAlgorithm](self, "integrityAlgorithm"), @"LegacyIntegrityAlgorithm");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNIKEv1ProposalParameters diffieHellmanGroup](self, "diffieHellmanGroup"), @"LegacyDiffieHellmanGroup");
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEVPNIKEv1ProposalParameters lifetimeSeconds](self, "lifetimeSeconds"), @"LegacyLifeTime");
}

- (NEVPNIKEv1ProposalParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEVPNIKEv1ProposalParameters *)self init];
  if (v5)
  {
    v5->_encryptionAlgorithm = (int)[v4 decodeInt32ForKey:@"LegacyEncryptionAlgorithm"];
    v5->_integrityAlgorithm = (int)[v4 decodeInt32ForKey:@"LegacyIntegrityAlgorithm"];
    v5->_diffieHellmanGroup = [v4 decodeInt32ForKey:@"LegacyDiffieHellmanGroup"];
    v5->_lifetimeSeconds = [v4 decodeInt32ForKey:@"LegacyLifeTime"];
  }

  return v5;
}

- (NEVPNIKEv1ProposalParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEVPNIKEv1ProposalParameters;
  result = [(NEVPNIKEv1ProposalParameters *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_encryptionAlgorithm = xmmword_19DF9BFC0;
    *(void *)&result->_diffieHellmanGroup = 0xE1000000002;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
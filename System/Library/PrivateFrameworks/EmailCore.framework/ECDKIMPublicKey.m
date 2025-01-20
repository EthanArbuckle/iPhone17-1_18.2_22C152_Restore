@interface ECDKIMPublicKey
- (ECDKIMPublicKey)initWithKeyValueDictionary:(id)a3;
- (ECDKIMPublicKey)initWithRecord:(id)a3;
- (ECDKIMPublicKey)initWithVersion:(id)a3 hashingAlgorithm:(unint64_t)a4 signingAlgorithm:(unint64_t)a5 notes:(id)a6 publicKeyData:(id)a7 serviceType:(id)a8 flags:(id)a9;
- (NSData)publicKeyData;
- (NSString)flags;
- (NSString)notes;
- (NSString)serviceType;
- (NSString)version;
- (id)description;
- (unint64_t)hashingAlgorithm;
- (unint64_t)signingAlgorithm;
- (void)_parseAcceptableHashingAlgorithmsFromDictionary:(id)a3;
- (void)_parseFlagsFromDictionary:(id)a3;
- (void)_parseNotesFromDictionary:(id)a3;
- (void)_parsePublicKeyDataFromDictionary:(id)a3;
- (void)_parseServiceTypeFromDictionary:(id)a3;
- (void)_parseSigningAlgorithmFromDictionary:(id)a3;
- (void)_parseVersionFromDictionary:(id)a3;
@end

@implementation ECDKIMPublicKey

- (ECDKIMPublicKey)initWithVersion:(id)a3 hashingAlgorithm:(unint64_t)a4 signingAlgorithm:(unint64_t)a5 notes:(id)a6 publicKeyData:(id)a7 serviceType:(id)a8 flags:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v32.receiver = self;
  v32.super_class = (Class)ECDKIMPublicKey;
  v20 = [(ECDKIMPublicKey *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    version = v20->_version;
    v20->_version = (NSString *)v21;

    v20->_hashingAlgorithm = a4;
    v20->_signingAlgorithm = a5;
    uint64_t v23 = [v16 copy];
    notes = v20->_notes;
    v20->_notes = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    publicKeyData = v20->_publicKeyData;
    v20->_publicKeyData = (NSData *)v25;

    uint64_t v27 = [v18 copy];
    serviceType = v20->_serviceType;
    v20->_serviceType = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    flags = v20->_flags;
    v20->_flags = (NSString *)v29;
  }
  return 0;
}

- (ECDKIMPublicKey)initWithKeyValueDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ECDKIMPublicKey;
  v5 = [(ECDKIMPublicKey *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(ECDKIMPublicKey *)v5 _parseVersionFromDictionary:v4];
    [(ECDKIMPublicKey *)v6 _parseAcceptableHashingAlgorithmsFromDictionary:v4];
    [(ECDKIMPublicKey *)v6 _parseSigningAlgorithmFromDictionary:v4];
    [(ECDKIMPublicKey *)v6 _parseNotesFromDictionary:v4];
    [(ECDKIMPublicKey *)v6 _parsePublicKeyDataFromDictionary:v4];
    [(ECDKIMPublicKey *)v6 _parseServiceTypeFromDictionary:v4];
    [(ECDKIMPublicKey *)v6 _parseFlagsFromDictionary:v4];
  }

  return v6;
}

- (ECDKIMPublicKey)initWithRecord:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = [a3 componentsSeparatedByString:@";"];
  id v17 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v16;
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v20;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v5), "ef_componentsSeparatedByString:maxSeparations:", @"=", 1);
        if ([v6 count] == 2)
        {
          v7 = [v6 firstObject];
          objc_super v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          v9 = [v7 stringByTrimmingCharactersInSet:v8];

          v10 = [v6 lastObject];
          v11 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
          v12 = [v10 stringByTrimmingCharactersInSet:v11];

          [v17 setObject:v12 forKeyedSubscript:v9];
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v3);
  }

  v13 = [(ECDKIMPublicKey *)self initWithKeyValueDictionary:v17];
  return v13;
}

- (id)description
{
  uint64_t v3 = objc_opt_new();
  [v3 appendFormat:@"\nDKIM PUBLIC KEY:\n"];
  [v3 appendFormat:@"Version:                 %@\n", self->_version];
  objc_msgSend(v3, "appendFormat:", @"Hashing Algorithms:      %lu\n", self->_hashingAlgorithm);
  objc_msgSend(v3, "appendFormat:", @"Signing Algorithm:       %lu\n", self->_signingAlgorithm);
  [v3 appendFormat:@"Public Key:              %@\n", self->_publicKeyData];
  return v3;
}

- (void)_parseVersionFromDictionary:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 objectForKeyedSubscript:@"v"];
  uint64_t v5 = v4;
  if (v4 && ([v4 isEqualToString:@"DKIM1"] & 1) != 0) {
    objc_storeStrong((id *)&self->_version, v5);
  }
}

- (void)_parseAcceptableHashingAlgorithmsFromDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectForKeyedSubscript:@"h"];
  id v13 = v4;
  if (v4)
  {
    [v4 componentsSeparatedByString:@":"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v7 = *(void *)v15;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
        v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v11 = [v9 stringByTrimmingCharactersInSet:v10];

        if ([v11 isEqualToString:@"sha1"])
        {
          unint64_t v12 = 0;
        }
        else
        {
          if (![v11 isEqualToString:@"sha256"]) {
            goto LABEL_12;
          }
          unint64_t v12 = 1;
        }
        self->_hashingAlgorithm = v12;
LABEL_12:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (!v6)
      {
LABEL_14:

        uint64_t v4 = v13;
        break;
      }
    }
  }
}

- (void)_parseSigningAlgorithmFromDictionary:(id)a3
{
  self->_signingAlgorithm = 0;
  uint64_t v4 = [a3 objectForKeyedSubscript:@"k"];
  if (v4)
  {
    id v8 = v4;
    id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v6 = [v8 stringByTrimmingCharactersInSet:v5];

    if ([v6 isEqualToString:@"rsa"])
    {
      unint64_t v7 = 0;
    }
    else
    {
      if (![v6 isEqualToString:@"ed25519"])
      {
LABEL_7:

        uint64_t v4 = v8;
        goto LABEL_8;
      }
      unint64_t v7 = 1;
    }
    self->_signingAlgorithm = v7;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_parseNotesFromDictionary:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 objectForKeyedSubscript:@"n"];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
    notes = self->_notes;
    self->_notes = v6;
  }
}

- (void)_parsePublicKeyDataFromDictionary:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 objectForKeyedSubscript:@"p"];
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:1];
    if (v5) {
      objc_storeStrong((id *)&self->_publicKeyData, v5);
    }
  }
}

- (void)_parseServiceTypeFromDictionary:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 objectForKeyedSubscript:@"s"];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v6 = [v4 stringByTrimmingCharactersInSet:v5];
    serviceType = self->_serviceType;
    self->_serviceType = v6;
  }
}

- (void)_parseFlagsFromDictionary:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 objectForKeyedSubscript:@"t"];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v6 = [v4 stringByTrimmingCharactersInSet:v5];
    flags = self->_flags;
    self->_flags = v6;
  }
}

- (NSString)version
{
  return self->_version;
}

- (unint64_t)hashingAlgorithm
{
  return self->_hashingAlgorithm;
}

- (unint64_t)signingAlgorithm
{
  return self->_signingAlgorithm;
}

- (NSString)notes
{
  return self->_notes;
}

- (NSData)publicKeyData
{
  return self->_publicKeyData;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_publicKeyData, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
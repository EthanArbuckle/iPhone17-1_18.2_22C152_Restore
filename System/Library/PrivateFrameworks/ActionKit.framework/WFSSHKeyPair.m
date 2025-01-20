@interface WFSSHKeyPair
+ (BOOL)parsePublicKey:(id)a3 type:(id *)a4 data:(id *)a5 comment:(id *)a6;
+ (BOOL)supportsSecureCoding;
+ (NSString)defaultKeyComment;
+ (NSURL)knownHostFileURL;
+ (WFSSHKeyPair)sharedKeyPair;
+ (id)keyFormats;
+ (id)keyPairFromPrivateKey:(id)a3 comment:(id)a4 error:(id *)a5;
+ (void)setSharedKeyPair:(id)a3;
- (Class)format;
- (NSData)privateKeyData;
- (NSData)publicKeyData;
- (NSNumber)keySize;
- (NSString)comment;
- (NSString)localizedDescription;
- (NSString)localizedType;
- (WFSSHKeyPair)initWithCoder:(id)a3;
- (WFSSHKeyPair)initWithFormat:(Class)a3 privateKeyData:(id)a4 publicKeyData:(id)a5 keySize:(id)a6 comment:(id)a7;
- (id)privateKeyPEM;
- (id)publicKey;
- (id)publicKeyFingerprintWithType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFormat:(Class)a3;
@end

@implementation WFSSHKeyPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_publicKeyData, 0);
  objc_storeStrong((id *)&self->_privateKeyData, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_keySize, 0);
}

- (void)setFormat:(Class)a3
{
}

- (Class)format
{
  return self->_format;
}

- (NSData)publicKeyData
{
  return self->_publicKeyData;
}

- (NSData)privateKeyData
{
  return self->_privateKeyData;
}

- (NSString)comment
{
  return self->_comment;
}

- (NSNumber)keySize
{
  return self->_keySize;
}

- (id)publicKeyFingerprintWithType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3 == 1)
  {
    id v12 = [(WFSSHKeyPair *)self publicKeyData];
    v13 = (const void *)[v12 bytes];
    v14 = [(WFSSHKeyPair *)self publicKeyData];
    CC_SHA256(v13, [v14 length], v16);

    v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v16 length:32];
    uint64_t v11 = [v8 base64EncodedStringWithOptions:0];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    id v5 = [(WFSSHKeyPair *)self publicKeyData];
    v6 = (const void *)[v5 bytes];
    v7 = [(WFSSHKeyPair *)self publicKeyData];
    CC_MD5(v6, [v7 length], v17);

    v8 = objc_opt_new();
    for (uint64_t i = 0; i != 16; ++i)
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"%02x", v17[i]);
      [v8 addObject:v10];
    }
    uint64_t v11 = [v8 componentsJoinedByString:@":"];
  }
  v3 = (void *)v11;

LABEL_8:
  return v3;
}

- (NSString)localizedDescription
{
  v3 = [(WFSSHKeyPair *)self keySize];

  v4 = NSString;
  if (v3)
  {
    id v5 = WFLocalizedString(@"%@-bit %@ Key");
    v6 = [(WFSSHKeyPair *)self keySize];
    v7 = [(WFSSHKeyPair *)self localizedType];
    v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6, v7);
  }
  else
  {
    id v5 = WFLocalizedString(@"%@ Key");
    v6 = [(WFSSHKeyPair *)self localizedType];
    v8 = objc_msgSend(v4, "stringWithFormat:", v5, v6);
  }

  return (NSString *)v8;
}

- (NSString)localizedType
{
  v2 = [(WFSSHKeyPair *)self format];
  return (NSString *)[(objc_class *)v2 localizedDisplayName];
}

- (id)publicKey
{
  v3 = [(objc_class *)[(WFSSHKeyPair *)self format] publicKeyType];
  v4 = NSString;
  id v5 = [(WFSSHKeyPair *)self publicKeyData];
  v6 = [v5 base64EncodedStringWithOptions:0];
  v7 = [(WFSSHKeyPair *)self comment];
  v8 = [v4 stringWithFormat:@"%@ %@ %@", v3, v6, v7];

  return v8;
}

- (id)privateKeyPEM
{
  v3 = objc_opt_new();
  v4 = [(WFSSHKeyPair *)self privateKeyData];
  [v3 setData:v4];

  id v5 = [(objc_class *)[(WFSSHKeyPair *)self format] privateKeyType];
  [v3 setType:v5];

  v6 = [v3 encodedPEM];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 encodeObject:v6 forKey:@"format"];

  v7 = [(WFSSHKeyPair *)self privateKeyData];
  [v4 encodeObject:v7 forKey:@"privateKeyData"];

  v8 = [(WFSSHKeyPair *)self publicKeyData];
  [v4 encodeObject:v8 forKey:@"publicKeyData"];

  v9 = [(WFSSHKeyPair *)self keySize];
  [v4 encodeObject:v9 forKey:@"keySize"];

  id v10 = [(WFSSHKeyPair *)self comment];
  [v4 encodeObject:v10 forKey:@"comment"];
}

- (WFSSHKeyPair)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privateKeyData"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyData"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keySize"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"comment"];

  Class v10 = NSClassFromString(v5);
  uint64_t v11 = 0;
  if (v6 && v10 && !v7)
  {
    self = [(WFSSHKeyPair *)self initWithFormat:v10 privateKeyData:v6 publicKeyData:0 keySize:v8 comment:v9];
    uint64_t v11 = self;
  }

  return v11;
}

- (WFSSHKeyPair)initWithFormat:(Class)a3 privateKeyData:(id)a4 publicKeyData:(id)a5 keySize:(id)a6 comment:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (a3)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_10:
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"WFSSHKeyPair.m", 121, @"Invalid parameter not satisfying: %@", @"privateKeyData" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
LABEL_11:
    v30 = [MEMORY[0x263F08690] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"WFSSHKeyPair.m", 122, @"Invalid parameter not satisfying: %@", @"publicKeyData" object file lineNumber description];

    goto LABEL_4;
  }
  v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"WFSSHKeyPair.m", 120, @"Invalid parameter not satisfying: %@", @"format" object file lineNumber description];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_3:
  if (!v14) {
    goto LABEL_11;
  }
LABEL_4:
  v17 = +[WFSSHKeyPair keyFormats];
  int v18 = [v17 containsObject:a3];

  if (v18
    && (v31.receiver = self,
        v31.super_class = (Class)WFSSHKeyPair,
        v19 = [(WFSSHKeyPair *)&v31 init],
        (self = v19) != 0))
  {
    objc_storeStrong((id *)&v19->_format, a3);
    v20 = (NSData *)[v13 copy];
    privateKeyData = self->_privateKeyData;
    self->_privateKeyData = v20;

    v22 = (NSData *)[v14 copy];
    publicKeyData = self->_publicKeyData;
    self->_publicKeyData = v22;

    objc_storeStrong((id *)&self->_keySize, a6);
    v24 = (NSString *)[v16 copy];
    comment = self->_comment;
    self->_comment = v24;

    self = self;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (BOOL)parsePublicKey:(id)a3 type:(id *)a4 data:(id *)a5 comment:(id *)a6
{
  v9 = [MEMORY[0x263F08B08] scannerWithString:a3];
  if ([v9 scanUpToString:@" " intoString:a4])
  {
    id v16 = 0;
    int v10 = [v9 scanUpToString:@" " intoString:&v16];
    id v11 = v16;
    if (v10)
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v11 options:0];
      id v13 = v12;
      if (v12)
      {
        if (a5) {
          *a5 = v12;
        }
        char v14 = [v9 scanUpToString:@"\n" intoString:a6];
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)keyPairFromPrivateKey:(id)a3 comment:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = +[WFPEMEncoding decodePEM:a3 error:a5];
  if (v9)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v10 = [a1 keyFormats];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v22 = v8;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v16 = [v9 type];
          v17 = [v15 privateKeyType];
          char v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            v20 = [v9 data];
            id v8 = v22;
            v19 = [v15 keyPairFromPrivateKey:v20 comment:v22 error:a5];

            goto LABEL_14;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      v19 = 0;
      id v8 = v22;
    }
    else
    {
      v19 = 0;
    }
LABEL_14:
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (NSString)defaultKeyComment
{
  v2 = NSString;
  v3 = WFLocalizedString(@"Shortcuts on %@");
  id v4 = [MEMORY[0x263F85258] currentDevice];
  id v5 = [v4 name];
  v6 = objc_msgSend(v2, "stringWithFormat:", v3, v5);

  return (NSString *)v6;
}

+ (NSURL)knownHostFileURL
{
  v2 = objc_msgSend(NSURL, "wf_shortcutsDirectoryURL");
  v3 = [v2 URLByAppendingPathComponent:@"ssh" isDirectory:1];

  if ((objc_msgSend(v3, "wf_fileExists") & 1) == 0)
  {
    id v4 = [MEMORY[0x263F08850] defaultManager];
    [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];
  }
  id v5 = [v3 URLByAppendingPathComponent:@"known_hosts" isDirectory:0];

  return (NSURL *)v5;
}

+ (void)setSharedKeyPair:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[WFKeychain alloc] initWithService:@"com.apple.shortcuts.ssh"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = objc_msgSend(a1, "keyFormats", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        if ((void *)[v4 format] == v11)
        {
          char v14 = [v4 privateKeyPEM];
          id v15 = [v14 dataUsingEncoding:4];
          id v16 = [v11 privateKeySpecifier];
          [(WFKeychain *)v5 setData:v15 forKey:v16];

          uint64_t v13 = [v4 publicKey];
          v17 = [v13 dataUsingEncoding:4];
          char v18 = [v11 publicKeySpecifier];
          [(WFKeychain *)v5 setData:v17 forKey:v18];
        }
        else
        {
          uint64_t v12 = [v11 privateKeySpecifier];
          [(WFKeychain *)v5 setData:0 forKey:v12];

          uint64_t v13 = [v11 publicKeySpecifier];
          [(WFKeychain *)v5 setData:0 forKey:v13];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  v19 = (void *)_sharedKeyPair;
  _sharedKeyPair = (uint64_t)v4;
}

+ (WFSSHKeyPair)sharedKeyPair
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v3 = (void *)_sharedKeyPair;
  if (!_sharedKeyPair)
  {
    id v4 = [[WFKeychain alloc] initWithService:@"com.apple.shortcuts.ssh"];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v5 = [a1 keyFormats];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v45;
      v36 = v5;
      id v37 = a1;
      uint64_t v39 = *(void *)v45;
      v35 = v4;
      do
      {
        uint64_t v9 = 0;
        uint64_t v40 = v7;
        do
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
          uint64_t v11 = [v10 privateKeySpecifier];
          uint64_t v12 = [(WFKeychain *)v4 dataForKey:v11];

          uint64_t v13 = [v10 publicKeySpecifier];
          char v14 = [(WFKeychain *)v4 dataForKey:v13];

          if (v12) {
            BOOL v15 = v14 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (v15)
          {
          }
          else
          {
            id v16 = (void *)[[NSString alloc] initWithData:v12 encoding:4];
            uint64_t v17 = [[NSString alloc] initWithData:v14 encoding:4];
            char v18 = (void *)v17;
            if (v16) {
              BOOL v19 = v17 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (v19)
            {
              int v20 = 3;
            }
            else
            {
              id v42 = 0;
              id v43 = 0;
              id v41 = 0;
              int v21 = [a1 parsePublicKey:v17 type:&v43 data:&v42 comment:&v41];
              id v22 = v43;
              id v38 = v42;
              id v23 = v41;
              long long v24 = v23;
              if (v21)
              {
                uint64_t v25 = +[WFPEMEncoding decodePEM:v16 error:0];
                long long v26 = v25;
                if (v25)
                {
                  v27 = [v25 data];
                  uint64_t v28 = [v10 keyPairFromPrivateKey:v27 comment:v24 error:0];
                  v29 = (void *)_sharedKeyPair;
                  _sharedKeyPair = v28;

                  int v20 = 2;
                }
                else
                {
                  int v20 = 3;
                }
                v30 = v38;
              }
              else
              {
                int v20 = 3;
                v30 = v38;
              }

              id v5 = v36;
              a1 = v37;
              id v4 = v35;
            }

            uint64_t v8 = v39;
            uint64_t v7 = v40;
            if (v20 != 3) {
              goto LABEL_29;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v7);
    }
LABEL_29:

    if (!_sharedKeyPair)
    {
      [a1 defaultKeyComment];
      v32 = id v31 = a1;
      v33 = +[WFSSHKeyFormatED25519 generateKeyPairWithKeySize:0 comment:v32];
      [v31 setSharedKeyPair:v33];
    }
    v3 = (void *)_sharedKeyPair;
  }
  return (WFSSHKeyPair *)v3;
}

+ (id)keyFormats
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end
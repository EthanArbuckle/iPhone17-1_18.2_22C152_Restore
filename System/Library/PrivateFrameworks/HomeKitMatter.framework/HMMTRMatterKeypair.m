@interface HMMTRMatterKeypair
+ (id)logCategory;
- (BOOL)_generateKeys;
- (BOOL)_reloadWithData:(id)a3;
- (BOOL)_reloadWithDictionary:(id)a3;
- (BOOL)_storePrivateKeyData:(id)a3;
- (BOOL)deserialize:(id)a3;
- (BOOL)deviceLocal;
- (BOOL)initializeAllowingNew:(BOOL)a3;
- (BOOL)initialized;
- (BOOL)reload;
- (HMMTRMatterKeypair)initWithAccount:(id)a3;
- (HMMTRMatterKeypair)initWithPrivateKey:(__SecKey *)a3;
- (HMMTRMatterKeypair)initWithTLVData:(id)a3;
- (HMMTRMatterKeypair)initWithV0Account:(id)a3;
- (HMMTRMatterKeypair)initWithV0Account:(id)a3 privateKey:(__SecKey *)a4;
- (HMMTRMatterKeypair)initWithV1Account:(id)a3;
- (HMMTRMatterKeypair)initWithV1Account:(id)a3 privateKey:(__SecKey *)a4 operationalKey:(__SecKey *)a5 rootCert:(id)a6 operationalCert:(id)a7 ipk:(id)a8;
- (NSData)ipk;
- (NSData)keyRepr;
- (NSData)opKeyRepr;
- (NSData)operationalCert;
- (NSData)rootCert;
- (NSString)keychainAccount;
- (__SecKey)createPrivateKeyWithData:(id)a3;
- (__SecKey)operationalKey;
- (__SecKey)privateKey;
- (__SecKey)publicKey;
- (id)_getPrivateKeydata;
- (id)archiveV1KeyItemValue;
- (id)copyV0KeyPair;
- (id)initAsDeviceLocal;
- (id)initUnassociated;
- (id)serialize;
- (id)signMessageECDSA_DER:(id)a3;
- (id)unarchiveV1KeyItemValue:(id)a3;
- (unint64_t)version;
- (void)setInitialized:(BOOL)a3;
- (void)setKeyRepr:(id)a3;
- (void)setKeychainAccount:(id)a3;
- (void)setOpKeyRepr:(id)a3;
- (void)setOperationalKey:(__SecKey *)a3;
@end

@implementation HMMTRMatterKeypair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opKeyRepr, 0);
  objc_storeStrong((id *)&self->_keyRepr, 0);
  objc_storeStrong((id *)&self->_keychainAccount, 0);
  objc_storeStrong((id *)&self->_ipk, 0);
  objc_storeStrong((id *)&self->_operationalCert, 0);
  objc_storeStrong((id *)&self->_rootCert, 0);
}

- (BOOL)deviceLocal
{
  return self->_deviceLocal;
}

- (void)setOpKeyRepr:(id)a3
{
}

- (NSData)opKeyRepr
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setKeyRepr:(id)a3
{
}

- (NSData)keyRepr
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setKeychainAccount:(id)a3
{
}

- (NSString)keychainAccount
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (__SecKey)publicKey
{
  return self->_publicKey;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (NSData)ipk
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)operationalCert
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)rootCert
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (__SecKey)createPrivateKeyWithData:(id)a3
{
  v20[5] = *MEMORY[0x263EF8340];
  CFDataRef v4 = (const __CFData *)a3;
  uint64_t v5 = *MEMORY[0x263F16F70];
  uint64_t v6 = *MEMORY[0x263F16FA8];
  v19[0] = *MEMORY[0x263F16F68];
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x263F16FB8];
  v20[0] = v5;
  v20[1] = v7;
  uint64_t v8 = *MEMORY[0x263F17000];
  v19[2] = *MEMORY[0x263F16F98];
  v19[3] = v8;
  CFErrorRef error = 0;
  v20[2] = &unk_2702B5268;
  v20[3] = @"A CHIPPlugin Matter Keypair.";
  v19[4] = *MEMORY[0x263F16EE8];
  v20[4] = @"com.apple.matter.commissioner.ca.issuer.id";
  CFDictionaryRef v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];
  v10 = SecKeyCreateWithData(v4, v9, &error);
  if (error)
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_ERROR, "%{public}@SecKeyCreateWithData failed", buf, 0xCu);
    }
  }

  return v10;
}

- (BOOL)_reloadWithDictionary:(id)a3
{
  v34[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMMTRMatterKeypair *)self version] != 1) {
    _HMFPreconditionFailure();
  }
  uint64_t v5 = *MEMORY[0x263F16F70];
  uint64_t v6 = *MEMORY[0x263F16FA8];
  v33[0] = *MEMORY[0x263F16F68];
  v33[1] = v6;
  uint64_t v7 = *MEMORY[0x263F16FB8];
  v34[0] = v5;
  v34[1] = v7;
  uint64_t v8 = *MEMORY[0x263F17000];
  v33[2] = *MEMORY[0x263F16F98];
  v33[3] = v8;
  CFErrorRef error = 0;
  v34[2] = &unk_2702B5268;
  v34[3] = @"A CHIPPlugin Matter Keypair.";
  v33[4] = *MEMORY[0x263F16EE8];
  v34[4] = @"com.apple.matter.commissioner.ca.issuer.id";
  CFDictionaryRef v9 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:5];
  CFDataRef v10 = [v4 objectForKeyedSubscript:@"privkey"];
  self->_privateKey = SecKeyCreateWithData(v10, v9, &error);

  if (error)
  {
    v11 = (void *)MEMORY[0x2533B64D0]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v14;
      __int16 v31 = 2112;
      CFErrorRef v32 = error;
      v15 = "%{public}@Unable to reconstruct private key %@";
LABEL_5:
      v16 = v13;
      uint32_t v17 = 22;
LABEL_6:
      _os_log_impl(&dword_252495000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }
  }
  else
  {
    v20 = SecKeyCopyPublicKey(self->_privateKey);
    self->_publicKey = v20;
    if (!v20)
    {
      v11 = (void *)MEMORY[0x2533B64D0]();
      v12 = self;
      v13 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      v15 = "%{public}@Unable to recover public key";
      v16 = v13;
      uint32_t v17 = 12;
      goto LABEL_6;
    }
    CFDataRef v21 = [v4 objectForKeyedSubscript:@"opkey"];
    self->_operationalKey = SecKeyCreateWithData(v21, v9, &error);

    if (self->_operationalKey)
    {
      v22 = [v4 objectForKeyedSubscript:@"rootcert"];
      rootCert = self->_rootCert;
      self->_rootCert = v22;

      v24 = [v4 objectForKeyedSubscript:@"opcert"];
      operationalCert = self->_operationalCert;
      self->_operationalCert = v24;

      v26 = [v4 objectForKeyedSubscript:@"ipk"];
      ipk = self->_ipk;
      self->_ipk = v26;

      BOOL v18 = 1;
      goto LABEL_8;
    }
    v11 = (void *)MEMORY[0x2533B64D0]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v14;
      __int16 v31 = 2112;
      CFErrorRef v32 = error;
      v15 = "%{public}@Unable to reconstruct operational key %@";
      goto LABEL_5;
    }
  }
LABEL_7:

  BOOL v18 = 0;
LABEL_8:

  return v18;
}

- (BOOL)_reloadWithData:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMMTRMatterKeypair *)self version] != 1)
  {
    uint64_t v7 = [(HMMTRMatterKeypair *)self createPrivateKeyWithData:v4];
    self->_privateKey = v7;
    if (v7)
    {
      uint64_t v8 = SecKeyCopyPublicKey(v7);
      self->_publicKey = v8;
      if (v8)
      {
        BOOL v6 = 1;
        goto LABEL_15;
      }
      CFDictionaryRef v9 = (void *)MEMORY[0x2533B64D0]();
      CFDataRef v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v15 = 138543362;
        v16 = v12;
        v13 = "%{public}@Unable to recover public key";
        goto LABEL_13;
      }
    }
    else
    {
      CFDictionaryRef v9 = (void *)MEMORY[0x2533B64D0]();
      CFDataRef v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v15 = 138543362;
        v16 = v12;
        v13 = "%{public}@Unable to reconstruct private key";
LABEL_13:
        _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0xCu);
      }
    }

    BOOL v6 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = [(HMMTRMatterKeypair *)self unarchiveV1KeyItemValue:v4];
  if (v5) {
    BOOL v6 = [(HMMTRMatterKeypair *)self _reloadWithDictionary:v5];
  }
  else {
    BOOL v6 = 0;
  }

LABEL_15:
  return v6;
}

- (id)_getPrivateKeydata
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F35AD0] systemStore];
  id v4 = [(HMMTRMatterKeypair *)self keychainAccount];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[HMMTRMatterKeypair deviceLocal](self, "deviceLocal") ^ 1);
  id v33 = 0;
  BOOL v6 = [v3 allKeychainItemsForType:&unk_2702B5280 identifier:v4 syncable:v5 error:&v33];
  id v7 = v33;

  uint64_t v8 = (void *)MEMORY[0x2533B64D0]();
  CFDictionaryRef v9 = self;
  CFDataRef v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v11;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Load Keychain Item Result : %@", buf, 0x16u);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v28 = v7;
    uint64_t v15 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        BOOL v18 = [v17 account];
        v19 = [(HMMTRMatterKeypair *)v9 keychainAccount];
        int v20 = [v18 isEqualToString:v19];

        if (v20)
        {
          v22 = (void *)MEMORY[0x2533B64D0]();
          v23 = v9;
          v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            v25 = HMFGetLogIdentifier();
            v26 = [v17 valueData];
            *(_DWORD *)buf = 138543618;
            v36 = v25;
            __int16 v37 = 2112;
            id v38 = v26;
            _os_log_impl(&dword_252495000, v24, OS_LOG_TYPE_INFO, "%{public}@Returning matching key : %@", buf, 0x16u);
          }
          CFDataRef v21 = [v17 valueData];
          goto LABEL_15;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    CFDataRef v21 = 0;
LABEL_15:
    id v7 = v28;
  }
  else
  {
    CFDataRef v21 = 0;
  }

  return v21;
}

- (BOOL)_generateKeys
{
  v30[5] = *MEMORY[0x263EF8340];
  if ([(HMMTRMatterKeypair *)self version] == 1) {
    _HMFPreconditionFailure();
  }
  v3 = (void *)MEMORY[0x2533B64D0]();
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v26 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Generating a new keypair for the Matter CA", buf, 0xCu);
  }
  uint64_t v7 = *MEMORY[0x263F16F70];
  uint64_t v8 = *MEMORY[0x263F16FA8];
  v29[0] = *MEMORY[0x263F16F68];
  v29[1] = v8;
  uint64_t v9 = *MEMORY[0x263F16FB8];
  v30[0] = v7;
  v30[1] = v9;
  uint64_t v10 = *MEMORY[0x263F17000];
  v29[2] = *MEMORY[0x263F16F98];
  v29[3] = v10;
  CFErrorRef error = 0;
  v30[2] = &unk_2702B5268;
  v30[3] = @"A CHIPPlugin Matter Keypair.";
  v29[4] = *MEMORY[0x263F16EE8];
  v30[4] = @"com.apple.matter.commissioner.ca.issuer.id";
  CFDictionaryRef v11 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:5];
  id v12 = SecKeyCreateRandomKey(v11, &error);
  v4->_privateKey = v12;
  if (error)
  {
    uint64_t v13 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v14 = v4;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v16;
      __int16 v27 = 2112;
      CFErrorRef v28 = error;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Failed in keygen %@", buf, 0x16u);
    }
    char v17 = 0;
  }
  else
  {
    v4->_publicKey = SecKeyCopyPublicKey(v12);
    CFDataRef v18 = SecKeyCopyExternalRepresentation(v4->_privateKey, 0);
    if (v18)
    {
      if (v4->_deviceLocal) {
        char v17 = 1;
      }
      else {
        char v17 = [(HMMTRMatterKeypair *)v4 _storePrivateKeyData:v18];
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x2533B64D0]();
      int v20 = v4;
      CFDataRef v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v26 = v22;
        _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, "%{public}@Failed in getting keypair data...", buf, 0xCu);
      }
      char v17 = 0;
    }
  }
  return v17;
}

- (BOOL)_storePrivateKeyData:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F35AD0] systemStore];
  id v6 = objc_alloc_init(MEMORY[0x263F35A10]);
  [v6 setValueData:v4];
  objc_msgSend(v6, "setSyncable:", -[HMMTRMatterKeypair deviceLocal](self, "deviceLocal") ^ 1);
  uint64_t v7 = [(HMMTRMatterKeypair *)self keychainAccount];
  [v6 setAccount:v7];

  [v6 setAccessGroup:@"com.apple.hap.pairing"];
  [v6 setLabel:@"A CHIPPlugin Matter Keypair."];
  [v6 setItemDescription:@"A CHIPPlugin Matter keypair is stored here."];
  [v6 setType:&unk_2702B5280];
  uint64_t v8 = (void *)MEMORY[0x263F35AD0];
  uint64_t v9 = [v6 type];
  uint64_t v10 = [v8 viewHintForType:v9];
  [v6 setViewHint:v10];

  id v17 = 0;
  [v5 updateKeychainItem:v6 createIfNeeded:1 error:&v17];
  id v11 = v17;
  id v12 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Update Keychain Item Result : %@", buf, 0x16u);
  }

  return v11 == 0;
}

- (BOOL)reload
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v30 = 138543362;
    long long v31 = v6;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Trying to reload keypair from keychain", (uint8_t *)&v30, 0xCu);
  }
  uint64_t v7 = [(HMMTRMatterKeypair *)v4 _getPrivateKeydata];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
    if ([(HMMTRMatterKeypair *)v4 version] == 1)
    {
      uint64_t v10 = [(HMMTRMatterKeypair *)v4 unarchiveV1KeyItemValue:v9];
      if (!v10)
      {
        v26 = (void *)MEMORY[0x2533B64D0]();
        __int16 v27 = v4;
        CFErrorRef v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          long long v29 = HMFGetLogIdentifier();
          int v30 = 138543618;
          long long v31 = v29;
          __int16 v32 = 2112;
          uint64_t v33 = 0;
          _os_log_impl(&dword_252495000, v28, OS_LOG_TYPE_ERROR, "%{public}@Key value could not be deserialized: %@", (uint8_t *)&v30, 0x16u);
        }
        BOOL v17 = 0;
        goto LABEL_23;
      }
      id v11 = v10;
      uint64_t v12 = [v10 objectForKeyedSubscript:@"privkey"];

      id v9 = (id)v12;
    }
    else
    {
      id v11 = 0;
    }
    CFDataRef v18 = SecKeyCopyExternalRepresentation(v4->_privateKey, 0);
    if ([(__CFData *)v18 isEqualToData:v9])
    {
      v19 = (void *)MEMORY[0x2533B64D0]();
      __int16 v20 = v4;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v30 = 138543362;
        long long v31 = v22;
        v23 = "%{public}@Keypair data was not changed not reloading";
LABEL_20:
        _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v30, 0xCu);

        goto LABEL_21;
      }
      goto LABEL_21;
    }
    if ([(HMMTRMatterKeypair *)v4 version] == 1)
    {
      if ([(HMMTRMatterKeypair *)v4 _reloadWithDictionary:v11])
      {
LABEL_16:
        BOOL v17 = 1;
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
    }
    else if ([(HMMTRMatterKeypair *)v4 _reloadWithData:v9])
    {
      goto LABEL_16;
    }
    v19 = (void *)MEMORY[0x2533B64D0]();
    v24 = v4;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v30 = 138543362;
      long long v31 = v22;
      v23 = "%{public}@!!!Failed to reload keypair!!! Keypair is useless now. ";
      goto LABEL_20;
    }
LABEL_21:

    BOOL v17 = 0;
    goto LABEL_22;
  }
  uint64_t v13 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v14 = v4;
  uint64_t v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = HMFGetLogIdentifier();
    int v30 = 138543362;
    long long v31 = v16;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@keypair was deleted, not reloading...", (uint8_t *)&v30, 0xCu);
  }
  BOOL v17 = 0;
LABEL_24:

  return v17;
}

- (id)archiveV1KeyItemValue
{
  v31[5] = *MEMORY[0x263EF8340];
  if ([(HMMTRMatterKeypair *)self version] != 1) {
    _HMFPreconditionFailure();
  }
  CFDataRef v3 = SecKeyCopyExternalRepresentation([(HMMTRMatterKeypair *)self privateKey], 0);
  if (v3)
  {
    CFDataRef v4 = SecKeyCopyExternalRepresentation([(HMMTRMatterKeypair *)self operationalKey], 0);
    CFDataRef v5 = v4;
    if (v4)
    {
      v30[0] = @"privkey";
      v30[1] = @"opkey";
      v31[0] = v3;
      v31[1] = v4;
      v30[2] = @"rootcert";
      id v6 = [(HMMTRMatterKeypair *)self rootCert];
      v31[2] = v6;
      v30[3] = @"opcert";
      uint64_t v7 = [(HMMTRMatterKeypair *)self operationalCert];
      v31[3] = v7;
      v30[4] = @"ipk";
      uint64_t v8 = [(HMMTRMatterKeypair *)self ipk];
      v31[4] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:5];

      id v25 = 0;
      uint64_t v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v25];
      id v11 = v25;
      if (!v10)
      {
        uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
        uint64_t v13 = self;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v27 = v15;
          __int16 v28 = 2112;
          id v29 = v11;
          _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize combo keypair cert data: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x2533B64D0]();
      id v21 = self;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v27 = v23;
        _os_log_impl(&dword_252495000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get key data from operational key", buf, 0xCu);
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x2533B64D0]();
    BOOL v17 = self;
    CFDataRef v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v19;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get key data from private key", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)unarchiveV1KeyItemValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMMTRMatterKeypair *)self version] != 1) {
    _HMFPreconditionFailure();
  }
  CFDataRef v5 = (void *)MEMORY[0x263F08928];
  uint64_t v6 = objc_opt_class();
  id v14 = 0;
  uint64_t v7 = [v5 unarchivedDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() fromData:v4 error:&v14];
  id v8 = v14;
  if (!v7)
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed unarchive V1 key data: %@", buf, 0x16u);
    }
  }

  return v7;
}

- (id)signMessageECDSA_DER:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CFDataRef v4 = (const __CFData *)a3;
  CFErrorRef error = 0;
  CFDataRef v5 = SecKeyCreateSignature(self->_privateKey, (SecKeyAlgorithm)*MEMORY[0x263F172E8], v4, &error);
  if (error)
  {
    uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      CFErrorRef v15 = error;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_ERROR, "%{public}@HomeKitMatter failed to sign message %@", buf, 0x16u);
    }
  }

  return v5;
}

- (id)copyV0KeyPair
{
  if ([(HMMTRMatterKeypair *)self version]) {
    return 0;
  }
  CFDataRef v4 = [HMMTRMatterKeypair alloc];
  CFDataRef v5 = [(HMMTRMatterKeypair *)self privateKey];
  return [(HMMTRMatterKeypair *)v4 initWithPrivateKey:v5];
}

- (BOOL)deserialize:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFDataRef v5 = +[HMMTRTLVParser keyPairDataFromTLV:v4];
  if (!v5)
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v12 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v12;
    uint64_t v13 = "%{public}@TLV parsing failed";
LABEL_11:
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0xCu);

    goto LABEL_12;
  }
  uint64_t v6 = [(HMMTRMatterKeypair *)self createPrivateKeyWithData:v5];
  self->_privateKey = v6;
  if (!v6)
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v12 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v12;
    uint64_t v13 = "%{public}@Unable to reconstruct private key from TLV";
    goto LABEL_11;
  }
  uint64_t v7 = SecKeyCopyPublicKey(v6);
  self->_publicKey = v7;
  if (!v7)
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v12;
      uint64_t v13 = "%{public}@Unable to recover public key from TLV";
      goto LABEL_11;
    }
LABEL_12:

    BOOL v8 = 0;
    goto LABEL_13;
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (id)serialize
{
  *(void *)&v22[65] = *MEMORY[0x263EF8340];
  CFDataRef v3 = SecKeyCopyExternalRepresentation([(HMMTRMatterKeypair *)self privateKey], 0);
  CFDataRef v4 = v3;
  if (v3)
  {
    *(_DWORD *)buf = 16786453;
    LOWORD(v22[0]) = 304;
    BYTE2(v22[0]) = [(__CFData *)v3 length];
    CFDataRef v5 = v4;
    [(__CFData *)v5 bytes];
    [(__CFData *)v5 length];
    __memcpy_chk();
    uint64_t v6 = [(__CFData *)v5 length];
    *((unsigned char *)v22 + v6 + 3) = 24;
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:(char *)v22 + v6 + 3 - (char *)buf + 1];
    BOOL v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = [v7 length];
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Composed key data with length %zu", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v13 = self;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)uint64_t v22 = v15;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed in getting private key data...", buf, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)initializeAllowingNew:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(HMMTRMatterKeypair *)self initialized]) {
    return [(HMMTRMatterKeypair *)self initialized];
  }
  CFDataRef v5 = [(HMMTRMatterKeypair *)self _getPrivateKeydata];
  uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v7 = self;
  BOOL v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v10;
      _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Found private Key data, reloading keys", (uint8_t *)&v19, 0xCu);
    }
    if (![(HMMTRMatterKeypair *)v7 _reloadWithData:v5])
    {
      uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
      id v11 = v7;
      BOOL v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v19 = 138543362;
        uint64_t v20 = v12;
        uint64_t v13 = "%{public}@Failed to reload keys from privateKey Data, init failure!!!";
LABEL_18:
        uint64_t v16 = v8;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  if (!a3)
  {
    if (v9)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      int v19 = 138543362;
      uint64_t v20 = v12;
      uint64_t v13 = "%{public}@Private key not found";
      uint64_t v16 = v8;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
LABEL_19:
      _os_log_impl(&dword_252495000, v16, v17, v13, (uint8_t *)&v19, 0xCu);

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (v9)
  {
    __int16 v14 = HMFGetLogIdentifier();
    int v19 = 138543362;
    uint64_t v20 = v14;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Private Key not found, generating new Keys", (uint8_t *)&v19, 0xCu);
  }
  if ([(HMMTRMatterKeypair *)v7 _generateKeys])
  {
LABEL_12:
    [(HMMTRMatterKeypair *)v7 setInitialized:1];

    return [(HMMTRMatterKeypair *)self initialized];
  }
  uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
  id v18 = v7;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v19 = 138543362;
    uint64_t v20 = v12;
    uint64_t v13 = "%{public}@Failed to initialize, unable to generate new keys";
    goto LABEL_18;
  }
LABEL_20:

  return 0;
}

- (__SecKey)operationalKey
{
  return self->_operationalKey;
}

- (void)setOperationalKey:(__SecKey *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3)
  {
    CFDataRef v4 = (NSData *)SecKeyCopyExternalRepresentation(a3, 0);
    opKeyRepr = self->_opKeyRepr;
    self->_opKeyRepr = v4;

    if (self->_opKeyRepr)
    {
      self->_operationalKey = -[HMMTRMatterKeypair createPrivateKeyWithData:](self, "createPrivateKeyWithData:");
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
      uint64_t v7 = self;
      BOOL v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        BOOL v9 = HMFGetLogIdentifier();
        int v10 = 138543362;
        id v11 = v9;
        _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_ERROR, "%{public}@Bad op key passed to operationalKey", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    self->_operationalKey = 0;
  }
}

- (HMMTRMatterKeypair)initWithV1Account:(id)a3 privateKey:(__SecKey *)a4 operationalKey:(__SecKey *)a5 rootCert:(id)a6 operationalCert:(id)a7 ipk:(id)a8
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)HMMTRMatterKeypair;
  id v18 = [(HMMTRMatterKeypair *)&v32 init];
  int v19 = v18;
  if (!v18) {
    goto LABEL_6;
  }
  v18->_version = 1;
  CFDataRef v20 = SecKeyCopyExternalRepresentation(a4, 0);
  keyRepr = v19->_keyRepr;
  v19->_keyRepr = (NSData *)v20;

  if (!v19->_keyRepr)
  {
    id v25 = (void *)MEMORY[0x2533B64D0]();
    v26 = v19;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v28;
      id v29 = "%{public}@Bad private key passed to initializer";
LABEL_11:
      _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
    }
LABEL_12:

    v24 = 0;
    goto LABEL_13;
  }
  v19->_privateKey = -[HMMTRMatterKeypair createPrivateKeyWithData:](v19, "createPrivateKeyWithData:");
  CFDataRef v22 = SecKeyCopyExternalRepresentation(a5, 0);
  opKeyRepr = v19->_opKeyRepr;
  v19->_opKeyRepr = (NSData *)v22;

  if (!v19->_opKeyRepr)
  {
    id v25 = (void *)MEMORY[0x2533B64D0]();
    v26 = v19;
    __int16 v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v34 = v28;
      id v29 = "%{public}@Bad op key passed to initializer";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v19->_operationalKey = -[HMMTRMatterKeypair createPrivateKeyWithData:](v19, "createPrivateKeyWithData:");
  v19->_publicKey = SecKeyCopyPublicKey(v19->_privateKey);
  objc_storeStrong((id *)&v19->_keychainAccount, a3);
  objc_storeStrong((id *)&v19->_rootCert, a6);
  objc_storeStrong((id *)&v19->_operationalCert, a7);
  objc_storeStrong((id *)&v19->_ipk, a8);
  v24 = [(HMMTRMatterKeypair *)v19 archiveV1KeyItemValue];
  if (v24)
  {
    [(HMMTRMatterKeypair *)v19 _storePrivateKeyData:v24];

LABEL_6:
    v24 = v19;
  }
LABEL_13:

  return v24;
}

- (HMMTRMatterKeypair)initWithV1Account:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTRMatterKeypair;
  uint64_t v6 = [(HMMTRMatterKeypair *)&v10 init];
  uint64_t v7 = v6;
  if (v6
    && (v6->_version = 1,
        objc_storeStrong((id *)&v6->_keychainAccount, a3),
        ![(HMMTRMatterKeypair *)v7 initializeAllowingNew:0]))
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = v7;
  }

  return v8;
}

- (id)initUnassociated
{
  v22[5] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)HMMTRMatterKeypair;
  v2 = [(HMMTRMatterKeypair *)&v16 init];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = *MEMORY[0x263F16F70];
  uint64_t v4 = *MEMORY[0x263F16FA8];
  v21[0] = *MEMORY[0x263F16F68];
  v21[1] = v4;
  uint64_t v5 = *MEMORY[0x263F16FB8];
  v22[0] = v3;
  v22[1] = v5;
  uint64_t v6 = *MEMORY[0x263F17000];
  v21[2] = *MEMORY[0x263F16F98];
  v21[3] = v6;
  CFErrorRef error = 0;
  v22[2] = &unk_2702B5268;
  v22[3] = @"A CHIPPlugin Matter Keypair.";
  v21[4] = *MEMORY[0x263F16EE8];
  v22[4] = @"com.apple.matter.commissioner.ca.issuer.id";
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
  BOOL v8 = SecKeyCreateRandomKey(v7, &error);
  v2->_privateKey = v8;
  if (!error)
  {
    v2->_publicKey = SecKeyCopyPublicKey(v8);

LABEL_7:
    uint64_t v13 = v2;
    goto LABEL_8;
  }
  BOOL v9 = (void *)MEMORY[0x2533B64D0]();
  objc_super v10 = v2;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v18 = v12;
    __int16 v19 = 2112;
    CFErrorRef v20 = error;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed in keygen %@", buf, 0x16u);
  }

  uint64_t v13 = 0;
LABEL_8:

  return v13;
}

- (HMMTRMatterKeypair)initWithPrivateKey:(__SecKey *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)HMMTRMatterKeypair;
  uint64_t v4 = [(HMMTRMatterKeypair *)&v14 init];
  if (!v4) {
    goto LABEL_4;
  }
  CFDataRef v5 = SecKeyCopyExternalRepresentation(a3, 0);
  keyRepr = v4->_keyRepr;
  v4->_keyRepr = (NSData *)v5;

  if (v4->_keyRepr)
  {
    CFDictionaryRef v7 = -[HMMTRMatterKeypair createPrivateKeyWithData:](v4, "createPrivateKeyWithData:");
    v4->_privateKey = v7;
    v4->_publicKey = SecKeyCopyPublicKey(v7);
LABEL_4:
    BOOL v8 = v4;
    goto LABEL_8;
  }
  BOOL v9 = (void *)MEMORY[0x2533B64D0]();
  objc_super v10 = v4;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    objc_super v16 = v12;
    _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_ERROR, "%{public}@Bad private key passed to initializer", buf, 0xCu);
  }
  BOOL v8 = 0;
LABEL_8:

  return v8;
}

- (HMMTRMatterKeypair)initWithTLVData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRMatterKeypair;
  CFDataRef v5 = [(HMMTRMatterKeypair *)&v9 init];
  uint64_t v6 = v5;
  if (v5)
  {
    keychainAccount = v5->_keychainAccount;
    v5->_keychainAccount = (NSString *)@"null";

    [(HMMTRMatterKeypair *)v6 deserialize:v4];
  }

  return v6;
}

- (HMMTRMatterKeypair)initWithV0Account:(id)a3 privateKey:(__SecKey *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMMTRMatterKeypair;
  BOOL v8 = [(HMMTRMatterKeypair *)&v20 init];
  objc_super v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v8->_keychainAccount, a3);
  CFDataRef v10 = SecKeyCopyExternalRepresentation(a4, 0);
  if (v10)
  {
    keyRepr = v9->_keyRepr;
    v9->_keyRepr = (NSData *)v10;
    CFDataRef v12 = v10;

    uint64_t v13 = [(HMMTRMatterKeypair *)v9 createPrivateKeyWithData:v12];
    v9->_privateKey = v13;
    v9->_publicKey = SecKeyCopyPublicKey(v13);
    [(HMMTRMatterKeypair *)v9 _storePrivateKeyData:v12];

LABEL_4:
    objc_super v14 = v9;
    goto LABEL_8;
  }
  id v15 = (void *)MEMORY[0x2533B64D0]();
  objc_super v16 = v9;
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    CFDataRef v22 = v18;
    _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Failed in getting keypair data from private key", buf, 0xCu);
  }
  objc_super v14 = 0;
LABEL_8:

  return v14;
}

- (id)initAsDeviceLocal
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)HMMTRMatterKeypair;
  v2 = [(HMMTRMatterKeypair *)&v11 init];
  uint64_t v3 = v2;
  if (!v2) {
    goto LABEL_4;
  }
  keychainAccount = v2->_keychainAccount;
  v2->_keychainAccount = (NSString *)&stru_2702A0B38;

  v3->_deviceLocal = 1;
  if ([(HMMTRMatterKeypair *)v3 _generateKeys])
  {
    v3->_initialized = 1;
LABEL_4:
    CFDataRef v5 = v3;
    goto LABEL_8;
  }
  uint64_t v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = v3;
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_super v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v9;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate device local keypair", buf, 0xCu);
  }
  CFDataRef v5 = 0;
LABEL_8:

  return v5;
}

- (HMMTRMatterKeypair)initWithV0Account:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMTRMatterKeypair;
  uint64_t v6 = [(HMMTRMatterKeypair *)&v10 init];
  id v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_keychainAccount, a3),
        ![(HMMTRMatterKeypair *)v7 initializeAllowingNew:0]))
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = v7;
  }

  return v8;
}

- (HMMTRMatterKeypair)initWithAccount:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMMTRMatterKeypair;
  id v5 = [(HMMTRMatterKeypair *)&v9 init];
  uint64_t v6 = v5;
  if (v5
    && ([(HMMTRMatterKeypair *)v5 setKeychainAccount:v4],
        ![(HMMTRMatterKeypair *)v6 initializeAllowingNew:1]))
  {
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39 != -1) {
    dispatch_once(&logCategory__hmf_once_t39, &__block_literal_global_2007);
  }
  v2 = (void *)logCategory__hmf_once_v40;
  return v2;
}

uint64_t __33__HMMTRMatterKeypair_logCategory__block_invoke()
{
  logCategory__hmf_once_v40 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end
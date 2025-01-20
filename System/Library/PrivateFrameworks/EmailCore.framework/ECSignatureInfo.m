@interface ECSignatureInfo
- (ECSignatureInfo)initWithSignerInfo:(id)a3;
- (NSArray)addresses;
- (NSArray)smimeCapabilities;
- (NSDate)signingDate;
- (__SecCertificate)preferredEncryptionCertificate;
- (__SecCertificate)signingCertificate;
- (id)_protectedAttributeOfType:(objc_class *)a3 class:;
- (void)dealloc;
@end

@implementation ECSignatureInfo

- (ECSignatureInfo)initWithSignerInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECSignatureInfo;
  v6 = [(ECSignatureInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signerInfo, a3);
    v7->_encryptionCertificateLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)dealloc
{
  encryptionCertificate = self->_encryptionCertificate;
  if (encryptionCertificate) {
    CFRelease(encryptionCertificate);
  }
  v4.receiver = self;
  v4.super_class = (Class)ECSignatureInfo;
  [(ECSignatureInfo *)&v4 dealloc];
}

- (NSArray)addresses
{
  [(ECSignatureInfo *)self signingCertificate];
  v2 = (void *)SecCertificateCopyRFC822Names();
  return (NSArray *)v2;
}

- (__SecCertificate)signingCertificate
{
  return (__SecCertificate *)[(MSCMSSignerInfo *)self->_signerInfo signerCertificate];
}

- (__SecCertificate)preferredEncryptionCertificate
{
  p_encryptionCertificateLock = &self->_encryptionCertificateLock;
  os_unfair_lock_lock(&self->_encryptionCertificateLock);
  encryptionCertificate = self->_encryptionCertificate;
  os_unfair_lock_unlock(p_encryptionCertificateLock);
  if (!encryptionCertificate)
  {
    id v5 = (void *)*MEMORY[0x1E4F77D00];
    v6 = (objc_class *)objc_opt_class();
    v7 = -[ECSignatureInfo _protectedAttributeOfType:class:]((uint64_t)self, v5, v6);
    v8 = (__SecCertificate *)[v7 encryptionCertificate];
    if (v8
      || (v8 = [(ECSignatureInfo *)self signingCertificate],
          encryptionCertificate = 0,
          (SecCertificateGetKeyUsage() & 0x14) != 0)
      && v8)
    {
      os_unfair_lock_lock(p_encryptionCertificateLock);
      encryptionCertificate = self->_encryptionCertificate;
      if (!encryptionCertificate)
      {
        self->_encryptionCertificate = v8;
        CFRetain(v8);
        encryptionCertificate = v8;
      }
      os_unfair_lock_unlock(p_encryptionCertificateLock);
    }
  }
  return encryptionCertificate;
}

- (id)_protectedAttributeOfType:(objc_class *)a3 class:
{
  id v5 = a2;
  if (a1)
  {
    v6 = [*(id *)(a1 + 8) protectedAttributes];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__ECSignatureInfo__protectedAttributeOfType_class___block_invoke;
    v10[3] = &unk_1E63EE278;
    id v11 = v5;
    v7 = objc_msgSend(v6, "ef_firstObjectPassingTest:", v10);

    if (v7) {
      v8 = (void *)[[a3 alloc] initWithAttribute:v7 error:0];
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)smimeCapabilities
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*MEMORY[0x1E4F77D08];
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = -[ECSignatureInfo _protectedAttributeOfType:class:]((uint64_t)self, v3, v4);
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v7 = [v5 capabilities];
  v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v9 = objc_msgSend(v5, "capabilities", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) OIDString];
        [v8 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return (NSArray *)v8;
}

- (NSDate)signingDate
{
  v3 = (void *)*MEMORY[0x1E4F77D10];
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = -[ECSignatureInfo _protectedAttributeOfType:class:]((uint64_t)self, v3, v4);
  id v6 = [v5 signingTime];

  return (NSDate *)v6;
}

uint64_t __51__ECSignatureInfo__protectedAttributeOfType_class___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 attributeType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void).cxx_destruct
{
}

@end
@interface TKTokenKeychainCertificate
- (NSData)data;
- (NSData)issuer;
- (NSData)publicKeyHash;
- (NSData)serialNumber;
- (NSData)subject;
- (NSData)subjectKeyID;
- (NSNumber)certificateEncoding;
- (NSNumber)certificateType;
- (TKTokenKeychainCertificate)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID;
- (TKTokenKeychainCertificate)initWithItemInfo:(id)a3;
- (id)encodedObjectID;
- (id)keychainAttributes;
- (void)setCertificateEncoding:(id)a3;
- (void)setCertificateType:(id)a3;
- (void)setIssuer:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSubjectKeyID:(id)a3;
@end

@implementation TKTokenKeychainCertificate

- (TKTokenKeychainCertificate)initWithCertificate:(SecCertificateRef)certificateRef objectID:(TKTokenObjectID)objectID
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)TKTokenKeychainCertificate;
  v5 = [(TKTokenKeychainItem *)&v28 initWithObjectID:objectID];
  if (v5)
  {
    CFDataRef v6 = SecCertificateCopyData(certificateRef);
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v8 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
    [(TKTokenKeychainItem *)v5 setLabel:v8];

    v31 = &unk_1F19F81E0;
    v32[0] = MEMORY[0x1E4F1CC38];
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [(TKTokenKeychainItem *)v5 setConstraints:v9];

    v10 = (void *)SecCertificateCopyAttributeDictionary();
    v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 objectForKey:*MEMORY[0x1E4F3B658]];
      certificateType = v5->_certificateType;
      v5->_certificateType = (NSNumber *)v12;

      uint64_t v14 = [v11 objectForKey:*MEMORY[0x1E4F3B650]];
      certificateEncoding = v5->_certificateEncoding;
      v5->_certificateEncoding = (NSNumber *)v14;

      uint64_t v16 = [v11 objectForKey:*MEMORY[0x1E4F3B860]];
      subject = v5->_subject;
      v5->_subject = (NSData *)v16;

      uint64_t v18 = [v11 objectForKey:*MEMORY[0x1E4F3B6C8]];
      issuer = v5->_issuer;
      v5->_issuer = (NSData *)v18;

      uint64_t v20 = [v11 objectForKey:*MEMORY[0x1E4F3B840]];
      serialNumber = v5->_serialNumber;
      v5->_serialNumber = (NSData *)v20;

      uint64_t v22 = [v11 objectForKey:*MEMORY[0x1E4F3B868]];
      subjectKeyID = v5->_subjectKeyID;
      v5->_subjectKeyID = (NSData *)v22;

      uint64_t v24 = [v11 objectForKey:*MEMORY[0x1E4F3B828]];
      publicKeyHash = v5->_publicKeyHash;
      v5->_publicKeyHash = (NSData *)v24;
    }
    else
    {
      v26 = TK_LOG_token_2();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        SecCertificateRef v30 = certificateRef;
        _os_log_impl(&dword_1BED55000, v26, OS_LOG_TYPE_DEFAULT, "Failed to get attributes from certificate %{public}@", buf, 0xCu);
      }

      publicKeyHash = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (id)encodedObjectID
{
  v2 = [(TKTokenKeychainItem *)self objectID];
  v3 = +[TKTokenID encodedCertificateID:v2];

  return v3;
}

- (TKTokenKeychainCertificate)initWithItemInfo:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TKTokenKeychainCertificate;
  v5 = [(TKTokenKeychainItem *)&v23 initWithItemInfo:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F3BD38]];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 objectForKey:*MEMORY[0x1E4F3B658]];
    certificateType = v5->_certificateType;
    v5->_certificateType = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKey:*MEMORY[0x1E4F3B650]];
    certificateEncoding = v5->_certificateEncoding;
    v5->_certificateEncoding = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKey:*MEMORY[0x1E4F3B860]];
    subject = v5->_subject;
    v5->_subject = (NSData *)v12;

    uint64_t v14 = [v4 objectForKey:*MEMORY[0x1E4F3B6C8]];
    issuer = v5->_issuer;
    v5->_issuer = (NSData *)v14;

    uint64_t v16 = [v4 objectForKey:*MEMORY[0x1E4F3B840]];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSData *)v16;

    uint64_t v18 = [v4 objectForKey:*MEMORY[0x1E4F3B868]];
    subjectKeyID = v5->_subjectKeyID;
    v5->_subjectKeyID = (NSData *)v18;

    uint64_t v20 = [v4 objectForKey:*MEMORY[0x1E4F3B828]];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v20;
  }
  return v5;
}

- (id)keychainAttributes
{
  v13.receiver = self;
  v13.super_class = (Class)TKTokenKeychainCertificate;
  v3 = [(TKTokenKeychainItem *)&v13 keychainAttributes];
  [v3 setObject:*MEMORY[0x1E4F3B980] forKeyedSubscript:*MEMORY[0x1E4F3B978]];
  id v4 = [(TKTokenKeychainCertificate *)self data];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F3BD38]];

  v5 = [(TKTokenKeychainCertificate *)self subject];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F3B860]];

  uint64_t v6 = [(TKTokenKeychainCertificate *)self issuer];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F3B6C8]];

  v7 = [(TKTokenKeychainCertificate *)self serialNumber];
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F3B840]];

  uint64_t v8 = [(TKTokenKeychainCertificate *)self subjectKeyID];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F3B868]];

  v9 = [(TKTokenKeychainCertificate *)self publicKeyHash];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F3B828]];

  uint64_t v10 = [(TKTokenKeychainCertificate *)self certificateType];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F3B658]];

  v11 = [(TKTokenKeychainCertificate *)self certificateEncoding];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F3B650]];

  return v3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)subject
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSubject:(id)a3
{
}

- (NSData)issuer
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIssuer:(id)a3
{
}

- (NSData)serialNumber
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSData)subjectKeyID
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubjectKeyID:(id)a3
{
}

- (NSData)publicKeyHash
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSNumber)certificateType
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCertificateType:(id)a3
{
}

- (NSNumber)certificateEncoding
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCertificateEncoding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateEncoding, 0);
  objc_storeStrong((id *)&self->_certificateType, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_subjectKeyID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end
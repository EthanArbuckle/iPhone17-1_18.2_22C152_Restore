@interface CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest
+ (BOOL)supportsSecureCoding;
- (CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest)initWithCoder:(id)a3;
- (NSData)activeCertificateData;
- (NSData)stagedCertificateData;
- (NSSet)recipients;
- (NSUUID)advertisingIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveCertificateData:(id)a3;
- (void)setAdvertisingIdentifier:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setStagedCertificateData:(id)a3;
@end

@implementation CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest;
  v5 = [(CATTaskRequest *)&v21 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSSet *)v9;

    v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"advertisingIdentifier"];
    advertisingIdentifier = v5->_advertisingIdentifier;
    v5->_advertisingIdentifier = (NSUUID *)v12;

    v14 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"activeCertificateData"];
    activeCertificateData = v5->_activeCertificateData;
    v5->_activeCertificateData = (NSData *)v15;

    v17 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"stagedCertificateData"];
    stagedCertificateData = v5->_stagedCertificateData;
    v5->_stagedCertificateData = (NSData *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v9 encodeWithCoder:v4];
  v5 = [(CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest *)self recipients];
  [v4 encodeObject:v5 forKey:@"recipients"];

  v6 = [(CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest *)self advertisingIdentifier];
  [v4 encodeObject:v6 forKey:@"advertisingIdentifier"];

  uint64_t v7 = [(CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest *)self activeCertificateData];
  [v4 encodeObject:v7 forKey:@"activeCertificateData"];

  v8 = [(CRKIdentitySharingSendAdvertisingIdentifierAndCertificateRequest *)self stagedCertificateData];
  [v4 encodeObject:v8 forKey:@"stagedCertificateData"];
}

- (NSSet)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSUUID)advertisingIdentifier
{
  return self->_advertisingIdentifier;
}

- (void)setAdvertisingIdentifier:(id)a3
{
}

- (NSData)activeCertificateData
{
  return self->_activeCertificateData;
}

- (void)setActiveCertificateData:(id)a3
{
}

- (NSData)stagedCertificateData
{
  return self->_stagedCertificateData;
}

- (void)setStagedCertificateData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedCertificateData, 0);
  objc_storeStrong((id *)&self->_activeCertificateData, 0);
  objc_storeStrong((id *)&self->_advertisingIdentifier, 0);

  objc_storeStrong((id *)&self->_recipients, 0);
}

@end
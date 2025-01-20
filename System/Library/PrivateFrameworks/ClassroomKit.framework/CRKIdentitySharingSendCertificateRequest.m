@interface CRKIdentitySharingSendCertificateRequest
+ (BOOL)supportsSecureCoding;
- (CRKIdentitySharingSendCertificateRequest)initWithCoder:(id)a3;
- (NSData)activeCertificateData;
- (NSData)stagedCertificateData;
- (NSSet)recipients;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveCertificateData:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setStagedCertificateData:(id)a3;
@end

@implementation CRKIdentitySharingSendCertificateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKIdentitySharingSendCertificateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRKIdentitySharingSendCertificateRequest;
  v5 = [(CATTaskRequest *)&v18 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSSet *)v9;

    v11 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"activeCertificateData"];
    activeCertificateData = v5->_activeCertificateData;
    v5->_activeCertificateData = (NSData *)v12;

    v14 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"stagedCertificateData"];
    stagedCertificateData = v5->_stagedCertificateData;
    v5->_stagedCertificateData = (NSData *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRKIdentitySharingSendCertificateRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(CRKIdentitySharingSendCertificateRequest *)self recipients];
  [v4 encodeObject:v5 forKey:@"recipients"];

  v6 = [(CRKIdentitySharingSendCertificateRequest *)self activeCertificateData];
  [v4 encodeObject:v6 forKey:@"activeCertificateData"];

  uint64_t v7 = [(CRKIdentitySharingSendCertificateRequest *)self stagedCertificateData];
  [v4 encodeObject:v7 forKey:@"stagedCertificateData"];
}

- (NSSet)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
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

  objc_storeStrong((id *)&self->_recipients, 0);
}

@end
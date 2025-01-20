@interface CRKIdentitySharingRequestCertificateRequest
+ (BOOL)supportsSecureCoding;
- (CRKIdentitySharingRequestCertificateRequest)initWithCoder:(id)a3;
- (NSString)recipient;
- (void)encodeWithCoder:(id)a3;
- (void)setRecipient:(id)a3;
@end

@implementation CRKIdentitySharingRequestCertificateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKIdentitySharingRequestCertificateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKIdentitySharingRequestCertificateRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"recipient"];
    recipient = v5->_recipient;
    v5->_recipient = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKIdentitySharingRequestCertificateRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKIdentitySharingRequestCertificateRequest *)self recipient];
  [v4 encodeObject:v5 forKey:@"recipient"];
}

- (NSString)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
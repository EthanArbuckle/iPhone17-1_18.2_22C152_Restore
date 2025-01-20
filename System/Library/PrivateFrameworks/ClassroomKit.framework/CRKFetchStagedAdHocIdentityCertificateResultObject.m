@interface CRKFetchStagedAdHocIdentityCertificateResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchStagedAdHocIdentityCertificateResultObject)initWithCoder:(id)a3;
- (NSData)stagedAdHocIdentityCertificate;
- (void)encodeWithCoder:(id)a3;
- (void)setStagedAdHocIdentityCertificate:(id)a3;
@end

@implementation CRKFetchStagedAdHocIdentityCertificateResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchStagedAdHocIdentityCertificateResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchStagedAdHocIdentityCertificateResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"stagedAdHocIdentityCertificate"];
    stagedAdHocIdentityCertificate = v5->_stagedAdHocIdentityCertificate;
    v5->_stagedAdHocIdentityCertificate = (NSData *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchStagedAdHocIdentityCertificateResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchStagedAdHocIdentityCertificateResultObject *)self stagedAdHocIdentityCertificate];
  [v4 encodeObject:v5 forKey:@"stagedAdHocIdentityCertificate"];
}

- (NSData)stagedAdHocIdentityCertificate
{
  return self->_stagedAdHocIdentityCertificate;
}

- (void)setStagedAdHocIdentityCertificate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
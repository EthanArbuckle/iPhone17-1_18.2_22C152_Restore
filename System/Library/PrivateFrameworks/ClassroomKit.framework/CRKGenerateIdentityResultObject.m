@interface CRKGenerateIdentityResultObject
+ (BOOL)supportsSecureCoding;
- (CRKGenerateIdentityResultObject)initWithCoder:(id)a3;
- (NSData)certificateData;
- (NSData)privateKeyData;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificateData:(id)a3;
- (void)setPrivateKeyData:(id)a3;
@end

@implementation CRKGenerateIdentityResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKGenerateIdentityResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v7 encodeWithCoder:v4];
  v5 = [(CRKGenerateIdentityResultObject *)self certificateData];
  [v4 encodeObject:v5 forKey:@"certificateData"];

  v6 = [(CRKGenerateIdentityResultObject *)self privateKeyData];
  [v4 encodeObject:v6 forKey:@"privateKeyData"];
}

- (CRKGenerateIdentityResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKGenerateIdentityResultObject;
  v5 = [(CATTaskResultObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"certificateData"];
    certificateData = v5->_certificateData;
    v5->_certificateData = (NSData *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"privateKeyData"];
    privateKeyData = v5->_privateKeyData;
    v5->_privateKeyData = (NSData *)v10;
  }
  return v5;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (void)setCertificateData:(id)a3
{
}

- (NSData)privateKeyData
{
  return self->_privateKeyData;
}

- (void)setPrivateKeyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeyData, 0);

  objc_storeStrong((id *)&self->_certificateData, 0);
}

@end
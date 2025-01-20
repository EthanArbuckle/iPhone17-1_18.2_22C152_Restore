@interface UARPTLVMeasuredPayload
+ (BOOL)supportsSecureCoding;
- (NSData)payloadDigest;
- (NSNumber)digestListSize;
- (NSNumber)effectiveProductionMode;
- (NSNumber)effectiveSecurityMode;
- (NSNumber)isTrusted;
- (NSString)payload4cc;
- (NSString)payloadLongname;
- (UARPTLVMeasuredPayload)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)hashAlgorithm;
- (void)encodeWithCoder:(id)a3;
- (void)setDigestListSize:(id)a3;
- (void)setEffectiveProductionMode:(id)a3;
- (void)setEffectiveSecurityMode:(id)a3;
- (void)setHashAlgorithm:(int64_t)a3;
- (void)setIsTrusted:(id)a3;
- (void)setPayload4cc:(id)a3;
- (void)setPayloadDigest:(id)a3;
- (void)setPayloadLongname:(id)a3;
@end

@implementation UARPTLVMeasuredPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPTLVMeasuredPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UARPTLVMeasuredPayload;
  v5 = [(UARPTLVMeasuredPayload *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload4cc"];
    payload4cc = v5->_payload4cc;
    v5->_payload4cc = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadLongname"];
    payloadLongname = v5->_payloadLongname;
    v5->_payloadLongname = (NSString *)v8;

    v5->_hashAlgorithm = [v4 decodeIntegerForKey:@"hashAlgorithm"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectiveSecurityMode"];
    effectiveSecurityMode = v5->_effectiveSecurityMode;
    v5->_effectiveSecurityMode = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectiveProductionMode"];
    effectiveProductionMode = v5->_effectiveProductionMode;
    v5->_effectiveProductionMode = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isTrusted"];
    isTrusted = v5->_isTrusted;
    v5->_isTrusted = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"digestListSize"];
    digestListSize = v5->_digestListSize;
    v5->_digestListSize = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadDigest"];
    payloadDigest = v5->_payloadDigest;
    v5->_payloadDigest = (NSData *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  payload4cc = self->_payload4cc;
  id v5 = a3;
  [v5 encodeObject:payload4cc forKey:@"payload4cc"];
  [v5 encodeObject:self->_payloadLongname forKey:@"payloadLongname"];
  [v5 encodeInteger:self->_hashAlgorithm forKey:@"hashAlgorithm"];
  [v5 encodeObject:self->_effectiveSecurityMode forKey:@"effectiveSecurityMode"];
  [v5 encodeObject:self->_effectiveProductionMode forKey:@"effectiveProductionMode"];
  [v5 encodeObject:self->_isTrusted forKey:@"isTrusted"];
  [v5 encodeObject:self->_digestListSize forKey:@"digestListSize"];
  [v5 encodeObject:self->_payloadDigest forKey:@"payloadDigest"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UARPTLVMeasuredPayload);
  uint64_t v5 = [(NSString *)self->_payload4cc copy];
  payload4cc = v4->_payload4cc;
  v4->_payload4cc = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_payloadLongname copy];
  payloadLongname = v4->_payloadLongname;
  v4->_payloadLongname = (NSString *)v7;

  v4->_hashAlgorithm = self->_hashAlgorithm;
  objc_storeStrong((id *)&v4->_effectiveSecurityMode, self->_effectiveSecurityMode);
  objc_storeStrong((id *)&v4->_effectiveProductionMode, self->_effectiveProductionMode);
  objc_storeStrong((id *)&v4->_isTrusted, self->_isTrusted);
  objc_storeStrong((id *)&v4->_digestListSize, self->_digestListSize);
  objc_storeStrong((id *)&v4->_payloadDigest, self->_payloadDigest);
  return v4;
}

- (NSString)payload4cc
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPayload4cc:(id)a3
{
}

- (NSString)payloadLongname
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPayloadLongname:(id)a3
{
}

- (int64_t)hashAlgorithm
{
  return self->_hashAlgorithm;
}

- (void)setHashAlgorithm:(int64_t)a3
{
  self->_hashAlgorithm = a3;
}

- (NSNumber)effectiveSecurityMode
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEffectiveSecurityMode:(id)a3
{
}

- (NSNumber)effectiveProductionMode
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEffectiveProductionMode:(id)a3
{
}

- (NSNumber)isTrusted
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIsTrusted:(id)a3
{
}

- (NSNumber)digestListSize
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDigestListSize:(id)a3
{
}

- (NSData)payloadDigest
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPayloadDigest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDigest, 0);
  objc_storeStrong((id *)&self->_digestListSize, 0);
  objc_storeStrong((id *)&self->_isTrusted, 0);
  objc_storeStrong((id *)&self->_effectiveProductionMode, 0);
  objc_storeStrong((id *)&self->_effectiveSecurityMode, 0);
  objc_storeStrong((id *)&self->_payloadLongname, 0);
  objc_storeStrong((id *)&self->_payload4cc, 0);
}

@end
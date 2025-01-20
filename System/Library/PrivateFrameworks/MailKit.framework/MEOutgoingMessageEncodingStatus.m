@interface MEOutgoingMessageEncodingStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)canEncrypt;
- (BOOL)canSign;
- (BOOL)shouldEncrypt;
- (BOOL)shouldSign;
- (MEOutgoingMessageEncodingStatus)initWithCanSign:(BOOL)a3 canEncrypt:(BOOL)a4 shouldSign:(BOOL)a5 shouldEncrypt:(BOOL)a6 securityError:(id)a7 addressesFailingEncryption:(id)a8;
- (MEOutgoingMessageEncodingStatus)initWithCanSign:(BOOL)canSign canEncrypt:(BOOL)canEncrypt securityError:(NSError *)securityError addressesFailingEncryption:(NSArray *)addressesFailingEncryption;
- (MEOutgoingMessageEncodingStatus)initWithCoder:(id)a3;
- (NSArray)addressesFailingEncryption;
- (NSError)securityError;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MEOutgoingMessageEncodingStatus

- (MEOutgoingMessageEncodingStatus)initWithCanSign:(BOOL)canSign canEncrypt:(BOOL)canEncrypt securityError:(NSError *)securityError addressesFailingEncryption:(NSArray *)addressesFailingEncryption
{
  v11 = securityError;
  v12 = addressesFailingEncryption;
  v16.receiver = self;
  v16.super_class = (Class)MEOutgoingMessageEncodingStatus;
  v13 = [(MEOutgoingMessageEncodingStatus *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_canSign = canSign;
    v13->_canEncrypt = canEncrypt;
    objc_storeStrong((id *)&v13->_securityError, securityError);
    objc_storeStrong((id *)&v14->_addressesFailingEncryption, addressesFailingEncryption);
  }

  return v14;
}

- (MEOutgoingMessageEncodingStatus)initWithCanSign:(BOOL)a3 canEncrypt:(BOOL)a4 shouldSign:(BOOL)a5 shouldEncrypt:(BOOL)a6 securityError:(id)a7 addressesFailingEncryption:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)MEOutgoingMessageEncodingStatus;
  v17 = [(MEOutgoingMessageEncodingStatus *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_canSign = a3;
    v17->_canEncrypt = a4;
    v17->_shouldSign = a5;
    v17->_shouldEncrypt = a6;
    objc_storeStrong((id *)&v17->_securityError, a7);
    objc_storeStrong((id *)&v18->_addressesFailingEncryption, a8);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEOutgoingMessageEncodingStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"EFPropertyKey_canSign"];
  uint64_t v6 = [v4 decodeBoolForKey:@"EFPropertyKey_canEncrypt"];
  uint64_t v7 = [v4 decodeBoolForKey:@"EFPropertyKey_shouldSign"];
  uint64_t v8 = [v4 decodeBoolForKey:@"EFPropertyKey_shouldEncrypt"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_securityError"];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"EFPropertyKey_addressesFailingEncryption"];

  v14 = [(MEOutgoingMessageEncodingStatus *)self initWithCanSign:v5 canEncrypt:v6 shouldSign:v7 shouldEncrypt:v8 securityError:v9 addressesFailingEncryption:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", -[MEOutgoingMessageEncodingStatus canSign](self, "canSign"), @"EFPropertyKey_canSign");
  objc_msgSend(v6, "encodeBool:forKey:", -[MEOutgoingMessageEncodingStatus canEncrypt](self, "canEncrypt"), @"EFPropertyKey_canEncrypt");
  objc_msgSend(v6, "encodeBool:forKey:", -[MEOutgoingMessageEncodingStatus shouldSign](self, "shouldSign"), @"EFPropertyKey_shouldSign");
  objc_msgSend(v6, "encodeBool:forKey:", -[MEOutgoingMessageEncodingStatus shouldEncrypt](self, "shouldEncrypt"), @"EFPropertyKey_shouldEncrypt");
  id v4 = [(MEOutgoingMessageEncodingStatus *)self securityError];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_securityError"];

  uint64_t v5 = [(MEOutgoingMessageEncodingStatus *)self addressesFailingEncryption];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_addressesFailingEncryption"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(MEOutgoingMessageEncodingStatus *)self canSign];
  BOOL v6 = [(MEOutgoingMessageEncodingStatus *)self canEncrypt];
  uint64_t v7 = [(MEOutgoingMessageEncodingStatus *)self securityError];
  uint64_t v8 = objc_msgSend(v7, "ef_publicDescription");
  v9 = [(MEOutgoingMessageEncodingStatus *)self addressesFailingEncryption];
  v10 = [v3 stringWithFormat:@"%@: canSign: %d, canEncrypt: %d, securityError: %@, addressesFailingEncryption: %lu", v4, v5, v6, v8, objc_msgSend(v9, "count")];

  return v10;
}

- (BOOL)canSign
{
  return self->_canSign;
}

- (BOOL)canEncrypt
{
  return self->_canEncrypt;
}

- (NSError)securityError
{
  return self->_securityError;
}

- (NSArray)addressesFailingEncryption
{
  return self->_addressesFailingEncryption;
}

- (BOOL)shouldSign
{
  return self->_shouldSign;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressesFailingEncryption, 0);
  objc_storeStrong((id *)&self->_securityError, 0);
}

@end
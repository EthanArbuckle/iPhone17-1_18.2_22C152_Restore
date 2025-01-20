@interface IDSCloudKitTransportLogChangeToken
+ (BOOL)supportsSecureCoding;
- (IDSCKServerChangeToken)ckToken;
- (IDSCloudKitTransportLogChangeToken)initWithCKToken:(id)a3;
- (IDSCloudKitTransportLogChangeToken)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCkToken:(id)a3;
@end

@implementation IDSCloudKitTransportLogChangeToken

- (IDSCloudKitTransportLogChangeToken)initWithCKToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSCloudKitTransportLogChangeToken;
  v6 = [(IDSCloudKitTransportLogChangeToken *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ckToken, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSCloudKitTransportLogChangeToken)initWithCoder:(id)a3
{
  id v5 = objc_msgSend_decodeObjectForKey_(a3, a2, @"IDSCloudKitTransportLogChangeTokenCKToken", v3);
  v8 = (IDSCloudKitTransportLogChangeToken *)objc_msgSend_initWithCKToken_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_ckToken(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v10, v9, @"IDSCloudKitTransportLogChangeTokenCKToken");
}

- (IDSCKServerChangeToken)ckToken
{
  return self->_ckToken;
}

- (void)setCkToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
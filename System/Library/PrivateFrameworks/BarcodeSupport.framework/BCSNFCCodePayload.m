@interface BCSNFCCodePayload
+ (BOOL)supportsSecureCoding;
- (BCSNFCCodePayload)initWithCoder:(id)a3;
- (BCSNFCCodePayload)initWithNFCPayload:(id)a3;
- (int64_t)codeType;
- (void)encodeWithCoder:(id)a3;
- (void)savePayloadInUserActivity:(id)a3;
@end

@implementation BCSNFCCodePayload

- (BCSNFCCodePayload)initWithNFCPayload:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSNFCCodePayload;
  v6 = [(BCSNFCCodePayload *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nfcPayload, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)codeType
{
  return 2;
}

- (void)savePayloadInUserActivity:(id)a3
{
}

- (BCSNFCCodePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", getNFCNDEFMessageClass(), @"payloadData");

  v6 = [(BCSNFCCodePayload *)self initWithNFCPayload:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
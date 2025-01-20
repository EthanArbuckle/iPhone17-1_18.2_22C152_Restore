@interface BCSQRCodePayload
+ (BOOL)supportsSecureCoding;
- (BCSQRCodePayload)initWithBarcodeDescriptor:(id)a3;
- (BCSQRCodePayload)initWithCoder:(id)a3;
- (int64_t)codeType;
- (void)encodeWithCoder:(id)a3;
- (void)savePayloadInUserActivity:(id)a3;
@end

@implementation BCSQRCodePayload

- (BCSQRCodePayload)initWithBarcodeDescriptor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSQRCodePayload;
  v6 = [(BCSQRCodePayload *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_barcodeDescriptor, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)codeType
{
  return 1;
}

- (void)savePayloadInUserActivity:(id)a3
{
}

- (BCSQRCodePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "_bcs_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"payloadData");

  v6 = [(BCSQRCodePayload *)self initWithBarcodeDescriptor:v5];
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
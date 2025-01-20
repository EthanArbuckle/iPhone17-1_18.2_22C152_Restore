@interface AMSFDSRequest
+ (BOOL)supportsSecureCoding;
- (ACAccount)account;
- (AMSFDSOptions)options;
- (AMSFDSRequest)initWithCoder:(id)a3;
- (AMSFDSRequest)initWithPurchaseIdentifier:(id)a3 account:(id)a4 options:(id)a5;
- (NSNumber)purchaseIdentifier;
- (NSString)logKey;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)accountType;
- (void)encodeWithCoder:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation AMSFDSRequest

- (AMSFDSRequest)initWithPurchaseIdentifier:(id)a3 account:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AMSFDSRequest;
  v11 = [(AMSFDSRequest *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a4);
    objc_storeStrong((id *)&v12->_options, a5);
    uint64_t v13 = [v8 copy];
    purchaseIdentifier = v12->_purchaseIdentifier;
    v12->_purchaseIdentifier = (NSNumber *)v13;
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(ACAccount *)self->_account copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_logKey copyWithZone:a3];
  id v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(AMSFDSOptions *)self->_options copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSNumber *)self->_purchaseIdentifier copyWithZone:a3];
  uint64_t v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(AMSFDSRequest *)self account];

  if (v4) {
    [v9 encodeObject:self->_account forKey:@"kCodingKeyAccount"];
  }
  v5 = [(AMSFDSRequest *)self logKey];

  if (v5) {
    [v9 encodeObject:self->_logKey forKey:@"kCodingKeyLogKey"];
  }
  uint64_t v6 = [(AMSFDSRequest *)self options];

  if (v6) {
    [v9 encodeObject:self->_options forKey:@"kCodingKeyOptions"];
  }
  v7 = [(AMSFDSRequest *)self purchaseIdentifier];

  if (v7)
  {
    uint64_t v8 = [(AMSFDSRequest *)self purchaseIdentifier];
    [v9 encodeObject:v8 forKey:@"kCodingKeyPurchaseIdentifier"];
  }
}

- (AMSFDSRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSFDSRequest;
  v5 = [(AMSFDSRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyAccount"];
    account = v5->_account;
    v5->_account = (ACAccount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyLogKey"];
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyOptions"];
    options = v5->_options;
    v5->_options = (AMSFDSOptions *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyPurchaseIdentifier"];
    purchaseIdentifier = v5->_purchaseIdentifier;
    v5->_purchaseIdentifier = (NSNumber *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)accountType
{
  v3 = [(AMSFDSRequest *)self account];
  char v4 = objc_msgSend(v3, "ams_isiCloudAccount");

  if (v4) {
    return 2;
  }
  uint64_t v6 = [(AMSFDSRequest *)self account];
  unsigned int v7 = objc_msgSend(v6, "ams_isiTunesAccount");

  return v7;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (AMSFDSOptions)options
{
  return self->_options;
}

- (NSNumber)purchaseIdentifier
{
  return self->_purchaseIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseIdentifier, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
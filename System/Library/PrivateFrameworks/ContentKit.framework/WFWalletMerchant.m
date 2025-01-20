@interface WFWalletMerchant
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (NSString)uniqueIdentifier;
- (NSURL)logoURL;
- (WFWalletMerchant)initWithCoder:(id)a3;
- (WFWalletMerchant)initWithDisplayName:(id)a3 uniqueIdentifier:(id)a4 logoURL:(id)a5 merchantType:(unint64_t)a6;
- (unint64_t)merchantType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWalletMerchant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (unint64_t)merchantType
{
  return self->_merchantType;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFWalletMerchant *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(WFWalletMerchant *)self uniqueIdentifier];
      v8 = [(WFWalletMerchant *)v6 uniqueIdentifier];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (WFWalletMerchant)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFWalletMerchant;
  v5 = [(WFWalletMerchant *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoURL"];
    logoURL = v5->_logoURL;
    v5->_logoURL = (NSURL *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantType"];
    v5->_merchantType = [v12 unsignedIntegerValue];
    v13 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFWalletMerchant *)self displayName];
  [v4 encodeObject:v5 forKey:@"displayName"];

  uint64_t v6 = [(WFWalletMerchant *)self uniqueIdentifier];
  [v4 encodeObject:v6 forKey:@"uniqueIdentifier"];

  v7 = [(WFWalletMerchant *)self logoURL];
  [v4 encodeObject:v7 forKey:@"logoURL"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFWalletMerchant merchantType](self, "merchantType"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"merchantType"];
}

- (WFWalletMerchant)initWithDisplayName:(id)a3 uniqueIdentifier:(id)a4 logoURL:(id)a5 merchantType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)WFWalletMerchant;
  v13 = [(WFWalletMerchant *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    uniqueIdentifier = v13->_uniqueIdentifier;
    v13->_uniqueIdentifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    logoURL = v13->_logoURL;
    v13->_logoURL = (NSURL *)v18;

    v13->_merchantType = a6;
    v20 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
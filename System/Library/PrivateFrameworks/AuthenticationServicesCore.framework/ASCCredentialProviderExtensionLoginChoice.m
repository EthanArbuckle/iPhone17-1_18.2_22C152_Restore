@interface ASCCredentialProviderExtensionLoginChoice
+ (BOOL)supportsSecureCoding;
- (ASCCredentialProviderExtensionLoginChoice)initWithCoder:(id)a3;
- (ASCCredentialProviderExtensionLoginChoice)initWithProviderName:(id)a3 providerBundleID:(id)a4 providerExtensionContainingAppBundleID:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)providerExtensionBundleID;
- (NSString)providerExtensionContainingAppBundleID;
- (NSString)providerName;
- (unint64_t)loginChoiceKind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCCredentialProviderExtensionLoginChoice

- (ASCCredentialProviderExtensionLoginChoice)initWithProviderName:(id)a3 providerBundleID:(id)a4 providerExtensionContainingAppBundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASCCredentialProviderExtensionLoginChoice;
  v11 = [(ASCCredentialProviderExtensionLoginChoice *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    providerName = v11->_providerName;
    v11->_providerName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    providerExtensionBundleID = v11->_providerExtensionBundleID;
    v11->_providerExtensionBundleID = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    providerExtensionContainingAppBundleID = v11->_providerExtensionContainingAppBundleID;
    v11->_providerExtensionContainingAppBundleID = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (unint64_t)loginChoiceKind
{
  return 6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    providerName = self->_providerName;
    v7 = [v5 providerName];
    if ([(NSString *)providerName isEqualToString:v7])
    {
      providerExtensionBundleID = self->_providerExtensionBundleID;
      id v9 = [v5 providerExtensionBundleID];
      BOOL v10 = [(NSString *)providerExtensionBundleID isEqualToString:v9];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  providerName = self->_providerName;
  id v5 = a3;
  [v5 encodeObject:providerName forKey:@"providerName"];
  [v5 encodeObject:self->_providerExtensionBundleID forKey:@"providerExtensionBundleID"];
  [v5 encodeObject:self->_providerExtensionContainingAppBundleID forKey:@"providerExtensionContainingAppBundleID"];
}

- (ASCCredentialProviderExtensionLoginChoice)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerExtensionBundleID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerExtensionContainingAppBundleID"];

  id v8 = [(ASCCredentialProviderExtensionLoginChoice *)self initWithProviderName:v5 providerBundleID:v6 providerExtensionContainingAppBundleID:v7];
  return v8;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (NSString)providerExtensionBundleID
{
  return self->_providerExtensionBundleID;
}

- (NSString)providerExtensionContainingAppBundleID
{
  return self->_providerExtensionContainingAppBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerExtensionContainingAppBundleID, 0);
  objc_storeStrong((id *)&self->_providerExtensionBundleID, 0);

  objc_storeStrong((id *)&self->_providerName, 0);
}

@end
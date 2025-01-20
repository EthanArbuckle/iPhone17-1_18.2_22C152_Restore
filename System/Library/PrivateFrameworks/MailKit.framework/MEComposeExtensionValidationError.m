@interface MEComposeExtensionValidationError
- (MEComposeExtensionValidationError)initWithExtensionName:(id)a3 icon:(id)a4 error:(id)a5;
- (NSError)error;
- (NSString)extensionDisplayName;
- (UIImage)icon;
- (void)setError:(id)a3;
- (void)setExtensionDisplayName:(id)a3;
- (void)setIcon:(id)a3;
@end

@implementation MEComposeExtensionValidationError

- (MEComposeExtensionValidationError)initWithExtensionName:(id)a3 icon:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MEComposeExtensionValidationError;
  v12 = [(MEComposeExtensionValidationError *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_extensionDisplayName, a3);
    objc_storeStrong((id *)&v13->_icon, a4);
    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)extensionDisplayName
{
  return self->_extensionDisplayName;
}

- (void)setExtensionDisplayName:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_extensionDisplayName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
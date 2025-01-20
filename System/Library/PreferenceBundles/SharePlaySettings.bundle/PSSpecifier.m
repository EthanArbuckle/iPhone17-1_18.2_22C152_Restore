@interface PSSpecifier
- (SharePlayProviderController)sharePlayProviderController;
- (TUUserConfiguration)sharePlay_userConfiguration;
@end

@implementation PSSpecifier

- (SharePlayProviderController)sharePlayProviderController
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(PSSpecifier *)self propertyForKey:v4];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (SharePlayProviderController *)v6;
}

- (TUUserConfiguration)sharePlay_userConfiguration
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(PSSpecifier *)self propertyForKey:v4];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return (TUUserConfiguration *)v6;
}

@end
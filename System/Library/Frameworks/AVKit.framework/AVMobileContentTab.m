@interface AVMobileContentTab
- (AVMobileContentTab)initWithCustomInfoViewController:(id)a3 accessibilityIdentifier:(id)a4;
- (NSString)accessibilityIdentifier;
- (NSString)displayName;
- (UIViewController)viewController;
@end

@implementation AVMobileContentTab

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (AVMobileContentTab)initWithCustomInfoViewController:(id)a3 accessibilityIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 title];
  v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v11 = [v9 stringByTrimmingCharactersInSet:v10];

  if (!v11 || ![v11 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Empty or no title provided for info view controller in -[AVPlayerViewController customInfoViewControllers]: %@", v7 format];
  }
  v15.receiver = self;
  v15.super_class = (Class)AVMobileContentTab;
  v12 = [(AVMobileContentTab *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessibilityIdentifier, a4);
    objc_storeStrong((id *)&v13->_displayName, v11);
    objc_storeStrong((id *)&v13->_viewController, a3);
  }

  return v13;
}

@end
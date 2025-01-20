@interface BCSShadowAction
- (BCSAction)originalAction;
- (BCSActionDelegate)delegate;
- (BCSShadowAction)initWithURL:(id)a3 appLink:(id)a4 originalAction:(id)a5;
- (BOOL)hasSensitiveURL;
- (BOOL)isAMSAction;
- (BOOL)isAirplayPairingAction;
- (BOOL)isApplePayInitiateAction;
- (BOOL)isContinuityCameraAction;
- (BOOL)isInvalidDataAction;
- (BOOL)isLiveCameraOnlyAction;
- (BOOL)isPasskeyAction;
- (BOOL)isPasskeyAssertionAction;
- (BOOL)isPasskeyRegistrationAction;
- (BOOL)isWiFiAction;
- (BOOL)shouldRequireUserToPickTargetApp;
- (CPSClipMetadataRequest)clipMetadataRequest;
- (LSAppLink)appLink;
- (NSArray)actionPickerItems;
- (NSArray)appLinks;
- (NSDictionary)debugDescriptionDictionary;
- (NSString)defaultActionTargetApplicationBundleIdentifier;
- (NSString)extraPreviewText;
- (NSString)localizedActionDescription;
- (NSString)localizedDefaultActionDescription;
- (NSString)localizedDefaultActionTitle;
- (NSURL)url;
- (NSURL)urlThatCanBeOpened;
- (int64_t)codeType;
- (void)performAction;
- (void)setClipMetadataRequest:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BCSShadowAction

- (BCSShadowAction)initWithURL:(id)a3 appLink:(id)a4 originalAction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BCSShadowAction;
  v12 = [(BCSShadowAction *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_appLink, a4);
    objc_storeStrong((id *)&v13->_originalAction, a5);
    appLink = v13->_appLink;
    if (appLink)
    {
      uint64_t v15 = [(LSAppLink *)appLink targetApplicationProxy];
    }
    else
    {
      if (!objc_msgSend(v9, "_bcs_isHTTPFamilyURL"))
      {
        v16 = [MEMORY[0x263F01880] defaultWorkspace];
        v17 = [v16 applicationsAvailableForOpeningURL:v13->_url];
        uint64_t v18 = [v17 firstObject];
        applicationProxy = v13->_applicationProxy;
        v13->_applicationProxy = (LSApplicationProxy *)v18;

        goto LABEL_8;
      }
      uint64_t v15 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.mobilesafari"];
    }
    v16 = v13->_applicationProxy;
    v13->_applicationProxy = (LSApplicationProxy *)v15;
LABEL_8:

    v20 = v13;
  }

  return v13;
}

- (NSURL)urlThatCanBeOpened
{
  return self->_url;
}

- (NSString)defaultActionTargetApplicationBundleIdentifier
{
  return (NSString *)[(LSApplicationProxy *)self->_applicationProxy bundleIdentifier];
}

- (NSDictionary)debugDescriptionDictionary
{
  return (NSDictionary *)MEMORY[0x263EFFA78];
}

- (NSArray)actionPickerItems
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F29B78];
  v4 = [(LSApplicationProxy *)self->_applicationProxy localizedShortName];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__BCSShadowAction_actionPickerItems__block_invoke;
  v8[3] = &unk_26524BD30;
  v8[4] = self;
  v5 = [v3 actionPickerItemWithLabel:v4 actionHandler:v8];
  v9[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  return (NSArray *)v6;
}

uint64_t __36__BCSShadowAction_actionPickerItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

- (void)performAction
{
  id v3 = [MEMORY[0x263F82438] sharedApplication];
  [v3 openURL:self->_url options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (NSString)localizedDefaultActionDescription
{
  return (NSString *)[(LSApplicationProxy *)self->_applicationProxy localizedName];
}

- (NSString)localizedDefaultActionTitle
{
  return (NSString *)[(LSApplicationProxy *)self->_applicationProxy localizedShortName];
}

- (BCSActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (BCSActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)extraPreviewText
{
  return self->extraPreviewText;
}

- (NSString)localizedActionDescription
{
  return self->localizedActionDescription;
}

- (BOOL)isInvalidDataAction
{
  return self->isInvalidDataAction;
}

- (BOOL)isWiFiAction
{
  return self->isWiFiAction;
}

- (int64_t)codeType
{
  return self->codeType;
}

- (CPSClipMetadataRequest)clipMetadataRequest
{
  return self->clipMetadataRequest;
}

- (void)setClipMetadataRequest:(id)a3
{
}

- (BOOL)shouldRequireUserToPickTargetApp
{
  return self->shouldRequireUserToPickTargetApp;
}

- (BOOL)hasSensitiveURL
{
  return self->hasSensitiveURL;
}

- (BOOL)isAMSAction
{
  return self->isAMSAction;
}

- (BOOL)isPasskeyAction
{
  return self->isPasskeyAction;
}

- (BOOL)isPasskeyAssertionAction
{
  return self->isPasskeyAssertionAction;
}

- (BOOL)isPasskeyRegistrationAction
{
  return self->isPasskeyRegistrationAction;
}

- (BOOL)isApplePayInitiateAction
{
  return self->isApplePayInitiateAction;
}

- (BOOL)isLiveCameraOnlyAction
{
  return self->isLiveCameraOnlyAction;
}

- (BOOL)isAirplayPairingAction
{
  return self->isAirplayPairingAction;
}

- (BOOL)isContinuityCameraAction
{
  return self->isContinuityCameraAction;
}

- (NSArray)appLinks
{
  return self->appLinks;
}

- (NSURL)url
{
  return self->_url;
}

- (LSAppLink)appLink
{
  return self->_appLink;
}

- (BCSAction)originalAction
{
  return self->_originalAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAction, 0);
  objc_storeStrong((id *)&self->_appLink, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->appLinks, 0);
  objc_storeStrong((id *)&self->clipMetadataRequest, 0);
  objc_storeStrong((id *)&self->localizedActionDescription, 0);
  objc_storeStrong((id *)&self->extraPreviewText, 0);
  objc_destroyWeak((id *)&self->delegate);

  objc_storeStrong((id *)&self->_applicationProxy, 0);
}

@end
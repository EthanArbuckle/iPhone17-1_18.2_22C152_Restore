@interface BCSURLActionPickerItem
- (BCSCodePayload)codePayload;
- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 appLink:(id)a5 codePayload:(id)a6;
- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 appLink:(id)a5 codePayload:(id)a6 preferApplicationIcon:(BOOL)a7;
- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 url:(id)a5 applicationRecord:(id)a6;
- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 url:(id)a5 applicationRecord:(id)a6 preferApplicationIcon:(BOOL)a7;
- (BOOL)useInlineMenu;
- (LSAppLink)appLink;
- (id)actionURL;
- (id)icon;
- (id)targetApplicationBundleIdentifier;
- (void)performAction;
- (void)performActionWithFBOptions:(id)a3;
@end

@implementation BCSURLActionPickerItem

- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 url:(id)a5 applicationRecord:(id)a6 preferApplicationIcon:(BOOL)a7
{
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BCSURLActionPickerItem;
  v15 = [(BCSActionPickerItem *)&v19 initWithLabel:a3 action:a4];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_url, a5);
    objc_storeStrong((id *)&v16->_applicationRecord, a6);
    v16->_preferApplicationIcon = a7;
    v17 = v16;
  }

  return v16;
}

- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 url:(id)a5 applicationRecord:(id)a6
{
  return [(BCSURLActionPickerItem *)self initWithLabel:a3 action:a4 url:a5 applicationRecord:a6 preferApplicationIcon:0];
}

- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 appLink:(id)a5 codePayload:(id)a6
{
  return [(BCSURLActionPickerItem *)self initWithLabel:a3 action:a4 appLink:a5 codePayload:a6 preferApplicationIcon:0];
}

- (BCSURLActionPickerItem)initWithLabel:(id)a3 action:(id)a4 appLink:(id)a5 codePayload:(id)a6 preferApplicationIcon:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)BCSURLActionPickerItem;
  v15 = [(BCSActionPickerItem *)&v21 initWithLabel:a3 action:a4];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appLink, a5);
    objc_storeStrong((id *)&v16->_codePayload, a6);
    v16->_preferApplicationIcon = v7;
    if (v7)
    {
      uint64_t v17 = [(LSAppLink *)v16->_appLink targetApplicationRecord];
      applicationRecord = v16->_applicationRecord;
      v16->_applicationRecord = (LSApplicationRecord *)v17;
    }
    objc_super v19 = v16;
  }

  return v16;
}

- (id)icon
{
  v3 = [(LSApplicationRecord *)self->_applicationRecord bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.mobilesafari"];

  if (v4) {
    goto LABEL_7;
  }
  if (!self->_preferApplicationIcon
    || !self->_applicationRecord
    || (id UIImageClass = getUIImageClass(),
        [(LSApplicationRecord *)self->_applicationRecord bundleIdentifier],
        v6 = objc_claimAutoreleasedReturnValue(),
        MGGetFloat32Answer(),
        [UIImageClass _applicationIconImageForBundleIdentifier:v6 format:0 scale:v7],
        v8 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v8))
  {
    if (!self->_url && !self->_appLink)
    {
      v9 = @"arrow.up.forward.app";
      goto LABEL_8;
    }
LABEL_7:
    v9 = @"safari";
LABEL_8:
    v8 = [getUIImageClass() systemImageNamed:v9];
  }
  return v8;
}

- (void)performActionWithFBOptions:(id)a3
{
  id v4 = a3;
  appLink = self->_appLink;
  BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
  if (appLink)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSURLActionPickerItem: opening app link", buf, 2u);
    }
    _bcs_openAppLinkIgnoringOpenStrategy(self->_appLink, v4, self->_codePayload);
    float v7 = +[BCSQRCodeParser sharedParser];
    v8 = [(LSAppLink *)self->_appLink targetApplicationProxy];
    v9 = [v8 bundleIdentifier];
    v10 = [(LSAppLink *)self->_appLink URL];
    [v7 setPreferredBundleIdentifier:v9 forURL:v10];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSURLActionPickerItem: opening url", buf, 2u);
    }
    if ([(NSURL *)self->_url _bcs_isUPIURL])
    {
      v11 = +[BCSQRCodeParser sharedParser];
      v12 = [(LSApplicationRecord *)self->_applicationRecord bundleIdentifier];
      [v11 setPreferredBundleIdentifier:v12 forURL:self->_url];
    }
    id v13 = [(BCSActionPickerItem *)self action];
    int v14 = [v13 hasSensitiveURL];

    if (v14)
    {
      v15 = [MEMORY[0x263F01880] defaultWorkspace];
      url = self->_url;
      id v26 = 0;
      char v17 = [v15 openSensitiveURL:url withOptions:v4 error:&v26];
      id v18 = v26;

      if ((v17 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BCSURLActionPickerItem performActionWithFBOptions:]((uint64_t)v18);
      }
    }
    else
    {
      applicationRecord = self->_applicationRecord;
      v20 = [MEMORY[0x263F01880] defaultWorkspace];
      objc_super v21 = v20;
      v22 = self->_url;
      if (applicationRecord)
      {
        v23 = [(LSApplicationRecord *)self->_applicationRecord bundleIdentifier];
        id v18 = [v21 operationToOpenResource:v22 usingApplication:v23 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0 userInfo:0 options:v4 delegate:0];

        [v18 start];
      }
      else
      {
        id v25 = 0;
        char v24 = [v20 openURL:v22 withOptions:v4 error:&v25];
        id v18 = v25;

        if ((v24 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BCSURLActionPickerItem performActionWithFBOptions:]((uint64_t)v18);
        }
      }
    }

    [(BCSActionPickerItem *)self didPerformAction];
  }
}

- (void)performAction
{
}

- (id)targetApplicationBundleIdentifier
{
  if (self->_appLink)
  {
    v2 = [(LSAppLink *)self->_appLink targetApplicationProxy];
    v3 = [v2 bundleIdentifier];
  }
  else
  {
    v3 = [(LSApplicationRecord *)self->_applicationRecord bundleIdentifier];
  }
  return v3;
}

- (id)actionURL
{
  if (self->_appLink)
  {
    v2 = [(LSAppLink *)self->_appLink URL];
  }
  else
  {
    v2 = self->_url;
  }
  return v2;
}

- (BOOL)useInlineMenu
{
  v3 = [(LSApplicationRecord *)self->_applicationRecord bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.mobilesafari"];

  return (v4 & 1) == 0 && self->_applicationRecord != 0;
}

- (LSAppLink)appLink
{
  return self->_appLink;
}

- (BCSCodePayload)codePayload
{
  return self->_codePayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codePayload, 0);
  objc_storeStrong((id *)&self->_appLink, 0);
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)performActionWithFBOptions:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138477827;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSURLAction: cannot open Home app with sensitive URL with error: %{private}@", (uint8_t *)&v1, 0xCu);
}

@end
@interface CKAppInstallation
- (BOOL)installed;
- (CKAppInstallation)init;
- (CKAppInstallation)initWithBundleIdentifier:(id)a3;
- (CKAppInstallation)initWithBundleIdentifier:(id)a3 startTime:(double)a4;
- (LSApplicationProxy)proxy;
- (LSApplicationWorkspace)_applicationWorkspace;
- (NSString)bundleIdentifier;
- (NSString)localizedDisplayName;
- (NSString)pluginBundleIdentifier;
- (UIImage)icon;
- (double)percentComplete;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)installState;
- (void)setInstallState:(unint64_t)a3;
- (void)setPercentComplete:(double)a3;
- (void)setProxy:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation CKAppInstallation

- (CKAppInstallation)initWithBundleIdentifier:(id)a3 startTime:(double)a4
{
  id v7 = a3;
  if (v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)CKAppInstallation;
    v8 = [(CKAppInstallation *)&v16 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
      v10 = (void *)MEMORY[0x1E4F223B8];
      v11 = [(CKAppInstallation *)v9 bundleIdentifier];
      uint64_t v12 = [v10 applicationProxyForIdentifier:v11];
      proxy = v9->_proxy;
      v9->_proxy = (LSApplicationProxy *)v12;

      v9->_startTime = a4;
      if (!v9->_proxy)
      {

        v9 = 0;
      }
    }
    self = v9;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setProxy:(id)a3
{
  v5 = (LSApplicationProxy *)a3;
  if (self->_proxy != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_proxy, a3);
    icon = self->_icon;
    self->_icon = 0;

    v5 = v7;
  }
}

- (CKAppInstallation)init
{
  return [(CKAppInstallation *)self initWithBundleIdentifier:0];
}

- (CKAppInstallation)initWithBundleIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  [v6 timeIntervalSinceReferenceDate];
  id v7 = -[CKAppInstallation initWithBundleIdentifier:startTime:](self, "initWithBundleIdentifier:startTime:", v5);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CKAppInstallation alloc];
  id v5 = [(CKAppInstallation *)self bundleIdentifier];
  uint64_t v6 = [(CKAppInstallation *)v4 initWithBundleIdentifier:v5];

  [(CKAppInstallation *)self percentComplete];
  objc_msgSend((id)v6, "setPercentComplete:");
  *(void *)(v6 + 40) = self->_installState;
  objc_storeStrong((id *)(v6 + 24), self->_icon);
  *(double *)(v6 + 48) = self->_startTime;
  return (id)v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)pluginBundleIdentifier
{
  v2 = [(CKAppInstallation *)self proxy];
  v3 = objc_msgSend(v2, "__ck_messagesPluginKitProxy");
  v4 = [v3 bundleIdentifier];

  return (NSString *)v4;
}

- (NSString)localizedDisplayName
{
  v2 = [(CKAppInstallation *)self proxy];
  v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (LSApplicationProxy)proxy
{
  return self->_proxy;
}

- (BOOL)installed
{
  v2 = [(CKAppInstallation *)self proxy];
  char v3 = [v2 isInstalled];

  return v3;
}

- (UIImage)icon
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_icon)
  {
    char v3 = [(CKAppInstallation *)self proxy];
    v4 = objc_msgSend(v3, "__ck_messagesPluginKitProxy");
    objc_msgSend(v4, "__ck_icon");
    id v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    icon = self->_icon;
    self->_icon = v5;

    if (!self->_icon)
    {
      id v7 = [(CKAppInstallation *)self proxy];
      objc_msgSend(v7, "__ck_icon");
      v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
      v9 = self->_icon;
      self->_icon = v8;
    }
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = self->_icon;
        int v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Loaded icon: %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  uint64_t v12 = self->_icon;

  return v12;
}

- (id)description
{
  char v3 = NSString;
  v4 = [(CKAppInstallation *)self bundleIdentifier];
  [(CKAppInstallation *)self percentComplete];
  uint64_t v6 = v5;
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CKAppInstallation installState](self, "installState"));
  v8 = [(CKAppInstallation *)self proxy];
  int v9 = [v8 isInstalled];
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  v11 = [v3 stringWithFormat:@"CKAppInstallation[%@, %f%% complete, install state=%@, installed=%@, icon=%@]", v4, v6, v7, v10, self->_icon];

  return v11;
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (unint64_t)installState
{
  return self->_installState;
}

- (void)setInstallState:(unint64_t)a3
{
  self->_installState = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (LSApplicationWorkspace)_applicationWorkspace
{
  return self->__applicationWorkspace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_proxy, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
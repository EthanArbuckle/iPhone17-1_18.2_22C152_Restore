@interface _SFWebViewUsageMonitor
- (BOOL)shouldAudit;
- (BOOL)urlHasIDFA;
- (BOOL)urlHasQueryString;
- (BOOL)userInteracted;
- (BOOL)viewControllerViewIsHidden;
- (NSString)stringAsAuditKey;
- (_SFWebViewUsageMonitor)initWithHostAppIdentifier:(id)a3;
- (void)auditUsageIfNeeded;
- (void)checkURL:(id)a3;
- (void)setUrlHasIDFA:(BOOL)a3;
- (void)setUrlHasQueryString:(BOOL)a3;
- (void)setUserInteracted:(BOOL)a3;
- (void)setViewControllerViewIsHidden:(BOOL)a3;
@end

@implementation _SFWebViewUsageMonitor

- (_SFWebViewUsageMonitor)initWithHostAppIdentifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFWebViewUsageMonitor;
  v5 = [(_SFWebViewUsageMonitor *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    hostAppIdentifier = v5->_hostAppIdentifier;
    v5->_hostAppIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)shouldAudit
{
  if (![(_SFWebViewUsageMonitor *)self userInteracted]
    && [(_SFWebViewUsageMonitor *)self urlHasQueryString])
  {
    return 1;
  }

  return [(_SFWebViewUsageMonitor *)self urlHasIDFA];
}

- (NSString)stringAsAuditKey
{
  unsigned __int16 v3 = [(_SFWebViewUsageMonitor *)self urlHasIDFA];
  if ([(_SFWebViewUsageMonitor *)self urlHasQueryString]) {
    v3 |= 2u;
  }
  if (![(_SFWebViewUsageMonitor *)self userInteracted]) {
    v3 |= 4u;
  }
  BOOL v4 = [(_SFWebViewUsageMonitor *)self viewControllerViewIsHidden];
  unsigned __int16 v5 = v3 | 8;
  if (!v4) {
    unsigned __int16 v5 = v3;
  }
  return (NSString *)[NSString stringWithFormat:@"com.apple.SafariViewService.WebViewUsage.%X.%@", v5, self->_hostAppIdentifier];
}

- (void)auditUsageIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(_SFWebViewUsageMonitor *)self shouldAudit])
  {
    unsigned __int16 v3 = WBS_LOG_CHANNEL_PREFIXUserTrackingDetection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      hostAppIdentifier = self->_hostAppIdentifier;
      unsigned __int16 v5 = v3;
      int v7 = 138544386;
      v8 = hostAppIdentifier;
      __int16 v9 = 1024;
      BOOL v10 = [(_SFWebViewUsageMonitor *)self urlHasIDFA];
      __int16 v11 = 1024;
      BOOL v12 = [(_SFWebViewUsageMonitor *)self urlHasQueryString];
      __int16 v13 = 1024;
      BOOL v14 = [(_SFWebViewUsageMonitor *)self userInteracted];
      __int16 v15 = 1024;
      BOOL v16 = [(_SFWebViewUsageMonitor *)self viewControllerViewIsHidden];
      _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_DEFAULT, "Found possible user tracking in app (%{public}@). Details: [hasIDFA: %d, hasQueryString: %d, userInteracted: %d, viewIsHidden: %d]", (uint8_t *)&v7, 0x24u);
    }
    uint64_t v6 = [MEMORY[0x1E4F98948] sharedLogger];
    objc_msgSend(v6, "didDetectPossibleUserTrackingInHostApp:urlHasIDFA:urlHasQueryString:userInteracted:viewControllerIsHidden:", self->_hostAppIdentifier, -[_SFWebViewUsageMonitor urlHasIDFA](self, "urlHasIDFA"), -[_SFWebViewUsageMonitor urlHasQueryString](self, "urlHasQueryString"), -[_SFWebViewUsageMonitor userInteracted](self, "userInteracted"), -[_SFWebViewUsageMonitor viewControllerViewIsHidden](self, "viewControllerViewIsHidden"));
  }
}

- (void)checkURL:(id)a3
{
  id v7 = a3;
  if ([MEMORY[0x1E4F223E0] instancesRespondToSelector:sel_urlContainsDeviceIdentifierForAdvertising_])
  {
    BOOL v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    unsigned __int16 v5 = objc_msgSend(v7, "safari_originalDataAsString");
    -[_SFWebViewUsageMonitor setUrlHasIDFA:](self, "setUrlHasIDFA:", [v4 urlContainsDeviceIdentifierForAdvertising:v5]);
  }
  uint64_t v6 = [v7 query];
  if ((unint64_t)[v6 length] >= 5) {
    [(_SFWebViewUsageMonitor *)self setUrlHasQueryString:1];
  }
}

- (BOOL)userInteracted
{
  return self->_userInteracted;
}

- (void)setUserInteracted:(BOOL)a3
{
  self->_userInteracted = a3;
}

- (BOOL)urlHasQueryString
{
  return self->_urlHasQueryString;
}

- (void)setUrlHasQueryString:(BOOL)a3
{
  self->_urlHasQueryString = a3;
}

- (BOOL)urlHasIDFA
{
  return self->_urlHasIDFA;
}

- (void)setUrlHasIDFA:(BOOL)a3
{
  self->_urlHasIDFA = a3;
}

- (BOOL)viewControllerViewIsHidden
{
  return self->_viewControllerViewIsHidden;
}

- (void)setViewControllerViewIsHidden:(BOOL)a3
{
  self->_viewControllerViewIsHidden = a3;
}

- (void).cxx_destruct
{
}

@end
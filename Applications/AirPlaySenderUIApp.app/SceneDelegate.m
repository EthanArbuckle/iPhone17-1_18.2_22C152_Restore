@interface SceneDelegate
- (BOOL)_setupAssistantEnabled;
- (UIWindow)window;
- (void)_handleURL:(id)a3;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v6 = [a5 URLContexts:a3, a4];
  v7 = [v6 allObjects];
  id v10 = [v7 firstObject];

  if (dword_10001EF18 <= 30 && (dword_10001EF18 != -1 || _LogCategory_Initialize()))
  {
    v9 = [v10 URL];
    LogPrintF();
  }
  v8 = [v10 URL:v9];
  [(SceneDelegate *)self _handleURL:v8];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  v5 = [a4 allObjects];
  id v8 = [v5 firstObject];

  if (dword_10001EF18 <= 30 && (dword_10001EF18 != -1 || _LogCategory_Initialize()))
  {
    v7 = [v8 URL];
    LogPrintF();
  }
  v6 = [v8 URL:v7];
  [(SceneDelegate *)self _handleURL:v6];
}

- (void)_handleURL:(id)a3
{
  v4 = (__CFString *)a3;
  if (!v4)
  {
    if (dword_10001EF18 > 30 || dword_10001EF18 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (![(SceneDelegate *)self _setupAssistantEnabled])
  {
    if (dword_10001EF18 > 60 || dword_10001EF18 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (dword_10001EF18 <= 50 && (dword_10001EF18 != -1 || _LogCategory_Initialize()))
  {
    int v5 = IsAppleInternalBuild();
    CFStringRef v6 = @"#Redacted#";
    if (v5) {
      CFStringRef v6 = v4;
    }
    CFStringRef v13 = v6;
    LogPrintF();
  }
  v7 = [(__CFString *)v4 absoluteString];
  id v8 = +[APUIAirPlayURLParser setupPayloadFromAirPlayURL:v7];

  if (!v8)
  {
    if (dword_10001EF18 > 50 || dword_10001EF18 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_26;
    }
    IsAppleInternalBuild();
LABEL_25:
    LogPrintF();
LABEL_26:
    v11 = 0;
    id v8 = 0;
    v9 = 0;
    goto LABEL_27;
  }
  id v14 = 0;
  v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v14];
  id v10 = v14;
  if (v10)
  {
    v11 = v10;
    if (dword_10001EF18 <= 50 && (dword_10001EF18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    CFStringRef v15 = @"setupPayload";
    v16 = v9;
    v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    +[APUIAirPlaySetupFlowLauncher launchAirPlaySetupFlowWithUserInfo:v12];

    v11 = 0;
  }
LABEL_27:
}

- (BOOL)_setupAssistantEnabled
{
  char IsFeatureEnabled = 0;
  if (!APSRemoteConfigGetShared() || !APSRemoteConfigGetBooleanIfPresent()) {
    char IsFeatureEnabled = APSSettingsIsFeatureEnabled();
  }
  if (dword_10001EF18 <= 50 && (dword_10001EF18 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return IsFeatureEnabled != 0;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
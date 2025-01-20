@interface DKDiagnosticContextMock
- (void)allowSessionAccessoryDisconnectForDuration:(id)a3;
- (void)clearAllowSessionAccessoryDisconnect;
- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6;
- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10;
- (void)enableVolumeHUD:(BOOL)a3;
- (void)getAsset:(id)a3 completion:(id)a4;
- (void)requestPluginReloadOnFinishWithCompletion:(id)a3;
- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3;
- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4;
- (void)showUI:(id)a3 completion:(id)a4;
- (void)unpairSessionAccessoryOnTestCompletion;
- (void)updateProgress:(id)a3 forTest:(id)a4;
- (void)uploadAssets:(id)a3 completion:(id)a4;
@end

@implementation DKDiagnosticContextMock

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    v9 = "-[DKDiagnosticContextMock updateProgress:forTest:]";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_23D039000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)enableVolumeHUD:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[DKDiagnosticContextMock enableVolumeHUD:]";
    __int16 v7 = 1024;
    BOOL v8 = v3;
    _os_log_impl(&dword_23D039000, v4, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    BOOL v8 = "-[DKDiagnosticContextMock setScreenToBrightness:animate:]";
    __int16 v9 = 2048;
    double v10 = a3;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_23D039000, v6, OS_LOG_TYPE_DEFAULT, "%s: %f, %d", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void)getAsset:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  int v7 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    double v10 = "-[DKDiagnosticContextMock getAsset:completion:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_23D039000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  BOOL v8 = [MEMORY[0x263EFF8F8] data];
  v6[2](v6, v8);
}

- (void)uploadAssets:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  int v7 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    double v10 = "-[DKDiagnosticContextMock uploadAssets:completion:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_23D039000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  BOOL v8 = [MEMORY[0x263EFF8C0] array];
  v6[2](v6, v8, 0);
}

- (void)showUI:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  int v7 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[DKDiagnosticContextMock showUI:completion:]";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_23D039000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  v6[2](v6, MEMORY[0x263EFFA78]);
}

- (void)requestPluginReloadOnFinishWithCompletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = (void (**)(void))a3;
  BOOL v4 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DKDiagnosticContextMock requestPluginReloadOnFinishWithCompletion:]";
    _os_log_impl(&dword_23D039000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3);
}

- (void)unpairSessionAccessoryOnTestCompletion
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    BOOL v4 = "-[DKDiagnosticContextMock unpairSessionAccessoryOnTestCompletion]";
    _os_log_impl(&dword_23D039000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = (void (**)(id, __CFString *, void))a3;
  BOOL v4 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[DKDiagnosticContextMock requestSessionAccessoryIdentifierWithCompletion:]";
    _os_log_impl(&dword_23D039000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3, &stru_26F0D5118, 0);
}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[DKDiagnosticContextMock allowSessionAccessoryDisconnectForDuration:]";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_23D039000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)clearAllowSessionAccessoryDisconnect
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    BOOL v4 = "-[DKDiagnosticContextMock clearAllowSessionAccessoryDisconnect]";
    _os_log_impl(&dword_23D039000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[DKDiagnosticContextMock displayAlertWithHeader:message:buttonStrings:completion:]";
    _os_log_impl(&dword_23D039000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  __int16 v10 = DiagnosticsKitLogHandleForCategory(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[DKDiagnosticContextMock displayInstructions:style:imageLocators:title:subtitle:iconLocator:options:completion:]";
    _os_log_impl(&dword_23D039000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }
}

@end
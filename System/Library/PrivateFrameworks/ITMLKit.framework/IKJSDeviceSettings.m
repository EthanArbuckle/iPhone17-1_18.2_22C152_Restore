@interface IKJSDeviceSettings
- (CGSize)screen;
- (IKAppDeviceConfig)deviceConfig;
- (IKJSDeviceSettings)initWithAppContext:(id)a3 deviceConfig:(id)a4;
- (IKJSRestrictions)restrictions;
- (NSString)language;
- (NSString)name;
- (NSString)preferredVideoFormat;
- (NSString)preferredVideoPreviewFormat;
- (NSString)storefrontCountryCode;
- (id)_formatStringForVideoFormat:(unint64_t)a3;
- (id)asPrivateIKJSDeviceSettings;
- (void)_restrictionsDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setDeviceConfig:(id)a3;
@end

@implementation IKJSDeviceSettings

- (id)asPrivateIKJSDeviceSettings
{
  if ([(IKJSDeviceSettings *)self conformsToProtocol:&unk_1F3E50718]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (IKJSDeviceSettings)initWithAppContext:(id)a3 deviceConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IKJSDeviceSettings;
  v8 = [(IKJSObject *)&v18 initWithAppContext:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_deviceConfig, v7);
    v10 = +[IKJSRestrictions restrictionsDidChangeNotificationName];
    if ([v10 length])
    {
      objc_initWeak(&location, v9);
      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__IKJSDeviceSettings_initWithAppContext_deviceConfig___block_invoke;
      v15[3] = &unk_1E6DE48C0;
      objc_copyWeak(&v16, &location);
      uint64_t v12 = [v11 addObserverForName:v10 object:0 queue:0 usingBlock:v15];
      id restrictionDidChangeToken = v9->_restrictionDidChangeToken;
      v9->_id restrictionDidChangeToken = (id)v12;

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  return v9;
}

void __54__IKJSDeviceSettings_initWithAppContext_deviceConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained appContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__IKJSDeviceSettings_initWithAppContext_deviceConfig___block_invoke_2;
    v8[3] = &unk_1E6DE48E8;
    objc_copyWeak(&v10, v4);
    id v9 = v3;
    [v7 evaluate:v8 completionBlock:0];

    objc_destroyWeak(&v10);
  }
}

void __54__IKJSDeviceSettings_initWithAppContext_deviceConfig___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _restrictionsDidChangeNotification:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)dealloc
{
  if (self->_restrictionDidChangeToken)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_restrictionDidChangeToken];
  }
  v4.receiver = self;
  v4.super_class = (Class)IKJSDeviceSettings;
  [(IKJSDeviceSettings *)&v4 dealloc];
}

- (NSString)name
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)language
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  id v12 = 0;
  id v3 = [(IKJSObject *)self appContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__IKJSDeviceSettings_language__block_invoke;
  v6[3] = &unk_1E6DE3860;
  v6[4] = self;
  v6[5] = &v7;
  [v3 evaluateDelegateBlockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __30__IKJSDeviceSettings_language__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) deviceConfig];
  uint64_t v2 = [v5 systemLanguage];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)storefrontCountryCode
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__18;
  v11 = __Block_byref_object_dispose__18;
  id v12 = 0;
  uint64_t v3 = [(IKJSObject *)self appContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__IKJSDeviceSettings_storefrontCountryCode__block_invoke;
  v6[3] = &unk_1E6DE3860;
  v6[4] = self;
  v6[5] = &v7;
  [v3 evaluateDelegateBlockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __43__IKJSDeviceSettings_storefrontCountryCode__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) deviceConfig];
  uint64_t v2 = [v5 storeFrontCountryCode];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)preferredVideoFormat
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(IKJSObject *)self appContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__IKJSDeviceSettings_preferredVideoFormat__block_invoke;
  v6[3] = &unk_1E6DE3860;
  v6[4] = self;
  v6[5] = &v7;
  [v3 evaluateDelegateBlockSync:v6];

  id v4 = [(IKJSDeviceSettings *)self _formatStringForVideoFormat:v8[3]];
  _Block_object_dispose(&v7, 8);
  return (NSString *)v4;
}

void __42__IKJSDeviceSettings_preferredVideoFormat__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceConfig];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 preferredVideoFormat];
}

- (NSString)preferredVideoPreviewFormat
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(IKJSObject *)self appContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__IKJSDeviceSettings_preferredVideoPreviewFormat__block_invoke;
  v6[3] = &unk_1E6DE3860;
  v6[4] = self;
  v6[5] = &v7;
  [v3 evaluateDelegateBlockSync:v6];

  id v4 = [(IKJSDeviceSettings *)self _formatStringForVideoFormat:v8[3]];
  _Block_object_dispose(&v7, 8);
  return (NSString *)v4;
}

void __49__IKJSDeviceSettings_preferredVideoPreviewFormat__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceConfig];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 preferredVideoPreviewFormat];
}

- (CGSize)screen
{
  uint64_t v9 = 0;
  uint64_t v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  id v12 = &unk_1E2B9EDE1;
  uint64_t v3 = [(IKJSObject *)self appContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__IKJSDeviceSettings_screen__block_invoke;
  v8[3] = &unk_1E6DE3860;
  void v8[4] = self;
  v8[5] = &v9;
  [v3 evaluateDelegateBlockSync:v8];

  double v4 = v10[4];
  double v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  double v6 = v4;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

void __28__IKJSDeviceSettings_screen__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) deviceConfig];
  [v5 screenSize];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
}

- (IKJSRestrictions)restrictions
{
  uint64_t v3 = [IKJSRestrictions alloc];
  uint64_t v4 = [(IKJSObject *)self appContext];
  id v5 = [(IKJSObject *)v3 initWithAppContext:v4];

  return v5;
}

- (id)_formatStringForVideoFormat:(unint64_t)a3
{
  uint64_t v3 = @"SD";
  if (a3 != 1) {
    uint64_t v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"HD";
  }
}

- (void)_restrictionsDidChangeNotification:(id)a3
{
  id v3 = [(IKJSObject *)self invokeMethod:@"onRestrictionsChange" withArguments:0];
}

- (IKAppDeviceConfig)deviceConfig
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceConfig);
  return (IKAppDeviceConfig *)WeakRetained;
}

- (void)setDeviceConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceConfig);
  objc_storeStrong(&self->_restrictionDidChangeToken, 0);
}

@end
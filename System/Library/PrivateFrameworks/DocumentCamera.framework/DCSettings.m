@interface DCSettings
+ (id)sharedSettings;
- (BOOL)enableViewService;
- (BOOL)finishAfterFirstScan;
- (BOOL)useDocumentSegmentationRequest;
- (DCSettings)init;
- (NSUserDefaults)userDefaults;
- (double)imageQuality;
- (id)enableViewServiceBoxed;
- (id)finishAfterFirstScanBoxed;
- (id)imageQualityBoxed;
- (id)useDocumentSegmentationRequestBoxed;
- (void)setEnableViewServiceBoxed:(id)a3;
- (void)setFinishAfterFirstScanBoxed:(id)a3;
- (void)setImageQualityBoxed:(id)a3;
- (void)setUseDocumentSegmentationRequestBoxed:(id)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation DCSettings

- (DCSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)DCSettings;
  v2 = [(DCSettings *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.DocumentCamera"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

+ (id)sharedSettings
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__DCSettings_sharedSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSettings_once != -1) {
    dispatch_once(&sharedSettings_once, block);
  }
  v2 = (void *)sharedSettings_sharedSettings;

  return v2;
}

void __28__DCSettings_sharedSettings__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedSettings_sharedSettings;
  sharedSettings_sharedSettings = (uint64_t)v1;
}

- (BOOL)enableViewService
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"EnableViewService"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = DCDebugInterfaceEnabled();
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)finishAfterFirstScan
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"DCFinishAfterFirstScan"];
}

- (BOOL)useDocumentSegmentationRequest
{
  v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"UseDocumentSegmentationRequest"];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (double)imageQuality
{
  v7[1] = *MEMORY[0x263EF8340];
  userDefaults = self->_userDefaults;
  objc_super v6 = @"DCImageQuality";
  v7[0] = &unk_26C7ED580;
  char v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(NSUserDefaults *)userDefaults registerDefaults:v4];

  [(NSUserDefaults *)self->_userDefaults doubleForKey:@"DCImageQuality"];
  return result;
}

- (id)enableViewServiceBoxed
{
  v2 = NSNumber;
  BOOL v3 = [(DCSettings *)self enableViewService];

  return (id)[v2 numberWithBool:v3];
}

- (void)setEnableViewServiceBoxed:(id)a3
{
  userDefaults = self->_userDefaults;
  id v5 = a3;
  -[NSUserDefaults setBool:forKey:](userDefaults, "setBool:forKey:", [v5 BOOLValue], @"EnableViewService");
  uint64_t v6 = *MEMORY[0x263F08100];
  v7 = [(NSUserDefaults *)self->_userDefaults persistentDomainForName:*MEMORY[0x263F08100]];
  id v8 = (id)[v7 mutableCopy];

  [v8 setObject:v5 forKey:@"EnableViewService"];
  [(NSUserDefaults *)self->_userDefaults setPersistentDomain:v8 forName:v6];
}

- (id)finishAfterFirstScanBoxed
{
  v2 = NSNumber;
  BOOL v3 = [(DCSettings *)self finishAfterFirstScan];

  return (id)[v2 numberWithBool:v3];
}

- (void)setFinishAfterFirstScanBoxed:(id)a3
{
  userDefaults = self->_userDefaults;
  id v5 = a3;
  -[NSUserDefaults setBool:forKey:](userDefaults, "setBool:forKey:", [v5 BOOLValue], @"DCFinishAfterFirstScan");
  uint64_t v6 = *MEMORY[0x263F08100];
  v7 = [(NSUserDefaults *)self->_userDefaults persistentDomainForName:*MEMORY[0x263F08100]];
  id v8 = (id)[v7 mutableCopy];

  [v8 setObject:v5 forKey:@"DCFinishAfterFirstScan"];
  [(NSUserDefaults *)self->_userDefaults setPersistentDomain:v8 forName:v6];
}

- (id)useDocumentSegmentationRequestBoxed
{
  v2 = NSNumber;
  BOOL v3 = [(DCSettings *)self useDocumentSegmentationRequest];

  return (id)[v2 numberWithBool:v3];
}

- (void)setUseDocumentSegmentationRequestBoxed:(id)a3
{
  userDefaults = self->_userDefaults;
  id v5 = a3;
  -[NSUserDefaults setBool:forKey:](userDefaults, "setBool:forKey:", [v5 BOOLValue], @"UseDocumentSegmentationRequest");
  uint64_t v6 = *MEMORY[0x263F08100];
  v7 = [(NSUserDefaults *)self->_userDefaults persistentDomainForName:*MEMORY[0x263F08100]];
  id v8 = (id)[v7 mutableCopy];

  [v8 setObject:v5 forKey:@"UseDocumentSegmentationRequest"];
  [(NSUserDefaults *)self->_userDefaults setPersistentDomain:v8 forName:v6];
}

- (id)imageQualityBoxed
{
  v2 = NSNumber;
  [(DCSettings *)self imageQuality];

  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (void)setImageQualityBoxed:(id)a3
{
  userDefaults = self->_userDefaults;
  [a3 doubleValue];
  -[NSUserDefaults setDouble:forKey:](userDefaults, "setDouble:forKey:", @"DCImageQuality");
  uint64_t v5 = *MEMORY[0x263F08100];
  uint64_t v6 = [(NSUserDefaults *)self->_userDefaults persistentDomainForName:*MEMORY[0x263F08100]];
  id v7 = (id)[v6 mutableCopy];

  [v7 setObject:@"DCImageQuality" forKey:@"DCImageQuality"];
  [(NSUserDefaults *)self->_userDefaults setPersistentDomain:v7 forName:v5];
}

- (NSUserDefaults)userDefaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
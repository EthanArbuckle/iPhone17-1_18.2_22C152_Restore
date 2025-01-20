@interface ASTTestAutomation
+ (id)sharedInstance;
+ (void)postServerRequest:(id)a3;
+ (void)postServerResponse:(id)a3;
- (ASTTestAutomation)init;
- (BOOL)testAutomationEnabled;
- (void)setTestAutomationEnabled:(BOOL)a3;
@end

@implementation ASTTestAutomation

- (ASTTestAutomation)init
{
  v9.receiver = self;
  v9.super_class = (Class)ASTTestAutomation;
  v2 = [(ASTTestAutomation *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_testAutomationEnabled = 0;
    CFPreferencesAppSynchronize(@"com.apple.AppleServiceToolkit");
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"TestAutomation", @"com.apple.AppleServiceToolkit", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v5 = AppBooleanValue == 0;
    }
    else {
      BOOL v5 = 1;
    }
    char v6 = !v5;
    v3->_testAutomationEnabled = v6;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_singleton;

  return v2;
}

uint64_t __35__ASTTestAutomation_sharedInstance__block_invoke()
{
  sharedInstance_singleton = objc_alloc_init(ASTTestAutomation);

  return MEMORY[0x270F9A758]();
}

+ (void)postServerResponse:(id)a3
{
  v8[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (+[ASTLinking isAXRuntimeFrameworkAvailable])
  {
    v4 = +[ASTTestAutomation sharedInstance];
    int v5 = [v4 testAutomationEnabled];

    if (v5)
    {
      v7[0] = @"event";
      v7[1] = @"type";
      v8[0] = @"ASTTestAutomationEvent";
      v8[1] = @"ServerResponse";
      v7[2] = @"info";
      v8[2] = v3;
      char v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
      UIAccessibilityPostNotification(0xFA2u, v6);
    }
  }
}

+ (void)postServerRequest:(id)a3
{
  v8[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (+[ASTLinking isAXRuntimeFrameworkAvailable])
  {
    v4 = +[ASTTestAutomation sharedInstance];
    int v5 = [v4 testAutomationEnabled];

    if (v5)
    {
      v7[0] = @"event";
      v7[1] = @"type";
      v8[0] = @"ASTTestAutomationEvent";
      v8[1] = @"ServerRequest";
      v7[2] = @"info";
      v8[2] = v3;
      char v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
      UIAccessibilityPostNotification(0xFA2u, v6);
    }
  }
}

- (BOOL)testAutomationEnabled
{
  return self->_testAutomationEnabled;
}

- (void)setTestAutomationEnabled:(BOOL)a3
{
  self->_testAutomationEnabled = a3;
}

@end
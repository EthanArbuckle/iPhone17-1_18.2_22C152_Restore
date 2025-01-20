@interface DSTestAutomation
+ (id)sharedInstance;
+ (void)postConfiguration:(id)a3;
+ (void)postInteractiveTestEvent:(id)a3 info:(id)a4;
- (BOOL)testAutomationEnabled;
- (DSTestAutomation)init;
- (void)setTestAutomationEnabled:(BOOL)a3;
@end

@implementation DSTestAutomation

- (DSTestAutomation)init
{
  v9.receiver = self;
  v9.super_class = (Class)DSTestAutomation;
  v2 = [(DSTestAutomation *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_testAutomationEnabled = 0;
    CFPreferencesAppSynchronize(@"com.apple.Diagnostics");
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"TestAutomation", @"com.apple.Diagnostics", &keyExistsAndHasValidFormat);
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
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_singleton;

  return v2;
}

void __34__DSTestAutomation_sharedInstance__block_invoke(id a1)
{
  sharedInstance_singleton = objc_alloc_init(DSTestAutomation);

  _objc_release_x1();
}

+ (void)postInteractiveTestEvent:(id)a3 info:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[DSTestAutomation sharedInstance];
  unsigned int v8 = [v7 testAutomationEnabled];

  if (v8)
  {
    v10[0] = @"event";
    v10[1] = @"type";
    v11[0] = @"DSTestAutomationEvent";
    v11[1] = @"InteractiveTestEvent";
    v10[2] = @"interactiveEvent";
    v10[3] = @"info";
    v11[2] = v5;
    v11[3] = v6;
    objc_super v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
    UIAccessibilityPostNotification(0xFA2u, v9);
  }
}

+ (void)postConfiguration:(id)a3
{
  id v3 = a3;
  v4 = +[DSTestAutomation sharedInstance];
  unsigned int v5 = [v4 testAutomationEnabled];

  if (v5)
  {
    v7[0] = @"event";
    v7[1] = @"type";
    v8[0] = @"DSTestAutomationEvent";
    v8[1] = @"Configuration";
    v7[2] = @"info";
    v8[2] = v3;
    id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
    UIAccessibilityPostNotification(0xFA2u, v6);
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
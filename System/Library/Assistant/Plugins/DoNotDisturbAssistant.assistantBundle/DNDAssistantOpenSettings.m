@interface DNDAssistantOpenSettings
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation DNDAssistantOpenSettings

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v5 = a4;
  v6 = (void (**)(id, void *))a3;
  +[NSURL URLWithString:@"prefs:root=DO_NOT_DISTURB"];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 openSensitiveURL:v9];

  id v7 = objc_alloc_init((Class)SACommandSucceeded);
  v8 = [v7 dictionary];
  v6[2](v6, v8);
}

@end
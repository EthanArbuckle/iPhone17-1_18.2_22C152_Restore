@interface CHUISWidgetRequestLaunchAction
- (CHUISWidgetRequestLaunchAction)initWithLaunchRequest:(id)a3 responder:(id)a4;
- (id)launchRequest;
@end

@implementation CHUISWidgetRequestLaunchAction

- (CHUISWidgetRequestLaunchAction)initWithLaunchRequest:(id)a3 responder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  [v8 setObject:v6 forSetting:1];
  v9 = (void *)[v8 copy];
  v12.receiver = self;
  v12.super_class = (Class)CHUISWidgetRequestLaunchAction;
  v10 = [(CHUISWidgetRequestLaunchAction *)&v12 initWithInfo:v9 responder:v7];

  return v10;
}

- (id)launchRequest
{
  v2 = [(CHUISWidgetRequestLaunchAction *)self info];
  v3 = [v2 objectForSetting:1];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end
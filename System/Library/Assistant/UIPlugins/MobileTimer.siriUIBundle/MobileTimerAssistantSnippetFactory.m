@interface MobileTimerAssistantSnippetFactory
- (id)viewControllerForSnippet:(id)a3;
@end

@implementation MobileTimerAssistantSnippetFactory

- (id)viewControllerForSnippet:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [[MobileTimerAssistantTimerSnippetController alloc] initWithTimerSnippet:v6];
  }
  else
  {
    objc_opt_class();
    id v8 = v4;
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    if (v10)
    {
      v7 = [[MobileTimerAssistantWorldClockSnippetController alloc] initWithClockSnippet:v10];
    }
    else
    {
      objc_opt_class();
      id v11 = v8;
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
      id v13 = v12;

      if (v13)
      {
        v7 = [[MobileTimerAssistantAlarmSnippetController alloc] initWithAlarmSnippet:v13];
      }
      else
      {
        v14 = MTLogForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_97B8((uint64_t)v11, v14);
        }

        v7 = 0;
      }
    }
  }

  return v7;
}

@end
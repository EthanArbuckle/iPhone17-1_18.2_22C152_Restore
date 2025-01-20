@interface CCUIFeedbackAssistantModule
- (id)_primaryApplicationBundleIdentifier;
- (id)launchURLForTouchType:(int64_t)a3;
@end

@implementation CCUIFeedbackAssistantModule

- (id)launchURLForTouchType:(int64_t)a3
{
  v3 = [(CCUIFeedbackAssistantModule *)self _primaryApplicationBundleIdentifier];
  v4 = objc_opt_new();
  [v4 setScheme:@"applefeedback"];
  [v4 setHost:@"new"];
  [v4 setQueryItems:MEMORY[0x263EFFA68]];
  if (v3)
  {
    v5 = [MEMORY[0x263F08BD0] queryItemWithName:@"bundleID" value:v3];
    v6 = [v4 queryItems];
    v7 = [v6 arrayByAddingObject:v5];
    [v4 setQueryItems:v7];
  }
  v8 = [v4 URL];

  return v8;
}

- (id)_primaryApplicationBundleIdentifier
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F3F728];
  v3 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  v4 = [v2 monitorWithConfiguration:v3];

  v5 = [v4 currentLayout];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = objc_msgSend(v5, "elements", 0);
  v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isUIApplicationElement] && objc_msgSend(v10, "layoutRole") == 1)
        {
          v7 = [v10 bundleIdentifier];
          goto LABEL_12;
        }
      }
      v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  [v4 invalidate];

  return v7;
}

@end
@interface INIntent(AssistantCardService)
- (id)acs_utteranceForCardService;
@end

@implementation INIntent(AssistantCardService)

- (id)acs_utteranceForCardService
{
  v2 = [a1 launchId];

  if (!v2)
  {
    v9 = [a1 _title];
    goto LABEL_10;
  }
  v3 = [a1 launchId];
  INExtractAppInfoFromSiriLaunchId();
  id v4 = 0;

  v5 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v4];
  v6 = [v5 appState];
  char v7 = [v6 isValid];

  if (v7)
  {
    v8 = v5;
  }
  else
  {
    v8 = [MEMORY[0x263F01868] applicationProxyForSystemPlaceholder:v4];

    v10 = [v8 appState];
    char v11 = [v10 isValid];

    if ((v11 & 1) == 0)
    {
      v9 = [a1 _title];
      goto LABEL_9;
    }
    v5 = v8;
  }
  v12 = [v5 localizedName];
  v13 = NSString;
  v14 = [a1 _title];
  v9 = [v13 stringWithFormat:@"%@ using %@", v14, v12];

LABEL_9:
LABEL_10:
  return v9;
}

@end
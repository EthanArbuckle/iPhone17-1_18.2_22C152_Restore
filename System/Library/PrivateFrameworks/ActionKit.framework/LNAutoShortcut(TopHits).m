@interface LNAutoShortcut(TopHits)
+ (id)parameterOverrides;
- (id)actionParameterIdentifier;
@end

@implementation LNAutoShortcut(TopHits)

- (id)actionParameterIdentifier
{
  v2 = [a1 parameterPresentation];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 parameterIdentifier];
    v5 = [a1 bundleIdentifier];
    int v6 = [v5 isEqualToString:*MEMORY[0x263F85598]];

    if (v6)
    {
      v7 = [MEMORY[0x263F51F20] parameterOverrides];
      v8 = [a1 actionIdentifier];
      v9 = [v7 objectForKeyedSubscript:v8];

      if (v9)
      {
        id v10 = v9;

        v4 = v10;
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)parameterOverrides
{
  if (parameterOverrides_onceToken != -1) {
    dispatch_once(&parameterOverrides_onceToken, &__block_literal_global_28699);
  }
  v0 = (void *)parameterOverrides_parameterOverrides;
  return v0;
}

@end
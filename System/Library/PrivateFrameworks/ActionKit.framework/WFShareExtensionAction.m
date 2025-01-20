@interface WFShareExtensionAction
+ (id)userInterfaceProtocol;
- (id)contentItemClasses;
- (id)extensionBundleIdentifier;
- (id)extensionUserInfo;
- (id)inputConfiguration;
- (id)inputContentClasses;
- (id)inputType;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)shareExtensionDefinition;
- (id)socialServiceType;
- (id)socialTypes;
- (id)stringRepresentationForClasses:(id)a3;
- (id)textItemHandling;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFShareExtensionAction

- (id)extensionUserInfo
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [(WFShareExtensionAction *)self shareExtensionDefinition];
  v4 = [v3 objectForKey:@"UserInfo"];

  if (v4)
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v19 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v10 = [v9 objectForKey:@"ParameterKey"];
          v11 = [v9 objectForKey:@"DestinationKey"];
          v12 = [v9 objectForKey:@"ItemClass"];
          Class v13 = NSClassFromString(v12);

          v14 = [(WFShareExtensionAction *)self parameterValueForKey:v10 ofClass:v13];
          if (v14)
          {
            v15 = [v9 objectForKey:@"ValueMapping"];
            v16 = v15;
            if (v15)
            {
              v17 = [v15 objectForKey:v14];
              [v21 setObject:v17 forKey:v11];
            }
            else
            {
              [v21 setObject:v14 forKey:v11];
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v6);
    }

    v4 = v19;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)textItemHandling
{
  v2 = [(WFShareExtensionAction *)self shareExtensionDefinition];
  v3 = [v2 objectForKey:@"TextItemHandling"];
  v4 = v3;
  if (!v3) {
    v3 = @"ItemProvider";
  }
  uint64_t v5 = v3;

  return v5;
}

- (id)socialTypes
{
  v2 = [(WFShareExtensionAction *)self shareExtensionDefinition];
  v3 = [v2 objectForKey:@"SLTypes"];

  return v3;
}

- (id)inputType
{
  v2 = [(WFShareExtensionAction *)self shareExtensionDefinition];
  v3 = [v2 objectForKey:@"InputType"];

  return v3;
}

- (id)contentItemClasses
{
  v2 = [(WFShareExtensionAction *)self shareExtensionDefinition];
  v3 = [v2 objectForKey:@"ContentItemClasses"];

  v4 = objc_msgSend(v3, "if_flatMap:", &__block_literal_global_295);

  return v4;
}

Class __44__WFShareExtensionAction_contentItemClasses__block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (id)inputContentClasses
{
  v3 = [(WFShareExtensionAction *)self contentItemClasses];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(WFShareExtensionAction *)self inputType];
    if ([v6 isEqualToString:@"SLTypes"])
    {
      uint64_t v7 = (void *)MEMORY[0x263EFFA08];
      v8 = [(WFShareExtensionAction *)self socialTypes];
      v9 = [v7 setWithArray:v8];

      id v5 = (id)objc_opt_new();
      if ([v9 containsObject:@"Text"]) {
        [v5 addObject:objc_opt_class()];
      }
      if ([v9 containsObject:@"URL"]) {
        [v5 addObject:objc_opt_class()];
      }
      if ([v9 containsObject:@"Image"]) {
        [v5 addObject:objc_opt_class()];
      }
      if ([v9 containsObject:@"File"]) {
        [v5 addObject:objc_opt_class()];
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)socialServiceType
{
  v2 = [(WFShareExtensionAction *)self shareExtensionDefinition];
  v3 = [v2 objectForKey:@"ServiceType"];

  return v3;
}

- (id)extensionBundleIdentifier
{
  v2 = [(WFShareExtensionAction *)self shareExtensionDefinition];
  v3 = [v2 objectForKey:@"BundleIdentifier"];

  return v3;
}

- (id)inputConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(WFShareExtensionAction *)self inputType];

  if (v4)
  {
    id v5 = [(WFShareExtensionAction *)self inputType];
    [v3 setObject:v5 forKey:@"InputType"];
  }
  uint64_t v6 = [(WFShareExtensionAction *)self textItemHandling];

  if (v6)
  {
    uint64_t v7 = [(WFShareExtensionAction *)self textItemHandling];
    [v3 setObject:v7 forKey:@"TextItemHandling"];
  }
  v8 = [(WFShareExtensionAction *)self inputContentClasses];

  if (v8)
  {
    v9 = [(WFShareExtensionAction *)self inputContentClasses];
    v10 = [(WFShareExtensionAction *)self stringRepresentationForClasses:v9];
    [v3 setObject:v10 forKey:@"InputContentItemClasses"];
  }
  v11 = [(WFShareExtensionAction *)self contentItemClasses];

  if (v11)
  {
    v12 = [(WFShareExtensionAction *)self contentItemClasses];
    Class v13 = [(WFShareExtensionAction *)self stringRepresentationForClasses:v12];
    [v3 setObject:v13 forKey:@"ContentItemClasses"];
  }
  return v3;
}

- (id)shareExtensionDefinition
{
  v2 = [(WFShareExtensionAction *)self definition];
  id v3 = [v2 objectForKey:@"ShareExtension"];

  return v3;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShareExtensionAction;
  id v5 = [(WFShareExtensionAction *)&v14 localizedDescriptionSummaryWithContext:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = NSString;
    v9 = WFLocalizedStringResourceWithKey(@"Shares the input with %@.", @"Shares the input with %@.");
    v10 = [v4 localize:v9];
    v11 = [(WFShareExtensionAction *)self app];
    v12 = [v11 localizedName];
    objc_msgSend(v8, "localizedStringWithFormat:", v10, v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)stringRepresentationForClasses:(id)a3
{
  return (id)objc_msgSend(a3, "if_map:", &__block_literal_global_14594);
}

NSString *__57__WFShareExtensionAction_stringRepresentationForClasses___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 numberOfItems])
  {
    v8 = objc_msgSend(MEMORY[0x263F08910], "wf_securelyArchivedDataWithRootObject:", v7);
    v9 = [(WFShareExtensionAction *)self inputConfiguration];
    v10 = [(WFShareExtensionAction *)self socialServiceType];
    v11 = [(WFShareExtensionAction *)self extensionBundleIdentifier];
    v12 = [(WFShareExtensionAction *)self extensionUserInfo];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__WFShareExtensionAction_runWithRemoteUserInterface_input___block_invoke;
    v13[3] = &unk_264E5E840;
    v13[4] = self;
    [v6 performActionWithInput:v8 inputConfiguration:v9 socialServiceType:v10 extensionBundleIdentifier:v11 extensionUserInfo:v12 completionHandler:v13];
  }
  else
  {
    [(WFShareExtensionAction *)self finishRunningWithError:0];
  }
}

void __59__WFShareExtensionAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2D08;
}

@end
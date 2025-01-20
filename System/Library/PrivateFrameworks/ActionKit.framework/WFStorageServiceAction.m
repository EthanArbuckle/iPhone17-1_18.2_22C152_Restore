@interface WFStorageServiceAction
- (BOOL)requiresRemoteExecution;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (BOOL)showsFilePicker;
- (BOOL)showsSettingsWhenResourcesUnavailable;
- (BOOL)skipsProcessingHiddenParameters;
- (id)contentDestinationWithError:(id *)a3;
- (id)filePathKey;
- (id)filenamePlaceholderText;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)outputContentClasses;
- (id)prioritizedParameterKeysForRemoteExecution;
- (id)showPickerKey;
- (id)storageService;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)selectedStorageServiceChanged;
- (void)updatePathPrefix;
@end

@implementation WFStorageServiceAction

- (BOOL)skipsProcessingHiddenParameters
{
  return 1;
}

- (id)contentDestinationWithError:(id *)a3
{
  v3 = (void *)MEMORY[0x263F33708];
  v4 = [(WFStorageServiceAction *)self storageService];
  v5 = [v4 associatedAppDescriptor];
  v6 = [v3 locationWithAppDescriptor:v5];

  return v6;
}

- (void)selectedStorageServiceChanged
{
  [(WFStorageServiceAction *)self updatePathPrefix];
  [(WFStorageServiceAction *)self outputDetailsUpdated];
}

- (id)showPickerKey
{
  return 0;
}

- (id)filePathKey
{
  return @"WFFilePath";
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFStorageServiceAction;
  return [(WFStorageServiceAction *)&v5 setParameterState:a3 forKey:a4];
}

- (void)initializeParameters
{
  v3.receiver = self;
  v3.super_class = (Class)WFStorageServiceAction;
  [(WFStorageServiceAction *)&v3 initializeParameters];
  [(WFStorageServiceAction *)self selectedStorageServiceChanged];
}

- (id)filenamePlaceholderText
{
  v2 = [(WFStorageServiceAction *)self storageService];
  objc_super v3 = [v2 storageLocationPrefix];

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = WFLocalizedString(@"optional");
  }
  return v4;
}

- (void)updatePathPrefix
{
  objc_super v3 = [(WFStorageServiceAction *)self filePathKey];
  id v7 = [(WFStorageServiceAction *)self parameterForKey:v3];

  v4 = [(WFStorageServiceAction *)self filenamePlaceholderText];
  [v7 setLocalizedPlaceholder:v4];

  objc_super v5 = [(WFStorageServiceAction *)self storageService];
  v6 = [v5 storageLocationPrefix];
  [v7 setPrefix:v6];
}

- (BOOL)showsSettingsWhenResourcesUnavailable
{
  return 0;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)WFStorageServiceAction;
  objc_super v3 = [(WFStorageServiceAction *)&v22 localizedKeywordsWithContext:a3];
  v4 = (void *)[v3 mutableCopy];
  objc_super v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v7 = v6;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  v8 = +[WFStorageServiceRegistry sharedRegistry];
  v9 = [v8 storageServices];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [(id)objc_opt_class() serviceName];
        v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        v16 = [v14 componentsSeparatedByCharactersInSet:v15];
        [v7 addObjectsFromArray:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }

  return v7;
}

- (id)outputContentClasses
{
  v12[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(WFStorageServiceAction *)self storageService];
  v4 = objc_opt_class();

  if (v4 == objc_opt_class())
  {
    v10.receiver = self;
    v10.super_class = (Class)WFStorageServiceAction;
    v8 = [(WFStorageServiceAction *)&v10 outputContentClasses];
  }
  else
  {
    uint64_t v5 = [v4 resultItemClass];
    if (v5)
    {
      uint64_t v11 = v5;
      id v6 = (void *)MEMORY[0x263EFF8C0];
      id v7 = &v11;
    }
    else
    {
      v12[0] = objc_opt_class();
      id v6 = (void *)MEMORY[0x263EFF8C0];
      id v7 = v12;
    }
    v8 = [v6 arrayWithObjects:v7 count:1];
  }
  return v8;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFStorageServiceAction *)self storageService];
  [(WFStorageServiceAction *)self runAsynchronouslyWithInput:v4 storageService:v5];
}

- (BOOL)showsFilePicker
{
  objc_super v3 = [(WFStorageServiceAction *)self showPickerKey];
  if (v3)
  {
    id v4 = [(WFStorageServiceAction *)self parameterValueForKey:v3 ofClass:objc_opt_class()];
    id v5 = v4;
    if (v4)
    {
      char v6 = [v4 BOOLValue];
    }
    else
    {
      id v7 = [(WFStorageServiceAction *)self parameterStateForKey:v3];
      v8 = [v7 number];
      char v6 = [v8 BOOLValue];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)storageService
{
  v2 = objc_alloc_init(WFDefaultFileStorageService);
  return v2;
}

- (BOOL)requiresRemoteExecution
{
  v3.receiver = self;
  v3.super_class = (Class)WFStorageServiceAction;
  return [(WFStorageServiceAction *)&v3 requiresRemoteExecution];
}

- (id)prioritizedParameterKeysForRemoteExecution
{
  v7[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(WFStorageServiceAction *)self showPickerKey];

  if (v3)
  {
    id v4 = [(WFStorageServiceAction *)self showPickerKey];
    v7[0] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end
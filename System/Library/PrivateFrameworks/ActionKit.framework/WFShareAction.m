@interface WFShareAction
+ (id)sharedEnumerator;
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (NSObject)supportedExtensionsChangedObserver;
- (NSString)associatedAppBundleIdentifier;
- (WFShareAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (id)anyExtensionBundleIdentifierForIdentifier:(id)a3 extensionPointIdentifier:(id)a4 isContentManaged:(BOOL)a5 error:(id *)a6;
- (id)appEnumerator;
- (id)overrideExtensionIdentifier;
- (id)selectedIdentifier;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)dealloc;
- (void)generateStandaloneShortcutRepresentation:(id)a3;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setSupportedExtensionsChangedObserver:(id)a3;
- (void)showUIWithArchivedItems:(id)a3 isContentManaged:(BOOL)a4 extensionBundleIdentifier:(id)a5;
@end

@implementation WFShareAction

- (void).cxx_destruct
{
}

- (void)setSupportedExtensionsChangedObserver:(id)a3
{
}

- (NSObject)supportedExtensionsChangedObserver
{
  return self->_supportedExtensionsChangedObserver;
}

- (id)appEnumerator
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [(id)objc_opt_class() sharedEnumerator];
  v3 = [v2 supportedApplicationRecords];

  v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"localizedName" ascending:1 selector:sel_localizedStandardCompare_];
  v9[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v6 = [v3 sortedArrayUsingDescriptors:v5];
  v7 = [v6 objectEnumerator];

  return v7;
}

- (id)selectedIdentifier
{
  v2 = [(WFShareAction *)self parameterValueForKey:@"WFApp" ofClass:objc_opt_class()];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)anyExtensionBundleIdentifierForIdentifier:(id)a3 extensionPointIdentifier:(id)a4 isContentManaged:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"WFShareAction.m", 237, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v49 = [MEMORY[0x263F08690] currentHandler];
  [v49 handleFailureInMethod:a2, self, @"WFShareAction.m", 238, @"Invalid parameter not satisfying: %@", @"extensionPointIdentifier" object file lineNumber description];

LABEL_3:
  id v60 = 0;
  v14 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v11 allowPlaceholder:1 error:&v60];
  id v15 = v60;
  v16 = v15;
  if (v14)
  {
    id v55 = v15;
    v17 = a6;
    v18 = [v14 applicationExtensionRecords];
    v19 = (void *)MEMORY[0x263F08A98];
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke;
    v58[3] = &unk_264E59AC8;
    id v59 = v13;
    v20 = [v19 predicateWithBlock:v58];
    v21 = [v18 filteredSetUsingPredicate:v20];

    v22 = (void *)MEMORY[0x263EFFA08];
    v23 = [MEMORY[0x263F338E8] defaultProfile];
    v24 = [v21 allObjects];
    v25 = objc_msgSend(v24, "if_compactMap:", &__block_literal_global_28187);
    v26 = [v23 allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:v25 originatingAppBundleID:*MEMORY[0x263F85610] originatingAccountIsManaged:v7];
    v27 = [v22 setWithArray:v26];

    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke_3;
    v56[3] = &unk_264E59B10;
    id v28 = v27;
    id v57 = v28;
    v29 = objc_msgSend(v21, "if_compactMap:", v56);
    v30 = [v29 anyObject];
    v31 = v30;
    if (v30)
    {
      v32 = [v30 bundleIdentifier];
    }
    else
    {
      if (v17)
      {
        [v14 localizedName];
        v52 = v54 = v13;
        v51 = WFLocalizedString(@"No Share Extension");
        v53 = v17;
        v40 = NSString;
        v41 = WFLocalizedString(@"The app “%@” does not have a Share extension.");
        v42 = objc_msgSend(v40, "stringWithFormat:", v41, v52);

        v50 = (void *)MEMORY[0x263F087E8];
        uint64_t v43 = *MEMORY[0x263F870B8];
        uint64_t v44 = *MEMORY[0x263F08320];
        uint64_t v61 = *MEMORY[0x263F08338];
        uint64_t v62 = v44;
        v63 = v51;
        v64 = v42;
        v45 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v61 count:2];
        v46 = [v50 errorWithDomain:v43 code:10 userInfo:v45];

        id *v53 = v46;
        v13 = v54;
      }
      v32 = 0;
    }
    v16 = v55;
  }
  else if (a6)
  {
    v33 = WFLocalizedString(@"App Not Installed");
    v34 = WFLocalizedString(@"The selected app is not installed on this device.");
    v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F870B8];
    uint64_t v37 = *MEMORY[0x263F08320];
    uint64_t v61 = *MEMORY[0x263F08338];
    uint64_t v62 = v37;
    v63 = v33;
    v64 = v34;
    v38 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v61 count:2];
    v39 = [v35 errorWithDomain:v36 code:10 userInfo:v38];

    v32 = 0;
    *a6 = v39;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

uint64_t __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 extensionPointRecord];
  v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

id __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v6 = [v3 bundleIdentifier];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }

  return v4;
}

uint64_t __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = NSString;
  id v10 = a5;
  if (v7)
  {
    id v11 = WFLocalizedString(@"Allow “%1$@” to share %2$@ with ”%3$@”?");
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v10, v7);
  }
  else
  {
    id v11 = WFLocalizedString(@"Allow “%1$@” to share content with ”%2$@”?");
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v10, v8);
  id v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFShareAction *)self input];
  id v7 = v4;
  id v6 = v4;
  WFGetContentLocationFromURLActionInput();
}

void __60__WFShareAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F33708] shareExtensionLocation];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  id v5 = (objc_class *)MEMORY[0x263F86EE8];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v9 = [(WFShareAction *)self associatedAppBundleIdentifier];
  id v8 = (void *)[v7 initWithBundleIdentifier:v9];
  (*((void (**)(id, void *))a3 + 2))(v6, v8);
}

- (NSString)associatedAppBundleIdentifier
{
  uint64_t v2 = [(WFShareAction *)self selectedIdentifier];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithBundleIdentifier:v2];
  uint64_t v4 = [MEMORY[0x263F0F9B0] sharedResolver];
  id v5 = [v4 resolvedAppMatchingDescriptor:v3];

  id v6 = [v5 bundleIdentifier];

  return (NSString *)v6;
}

- (void)showUIWithArchivedItems:(id)a3 isContentManaged:(BOOL)a4 extensionBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke;
  v12[3] = &unk_264E5D128;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(WFShareAction *)self requestUnlock:v12];
}

void __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_2;
    v7[3] = &unk_264E5E050;
    id v8 = *(id *)(a1 + 40);
    char v11 = *(unsigned char *)(a1 + 56);
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v9 = v4;
    uint64_t v10 = v5;
    [v2 requestInterfacePresentationWithCompletionHandler:v7];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) deviceLockedError];
    [v2 finishRunningWithError:v6];
  }
}

void __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_3;
    v8[3] = &unk_264E5EEE8;
    v8[4] = *(void *)(a1 + 48);
    [a2 showWithArchivedItems:v3 isContentManaged:v2 extensionBundleIdentifier:v4 extensionPointIdentifier:@"com.apple.share-services" completionHandler:v8];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 48);
    id v6 = [v5 input];
    v7.receiver = v5;
    v7.super_class = (Class)WFShareAction;
    objc_msgSendSuper2(&v7, sel_runAsynchronouslyWithInput_, v6);
  }
}

void __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        id v12 = [*(id *)(a1 + 32) output];
        [v12 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (id)overrideExtensionIdentifier
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  if ([v4 numberOfItems])
  {
    uint64_t v18 = 0;
    id v5 = [v4 attributionSet];
    char v6 = [v5 isEligibleToShareWithResultManagedLevel:&v18];

    if (v6)
    {
      uint64_t v7 = v18;
      uint64_t v8 = [(WFShareAction *)self selectedIdentifier];
      if (!v8)
      {
        uint64_t v11 = [(WFShareAction *)self overrideExtensionIdentifier];
LABEL_10:
        long long v13 = [(WFShareAction *)self userInterface];
        int v14 = [v13 isRunningWithSiriUI];

        if (v14)
        {
          long long v15 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
          [(WFShareAction *)self finishRunningWithError:v15];
        }
        else
        {
          long long v16 = objc_msgSend(MEMORY[0x263F08910], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v4, 1);
          [(WFShareAction *)self showUIWithArchivedItems:v16 isContentManaged:v7 == 2 extensionBundleIdentifier:v11];
        }
        goto LABEL_13;
      }
      id v17 = 0;
      uint64_t v9 = [(WFShareAction *)self anyExtensionBundleIdentifierForIdentifier:v8 extensionPointIdentifier:@"com.apple.share-services" isContentManaged:v7 == 2 error:&v17];
      id v10 = v17;
      uint64_t v11 = v10;
      if (v9)
      {

        uint64_t v11 = (void *)v9;
        goto LABEL_10;
      }
    }
    else
    {
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = [(WFShareAction *)self localizedName];
      uint64_t v11 = [v12 sharingMixedMDMContentErrorWithActionName:v8];
    }
    [(WFShareAction *)self finishRunningWithError:v11];
LABEL_13:

    goto LABEL_14;
  }
  [(WFShareAction *)self finishRunningWithError:0];
LABEL_14:
}

- (void)initializeParameters
{
  v11.receiver = self;
  v11.super_class = (Class)WFShareAction;
  [(WFShareAction *)&v11 initializeParameters];
  uint64_t v3 = [(WFShareAction *)self parameterForKey:@"WFApp"];
  [v3 setAppListProvider:self];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  id v5 = [(id)objc_opt_class() sharedEnumerator];
  char v6 = [MEMORY[0x263F08A48] mainQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __37__WFShareAction_initializeParameters__block_invoke;
  v9[3] = &unk_264E59AA0;
  id v10 = v3;
  id v7 = v3;
  uint64_t v8 = [v4 addObserverForName:@"WFExtensionEnumeratorSupportedExtensionsChanged" object:v5 queue:v6 usingBlock:v9];
  [(WFShareAction *)self setSupportedExtensionsChangedObserver:v8];
}

uint64_t __37__WFShareAction_initializeParameters__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadPossibleStates];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  id v4 = [(WFShareAction *)self supportedExtensionsChangedObserver];
  [v3 removeObserver:v4];

  v5.receiver = self;
  v5.super_class = (Class)WFShareAction;
  [(WFShareAction *)&v5 dealloc];
}

- (WFShareAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)WFShareAction;
  objc_super v5 = [(WFShareAction *)&v9 initWithIdentifier:a3 definition:a4 serializedParameters:a5];
  char v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

+ (id)sharedEnumerator
{
  if (sharedEnumerator_onceToken != -1) {
    dispatch_once(&sharedEnumerator_onceToken, &__block_literal_global_286);
  }
  uint64_t v2 = (void *)sharedEnumerator_enumerator;
  return v2;
}

void __33__WFShareAction_sharedEnumerator__block_invoke()
{
  v0 = [[WFExtensionEnumerator alloc] initWithExtensionPointIdentifier:@"com.apple.share-services"];
  v1 = (void *)sharedEnumerator_enumerator;
  sharedEnumerator_enumerator = (uint64_t)v0;
}

+ (id)userInterfaceXPCInterface
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WFShareAction;
  uint64_t v2 = objc_msgSendSuper2(&v8, sel_userInterfaceXPCInterface);
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  char v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1DA0;
}

@end
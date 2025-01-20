@interface WFStartCallAction
- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3;
- (BOOL)isRunningOniPad;
- (BOOL)populatesInputFromInputParameter;
- (BOOL)shouldOpenAppThroughSiriForIntent:(id)a3 intentResponse:(id)a4;
- (BOOL)skipsProcessingHiddenParameters;
- (id)actionForAppIdentifier:(id)a3;
- (id)airplaneModeError;
- (id)appConfigurationRequiredError;
- (id)callingServiceNotAvailableError;
- (id)communicationMethod;
- (id)contactNotSupportedByAppErrorForContacts:(id)a3;
- (id)contentDestinationWithError:(id *)a3;
- (id)disabledInSettingsError;
- (id)disabledOnPlatforms;
- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4;
- (id)errorFromHandleResponse:(id)a3 intent:(id)a4;
- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5;
- (id)errorFromStartCallResponse:(id)a3 intent:(id)a4;
- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6;
- (id)iconName;
- (id)intentDescriptorFromParameterState;
- (id)intentDescriptorWithIntentClassName:(id)a3 launchableBundleId:(id)a4;
- (id)localizedCallServiceName;
- (id)localizedKeyParameterDisplayName;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)suggestedEntityFromCallDescriptor:(id)a3;
- (id)supportedIdentifiers;
- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3;
- (int64_t)callCapability;
- (int64_t)preferredCallProvider;
- (void)fetchFavoriteCallDestinationsWithCompletion:(id)a3;
- (void)fetchRecentCallDestinationWithTelephony:(BOOL)a3 completion:(id)a4;
- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4;
@end

@implementation WFStartCallAction

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  v18[2] = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void, void *))a4;
  v7 = [(WFStartCallAction *)self systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:a3];
  if ([v7 isEqualToString:@"WFStartCallActionCollectionIdentifierRecents"])
  {
    v8 = self;
    uint64_t v9 = 1;
LABEL_5:
    [(WFStartCallAction *)v8 fetchRecentCallDestinationWithTelephony:v9 completion:v6];
    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"WFStartCallActionCollectionIdentifierFaceTimeRecents"])
  {
    v8 = self;
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  if ([v7 isEqualToString:@"WFStartCallActionCollectionIdentifierFavorites"])
  {
    [(WFStartCallAction *)self fetchFavoriteCallDestinationsWithCompletion:v6];
  }
  else
  {
    v10 = WFLocalizedString(@"Suggestions Not Found");
    v11 = WFLocalizedString(@"The specified action has no suggestions available");
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F870B8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v17[0] = *MEMORY[0x263F08338];
    v17[1] = v14;
    v18[0] = v10;
    v18[1] = v11;
    v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    v16 = [v12 errorWithDomain:v13 code:5 userInfo:v15];

    v6[2](v6, 0, v16);
  }
LABEL_6:
}

- (void)fetchFavoriteCallDestinationsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F85128] standardClient];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__WFStartCallAction_fetchFavoriteCallDestinationsWithCompletion___block_invoke;
  v7[3] = &unk_264E5E4B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getFavoriteContactsWithLimit:20 completion:v7];
}

void __65__WFStartCallAction_fetchFavoriteCallDestinationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__WFStartCallAction_fetchFavoriteCallDestinationsWithCompletion___block_invoke_2;
  v4[3] = &unk_264E5AEA0;
  v4[4] = *(void *)(a1 + 32);
  v3 = objc_msgSend(a2, "if_compactMap:", v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__WFStartCallAction_fetchFavoriteCallDestinationsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) suggestedEntityFromCallDescriptor:a2];
}

- (void)fetchRecentCallDestinationWithTelephony:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F85128] standardClient];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__WFStartCallAction_fetchRecentCallDestinationWithTelephony_completion___block_invoke;
  v9[3] = &unk_264E5E4B8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 getRecentsCallWithTelephony:v4 limit:20 completion:v9];
}

void __72__WFStartCallAction_fetchRecentCallDestinationWithTelephony_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__WFStartCallAction_fetchRecentCallDestinationWithTelephony_completion___block_invoke_2;
  v9[3] = &unk_264E5AE78;
  uint64_t v5 = *(void *)(a1 + 32);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v4;
  v7 = objc_msgSend(v3, "if_compactMap:", v9);

  (*(void (**)(void, void *, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, 0, v8);
}

id __72__WFStartCallAction_fetchRecentCallDestinationWithTelephony_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 handle];
  if ([*(id *)(a1 + 32) containsObject:v4])
  {
    uint64_t v5 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v4];
    uint64_t v5 = [*(id *)(a1 + 40) suggestedEntityFromCallDescriptor:v3];
  }

  return v5;
}

- (id)suggestedEntityFromCallDescriptor:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 person];
  uint64_t v5 = [v4 image];
  id v6 = objc_msgSend(v5, "wf_image");
  v7 = [v6 imageWithDisplayStyle:1];

  if (!v7)
  {
    id v10 = 0;
    goto LABEL_12;
  }
  unint64_t v8 = [v3 callType];
  if (v8 > 3) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F85148]) initWithBundleIdentifier:**((void **)&unk_264E5AEC0 + v8)];
  }
  uint64_t v11 = [v3 person];
  v12 = [v11 nameComponents];
  uint64_t v13 = [v12 givenName];
  if (!v13)
  {

    goto LABEL_10;
  }
  uint64_t v14 = (void *)v13;
  v15 = [v3 person];
  v16 = [v15 nameComponents];
  v17 = [v16 givenName];
  uint64_t v18 = [v17 length];

  if (!v18)
  {
LABEL_10:
    v19 = [v3 person];
    v21 = [v19 displayName];
    goto LABEL_11;
  }
  v19 = [v3 person];
  v20 = [v19 nameComponents];
  v21 = [v20 givenName];

LABEL_11:
  id v22 = objc_alloc(MEMORY[0x263F851B0]);
  v23 = [v3 handle];
  v24 = (void *)[objc_alloc(MEMORY[0x263F85310]) initWithImage:v7];
  v25 = [v3 personSerializedRepresentation];
  id v10 = (void *)[v22 initWithIdentifier:v23 name:v21 entryIcon:v24 accessoryIcon:v9 serializedParameterState:v25];

LABEL_12:
  return v10;
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  BOOL v4 = (__CFString *)a3;
  uint64_t v5 = v4;
  if (v4 == @"WFCallContact") {
    goto LABEL_4;
  }
  if (v4)
  {
    char v6 = [(__CFString *)v4 isEqualToString:@"WFCallContact"];

    if (v6)
    {
LABEL_4:
      char v7 = 1;
      goto LABEL_10;
    }
    unint64_t v8 = v5;
    if (v8 == @"WFFaceTimeContact") {
      char v7 = 1;
    }
    else {
      char v7 = [(__CFString *)v8 isEqualToString:@"WFFaceTimeContact"];
    }
  }
  else
  {
    char v7 = 0;
  }

LABEL_10:
  uint64_t v9 = [(WFStartCallAction *)self systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:v5];

  if (v9) {
    BOOL v10 = v7;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3
{
  id v3 = [(WFStartCallAction *)self parameterStateForKey:a3];
  BOOL v4 = [v3 variable];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  char v7 = [v6 collectionFilter];

  unint64_t v8 = [v7 namedQueryReference];

  if (v8)
  {
    uint64_t v9 = [v8 topHitSystemEntityCollectionIdentifier];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  char v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    uint64_t v9 = WFLocalizedString(@"Allow “%1$@” to place a call using %2$@?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    uint64_t v9 = WFLocalizedString(@"Allow “%1$@” to place a call?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  BOOL v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  id v3 = (void *)MEMORY[0x263F33708];
  BOOL v4 = [(WFHandleIntentAction *)self appDescriptor];
  uint64_t v5 = [v3 locationWithAppDescriptor:v4 promptingBehaviour:1];

  return v5;
}

- (BOOL)isRunningOniPad
{
  v2 = [MEMORY[0x263F85258] currentDevice];
  BOOL v3 = [v2 idiom] == 1;

  return v3;
}

- (id)supportedIdentifiers
{
  if ([(WFStartCallAction *)self isRunningOniPad])
  {
    v6.receiver = self;
    v6.super_class = (Class)WFStartCallAction;
    BOOL v3 = [(WFHandleSystemIntentAction *)&v6 supportedIdentifiers];
    BOOL v4 = (void *)[v3 mutableCopy];

    if (([v4 containsObject:@"com.apple.TelephonyUtilities.PhoneIntentHandler"] & 1) == 0) {
      [v4 addObject:@"com.apple.TelephonyUtilities.PhoneIntentHandler"];
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFStartCallAction;
    BOOL v4 = [(WFHandleSystemIntentAction *)&v7 supportedIdentifiers];
  }
  return v4;
}

- (id)intentDescriptorWithIntentClassName:(id)a3 launchableBundleId:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)WFStartCallAction;
  uint64_t v5 = [(WFHandleSystemIntentAction *)&v8 intentDescriptorWithIntentClassName:a3 launchableBundleId:a4];
  objc_super v6 = objc_msgSend(v5, "descriptorWithPreferredCallProvider:", -[WFStartCallAction preferredCallProvider](self, "preferredCallProvider"));

  return v6;
}

- (id)intentDescriptorFromParameterState
{
  v6.receiver = self;
  v6.super_class = (Class)WFStartCallAction;
  BOOL v3 = [(WFHandleSystemIntentAction *)&v6 intentDescriptorFromParameterState];
  BOOL v4 = objc_msgSend(v3, "descriptorWithPreferredCallProvider:", -[WFStartCallAction preferredCallProvider](self, "preferredCallProvider"));

  return v4;
}

- (BOOL)shouldOpenAppThroughSiriForIntent:(id)a3 intentResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 _idiom] == 4)
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFStartCallAction;
    BOOL v8 = [(WFHandleIntentAction *)&v10 shouldOpenAppThroughSiriForIntent:v6 intentResponse:v7];
  }

  return v8;
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  v10.receiver = self;
  v10.super_class = (Class)WFStartCallAction;
  id v7 = [(WFHandleSystemIntentAction *)&v10 generatedIntentWithIdentifier:a3 input:a4 processedParameters:a5 error:a6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    [v8 setDestinationType:1];
    objc_msgSend(v8, "setCallCapability:", -[WFStartCallAction callCapability](self, "callCapability"));
    objc_msgSend(v8, "setPreferredCallProvider:", -[WFStartCallAction preferredCallProvider](self, "preferredCallProvider"));
  }
  return v7;
}

- (id)errorFromHandleResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFStartCallAction *)self errorFromStartCallResponse:v6 intent:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFStartCallAction;
    id v10 = [(WFHandleIntentAction *)&v13 errorFromHandleResponse:v6 intent:v7];
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFStartCallAction *)self errorFromStartCallResponse:v6 intent:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFStartCallAction;
    id v10 = [(WFHandleIntentAction *)&v13 errorFromConfirmResponse:v6 intent:v7];
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFStartCallAction;
  v2 = [(WFHandleIntentAction *)&v5 disabledOnPlatforms];
  BOOL v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

- (id)iconName
{
  if ([(WFStartCallAction *)self isRunningOniPad]
    && [(WFStartCallAction *)self preferredCallProvider] == 1)
  {
    BOOL v3 = @"Phone";
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFStartCallAction;
    BOOL v3 = [(WFStartCallAction *)&v5 iconName];
  }
  return v3;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 0;
}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

- (id)actionForAppIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WFStartCallAction *)self definition];
  id v6 = [v5 objectForKey:@"WFStartCallActionType"];
  if ([v6 isEqualToString:@"FaceTime"])
  {
    char v7 = [v4 isEqualToString:*MEMORY[0x263F854F0]];

    if ((v7 & 1) == 0)
    {
      id v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  v10.receiver = self;
  v10.super_class = (Class)WFStartCallAction;
  id v8 = [(WFHandleSystemIntentAction *)&v10 actionForAppIdentifier:v4];
LABEL_6:

  return v8;
}

- (id)errorFromStartCallResponse:(id)a3 intent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v9 = 0;
    switch([v6 code])
    {
      case 6:
        uint64_t v10 = [(WFStartCallAction *)self callingServiceNotAvailableError];
        goto LABEL_8;
      case 7:
        uint64_t v11 = [v8 contacts];
        uint64_t v9 = [(WFStartCallAction *)self contactNotSupportedByAppErrorForContacts:v11];

        break;
      case 8:
        uint64_t v10 = [(WFStartCallAction *)self airplaneModeError];
        goto LABEL_8;
      case 10:
        uint64_t v10 = [(WFStartCallAction *)self appConfigurationRequiredError];
LABEL_8:
        uint64_t v9 = (void *)v10;
        break;
      default:
        break;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  uint64_t v13 = [v12 unsupportedReason];
  if ((unint64_t)(v13 - 1) >= 2)
  {
    if (v13 == 6)
    {
      uint64_t v14 = [(WFStartCallAction *)self disabledInSettingsError];
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)WFStartCallAction;
      uint64_t v14 = [(WFHandleIntentAction *)&v17 errorFromResolutionResult:v8 forSlot:v9 onIntent:v10];
    }
  }
  else
  {
    uint64_t v14 = [(WFStartCallAction *)self callingServiceNotAvailableError];
  }
  v15 = (void *)v14;

  return v15;
}

- (id)disabledInSettingsError
{
  v19[2] = *MEMORY[0x263EF8340];
  BOOL v3 = NSString;
  id v4 = WFLocalizedString(@"%@ Disabled");
  objc_super v5 = [(WFStartCallAction *)self localizedCallServiceName];
  id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  id v7 = NSString;
  id v8 = WFLocalizedString(@"The call could not be started because %@ has been disabled in Settings.");
  id v9 = [(WFStartCallAction *)self localizedCallServiceName];
  id v10 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);

  uint64_t v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F870B8];
  uint64_t v13 = *MEMORY[0x263F08320];
  v18[0] = *MEMORY[0x263F08338];
  v18[1] = v13;
  v19[0] = v6;
  v19[1] = v10;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v15 = [v11 errorWithDomain:v12 code:5 userInfo:v14];
  v16 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v15];

  return v16;
}

- (id)airplaneModeError
{
  v13[2] = *MEMORY[0x263EF8340];
  BOOL v3 = WFLocalizedString(@"Airplane Mode");
  id v4 = WFLocalizedString(@"The call could not be started because your device is in Airplane Mode.");
  objc_super v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F870B8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v12[0] = *MEMORY[0x263F08338];
  v12[1] = v7;
  v13[0] = v3;
  v13[1] = v4;
  id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = [v5 errorWithDomain:v6 code:5 userInfo:v8];
  id v10 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v9];

  return v10;
}

- (id)contactNotSupportedByAppErrorForContacts:(id)a3
{
  void v17[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = WFLocalizedString(@"Contact Not Supported");
  objc_super v5 = NSString;
  uint64_t v6 = WFLocalizedString(@"The call could not be started because %@ cannot take part in the call.");
  uint64_t v7 = [v3 firstObject];

  id v8 = [v7 displayName];
  id v9 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v8);

  id v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F870B8];
  uint64_t v12 = *MEMORY[0x263F08320];
  v16[0] = *MEMORY[0x263F08338];
  v16[1] = v12;
  v17[0] = v4;
  v17[1] = v9;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  uint64_t v14 = [v10 errorWithDomain:v11 code:5 userInfo:v13];

  return v14;
}

- (id)callingServiceNotAvailableError
{
  void v18[2] = *MEMORY[0x263EF8340];
  id v3 = NSString;
  id v4 = WFLocalizedString(@"%@ Unavailable");
  objc_super v5 = [(WFStartCallAction *)self localizedCallServiceName];
  uint64_t v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  uint64_t v7 = NSString;
  id v8 = WFLocalizedString(@"The call could not be started because %@ is not available.");
  id v9 = [(WFStartCallAction *)self localizedCallServiceName];
  id v10 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v9);

  uint64_t v11 = (void *)MEMORY[0x263F087E8];
  uint64_t v12 = *MEMORY[0x263F870B8];
  uint64_t v13 = *MEMORY[0x263F08320];
  v17[0] = *MEMORY[0x263F08338];
  v17[1] = v13;
  v18[0] = v6;
  v18[1] = v10;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v15 = [v11 errorWithDomain:v12 code:5 userInfo:v14];

  return v15;
}

- (id)appConfigurationRequiredError
{
  void v16[2] = *MEMORY[0x263EF8340];
  id v3 = WFLocalizedString(@"Setup Required");
  id v4 = NSString;
  objc_super v5 = WFLocalizedString(@"%@ is not set up to make calls.");
  uint64_t v6 = [(WFStartCallAction *)self localizedCallServiceName];
  uint64_t v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);

  id v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F870B8];
  uint64_t v10 = *MEMORY[0x263F08320];
  v15[0] = *MEMORY[0x263F08338];
  v15[1] = v10;
  v16[0] = v3;
  v16[1] = v7;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  uint64_t v12 = [v8 errorWithDomain:v9 code:5 userInfo:v11];
  uint64_t v13 = [(WFHandleIntentAction *)self errorThatLaunchesApp:v12];

  return v13;
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(@"Contact");
}

- (id)localizedCallServiceName
{
  if ([(WFStartCallAction *)self preferredCallProvider] != 2)
  {
    if ([(WFStartCallAction *)self isRunningOniPad]
      && [(WFStartCallAction *)self preferredCallProvider] == 1)
    {
      id v4 = @"Phone";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  int64_t v3 = [(WFStartCallAction *)self callCapability];
  if (v3 != 1)
  {
    if (v3 == 2)
    {
      id v4 = @"FaceTime Video";
LABEL_8:
      objc_super v5 = WFLocalizedString(v4);
      goto LABEL_11;
    }
LABEL_9:
    objc_super v5 = [(WFHandleSystemIntentAction *)self localizedAppName];
    goto LABEL_11;
  }
  objc_super v5 = WFLocalizedStringWithKey(@"FaceTime Audio (error)", @"FaceTime Audio");
LABEL_11:
  return v5;
}

- (int64_t)preferredCallProvider
{
  v2 = [(WFStartCallAction *)self communicationMethod];
  int64_t v3 = [v2 preferredCallProvider];

  return v3;
}

- (int64_t)callCapability
{
  v2 = [(WFStartCallAction *)self communicationMethod];
  int64_t v3 = [v2 callCapability];

  return v3;
}

- (id)communicationMethod
{
  int64_t v3 = [(WFStartCallAction *)self parameterStateForKey:@"WFCallContact"];
  id v4 = [v3 communicationMethod];
  if (v4) {
    goto LABEL_19;
  }
  objc_super v5 = [(WFStartCallAction *)self processedParameters];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"WFCallContact"];

  if (v6)
  {
    objc_opt_class();
    uint64_t v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  id v4 = [v8 communicationMethod];

  if (v4) {
    goto LABEL_19;
  }
  uint64_t v9 = [(WFStartCallAction *)self definition];
  uint64_t v10 = [v9 objectForKey:@"WFStartCallActionType"];

  id v11 = (id)*MEMORY[0x263F33A80];
  if ([v10 isEqualToString:@"Phone"])
  {
    id v12 = (id)*MEMORY[0x263F33A78];

    id v13 = (id)*MEMORY[0x263F85528];
    id v11 = v12;
  }
  else
  {
    id v13 = 0;
  }
  if ([v10 isEqualToString:@"FaceTime"])
  {
    uint64_t v14 = [(WFStartCallAction *)self parameterValueForKey:@"WFFaceTimeType" ofClass:objc_opt_class()];
    if ([v14 isEqualToString:@"Audio"])
    {
      v15 = (id *)MEMORY[0x263F33A78];
    }
    else
    {
      if (![v14 isEqualToString:@"Video"])
      {
LABEL_17:
        id v17 = (id)*MEMORY[0x263F854F0];

        id v13 = v17;
        goto LABEL_18;
      }
      v15 = (id *)MEMORY[0x263F33A88];
    }
    id v16 = *v15;

    id v11 = v16;
    goto LABEL_17;
  }
LABEL_18:
  id v4 = (void *)[objc_alloc(MEMORY[0x263F33778]) initWithBundleIdentifier:v13 type:v11];

LABEL_19:
  return v4;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;

    id v8 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    id v11 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v10 = 0;
    id v7 = 0;
    id v12 = 0;
  }
  id v13 = v12;

  if (v7 || v10 || v13)
  {
    v15 = [v5 _codableDescription];
    id v16 = @"WFCallContact";
    uint64_t v17 = [(WFStartCallAction *)self parameterForKey:@"WFCallContact"];
    v42 = self;
    if (!v17)
    {
      id v16 = @"WFFaceTimeContact";
      uint64_t v17 = [(WFStartCallAction *)self parameterForKey:@"WFFaceTimeContact"];
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [v5 valueForKey:@"contacts"];
    v20 = [v15 attributeByName:@"contacts"];
    v47 = v18;
    v21 = [v18 definition];
    v45 = v20;
    v46 = (void *)v19;
    id v22 = objc_msgSend(v20, "wf_parameterStateForIntentValue:parameterDefinition:", v19, v21);
    uint64_t v23 = [v22 serializedRepresentation];

    v24 = @"Audio";
    if ([v7 callCapability] == 1
      || ((uint64_t v25 = [v7 callCapability], !v10) ? (v26 = @"Video") : (v26 = @"Audio"),
          v25 != 2 ? (v24 = v26) : (v24 = @"Video"),
          v25 == 2 || v10 || v13))
    {
      v28 = (void *)[objc_alloc(MEMORY[0x263F86F00]) initWithValue:v24];
      v27 = [v28 serializedRepresentation];
    }
    else
    {
      v27 = 0;
    }
    v29 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    uint64_t v14 = v29;
    if (v23) {
      [v29 setObject:v23 forKeyedSubscript:v16];
    }
    v44 = (void *)v23;
    if (v27) {
      [v14 setObject:v27 forKeyedSubscript:@"WFFaceTimeType"];
    }
    v30 = (void *)[objc_alloc(MEMORY[0x263F0FBB8]) initWithIntent:v5];
    v31 = [MEMORY[0x263F0F9B0] sharedResolver];
    v32 = [v31 resolvedIntentMatchingDescriptor:v30];

    v33 = [v32 bundleIdentifier];

    if (v33)
    {
      v34 = [v32 serializedRepresentation];
      [v14 setObject:v34 forKeyedSubscript:*MEMORY[0x263F87200]];
    }
    else
    {
      v35 = [(WFStartCallAction *)v42 supportedIdentifiers];
      [v35 allObjects];
      v36 = v41 = v15;
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __92__WFStartCallAction_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues___block_invoke;
      v48[3] = &unk_264E5BD70;
      id v49 = v5;
      id v50 = v32;
      objc_msgSend(v36, "if_compactMap:", v48);
      v37 = id v43 = v13;

      v38 = [v37 firstObject];
      v39 = [v38 serializedRepresentation];
      [v14 setObject:v39 forKeyedSubscript:*MEMORY[0x263F87200]];

      v15 = v41;
      id v13 = v43;
    }
  }
  else
  {
    id v7 = 0;
    uint64_t v14 = 0;
  }

  return v14;
}

id __92__WFStartCallAction_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = (objc_class *)MEMORY[0x263F0FBB8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = (void *)[v5 initWithIntentClassName:v7 launchableAppBundleId:v4];

  uint64_t v9 = [MEMORY[0x263F0F9B0] sharedResolver];
  id v10 = [v9 resolvedIntentMatchingDescriptor:v8];

  id v11 = [v10 displayableBundleIdentifier];
  id v12 = [*(id *)(a1 + 40) displayableBundleIdentifier];
  LODWORD(v7) = [v11 isEqualToString:v12];

  if (v7) {
    id v13 = v10;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

@end
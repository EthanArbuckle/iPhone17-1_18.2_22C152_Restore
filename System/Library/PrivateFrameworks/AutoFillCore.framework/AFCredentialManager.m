@interface AFCredentialManager
+ (id)sharedInstance;
- (BOOL)hasAutoFillContextEntitlementForConnection:(id)a3;
- (BOOL)shouldAuthenticateToAcceptAutoFill;
- (LAContext)laContext;
- (NSDictionary)queuedCustomInfo;
- (NSDictionary)queuedUnauthenticatedCustomInfo;
- (id)_autoFillPayloadForPasskey:(id)a3 customInfoType:(unint64_t *)a4;
- (id)_autoFillPayloadForPasswordCredential:(id)a3 customInfoType:(unint64_t *)a4;
- (id)_suggestionForPasskey:(id)a3 autoFillPayload:(id)a4 customInfoType:(unint64_t)a5;
- (id)_suggestionForPasswordCredential:(id)a3 autoFillPayload:(id)a4 customInfoType:(unint64_t)a5;
- (id)generateLoginAutoFillWithDocumentTraits:(id)a3;
- (id)initPrivate;
- (id)obtainApplicationIdentifierFromConnection:(id)a3;
- (id)obtainBundleIdentifierFromConnection:(id)a3;
- (id)oneTimeCodeProvider;
- (void)_consumeOneTimeCodeAutoFillSuggestionIfNeeded:(id)a3;
- (void)generateHideMyEmailAutoFillWithRenderTraits:(id)a3 completionHandler:(id)a4;
- (void)generateHideMyEmailSuggestionWithApplicationBundleId:(id)a3 applicationId:(id)a4 completionHandler:(id)a5;
- (void)generateOneTimeCodeAutoFillSuggestionsWithDocumentTraits:(id)a3 completionHandler:(id)a4;
- (void)generateSignupAutoFillWithAutoFillMode:(unint64_t)a3 documentTraits:(id)a4 completionHandler:(id)a5;
- (void)getCredentialsWithApplicationIdentifier:(id)a3 documentTraits:(id)a4 withCompletionHandler:(id)a5;
- (void)oneTimeCodeProviderReceivedCode:(id)a3;
- (void)setLaContext:(id)a3;
- (void)setQueuedCustomInfo:(id)a3;
- (void)setQueuedUnauthenticatedCustomInfo:(id)a3;
- (void)shouldAcceptAutoFill:(id)a3 withPayload:(id)a4 documentTraits:(id)a5 completionHandler:(id)a6;
@end

@implementation AFCredentialManager

+ (id)sharedInstance
{
  v2 = (void *)instance_0;
  if (!instance_0)
  {
    if (sharedInstance_onceToken_0 != -1) {
      dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
    }
    v2 = (void *)instance_0;
  }
  return v2;
}

uint64_t __37__AFCredentialManager_sharedInstance__block_invoke()
{
  instance_0 = [[AFCredentialManager alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v12.receiver = self;
  v12.super_class = (Class)AFCredentialManager;
  v2 = [(AFCredentialManager *)&v12 init];
  if (v2)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v3 = (void *)getSFAppAutoFillPasskeyProviderClass_softClass;
    uint64_t v21 = getSFAppAutoFillPasskeyProviderClass_softClass;
    if (!getSFAppAutoFillPasskeyProviderClass_softClass)
    {
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      v15 = __getSFAppAutoFillPasskeyProviderClass_block_invoke;
      v16 = &unk_265247EA0;
      v17 = &v18;
      __getSFAppAutoFillPasskeyProviderClass_block_invoke((uint64_t)&v13);
      v3 = (void *)v19[3];
    }
    v4 = v3;
    _Block_object_dispose(&v18, 8);
    v5 = (SFAppAutoFillPasskeyProvider *)objc_alloc_init(v4);
    passkeyProvider = v2->_passkeyProvider;
    v2->_passkeyProvider = v5;

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v7 = (void *)getSFAppAutoFillOneTimeCodeProviderClass_softClass;
    uint64_t v21 = getSFAppAutoFillOneTimeCodeProviderClass_softClass;
    if (!getSFAppAutoFillOneTimeCodeProviderClass_softClass)
    {
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      v15 = __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke;
      v16 = &unk_265247EA0;
      v17 = &v18;
      __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke((uint64_t)&v13);
      v7 = (void *)v19[3];
    }
    v8 = v7;
    _Block_object_dispose(&v18, 8);
    v9 = (SFAppAutoFillOneTimeCodeProvider *)objc_alloc_init(v8);
    oneTimeCodeProvider = v2->_oneTimeCodeProvider;
    v2->_oneTimeCodeProvider = v9;

    [(SFAppAutoFillOneTimeCodeProvider *)v2->_oneTimeCodeProvider addObserver:v2];
  }
  return v2;
}

- (id)obtainApplicationIdentifierFromConnection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    v6 = v5;
    CFErrorRef error = 0;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"application-identifier", &error);
    if (error)
    {
      v8 = AFCredentialManagerOSLogFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AFCredentialManager obtainApplicationIdentifierFromConnection:]((uint64_t *)&error);
      }

      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)obtainBundleIdentifierFromConnection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  CPCopyBundleIdentifierAndTeamFromAuditToken();

  return 0;
}

- (BOOL)hasAutoFillContextEntitlementForConnection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    v6 = v5;
    CFErrorRef error = 0;
    v7 = (void *)SecTaskCopyValueForEntitlement(v5, @"com.apple.textInput.autofillContext", &error);
    char v8 = [v7 BOOLValue];

    if (error)
    {
      v9 = AFCredentialManagerOSLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AFCredentialManager hasAutoFillContextEntitlementForConnection:]((uint64_t *)&error);
      }

      CFRelease(error);
    }
    CFRelease(v6);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)getCredentialsWithApplicationIdentifier:(id)a3 documentTraits:(id)a4 withCompletionHandler:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 associatedDomains];
  if ([v9 count] && (getSFSafariCredentialStoreClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    [getSFSafariCredentialStoreClass() getCredentialsForAppWithAppID:v12 externallyVerifiedAndApprovedSharedWebCredentialDomains:v9 completionHandler:v8];
  }
  else
  {
    getSFSafariCredentialStoreClass();
    if (objc_opt_respondsToSelector())
    {
      v10 = [v7 autofillContext];
      v11 = [v10 objectForKey:@"_WebViewURL"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v11 = 0;
      }
      [getSFSafariCredentialStoreClass() getCredentialsForAppWithAppID:v12 websiteURL:v11 completionHandler:v8];
    }
    else
    {
      [getSFSafariCredentialStoreClass() getCredentialsForAppWithAppID:v12 completionHandler:v8];
    }
  }
}

- (id)_autoFillPayloadForPasswordCredential:(id)a3 customInfoType:(unint64_t *)a4
{
  id v5 = a3;
  v6 = [v5 user];
  id v7 = [v5 password];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v5 isExternal])
  {
    *a4 = 13;
    v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    [v8 setObject:v9 forKey:@"ExternalCredentialData"];
  }
  else
  {
    *a4 = 5;
    [v8 setObject:v6 forKey:@"AutofillUsername"];
    [v8 setObject:v7 forKey:@"AutofillPassword"];
  }

  return v8;
}

- (id)_suggestionForPasswordCredential:(id)a3 autoFillPayload:(id)a4 customInfoType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 user];
  if (![v9 length])
  {
    v10 = +[AFSuggestionGenerationManager sharedInstance];
    v11 = [v10 localizationManager];
    id v12 = [v11 localizedStringForKey:@"SAFARI_CREDENTIAL_DATE"];

    uint64_t v13 = (void *)MEMORY[0x263F08790];
    uint64_t v14 = [v7 creationDate];
    v15 = [v13 localizedStringFromDate:v14 dateStyle:1 timeStyle:0];

    id v27 = 0;
    v16 = [NSString stringWithValidatedFormat:v12, @"%@", &v27, v15 validFormatSpecifiers error];
    id v17 = v27;
    uint64_t v18 = &stru_26FCB48F0;
    if (v16) {
      uint64_t v18 = v16;
    }
    v19 = v18;

    if (v17)
    {
      uint64_t v20 = AFCredentialManagerOSLogFacility();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[AFCredentialManager _suggestionForPasswordCredential:autoFillPayload:customInfoType:]((uint64_t)v17);
      }
    }
    v9 = v19;
  }
  if ([v7 isExternal])
  {
    uint64_t v21 = [getSFSafariCredentialStoreClass() textSuggestionHeaderForExternalCredential:v7];
  }
  else
  {
    uint64_t v21 = [v7 site];
    if (![v21 length])
    {
      v22 = +[AFSuggestionGenerationManager sharedInstance];
      v23 = [v22 localizationManager];
      uint64_t v24 = [v23 localizedStringForKey:@"SAFARI_KEYCHAIN"];

      uint64_t v21 = (void *)v24;
    }
  }
  v25 = [[AFSuggestion alloc] initWithTitle:v9 subTitle:v21 usernameAndPasswordPayload:v8 leadingImage:0 trailingImage:0 customInfoType:a5];

  return v25;
}

- (id)_autoFillPayloadForPasskey:(id)a3 customInfoType:(unint64_t *)a4
{
  v9[1] = *MEMORY[0x263EF8340];
  *a4 = 12;
  id v8 = @"Passkey";
  v9[0] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (id)_suggestionForPasskey:(id)a3 autoFillPayload:(id)a4 customInfoType:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 username];
  v10 = +[AFSuggestionGenerationManager sharedInstance];
  v11 = [v10 localizationManager];
  id v12 = [v11 localizedStringForKey:@"SAFARI_PASSKEY_SITE_SHORT"];

  uint64_t v13 = NSString;
  id v22 = 0;
  uint64_t v14 = [v8 relyingPartyIdentifier];

  v15 = [v13 stringWithValidatedFormat:v12, @"%@", &v22, v14 validFormatSpecifiers error];
  id v16 = v22;
  id v17 = &stru_26FCB48F0;
  if (v15) {
    id v17 = v15;
  }
  uint64_t v18 = v17;

  if (v16)
  {
    v19 = AFCredentialManagerOSLogFacility();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[AFCredentialManager _suggestionForPasskey:autoFillPayload:customInfoType:]((uint64_t)v16);
    }
  }
  uint64_t v20 = [[AFSuggestion alloc] initWithTitle:v9 subTitle:v18 usernameAndPasswordPayload:v7 leadingImage:0 trailingImage:0 customInfoType:a5];

  return v20;
}

- (id)generateLoginAutoFillWithDocumentTraits:(id)a3
{
  v61[1] = *MEMORY[0x263EF8340];
  id v35 = a3;
  v33 = [MEMORY[0x263F08D68] currentConnection];
  v4 = [getSFAutoFillFeatureManagerClass() sharedFeatureManager];
  int v5 = [v4 shouldAutoFillPasswords];

  if (!v5)
  {
    v10 = 0;
    goto LABEL_38;
  }
  v34 = [v35 appId];
  if (!v34) {
    goto LABEL_13;
  }
  if (isSystemAutoFillBundle_onceToken != -1) {
    dispatch_once(&isSystemAutoFillBundle_onceToken, &__block_literal_global_276);
  }
  uint64_t v6 = isSystemAutoFillBundle_autoFillPanelIdentifiers;
  id v7 = [MEMORY[0x263F086E0] mainBundle];
  id v8 = [v7 bundleIdentifier];
  LOBYTE(v6) = [(id)v6 containsObject:v8];

  if (v6) {
    goto LABEL_14;
  }
  v9 = [v35 bundleId];
  if (!v9)
  {
    v9 = [(AFCredentialManager *)self obtainBundleIdentifierFromConnection:v33];
  }
  if (([v9 hasPrefix:@"com.apple."] & 1) == 0
    && ![(AFCredentialManager *)self hasAutoFillContextEntitlementForConnection:v33])
  {

LABEL_13:
    v34 = [(AFCredentialManager *)self obtainApplicationIdentifierFromConnection:v33];
    goto LABEL_14;
  }

LABEL_14:
  v11 = dispatch_group_create();
  id v12 = v11;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__0;
  v53 = __Block_byref_object_dispose__0;
  id v54 = 0;
  if (self->_passkeyProvider)
  {
    dispatch_group_enter(v11);
    passkeyProvider = self->_passkeyProvider;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __63__AFCredentialManager_generateLoginAutoFillWithDocumentTraits___block_invoke;
    v46[3] = &unk_265247F80;
    v48 = &v49;
    v47 = v12;
    [(SFAppAutoFillPasskeyProvider *)passkeyProvider getAvailablePasskeysForApplicationIdentifier:v34 completionHandler:v46];
  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  id v45 = 0;
  dispatch_group_enter(v12);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __63__AFCredentialManager_generateLoginAutoFillWithDocumentTraits___block_invoke_2;
  v37[3] = &unk_265247F80;
  v39 = &v40;
  dispatch_group_t group = v12;
  dispatch_group_t v38 = group;
  [(AFCredentialManager *)self getCredentialsWithApplicationIdentifier:v34 documentTraits:v35 withCompletionHandler:v37];
  dispatch_time_t v14 = dispatch_time(0, 3000000000);
  dispatch_group_wait(group, v14);
  if ([(id)v50[5] count])
  {
    v15 = [(id)v50[5] firstObject];
    v61[0] = v15;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:1];
  }
  else
  {
    id v17 = [(id)v41[5] firstObject];
    int v18 = [v17 isExternal];

    v19 = (void *)v41[5];
    if (v18)
    {
      uint64_t v20 = [v19 firstObject];
      v60 = v20;
      id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
    }
    else
    {
      id v16 = v19;
    }
  }
  if ((unint64_t)[v16 count] >= 2)
  {
    uint64_t v21 = objc_msgSend(v16, "subarrayWithRange:", 0, 1);

    id v16 = (id)v21;
  }
  if ((unint64_t)[v16 count] > 2) {
    uint64_t v22 = 3;
  }
  else {
    uint64_t v22 = [v16 count];
  }
  v10 = [MEMORY[0x263EFF980] arrayWithCapacity:v22];
  uint64_t v23 = [v16 count];
  if (v23)
  {
    for (uint64_t i = 0; v23 != i; ++i)
    {
      v25 = [v16 objectAtIndex:i];
      uint64_t v36 = 0;
      uint64_t v56 = 0;
      v57 = &v56;
      uint64_t v58 = 0x2050000000;
      v26 = (void *)getSFSafariCredentialClass_softClass;
      uint64_t v59 = getSFSafariCredentialClass_softClass;
      if (!getSFSafariCredentialClass_softClass)
      {
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __getSFSafariCredentialClass_block_invoke;
        v55[3] = &unk_265247EA0;
        v55[4] = &v56;
        __getSFSafariCredentialClass_block_invoke((uint64_t)v55);
        v26 = (void *)v57[3];
      }
      id v27 = v26;
      _Block_object_dispose(&v56, 8);
      if (objc_opt_isKindOfClass())
      {
        v28 = [(AFCredentialManager *)self _autoFillPayloadForPasswordCredential:v25 customInfoType:&v36];
        v29 = [(AFCredentialManager *)self _suggestionForPasswordCredential:v25 autoFillPayload:v28 customInfoType:v36];
        [v10 addObject:v29];
      }
      else
      {
        if (!getSFAutoFillPasskeyClass()) {
          goto LABEL_36;
        }
        getSFAutoFillPasskeyClass();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_36;
        }
        v28 = [(AFCredentialManager *)self _autoFillPayloadForPasskey:v25 customInfoType:&v36];
        v29 = [(AFCredentialManager *)self _suggestionForPasskey:v25 autoFillPayload:v28 customInfoType:v36];
        [v10 addObject:v29];
      }

LABEL_36:
    }
  }
  v30 = [[AFSuggestion alloc] initWithTitle:&stru_26FCB48F0 subTitle:&stru_26FCB48F0 usernameAndPasswordPayload:0 leadingImage:0 trailingImage:0 customInfoType:6];
  [v10 addObject:v30];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v49, 8);

LABEL_38:
  return v10;
}

void __63__AFCredentialManager_generateLoginAutoFillWithDocumentTraits___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__AFCredentialManager_generateLoginAutoFillWithDocumentTraits___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v6);
}

- (void)generateSignupAutoFillWithAutoFillMode:(unint64_t)a3 documentTraits:(id)a4 completionHandler:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v34 = a4;
  id v33 = a5;
  id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  id v45 = __Block_byref_object_copy__0;
  v46 = __Block_byref_object_dispose__0;
  id v47 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [getSFAutoFillFeatureManagerClass() sharedFeatureManager];
  char v7 = [v6 shouldAutoFillPasswords];

  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v9 = [v34 textInputTraits];
    BOOL v10 = [v9 keyboardType] == 7;

    uint64_t v48 = 0;
    uint64_t v49 = &v48;
    uint64_t v50 = 0x2050000000;
    v11 = (void *)getSFSuggestedUserProviderClass_softClass;
    uint64_t v51 = getSFSuggestedUserProviderClass_softClass;
    if (!getSFSuggestedUserProviderClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v53 = 3221225472;
      id v54 = __getSFSuggestedUserProviderClass_block_invoke;
      v55 = &unk_265247EA0;
      uint64_t v56 = &v48;
      __getSFSuggestedUserProviderClass_block_invoke((uint64_t)buf);
      v11 = (void *)v49[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v48, 8);
    uint64_t v13 = [v12 sharedProvider];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __95__AFCredentialManager_generateSignupAutoFillWithAutoFillMode_documentTraits_completionHandler___block_invoke;
    v39[3] = &unk_265247F80;
    v41 = &v42;
    dispatch_time_t v14 = v8;
    uint64_t v40 = v14;
    [v13 suggestedUsersOfType:v10 completionHandler:v39];

    dispatch_time_t v15 = dispatch_time(0, 200000000);
    dispatch_semaphore_wait(v14, v15);
  }
  if ((unint64_t)[(id)v43[5] count] > 2)
  {
    unint64_t v16 = 3;
  }
  else
  {
    unint64_t v16 = [(id)v43[5] count];
    if (!v16) {
      goto LABEL_16;
    }
  }
  uint64_t v17 = 0;
  BOOL v18 = 1;
  do
  {
    v19 = [(id)v43[5] objectAtIndex:v17];
    char v20 = [v19 containsString:@"@"];

    if ((v20 & 1) == 0) {
      break;
    }
    BOOL v18 = ++v17 < v16;
  }
  while (v16 != v17);
  for (uint64_t i = 0; i != v16; ++i)
  {
    uint64_t v22 = [(id)v43[5] objectAtIndex:i];
    uint64_t v23 = &stru_26FCB48F0;
    if (v18)
    {
      uint64_t v24 = +[AFSuggestionGenerationManager sharedInstance];
      v25 = [v24 localizationManager];
      uint64_t v23 = [v25 localizedStringForKey:@"SAFARI_CREDENTIAL_SUGGESTED_USERNAME"];
    }
    v26 = [[AFSuggestion alloc] initWithTitle:v23 subTitle:v22 usernameAndPasswordPayload:0 leadingImage:0 trailingImage:0 customInfoType:8];
    [v35 addObject:v26];
  }
LABEL_16:
  if ([v34 autofillSubMode] == 3)
  {
    id v27 = [MEMORY[0x263F08D68] currentConnection];
    v28 = [v34 appId];
    if (!v28)
    {
      v28 = [(AFCredentialManager *)self obtainApplicationIdentifierFromConnection:v27];
    }
    v29 = [v34 bundleId];
    if (v29
      || ([(AFCredentialManager *)self obtainBundleIdentifierFromConnection:v27], (v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (v28)
      {
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __95__AFCredentialManager_generateSignupAutoFillWithAutoFillMode_documentTraits_completionHandler___block_invoke_2;
        v36[3] = &unk_265247FA8;
        id v37 = v35;
        id v38 = v33;
        [(AFCredentialManager *)self generateHideMyEmailSuggestionWithApplicationBundleId:v29 applicationId:v28 completionHandler:v36];

        goto LABEL_27;
      }
    }
  }
  v30 = AFCredentialManagerOSLogFacility();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s Hide My Email is not required.", "-[AFCredentialManager generateSignupAutoFillWithAutoFillMode:documentTraits:completionHandler:]");
    -[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:](v31, buf, v30);
  }

  (*((void (**)(id, id))v33 + 2))(v33, v35);
LABEL_27:
  _Block_object_dispose(&v42, 8);
}

void __95__AFCredentialManager_generateSignupAutoFillWithAutoFillMode_documentTraits_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_semaphore_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) value];
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __95__AFCredentialManager_generateSignupAutoFillWithAutoFillMode_documentTraits_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)generateHideMyEmailAutoFillWithRenderTraits:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (!v6)
  {
    dispatch_semaphore_t v8 = AFCredentialManagerOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AFCredentialManager generateHideMyEmailAutoFillWithRenderTraits:completionHandler:]();
    }

    v7[2](v7, 0);
  }
  uint64_t v9 = [v6 bundleId];
  if (v9
    && (long long v10 = (void *)v9,
        [v6 appId],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    long long v12 = [v6 bundleId];
    long long v13 = [v6 appId];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __85__AFCredentialManager_generateHideMyEmailAutoFillWithRenderTraits_completionHandler___block_invoke;
    v15[3] = &unk_265247FD0;
    unint64_t v16 = v7;
    [(AFCredentialManager *)self generateHideMyEmailSuggestionWithApplicationBundleId:v12 applicationId:v13 completionHandler:v15];
  }
  else
  {
    dispatch_time_t v14 = AFCredentialManagerOSLogFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AFCredentialManager generateHideMyEmailAutoFillWithRenderTraits:completionHandler:]();
    }

    v7[2](v7, 0);
  }
}

uint64_t __85__AFCredentialManager_generateHideMyEmailAutoFillWithRenderTraits_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateHideMyEmailSuggestionWithApplicationBundleId:(id)a3 applicationId:(id)a4 completionHandler:(id)a5
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = (void (**)(id, void))a5;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = __Block_byref_object_copy__0;
  v89[4] = __Block_byref_object_dispose__0;
  id v90 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id SFSafariCredentialStoreClass = getSFSafariCredentialStoreClass();
  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke;
  v86[3] = &unk_265247F80;
  v88 = v89;
  long long v11 = v9;
  v87 = v11;
  [SFSafariCredentialStoreClass getApprovedSharedWebCredentialsEntriesForAppWithAppID:v7 completionHandler:v86];
  dispatch_time_t v12 = dispatch_time(0, 200000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    long long v13 = AFCredentialManagerOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      dispatch_time_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s AFCTester: Timeout on getApprovedSharedWebCredentialsEntriesForAppWithAppID:completionHandler:", "-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]");
      -[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:](v14, v101, v13);
    }

    v8[2](v8, 0);
  }
  else
  {
    *(void *)v101 = 0;
    v102 = v101;
    uint64_t v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__0;
    v105 = __Block_byref_object_dispose__0;
    id v106 = 0;
    uint64_t v15 = +[AFSuggestionGenerationManager sharedInstance];
    unint64_t v16 = [v15 localizationManager];
    uint64_t v17 = [v16 localizedStringForKey:@"SAFARI_HIDE_MY_EMAIL_SUGGESTION"];
    BOOL v18 = (void *)*((void *)v102 + 5);
    *((void *)v102 + 5) = v17;

    v19 = (void *)*((void *)v102 + 5);
    if (!v19 || ![v19 length])
    {
      char v20 = AFCredentialManagerOSLogFacility();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s Localized Hide My Email text is nil", "-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]");
        -[AFSuggestionGenerationManager generateContactAutoFillSuggestionsWithTextPrefix:documentTraits:completionHandler:](v21, buf, v20);
      }

      uint64_t v22 = (void *)*((void *)v102 + 5);
      *((void *)v102 + 5) = @"Hide My Email";
    }
    uint64_t v74 = 0;
    uint64_t v75 = (uint64_t)&v74;
    uint64_t v76 = 0x2050000000;
    uint64_t v23 = (void *)getAKAccountManagerClass_softClass;
    v77 = (uint64_t (*)(uint64_t, uint64_t))getAKAccountManagerClass_softClass;
    if (!getAKAccountManagerClass_softClass)
    {
      uint64_t v80 = MEMORY[0x263EF8330];
      uint64_t v81 = 3221225472;
      uint64_t v82 = (uint64_t)__getAKAccountManagerClass_block_invoke;
      v83 = (uint64_t (*)(uint64_t, uint64_t))&unk_265247EA0;
      v84 = (void (*)(uint64_t))&v74;
      __getAKAccountManagerClass_block_invoke((uint64_t)&v80);
      uint64_t v23 = *(void **)(v75 + 24);
    }
    id v24 = v23;
    _Block_object_dispose(&v74, 8);
    v25 = [v24 sharedInstance];
    uint64_t v80 = 0;
    uint64_t v81 = (uint64_t)&v80;
    uint64_t v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__0;
    v84 = __Block_byref_object_dispose__0;
    uint64_t v91 = 0;
    uint64_t v92 = (uint64_t)&v91;
    uint64_t v93 = 0x2050000000;
    v26 = (void *)getAKPrivateEmailControllerClass_softClass;
    v94 = (void *)getAKPrivateEmailControllerClass_softClass;
    if (!getAKPrivateEmailControllerClass_softClass)
    {
      uint64_t v74 = MEMORY[0x263EF8330];
      uint64_t v75 = 3221225472;
      uint64_t v76 = (uint64_t)__getAKPrivateEmailControllerClass_block_invoke;
      v77 = (uint64_t (*)(uint64_t, uint64_t))&unk_265247EA0;
      v78 = (void (*)(uint64_t))&v91;
      __getAKPrivateEmailControllerClass_block_invoke((uint64_t)&v74);
      v26 = *(void **)(v92 + 24);
    }
    id v27 = v26;
    _Block_object_dispose(&v91, 8);
    id v85 = objc_alloc_init(v27);
    uint64_t v28 = [v25 primaryAuthKitAccount];
    uint64_t v74 = 0;
    uint64_t v75 = (uint64_t)&v74;
    uint64_t v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__0;
    v78 = __Block_byref_object_dispose__0;
    uint64_t v42 = (void *)v28;
    objc_msgSend(v25, "altDSIDForAccount:");
    id v79 = (id)objc_claimAutoreleasedReturnValue();
    v72[0] = 0;
    v72[1] = v72;
    v72[2] = 0x2810000000;
    v72[3] = "";
    char v73 = 0;
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_94;
    v65[3] = &unk_265248020;
    id v29 = v43;
    id v66 = v29;
    id v30 = v7;
    id v67 = v30;
    v69 = v101;
    v70 = &v74;
    v71 = v72;
    v31 = v8;
    id v68 = v31;
    v32 = (void *)MEMORY[0x24C589840](v65);
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_99;
    v56[3] = &unk_265248070;
    id v57 = v30;
    v61 = &v74;
    id v33 = v29;
    id v58 = v33;
    v62 = &v80;
    v63 = v101;
    v64 = v72;
    id v34 = v31;
    id v59 = v34;
    id v35 = v32;
    id v60 = v35;
    uint64_t v36 = (void *)MEMORY[0x24C589840](v56);
    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x2050000000;
    id v37 = (void *)getCSFFeatureManagerClass_softClass;
    uint64_t v99 = getCSFFeatureManagerClass_softClass;
    if (!getCSFFeatureManagerClass_softClass)
    {
      uint64_t v91 = MEMORY[0x263EF8330];
      uint64_t v92 = 3221225472;
      uint64_t v93 = (uint64_t)__getCSFFeatureManagerClass_block_invoke;
      v94 = &unk_265247EA0;
      v95 = &v96;
      __getCSFFeatureManagerClass_block_invoke((uint64_t)&v91);
      id v37 = (void *)v97[3];
    }
    id v38 = v37;
    _Block_object_dispose(&v96, 8);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_102;
    v47[3] = &unk_2652480E8;
    uint64_t v51 = v72;
    v39 = v34;
    id v49 = v39;
    v52 = v89;
    uint64_t v53 = &v74;
    id v48 = v33;
    id v54 = &v80;
    v55 = v101;
    id v40 = v36;
    id v50 = v40;
    [v38 requestFeatureWithId:@"mail.hide-my-email.create" completion:v47];
    dispatch_time_t v41 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_116;
    block[3] = &unk_265248110;
    v46 = v72;
    id v45 = v39;
    dispatch_after(v41, MEMORY[0x263EF83A0], block);

    _Block_object_dispose(v72, 8);
    _Block_object_dispose(&v74, 8);

    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(v101, 8);
  }
  _Block_object_dispose(v89, 8);
}

intptr_t __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFF8C0];
  id v4 = a2;
  uint64_t v5 = [[v3 alloc] initWithArray:v4];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  dispatch_semaphore_t v8 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v8);
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_94(uint64_t a1)
{
  id SFSafariCredentialStoreClass = getSFSafariCredentialStoreClass();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2;
  v6[3] = &unk_265247FF8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v10 = v5;
  id v8 = *(id *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  [SFSafariCredentialStoreClass bestDomainForAppID:v3 completionHandler:v6];
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    id v4 = (void *)a1[4];
  }
  id v5 = v4;
  uint64_t v6 = [[AFSuggestion alloc] initWithTitle:*(void *)(*(void *)(a1[7] + 8) + 40) applicationKey:v5 applicationBundleId:a1[5] altDSID:*(void *)(*(void *)(a1[8] + 8) + 40) customInfoType:11];
  if (atomic_exchange((atomic_uchar *volatile)(*(void *)(a1[9] + 8) + 32), 1u))
  {
    id v7 = AFCredentialManagerOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_cold_1();
    }
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_99(uint64_t a1)
{
  v2 = (void *)[objc_alloc((Class)getAKPrivateEmailContextClass()) initWithKey:*(void *)(a1 + 32) altDSID:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) clientAppBundleId:*(void *)(a1 + 40)];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_100;
  v7[3] = &unk_265248048;
  uint64_t v12 = *(void *)(a1 + 80);
  id v8 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  id v9 = v4;
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v13 = v5;
  uint64_t v14 = v6;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v3 lookupPrivateEmailWithContext:v2 completion:v7];
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_100(void *a1, void *a2)
{
  id v3 = [a2 privateEmailAddress];

  if (v3)
  {
    id v4 = [[AFSuggestion alloc] initWithTitle:*(void *)(*(void *)(a1[8] + 8) + 40) applicationKey:a1[4] applicationBundleId:a1[5] altDSID:*(void *)(*(void *)(a1[9] + 8) + 40) customInfoType:11];
    if (atomic_exchange((atomic_uchar *volatile)(*(void *)(a1[10] + 8) + 32), 1u))
    {
      uint64_t v6 = AFCredentialManagerOSLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_cold_1();
      }
    }
    else
    {
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(a1[7] + 16);
    v5();
  }
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = AFCredentialManagerOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_102_cold_3((uint64_t)v6);
    }
LABEL_12:

    if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 32), 1u) & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    goto LABEL_14;
  }
  if (([v5 canUse] & 1) == 0)
  {
    id v7 = AFCredentialManagerOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_102_cold_2();
    }
    goto LABEL_12;
  }
  if ([v5 canUse])
  {
    id v8 = AFCredentialManagerOSLogFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_102_cold_1(v8);
    }

    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    char v27 = 0;
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      id v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_112;
      v16[3] = &unk_2652480C0;
      uint64_t v20 = *(void *)(a1 + 72);
      id v10 = *(id *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 80);
      uint64_t v11 = *(void *)(a1 + 88);
      id v17 = v10;
      uint64_t v21 = v12;
      uint64_t v22 = v26;
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v23 = v11;
      uint64_t v24 = v13;
      id v14 = *(id *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 64);
      id v18 = v14;
      uint64_t v25 = v15;
      id v19 = *(id *)(a1 + 48);
      [v9 enumerateObjectsUsingBlock:v16];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    _Block_object_dispose(v26, 8);
  }
LABEL_14:
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_112(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = objc_alloc((Class)getAKPrivateEmailContextClass());
  id v9 = [v7 domain];
  id v10 = (void *)[v8 initWithKey:v9 altDSID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) clientAppBundleId:*(void *)(a1 + 32)];

  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_113;
  v18[3] = &unk_265248098;
  uint64_t v27 = a4;
  long long v23 = *(_OWORD *)(a1 + 72);
  id v19 = v7;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 56);
  id v20 = v12;
  uint64_t v14 = *(void *)(a1 + 88);
  uint64_t v24 = v13;
  uint64_t v25 = v14;
  id v15 = *(id *)(a1 + 40);
  uint64_t v28 = a3;
  uint64_t v16 = *(void *)(a1 + 96);
  id v21 = v15;
  uint64_t v26 = v16;
  id v22 = *(id *)(a1 + 48);
  id v17 = v7;
  [v11 lookupPrivateEmailWithContext:v10 completion:v18];
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_113(uint64_t a1, void *a2)
{
  id v3 = [a2 privateEmailAddress];

  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    **(unsigned char **)(a1 + 104) = 1;
    id v4 = [AFSuggestion alloc];
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v6 = [*(id *)(a1 + 32) domain];
    id v7 = [(AFSuggestion *)v4 initWithTitle:v5 applicationKey:v6 applicationBundleId:*(void *)(a1 + 40) altDSID:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) customInfoType:11];

    if (atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 88) + 8) + 32), 1u))
    {
      id v10 = AFCredentialManagerOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_cold_1();
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 112);
    if (v8 == [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) count] - 1
      && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      v9();
    }
  }
}

uint64_t __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_116(uint64_t result)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(result + 40) + 8) + 32), 1u) & 1) == 0)
  {
    uint64_t v1 = result;
    v2 = AFCredentialManagerOSLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_116_cold_1();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (id)oneTimeCodeProvider
{
  return self->_oneTimeCodeProvider;
}

- (void)generateOneTimeCodeAutoFillSuggestionsWithDocumentTraits:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v27 = (void (**)(id, void *))a4;
  id v29 = [MEMORY[0x263EFF980] array];
  id v7 = [v6 textInputTraits];
  uint64_t v8 = [v7 textContentType];
  int v9 = [v8 isEqualToString:@"one-time-code"];

  if (v9) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [(AFCredentialManager *)self oneTimeCodeProvider];
  id v12 = [v6 appId];
  uint64_t v13 = [v6 autofillContext];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"_WebViewURL"];
  id v15 = [v11 currentOneTimeCodesWithAppIdentifier:v12 website:v14 usernameHint:0 fieldClassification:v10];

  if ((unint64_t)[v15 count] >= 4)
  {
    uint64_t v16 = objc_msgSend(v15, "subarrayWithRange:", 0, 3);

    id v15 = (void *)v16;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v15;
  uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v22 = [v21 localizedTitleForContext:0];
        long long v23 = [v21 localizedSubtitleForContext:0];
        id v34 = @"OneTimeCode";
        id v35 = v21;
        uint64_t v24 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        if ([v21 source] == 2) {
          uint64_t v25 = 10;
        }
        else {
          uint64_t v25 = 7;
        }
        uint64_t v26 = [[AFSuggestion alloc] initWithTitle:v22 subtitle:v23 oneTimeCodePayload:v24 customInfoType:v25];
        [v29 addObject:v26];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v18);
  }

  v27[2](v27, v29);
}

- (void)_consumeOneTimeCodeAutoFillSuggestionIfNeeded:(id)a3
{
  id v4 = [a3 oneTimeCodePayload];
  id v6 = [v4 objectForKeyedSubscript:@"OneTimeCode"];

  if (v6)
  {
    uint64_t v5 = [(AFCredentialManager *)self oneTimeCodeProvider];
    [v5 consumeOneTimeCode:v6];
  }
}

- (BOOL)shouldAuthenticateToAcceptAutoFill
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v2 = (void *)getMCProfileConnectionClass_softClass_0;
  uint64_t v19 = getMCProfileConnectionClass_softClass_0;
  if (!getMCProfileConnectionClass_softClass_0)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __getMCProfileConnectionClass_block_invoke_0;
    uint64_t v14 = &unk_265247EA0;
    id v15 = &v16;
    __getMCProfileConnectionClass_block_invoke_0((uint64_t)&v11);
    v2 = (void *)v17[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v16, 8);
  id v4 = [v3 sharedConnection];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v5 = (void *)getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr_0;
  uint64_t v19 = getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr_0;
  if (!getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr_0)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_block_invoke_0;
    uint64_t v14 = &unk_265247EA0;
    id v15 = &v16;
    id v6 = (void *)ManagedConfigurationLibrary_0();
    id v7 = dlsym(v6, "MCFeatureAuthenticationBeforeAutoFillRequired");
    *(void *)(v15[1] + 24) = v7;
    getMCFeatureAuthenticationBeforeAutoFillRequiredSymbolLoc_ptr_0 = *(void *)(v15[1] + 24);
    uint64_t v5 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v5)
  {
    uint64_t v10 = (_Unwind_Exception *)-[AFSuggestionGenerationManager generateCreditCardAutoFillWithCompletionHandler:]();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v10);
  }
  BOOL v8 = [v4 effectiveBoolValueForSetting:*v5] == 1;

  return v8;
}

- (void)shouldAcceptAutoFill:(id)a3 withPayload:(id)a4 documentTraits:(id)a5 completionHandler:(id)a6
{
  v80[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v59 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  if (v12)
  {
    if (v10)
    {
      uint64_t v14 = [v10 customInfoType];
      uint64_t v15 = [v10 customInfoType];
      uint64_t v16 = [v10 customInfoType];
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke;
      v67[3] = &unk_265248138;
      BOOL v71 = v15 == 12;
      v67[4] = self;
      id v55 = v59;
      id v68 = v55;
      id v69 = v10;
      id v70 = v13;
      id v58 = (void (**)(void, void, void))MEMORY[0x24C589840](v67);
      if ([(AFCredentialManager *)self shouldAuthenticateToAcceptAutoFill]
        && (v14 == 5 || v15 == 12 || v16 == 10))
      {
        uint64_t v17 = [v11 bundleId];
        if (!v17)
        {
          uint64_t v18 = [MEMORY[0x263F08D68] currentConnection];
          uint64_t v17 = [(AFCredentialManager *)self obtainBundleIdentifierFromConnection:v18];
        }
        uint64_t v73 = 0;
        uint64_t v74 = &v73;
        uint64_t v75 = 0x2050000000;
        uint64_t v19 = (void *)getLAContextClass_softClass_0;
        uint64_t v76 = getLAContextClass_softClass_0;
        if (!getLAContextClass_softClass_0)
        {
          v72[0] = MEMORY[0x263EF8330];
          v72[1] = 3221225472;
          v72[2] = __getLAContextClass_block_invoke_0;
          v72[3] = &unk_265247EA0;
          void v72[4] = &v73;
          __getLAContextClass_block_invoke_0((uint64_t)v72);
          uint64_t v19 = (void *)v74[3];
        }
        id v20 = v19;
        _Block_object_dispose(&v73, 8);
        id v21 = objc_alloc_init(v20);
        [(AFCredentialManager *)self setLaContext:v21];

        id v57 = (void *)MGCopyAnswer();
        if (v14 == 5)
        {
          id v22 = NSString;
          long long v23 = +[AFSuggestionGenerationManager sharedInstance];
          uint64_t v24 = [v23 localizationManager];
          uint64_t v25 = [v24 localizedStringForKey:@"AUTOFILL_AUTH_PASSCODE_TITLE"];
          id v66 = 0;
          uint64_t v26 = [v22 stringWithValidatedFormat:v25, @"%@", &v66, v57 validFormatSpecifiers error];
          id v27 = v66;
          uint64_t v28 = &stru_26FCB48F0;
          if (v26) {
            uint64_t v28 = v26;
          }
          uint64_t v56 = v28;

          if (v27)
          {
            id v29 = AFCredentialManagerOSLogFacility();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]((uint64_t)v27);
            }
          }
          long long v30 = +[AFSuggestionGenerationManager sharedInstance];
          long long v31 = [v30 localizationManager];
          uint64_t v32 = [v31 localizedStringForKey:@"AUTOFILL_AUTH_ALERT_TITLE"];
        }
        else if (v16 == 10)
        {
          long long v33 = NSString;
          id v34 = +[AFSuggestionGenerationManager sharedInstance];
          id v35 = [v34 localizationManager];
          uint64_t v36 = [v35 localizedStringForKey:@"TOTP_AUTOFILL_AUTH_PASSCODE_TITLE"];
          id v65 = 0;
          uint64_t v37 = [v33 stringWithValidatedFormat:v36, @"%@", &v65, v57 validFormatSpecifiers error];
          id v27 = v65;
          id v38 = &stru_26FCB48F0;
          if (v37) {
            id v38 = v37;
          }
          uint64_t v56 = v38;

          if (v27)
          {
            v39 = AFCredentialManagerOSLogFacility();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]((uint64_t)v27);
            }
          }
          long long v30 = +[AFSuggestionGenerationManager sharedInstance];
          long long v31 = [v30 localizationManager];
          uint64_t v32 = [v31 localizedStringForKey:@"TOTP_AUTOFILL_AUTH_ALERT_TITLE"];
        }
        else
        {
          if (v15 != 12) {
            -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:].cold.5();
          }
          id v40 = NSString;
          dispatch_time_t v41 = +[AFSuggestionGenerationManager sharedInstance];
          uint64_t v42 = [v41 localizationManager];
          id v43 = [v42 localizedStringForKey:@"PASSKEY_AUTOFILL_AUTH_PASSCODE_TITLE"];
          id v64 = 0;
          uint64_t v44 = [v40 stringWithValidatedFormat:v43, @"%@", &v64, v57 validFormatSpecifiers error];
          id v27 = v64;
          id v45 = &stru_26FCB48F0;
          if (v44) {
            id v45 = v44;
          }
          uint64_t v56 = v45;

          if (v27)
          {
            v46 = AFCredentialManagerOSLogFacility();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
              -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:].cold.4((uint64_t)v27);
            }
          }
          long long v30 = +[AFSuggestionGenerationManager sharedInstance];
          long long v31 = [v30 localizationManager];
          uint64_t v32 = [v31 localizedStringForKey:@"PASSKEY_AUTOFILL_AUTH_ALERT_TITLE"];
        }
        id v47 = (void *)v32;

        if (!v47) {
          -[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]();
        }
        if ([v11 processId])
        {
          v79[0] = &unk_26FCB6388;
          v79[1] = &unk_26FCB63A0;
          v80[0] = v47;
          v80[1] = v56;
          v80[2] = MEMORY[0x263EFFA88];
          v79[2] = &unk_26FCB63B8;
          v79[3] = &unk_26FCB63D0;
          id v48 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "processId"));
          v80[3] = v48;
          id v49 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:4];
        }
        else
        {
          v77[0] = &unk_26FCB6388;
          v77[1] = &unk_26FCB63A0;
          v78[0] = v47;
          v78[1] = v56;
          v77[2] = &unk_26FCB63B8;
          v78[2] = MEMORY[0x263EFFA88];
          id v49 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:3];
        }
        id v50 = [(AFCredentialManager *)self laContext];
        id v63 = 0;
        int v51 = [v50 canEvaluatePolicy:2 error:&v63];
        id v52 = v63;

        if (v51)
        {
          if ([v17 isEqualToString:@"com.apple.springboard"]
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v58[2](v58, 0, 0);
            int v53 = 1;
          }
          else
          {
            int v53 = 0;
          }
          id v54 = [(AFCredentialManager *)self laContext];
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke_165;
          v60[3] = &unk_265248160;
          v60[4] = self;
          char v62 = v53;
          v61 = v58;
          [v54 evaluatePolicy:2 options:v49 reply:v60];

          if (v53) {
            [(AFCredentialManager *)self setQueuedUnauthenticatedCustomInfo:v55];
          }
        }
        else
        {
          [(AFCredentialManager *)self setLaContext:0];
          v58[2](v58, 1, 0);
        }
      }
      else
      {
        v58[2](v58, 1, 0);
      }
    }
    else
    {
      (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
    }
  }
}

void __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  if (a2 && *(unsigned char *)(a1 + 64))
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    id v6 = [*(id *)(a1 + 40) objectForKey:@"Passkey"];
    [v5 userSelectedPasskey:v6 authenticatedLAContext:v7];
  }
  [*(id *)(a1 + 32) _consumeOneTimeCodeAutoFillSuggestionIfNeeded:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke_165(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queuedUnauthenticatedCustomInfo];

  if (v4)
  {
    if (v3 && *(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = [*(id *)(a1 + 32) queuedUnauthenticatedCustomInfo];
      [*(id *)(a1 + 32) setQueuedCustomInfo:v5];
    }
    [*(id *)(a1 + 32) setQueuedUnauthenticatedCustomInfo:0];
  }
  id v6 = [*(id *)(a1 + 32) laContext];
  if (!*(unsigned char *)(a1 + 48))
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke_2;
    v7[3] = &unk_265247E00;
    id v10 = *(id *)(a1 + 40);
    id v8 = v3;
    id v9 = v6;
    AFDispatchAsync(MEMORY[0x263EF83A0], v7);
  }
  [*(id *)(a1 + 32) setLaContext:0];
}

uint64_t __89__AFCredentialManager_shouldAcceptAutoFill_withPayload_documentTraits_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, BOOL, void))(a1[6] + 16))(a1[6], a1[4] != 0, a1[5]);
}

- (void)oneTimeCodeProviderReceivedCode:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:@"com.apple.AutoFillCore.AFOneTimeCodeSuggestionsDidChangeNotification" object:0];
}

- (NSDictionary)queuedCustomInfo
{
  return self->_queuedCustomInfo;
}

- (void)setQueuedCustomInfo:(id)a3
{
}

- (NSDictionary)queuedUnauthenticatedCustomInfo
{
  return self->_queuedUnauthenticatedCustomInfo;
}

- (void)setQueuedUnauthenticatedCustomInfo:(id)a3
{
}

- (LAContext)laContext
{
  return self->_laContext;
}

- (void)setLaContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laContext, 0);
  objc_storeStrong((id *)&self->_queuedUnauthenticatedCustomInfo, 0);
  objc_storeStrong((id *)&self->_queuedCustomInfo, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeProvider, 0);
  objc_storeStrong((id *)&self->_passkeyProvider, 0);
}

- (void)obtainApplicationIdentifierFromConnection:(uint64_t *)a1 .cold.1(uint64_t *a1)
{
  uint64_t v8 = *a1;
  uint64_t v1 = [NSString stringWithFormat:@"%s Cannot obtain application identifier: %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager obtainApplicationIdentifierFromConnection:]", v8, v9);
}

- (void)hasAutoFillContextEntitlementForConnection:(uint64_t *)a1 .cold.1(uint64_t *a1)
{
  uint64_t v8 = *a1;
  uint64_t v1 = [NSString stringWithFormat:@"%s Cannot obtain AutoFill context: %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager hasAutoFillContextEntitlementForConnection:]", v8, v9);
}

- (void)_suggestionForPasswordCredential:(uint64_t)a1 autoFillPayload:customInfoType:.cold.1(uint64_t a1)
{
  uint64_t v1 = [NSString stringWithFormat:@"%s invalid localized format for key SAFARI_CREDENTIAL_DATE: %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager _suggestionForPasswordCredential:autoFillPayload:customInfoType:]", a1, v9);
}

- (void)_suggestionForPasskey:(uint64_t)a1 autoFillPayload:customInfoType:.cold.1(uint64_t a1)
{
  uint64_t v1 = [NSString stringWithFormat:@"%s invalid localized format for key SAFARI_PASSKEY_SITE_SHORT: %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager _suggestionForPasskey:autoFillPayload:customInfoType:]", a1, v9);
}

- (void)generateHideMyEmailAutoFillWithRenderTraits:completionHandler:.cold.1()
{
  v0 = [NSString stringWithFormat:@"%s documentTraits one or both of bundleId and appId not set properly"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailAutoFillWithRenderTraits:completionHandler:]", v7, v8);
}

- (void)generateHideMyEmailAutoFillWithRenderTraits:completionHandler:.cold.2()
{
  v0 = [NSString stringWithFormat:@"%s documentTraits is nil"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailAutoFillWithRenderTraits:completionHandler:]", v7, v8);
}

- (void)generateHideMyEmailSuggestionWithApplicationBundleId:(void *)a1 applicationId:(uint8_t *)buf completionHandler:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_248A7F000, log, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_2_cold_1()
{
  v0 = [NSString stringWithFormat:@"%s Timeout before handler completed"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke_2", v7, v8);
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_102_cold_1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s HME: feature is available for user", "-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke");
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_248A7F000, a1, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_102_cold_2()
{
  v0 = [NSString stringWithFormat:@"%s HME: feature is unavailable for user"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke", v7, v8);
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_102_cold_3(uint64_t a1)
{
  int v1 = [NSString stringWithFormat:@"%s HME: %@ on requestFeatureWithId:completion: HideMyEmail"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke", a1, v9);
}

void __108__AFCredentialManager_generateHideMyEmailSuggestionWithApplicationBundleId_applicationId_completionHandler___block_invoke_116_cold_1()
{
  v0 = [NSString stringWithFormat:@"%s Timeout before Hide My Email completed"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v1, v2, "%@", v3, v4, v5, v6, (uint64_t)"-[AFCredentialManager generateHideMyEmailSuggestionWithApplicationBundleId:applicationId:completionHandler:]_block_invoke", v7, v8);
}

- (void)shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:.cold.1()
{
}

- (void)shouldAcceptAutoFill:(uint64_t)a1 withPayload:documentTraits:completionHandler:.cold.2(uint64_t a1)
{
  int v1 = [NSString stringWithFormat:@"%s invalid localized format for key AUTOFILL_AUTH_PASSCODE_TITLE: %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]", a1, v9);
}

- (void)shouldAcceptAutoFill:(uint64_t)a1 withPayload:documentTraits:completionHandler:.cold.3(uint64_t a1)
{
  int v1 = [NSString stringWithFormat:@"%s invalid localized format for key TOTP_AUTOFILL_AUTH_PASSCODE_TITLE: %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]", a1, v9);
}

- (void)shouldAcceptAutoFill:(uint64_t)a1 withPayload:documentTraits:completionHandler:.cold.4(uint64_t a1)
{
  int v1 = [NSString stringWithFormat:@"%s invalid localized format for key PASSKEY_AUTOFILL_AUTH_PASSCODE_TITLE: %@"];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_248A7F000, v2, v3, "%@", v4, v5, v6, v7, (uint64_t)"-[AFCredentialManager shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:]", a1, v9);
}

- (void)shouldAcceptAutoFill:withPayload:documentTraits:completionHandler:.cold.5()
{
}

@end
@interface AKFidoAuthorizationController
+ (BOOL)isFidoUserCancelError:(id)a3;
- (AKFidoContext)context;
- (AKFidoUIProvider)uiProvider;
- (ASAuthorizationController)_authController;
- (id)_authRequestFromContext:(id)a3;
- (id)_requestFromContext:(id)a3;
- (id)authCompletion;
- (id)registrationCompletion;
- (void)_populateCustomStringsFromContext:(id)a3;
- (void)_startAuthControllerWithRequest:(id)a3 context:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4;
- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4;
- (void)performAuthenticationRequestWithContext:(id)a3 completion:(id)a4;
- (void)performRegistrationRequestWithContext:(id)a3 completion:(id)a4;
- (void)setAuthCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)setRegistrationCompletion:(id)a3;
- (void)setUiProvider:(id)a3;
- (void)set_authController:(id)a3;
@end

@implementation AKFidoAuthorizationController

- (void)performRegistrationRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AKFidoAuthorizationController *)self setContext:v7];
  id v10 = [(AKFidoAuthorizationController *)self _requestFromContext:v7];
  v8 = (void *)MEMORY[0x1996FE880](v6);

  id registrationCompletion = self->_registrationCompletion;
  self->_id registrationCompletion = v8;

  [(AKFidoAuthorizationController *)self _startAuthControllerWithRequest:v10 context:v7];
}

- (void)performAuthenticationRequestWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AKFidoAuthorizationController *)self setContext:v7];
  id v10 = [(AKFidoAuthorizationController *)self _authRequestFromContext:v7];
  v8 = (void *)MEMORY[0x1996FE880](v6);

  id authCompletion = self->_authCompletion;
  self->_id authCompletion = v8;

  [(AKFidoAuthorizationController *)self _startAuthControllerWithRequest:v10 context:v7];
}

- (void)_startAuthControllerWithRequest:(id)a3 context:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  ASAuthorizationControllerClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationControllerClass) {
    ASAuthorizationControllerClass = (objc_class *)getASAuthorizationControllerClass();
  }
  id v9 = [ASAuthorizationControllerClass alloc];
  v17[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v11 = (void *)[v9 initWithAuthorizationRequests:v10];
  [(AKFidoAuthorizationController *)self set_authController:v11];

  uint64_t v12 = [(AKFidoAuthorizationController *)self _authController];
  [(id)v12 setDelegate:self];

  [(AKFidoAuthorizationController *)self _populateCustomStringsFromContext:v6];
  v13 = [(AKFidoAuthorizationController *)self uiProvider];
  LOBYTE(v12) = objc_opt_respondsToSelector();

  if (v12)
  {
    v14 = [(AKFidoAuthorizationController *)self uiProvider];
    v15 = [(AKFidoAuthorizationController *)self _authController];
    [v15 setPresentationContextProvider:v14];
  }
  v16 = [(AKFidoAuthorizationController *)self _authController];
  [v16 performRequests];
}

- (id)_requestFromContext:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass) {
    ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass = (objc_class *)getASAuthorizationSecurityKeyPublicKeyCredentialProviderClass();
  }
  id v5 = [ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass alloc];
  id v6 = [v3 relyingPartyIdentifier];
  id v7 = (void *)[v5 initWithRelyingPartyIdentifier:v6];

  v8 = [v3 challenge];
  id v9 = [v3 displayName];
  id v10 = [v3 credentialName];
  v11 = [v3 userIdentifier];
  uint64_t v12 = [v7 createCredentialRegistrationRequestWithChallenge:v8 displayName:v9 name:v10 userID:v11];

  v13 = [v3 credentials];
  if ([v13 count])
  {
    v14 = [v3 credentials];
    v15 = [v14 firstObject];
    uint64_t v16 = [v15 length];

    if (v16)
    {
      v17 = _AKLogFido();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[AKFidoAuthorizationController _requestFromContext:](v3);
      }

      v18 = [v3 credentials];
      v19 = objc_msgSend(v18, "aaf_map:", &__block_literal_global_6);

      [v12 setExcludedCredentials:v19];
    }
  }
  else
  {
  }
  ASAuthorizationPublicKeyCredentialParametersClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationPublicKeyCredentialParametersClass) {
    ASAuthorizationPublicKeyCredentialParametersClass = (objc_class *)getASAuthorizationPublicKeyCredentialParametersClass();
  }
  v21 = (void *)[[ASAuthorizationPublicKeyCredentialParametersClass alloc] initWithAlgorithm:-7];
  v26[0] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v12 setCredentialParameters:v22];

  if (AuthenticationServicesLibraryCore())
  {
    v23 = getASAuthorizationPublicKeyCredentialResidentKeyPreferencePreferred();
    [v12 setResidentKeyPreference:v23];
  }
  else
  {
    [v12 setResidentKeyPreference:0];
  }
  if (AuthenticationServicesLibraryCore())
  {
    v24 = getASAuthorizationPublicKeyCredentialAttestationKindDirect();
    [v12 setAttestationPreference:v24];
  }
  else
  {
    [v12 setAttestationPreference:0];
  }

  return v12;
}

id __53__AKFidoAuthorizationController__requestFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AKLogFido();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_3();
  }

  v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ak_dataWithBase64UrlEncodedString:", v2);
  if (![v4 length])
  {
    id v5 = _AKLogFido();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_2();
    }

    uint64_t v6 = [v2 dataUsingEncoding:4];

    v4 = (void *)v6;
  }
  id v7 = _AKLogFido();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_1(v4);
  }

  ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass) {
    ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass = (objc_class *)getASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass();
  }
  id v9 = [ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass alloc];
  id v10 = _ASAuthorizationAllSupportedPublicKeyCredentialDescriptorTransports();
  v11 = (void *)[v9 initWithCredentialID:v4 transports:v10];

  return v11;
}

- (id)_authRequestFromContext:(id)a3
{
  id v3 = a3;
  ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass) {
    ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass = (objc_class *)getASAuthorizationSecurityKeyPublicKeyCredentialProviderClass();
  }
  id v5 = [ASAuthorizationSecurityKeyPublicKeyCredentialProviderClass alloc];
  uint64_t v6 = [v3 relyingPartyIdentifier];
  id v7 = (void *)[v5 initWithRelyingPartyIdentifier:v6];

  v8 = [v3 challenge];
  id v9 = [v7 createCredentialAssertionRequestWithChallenge:v8];

  id v10 = [v3 credentials];
  if ([v10 count])
  {
    v11 = [v3 credentials];
    uint64_t v12 = [v11 firstObject];
    uint64_t v13 = [v12 length];

    if (!v13) {
      goto LABEL_7;
    }
    v14 = [v3 credentials];
    id v10 = objc_msgSend(v14, "aaf_map:", &__block_literal_global_22);

    [v9 setAllowedCredentials:v10];
  }

LABEL_7:

  return v9;
}

id __57__AKFidoAuthorizationController__authRequestFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AKLogFido();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_3();
  }

  v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ak_dataWithBase64UrlEncodedString:", v2);
  if (![v4 length])
  {
    id v5 = _AKLogFido();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_2();
    }

    uint64_t v6 = [v2 dataUsingEncoding:4];

    v4 = (void *)v6;
  }
  id v7 = _AKLogFido();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_1(v4);
  }

  ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass) {
    ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass = (objc_class *)getASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass();
  }
  id v9 = [ASAuthorizationSecurityKeyPublicKeyCredentialDescriptorClass alloc];
  id v10 = _ASAuthorizationAllSupportedPublicKeyCredentialDescriptorTransports();
  v11 = (void *)[v9 initWithCredentialID:v4 transports:v10];

  return v11;
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 credential];
  if (AuthenticationServicesLibraryCore()) {
    getASAuthorizationSecurityKeyPublicKeyCredentialRegistrationClass();
  }
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = _AKLogFido();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[AKFidoAuthorizationController authorizationController:didCompleteWithAuthorization:](v8);
    }

    id v9 = [v5 credential];
    id v10 = _AKLogFido();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[AKFidoAuthorizationController authorizationController:didCompleteWithAuthorization:](v9);
    }

    v11 = [(AKFidoAuthorizationController *)self registrationCompletion];

    if (!v11) {
      goto LABEL_20;
    }
    id v47 = v5;
    v42 = [AKFidoRegistrationResponse alloc];
    v44 = [(AKFidoAuthorizationController *)self context];
    v41 = [v44 originalChallenge];
    uint64_t v12 = [v9 rawAttestationObject];
    uint64_t v13 = [v9 credentialID];
    v46 = v9;
    v14 = [v9 rawClientDataJSON];
    v43 = [(AKFidoAuthorizationController *)self context];
    v15 = [v43 relyingPartyIdentifier];
    uint64_t v16 = [(AKFidoAuthorizationController *)self context];
    v17 = [v16 credentialName];
    v18 = [(AKFidoAuthorizationController *)self context];
    v19 = [v18 userIdentifier];
    v20 = [(AKFidoRegistrationResponse *)v42 initWithChallengeString:v41 attestationsData:v12 credentialID:v13 clientData:v14 relyingPartyIdentifier:v15 credentialName:v17 userIdentifier:v19];

    v21 = [(AKFidoAuthorizationController *)self registrationCompletion];
    ((void (**)(void, AKFidoRegistrationResponse *, void))v21)[2](v21, v20, 0);

    [(AKFidoAuthorizationController *)self setRegistrationCompletion:0];
LABEL_19:

    id v9 = v46;
    id v5 = v47;
LABEL_20:
    context = self->_context;
    self->_context = 0;

    goto LABEL_21;
  }
  v22 = [v5 credential];
  if (AuthenticationServicesLibraryCore()) {
    getASAuthorizationSecurityKeyPublicKeyCredentialAssertionClass();
  }
  char v23 = objc_opt_isKindOfClass();

  if (v23)
  {
    v24 = _AKLogFido();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[AKFidoAuthorizationController authorizationController:didCompleteWithAuthorization:].cold.4(v24);
    }

    id v9 = [v5 credential];
    v25 = _AKLogFido();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[AKFidoAuthorizationController authorizationController:didCompleteWithAuthorization:](v9);
    }

    v26 = [(AKFidoAuthorizationController *)self authCompletion];

    if (!v26) {
      goto LABEL_20;
    }
    id v47 = v5;
    v27 = [AKFidoAuthenticationResponse alloc];
    uint64_t v28 = [v9 rawAuthenticatorData];
    v45 = [(AKFidoAuthorizationController *)self context];
    v29 = [v45 originalChallenge];
    v30 = [(AKFidoAuthorizationController *)self context];
    v31 = [v30 relyingPartyIdentifier];
    [v9 signature];
    v33 = v32 = v9;
    v34 = [v32 rawClientDataJSON];
    v35 = [v32 credentialID];
    v46 = v32;
    v36 = [v32 userID];
    v37 = v27;
    v38 = (void *)v28;
    v20 = [(AKFidoAuthenticationResponse *)v37 initWithAuthenticatorData:v28 challengeString:v29 relyingPartyIdentifier:v31 signature:v33 clientData:v34 credentialID:v35 userIdentifier:v36];

    v39 = [(AKFidoAuthorizationController *)self authCompletion];
    ((void (**)(void, AKFidoRegistrationResponse *, void))v39)[2](v39, v20, 0);

    [(AKFidoAuthorizationController *)self setAuthCompletion:0];
    goto LABEL_19;
  }
LABEL_21:
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = _AKLogFido();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[AKFidoAuthorizationController authorizationController:didCompleteWithError:]();
  }

  id v7 = [(AKFidoAuthorizationController *)self registrationCompletion];

  if (v7)
  {
    v8 = [(AKFidoAuthorizationController *)self registrationCompletion];
    ((void (**)(void, void, id))v8)[2](v8, 0, v5);

    [(AKFidoAuthorizationController *)self setRegistrationCompletion:0];
  }
  id v9 = [(AKFidoAuthorizationController *)self authCompletion];

  if (v9)
  {
    id v10 = [(AKFidoAuthorizationController *)self authCompletion];
    ((void (**)(void, void, id))v10)[2](v10, 0, v5);

    [(AKFidoAuthorizationController *)self setAuthCompletion:0];
  }
  context = self->_context;
  self->_context = 0;
}

+ (BOOL)isFidoUserCancelError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  uint64_t v5 = AuthenticationServicesLibraryCore();
  if (v5)
  {
    uint64_t v6 = getASAuthorizationErrorDomain();
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (![v4 isEqualToString:v6])
  {
    BOOL v7 = 0;
    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v7 = [v3 code] == 1001;
  if (v5) {
LABEL_8:
  }

LABEL_9:
  v8 = _AKLogFido();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[AKFidoAuthorizationController isFidoUserCancelError:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  return v7;
}

- (void)_populateCustomStringsFromContext:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _AKLogFido();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AKFidoAuthorizationController _populateCustomStringsFromContext:](v4);
  }

  uint64_t v6 = [v4 promptHeader];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = [v4 promptHeader];
    uint64_t v9 = [(AKFidoAuthorizationController *)self _authController];
    [v9 setProxySheetHeaderOverride:v8];
  }
  uint64_t v10 = [v4 promptTitle];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [v4 promptTitle];
    uint64_t v13 = [(AKFidoAuthorizationController *)self _authController];
    [v13 setProxySheetTitleOverride:v12];
  }
  uint64_t v14 = [v4 promptBody];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    uint64_t v16 = [v4 promptBody];
    v17 = [(AKFidoAuthorizationController *)self _authController];
    [v17 setProxySheetSubtitleOverride:v16];
  }
  uint64_t v18 = [v4 useAlternativeKeysIcon];
  v19 = [(AKFidoAuthorizationController *)self _authController];
  [v19 setUseAlternativeSecurityKeysIcon:v18];

  v20 = [v4 relyingPartyIdentifier];
  v25[0] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v22 = [(AKFidoAuthorizationController *)self _authController];
  [v22 setProxiedAssociatedDomains:v21];

  char v23 = [v4 incorrectKeyPresentedMessage];
  v24 = [(AKFidoAuthorizationController *)self _authController];
  [v24 setProxySheetNoCredentialsErrorMessageOverride:v23];
}

- (AKFidoUIProvider)uiProvider
{
  return self->_uiProvider;
}

- (void)setUiProvider:(id)a3
{
}

- (id)registrationCompletion
{
  return self->_registrationCompletion;
}

- (void)setRegistrationCompletion:(id)a3
{
}

- (id)authCompletion
{
  return self->_authCompletion;
}

- (void)setAuthCompletion:(id)a3
{
}

- (ASAuthorizationController)_authController
{
  return self->__authController;
}

- (void)set_authController:(id)a3
{
}

- (AKFidoContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->__authController, 0);
  objc_storeStrong(&self->_authCompletion, 0);
  objc_storeStrong(&self->_registrationCompletion, 0);

  objc_storeStrong((id *)&self->_uiProvider, 0);
}

- (void)_requestFromContext:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 credentials];
  [v1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_193494000, v2, v3, "Adding %lu credentials to the excluded credentials list.", v4, v5, v6, v7, v8);
}

void __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_1(void *a1)
{
  v1 = [a1 base64EncodedStringWithOptions:0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_193494000, v2, v3, "Adding credential to the list: %@", v4, v5, v6, v7, v8);
}

void __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Invalid credential was sent: %@", v2, v3, v4, v5, v6);
}

void __53__AKFidoAuthorizationController__requestFromContext___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_193494000, v0, v1, "Converting credential to base64: %@", v2, v3, v4, v5, v6);
}

- (void)authorizationController:(void *)a1 didCompleteWithAuthorization:.cold.1(void *a1)
{
  uint64_t v2 = [a1 credentialID];
  uint64_t v3 = [a1 rawAttestationObject];
  uint64_t v4 = [a1 rawClientDataJSON];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_1(&dword_193494000, v5, v6, "Fido registration CredentialID: %@\nAttestation Data: %@\nClientData: %@", v7, v8, v9, v10, v11);
}

- (void)authorizationController:(os_log_t)log didCompleteWithAuthorization:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Fido registration was a success", v1, 2u);
}

- (void)authorizationController:(void *)a1 didCompleteWithAuthorization:.cold.3(void *a1)
{
  uint64_t v2 = [a1 signature];
  uint64_t v3 = [a1 rawAuthenticatorData];
  uint64_t v4 = [a1 userID];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_5_1(&dword_193494000, v5, v6, "Fido authentication Signature: %@\nAuthenticator Data: %@\nUserID: %@", v7, v8, v9, v10, v11);
}

- (void)authorizationController:(os_log_t)log didCompleteWithAuthorization:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Fido authentication was a success", v1, 2u);
}

- (void)authorizationController:didCompleteWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "Unable to complete the Fido interaction: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)isFidoUserCancelError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_populateCustomStringsFromContext:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_193494000, v2, v3, "Populating strings from context: %@", v4, v5, v6, v7, v8);
}

@end
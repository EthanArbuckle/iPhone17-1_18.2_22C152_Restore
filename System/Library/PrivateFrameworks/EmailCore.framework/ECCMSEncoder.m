@interface ECCMSEncoder
+ (NSOrderedSet)oidStringsForAuthenticatedEncryption;
+ (NSString)oidStringForEncryptedSubject;
+ (id)_recipientInfoForCertificate:(void *)a3 andCapabilities:;
+ (id)_recipientInfosForRecipients:(void *)a3 outError:;
+ (id)_signedDataFromNetworkContentData:(unsigned int)a3 detached:(uint64_t)a4 forSender:(uint64_t)a5 identity:(uint64_t)a6 encryptionCertificate:(void *)a7 capabilities:(void *)a8 outError:;
+ (id)encryptedDataFromContentData:(id)a3 senderCertificate:(__SecCertificate *)a4 senderCapabilities:(id)a5 recipients:(id)a6 outIsAuthenticated:(BOOL *)a7 outError:(id *)a8;
+ (id)oidsForEncryptWithGCM:(BOOL)a3 encryptSubject:(BOOL)a4;
+ (id)signatureDataFromNetworkContentData:(id)a3 forSender:(id)a4 identity:(__SecIdentity *)a5 encryptionCertificate:(__SecCertificate *)a6 capabilities:(id)a7 outError:(id *)a8;
+ (id)signedDataFromNetworkContentData:(id)a3 forSender:(id)a4 identity:(__SecIdentity *)a5 encryptionCertificate:(__SecCertificate *)a6 capabilities:(id)a7 outError:(id *)a8;
+ (uint64_t)_capabilitiesContainCapabilityRequiringAuthEnvelopedData:(uint64_t)a1;
@end

@implementation ECCMSEncoder

uint64_t ___ef_log_ECCMSEncoder_block_invoke()
{
  _ef_log_ECCMSEncoder_log = (uint64_t)os_log_create("com.apple.email", "ECCMSEncoder");
  return MEMORY[0x1F41817F8]();
}

+ (id)signatureDataFromNetworkContentData:(id)a3 forSender:(id)a4 identity:(__SecIdentity *)a5 encryptionCertificate:(__SecCertificate *)a6 capabilities:(id)a7 outError:(id *)a8
{
  v8 = +[ECCMSEncoder _signedDataFromNetworkContentData:detached:forSender:identity:encryptionCertificate:capabilities:outError:]((uint64_t)a1, a3, 1u, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  return v8;
}

+ (id)_signedDataFromNetworkContentData:(unsigned int)a3 detached:(uint64_t)a4 forSender:(uint64_t)a5 identity:(uint64_t)a6 encryptionCertificate:(void *)a7 capabilities:(void *)a8 outError:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  id v32 = a7;
  self;
  v33 = [MEMORY[0x1E4F77E08] OIDWithString:*MEMORY[0x1E4F77D88] error:a8];
  if (a8 && *a8)
  {
    v13 = 0;
  }
  else
  {
    unsigned int v30 = a3;
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F77DF0]) initWithIdentity:a5 signatureAlgorithm:v33 error:a8];
    if (a8 && *a8)
    {
      v13 = 0;
    }
    else
    {
      if ([v32 count])
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v16 = v32;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v35 != v18) {
                objc_enumerationMutation(v16);
              }
              v20 = (void *)[objc_alloc(MEMORY[0x1E4F77E08]) initWithString:*(void *)(*((void *)&v34 + 1) + 8 * i) error:a8];
              if (v20) {
                [v15 addObject:v20];
              }
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v17);
        }

        v21 = (void *)[objc_alloc(MEMORY[0x1E4F77DE0]) initWithCapabilities:v15];
        [v14 addSMIMECapabilitiesAttribute:v21];
      }
      id v22 = objc_alloc(MEMORY[0x1E4F77DF8]);
      v23 = [MEMORY[0x1E4F1C9C8] date];
      v24 = (void *)[v22 initWithSigningTime:v23];

      v25 = [v14 protectedAttributes];
      [v25 addObject:v24];

      if (a6)
      {
        v26 = (void *)[objc_alloc(MEMORY[0x1E4F77DC8]) initWithCertificate:a6];
        [v14 addSMIMEEncryptionKeyPreferenceAttribute:v26];
      }
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F77DE8]) initWithDataContent:v31 isDetached:v30 signer:v14 error:a8];
      if (!v27 || a8 && *a8)
      {
        v13 = 0;
      }
      else
      {
        v28 = (void *)[objc_alloc(MEMORY[0x1E4F77DC0]) initWithEmbeddedContent:v27];
        v13 = [v28 encodeMessageSecurityObject:a8];
      }
    }
  }
  return v13;
}

+ (id)signedDataFromNetworkContentData:(id)a3 forSender:(id)a4 identity:(__SecIdentity *)a5 encryptionCertificate:(__SecCertificate *)a6 capabilities:(id)a7 outError:(id *)a8
{
  v8 = +[ECCMSEncoder _signedDataFromNetworkContentData:detached:forSender:identity:encryptionCertificate:capabilities:outError:]((uint64_t)a1, a3, 0, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  return v8;
}

+ (id)encryptedDataFromContentData:(id)a3 senderCertificate:(__SecCertificate *)a4 senderCapabilities:(id)a5 recipients:(id)a6 outIsAuthenticated:(BOOL *)a7 outError:(id *)a8
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v39 = a5;
  id v40 = a6;
  v41 = +[ECCMSEncoder _recipientInfoForCertificate:andCapabilities:]((uint64_t)a1, (uint64_t)a4, v39);
  id v49 = 0;
  long long v37 = +[ECCMSEncoder _recipientInfosForRecipients:outError:]((uint64_t)a1, v40, &v49);
  id v42 = v49;
  if (v42)
  {
    _ef_log_ECCMSEncoder();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend(v42, "ef_publicDescription");
      +[ECCMSEncoder encryptedDataFromContentData:senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:](v15, (uint64_t)v51, v14);
    }
  }
  int v16 = +[ECCMSEncoder _capabilitiesContainCapabilityRequiringAuthEnvelopedData:]((uint64_t)a1, v39);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __121__ECCMSEncoder_encryptedDataFromContentData_senderCertificate_senderCapabilities_recipients_outIsAuthenticated_outError___block_invoke;
  v48[3] = &__block_descriptor_40_e24_B16__0__ECCMSRecipient_8l;
  v48[4] = a1;
  int v17 = v16 & objc_msgSend(v40, "ef_all:", v48);
  uint64_t v18 = (Class *)0x1E4F77DB8;
  if (!v17) {
    uint64_t v18 = (Class *)0x1E4F77DD0;
  }
  v19 = (void *)[objc_alloc(*v18) initWithDataContent:v38 recipient:v41];
  BOOL v34 = v17;
  long long v35 = a7;
  long long v36 = a8;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v20 = v37;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v19 addRecipient:v24];
        }
        else if (objc_opt_respondsToSelector())
        {
          [v19 addRecipientWithRecipient:v24];
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v21);
  }

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F77DC0]) initWithEmbeddedContent:v19];
  v26 = v25;
  if (v25)
  {
    id v43 = v42;
    v27 = [v25 encodeMessageSecurityObject:&v43];
    id v28 = v43;

    if (v27)
    {
      if (v35) {
        *long long v35 = v34;
      }
      if (v36) {
        *long long v36 = 0;
      }
      id v29 = v27;
    }
    else
    {
      id v31 = _ef_log_ECCMSEncoder();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        +[ECCMSEncoder encryptedDataFromContentData:senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:](v31);
      }

      if (v36)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        objc_msgSend(v32, "ef_initWithDomain:code:underlyingError:", @"ECCMSErrorDomain", 6, v28);
        *long long v36 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

    id v42 = v28;
  }
  else
  {
    unsigned int v30 = _ef_log_ECCMSEncoder();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      +[ECCMSEncoder encryptedDataFromContentData:senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:](v30);
    }

    v27 = 0;
    if (v36) {
      *long long v36 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ECCMSErrorDomain" code:5 userInfo:0];
    }
  }

  return v27;
}

+ (id)_recipientInfoForCertificate:(void *)a3 andCapabilities:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  self;
  uint64_t v18 = a2;
  if (v20)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v20, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v20;
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v22 = 0;
          v9 = objc_msgSend(MEMORY[0x1E4F77E08], "OIDWithString:error:", v8, &v22, v18);
          id v10 = v22;
          if (v9)
          {
            [v4 addObject:v9];
          }
          else
          {
            _ef_log_ECCMSEncoder();
            v11 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v12 = objc_msgSend(v10, "ef_publicDescription");
              *(_DWORD *)buf = 138543618;
              uint64_t v29 = v8;
              __int16 v30 = 2114;
              id v31 = v12;
              _os_log_error_impl(&dword_1BF11D000, v11, OS_LOG_TYPE_ERROR, "Error for recipient OID %{public}@: %{public}@", buf, 0x16u);
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v5);
    }

    v13 = v4;
  }
  else
  {
    v13 = 0;
  }
  if (objc_msgSend(v13, "count", v18))
  {
    id v14 = objc_alloc(MEMORY[0x1E4F77DD8]);
    v27 = v13;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    int v16 = (void *)[v14 initWithCertificate:v19 algorithmCapabilities:v15];
  }
  else
  {
    int v16 = (void *)[objc_alloc(MEMORY[0x1E4F77DD8]) initWithCertificate:v19];
  }

  return v16;
}

+ (id)_recipientInfosForRecipients:(void *)a3 outError:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v5 = self;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __54__ECCMSEncoder__recipientInfosForRecipients_outError___block_invoke;
  int v16 = &unk_1E63EE2F8;
  uint64_t v18 = v5;
  id v7 = v6;
  id v17 = v7;
  uint64_t v8 = objc_msgSend(v4, "ef_compactMap:", &v13);
  if (objc_msgSend(v7, "count", v13, v14, v15, v16))
  {
    _ef_log_ECCMSEncoder();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[ECCMSEncoder _recipientInfosForRecipients:outError:]((uint64_t)v21, [v7 count], v9);
    }

    if (a3)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v19 = @"ECCMS_Recipient";
      id v20 = v7;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      *a3 = (id)[v10 initWithDomain:@"ECCMSErrorDomain" code:3 userInfo:v11];
    }
  }

  return v8;
}

+ (uint64_t)_capabilitiesContainCapabilityRequiringAuthEnvelopedData:(uint64_t)a1
{
  id v2 = a2;
  v3 = [self oidStringsForAuthenticatedEncryption];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__ECCMSEncoder__capabilitiesContainCapabilityRequiringAuthEnvelopedData___block_invoke;
  v7[3] = &unk_1E63EE2D0;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = objc_msgSend(v2, "ef_any:", v7);

  return v5;
}

uint64_t __121__ECCMSEncoder_encryptedDataFromContentData_senderCertificate_senderCapabilities_recipients_outIsAuthenticated_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [a2 capabilities];
  uint64_t v4 = +[ECCMSEncoder _capabilitiesContainCapabilityRequiringAuthEnvelopedData:](v2, v3);

  return v4;
}

uint64_t __73__ECCMSEncoder__capabilitiesContainCapabilityRequiringAuthEnvelopedData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

id __54__ECCMSEncoder__recipientInfosForRecipients_outError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (__SecCertificate *)[v3 certificate];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [v3 capabilities];
  id v7 = +[ECCMSEncoder _recipientInfoForCertificate:andCapabilities:](v5, (uint64_t)v4, v6);

  if (!v7)
  {
    CFStringRef commonName = 0;
    SecCertificateCopyCommonName(v4, &commonName);
    id v8 = (__CFString *)commonName;
    _ef_log_ECCMSEncoder();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(__CFString *)v8 emailAddressValue];
      __54__ECCMSEncoder__recipientInfosForRecipients_outError___block_invoke_cold_1(v10, (uint64_t)v13, v9);
    }

    [*(id *)(a1 + 32) addObject:v4];
  }

  return v7;
}

+ (NSString)oidStringForEncryptedSubject
{
  return (NSString *)(id)*MEMORY[0x1E4F77CF8];
}

+ (NSOrderedSet)oidStringsForAuthenticatedEncryption
{
  if (oidStringsForAuthenticatedEncryption_onceToken != -1) {
    dispatch_once(&oidStringsForAuthenticatedEncryption_onceToken, &__block_literal_global_52);
  }
  uint64_t v2 = (void *)oidStringsForAuthenticatedEncryption_authenticatedEncryptionOIDStrings;
  return (NSOrderedSet *)v2;
}

uint64_t __52__ECCMSEncoder_oidStringsForAuthenticatedEncryption__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  oidStringsForAuthenticatedEncryption_authenticatedEncryptionOIDStrings = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E4F77D80], *MEMORY[0x1E4F77D70], *MEMORY[0x1E4F77D60], *MEMORY[0x1E4F77D78], *MEMORY[0x1E4F77D68], *MEMORY[0x1E4F77D58], 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)oidsForEncryptWithGCM:(BOOL)a3 encryptSubject:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F77DE0]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = objc_msgSend(v6, "capabilities", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) OIDString];
          [v7 addObject:v12];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    if (v4)
    {
      uint64_t v13 = [a1 oidStringForEncryptedSubject];
      [v7 addObject:v13];
    }
    goto LABEL_13;
  }
  if (a4)
  {
    id v6 = [a1 oidStringForEncryptedSubject];
    id v19 = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
LABEL_13:

    goto LABEL_15;
  }
  id v7 = (id)MEMORY[0x1E4F1CBF0];
LABEL_15:
  return v7;
}

+ (void)encryptedDataFromContentData:(os_log_t)log senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "Failed to create content infos", v1, 2u);
}

+ (void)encryptedDataFromContentData:(os_log_t)log senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "Failed to encode content data", v1, 2u);
}

+ (void)encryptedDataFromContentData:(NSObject *)a3 senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1BF11D000, a2, a3, "Failed to create some recipient infos: %{public}@", (uint8_t *)a2);
}

+ (void)_recipientInfosForRecipients:(NSObject *)a3 outError:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_1BF11D000, a2, a3, "Failed to create %lu recipient infos", (uint8_t *)a1);
}

void __54__ECCMSEncoder__recipientInfosForRecipients_outError___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1BF11D000, a2, a3, "Failed to create info for recipient: %{public}@", (uint8_t *)a2);
}

@end
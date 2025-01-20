@interface CDPDAccount
- (BOOL)_iCDPStatusFromNetworkUsing:(_PCSIdentitySetData *)a3 options:(__CFDictionary *)a4 error:(__CFError *)a5;
- (BOOL)hasDisabledKeychainExplicitly;
- (BOOL)isICDPEnabledForDSID:(id)a3 checkWithServer:(BOOL)a4;
- (BOOL)isOTEnabledForContext:(id)a3;
- (CDPContext)context;
- (CDPDAccount)initWithContext:(id)a3;
- (unint64_t)recoveryContactCountForAltDSID:(id)a3;
- (void)hasDisabledKeychainExplicitly;
- (void)setHasDisabledKeychainExplicitly:(BOOL)a3;
@end

@implementation CDPDAccount

- (void).cxx_destruct
{
}

- (CDPDAccount)initWithContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDPDAccount;
  v6 = [(CDPDAccount *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)hasDisabledKeychainExplicitly
{
  v3 = [MEMORY[0x263EFB210] defaultStore];
  v4 = [(CDPDAccount *)self context];
  id v5 = [v4 altDSID];
  v6 = objc_msgSend(v3, "aa_appleAccountWithAltDSID:", v5);

  if (!v6)
  {
    v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPDAccount hasDisabledKeychainExplicitly](self);
    }
  }
  v8 = [v6 accountPropertyForKey:@"userDisabledICK"];
  char v9 = [v8 BOOLValue];

  objc_super v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    [(CDPDAccount *)v9 hasDisabledKeychainExplicitly];
  }

  return v9;
}

- (void)setHasDisabledKeychainExplicitly:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDAccount setHasDisabledKeychainExplicitly:](v3, v5);
  }

  v6 = [MEMORY[0x263EFB210] defaultStore];
  v7 = [(CDPDAccount *)self context];
  v8 = [v7 altDSID];
  char v9 = objc_msgSend(v6, "aa_appleAccountWithAltDSID:", v8);

  if (!v9)
  {
    objc_super v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPDAccount setHasDisabledKeychainExplicitly:](self);
    }
  }
  v11 = [NSNumber numberWithBool:v3];
  [v9 setAccountProperty:v11 forKey:@"userDisabledICK"];

  v12 = [MEMORY[0x263EFB210] defaultStore];
  id v22 = 0;
  char v13 = [v12 saveVerifiedAccount:v9 error:&v22];
  id v14 = v22;

  if ((v13 & 1) == 0)
  {
    v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CDPDAccount setHasDisabledKeychainExplicitly:]((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (BOOL)_iCDPStatusFromNetworkUsing:(_PCSIdentitySetData *)a3 options:(__CFDictionary *)a4 error:(__CFError *)a5
{
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDAccount _iCDPStatusFromNetworkUsing:options:error:](v5);
  }

  return PCSIdentitySetIsICDPNetworkWithOptions();
}

- (BOOL)isICDPEnabledForDSID:(id)a3 checkWithServer:(BOOL)a4
{
  BOOL v4 = a4;
  v30[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    uint64_t v29 = *MEMORY[0x263F621D8];
    v30[0] = v6;
    v8 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    char v9 = (void *)[v8 mutableCopy];

    objc_super v10 = self->_context;
    if (!v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x263F08A30]);
      v12 = [v11 numberFromString:v7];
      objc_super v10 = [MEMORY[0x263F34350] contextForAccountWithDSID:v12];
    }
    CFTypeRef v28 = 0;
    uint64_t v13 = PCSIdentitySetCreate();
    if (v13)
    {
      id v14 = (const void *)v13;
      CFTypeRef cf = 0;
      if (v4)
      {
        if ([MEMORY[0x263F34400] isGuitarfishEnabled]
          && [(CDPContext *)v10 edpState] == 2)
        {
          v15 = _CDPLogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[CDPDAccount isICDPEnabledForDSID:checkWithServer:](v15);
          }

          uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", -[CDPContext edpState](v10, "edpState") == 2);
          [v9 setObject:v16 forKeyedSubscript:*MEMORY[0x263F621E8]];

          char IsICDPNetwork = [(CDPDAccount *)self _iCDPStatusFromNetworkUsing:v14 options:v9 error:cf];
        }
        else
        {
          char IsICDPNetwork = PCSIdentitySetIsICDPNetwork();
        }
      }
      else
      {
        char IsICDPNetwork = PCSIdentitySetIsICDP();
      }
      BOOL v18 = IsICDPNetwork;
      CFRelease(v14);
    }
    else
    {
      uint64_t v19 = _CDPLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CDPDAccount isICDPEnabledForDSID:checkWithServer:]((uint64_t)&v28, v19, v20, v21, v22, v23, v24, v25);
      }

      BOOL v18 = 0;
    }
    if (v28) {
      CFRelease(v28);
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)isOTEnabledForContext:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F34340];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithContext:v4];

  id v16 = 0;
  uint64_t v6 = [v5 cachedCliqueStatus:&v16];
  id v7 = v16;
  if (v7)
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPDAccount isOTEnabledForContext:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  return v6 == 1;
}

- (unint64_t)recoveryContactCountForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F290F0] sharedInstance];
  id v5 = [v4 authKitAccountWithAltDSID:v3];
  if (v5)
  {
    id v13 = v3;
    uint64_t v6 = [v4 custodianInfosForAccount:v5];
    if ([v6 count])
    {
      unint64_t v7 = 0;
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = [v6 objectAtIndexedSubscript:v7];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"status"];
        unsigned int v11 = [v10 isEqualToString:@"APPROVED"];

        v8 += v11;
        ++v7;
      }
      while ([v6 count] > v7);
    }
    else
    {
      unint64_t v8 = 0;
    }

    id v3 = v13;
  }
  else
  {
    unint64_t v8 = -1;
  }

  return v8;
}

- (CDPContext)context
{
  return self->_context;
}

- (void)hasDisabledKeychainExplicitly
{
  v1 = [a1 context];
  v2 = [v1 altDSID];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_218640000, v3, v4, "hasDisabledKeychainExplicitly: Failed to find ACAccount for altDSID: %{mask.hash}@", v5, v6, v7, v8, v9);
}

- (void)setHasDisabledKeychainExplicitly:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setHasDisabledKeychainExplicitly:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 context];
  v2 = [v1 altDSID];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_2_0(&dword_218640000, v3, v4, "setHasDisabledKeychainExplicitly: Failed to find ACAccount for altDSID: %{mask.hash}@", v5, v6, v7, v8, v9);
}

- (void)setHasDisabledKeychainExplicitly:(char)a1 .cold.3(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "User disabled iCloud keychain: %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)_iCDPStatusFromNetworkUsing:(os_log_t)log options:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Calling PCSIdentitySetIsICDPNetworkWithOptions for EDP Eligible accounts...", v1, 2u);
}

- (void)isICDPEnabledForDSID:(uint64_t)a3 checkWithServer:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isICDPEnabledForDSID:(uint64_t)a3 checkWithServer:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isICDPEnabledForDSID:(os_log_t)log checkWithServer:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Adding Guitarfish info to info dictionary...", v1, 2u);
}

- (void)isOTEnabledForContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
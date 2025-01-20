@interface CDPDFollowUpController
+ (id)_identifiersAllowedForTelemetry;
+ (id)sharedInstance;
- (BOOL)_clearFollowUpForContext:(id)a3 error:(id *)a4;
- (BOOL)_isNotAudioAccessory;
- (BOOL)_postFollowUpItem:(id)a3 context:(id)a4 error:(id *)a5;
- (BOOL)clearFollowUpWithContext:(id)a3 error:(id *)a4;
- (BOOL)hasPendingFollowUpWithUniqueIdentifier:(id)a3;
- (BOOL)postFollowUpItemForContext:(id)a3 error:(id *)a4;
- (CDPDFollowUpController)init;
- (CDPDFollowUpFactory)followUpFactory;
- (FLFollowUpController)followUpController;
- (id)_cdpRepairContext:(id)a3;
- (id)_followUpControllerForContext:(id)a3;
- (id)_hasSOSActiveDeviceForAltDSID:(id)a3;
- (id)_makeAAFLFollowUpController;
- (id)_rkMismatchHealingContext:(id)a3;
- (id)_sosCompatibilityModeContext:(id)a3;
- (id)informativeText;
- (void)dealloc;
- (void)securityLevelChangedForAccountContext:(id)a3;
- (void)setFollowUpController:(id)a3;
- (void)setFollowUpFactory:(id)a3;
@end

@implementation CDPDFollowUpController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_instance_0;
  return v2;
}

uint64_t __40__CDPDFollowUpController_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_alloc_init(CDPDFollowUpController);
  return MEMORY[0x270F9A758]();
}

- (CDPDFollowUpController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPDFollowUpController;
  v2 = [(CDPDFollowUpController *)&v6 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.corecdp"];
    [(CDPDFollowUpController *)v2 setFollowUpController:v3];

    v4 = objc_alloc_init(CDPDFollowUpFactory);
    [(CDPDFollowUpController *)v2 setFollowUpFactory:v4];
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CDPDFollowUpController;
  [(CDPDFollowUpController *)&v2 dealloc];
}

- (BOOL)_isNotAudioAccessory
{
  return [MEMORY[0x263F34400] isAudioAccessory] ^ 1;
}

+ (id)_identifiersAllowedForTelemetry
{
  if (_identifiersAllowedForTelemetry_onceToken != -1) {
    dispatch_once(&_identifiersAllowedForTelemetry_onceToken, &__block_literal_global_42);
  }
  objc_super v2 = (void *)_identifiersAllowedForTelemetry_allowlistedFollowUpIdentifiers;
  return v2;
}

uint64_t __57__CDPDFollowUpController__identifiersAllowedForTelemetry__block_invoke()
{
  _identifiersAllowedForTelemetry_allowlistedFollowUpIdentifiers = [MEMORY[0x263EFFA08] setWithArray:&unk_26C9D3148];
  return MEMORY[0x270F9A758]();
}

- (BOOL)_postFollowUpItem:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263F202A8];
  uint64_t v10 = *MEMORY[0x263F34508];
  uint64_t v11 = *MEMORY[0x263F34830];
  id v12 = a4;
  v13 = [v9 analyticsEventWithFollowUpContext:v12 eventName:v10 category:v11];
  v14 = [(CDPDFollowUpController *)self _followUpControllerForContext:v12];

  id v23 = 0;
  uint64_t v15 = [v14 postFollowUpItem:v8 error:&v23];
  id v16 = v23;

  v17 = [NSNumber numberWithBool:v15];
  [v13 setObject:v17 forKeyedSubscript:*MEMORY[0x263F34558]];

  v18 = [(id)objc_opt_class() _identifiersAllowedForTelemetry];
  v19 = [v8 uniqueIdentifier];
  LODWORD(v12) = [v18 containsObject:v19];

  if (v12)
  {
    v20 = [v8 uniqueIdentifier];
    [v13 setObject:v20 forKeyedSubscript:*MEMORY[0x263F34520]];
  }
  else
  {
    v20 = _CDPLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[CDPDFollowUpController _postFollowUpItem:context:error:](v8, v20);
    }
  }

  [v13 populateUnderlyingErrorsStartingWithRootError:v16];
  v21 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
  [v21 sendEvent:v13];

  if (a5) {
    *a5 = v16;
  }

  return v15;
}

- (BOOL)_clearFollowUpForContext:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(CDPDFollowUpFactory *)self->_followUpFactory identifierForContext:v6];
  id v8 = _CDPLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v7;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl(&dword_218640000, v8, OS_LOG_TYPE_DEFAULT, "Clearing a follow up: (%@) - %@", buf, 0x16u);
  }

  if (v7)
  {
    v9 = [MEMORY[0x263F202A8] analyticsEventWithFollowUpContext:v6 eventName:*MEMORY[0x263F34500] category:*MEMORY[0x263F34830]];
    uint64_t v10 = [(CDPDFollowUpController *)self _followUpControllerForContext:v6];
    v20 = v7;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    id v19 = 0;
    uint64_t v12 = [v10 clearPendingFollowUpItemsWithUniqueIdentifiers:v11 error:&v19];
    id v13 = v19;

    if (a4) {
      *a4 = v13;
    }
    v14 = [NSNumber numberWithBool:v12];
    [v9 setObject:v14 forKeyedSubscript:*MEMORY[0x263F34558]];

    uint64_t v15 = [(id)objc_opt_class() _identifiersAllowedForTelemetry];
    LODWORD(v14) = [v15 containsObject:v7];

    if (v14)
    {
      [v9 setObject:v7 forKeyedSubscript:*MEMORY[0x263F34520]];
    }
    else
    {
      id v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[CDPDFollowUpController _clearFollowUpForContext:error:]();
      }
    }
    [v9 populateUnderlyingErrorsStartingWithRootError:v13];
    v17 = [MEMORY[0x263F34338] rtcAnalyticsReporter];
    [v17 sendEvent:v9];
  }
  else if (a4)
  {
    _CDPStateError();
    LOBYTE(v12) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)postFollowUpItemForContext:(id)a3 error:(id *)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![MEMORY[0x263F34400] hasFullCDPSupport]
    || ![(CDPDFollowUpController *)self _isNotAudioAccessory])
  {
    v9 = _CDPLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v9, OS_LOG_TYPE_DEFAULT, "posting followup is not supported in current configuration", buf, 2u);
    }
    goto LABEL_13;
  }
  v7 = _CDPLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v94 = v6;
    _os_log_impl(&dword_218640000, v7, OS_LOG_TYPE_DEFAULT, "Processing request for context: %@", buf, 0xCu);
  }

  id v8 = [(CDPDFollowUpController *)self followUpFactory];
  v9 = [v8 followUpItemWithContext:v6];

  if (!v9)
  {
    if (a4)
    {
      _CDPStateError();
      BOOL v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v16 = 0;
    }
    goto LABEL_73;
  }
  uint64_t v10 = [v6 followUpType];
  if ([v10 isEqualToString:*MEMORY[0x263F342D8]])
  {
    uint64_t v11 = [MEMORY[0x263F343A8] sharedInstance];
    char v12 = [v11 hasLocalSecret];

    if ((v12 & 1) == 0)
    {
      id v13 = _CDPLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.7();
      }

      goto LABEL_13;
    }
  }
  else
  {
  }
  if ([MEMORY[0x263F34400] isInternalBuild])
  {
    v17 = [(CDPDFollowUpController *)self informativeText];
    v18 = [v9 informativeText];
    id v19 = [v18 stringByAppendingString:v17];
    [v9 setInformativeText:v19];

    v20 = [v9 notification];
    v21 = [v20 informativeText];
    v22 = [v21 stringByAppendingString:v17];
    __int16 v23 = [v9 notification];
    [v23 setInformativeText:v22];
  }
  id v24 = [(CDPDFollowUpController *)self followUpController];
  v92 = @"RepairCDPState";
  uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v92 count:1];
  [v24 clearPendingFollowUpItemsWithUniqueIdentifiers:v25 error:a4];

  if (([v6 isDefaultRepairOrSOSCompatibilityFollowUp] & 1) == 0)
  {
    BOOL v16 = [(CDPDFollowUpController *)self _postFollowUpItem:v9 context:v6 error:a4];
LABEL_73:

    BOOL v14 = v16;
    goto LABEL_14;
  }
  id v79 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  v27 = [v6 altDSID];

  if (!v27)
  {
    v28 = [MEMORY[0x263F34350] contextForPrimaryAccount];
    v29 = [v28 altDSID];
    [v6 setAltDSID:v29];
  }
  v30 = (void *)MEMORY[0x263F34340];
  v31 = [v6 altDSID];
  uint64_t v32 = [v30 syncingStatusForAltDSID:v31];

  v33 = (void *)MEMORY[0x263F343E8];
  v34 = [v6 altDSID];
  uint64_t v35 = [v33 syncingStatusForAltDSID:v34];

  v36 = [v6 altDSID];
  v78 = [(CDPDFollowUpController *)self _hasSOSActiveDeviceForAltDSID:v36];

  v37 = [v6 altDSID];
  uint64_t v38 = [(CDPDFollowUpController *)self _sosCompatibilityModeContext:v37];

  v39 = [v6 altDSID];
  uint64_t v40 = [(CDPDFollowUpController *)self _cdpRepairContext:v39];

  v76 = (void *)v38;
  v77 = (void *)v40;
  uint64_t v75 = v35;
  if (v32 != 1)
  {
    v44 = _CDPLogSystem();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
      -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.6();
    }

    uint64_t v91 = v38;
    v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
    [v26 addObjectsFromArray:v45];

    uint64_t v90 = v40;
    v46 = (void *)MEMORY[0x263EFF8C0];
    v47 = &v90;
    goto LABEL_34;
  }
  if (v35 == 1)
  {
LABEL_38:
    v50 = _CDPLogSystem();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      -[CDPDFollowUpController postFollowUpItemForContext:error:]();
    }

    v85[0] = v40;
    v85[1] = v38;
    v42 = (void *)MEMORY[0x263EFF8C0];
    v43 = v85;
    goto LABEL_41;
  }
  if (v35)
  {
    if (([v78 BOOLValue] & 1) == 0 && v78)
    {
      if (([v78 BOOLValue] & 1) == 0)
      {
        v74 = _CDPLogSystem();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
          -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.4();
        }

        v86[0] = v40;
        v86[1] = v38;
        v42 = (void *)MEMORY[0x263EFF8C0];
        v43 = v86;
        goto LABEL_41;
      }
      goto LABEL_38;
    }
    v72 = _CDPLogSystem();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
      -[CDPDFollowUpController postFollowUpItemForContext:error:]();
    }

    uint64_t v88 = v40;
    v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
    [v26 addObjectsFromArray:v73];

    uint64_t v87 = v38;
    v46 = (void *)MEMORY[0x263EFF8C0];
    v47 = &v87;
LABEL_34:
    v48 = [v46 arrayWithObjects:v47 count:1];
    v49 = v79;
    [v79 addObjectsFromArray:v48];
    goto LABEL_42;
  }
  v41 = _CDPLogSystem();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
    -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.5();
  }

  v89[0] = v40;
  v89[1] = v38;
  v42 = (void *)MEMORY[0x263EFF8C0];
  v43 = v89;
LABEL_41:
  v48 = [v42 arrayWithObjects:v43 count:2];
  [v26 addObjectsFromArray:v48];
  v49 = v79;
LABEL_42:

  if ([v49 count])
  {
    v51 = _CDPLogSystem();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218640000, v51, OS_LOG_TYPE_DEFAULT, "_handleCDPRepairCFUPosting - tearing down RK Mismatch healing CFU to post CDP Repair CFU", buf, 2u);
    }

    v52 = [v6 altDSID];
    v53 = [(CDPDFollowUpController *)self _rkMismatchHealingContext:v52];

    [v26 addObject:v53];
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v54 = v26;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v80 objects:v84 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v81 != v57) {
          objc_enumerationMutation(v54);
        }
        [(CDPDFollowUpController *)self clearFollowUpWithContext:*(void *)(*((void *)&v80 + 1) + 8 * i) error:0];
      }
      uint64_t v56 = [v54 countByEnumeratingWithState:&v80 objects:v84 count:16];
    }
    while (v56);
  }

  v59 = [v49 firstObject];

  if (v59)
  {
    v60 = [v49 firstObject];
    v61 = [(CDPDFollowUpController *)self followUpFactory];
    v62 = [v61 followUpItemWithContext:v60];

    v63 = [v60 followUpType];
    uint64_t v64 = *MEMORY[0x263F34310];
    if ([v63 isEqualToString:*MEMORY[0x263F34310]])
    {
      BOOL v65 = +[CDPDOctagonTrustProxyImpl octagonIsSOSFeatureEnabled];

      if (!v65)
      {
        v66 = _CDPLogSystem();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
          -[CDPDFollowUpController postFollowUpItemForContext:error:]();
        }

        char v67 = 0;
        BOOL v16 = 0;
        v49 = v79;
        goto LABEL_68;
      }
    }
    else
    {
    }
    BOOL v16 = [(CDPDFollowUpController *)self _postFollowUpItem:v62 context:v60 error:a4];

    v49 = v79;
  }
  else
  {
    BOOL v16 = 0;
    uint64_t v64 = *MEMORY[0x263F34310];
  }
  v68 = [v6 followUpType];
  if ([v68 isEqualToString:v64]) {
    BOOL v69 = v75 == 1;
  }
  else {
    BOOL v69 = 1;
  }
  if (v69)
  {

    char v67 = 1;
LABEL_68:
    v70 = v78;
    goto LABEL_72;
  }
  v70 = v78;
  int v71 = [v78 BOOLValue];

  if (!v71) {
    BOOL v16 = 1;
  }
  char v67 = 1;
LABEL_72:

  if (v67) {
    goto LABEL_73;
  }
LABEL_13:

  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (id)_makeAAFLFollowUpController
{
  id v2 = objc_alloc(MEMORY[0x263F35380]);
  v3 = (void *)[v2 initWithClientIdentifier:*MEMORY[0x263F25668]];
  return v3;
}

- (id)_sosCompatibilityModeContext:(id)a3
{
  v3 = (void *)MEMORY[0x263F34388];
  id v4 = a3;
  v5 = [v3 contextForSOSCompatibilityMode];
  [v5 setAltDSID:v4];

  return v5;
}

- (id)_cdpRepairContext:(id)a3
{
  v3 = (void *)MEMORY[0x263F34388];
  id v4 = a3;
  v5 = [v3 contextForStateRepair];
  [v5 setAltDSID:v4];

  return v5;
}

- (id)_rkMismatchHealingContext:(id)a3
{
  v3 = (void *)MEMORY[0x263F34388];
  id v4 = a3;
  v5 = [v3 contextForRecoveryKeyMismatchHealing];
  [v5 setAltDSID:v4];

  return v5;
}

- (id)_hasSOSActiveDeviceForAltDSID:(id)a3
{
  v3 = (void *)MEMORY[0x263F290F0];
  id v4 = a3;
  v5 = [v3 sharedInstance];
  id v6 = [v5 authKitAccountWithAltDSID:v4];

  v7 = [v5 hasSOSActiveDeviceForAccount:v6];

  return v7;
}

- (BOOL)clearFollowUpWithContext:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [v6 followUpType];

  if (v7)
  {
    id v8 = [v6 followUpType];
    int v9 = [v8 isEqualToString:*MEMORY[0x263F34318]];

    BOOL v10 = [(CDPDFollowUpController *)self _clearFollowUpForContext:v6 error:a4];
    if (v9)
    {
      uint64_t v11 = [(CDPDFollowUpController *)self followUpController];
      v15[0] = @"RepairCDPState";
      BOOL v12 = 1;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
      [v11 clearPendingFollowUpItemsWithUniqueIdentifiers:v13 error:a4];
    }
    else
    {
      BOOL v12 = v10;
    }
  }
  else if (a4)
  {
    _CDPStateError();
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)informativeText
{
  id v2 = [MEMORY[0x263F08D68] currentConnection];
  if (v2)
  {
    v3 = NSString;
    id v4 = [MEMORY[0x263F343B8] builderForKey:@"KEYCHAIN_FOLLOWUP_INTERNAL_BLAME"];
    v5 = [v4 localizedString];
    id v6 = [v2 processName];
    v7 = [v3 stringWithValidatedFormat:v5, @"%@", 0, v6 validFormatSpecifiers error];
  }
  else
  {
    v7 = &stru_26C9C0CF8;
  }

  return v7;
}

- (void)securityLevelChangedForAccountContext:(id)a3
{
  id v4 = a3;
  if ([v4 isSharediPad])
  {
    v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "CDPDFollowUpController: Manatee is not available on Shared iPad - no CFU needed", v8, 2u);
    }
  }
  else if ([v4 isHSA2Account])
  {
    id v6 = [MEMORY[0x263F34388] contextForStateRepair];
    [v6 setRepairType:1];
    v7 = [v4 altDSID];
    [v6 setAltDSID:v7];

    [(CDPDFollowUpController *)self postFollowUpItemForContext:v6 error:0];
  }
}

- (id)_followUpControllerForContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 followUpType];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F34308]];

  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F35380]) initWithClientIdentifier:@"com.apple.purplebuddy"];
    goto LABEL_8;
  }
  id v8 = [v4 followUpType];
  if ([v8 isEqualToString:*MEMORY[0x263F34318]])
  {

LABEL_6:
    uint64_t v7 = [(CDPDFollowUpController *)self _makeAAFLFollowUpController];
    goto LABEL_8;
  }
  int v9 = [v4 followUpType];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F342F0]];

  if (v10) {
    goto LABEL_6;
  }
  uint64_t v7 = [(CDPDFollowUpController *)self followUpController];
LABEL_8:
  uint64_t v11 = (void *)v7;

  return v11;
}

- (BOOL)hasPendingFollowUpWithUniqueIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  followUpController = self->_followUpController;
  id v21 = 0;
  int v6 = [(FLFollowUpController *)followUpController pendingFollowUpItems:&v21];
  id v7 = v21;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = ((char *)i + 1))
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          BOOL v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "uniqueIdentifier", (void)v17);
          int v15 = [v4 isEqualToString:v14];

          if (v15)
          {
            uint64_t v11 = _CDPLogSystem();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v23 = v4;
              _os_log_impl(&dword_218640000, v11, OS_LOG_TYPE_DEFAULT, "Found CFU with uniqueIdentifier %@", buf, 0xCu);
            }

            LOBYTE(v11) = 1;
            goto LABEL_20;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    int v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CDPDFollowUpController hasPendingFollowUpWithUniqueIdentifier:]();
    }
    LOBYTE(v11) = 0;
  }
LABEL_20:

  return (char)v11;
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (CDPDFollowUpFactory)followUpFactory
{
  return self->_followUpFactory;
}

- (void)setFollowUpFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpFactory, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
}

- (void)_postFollowUpItem:(void *)a1 context:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v3 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_218640000, a2, OS_LOG_TYPE_FAULT, "CDP was requested to post a non-allowed CFU: %@", v4, 0xCu);
}

- (void)_clearFollowUpForContext:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_218640000, v0, OS_LOG_TYPE_FAULT, "CDP was requested to clear a non-allowed CFU: %@", v1, 0xCu);
}

- (void)postFollowUpItemForContext:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Will not post Compatability Mode CFU on platforms that do not support SOS", v2, v3, v4, v5, v6);
}

- (void)postFollowUpItemForContext:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "_handleCDPRepairCFUPosting - In OT but not in SOS circle, with hasSOSActiveDevice = %@, clear CDP Repair CFU and posting SOS Compatibility Mode CFU", v1, 0xCu);
}

- (void)postFollowUpItemForContext:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_handleCDPRepairCFUPosting - In both OT and SOS circle, clear both CFUs", v2, v3, v4, v5, v6);
}

- (void)postFollowUpItemForContext:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_handleCDPRepairCFUPosting - In OT but not in SOS circle, with hasSOSActiveDevice set to false, clear both CFUs for SOS rot", v2, v3, v4, v5, v6);
}

- (void)postFollowUpItemForContext:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_handleCDPRepairCFUPosting - In OT but SOS compatibility mode is off, clearing CDP Repair and SOS Compatibility Mode CFU", v2, v3, v4, v5, v6);
}

- (void)postFollowUpItemForContext:error:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "_handleCDPRepairCFUPosting - Not in OT circle, clearing SOS Compatibility Mode CFU and posting CDP Repair CFU", v2, v3, v4, v5, v6);
}

- (void)postFollowUpItemForContext:error:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_218640000, v0, v1, "Will not post Confirm Existing Secret CFU if user has no existing Local Secret or their Local Secret is the same as their iCloud Login", v2, v3, v4, v5, v6);
}

- (void)hasPendingFollowUpWithUniqueIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "Failed to fetch any pending CFUs, error: %{public}@", v1, 0xCu);
}

@end
@interface CDPDTTRController
- (BOOL)_isTTREnabledForDict:(id)a3;
- (id)_normalizedTTRErrorForEvent:(id)a3;
- (id)_ttrInfoForEvent:(id)a3 forTTRConfigSupportedErrors:(id)a4;
- (id)_ttrInfoForEventErrorDict:(id)a3 inTTRConfigSupportedErrors:(id)a4;
- (void)_performTTRForRequest:(id)a3 completion:(id)a4;
- (void)_triggerTTRForEvent:(id)a3 componentName:(id)a4 componentVersion:(id)a5 componentID:(id)a6 additionalDeviceTypes:(id)a7 fullDiagnostic:(BOOL)a8;
- (void)requestTTRIfSupportedForEvent:(id)a3;
- (void)requestTTRWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8 additionalDeviceTypes:(id)a9 fullDiagnostic:(BOOL)a10 completion:(id)a11;
@end

@implementation CDPDTTRController

- (void)requestTTRWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8 additionalDeviceTypes:(id)a9 fullDiagnostic:(BOOL)a10 completion:(id)a11
{
  id v26 = a9;
  id v17 = a11;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = objc_opt_new();
  [v24 setRadarTitle:v23];

  [v24 setRadarDescription:v22];
  [v24 setComponentName:v21];

  [v24 setComponentID:v19];
  [v24 setComponentVersion:v20];

  [v24 setKeywords:v18];
  [v24 setFullDiagnostic:a10];
  if (v26 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v24 setDeviceTypes:v26];
  }
  [(CDPDTTRController *)self _performTTRForRequest:v24 completion:v17];
}

- (void)requestTTRIfSupportedForEvent:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F34400] isInternalBuild])
  {
    v5 = (void *)os_transaction_create();
    objc_initWeak(&location, self);
    v6 = [MEMORY[0x263F29270] sharedBag];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__CDPDTTRController_requestTTRIfSupportedForEvent___block_invoke;
    v8[3] = &unk_26432F798;
    id v9 = v4;
    v10 = self;
    objc_copyWeak(&v12, &location);
    v7 = v5;
    v11 = v7;
    [v6 configurationValueForKey:@"ttr-cfgs-v2" fromCache:1 completion:v8];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CDPDTTRController requestTTRIfSupportedForEvent:](v7);
    }
  }
}

void __51__CDPDTTRController_requestTTRIfSupportedForEvent___block_invoke(id *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  id v4 = [a1[4] eventName];
  id v5 = [v3 objectForKeyedSubscript:v4];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v7 = [a1[5] _ttrInfoForEvent:a1[4] forTTRConfigSupportedErrors:v6];
  objc_opt_class();
  id v8 = [v7 objectForKeyedSubscript:@"cid"];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (v9)
  {
    id v28 = v6;
    objc_opt_class();
    id v10 = [v3 objectForKeyedSubscript:@"componentInfo"];
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    objc_opt_class();
    id v12 = [v11 objectForKeyedSubscript:v9];
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v29 = v3;

    objc_opt_class();
    id v14 = [v13 objectForKeyedSubscript:@"cn"];
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    v27 = v11;

    objc_opt_class();
    id v16 = [v13 objectForKeyedSubscript:@"cv"];
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    objc_opt_class();
    id v18 = [v7 objectForKeyedSubscript:@"fla"];
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }

    objc_opt_class();
    id v20 = [v7 objectForKeyedSubscript:@"dc"];
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    id v22 = [v19 lowercaseString];
    uint64_t v23 = [v22 isEqualToString:@"y"];

    if (v15 && v17)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 7);
      [WeakRetained _triggerTTRForEvent:a1[4] componentName:v15 componentVersion:v17 componentID:v9 additionalDeviceTypes:v21 fullDiagnostic:v23];
    }
    else
    {
      v25 = _AKLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v26 = [a1[4] eventName];
        *(_DWORD *)buf = 138413058;
        v31 = v26;
        __int16 v32 = 2112;
        id v33 = v9;
        __int16 v34 = 2112;
        id v35 = v15;
        __int16 v36 = 2112;
        id v37 = v17;
        _os_log_debug_impl(&dword_218640000, v25, OS_LOG_TYPE_DEBUG, "Unable to send TTR for event %@. Component ID - %@, name - %@, version - %@", buf, 0x2Au);
      }
    }

    id v6 = v28;
    id v3 = v29;
  }
}

- (void)_performTTRForRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void (**)(void, void, void))v6;
  if (v5)
  {
    id v8 = objc_opt_new();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__CDPDTTRController__performTTRForRequest_completion___block_invoke;
    v9[3] = &unk_26432F318;
    id v10 = v7;
    [v8 silentTapToRadarWithRequest:v5 completion:v9];

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F290B0] code:3 userInfo:0];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
    goto LABEL_5;
  }
LABEL_6:
}

uint64_t __54__CDPDTTRController__performTTRForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    if (!v4) {
      goto LABEL_7;
    }
    id v5 = *(void (**)(void))(v4 + 16);
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    id v5 = *(void (**)(void))(v4 + 16);
  }
  v5();
LABEL_7:
  return MEMORY[0x270F9A790]();
}

- (id)_normalizedTTRErrorForEvent:(id)a3
{
  v44[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v4 = 0x263F08000uLL;
  objc_opt_class();
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F20338]];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  unint64_t v7 = 0x263F08000uLL;
  objc_opt_class();
  id v8 = [v3 objectForKeyedSubscript:*MEMORY[0x263F20340]];
  if (objc_opt_isKindOfClass()) {
    id v34 = v8;
  }
  else {
    id v34 = 0;
  }

  objc_opt_class();
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x263F20358]];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  uint64_t v11 = [v10 integerValue];
  id v33 = v6;
  if (v6 && v34)
  {
    v43[0] = @"ec";
    id v12 = [v6 stringValue];
    v43[1] = @"ed";
    v44[0] = v12;
    v44[1] = v34;
    id v13 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    [v36 addEntriesFromDictionary:v13];

    uint64_t v14 = *MEMORY[0x263F20368];
    uint64_t v15 = *MEMORY[0x263F20370];
    uint64_t v16 = 1;
    id v35 = v3;
    do
    {
      if (v11 < v16) {
        break;
      }
      uint64_t v17 = [*(id *)(v7 + 2880) stringWithFormat:@"%@%u", v14, v16];
      v40 = [*(id *)(v7 + 2880) stringWithFormat:@"%@%u", v15, v16];
      objc_opt_class();
      id v18 = [v3 objectForKeyedSubscript:v17];
      uint64_t v38 = (void *)v17;
      if (objc_opt_isKindOfClass()) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }

      objc_opt_class();
      id v20 = [v3 objectForKeyedSubscript:v40];
      if (objc_opt_isKindOfClass()) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }

      if (v19) {
        BOOL v22 = v21 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      char v23 = !v22;
      char v39 = v23;
      if (!v22)
      {
        id v37 = objc_msgSend(*(id *)(v7 + 2880), "stringWithFormat:", @"uec%lu", v16);
        v24 = objc_msgSend(*(id *)(v7 + 2880), "stringWithFormat:", @"ued%lu", v16);
        v41[0] = v37;
        v25 = [v19 stringValue];
        v41[1] = v24;
        v42[0] = v25;
        v42[1] = v21;
        [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
        int v26 = v16;
        uint64_t v27 = v15;
        uint64_t v28 = v14;
        uint64_t v29 = v11;
        v31 = unint64_t v30 = v4;
        [v36 addEntriesFromDictionary:v31];

        unint64_t v4 = v30;
        uint64_t v11 = v29;
        uint64_t v14 = v28;
        uint64_t v15 = v27;

        id v3 = v35;
        unint64_t v7 = 0x263F08000;

        uint64_t v16 = (v26 + 1);
      }
    }
    while ((v39 & 1) != 0);
  }

  return v36;
}

- (void)_triggerTTRForEvent:(id)a3 componentName:(id)a4 componentVersion:(id)a5 componentID:(id)a6 additionalDeviceTypes:(id)a7 fullDiagnostic:(BOOL)a8
{
  id v12 = a3;
  id v13 = NSString;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = [v12 eventName];
  id v19 = [v13 stringWithFormat:@"Analyzing error for the event %@", v18];

  id v20 = NSString;
  id v21 = [v12 eventName];
  BOOL v22 = [v20 stringWithFormat:@"AAA team is analyzing an issue for the event %@. It will be very helpful if you can complete the TTR and file the radar with sysdiagnose. Thank you for your help, have a wonderful day.", v21];

  char v23 = NSString;
  v24 = [v12 reportData];
  v25 = [v23 stringWithFormat:@"%@ \nEvent Details - \n%@", v22, v24];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __121__CDPDTTRController__triggerTTRForEvent_componentName_componentVersion_componentID_additionalDeviceTypes_fullDiagnostic___block_invoke;
  v30[3] = &unk_26432ECF8;
  id v31 = v12;
  id v26 = v12;
  LOBYTE(v27) = a8;
  [(CDPDTTRController *)self requestTTRWithTitle:v19 message:v25 componentName:v17 componentVersion:v16 componentID:v15 keywords:MEMORY[0x263EFFA68] additionalDeviceTypes:v14 fullDiagnostic:v27 completion:v30];
}

void __121__CDPDTTRController__triggerTTRForEvent_componentName_componentVersion_componentID_additionalDeviceTypes_fullDiagnostic___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _CDPLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v7 = [*(id *)(a1 + 32) eventName];
    int v8 = 138412802;
    id v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_debug_impl(&dword_218640000, v6, OS_LOG_TYPE_DEBUG, "TTR filed for event - %@ with status - %d and error - %@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (id)_ttrInfoForEvent:(id)a3 forTTRConfigSupportedErrors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(CDPDTTRController *)self _normalizedTTRErrorForEvent:v6];
    id v9 = [(CDPDTTRController *)self _ttrInfoForEventErrorDict:v8 inTTRConfigSupportedErrors:v7];
  }
  else
  {
    __int16 v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CDPDTTRController _ttrInfoForEvent:forTTRConfigSupportedErrors:](v6, v10);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)_ttrInfoForEventErrorDict:(id)a3 inTTRConfigSupportedErrors:(id)a4
{
  id v6 = a3;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __74__CDPDTTRController__ttrInfoForEventErrorDict_inTTRConfigSupportedErrors___block_invoke;
  id v15 = &unk_26432F7C0;
  id v16 = self;
  id v7 = v6;
  id v17 = v7;
  int v8 = objc_msgSend(a4, "aaf_filter:", &v12);
  objc_opt_class();
  objc_msgSend(v8, "firstObject", v12, v13, v14, v15, v16);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

uint64_t __74__CDPDTTRController__ttrInfoForEventErrorDict_inTTRConfigSupportedErrors___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a2];
  int v4 = [*(id *)(a1 + 32) _isTTREnabledForDict:v3];
  [v3 setObject:0 forKeyedSubscript:@"dc"];
  [v3 setObject:0 forKeyedSubscript:@"pt"];
  [v3 setObject:0 forKeyedSubscript:@"cid"];
  [v3 setObject:0 forKeyedSubscript:@"fla"];
  if (v4) {
    uint64_t v5 = [v3 isEqualToDictionary:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_isTTREnabledForDict:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  int v4 = [v3 objectForKeyedSubscript:@"pt"];

  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  uint64_t v7 = [v6 integerValue];
  if ((v7 & (unint64_t)~(v7 >> 63)) >= 0x64) {
    unint64_t v8 = 100;
  }
  else {
    unint64_t v8 = v7 & ~(v7 >> 63);
  }
  uint32_t v9 = arc4random_uniform(0x65u);
  if (v9 <= 1) {
    unint64_t v10 = 1;
  }
  else {
    unint64_t v10 = v9;
  }
  int v11 = _AKLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    [(CDPDTTRController *)v8 _isTTREnabledForDict:v11];
  }

  return v8 >= v10;
}

- (void)requestTTRIfSupportedForEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218640000, log, OS_LOG_TYPE_ERROR, "CoreCDP received request for TTR on non-internal build, ignoring.", v1, 2u);
}

- (void)_ttrInfoForEvent:(void *)a1 forTTRConfigSupportedErrors:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 eventName];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Missing ttr configs for event - %@", (uint8_t *)&v4, 0xCu);
}

- (void)_isTTREnabledForDict:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "ttr-cfgs normalized mid drift ttrFrequency - %ld and  randomNumber - %ld", (uint8_t *)&v3, 0x16u);
}

@end
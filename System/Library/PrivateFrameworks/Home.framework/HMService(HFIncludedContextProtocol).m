@interface HMService(HFIncludedContextProtocol)
- (BOOL)hf_hasSetForContextType:()HFIncludedContextProtocol;
- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:;
- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol;
@end

@implementation HMService(HFIncludedContextProtocol)

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  switch(a3)
  {
    case 0:
      if (objc_msgSend(a1, "hf_isSensorService")) {
        goto LABEL_8;
      }
      if (objc_msgSend(a1, "hf_isOnForContextType:", 0))
      {
        char v3 = 1;
        return v3 & 1;
      }
      v7 = a1;
      uint64_t v8 = 0;
      goto LABEL_17;
    case 1:
      char v3 = 1;
      if (objc_msgSend(a1, "hf_isOnForContextType:", 1)) {
        return v3 & 1;
      }
      v7 = a1;
      uint64_t v8 = 1;
LABEL_17:
      char v10 = objc_msgSend(v7, "hf_hasSetForContextType:", v8);
      goto LABEL_19;
    case 2:
      if (objc_msgSend(a1, "hf_isSensorService")) {
        goto LABEL_8;
      }
      v5 = a1;
      uint64_t v6 = 2;
      goto LABEL_13;
    case 3:
      if (objc_msgSend(a1, "hf_isSensorService"))
      {
LABEL_8:
        char v3 = 0;
        return v3 & 1;
      }
      if (!objc_msgSend(a1, "hf_hasSetForContextType:", 3))
      {
        char v10 = objc_msgSend(a1, "hf_isProgrammableSwitch");
LABEL_19:
        char v3 = v10 ^ 1;
        return v3 & 1;
      }
      v5 = a1;
      uint64_t v6 = 3;
LABEL_13:
      return objc_msgSend(v5, "hf_isOnForContextType:", v6);
    default:
      return v3 & 1;
  }
}

- (BOOL)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  switch(a3)
  {
    case 0:
      v4 = [a1 applicationData];
      v5 = v4;
      uint64_t v6 = @"HFApplicationDataServiceIsFavorite";
      goto LABEL_6;
    case 1:
      v4 = [a1 applicationData];
      v5 = v4;
      uint64_t v6 = @"HFApplicationDataServiceIsVisibleInHomeStatusKey";
      goto LABEL_6;
    case 2:
      v4 = [a1 applicationData];
      v5 = v4;
      uint64_t v6 = @"HFApplicationDataServiceIsFavorite_v2";
      goto LABEL_6;
    case 3:
      v4 = [a1 applicationData];
      v5 = v4;
      uint64_t v6 = @"HFApplicationDataServiceShowInHomeDashboard";
LABEL_6:
      v7 = [v4 objectForKeyedSubscript:v6];
      BOOL v3 = v7 != 0;

      break;
    default:
      return v3;
  }
  return v3;
}

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  uint64_t v15 = v3;
  switch(a3)
  {
    case 0:
      v9 = [a1 applicationData];
      char v10 = v9;
      v11 = @"HFApplicationDataServiceIsFavorite";
      goto LABEL_7;
    case 1:
      v9 = [a1 applicationData];
      char v10 = v9;
      v11 = @"HFApplicationDataServiceIsVisibleInHomeStatusKey";
      goto LABEL_7;
    case 2:
      v9 = [a1 applicationData];
      char v10 = v9;
      v11 = @"HFApplicationDataServiceIsFavorite_v2";
      goto LABEL_7;
    case 3:
      v9 = [a1 applicationData];
      char v10 = v9;
      v11 = @"HFApplicationDataServiceShowInHomeDashboard";
LABEL_7:
      v13 = objc_msgSend(v9, "objectForKeyedSubscript:", v11, v6, v5, v4, v15, v7, v8);
      uint64_t v14 = [v13 BOOLValue];

      uint64_t result = v14;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  if ((unint64_t)(a3 - 2) < 2) {
    goto LABEL_4;
  }
  if (a3 == 1)
  {
    uint64_t v8 = [a1 serviceType];
    char v9 = +[HFStatusItemProvider hasStatusItemForServiceType:v8];
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_4:
    uint64_t v5 = [a1 accessory];
    uint64_t v6 = [v5 home];
    char v7 = objc_msgSend(v6, "hf_currentUserIsRestrictedGuest");

    if ((v7 & 1) != 0
      || (objc_msgSend(a1, "hf_isInGroup") & 1) != 0
      || (objc_msgSend(a1, "hf_isSensorService") & 1) != 0
      || (objc_msgSend(a1, "hf_isNetworkRouter") & 1) != 0)
    {
      char v3 = 1;
      return v3 & 1;
    }
    v11 = [a1 accessory];
    int v12 = objc_msgSend(v11, "hf_isMultiServiceAccessory");

    if (!v12)
    {
      char v3 = 0;
      return v3 & 1;
    }
    uint64_t v8 = [a1 accessory];
    char v9 = objc_msgSend(v8, "hf_showAsIndividualServices");
LABEL_10:
    char v3 = v9 ^ 1;
  }
  return v3 & 1;
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v15 = a1;
    __int16 v16 = 2080;
    v17 = "-[HMService(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    __int16 v18 = 1024;
    int v19 = a3;
    __int16 v20 = 2048;
    uint64_t v21 = a4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  switch(a4)
  {
    case 0:
      uint64_t v8 = [a1 applicationData];
      char v9 = [NSNumber numberWithBool:a3];
      char v10 = @"HFApplicationDataServiceIsFavorite";
      goto LABEL_8;
    case 1:
      uint64_t v8 = [a1 applicationData];
      char v9 = [NSNumber numberWithBool:a3];
      char v10 = @"HFApplicationDataServiceIsVisibleInHomeStatusKey";
      goto LABEL_8;
    case 2:
      uint64_t v8 = [a1 applicationData];
      char v9 = [NSNumber numberWithBool:a3];
      char v10 = @"HFApplicationDataServiceIsFavorite_v2";
      goto LABEL_8;
    case 3:
      uint64_t v8 = [a1 applicationData];
      char v9 = [NSNumber numberWithBool:a3];
      char v10 = @"HFApplicationDataServiceShowInHomeDashboard";
LABEL_8:
      HFAppDataSetValueIfChanged(v8, v10, v9);

      break;
    default:
      break;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__HMService_HFIncludedContextProtocol__hf_updateValue_forContextType___block_invoke;
  v13[3] = &unk_26408CD50;
  v13[4] = a1;
  v11 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v13];
  return v11;
}

@end
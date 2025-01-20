@interface HMAccessory(HFIncludedContextProtocol)
- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:;
- (id)hf_updateValueForCurrentObjectOnly:()HFIncludedContextProtocol forContextType:;
- (uint64_t)_areAllSensorServices;
- (uint64_t)hf_anyNonSensorServiceIsOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol;
@end

@implementation HMAccessory(HFIncludedContextProtocol)

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  v4 = a1;
  if ((objc_msgSend(a1, "hf_isPureBridge") & 1) != 0
    || [v4 _areAllSensorServices]
    && !objc_msgSend(v4, "hf_isNonServiceBasedAccessory"))
  {
    LOBYTE(v4) = 0;
    return v4 & 1;
  }
  else
  {
    switch(a3)
    {
      case 0:
        if ((objc_msgSend(v4, "hf_isOnForContextType:", 0) & 1) != 0
          || (objc_msgSend(v4, "hf_anyNonSensorServiceIsOnForContextType:", 0) & 1) != 0)
        {
          goto LABEL_13;
        }
        char v5 = objc_msgSend(v4, "hf_hasSetForContextType:", 0);
        goto LABEL_22;
      case 1:
        if (objc_msgSend(v4, "hf_hasSetForContextType:", 1))
        {
          v7 = v4;
          uint64_t v8 = 1;
LABEL_16:
          return objc_msgSend(v7, "hf_isOnForContextType:", v8);
        }
        if (objc_msgSend(v4, "hf_isNonServiceBasedAccessory"))
        {
          char v5 = objc_msgSend(v4, "hf_shouldHideForContextType:", 1);
          goto LABEL_22;
        }
        v9 = objc_msgSend(v4, "hf_visibleServices");
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __70__HMAccessory_HFIncludedContextProtocol__hf_shouldBeOnForContextType___block_invoke;
        v10[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
        v10[4] = 1;
        LOBYTE(v4) = objc_msgSend(v9, "na_any:", v10);

        return v4 & 1;
      case 2:
        v7 = v4;
        uint64_t v8 = 2;
        goto LABEL_16;
      case 3:
        if (!objc_msgSend(v4, "hf_hasSetForContextType:", 3))
        {
          char v5 = objc_msgSend(v4, "hf_isProgrammableSwitch");
LABEL_22:
          LOBYTE(v4) = v5 ^ 1;
          return v4 & 1;
        }
        if (objc_msgSend(v4, "hf_isOnForContextType:", 3))
        {
LABEL_13:
          LOBYTE(v4) = 1;
          return v4 & 1;
        }
        uint64_t result = objc_msgSend(v4, "hf_anyNonSensorServiceIsOnForContextType:", 3);
        break;
      default:
        return v4 & 1;
    }
  }
  return result;
}

- (uint64_t)_areAllSensorServices
{
  v1 = objc_msgSend(a1, "hf_visibleServices");
  uint64_t v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_34_3);

  return v2;
}

- (uint64_t)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
      char v5 = [a1 applicationData];
      v6 = v5;
      v7 = @"HFApplicationDataAccessoryIsFavoriteKey";
      goto LABEL_11;
    case 1:
      v9 = [a1 applicationData];
      v10 = [v9 objectForKeyedSubscript:@"HFApplicationDataAccessoryIsVisibleInHomeStatusKey"];
      BOOL v11 = v10 != 0;

      return v11;
    case 2:
      if (objc_msgSend(a1, "hf_isCamera"))
      {
        v12 = HFLogForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[HMAccessory(HFIncludedContextProtocol) hf_hasSetForContextType:]";
          _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "(%s) Trying to check if Favorite was set or not for Camera, which can't be done.", buf, 0xCu);
        }

        return 0;
      }
      else
      {
        char v5 = [a1 applicationData];
        v6 = v5;
        v7 = @"HFApplicationDataAccessoryIsFavoriteKey_v2";
LABEL_11:
        v13 = [v5 objectForKeyedSubscript:v7];
        BOOL v8 = v13 != 0;

LABEL_12:
        v14 = [a1 services];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __66__HMAccessory_HFIncludedContextProtocol__hf_hasSetForContextType___block_invoke;
        v17[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
        v17[4] = a3;
        unsigned int v15 = objc_msgSend(v14, "na_any:", v17);

        return v8 | v15;
      }
    case 3:
      char v5 = [a1 applicationData];
      v6 = v5;
      v7 = @"HFApplicationDataAccessoryShowInHomeDashboard";
      goto LABEL_11;
    default:
      BOOL v8 = 0;
      goto LABEL_12;
  }
}

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  switch(a3)
  {
    case 0:
      v4 = [a1 applicationData];
      char v5 = v4;
      v6 = @"HFApplicationDataAccessoryIsFavoriteKey";
      goto LABEL_8;
    case 1:
      v4 = [a1 applicationData];
      char v5 = v4;
      v6 = @"HFApplicationDataAccessoryIsVisibleInHomeStatusKey";
      goto LABEL_8;
    case 2:
      if (objc_msgSend(a1, "hf_isCamera")) {
        goto LABEL_5;
      }
      v4 = [a1 applicationData];
      char v5 = v4;
      v6 = @"HFApplicationDataAccessoryIsFavoriteKey_v2";
LABEL_8:
      BOOL v8 = [v4 objectForKeyedSubscript:v6];
      uint64_t v9 = [v8 BOOLValue];

      uint64_t result = v9;
      break;
    case 3:
      v4 = [a1 applicationData];
      char v5 = v4;
      v6 = @"HFApplicationDataAccessoryShowInHomeDashboard";
      goto LABEL_8;
    default:
LABEL_5:
      uint64_t result = 0;
      break;
  }
  return result;
}

- (uint64_t)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  id v4 = val;
  objc_initWeak(&location, val);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __70__HMAccessory_HFIncludedContextProtocol__hf_shouldHideForContextType___block_invoke;
  BOOL v11 = &unk_264096710;
  objc_copyWeak(&v12, &location);
  char v5 = (uint64_t (**)(void))_Block_copy(&v8);
  switch(a3)
  {
    case 0:
    case 3:
      goto LABEL_2;
    case 1:
      if ((objc_msgSend(v4, "hf_isAppleTV", v8, v9, v10, v11) & 1) != 0
        || (objc_msgSend(v4, "hf_isCamera") & 1) != 0
        || (objc_msgSend(v4, "hf_isHomePod") & 1) != 0
        || (objc_msgSend(v4, "hf_isRemoteControl") & 1) != 0)
      {
        char v6 = 1;
      }
      else
      {
        char v6 = objc_msgSend(v4, "hf_isMatterOnlyAccessory");
      }
      LOBYTE(v4) = v6 ^ 1;
      break;
    case 2:
      if (objc_msgSend(v4, "hf_isCamera", v8, v9, v10, v11)) {
        LOBYTE(v4) = 1;
      }
      else {
LABEL_2:
      }
        LOBYTE(v4) = v5[2](v5);
      break;
    default:
      break;
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v4 & 1;
}

- (uint64_t)hf_anyNonSensorServiceIsOnForContextType:()HFIncludedContextProtocol
{
  id v4 = objc_msgSend(a1, "hf_visibleServices");
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__HMAccessory_HFIncludedContextProtocol__hf_anyNonSensorServiceIsOnForContextType___block_invoke;
  v7[3] = &__block_descriptor_40_e19_B16__0__HMService_8l;
  v7[4] = a3;
  uint64_t v5 = objc_msgSend(v4, "na_any:", v7);

  return v5;
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v26 = a1;
    __int16 v27 = 2080;
    v28 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    __int16 v29 = 1024;
    *(_DWORD *)v30 = a3;
    *(_WORD *)&v30[4] = 2048;
    *(void *)&v30[6] = a4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  uint64_t v8 = objc_opt_new();
  uint64_t v9 = objc_msgSend(a1, "hf_updateValueForCurrentObjectOnly:forContextType:", a3, a4);
  [v8 addObject:v9];
  if ((objc_msgSend(a1, "hf_showAsIndividualServices") & 1) == 0)
  {
    uint64_t v20 = v9;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = objc_msgSend(a1, "hf_visibleServices");
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          unsigned int v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "hf_isOnForContextType:", a4) != a3
            || objc_msgSend(v15, "hf_shouldBeOnForContextType:", a4) != a3)
          {
            v16 = HFLogForCategory(0);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413314;
              v26 = v15;
              __int16 v27 = 2112;
              v28 = (const char *)a1;
              __int16 v29 = 2080;
              *(void *)v30 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
              *(_WORD *)&v30[8] = 1024;
              *(_DWORD *)&v30[10] = a3;
              __int16 v31 = 2048;
              uint64_t v32 = a4;
              _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Also update service:%@ parentAccessory: %@ in %s to %{BOOL}d for context %lu", buf, 0x30u);
            }

            v17 = objc_msgSend(v15, "hf_updateValue:forContextType:", a3, a4);
            [v8 addObject:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v12);
    }

    uint64_t v9 = v20;
  }
  v18 = [MEMORY[0x263F58190] chainFutures:v8];

  return v18;
}

- (id)hf_updateValueForCurrentObjectOnly:()HFIncludedContextProtocol forContextType:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v18 = a1;
    __int16 v19 = 2080;
    uint64_t v20 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValueForCurrentObjectOnly:forContextType:]";
    __int16 v21 = 1024;
    int v22 = a3;
    __int16 v23 = 2048;
    uint64_t v24 = a4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  switch(a4)
  {
    case 0:
      uint64_t v8 = [a1 applicationData];
      uint64_t v9 = [NSNumber numberWithBool:a3];
      v10 = @"HFApplicationDataAccessoryIsFavoriteKey";
      goto LABEL_17;
    case 1:
      if ((objc_msgSend(a1, "hf_shouldHideForContextType:", 1) & 1) == 0)
      {
        uint64_t v8 = [a1 applicationData];
        uint64_t v9 = [NSNumber numberWithBool:a3];
        v10 = @"HFApplicationDataAccessoryIsVisibleInHomeStatusKey";
        goto LABEL_17;
      }
      uint64_t v11 = HFLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(a1, "hf_prettyDescription");
        unsigned int v15 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v18 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValueForCurrentObjectOnly:forContextType:]";
        __int16 v19 = 2112;
        uint64_t v20 = v15;
        _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "(%s) Attempting to update unsupported accessory's include in status value: %@", buf, 0x16u);
      }
      goto LABEL_13;
    case 2:
      if (objc_msgSend(a1, "hf_isCamera"))
      {
        uint64_t v12 = HFLogForCategory(0);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "-[HMAccessory(HFIncludedContextProtocol) hf_updateValueForCurrentObjectOnly:forContextType:]";
          _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "(%s) Attempting to update camera accessory's favorite value.", buf, 0xCu);
        }

LABEL_13:
        uint64_t v13 = [MEMORY[0x263F58190] futureWithNoResult];
      }
      else
      {
        uint64_t v8 = [a1 applicationData];
        uint64_t v9 = [NSNumber numberWithBool:a3];
        v10 = @"HFApplicationDataAccessoryIsFavoriteKey_v2";
LABEL_17:
        HFAppDataSetValueIfChanged(v8, v10, v9);

LABEL_18:
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __92__HMAccessory_HFIncludedContextProtocol__hf_updateValueForCurrentObjectOnly_forContextType___block_invoke;
        v16[3] = &unk_26408CD50;
        v16[4] = a1;
        uint64_t v13 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v16];
      }
      return v13;
    case 3:
      uint64_t v8 = [a1 applicationData];
      uint64_t v9 = [NSNumber numberWithBool:a3];
      v10 = @"HFApplicationDataAccessoryShowInHomeDashboard";
      goto LABEL_17;
    default:
      goto LABEL_18;
  }
}

@end
@interface HMActionSet(HFIncludedContextProtocol)
- (BOOL)hf_hasSetForContextType:()HFIncludedContextProtocol;
- (BOOL)hf_shouldHideForContextType:()HFIncludedContextProtocol;
- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:;
- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol;
- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol;
@end

@implementation HMActionSet(HFIncludedContextProtocol)

- (uint64_t)hf_shouldBeOnForContextType:()HFIncludedContextProtocol
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      v5 = HFLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315138;
        v9 = "-[HMActionSet(HFIncludedContextProtocol) hf_shouldBeOnForContextType:]";
        _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "(%s) Favoriting is not applicable to ActionSets", (uint8_t *)&v8, 0xCu);
      }
    }
    else if (!a3)
    {
      if ((objc_msgSend(a1, "hf_isOnForContextType:") & 1) == 0) {
        return objc_msgSend(a1, "hf_hasSetForContextType:", 0) ^ 1;
      }
      return 1;
    }
    return 0;
  }
  if (objc_msgSend(a1, "hf_hasSetForContextType:"))
  {
    v6 = a1;
    uint64_t v7 = 3;
  }
  else
  {
    if (!objc_msgSend(a1, "hf_hasSetForContextType:", 0)) {
      return 1;
    }
    v6 = a1;
    uint64_t v7 = 0;
  }
  return objc_msgSend(v6, "hf_isOnForContextType:", v7);
}

- (BOOL)hf_hasSetForContextType:()HFIncludedContextProtocol
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3 == 3)
  {
    v3 = [a1 applicationData];
    v4 = v3;
    v5 = @"HFApplicationDataActionSetShowInHomeDashboard";
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    int v8 = HFLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[HMActionSet(HFIncludedContextProtocol) hf_hasSetForContextType:]";
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "(%s) Action sets are not favoritable. Returning NO.", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
  if (a3) {
    return 0;
  }
  v3 = [a1 applicationData];
  v4 = v3;
  v5 = @"HFApplicationDataActionSetIsFavoriteKey";
LABEL_6:
  v6 = [v3 objectForKeyedSubscript:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

- (uint64_t)hf_isOnForContextType:()HFIncludedContextProtocol
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 3:
      v3 = [a1 applicationData];
      v4 = v3;
      v5 = @"HFApplicationDataActionSetShowInHomeDashboard";
      goto LABEL_6;
    case 2:
      v9 = HFLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315138;
        v11 = "-[HMActionSet(HFIncludedContextProtocol) hf_isOnForContextType:]";
        _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "(%s) Action sets are not favoritable", (uint8_t *)&v10, 0xCu);
      }

      break;
    case 0:
      v3 = [a1 applicationData];
      v4 = v3;
      v5 = @"HFApplicationDataActionSetIsFavoriteKey";
LABEL_6:
      v6 = [v3 objectForKeyedSubscript:v5];
      uint64_t v7 = [v6 BOOLValue];

      return v7;
  }
  return 0;
}

- (BOOL)hf_shouldHideForContextType:()HFIncludedContextProtocol
{
  return (unint64_t)(a3 - 1) < 2;
}

- (id)hf_updateValue:()HFIncludedContextProtocol forContextType:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v7 = HFLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v15 = a1;
    __int16 v16 = 2080;
    v17 = "-[HMActionSet(HFIncludedContextProtocol) hf_updateValue:forContextType:]";
    __int16 v18 = 1024;
    int v19 = a3;
    __int16 v20 = 2048;
    uint64_t v21 = a4;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "(%@:%s) Updating value to %{BOOL}d for context %lu", buf, 0x26u);
  }

  switch(a4)
  {
    case 0:
      int v8 = [a1 applicationData];
      v9 = [NSNumber numberWithBool:a3];
      int v10 = @"HFApplicationDataActionSetIsFavoriteKey";
      goto LABEL_9;
    case 1:
      NSLog(&cfstr_ActionSetsCann.isa);
      break;
    case 2:
      NSLog(&cfstr_ActionSetsAreN.isa);
      break;
    case 3:
      int v8 = [a1 applicationData];
      v9 = [NSNumber numberWithBool:a3];
      int v10 = @"HFApplicationDataActionSetShowInHomeDashboard";
LABEL_9:
      HFAppDataSetValueIfChanged(v8, v10, v9);

      break;
    default:
      break;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__HMActionSet_HFIncludedContextProtocol__hf_updateValue_forContextType___block_invoke;
  v13[3] = &unk_26408CD50;
  v13[4] = a1;
  v11 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v13];
  return v11;
}

@end
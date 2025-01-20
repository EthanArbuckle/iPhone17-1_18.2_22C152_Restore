@interface HFMediaAccessoryUtility
+ (id)sharedInstance;
- (BOOL)checkIfAccessoryisPartofHomeAndHasLanguageSettings:(id)a3;
- (BOOL)checkIfLanguageSetupIsDoneForAccessory:(id)a3;
- (BOOL)isHomePodRestartInitiated:(id)a3;
- (BOOL)isHomePodRestartingCurrently:(id)a3;
- (HFMediaAccessoryUtility)init;
- (NSMutableArray)uuidTrackingList;
- (NSMutableDictionary)restartStateList;
- (void)markUUIDReachableViaRapport:(id)a3;
- (void)markUUIDUnreachableViaRapport:(id)a3;
- (void)setRestartStateList:(id)a3;
- (void)setUuidTrackingList:(id)a3;
- (void)updateHomePodAccessoryRestartState:(unint64_t)a3 with:(id)a4;
@end

@implementation HFMediaAccessoryUtility

+ (id)sharedInstance
{
  if (_MergedGlobals_275 != -1) {
    dispatch_once(&_MergedGlobals_275, &__block_literal_global_3_19);
  }
  v2 = (void *)qword_26AB2F448;
  return v2;
}

uint64_t __41__HFMediaAccessoryUtility_sharedInstance__block_invoke_2()
{
  v0 = objc_alloc_init(HFMediaAccessoryUtility);
  uint64_t v1 = qword_26AB2F448;
  qword_26AB2F448 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFMediaAccessoryUtility)init
{
  v8.receiver = self;
  v8.super_class = (Class)HFMediaAccessoryUtility;
  v2 = [(HFMediaAccessoryUtility *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uuidTrackingList = v2->_uuidTrackingList;
    v2->_uuidTrackingList = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    restartStateList = v2->_restartStateList;
    v2->_restartStateList = v5;
  }
  return v2;
}

- (BOOL)isHomePodRestartInitiated:(id)a3
{
  id v4 = a3;
  v5 = [(HFMediaAccessoryUtility *)self restartStateList];
  v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v6 integerValue] == 1;
  return (char)v4;
}

- (BOOL)isHomePodRestartingCurrently:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_17;
  }
  v5 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
  if ([v5 count])
  {
  }
  else
  {
    v6 = [(HFMediaAccessoryUtility *)self restartStateList];
    v7 = [v6 objectForKeyedSubscript:v4];

    if (!v7) {
      goto LABEL_17;
    }
  }
  objc_super v8 = [(HFMediaAccessoryUtility *)self restartStateList];
  v9 = [v8 objectForKeyedSubscript:v4];
  uint64_t v10 = [v9 integerValue];

  v11 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
  if ([v11 count])
  {
    v12 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
    char v13 = [v12 containsObject:v4];

    if ((v13 & 1) == 0 && !v10) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v14 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
  int v15 = [v14 containsObject:v4];

  if (!v15 || v10 != 2)
  {
    v17 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
    if ([v17 containsObject:v4])
    {
    }
    else
    {

      if ((unint64_t)(v10 - 1) <= 1)
      {
        BOOL v16 = [(HFMediaAccessoryUtility *)self checkIfAccessoryisPartofHomeAndHasLanguageSettings:v4];
        goto LABEL_18;
      }
    }
LABEL_17:
    BOOL v16 = 0;
    goto LABEL_18;
  }
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

- (void)updateHomePodAccessoryRestartState:(unint64_t)a3 with:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = HFLogForCategory(0);
  objc_super v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v19 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
      v20 = [(HFMediaAccessoryUtility *)self restartStateList];
      int v23 = 136316162;
      v24 = "-[HFMediaAccessoryUtility updateHomePodAccessoryRestartState:with:]";
      __int16 v25 = 2048;
      unint64_t v26 = a3;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      v30 = v19;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_debug_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEBUG, "%s Requesting RestartState %lu Device UUID %@ uuidTrackingList..%@ Restart Tracking List ..%@", (uint8_t *)&v23, 0x34u);
    }
    if (a3 == 1)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInteger:1];
      v9 = [(HFMediaAccessoryUtility *)self restartStateList];
      [v9 setObject:v8 forKeyedSubscript:v6];

      goto LABEL_20;
    }
    uint64_t v10 = [(HFMediaAccessoryUtility *)self restartStateList];
    v11 = [v10 objectForKeyedSubscript:v6];
    uint64_t v12 = [v11 integerValue];

    if (a3 == 3)
    {
      v17 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
      if (![v17 containsObject:v6])
      {
LABEL_17:

        goto LABEL_18;
      }

      if ((unint64_t)(v12 - 1) > 1) {
        goto LABEL_18;
      }
      int v15 = NSNumber;
      uint64_t v16 = 3;
    }
    else
    {
      if (a3 != 2
        || ([(HFMediaAccessoryUtility *)self uuidTrackingList],
            char v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v13 containsObject:v6],
            v13,
            (v14 & 1) != 0)
        || v12 != 1)
      {
LABEL_18:
        objc_super v8 = HFLogForCategory(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v21 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
          v22 = [(HFMediaAccessoryUtility *)self restartStateList];
          int v23 = 136316162;
          v24 = "-[HFMediaAccessoryUtility updateHomePodAccessoryRestartState:with:]";
          __int16 v25 = 2048;
          unint64_t v26 = a3;
          __int16 v27 = 2112;
          id v28 = v6;
          __int16 v29 = 2112;
          v30 = v21;
          __int16 v31 = 2112;
          v32 = v22;
          _os_log_debug_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEBUG, "%s After Requesting RestartState %lu Device UUID %@ uuidTrackingList..%@ Restart Tracking List ..%@", (uint8_t *)&v23, 0x34u);
        }
        goto LABEL_20;
      }
      int v15 = NSNumber;
      uint64_t v16 = 2;
    }
    v17 = [v15 numberWithUnsignedInteger:v16];
    v18 = [(HFMediaAccessoryUtility *)self restartStateList];
    [v18 setObject:v17 forKeyedSubscript:v6];

    goto LABEL_17;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v23 = 136315138;
    v24 = "-[HFMediaAccessoryUtility updateHomePodAccessoryRestartState:with:]";
    _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "%s UUID Parameter cant be NIL", (uint8_t *)&v23, 0xCu);
  }
LABEL_20:
}

- (BOOL)checkIfAccessoryisPartofHomeAndHasLanguageSettings:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v5 = [v4 home];
  id v6 = objc_msgSend(v5, "hf_allHomePodProfileContainers");

  uint64_t v7 = [v6 count];
  objc_super v8 = HFLogForCategory(0);
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
      __int16 v57 = 2112;
      v58 = v6;
      __int16 v59 = 2112;
      id v60 = v3;
      _os_log_debug_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEBUG, "%s HomePod Profiles %@, requesting uuid %@", buf, 0x20u);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v43 = v6;
    uint64_t v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "hf_backingAccessory");
          v17 = [v16 uniqueIdentifier];
          v18 = [v17 UUIDString];
          int v19 = [v18 isEqualToString:v3];

          if (v19)
          {
            v20 = HFLogForCategory(0);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = objc_msgSend(v15, "hf_backingAccessory");
              v22 = [v21 uniqueIdentifier];
              int v23 = [v22 UUIDString];
              *(_DWORD *)buf = 136315650;
              v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
              __int16 v57 = 2112;
              v58 = v23;
              __int16 v59 = 2112;
              id v60 = v3;
              _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "%s Media Profile Containers uuid %@ match against requesting uuid %@", buf, 0x20u);
            }
            v24 = objc_msgSend(v15, "hf_backingAccessory");
            BOOL v25 = [(HFMediaAccessoryUtility *)self checkIfLanguageSetupIsDoneForAccessory:v24];

            if (v25)
            {
              v35 = HFLogForCategory(0);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                v36 = objc_msgSend(v15, "hf_backingAccessory");
                v37 = [v36 uniqueIdentifier];
                v38 = [v37 UUIDString];
                *(_DWORD *)buf = 136315650;
                v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
                __int16 v57 = 2112;
                v58 = v38;
                __int16 v59 = 2112;
                id v60 = v3;
                _os_log_impl(&dword_20B986000, v35, OS_LOG_TYPE_DEFAULT, "%s Solo Media Profile Containers uuid %@ match against requesting uuid %@ and language settings is available", buf, 0x20u);
              }
              BOOL v34 = 1;
              id v6 = v43;
              v9 = v10;
              goto LABEL_34;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v9 = v10;
    uint64_t v26 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v46;
      while (2)
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v9);
          }
          v30 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          __int16 v31 = [v30 uniqueIdentifier];
          v32 = [v31 UUIDString];
          int v33 = [v32 isEqualToString:v3];

          if (v33)
          {
            v39 = HFLogForCategory(0);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              v41 = [v30 uniqueIdentifier];
              v42 = [v41 UUIDString];
              *(_DWORD *)buf = 136315650;
              v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
              __int16 v57 = 2112;
              v58 = v42;
              __int16 v59 = 2112;
              id v60 = v3;
              _os_log_debug_impl(&dword_20B986000, v39, OS_LOG_TYPE_DEBUG, "%s Grouped Media Profile Containers uuid %@ match against requesting uuid %@", buf, 0x20u);
            }
            BOOL v34 = 1;
            goto LABEL_33;
          }
        }
        uint64_t v27 = [v9 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }
    BOOL v34 = 0;
LABEL_33:
    id v6 = v43;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v56 = "-[HFMediaAccessoryUtility checkIfAccessoryisPartofHomeAndHasLanguageSettings:]";
      _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "%s Empty Profiles", buf, 0xCu);
    }
    BOOL v34 = 0;
  }
LABEL_34:

  return v34;
}

- (BOOL)checkIfLanguageSetupIsDoneForAccessory:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 settings];
  v5 = objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", @"root.siri.language");

  id v6 = HFLogForCategory(0);
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[HFMediaAccessoryUtility checkIfLanguageSetupIsDoneForAccessory:]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_debug_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEBUG, "%s Language Settings available %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[HFMediaAccessoryUtility checkIfLanguageSetupIsDoneForAccessory:]";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "%s Language Settings NOT available %@", (uint8_t *)&v9, 0x16u);
  }

  return v5 != 0;
}

- (void)markUUIDReachableViaRapport:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory(0);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __int16 v11 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_debug_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEBUG, "Devices UUID list that are reachable over Rapport prior to adding to list %@. UUID requested to be added..%@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v7 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
    char v8 = [v7 containsObject:v4];

    if ((v8 & 1) == 0)
    {
      int v9 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
      [v9 addObject:v4];
    }
    id v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_debug_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEBUG, "Devices UUID list that are reachable over Rapport after adding to list %@. UUID requested to be added..%@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[HFMediaAccessoryUtility markUUIDReachableViaRapport:]";
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%s UUID Parameter cant be NIL", (uint8_t *)&v12, 0xCu);
  }
}

- (void)markUUIDUnreachableViaRapport:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HFLogForCategory(0);
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
      int v13 = 138412546;
      __int16 v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_debug_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEBUG, "Devices UUID list that are reachable over Rapport prior to removal from list %@. UUID requested to be removed..%@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v7 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
    int v8 = [v7 containsObject:v4];

    if (v8)
    {
      int v9 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
      [v9 removeObject:v4];
    }
    else
    {
      int v9 = HFLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
        int v13 = 136315650;
        __int16 v14 = "-[HFMediaAccessoryUtility markUUIDUnreachableViaRapport:]";
        __int16 v15 = 2112;
        id v16 = v4;
        __int16 v17 = 2112;
        v18 = v12;
        _os_log_error_impl(&dword_20B986000, v9, OS_LOG_TYPE_ERROR, "%s Trying to remove the UUID %@ of accessory which is not there in the list %@", (uint8_t *)&v13, 0x20u);
      }
    }

    id v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      __int16 v11 = [(HFMediaAccessoryUtility *)self uuidTrackingList];
      int v13 = 138412546;
      __int16 v14 = v11;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_debug_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEBUG, "Devices UUID list that are reachable over Rapport after removal from list %@. UUID requested to be removed..%@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315138;
    __int16 v14 = "-[HFMediaAccessoryUtility markUUIDUnreachableViaRapport:]";
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%s UUID Parameter cant be NIL", (uint8_t *)&v13, 0xCu);
  }
}

- (NSMutableArray)uuidTrackingList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuidTrackingList:(id)a3
{
}

- (NSMutableDictionary)restartStateList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRestartStateList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restartStateList, 0);
  objc_storeStrong((id *)&self->_uuidTrackingList, 0);
}

@end
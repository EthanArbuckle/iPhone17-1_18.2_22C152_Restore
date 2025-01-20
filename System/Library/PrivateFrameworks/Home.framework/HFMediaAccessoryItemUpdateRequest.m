@interface HFMediaAccessoryItemUpdateRequest
- (HFCharacteristicValueSource)valueSource;
- (HFMediaAccessoryItemUpdateRequest)init;
- (HFMediaAccessoryItemUpdateRequest)initWithMediaProfileContainer:(id)a3 valueSource:(id)a4;
- (HFMediaProfileContainer)mediaProfile;
- (HFMediaValueSource)mediaValueSource;
- (HMHome)home;
- (id)_disambiguateMultipleAccessoryResponses:(id)a3 forMediaSystem:(id)a4;
- (id)_parentMediaSystem;
- (id)accessories;
- (id)updateWithOptions:(id)a3;
- (void)_appendRestartStatusMessageForAccessory:(id)a3 toResults:(id)a4;
- (void)_appendSplitMediaAccountWarningForAccessory:(id)a3 toResults:(id)a4;
- (void)_appendSplitMediaAccountWarningIfNeededForAccessory:(id)a3 toResults:(id)a4;
@end

@implementation HFMediaAccessoryItemUpdateRequest

- (HFMediaAccessoryItemUpdateRequest)initWithMediaProfileContainer:(id)a3 valueSource:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HFMediaAccessoryLikeItem.m", 63, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v10 = objc_msgSend(v8, "hf_mediaValueSource");

  if (v10)
  {
    if (v9) {
      goto LABEL_5;
    }
  }
  else
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HFMediaAccessoryLikeItem.m", 64, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer.hf_mediaValueSource" object file lineNumber description];

    if (v9) {
      goto LABEL_5;
    }
  }
  v20 = [MEMORY[0x263F08690] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HFMediaAccessoryLikeItem.m", 65, @"Invalid parameter not satisfying: %@", @"valueSource" object file lineNumber description];

LABEL_5:
  v21.receiver = self;
  v21.super_class = (Class)HFMediaAccessoryItemUpdateRequest;
  v11 = [(HFMediaAccessoryItemUpdateRequest *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_valueSource, a4);
    uint64_t v13 = objc_msgSend(v8, "hf_mediaValueSource");
    mediaValueSource = v12->_mediaValueSource;
    v12->_mediaValueSource = (HFMediaValueSource *)v13;

    objc_storeStrong((id *)&v12->_mediaProfile, a3);
    uint64_t v15 = objc_msgSend(v8, "hf_home");
    home = v12->_home;
    v12->_home = (HMHome *)v15;
  }
  return v12;
}

- (HFMediaAccessoryItemUpdateRequest)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithMediaProfileContainer_valueSource_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFMediaAccessoryLikeItem.m", 80, @"%s is unavailable; use %@ instead",
    "-[HFMediaAccessoryItemUpdateRequest init]",
    v5);

  return 0;
}

- (id)updateWithOptions:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  v4 = [(HFMediaAccessoryItemUpdateRequest *)self home];
  v5 = [(HFMediaAccessoryItemUpdateRequest *)self mediaProfile];
  v6 = [(HFMediaAccessoryItemUpdateRequest *)self mediaProfile];
  v7 = objc_msgSend(v6, "hf_home");
  id v8 = +[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:v5 withContextProvider:v7];

  v50 = [(HFMediaAccessoryItemUpdateRequest *)self valueSource];
  v52 = [(HFMediaAccessoryItemUpdateRequest *)self mediaProfile];
  if (objc_msgSend(v4, "hf_isMediaAccessoryProfileValid:"))
  {
    v44 = v8;
    v45 = v4;
    id v9 = [(HFMediaAccessoryItemUpdateRequest *)self _parentMediaSystem];
    v48 = objc_opt_new();
    v49 = self;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id obj = [(HFMediaAccessoryItemUpdateRequest *)self accessories];
    uint64_t v51 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v51)
    {
      uint64_t v47 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v71 != v47) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          v12 = [v11 mediaProfile];
          uint64_t v13 = objc_msgSend(v52, "hf_home");
          v14 = +[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:v12 withContextProvider:v13];

          uint64_t v15 = [v11 mediaProfile];
          objc_opt_class();
          id v16 = v15;
          if (objc_opt_isKindOfClass()) {
            v17 = v16;
          }
          else {
            v17 = 0;
          }
          id v18 = v17;

          v19 = [v18 components];
          v69[0] = MEMORY[0x263EF8330];
          v69[1] = 3221225472;
          v69[2] = __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke;
          v69[3] = &unk_264092038;
          v69[4] = v11;
          v20 = objc_msgSend(v19, "na_firstObjectPassingTest:", v69);
          objc_super v21 = [v20 role];

          if (v21) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v9 == 0;
          }
          if (!v22)
          {
            v23 = [v9 components];
            v68[0] = MEMORY[0x263EF8330];
            v68[1] = 3221225472;
            v68[2] = __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_2;
            v68[3] = &unk_264092038;
            v68[4] = v11;
            v24 = objc_msgSend(v23, "na_firstObjectPassingTest:", v68);
            objc_super v21 = [v24 role];
          }
          v25 = [v16 settings];
          v26 = [v16 mediaSession];
          v27 = (void *)MEMORY[0x263F58190];
          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_3;
          v56[3] = &unk_264097A98;
          id v57 = v52;
          v58 = v11;
          id v59 = v14;
          id v60 = v50;
          id v61 = v25;
          id v62 = v26;
          id v63 = v18;
          id v64 = v9;
          id v65 = v16;
          id v66 = v21;
          v67 = v49;
          id v28 = v21;
          id v29 = v16;
          id v30 = v18;
          id v31 = v26;
          id v32 = v25;
          id v33 = v14;
          v34 = [v27 futureWithBlock:v56];
          [v48 addObject:v34];
        }
        uint64_t v51 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
      }
      while (v51);
    }

    v35 = (void *)MEMORY[0x263F58190];
    v36 = [MEMORY[0x263F581B8] mainThreadScheduler];
    v37 = [v35 combineAllFutures:v48 ignoringErrors:1 scheduler:v36];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_4;
    v53[3] = &unk_26408E4B8;
    v53[4] = v49;
    id v54 = v9;
    id v8 = v44;
    id v55 = v44;
    id v38 = v9;
    v39 = [v37 flatMap:v53];

    v4 = v45;
  }
  else
  {
    v40 = (void *)MEMORY[0x263F58190];
    v41 = [HFMediaAccessoryItemUpdateResponse alloc];
    v42 = [(HFMediaAccessoryItemUpdateResponse *)v41 initWithDisplayMetadata:v8 standardResults:MEMORY[0x263EFFA78]];
    v39 = [v40 futureWithResult:v42];
  }
  return v39;
}

uint64_t __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 mediaProfile];
  v4 = [*(id *)(a1 + 32) mediaProfile];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 mediaProfile];
  v4 = [*(id *)(a1 + 32) mediaProfile];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = (id)objc_opt_new();
  v4 = +[HFServiceLikeItemResultFactory populateStandardResultsForHomeKitObject:*(void *)(a1 + 32) withBackingAccessory:*(void *)(a1 + 40) displayMetadata:*(void *)(a1 + 48) readResponse:0 batteryLevelResults:0 valueSource:*(void *)(a1 + 56) updateOptions:0];
  [v13 addEntriesFromDictionary:v4];
  uint64_t v5 = [v13 objectForKey:@"dependentHomeKitObjects"];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  objc_msgSend(v9, "na_safeAddObject:", *(void *)(a1 + 64));
  objc_msgSend(v9, "na_safeAddObject:", *(void *)(a1 + 40));
  objc_msgSend(v9, "na_safeAddObject:", *(void *)(a1 + 72));
  objc_msgSend(v9, "na_safeAddObject:", *(void *)(a1 + 80));
  objc_msgSend(v9, "na_safeAddObject:", *(void *)(a1 + 88));
  objc_msgSend(v9, "na_safeAddObject:", *(void *)(a1 + 96));
  v10 = objc_msgSend(*(id *)(a1 + 40), "hf_softwareUpdateDependentObjects");
  [v9 unionSet:v10];

  [v13 setObject:v9 forKeyedSubscript:@"dependentHomeKitObjects"];
  v11 = *(void **)(a1 + 104);
  if (v11)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "type"));
    [v13 setObject:v12 forKeyedSubscript:@"HFMediaAccessoryItemSpeakerRoleKey"];
  }
  [*(id *)(a1 + 112) _appendSplitMediaAccountWarningIfNeededForAccessory:*(void *)(a1 + 40) toResults:v13];
  [*(id *)(a1 + 112) _appendRestartStatusMessageForAccessory:*(void *)(a1 + 40) toResults:v13];
  [v3 finishWithResult:v13];
}

id __55__HFMediaAccessoryItemUpdateRequest_updateWithOptions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _disambiguateMultipleAccessoryResponses:a2 forMediaSystem:*(void *)(a1 + 40)];
  if (!v3) {
    id v3 = objc_opt_new();
  }
  v4 = [[HFMediaAccessoryItemUpdateResponse alloc] initWithDisplayMetadata:*(void *)(a1 + 48) standardResults:v3];
  uint64_t v5 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v5;
}

- (id)_disambiguateMultipleAccessoryResponses:(id)a3 forMediaSystem:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] > 1)
  {
    if ((unint64_t)[v6 count] < 3)
    {
      id v16 = [v7 home];
      uint64_t v17 = +[HFCharacteristicValueDisplayMetadata displayMetadataForMediaProfile:v7 withContextProvider:v16];

      id v18 = [(HFMediaAccessoryItemUpdateRequest *)self valueSource];
      uint64_t v19 = +[HFServiceLikeItemResultFactory populateStandardResultsForHomeKitObject:v7 withBackingAccessory:0 displayMetadata:v17 readResponse:0 batteryLevelResults:0 valueSource:v18 updateOptions:0];

      v49 = (void *)v17;
      id v50 = v7;
      if (_MergedGlobals_281 != -1) {
        dispatch_once(&_MergedGlobals_281, &__block_literal_global_58_2);
      }
      id v20 = (id)qword_26AB2F5C8;
      objc_super v21 = objc_opt_new();
      uint64_t v47 = v20;
      [v21 setKeysToSkip:v20];
      BOOL v22 = [v6 firstObject];
      v23 = [v6 lastObject];
      v46 = v21;
      v24 = [v21 combineResultDictionary:v22 withResultDictionary:v23 reconcilationHandler:&__block_literal_global_64_2];
      id v13 = (void *)[v24 mutableCopy];

      v25 = [MEMORY[0x263EFF9C0] set];
      id v51 = v6;
      v26 = [v6 arrayByAddingObject:v19];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v59 != v29) {
              objc_enumerationMutation(v26);
            }
            id v31 = [*(id *)(*((void *)&v58 + 1) + 8 * i) objectForKeyedSubscript:@"underlyingError"];
            objc_msgSend(v25, "na_safeAddObject:", v31);
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v28);
      }
      v48 = (void *)v19;
      id v32 = +[HFCharacteristicValueDisplayError mostEgregiousError:v25];
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __92__HFMediaAccessoryItemUpdateRequest__disambiguateMultipleAccessoryResponses_forMediaSystem___block_invoke_66;
      v56[3] = &unk_26408D2C8;
      id v44 = v32;
      v45 = v26;
      id v57 = v44;
      id v33 = objc_msgSend(v26, "na_firstObjectPassingTest:", v56);
      v63[0] = @"descriptionStyle";
      v63[1] = @"description";
      v63[2] = @"errorDescription";
      v63[3] = @"longErrorDescription";
      v63[4] = @"badge";
      v63[5] = @"priority";
      v63[6] = @"errorMessageButtonTitle";
      v63[7] = @"errorMessageTitle";
      [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:8];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v35 = [v34 countByEnumeratingWithState:&v52 objects:v62 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v53 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v52 + 1) + 8 * j);
            [v13 removeObjectForKey:v39];
            v40 = [v33 allKeys];
            int v41 = [v40 containsObject:v39];

            if (v41)
            {
              v42 = [v33 objectForKeyedSubscript:v39];
              [v13 setObject:v42 forKeyedSubscript:v39];
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v52 objects:v62 count:16];
        }
        while (v36);
      }

      id v7 = v50;
      id v6 = v51;
    }
    else
    {
      v14 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"-[HFMediaAccessoryItemUpdateRequest _disambiguateMultipleAccessoryResponses:forMediaSystem:]"];
      [v14 handleFailureInFunction:v15, @"HFMediaAccessoryLikeItem.m", 179, @"HFMediaAccessoryItem only accepts speaker pairs at this time. %@", v6 file lineNumber description];

      id v13 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    objc_opt_class();
    id v8 = [v6 firstObject];
    id v9 = [v8 objectForKeyedSubscript:@"symptom"];
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    v12 = [(HFMediaAccessoryItemUpdateRequest *)self _parentMediaSystem];
    if (v12 && [v11 type] == 11)
    {
      id v13 = (void *)MEMORY[0x263EFFA78];
    }
    else
    {
      id v13 = [v6 firstObject];
    }
  }
  return v13;
}

void __92__HFMediaAccessoryItemUpdateRequest__disambiguateMultipleAccessoryResponses_forMediaSystem___block_invoke_2()
{
  v4[8] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"serviceNameComponents";
  v4[1] = @"HFMediaAccessoryItemSpeakerRoleKey";
  v4[2] = @"errorDescription";
  v4[3] = @"longErrorDescription";
  v4[4] = @"badge";
  v4[5] = @"priority";
  v4[6] = @"errorMessageButtonTitle";
  v4[7] = @"errorMessageTitle";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:8];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)qword_26AB2F5C8;
  qword_26AB2F5C8 = v2;
}

id __92__HFMediaAccessoryItemUpdateRequest__disambiguateMultipleAccessoryResponses_forMediaSystem___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  id v9 = [v6 objectForKeyedSubscript:@"symptom"];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11 && [v11 type] == 11)
  {
    v12 = [v6 objectForKeyedSubscript:@"errorHandlerURL"];
  }
  else
  {
    id v13 = HFLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412802;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_INFO, "Unable to reconcile key '%@' for firstResult '%@' / secondResult '%@'", (uint8_t *)&v15, 0x20u);
    }

    v12 = 0;
  }

  return v12;
}

BOOL __92__HFMediaAccessoryItemUpdateRequest__disambiguateMultipleAccessoryResponses_forMediaSystem___block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"underlyingError"];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)accessories
{
  uint64_t v2 = [(HFMediaAccessoryItemUpdateRequest *)self mediaProfile];
  id v3 = [v2 accessories];

  return v3;
}

- (id)_parentMediaSystem
{
  id v3 = [(HFMediaAccessoryItemUpdateRequest *)self mediaProfile];
  if ([v3 isItemGroup])
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = [(HFMediaAccessoryItemUpdateRequest *)self home];
    id v6 = [v3 accessories];
    id v7 = [v6 anyObject];
    objc_msgSend(v5, "hf_mediaSystemForAccessory:", v7);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_appendSplitMediaAccountWarningIfNeededForAccessory:(id)a3 toResults:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 mediaProfile];
  int v10 = objc_msgSend(v9, "hf_homePodIsCapableOfShowingSplitAccountError");

  id v11 = [v7 mediaProfile];
  v12 = objc_msgSend(v11, "hf_settingsValueManager");

  id v13 = [v12 valueForSettingAtKeyPath:@"root.home.dismissedHomePodHasNonMemberMediaAccountWarning"];
  int v14 = [v13 BOOLValue];

  int v15 = HFLogForCategory(5uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v25 = self;
    __int16 v26 = 2112;
    uint64_t v27 = v16;
    __int16 v28 = 1024;
    int v29 = v14;
    _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Was the Split Account warning dismissed? [%d]", buf, 0x1Cu);
  }
  if (((v10 ^ 1 | v14) & 1) == 0)
  {
    objc_initWeak((id *)buf, self);
    __int16 v17 = [v7 mediaProfile];
    id v18 = objc_msgSend(v17, "hf_homePodSupportsMultiUserLanguage");

    if (v18)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __99__HFMediaAccessoryItemUpdateRequest__appendSplitMediaAccountWarningIfNeededForAccessory_toResults___block_invoke;
      v20[3] = &unk_264094550;
      objc_copyWeak(v23, (id *)buf);
      id v21 = v7;
      id v22 = v8;
      v23[1] = (id)a2;
      id v19 = (id)[v18 addCompletionBlock:v20];

      objc_destroyWeak(v23);
    }

    objc_destroyWeak((id *)buf);
  }
}

void __99__HFMediaAccessoryItemUpdateRequest__appendSplitMediaAccountWarningIfNeededForAccessory_toResults___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v4)
  {
    id v6 = HFLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v23 = 138412802;
      id v24 = WeakRetained;
      __int16 v25 = 2112;
      __int16 v26 = v7;
      __int16 v27 = 2112;
      __int16 v28 = v4;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%@:%@ Other Error returned %@", (uint8_t *)&v23, 0x20u);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) mediaProfile];
    id v6 = objc_msgSend(v8, "hf_appleMusicCurrentLoggedInAccount");

    id v9 = +[HFAppleMusicHomeAccountManager sharedInstance];
    uint64_t v10 = +[HFHomeKitDispatcher sharedDispatcher];
    id v11 = [(id)v10 home];
    v12 = [v11 uniqueIdentifier];
    id v13 = [v12 UUIDString];
    int v14 = [v9 mediaAccountForHomeIdentifier:v13];

    int v15 = [*(id *)(a1 + 32) mediaProfile];
    LOBYTE(v10) = objc_msgSend(v15, "hf_supportsPreferredMediaUser");

    if ((v10 & 1) == 0)
    {
      if (v14 && v6)
      {
        objc_opt_class();
        id v16 = v14;
        if (objc_opt_isKindOfClass()) {
          __int16 v17 = v16;
        }
        else {
          __int16 v17 = 0;
        }
        id v18 = v17;

        id v19 = [v18 ams_altDSID];
        id v20 = [v6 ams_altDSID];
        char v21 = [v19 isEqualToString:v20];

        if ((v21 & 1) == 0) {
          [WeakRetained _appendSplitMediaAccountWarningForAccessory:*(void *)(a1 + 32) toResults:*(void *)(a1 + 40)];
        }
      }
      else
      {
        id v18 = HFLogForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          id v22 = NSStringFromSelector(*(SEL *)(a1 + 56));
          int v23 = 138413058;
          id v24 = WeakRetained;
          __int16 v25 = 2112;
          __int16 v26 = v22;
          __int16 v27 = 2112;
          __int16 v28 = v6;
          __int16 v29 = 2112;
          uint64_t v30 = v14;
          _os_log_debug_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEBUG, "%@:%@ HomePod [%@] and Home Media [%@] Accounts a nil", (uint8_t *)&v23, 0x2Au);
        }
      }
    }
  }
}

- (void)_appendSplitMediaAccountWarningForAccessory:(id)a3 toResults:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = HFLogForCategory(5uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v10 = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Displaying Split Account Badge", (uint8_t *)&v10, 0x16u);
  }
  id v9 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessorySplitMediaAccountErrorDescription", @"HFMediaAccessorySplitMediaAccountErrorDescription", 1);
  [v6 setObject:v9 forKeyedSubscript:@"detailedControlDescription"];

  [v6 setObject:&unk_26C0F6EE8 forKeyedSubscript:@"badge"];
}

- (void)_appendRestartStatusMessageForAccessory:(id)a3 toResults:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v7, "hf_isHomePod"))
  {
    uint64_t v39 = self;
    id v9 = [v7 mediaProfile];
    int v10 = objc_msgSend(v9, "hf_settingsAdapterManager");
    id v11 = [v10 adapterForIdentifier:@"DeviceOptions"];

    __int16 v12 = [v7 uniqueIdentifier];
    if (v12)
    {
      id v13 = +[HFMediaAccessoryUtility sharedInstance];
      uint64_t v14 = [v7 uniqueIdentifier];
      int v15 = [v14 UUIDString];
      int v16 = [v13 isHomePodRestartingCurrently:v15];
    }
    else
    {
      int v16 = 0;
    }

    __int16 v17 = [v7 uniqueIdentifier];
    if (v17)
    {
      id v18 = +[HFMediaAccessoryUtility sharedInstance];
      id v19 = [v7 uniqueIdentifier];
      id v20 = [v19 UUIDString];
      int v21 = [v18 isHomePodRestartInitiated:v20];
    }
    else
    {
      int v21 = 0;
    }

    id v22 = HFLogForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v35 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413314;
      id v44 = v39;
      __int16 v45 = 2112;
      v46 = v35;
      __int16 v47 = 1024;
      *(_DWORD *)v48 = v21;
      *(_WORD *)&v48[4] = 1024;
      *(_DWORD *)&v48[6] = v16;
      __int16 v49 = 1024;
      int v50 = [v11 isAccessoryReachableOverRapport];
      _os_log_debug_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEBUG, "%@:%@ isHomePodRestartInitiated=[%d], isHomePodRestarting[%d], isAccessoryReachableOverRapport [%d]", buf, 0x28u);
    }
    int v23 = HFLogForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v44 = v39;
      __int16 v45 = 2112;
      v46 = v36;
      __int16 v47 = 2112;
      *(void *)v48 = v8;
      _os_log_debug_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEBUG, "%@:%@ Existing results = [%@]", buf, 0x20u);
    }
    if (v16 && ![v11 isAccessoryReachableOverRapport])
    {
      if (!v21)
      {
LABEL_24:
        id v34 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory", @"HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory", 1);
        [v8 setObject:v34 forKeyedSubscript:@"detailedControlDescription"];

LABEL_25:
        goto LABEL_26;
      }
    }
    else if (!v21 || ([v11 isAccessoryReachableOverRapport] & 1) == 0)
    {
      if (([v11 isAccessoryReachableOverRapport] & v16) == 1)
      {
        id v24 = HFLogForCategory(0);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v37 = [v7 uniqueIdentifier];
          id v38 = [v37 UUIDString];
          *(_DWORD *)buf = 138412290;
          id v44 = v38;
          _os_log_debug_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEBUG, "*** Solo Accessory is reachable over Rapport..%@", buf, 0xCu);
        }
        __int16 v25 = +[HFMediaAccessoryUtility sharedInstance];
        __int16 v26 = [v7 uniqueIdentifier];
        __int16 v27 = [v26 UUIDString];
        [v25 markUUIDReachableViaRapport:v27];

        __int16 v28 = +[HFMediaAccessoryUtility sharedInstance];
        __int16 v29 = [v7 uniqueIdentifier];
        uint64_t v30 = [v29 UUIDString];
        [v28 updateHomePodAccessoryRestartState:3 with:v30];

        uint64_t v31 = [v8 objectForKeyedSubscript:@"longErrorDescription"];
        id v32 = _HFLocalizedStringWithDefaultValue(@"HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory", @"HFMediaAccessoryStateDescriptionCurrentlyRestartingAccessory", 1);
        LODWORD(v30) = [v31 isEqualToString:v32];

        if (v30)
        {
          [v8 removeObjectForKey:@"detailedControlDescription"];
          [v8 removeObjectForKey:@"badge"];
        }
      }
      goto LABEL_25;
    }
    if ([v11 isAccessoryReachableOverRapport])
    {
      dispatch_time_t v33 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __87__HFMediaAccessoryItemUpdateRequest__appendRestartStatusMessageForAccessory_toResults___block_invoke;
      block[3] = &unk_26408D450;
      id v41 = v7;
      v42 = v39;
      dispatch_after(v33, MEMORY[0x263EF83A0], block);
    }
    goto LABEL_24;
  }
LABEL_26:
}

id __87__HFMediaAccessoryItemUpdateRequest__appendRestartStatusMessageForAccessory_toResults___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[HFMediaAccessoryUtility sharedInstance];
  id v3 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v4 = [v3 UUIDString];
  [v2 markUUIDUnreachableViaRapport:v4];

  uint64_t v5 = +[HFMediaAccessoryUtility sharedInstance];
  id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v7 = [v6 UUIDString];
  [v5 updateHomePodAccessoryRestartState:2 with:v7];

  return (id)[*(id *)(a1 + 40) updateWithOptions:MEMORY[0x263EFFA78]];
}

- (HFMediaValueSource)mediaValueSource
{
  return self->_mediaValueSource;
}

- (HMHome)home
{
  return self->_home;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFMediaProfileContainer)mediaProfile
{
  return self->_mediaProfile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfile, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_mediaValueSource, 0);
}

@end
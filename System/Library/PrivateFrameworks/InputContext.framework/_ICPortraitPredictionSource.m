@interface _ICPortraitPredictionSource
- (BOOL)_populateError:(id *)a3 withExplanations:(id)a4;
- (BOOL)doesSupportTriggerSourceType:(unsigned __int8)a3;
- (PPQuickTypeBroker)ppBroker;
- (_ICPortraitPredictionSource)init;
- (id)_makePPQuickTypeBroker;
- (id)_quickTypeQueryWithQuery:(id)a3 limit:(unint64_t)a4 timeoutInMilliseconds:(unint64_t)a5;
- (id)_quickTypeQueryWithTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 errorWithExplanations:(id *)a7;
- (id)getPPBroker;
- (id)name;
- (void)getPPBroker;
- (void)hibernate;
- (void)init;
- (void)predictedItemsWithProactiveTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 handler:(id)a7;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)searchForMeCardEmailAddressesWithTimeout:(unint64_t)a3 handler:(id)a4;
- (void)searchForMeCardRegionsWithTimeout:(unint64_t)a3 handler:(id)a4;
- (void)setPpBroker:(id)a3;
- (void)warmUp;
@end

@implementation _ICPortraitPredictionSource

- (void)hibernate
{
  v2 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_235496000, v2, OS_LOG_TYPE_INFO, "_ICPPSource hibernating", v3, 2u);
  }
}

- (void)warmUp
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [(_ICPortraitPredictionSource *)self getPPBroker];
  v3 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v2;
    _os_log_impl(&dword_235496000, v3, OS_LOG_TYPE_INFO, "_ICPPSource warming up %@", buf, 0xCu);
  }

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37___ICPortraitPredictionSource_warmUp__block_invoke;
  v5[3] = &unk_264C55F48;
  id v6 = v2;
  id v4 = v2;
  [v4 warmUpWithCompletion:v5];
}

- (id)getPPBroker
{
  v3 = [(_ICPortraitPredictionSource *)self ppBroker];

  if (v3)
  {
LABEL_2:
    id v4 = [(_ICPortraitPredictionSource *)self ppBroker];
    goto LABEL_3;
  }
  if (![MEMORY[0x263F08B88] isMainThread])
  {
    [(NSCondition *)self->_ppBrokerLoadedCondition lock];
    v7 = [(_ICPortraitPredictionSource *)self ppBroker];

    if (v7)
    {
      [(NSCondition *)self->_ppBrokerLoadedCondition unlock];
    }
    else
    {
      do
      {
        v8 = _ICProactiveQuickTypeOSLogFacility();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          [(_ICPortraitPredictionSource *)&v11 getPPBroker];
        }

        [(NSCondition *)self->_ppBrokerLoadedCondition wait];
        uint64_t v9 = [(_ICPortraitPredictionSource *)self ppBroker];
      }
      while (!v9);
      [(NSCondition *)self->_ppBrokerLoadedCondition unlock];
      v10 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_ICPortraitPredictionSource getPPBroker]();
      }
    }
    goto LABEL_2;
  }
  id v6 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_ICPortraitPredictionSource getPPBroker]();
  }

  id v4 = 0;
LABEL_3:
  return v4;
}

- (PPQuickTypeBroker)ppBroker
{
  return (PPQuickTypeBroker *)objc_getProperty(self, a2, 24, 1);
}

- (_ICPortraitPredictionSource)init
{
  v14.receiver = self;
  v14.super_class = (Class)_ICPortraitPredictionSource;
  v2 = [(_ICPortraitPredictionSource *)&v14 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)@"_ICPortraitPredictionSource";

    v5 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    ppBrokerLoadedCondition = v3->_ppBrokerLoadedCondition;
    v3->_ppBrokerLoadedCondition = v5;

    v7 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[_ICPortraitPredictionSource init]();
    }

    objc_initWeak(&location, v3);
    v8 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35___ICPortraitPredictionSource_init__block_invoke;
    block[3] = &unk_264C56070;
    objc_copyWeak(&v12, &location);
    uint8_t v11 = v3;
    dispatch_async(v8, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)_makePPQuickTypeBroker
{
  if (_makePPQuickTypeBroker_onceToken != -1) {
    dispatch_once(&_makePPQuickTypeBroker_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_makePPQuickTypeBroker_broker;
  return v2;
}

- (id)name
{
  return self->_name;
}

- (BOOL)_populateError:(id *)a3 withExplanations:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *a3;
  if (!*a3)
  {
    uint64_t v13 = 0;
    objc_super v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    id v18 = (id)objc_opt_new();
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63___ICPortraitPredictionSource__populateError_withExplanations___block_invoke;
    v12[3] = &unk_264C56110;
    v12[4] = &v13;
    [v5 enumerateWithBlock:v12];
    if ([(id)v14[5] count])
    {
      v7 = [(id)v14[5] componentsJoinedByString:@" "];
      v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F08320];
      v20[0] = v7;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      *a3 = [v8 errorWithDomain:@"com.apple.inputcontext.errors" code:5 userInfo:v9];

      v10 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_ICPortraitPredictionSource _populateError:withExplanations:]((uint64_t)v7, v10);
      }
    }
    else
    {
      v7 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[_ICPortraitPredictionSource _populateError:withExplanations:]();
      }
    }

    _Block_object_dispose(&v13, 8);
  }

  return v6 == 0;
}

- (id)_quickTypeQueryWithQuery:(id)a3 limit:(unint64_t)a4 timeoutInMilliseconds:(unint64_t)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v29 = 0;
  v27 = @"_ICPPSource_quickTypeQueryWithQuery";
  uint64_t v9 = mach_absolute_time();
  uint64_t v28 = v9;
  v10 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_235496000, v10, OS_LOG_TYPE_INFO, "_ICPPSource _quickTypeQueryWithQuery: %@", (uint8_t *)&buf, 0xCu);
  }

  uint8_t v11 = [(_ICPortraitPredictionSource *)self getPPBroker];
  if (v11)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    id v36 = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __84___ICPortraitPredictionSource__quickTypeQueryWithQuery_limit_timeoutInMilliseconds___block_invoke;
    v24[3] = &unk_264C56138;
    p_long long buf = &buf;
    uint64_t v13 = v12;
    v25 = v13;
    [v11 quickTypeItemsWithQuery:v8 limit:a4 completion:v24];
    dispatch_time_t v14 = dispatch_time(0, 1000000 * a5);
    if (dispatch_semaphore_wait(v13, v14))
    {
      uint64_t v15 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:](a5, v15);
      }

      id v16 = (id)MEMORY[0x263EFFA68];
    }
    else
    {
      id v18 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = [*(id *)(*((void *)&buf + 1) + 40) count];
        *(_DWORD *)v30 = 134217984;
        uint64_t v31 = v19;
        _os_log_impl(&dword_235496000, v18, OS_LOG_TYPE_INFO, "_ICPPSource _quickTypeQueryWithQuery got %lu items", v30, 0xCu);
      }

      id v16 = *(id *)(*((void *)&buf + 1) + 40);
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v17 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:]();
    }

    id v16 = (id)MEMORY[0x263EFFA68];
  }

  uint64_t v20 = mach_absolute_time();
  unint64_t v21 = _ICMachTimeToNanoseconds(v20 - v9);
  v22 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:](v21);
  }

  return v16;
}

- (id)_quickTypeQueryWithTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 errorWithExplanations:(id *)a7
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v51 = a4;
  uint64_t v68 = 0;
  v66 = @"_ICPPSource_quickTypeQueryWithTrigger";
  uint64_t v11 = mach_absolute_time();
  uint64_t v67 = v11;
  dispatch_semaphore_t v12 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_235496000, v12, OS_LOG_TYPE_INFO, "_ICPPSource _quickTypeQueryWithTrigger: %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v13 = [(_ICPortraitPredictionSource *)self getPPBroker];
  if (v13)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__0;
    v75 = __Block_byref_object_dispose__0;
    id v76 = 0;
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__0;
    v64 = __Block_byref_object_dispose__0;
    id v65 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    uint64_t v15 = [v10 attributedString];
    id v16 = [v15 objectForKey:@"contextBeforeInput"];

    int v17 = isPqt1ForContactAutofillEnabled();
    if (v16) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    if (v18 == 1)
    {
      uint64_t v19 = [v10 contentType];
      if (v19)
      {
        uint64_t v20 = [v10 attributedString];
        unint64_t v21 = [v20 objectForKeyedSubscript:@"contextBeforeInput"];
        BOOL v22 = v21 == 0;

        if (!v22)
        {
          v23 = [v10 contentType];
          char v24 = [v23 isEqualToString:@"email"];

          if (v24)
          {
            uint64_t v25 = 2;
          }
          else
          {
            v32 = [v10 contentType];
            char v33 = [v32 isEqualToString:@"tel"];

            if (v33)
            {
              uint64_t v25 = 1;
            }
            else
            {
              v34 = [v10 contentType];
              int v35 = [v34 isEqualToString:@"street-address"];

              if (v35) {
                uint64_t v25 = 4;
              }
              else {
                uint64_t v25 = 0;
              }
            }
          }
          id v36 = (void *)MEMORY[0x263F5D4E8];
          uint64_t v37 = [v10 attributedString];
          v38 = [v37 objectForKey:@"contextBeforeInput"];
          v71 = v38;
          v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
          v40 = [v36 quickTypeQueryWithType:1 subtype:2 semanticTag:0 fields:v25 time:0 subFields:0 label:0 people:v39 localeIdentifier:0 bundleIdentifier:0 recipients:0];

          v56[0] = MEMORY[0x263EF8330];
          v56[1] = 3221225472;
          v56[2] = __122___ICPortraitPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke;
          v56[3] = &unk_264C56160;
          p_long long buf = &buf;
          v56[4] = self;
          v59 = &v60;
          v57 = v14;
          [v13 quickTypeItemsWithQuery:v40 limit:100 completion:v56];
        }
      }
    }
    else
    {
      uint64_t v28 = [v10 attributedString];
      uint64_t v29 = [v51 locale];
      v30 = [v51 recipients];
      uint64_t v31 = [v51 applicationBundleIdentifier];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __122___ICPortraitPredictionSource__quickTypeQueryWithTrigger_searchContext_limit_timeoutInMilliseconds_errorWithExplanations___block_invoke_2;
      v52[3] = &unk_264C56160;
      v54 = &buf;
      v52[4] = self;
      v55 = &v60;
      v53 = v14;
      [v13 quickTypeItemsWithLanguageModelingTokens:v28 localeIdentifier:v29 recipients:v30 bundleIdentifier:v31 limit:a5 completion:v52];
    }
    dispatch_time_t v41 = dispatch_time(0, 1000000 * a6);
    if (dispatch_semaphore_wait(v14, v41))
    {
      v42 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[_ICPortraitPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:](a6, v42);
      }

      id v27 = (id)MEMORY[0x263EFFA68];
    }
    else
    {
      v43 = _ICProactiveQuickTypeOSLogFacility();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = [*(id *)(*((void *)&buf + 1) + 40) count];
        *(_DWORD *)v69 = 134217984;
        uint64_t v70 = v44;
        _os_log_impl(&dword_235496000, v43, OS_LOG_TYPE_INFO, "_ICPPSource _quickTypeQueryWithTrigger got %lu items", v69, 0xCu);
      }

      if (*a7) {
        *a7 = (id) v61[5];
      }
      id v27 = *(id *)(*((void *)&buf + 1) + 40);
    }

    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v26 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[_ICPortraitPredictionSource _quickTypeQueryWithQuery:limit:timeoutInMilliseconds:]();
    }

    id v27 = (id)MEMORY[0x263EFFA68];
  }

  uint64_t v45 = mach_absolute_time();
  unint64_t v46 = _ICMachTimeToNanoseconds(v45 - v11);
  v47 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
    -[_ICPortraitPredictionSource _quickTypeQueryWithTrigger:searchContext:limit:timeoutInMilliseconds:errorWithExplanations:](v46);
  }

  return v27;
}

- (void)predictedItemsWithProactiveTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 handler:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v28 = a4;
  v26 = (void (**)(id, void *, id))a7;
  v33[3] = 0;
  v33[1] = @"_ICPPPredictionSource_predictedItemsWithProactiveTrigger";
  uint64_t v25 = (void *)mach_absolute_time();
  v33[2] = v25;
  uint64_t v13 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[_ICPortraitPredictionSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:]();
  }

  v33[0] = 0;
  dispatch_semaphore_t v14 = [(_ICPortraitPredictionSource *)self _quickTypeQueryWithTrigger:v12 searchContext:v28 limit:a5 timeoutInMilliseconds:a6 errorWithExplanations:v33];
  id v27 = v33[0];
  uint64_t v15 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = +[_ICPredictedItem predictedItemFromQuickTypeItem:trigger:](_ICPredictedItem, "predictedItemFromQuickTypeItem:trigger:", *(void *)(*((void *)&v29 + 1) + 8 * v19), v12, v25);
        if (v20)
        {
          unint64_t v21 = _ICProactiveQuickTypeOSLogFacility();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            int v35 = v20;
            _os_log_debug_impl(&dword_235496000, v21, OS_LOG_TYPE_DEBUG, "DEBUG:IC:Predictions: PP result: %@", buf, 0xCu);
          }

          [v15 addObject:v20];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v17);
  }

  v26[2](v26, v15, v27);
  uint64_t v22 = mach_absolute_time();
  unint64_t v23 = _ICMachTimeToNanoseconds(v22 - (void)v25);
  char v24 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[_ICPortraitPredictionSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:](v23);
  }
}

- (void)searchForMeCardRegionsWithTimeout:(unint64_t)a3 handler:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  dispatch_time_t v41 = (void (**)(id, void *))a4;
  uint64_t v55 = 0;
  v53 = @"_ICPPPredictionSource_searchForMeCardRegionsWithTimeout";
  uint64_t v40 = mach_absolute_time();
  uint64_t v54 = v40;
  v42 = [MEMORY[0x263F5D4E8] quickTypeQueryWithType:1 subtype:1 semanticTag:0 fields:0x200000 time:0 subFields:0 label:0 people:0 localeIdentifier:0 bundleIdentifier:0 recipients:0];
  id v6 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[_ICPortraitPredictionSource searchForMeCardRegionsWithTimeout:handler:]();
  }

  v7 = [(_ICPortraitPredictionSource *)self _quickTypeQueryWithQuery:v42 limit:10 timeoutInMilliseconds:a3];
  uint64_t v44 = [MEMORY[0x263EFF980] array];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v50;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v50 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v49 + 1) + 8 * v11);
        uint64_t v13 = [v12 label];
        BOOL v14 = [v13 length] == 0;

        if (!v14)
        {
          uint64_t v15 = [v12 value];
          id v16 = [v15 componentsSeparatedByString:@"|"];

          if ([v16 count] == 3)
          {
            uint64_t v17 = [v16 objectAtIndex:0];
            if ([v17 length]) {
              goto LABEL_13;
            }
            uint64_t v18 = [v16 objectAtIndex:1];
            if ([v18 length])
            {

LABEL_13:
LABEL_14:
              uint64_t v19 = [v12 label];
              uint64_t v20 = [v8 objectForKey:v19];

              if (!v20)
              {
                uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
                unint64_t v21 = [v12 label];
                [v8 setObject:v20 forKey:v21];

                uint64_t v22 = [v16 objectAtIndex:0];
                if ([v22 length]) {
                  [v20 setValue:v22 forKey:@"City"];
                }
                unint64_t v23 = [v16 objectAtIndex:1];
                if ([v23 length]) {
                  [v20 setValue:v23 forKey:@"Province"];
                }
                char v24 = [v16 objectAtIndex:2];
                if ([v24 length]) {
                  [v20 setValue:v24 forKey:@"Country"];
                }
              }
            }
            else
            {
              uint64_t v25 = [v16 objectAtIndex:2];
              BOOL v26 = [v25 length] == 0;

              if (!v26) {
                goto LABEL_14;
              }
            }
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v27 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      uint64_t v9 = v27;
    }
    while (v27);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v28 = [v8 allKeys];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(v28);
        }
        uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        char v33 = [v8 objectForKey:v32];
        [v33 setValue:v32 forKey:@"ContactLabel"];
        [v44 addObject:v33];
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v56 count:16];
    }
    while (v29);
  }

  v41[2](v41, v44);
  uint64_t v34 = mach_absolute_time();
  unint64_t v35 = _ICMachTimeToNanoseconds(v34 - v40);
  id v36 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
    -[_ICPortraitPredictionSource searchForMeCardRegionsWithTimeout:handler:](v35);
  }

  if (!v35)
  {
    uint64_t v37 = mach_absolute_time();
    unint64_t v38 = _ICMachTimeToNanoseconds(v37 - v40);
    v39 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      -[_ICPortraitPredictionSource searchForMeCardRegionsWithTimeout:handler:](v38);
    }
  }
}

- (void)searchForMeCardEmailAddressesWithTimeout:(unint64_t)a3 handler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void *))a4;
  uint64_t v26 = 0;
  char v24 = @"_ICPPPredictionSource_searchForMeCardEmailAddressesWithTimeout";
  uint64_t v7 = mach_absolute_time();
  uint64_t v25 = v7;
  id v8 = [MEMORY[0x263F5D4E8] quickTypeQueryWithType:1 subtype:1 semanticTag:0 fields:2 time:0 subFields:0 label:0 people:0 localeIdentifier:0 bundleIdentifier:0 recipients:0];
  uint64_t v9 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[_ICPortraitPredictionSource searchForMeCardEmailAddressesWithTimeout:handler:]();
  }

  uint64_t v10 = [(_ICPortraitPredictionSource *)self _quickTypeQueryWithQuery:v8 limit:10 timeoutInMilliseconds:a3];
  uint64_t v11 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = [*(id *)(*((void *)&v20 + 1) + 8 * v15) value];
        [v11 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v13);
  }

  v6[2](v6, v11);
  uint64_t v17 = mach_absolute_time();
  unint64_t v18 = _ICMachTimeToNanoseconds(v17 - v7);
  uint64_t v19 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[_ICPortraitPredictionSource searchForMeCardEmailAddressesWithTimeout:handler:](v18);
  }
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  int v5 = a5;
  int v6 = a4;
  id v8 = a3;
  if (v6 == 3)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithOfferedString:v8];
LABEL_15:
    uint64_t v10 = v9;
    uint64_t v11 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_ICPortraitPredictionSource provideFeedbackForString:type:style:](v5, v6, v11);
    }

    [(PPQuickTypeBroker *)self->_ppBroker registerFeedback:v10 completion:0];
    goto LABEL_18;
  }
  if (v6 == 1 && v5 == 1)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithExplicitlyEngagedString:v8];
    goto LABEL_15;
  }
  if (v6 == 1 && v5 == 2)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithImplicitlyEngagedString:v8];
    goto LABEL_15;
  }
  if (v6 == 2 && v5 == 1)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithExplicitlyRejectedString:v8];
    goto LABEL_15;
  }
  if (v6 == 2 && v5 == 2)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F5D498]) initWithImplicitlyRejectedString:v8];
    goto LABEL_15;
  }
  uint64_t v10 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[_ICPortraitPredictionSource provideFeedbackForString:type:style:](v6, v5, v10);
  }
LABEL_18:
}

- (BOOL)doesSupportTriggerSourceType:(unsigned __int8)a3
{
  return a3 != 3;
}

- (void)setPpBroker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ppBroker, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_ppBrokerLoadedCondition, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "Getting PP Broker shared instance (asynchrnously)", v2, v3, v4, v5, v6);
}

- (void)getPPBroker
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_235496000, log, OS_LOG_TYPE_DEBUG, "Request for uninitialized PP Broker on a background thread, waiting", buf, 2u);
}

- (void)_populateError:withExplanations:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "ERROR:ProactiveQuickType:IC: No results but no explanation", v2, v3, v4, v5, v6);
}

- (void)_populateError:(uint64_t)a1 withExplanations:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_235496000, a2, OS_LOG_TYPE_DEBUG, "ERROR:ProactiveQuickType:IC: No results with the explantaion: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_quickTypeQueryWithQuery:(unint64_t)a1 limit:timeoutInMilliseconds:.cold.1(unint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235496000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
}

- (void)_quickTypeQueryWithQuery:limit:timeoutInMilliseconds:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_235496000, v0, OS_LOG_TYPE_ERROR, "_ICPPSource failed to get PP Broker!", v1, 2u);
}

- (void)_quickTypeQueryWithQuery:(uint64_t)a1 limit:(NSObject *)a2 timeoutInMilliseconds:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235496000, a2, OS_LOG_TYPE_ERROR, "_ICPPSource _quickTypeQueryWithQuery timed out after %lu ms", (uint8_t *)&v2, 0xCu);
}

- (void)_quickTypeQueryWithTrigger:(unint64_t)a1 searchContext:limit:timeoutInMilliseconds:errorWithExplanations:.cold.1(unint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235496000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
}

- (void)_quickTypeQueryWithTrigger:(uint64_t)a1 searchContext:(NSObject *)a2 limit:timeoutInMilliseconds:errorWithExplanations:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235496000, a2, OS_LOG_TYPE_ERROR, "_ICPPSource _quickTypeQueryWithTrigger timed out after %lu ms", (uint8_t *)&v2, 0xCu);
}

- (void)predictedItemsWithProactiveTrigger:(unint64_t)a1 searchContext:limit:timeoutInMilliseconds:handler:.cold.1(unint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235496000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
}

- (void)predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "DEBUG:IC:predictedItemsWithProactiveTrigger: sending quick type call to PP", v2, v3, v4, v5, v6);
}

- (void)searchForMeCardRegionsWithTimeout:(unint64_t)a1 handler:.cold.1(unint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235496000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
}

- (void)searchForMeCardRegionsWithTimeout:handler:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "DEBUG:IC:searchForMeCardRegionsWithTimeout: sending quick type call to PP", v2, v3, v4, v5, v6);
}

- (void)searchForMeCardEmailAddressesWithTimeout:(unint64_t)a1 handler:.cold.1(unint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_235496000, v1, v2, "_ICScales: %@ took %f seconds", v3, v4, v5, v6, 2u);
}

- (void)searchForMeCardEmailAddressesWithTimeout:handler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "DEBUG:IC:searchForMeCardEmailAddressesWithTimeout: sending quick type call to PP", v2, v3, v4, v5, v6);
}

- (void)provideFeedbackForString:(unsigned __int8)a1 type:(int)a2 style:(os_log_t)log .cold.1(unsigned __int8 a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl(&dword_235496000, log, OS_LOG_TYPE_DEBUG, "Feedback received by _ICPortraitPredictionSource with known type and style: %d / %d", (uint8_t *)v3, 0xEu);
}

- (void)provideFeedbackForString:(int)a1 type:(int)a2 style:(os_log_t)log .cold.2(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_235496000, log, OS_LOG_TYPE_ERROR, "Error: feedback received by _ICPortraitPredictionSource with unknown type or style: %d / %d", (uint8_t *)v3, 0xEu);
}

@end
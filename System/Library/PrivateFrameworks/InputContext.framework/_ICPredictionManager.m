@interface _ICPredictionManager
- (_ICPredictionManager)initWithPredictionSources:(id)a3;
- (_ICResultCache)cache;
- (id)_quickTypePredictionWithTrigger:(id)a3 searchContext:(id)a4 timeoutInMilliseconds:(unint64_t)a5 error:(id *)a6;
- (id)lastCachedResultWithInitialCharacters:(id)a3;
- (id)searchForMeCardEmailAddresses;
- (id)searchForMeCardRegions;
- (id)searchWithTrigger:(id)a3 searchContext:(id)a4 timeoutInMilliseconds:(int)a5 error:(id *)a6;
- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 isResponseDenyListed:(BOOL)a7 shouldDisableAutoCaps:(BOOL)a8 timeoutInMilliseconds:(int)a9 resultLimit:(int)a10 error:(id *)a11;
- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 timeoutInMilliseconds:(int)a7 resultLimit:(int)a8 error:(id *)a9;
- (id)workLocation;
- (void)hibernate;
- (void)propogateMetrics:(id)a3 data:(id)a4;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)reset;
- (void)searchForMeCardEmailAddresses;
- (void)searchForMeCardRegions;
- (void)setLastUsedSource:(id)a3;
- (void)warmUp;
@end

@implementation _ICPredictionManager

- (void)reset
{
  id v2 = [(_ICPredictionManager *)self cache];
  [v2 clear];
}

- (_ICResultCache)cache
{
  return (_ICResultCache *)objc_getProperty(self, a2, 32, 1);
}

- (void)hibernate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "DEBUG:IC:Predictions: hibernate", v2, v3, v4, v5, v6);
}

- (void)warmUp
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "DEBUG:IC:Predictions: warmUp start", v2, v3, v4, v5, v6);
}

- (_ICPredictionManager)initWithPredictionSources:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_ICPredictionManager;
  uint8_t v6 = [(_ICPredictionManager *)&v18 init];
  if (v6)
  {
    v7 = [[_ICResultCache alloc] initWithTTL:180.0];
    cache = v6->_cache;
    v6->_cache = v7;

    if (v5) {
      objc_storeStrong((id *)&v6->_predictionSources, a3);
    }
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);

    v11 = [MEMORY[0x263F08C38] UUID];
    v12 = [v11 UUIDString];
    v13 = [@"com.apple.inputcontext.predictionmanager." stringByAppendingString:v12];

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], v10);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v15;
  }
  return v6;
}

- (id)searchWithTrigger:(id)a3 searchContext:(id)a4 timeoutInMilliseconds:(int)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __84___ICPredictionManager_searchWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke;
  v24[3] = &unk_264C55FD0;
  v24[4] = self;
  id v12 = v10;
  id v25 = v12;
  id v13 = v11;
  id v26 = v13;
  int v27 = a5;
  id v14 = (void (**)(void, void))MEMORY[0x237DDFA40](v24);
  if ([v12 triggerSourceType] == 3) {
    goto LABEL_4;
  }
  dispatch_queue_t v15 = [MEMORY[0x263EFF9D0] null];
  v16 = [v12 attributedString];
  v17 = [v16 objectForKeyedSubscript:*MEMORY[0x263F511B8]];
  int v18 = [v15 isEqual:v17];

  if (!v18)
  {
LABEL_4:
    v20 = ((void (**)(void, id *))v14)[2](v14, a6);
  }
  else
  {
    v19 = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84___ICPredictionManager_searchWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke_2;
    block[3] = &unk_264C55FF8;
    v23 = v14;
    dispatch_async(v19, block);

    v20 = (void *)MEMORY[0x263EFFA68];
  }

  return v20;
}

- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 timeoutInMilliseconds:(int)a7 resultLimit:(int)a8 error:(id *)a9
{
  return -[_ICPredictionManager searchWithTriggers:application:recipient:localeIdentifier:isResponseDenyListed:shouldDisableAutoCaps:timeoutInMilliseconds:resultLimit:error:](self, "searchWithTriggers:application:recipient:localeIdentifier:isResponseDenyListed:shouldDisableAutoCaps:timeoutInMilliseconds:resultLimit:error:", a3, a4, a5, a6, 0, 0, __PAIR64__(a8, a7), a9);
}

- (id)searchWithTriggers:(id)a3 application:(id)a4 recipient:(id)a5 localeIdentifier:(id)a6 isResponseDenyListed:(BOOL)a7 shouldDisableAutoCaps:(BOOL)a8 timeoutInMilliseconds:(int)a9 resultLimit:(int)a10 error:(id *)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  if ([v18 length] || objc_msgSend(v19, "length") || objc_msgSend(v20, "length"))
  {
    v21 = [MEMORY[0x263EFF980] array];
    if ([v19 length]) {
      [v21 addObject:v19];
    }
    v56 = [[_ICSearchContext alloc] initWithLocale:v20 recipients:v21 applicationBundleIdentifier:v18 isResponseContextDenylisted:v12 shouldDisableAutoCaps:v11];
  }
  else
  {
    v56 = 0;
  }
  v51 = v20;
  v52 = v19;
  id v53 = v18;
  v55 = [MEMORY[0x263EFF910] date];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v22 = v17;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v62 objects:v67 count:16];
  id v57 = v22;
  uint64_t v50 = a10;
  if (v23)
  {
    uint64_t v24 = v23;
    id v25 = 0;
    uint64_t v26 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v63 != v26) {
          objc_enumerationMutation(v22);
        }
        v28 = -[_ICResultCache searchWithTrigger:](self->_cache, "searchWithTrigger:", *(void *)(*((void *)&v62 + 1) + 8 * i), v50);
        uint64_t v29 = [v28 count];
        if (v29 >= 1)
        {
          uint64_t v30 = v29;
          if (!v25)
          {
            id v25 = [MEMORY[0x263EFF980] arrayWithCapacity:a10];
          }
          if (v30 >= a10) {
            uint64_t v31 = a10;
          }
          else {
            uint64_t v31 = v30;
          }
          if (v31)
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              v33 = [v28 objectAtIndex:j];
              [v25 addObject:v33];
            }
            id v22 = v57;
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v24);
  }
  else
  {
    id v25 = 0;
  }

  if ([v25 count])
  {
    v34 = v53;
  }
  else
  {
    [(_ICResultCache *)self->_cache clear];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v35 = v22;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v66 count:16];
    v34 = v53;
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v54 = *(void *)v59;
      unint64_t v38 = (int)v50;
      v39 = a11;
      while (2)
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v59 != v54) {
            objc_enumerationMutation(v35);
          }
          v41 = -[_ICPredictionManager searchWithTrigger:searchContext:timeoutInMilliseconds:error:](self, "searchWithTrigger:searchContext:timeoutInMilliseconds:error:", *(void *)(*((void *)&v58 + 1) + 8 * k), v56, a9, v39, v50);
          uint64_t v42 = [v41 count];
          if (v42)
          {
            unint64_t v43 = v42;
            if (!v25)
            {
              id v25 = [MEMORY[0x263EFF980] arrayWithCapacity:v38];
            }
            if (v43 >= v38) {
              unint64_t v44 = v38;
            }
            else {
              unint64_t v44 = v43;
            }
            if (v44)
            {
              for (uint64_t m = 0; m != v44; ++m)
              {
                v46 = [v41 objectAtIndex:m];
                [v25 addObject:v46];
              }
              v39 = a11;
            }
          }
          id v22 = v57;
          if ([v25 count] == v38
            || ([v55 timeIntervalSinceNow], v47 * -1000.0 > (double)a9))
          {

            v34 = v53;
            goto LABEL_49;
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v58 objects:v66 count:16];
        v34 = v53;
        if (v37) {
          continue;
        }
        break;
      }
    }
LABEL_49:
  }
  id v48 = v25;

  return v48;
}

- (id)lastCachedResultWithInitialCharacters:(id)a3
{
  return [(_ICResultCache *)self->_cache searchWithValue:a3];
}

- (id)_quickTypePredictionWithTrigger:(id)a3 searchContext:(id)a4 timeoutInMilliseconds:(unint64_t)a5 error:(id *)a6
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v34 = a4;
  v8 = [v7 attributedString];
  BOOL v9 = v8 == 0;

  id v10 = _ICProactiveQuickTypeOSLogFacility();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11) {
      -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:].cold.4(v7, v10);
    }
  }
  else if (v11)
  {
    -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:].cold.5(v7, v10);
  }

  uint64_t v58 = 0;
  long long v59 = &v58;
  uint64_t v60 = 0x3032000000;
  long long v61 = __Block_byref_object_copy_;
  long long v62 = __Block_byref_object_dispose_;
  id v63 = 0;
  BOOL v12 = a6;
  if (a6) {
    *a6 = 0;
  }
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy_;
  v56 = __Block_byref_object_dispose_;
  id v57 = 0;
  uint64_t v51 = 0;
  v49 = @"_ICPredictionManager_quickTypePredictionWithTrigger";
  uint64_t v31 = mach_absolute_time();
  uint64_t v50 = v31;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v13 = self->_predictionSources;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v45 objects:v66 count:16];
  if (v14)
  {
    uint64_t v16 = *(void *)v46;
    *(void *)&long long v15 = 134217984;
    long long v30 = v15;
LABEL_10:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v46 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
      if (objc_msgSend(v18, "doesSupportTriggerSourceType:", objc_msgSend(v7, "triggerSourceType", v30)))
      {
        dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
        objc_initWeak(&location, self);
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __98___ICPredictionManager__quickTypePredictionWithTrigger_searchContext_timeoutInMilliseconds_error___block_invoke;
        v39[3] = &unk_264C56020;
        v41 = &v52;
        uint64_t v42 = &v58;
        objc_copyWeak(&v43, &location);
        id v20 = v19;
        v40 = v20;
        [v18 predictedItemsWithProactiveTrigger:v7 searchContext:v34 limit:10 timeoutInMilliseconds:a5 handler:v39];
        dispatch_time_t v21 = dispatch_time(0, (uint64_t)((double)a5 / 1000.0 * 1.1 * 1000000000.0));
        if (dispatch_semaphore_wait(v20, v21))
        {
          id v22 = _ICProactiveQuickTypeOSLogFacility();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:](&v37, v38, v22);
          }

          int v23 = 0;
          id v32 = 0;
        }
        else if ([(id)v59[5] count])
        {
          uint64_t v24 = [v18 name];
          [(_ICPredictionManager *)self setLastUsedSource:v24];

          id v25 = _ICProactiveQuickTypeOSLogFacility();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = [(id)v59[5] count];
            *(_DWORD *)buf = v30;
            uint64_t v65 = v26;
            _os_log_debug_impl(&dword_235496000, v25, OS_LOG_TYPE_DEBUG, "DEBUG:IC:Predictions: received prediction source results, count = %lu", buf, 0xCu);
          }

          id v32 = (id)v59[5];
          int v23 = 0;
        }
        else
        {
          int v23 = 1;
        }

        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);

        BOOL v12 = a6;
        if (!v23) {
          break;
        }
      }
      if (v14 == ++v17)
      {
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v45 objects:v66 count:16];
        if (v14) {
          goto LABEL_10;
        }
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:

    if (v12) {
      *a6 = (id) v53[5];
    }
    _ICProactiveQuickTypeOSLogFacility();
    id v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEBUG)) {
      -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:]();
    }
    id v32 = 0;
  }

  uint64_t v27 = mach_absolute_time();
  _ICMachTimeToNanoseconds(v27 - v31);
  v28 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:]();
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v32;
}

- (id)searchForMeCardRegions
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[_ICPredictionManager searchForMeCardRegions].cold.4();
  }

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = self->_predictionSources;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __46___ICPredictionManager_searchForMeCardRegions__block_invoke;
        v18[3] = &unk_264C56048;
        id v20 = &v25;
        id v10 = v9;
        dispatch_semaphore_t v19 = v10;
        [v8 searchForMeCardRegionsWithTimeout:5000 handler:v18];
        dispatch_time_t v11 = dispatch_time(0, 5500000000);
        if (dispatch_semaphore_wait(v10, v11))
        {
          long long v15 = _ICProactiveQuickTypeOSLogFacility();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[_ICPredictionManager searchForMeCardRegions]();
          }

          goto LABEL_22;
        }
        BOOL v12 = [(id)v26[5] count] == 0;

        if (!v12) {
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v32 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if ([(id)v26[5] count])
  {
    id v13 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_ICPredictionManager searchForMeCardRegions]((uint64_t)v31, [(id)v26[5] count], v13);
    }

    id v14 = (id)v26[5];
  }
  else
  {
    uint64_t v16 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_ICPredictionManager _quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:]();
    }

LABEL_22:
    id v14 = (id)MEMORY[0x263EFFA68];
  }
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)searchForMeCardEmailAddresses
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ICProactiveQuickTypeOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[_ICPredictionManager searchForMeCardEmailAddresses].cold.4();
  }

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  uint64_t v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = self->_predictionSources;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __53___ICPredictionManager_searchForMeCardEmailAddresses__block_invoke;
        v18[3] = &unk_264C56048;
        id v20 = &v25;
        id v10 = v9;
        dispatch_semaphore_t v19 = v10;
        [v8 searchForMeCardEmailAddressesWithTimeout:100 handler:v18];
        dispatch_time_t v11 = dispatch_time(0, 110000000);
        if (dispatch_semaphore_wait(v10, v11))
        {
          long long v15 = _ICProactiveQuickTypeOSLogFacility();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[_ICPredictionManager searchForMeCardEmailAddresses]();
          }

          goto LABEL_22;
        }
        BOOL v12 = [(id)v26[5] count] == 0;

        if (!v12) {
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v32 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if ([(id)v26[5] count])
  {
    id v13 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[_ICPredictionManager searchForMeCardEmailAddresses]((uint64_t)v31, [(id)v26[5] count], v13);
    }

    id v14 = (id)v26[5];
  }
  else
  {
    uint64_t v16 = _ICProactiveQuickTypeOSLogFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_ICPredictionManager searchForMeCardEmailAddresses]();
    }

LABEL_22:
    id v14 = (id)MEMORY[0x263EFFA68];
  }
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (id)workLocation
{
  return 0;
}

- (void)setLastUsedSource:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42___ICPredictionManager_setLastUsedSource___block_invoke;
  block[3] = &unk_264C56070;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60___ICPredictionManager_provideFeedbackForString_type_style___block_invoke;
  v11[3] = &unk_264C56098;
  objc_copyWeak(&v13, &location);
  id v12 = v8;
  unsigned __int8 v14 = a4;
  unsigned __int8 v15 = a5;
  id v10 = v8;
  dispatch_async(serialQueue, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46___ICPredictionManager_propogateMetrics_data___block_invoke;
  v11[3] = &unk_264C560C0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lastUsedSource, 0);
  objc_storeStrong((id *)&self->_predictionSources, 0);
}

- (void)_quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_235496000, v0, OS_LOG_TYPE_DEBUG, "_ICScales: %@ took %f seconds", (uint8_t *)v1, 0x16u);
}

- (void)_quickTypePredictionWithTrigger:searchContext:timeoutInMilliseconds:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "DEBUG:IC:Predictions: no prediction results", v2, v3, v4, v5, v6);
}

- (void)_quickTypePredictionWithTrigger:(os_log_t)log searchContext:timeoutInMilliseconds:error:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_235496000, log, OS_LOG_TYPE_ERROR, "_ICPredictionManager quickTypePredictionWithTrigger timeout", buf, 2u);
}

- (void)_quickTypePredictionWithTrigger:(void *)a1 searchContext:(NSObject *)a2 timeoutInMilliseconds:error:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 context];
  int v5 = 134217984;
  uint64_t v6 = [v3 length];
  OUTLINED_FUNCTION_2(&dword_235496000, a2, v4, "DEBUG:IC:Predictions: Searching for quicktype prediction with context len: %tu", (uint8_t *)&v5);
}

- (void)_quickTypePredictionWithTrigger:(void *)a1 searchContext:(NSObject *)a2 timeoutInMilliseconds:error:.cold.5(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 attributedString];
  int v5 = 138412290;
  uint64_t v6 = v3;
  OUTLINED_FUNCTION_2(&dword_235496000, a2, v4, "DEBUG:IC:Predictions: Searching for quicktype prediction with attributes: %@", (uint8_t *)&v5);
}

- (void)searchForMeCardRegions
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "DEBUG:IC:Predictions: searchForMeCardRegions", v2, v3, v4, v5, v6);
}

- (void)searchForMeCardEmailAddresses
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235496000, v0, v1, "DEBUG:IC:Predictions: searchForMeCardEmailAddresses", v2, v3, v4, v5, v6);
}

@end
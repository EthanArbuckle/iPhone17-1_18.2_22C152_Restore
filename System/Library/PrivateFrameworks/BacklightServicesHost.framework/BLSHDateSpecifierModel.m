@interface BLSHDateSpecifierModel
- (BLSHDateSpecifierModel)initWithInactiveBudgetPolicy:(id)a3;
- (BLSHEnvironmentDatesModel)environmentModelForKey:(uint64_t)a1;
- (BOOL)missingAnySpecifiersInDateInterval:(id)a3 forPresentation:(id)a4;
- (id)missingIntervalsForMinimumInterval:(id)a3 requestInterval:(id)a4 ofPresentation:(id)a5;
- (id)updatesAfterSpecifier:(id)a3 coalesceFirstUpdateToNowDate:(id)a4 plusRenderEarlyEpsilon:(double)a5 untilGapOverDuration:(double)a6 coaelscingEpsilon:(double)a7 maximumUpdates:(int64_t)a8 lastValidDate:(id)a9 forPresentation:(id)a10 environmentFilter:(id)a11;
- (void)clearSpecifiersForEnvironment:(id)a3;
- (void)purgeSpecifiersBefore:(id)a3;
- (void)registerSpecifiers:(id)a3 forDateInterval:(id)a4 environment:(id)a5;
@end

@implementation BLSHDateSpecifierModel

- (BLSHDateSpecifierModel)initWithInactiveBudgetPolicy:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLSHDateSpecifierModel;
  v6 = [(BLSHDateSpecifierModel *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_inactiveBudgetPolicy, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:512 capacity:4];
    environmentModels = v7->_environmentModels;
    v7->_environmentModels = (NSMapTable *)v8;
  }
  return v7;
}

- (BOOL)missingAnySpecifiersInDateInterval:(id)a3 forPresentation:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = objc_msgSend(a4, "presentationEntries", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) environment];
        if ([v12 isAlwaysOnEnabledForEnvironment])
        {
          v13 = -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, v12);
          uint64_t v14 = [v13 dateInterval];
          v15 = [v6 intersectionWithDateInterval:v14];

          LOBYTE(v14) = [v15 isEqual:v6];
          if ((v14 & 1) == 0)
          {

            BOOL v16 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (BLSHEnvironmentDatesModel)environmentModelForKey:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v4 = [*(id *)(a1 + 16) objectForKey:v3];
    if (!v4)
    {
      v4 = [[BLSHEnvironmentDatesModel alloc] initWithEnvironment:v3];
      [*(id *)(a1 + 16) setObject:v4 forKey:v3];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)missingIntervalsForMinimumInterval:(id)a3 requestInterval:(id)a4 ofPresentation:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v31 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 expirationDate];
  if (v9)
  {
    uint64_t v10 = [v7 endDate];
    uint64_t v11 = [v10 compare:v9];

    if (v11 == 1)
    {
      v12 = bls_flipbook_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v27 = objc_msgSend(v7, "bls_shortLoggingString");
        v28 = objc_msgSend(v9, "bls_shortLoggingString");
        *(_DWORD *)buf = 134218754;
        v39 = self;
        __int16 v40 = 2114;
        v41 = v27;
        __int16 v42 = 2114;
        v43 = v28;
        __int16 v44 = 2114;
        id v45 = v8;
        _os_log_fault_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_FAULT, "%p minimumInterval:%{public}@ extends past expirationDate:%{public}@ for presentation:%{public}@", buf, 0x2Au);
      }
    }
  }
  v30 = v8;
  v13 = objc_msgSend(v8, "presentationEntries", v9);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v14)
  {
    BOOL v16 = 0;
    goto LABEL_26;
  }
  uint64_t v15 = v14;
  BOOL v16 = 0;
  uint64_t v17 = *(void *)v34;
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v34 != v17) {
        objc_enumerationMutation(v13);
      }
      long long v19 = [*(id *)(*((void *)&v33 + 1) + 8 * v18) environment];
      if ([v19 isAlwaysOnEnabledForEnvironment])
      {
        long long v20 = -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, v19);
        long long v21 = [v20 dateInterval];
        v22 = [v7 intersectionWithDateInterval:v21];

        if (([v22 isEqual:v7] & 1) == 0)
        {
          uint64_t v23 = [v20 missingIntervalForDateInterval:v31];
          if (v23)
          {
            if (!v16)
            {
              BOOL v16 = [MEMORY[0x263EFF980] array];
            }
            [v16 addObject:v23];
          }
        }
        goto LABEL_18;
      }
      long long v20 = bls_flipbook_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v22 = [v19 identifier];
        *(_DWORD *)buf = 134218242;
        v39 = self;
        __int16 v40 = 2114;
        v41 = v22;
        _os_log_debug_impl(&dword_21FCFC000, v20, OS_LOG_TYPE_DEBUG, "%p missingIntervals skipping (alwaysOnDisabled) env:%{public}@", buf, 0x16u);
LABEL_18:
      }
      ++v18;
    }
    while (v15 != v18);
    uint64_t v24 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
    uint64_t v15 = v24;
  }
  while (v24);
LABEL_26:
  v25 = (void *)[v16 copy];

  return v25;
}

- (id)updatesAfterSpecifier:(id)a3 coalesceFirstUpdateToNowDate:(id)a4 plusRenderEarlyEpsilon:(double)a5 untilGapOverDuration:(double)a6 coaelscingEpsilon:(double)a7 maximumUpdates:(int64_t)a8 lastValidDate:(id)a9 forPresentation:(id)a10 environmentFilter:(id)a11
{
  uint64_t v285 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a4;
  id v21 = a9;
  id v22 = a10;
  v226 = (uint64_t (**)(id, void *))a11;
  v213 = v19;
  if (a5 > a7 || v19 == 0) {
    double v24 = a5;
  }
  else {
    double v24 = a7;
  }
  v211 = v20;
  v210 = [v20 dateByAddingTimeInterval:v24];
  v25 = bls_flipbook_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = objc_msgSend(v210, "bls_shortLoggingString");
    v27 = objc_msgSend(v21, "bls_shortLoggingString");
    v28 = objc_msgSend(v22, "bls_shortLoggingString");
    *(_DWORD *)buf = 134220034;
    v273 = self;
    __int16 v274 = 2114;
    *(void *)v275 = v19;
    *(_WORD *)&v275[8] = 2114;
    *(void *)&v275[10] = v26;
    *(_WORD *)&v275[18] = 2048;
    *(double *)&v275[20] = a6;
    *(_WORD *)&v275[28] = 2048;
    *(double *)&v275[30] = a7;
    *(_WORD *)&v275[38] = 2048;
    *(void *)&v275[40] = a8;
    *(_WORD *)&v275[48] = 2114;
    *(void *)&v275[50] = v27;
    *(_WORD *)&v275[58] = 2114;
    *(void *)&v275[60] = v28;
    *(_WORD *)&v275[68] = 1024;
    *(_DWORD *)&v275[70] = v226 != 0;
    _os_log_impl(&dword_21FCFC000, v25, OS_LOG_TYPE_INFO, "%p updates (start) after:%{public}@ coalesceTo:%{public}@ gapDuration:%1.3lg epsilon:%.3lf max:%ld upTo:%{public}@ pres:%{public}@ filtered:%{BOOL}u", buf, 0x58u);
  }
  if (!v211)
  {
    v204 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"nowDate != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHDateSpecifierModel updatesAfterSpecifier:coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:](a2);
    }
    [v204 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD20AD8);
  }
  v29 = [MEMORY[0x263EFF910] distantFuture];
  int v30 = [v29 isEqualToDate:v211];

  if (v30)
  {
    v205 = [NSString stringWithFormat:@"distant future should not be now"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHDateSpecifierModel updatesAfterSpecifier:coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:](a2);
    }
    [v205 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD20B30);
  }
  if (!v22)
  {
    v206 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"presentation != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHDateSpecifierModel updatesAfterSpecifier:coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:](a2);
    }
    [v206 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD20B94);
  }
  aSelector = a2;
  id v220 = v21;
  v227 = [MEMORY[0x263EFF980] array];
  v239 = [MEMORY[0x263EFF9A0] dictionary];
  long long v268 = 0u;
  long long v269 = 0u;
  long long v270 = 0u;
  long long v271 = 0u;
  v217 = v22;
  obuint64_t j = [v22 presentationEntries];
  uint64_t v31 = [obj countByEnumeratingWithState:&v268 objects:v284 count:16];
  v32 = v226;
  if (v31)
  {
    uint64_t v33 = v31;
    uint64_t v34 = *(void *)v269;
    uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v36 = 0;
      uint64_t v242 = v33;
      do
      {
        if (*(void *)v269 != v34) {
          objc_enumerationMutation(obj);
        }
        v37 = [*(id *)(*((void *)&v268 + 1) + 8 * v36) environment];
        if (v32 && (v32[2](v32, v37) & 1) == 0)
        {
          __int16 v42 = bls_flipbook_log();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_26;
          }
          v49 = [v37 identifier];
          *(_DWORD *)buf = 134218242;
          v273 = self;
          __int16 v274 = 2114;
          *(void *)v275 = v49;
          v50 = v42;
          v51 = "%p updates skipping env:%{public}@";
          goto LABEL_29;
        }
        if (([v37 isAlwaysOnEnabledForEnvironment] & 1) == 0)
        {
          __int16 v42 = bls_flipbook_log();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_26;
          }
          v49 = [v37 identifier];
          *(_DWORD *)buf = 134218242;
          v273 = self;
          __int16 v274 = 2114;
          *(void *)v275 = v49;
          v50 = v42;
          v51 = "%p updates skipping (alwaysOnDisabled) env:%{public}@";
LABEL_29:
          _os_log_debug_impl(&dword_21FCFC000, v50, OS_LOG_TYPE_DEBUG, v51, buf, 0x16u);

          goto LABEL_26;
        }
        uint64_t v38 = v34;
        uint64_t v39 = v35 - 1;
        __int16 v40 = [NSNumber numberWithUnsignedInteger:v35 - 1];
        v41 = [v37 identifier];
        [v239 setValue:v40 forKey:v41];

        __int16 v42 = -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, v37);
        v43 = [v42 specifiers];
        __int16 v44 = bls_flipbook_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v52 = [v37 identifier];
          v53 = objc_msgSend(v43, "bls_boundedDescriptionWithMax:transformer:", 6, &__block_literal_global_5);
          *(_DWORD *)buf = 134218498;
          v273 = self;
          __int16 v274 = 2114;
          *(void *)v275 = v52;
          *(_WORD *)&v275[8] = 2114;
          *(void *)&v275[10] = v53;
          _os_log_debug_impl(&dword_21FCFC000, v44, OS_LOG_TYPE_DEBUG, "%p updates env:%{public}@ specifiers:%{public}@", buf, 0x20u);
        }
        id v45 = [v43 objectEnumerator];
        uint64_t v46 = [v45 nextObject];
        v47 = [v42 dateInterval];
        v48 = +[BLSHEnvironmentDatesEnumerator createWithInitialSpecifier:v46 enumerator:v45 dateInterval:v47 environment:v37 sourceModel:v42];
        [v227 addObject:v48];

        v32 = v226;
        uint64_t v34 = v38;
        uint64_t v35 = v39;
        uint64_t v33 = v242;
LABEL_26:

        ++v36;
      }
      while (v33 != v36);
      uint64_t v54 = [obj countByEnumeratingWithState:&v268 objects:v284 count:16];
      uint64_t v33 = v54;
    }
    while (v54);
  }

  v266[0] = MEMORY[0x263EF8330];
  v266[1] = 3221225472;
  v266[2] = __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke_20;
  v266[3] = &unk_264532CE8;
  id v208 = v239;
  id v267 = v208;
  v209 = (void *)MEMORY[0x223C5E2B0](v266);
  uint64_t v55 = [v227 count];
  table = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:512 capacity:v55];
  v56 = v213;
  v57 = v220;
  v58 = v217;
  if (v213)
  {
    long long v264 = 0u;
    long long v265 = 0u;
    long long v262 = 0u;
    long long v263 = 0u;
    v59 = [v213 specifiers];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v262 objects:v283 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v263;
      do
      {
        for (uint64_t i = 0; i != v61; ++i)
        {
          if (*(void *)v263 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = *(void **)(*((void *)&v262 + 1) + 8 * i);
          v65 = [v64 environment];
          int v66 = [v217 containsEnvironment:v65];

          if (v66)
          {
            v67 = [v64 environment];
            [(NSMapTable *)table setObject:v64 forKey:v67];
          }
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v262 objects:v283 count:16];
      }
      while (v61);
    }

    v56 = v213;
  }
  v68 = [v56 presentationDate];
  if (v68)
  {
    id v214 = [v211 earlierDate:v68];
    id v69 = [v210 laterDate:v68];
  }
  else
  {
    id v214 = v211;
    id v69 = v210;
  }
  v215 = 0;
  v216 = v69;
  int v224 = 0;
  int v70 = 0;
  int64_t v237 = 0;
  v221 = 0;
  v212 = 0;
  v218 = v68;
  do
  {
    if (v237 >= a8) {
      break;
    }
    int v240 = (v68 != 0) & (v224 ^ 1);
    if (v240 == 1)
    {
      v243 = [MEMORY[0x263EFF910] distantPast];
      id v71 = v68;
      int v224 = 1;
      int v72 = v70;
    }
    else if (v70)
    {
      char v73 = v70;
      v243 = [MEMORY[0x263EFF910] distantFuture];
      long long v258 = 0u;
      long long v259 = 0u;
      long long v260 = 0u;
      long long v261 = 0u;
      id v74 = v227;
      uint64_t v75 = [v74 countByEnumeratingWithState:&v258 objects:v282 count:16];
      if (v75)
      {
        uint64_t v76 = v75;
        uint64_t v77 = *(void *)v259;
        do
        {
          uint64_t v78 = 0;
          v79 = v243;
          do
          {
            if (*(void *)v259 != v77) {
              objc_enumerationMutation(v74);
            }
            v80 = [*(id *)(*((void *)&v258 + 1) + 8 * v78) specifier];
            v81 = [v80 date];
            uint64_t v82 = [v81 earlierDate:v79];

            ++v78;
            v79 = (void *)v82;
          }
          while (v76 != v78);
          v243 = (void *)v82;
          uint64_t v76 = [v74 countByEnumeratingWithState:&v258 objects:v282 count:16];
        }
        while (v76);
      }

      v83 = [MEMORY[0x263EFF910] distantFuture];
      int v84 = [v243 isEqualToDate:v83];

      if (v84)
      {

        v68 = v218;
        v57 = v220;
        break;
      }
      id v71 = [v243 dateByAddingTimeInterval:a7];
      int v72 = 1;
      v68 = v218;
      LOBYTE(v70) = v73;
      v57 = v220;
    }
    else
    {
      if (v68)
      {
        id v85 = v68;
      }
      else
      {
        id v85 = [MEMORY[0x263EFF910] distantPast];
      }
      v86 = v85;
      id v71 = v216;
      v243 = v86;
      if ([v86 compare:v71] != -1)
      {
        v87 = bls_flipbook_log();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
        {
          v154 = objc_msgSend(v86, "bls_shortLoggingString");
          v155 = objc_msgSend(v71, "bls_shortLoggingString");
          *(_DWORD *)buf = 134218754;
          v273 = self;
          __int16 v274 = 1024;
          *(_DWORD *)v275 = v237;
          *(_WORD *)&v275[4] = 2114;
          *(void *)&v275[6] = v154;
          *(_WORD *)&v275[14] = 2114;
          *(void *)&v275[16] = v155;
          _os_log_debug_impl(&dword_21FCFC000, v87, OS_LOG_TYPE_DEBUG, "%p updates(%d) (skipping initial) valid:(%{public}@->%{public}@)", buf, 0x26u);
        }
        int v88 = 18;
        int v89 = 1;
        goto LABEL_148;
      }
      int v72 = 1;
    }
    int v225 = v72;
    if (v57)
    {
      uint64_t v90 = [v71 earlierDate:v57];

      id v71 = (id)v90;
    }
    char v222 = v70;
    char v219 = v70 ^ 1;
    v91 = bls_flipbook_log();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      v152 = objc_msgSend(v243, "bls_shortLoggingString");
      v153 = objc_msgSend(v71, "bls_shortLoggingString");
      *(_DWORD *)buf = 134219266;
      v273 = self;
      __int16 v274 = 1024;
      *(_DWORD *)v275 = v237;
      *(_WORD *)&v275[4] = 2114;
      *(void *)&v275[6] = v152;
      *(_WORD *)&v275[14] = 2114;
      *(void *)&v275[16] = v153;
      *(_WORD *)&v275[24] = 1024;
      *(_DWORD *)&v275[26] = v240;
      *(_WORD *)&v275[30] = 1024;
      *(_DWORD *)&v275[32] = v219 & 1;
      _os_log_debug_impl(&dword_21FCFC000, v91, OS_LOG_TYPE_DEBUG, "%p updates(%d) (loop) valid:(%{public}@->%{public}@) (skip:%{BOOL}u initial:%{BOOL}u)", buf, 0x32u);
    }
    v87 = [MEMORY[0x263EFF910] distantPast];
    v233 = [MEMORY[0x263EFF910] distantFuture];
    long long v254 = 0u;
    long long v255 = 0u;
    long long v256 = 0u;
    long long v257 = 0u;
    id v92 = v227;
    uint64_t v236 = [v92 countByEnumeratingWithState:&v254 objects:v281 count:16];
    if (!v236)
    {

      char v138 = 0;
      goto LABEL_123;
    }
    char v238 = 0;
    char v229 = 0;
    uint64_t v93 = *(void *)v255;
    v94 = v243;
    id v246 = v71;
    uint64_t v231 = *(void *)v255;
    id v232 = v92;
    do
    {
      for (uint64_t j = 0; j != v236; ++j)
      {
        if (*(void *)v255 != v93) {
          objc_enumerationMutation(v92);
        }
        v96 = *(void **)(*((void *)&v254 + 1) + 8 * j);
        v97 = [v96 specifier];
        v98 = [v97 date];
        id obja = [v96 environment];
        if (!objc_msgSend(v98, "bls_isOnOrAfter:andOnOrBefore:", v94, v71))
        {
          v109 = v97;
          goto LABEL_112;
        }
        v234 = v87;
        v99 = 0;
        while (1)
        {
          v100 = v99;
          v101 = [v96 enumerator];
          v99 = [v101 nextObject];

          v102 = [v99 date];
          v103 = v102;
          if (v102)
          {
            id v104 = v102;
          }
          else
          {
            id v104 = [MEMORY[0x263EFF910] distantFuture];
          }
          v105 = v104;

          if (objc_msgSend(v105, "bls_isOnOrAfter:andOnOrBefore:", v94, v71))
          {
            v106 = bls_flipbook_log();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
            {
              v119 = objc_msgSend(v94, "bls_shortLoggingString");
              v120 = objc_msgSend(v246, "bls_shortLoggingString");
              v121 = [obja identifier];
              *(_DWORD *)buf = 134219778;
              v273 = self;
              __int16 v274 = 1024;
              *(_DWORD *)v275 = v237;
              *(_WORD *)&v275[4] = 2114;
              *(void *)&v275[6] = v97;
              *(_WORD *)&v275[14] = 2114;
              *(void *)&v275[16] = v99;
              *(_WORD *)&v275[24] = 2114;
              *(void *)&v275[26] = v119;
              *(_WORD *)&v275[34] = 2114;
              *(void *)&v275[36] = v120;
              *(_WORD *)&v275[44] = 2048;
              *(double *)&v275[46] = a6;
              *(_WORD *)&v275[54] = 2114;
              *(void *)&v275[56] = v121;
              _os_log_debug_impl(&dword_21FCFC000, v106, OS_LOG_TYPE_DEBUG, "%p updates(%d) (will coaelsce) specifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x4Eu);

              v94 = v243;
              id v71 = v246;
            }

            id v107 = v99;
            goto LABEL_94;
          }
          if (v240)
          {
            id v108 = v97;
          }
          else
          {
            id v108 = [(BLSHInactiveBudgetPolicing_Private *)self->_inactiveBudgetPolicy validateAndChargeFutureSpecifier:v97 nextSpecifier:v99 forEnvironment:obja];
          }
          v109 = v108;
          if (v108)
          {
            v112 = bls_flipbook_log();
            if (!os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_105;
            }
            v228 = objc_msgSend(v94, "bls_shortLoggingString");
            v122 = objc_msgSend(v246, "bls_shortLoggingString");
            uint64_t v123 = [obja identifier];
            *(_DWORD *)buf = 134220034;
            v273 = self;
            __int16 v274 = 1024;
            *(_DWORD *)v275 = v237;
            *(_WORD *)&v275[4] = 2114;
            *(void *)&v275[6] = v109;
            *(_WORD *)&v275[14] = 2114;
            *(void *)&v275[16] = v97;
            *(_WORD *)&v275[24] = 2114;
            *(void *)&v275[26] = v99;
            *(_WORD *)&v275[34] = 2114;
            *(void *)&v275[36] = v228;
            *(_WORD *)&v275[44] = 2114;
            *(void *)&v275[46] = v122;
            *(_WORD *)&v275[54] = 2048;
            *(double *)&v275[56] = a6;
            *(_WORD *)&v275[64] = 2114;
            *(void *)&v275[66] = v123;
            v124 = (void *)v123;
            _os_log_debug_impl(&dword_21FCFC000, v112, OS_LOG_TYPE_DEBUG, "%p updates(%d) (will not coaelsce) validSpecifier:%{public}@ specifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x58u);
            goto LABEL_103;
          }
          v110 = [v99 date];
          int v111 = objc_msgSend(v110, "bls_isOnOrAfter:andOnOrBefore:", v94, v71);

          v112 = bls_flipbook_log();
          BOOL v113 = os_log_type_enabled(v112, OS_LOG_TYPE_INFO);
          if (!v111) {
            break;
          }
          if (v113)
          {
            v114 = objc_msgSend(v243, "bls_shortLoggingString");
            v115 = objc_msgSend(v246, "bls_shortLoggingString");
            v116 = [obja identifier];
            *(_DWORD *)buf = 134219778;
            v273 = self;
            __int16 v274 = 1024;
            *(_DWORD *)v275 = v237;
            *(_WORD *)&v275[4] = 2114;
            *(void *)&v275[6] = v97;
            *(_WORD *)&v275[14] = 2114;
            *(void *)&v275[16] = v99;
            *(_WORD *)&v275[24] = 2114;
            *(void *)&v275[26] = v114;
            *(_WORD *)&v275[34] = 2114;
            *(void *)&v275[36] = v115;
            *(_WORD *)&v275[44] = 2048;
            *(double *)&v275[46] = a6;
            *(_WORD *)&v275[54] = 2114;
            *(void *)&v275[56] = v116;
            _os_log_impl(&dword_21FCFC000, v112, OS_LOG_TYPE_INFO, "%p updates(%d) (exceeded budget - will coaelsce) specifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x4Eu);
          }
          id v117 = v99;

          uint64_t v118 = [v117 date];

          char v238 = 1;
          v94 = v243;
          v98 = (void *)v118;
          if (!v117)
          {
            id v71 = v246;
            goto LABEL_95;
          }
          id v71 = v246;
LABEL_94:
          LOBYTE(v117) = 1;
LABEL_95:

          v97 = v99;
          if ((v117 & 1) == 0)
          {
            v109 = v99;
            goto LABEL_106;
          }
        }
        if (v113)
        {
          v228 = objc_msgSend(v243, "bls_shortLoggingString");
          v122 = objc_msgSend(v246, "bls_shortLoggingString");
          uint64_t v125 = [obja identifier];
          *(_DWORD *)buf = 134219778;
          v273 = self;
          __int16 v274 = 1024;
          *(_DWORD *)v275 = v237;
          *(_WORD *)&v275[4] = 2114;
          *(void *)&v275[6] = v97;
          *(_WORD *)&v275[14] = 2114;
          *(void *)&v275[16] = v99;
          *(_WORD *)&v275[24] = 2114;
          *(void *)&v275[26] = v228;
          *(_WORD *)&v275[34] = 2114;
          *(void *)&v275[36] = v122;
          *(_WORD *)&v275[44] = 2048;
          *(double *)&v275[46] = a6;
          *(_WORD *)&v275[54] = 2114;
          *(void *)&v275[56] = v125;
          v124 = (void *)v125;
          char v238 = 1;
          _os_log_impl(&dword_21FCFC000, v112, OS_LOG_TYPE_INFO, "%p updates(%d) (exceeded budget - will not coaelsce) specifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x4Eu);
LABEL_103:

          v94 = v243;
          goto LABEL_105;
        }
        char v238 = 1;
        v94 = v243;
LABEL_105:

        id v71 = v246;
LABEL_106:
        [v96 setSpecifier:v99];
        v126 = bls_flipbook_log();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
        {
          v132 = objc_msgSend(v94, "bls_shortLoggingString");
          v133 = objc_msgSend(v71, "bls_shortLoggingString");
          v134 = [obja identifier];
          *(_DWORD *)buf = 134219778;
          v273 = self;
          __int16 v274 = 1024;
          *(_DWORD *)v275 = v237;
          *(_WORD *)&v275[4] = 2114;
          *(void *)&v275[6] = v109;
          *(_WORD *)&v275[14] = 2114;
          *(void *)&v275[16] = v99;
          *(_WORD *)&v275[24] = 2114;
          *(void *)&v275[26] = v132;
          *(_WORD *)&v275[34] = 2114;
          *(void *)&v275[36] = v133;
          *(_WORD *)&v275[44] = 2048;
          *(double *)&v275[46] = a6;
          *(_WORD *)&v275[54] = 2114;
          *(void *)&v275[56] = v134;
          _os_log_debug_impl(&dword_21FCFC000, v126, OS_LOG_TYPE_DEBUG, "%p updates(%d) (set enumerater) validSpecifier:%{public}@ nextSpecifier:%{public}@ valid:(%{public}@->%{public}@) gapDuration:%1.3lg env:%{public}@", buf, 0x4Eu);

          id v71 = v246;
        }

        if (v109)
        {
          v127 = [v109 date];
          v128 = [v109 date];
          v129 = +[BLSHEnvironmentDateSpecifier specifierWithPresentationDate:fidelity:environment:userObject:](BLSHEnvironmentDateSpecifier, "specifierWithPresentationDate:fidelity:environment:userObject:", v128, [v109 fidelity], obja, 0);

          [(NSMapTable *)table setObject:v129 forKey:obja];
          uint64_t v130 = [v127 laterDate:v234];

          uint64_t v131 = [v98 earlierDate:v233];

          char v229 = 1;
          v233 = (void *)v131;
          id v71 = v246;
          v87 = v130;
        }
        else
        {
          v87 = v234;
        }
        id v92 = v232;

        uint64_t v93 = v231;
LABEL_112:
      }
      uint64_t v236 = [v92 countByEnumeratingWithState:&v254 objects:v281 count:16];
    }
    while (v236);

    if ((v229 & 1) == 0)
    {
      v57 = v220;
      v58 = v217;
      v68 = v218;
      char v138 = v238;
LABEL_123:
      if (v240)
      {
        v139 = bls_flipbook_log();
        if (!os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_125;
        }
        v141 = objc_msgSend(v243, "bls_shortLoggingString");
        v142 = objc_msgSend(v71, "bls_shortLoggingString");
        *(_DWORD *)buf = 134218754;
        v273 = self;
        __int16 v274 = 1024;
        *(_DWORD *)v275 = v237;
        *(_WORD *)&v275[4] = 2114;
        *(void *)&v275[6] = v141;
        *(_WORD *)&v275[14] = 2114;
        *(void *)&v275[16] = v142;
        v143 = v139;
        v144 = "%p updates(%d) (skip invalid - continuing) valid:(%{public}@->%{public}@)";
      }
      else
      {
        if ((v222 & 1) == 0)
        {
          v145 = v216;

          v139 = bls_flipbook_log();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
          {
            v156 = objc_msgSend(v243, "bls_shortLoggingString");
            objc_msgSend(v71, "bls_shortLoggingString");
            v158 = v157 = v87;
            *(_DWORD *)buf = 134218754;
            v273 = self;
            __int16 v274 = 1024;
            *(_DWORD *)v275 = v237;
            *(_WORD *)&v275[4] = 2114;
            *(void *)&v275[6] = v156;
            *(_WORD *)&v275[14] = 2114;
            *(void *)&v275[16] = v158;
            _os_log_debug_impl(&dword_21FCFC000, v139, OS_LOG_TYPE_DEBUG, "%p updates(%d) (initial invalid - continuing) valid:(%{public}@->%{public}@)", buf, 0x26u);

            v87 = v157;
          }
          int v88 = 18;
LABEL_137:
          v221 = v145;
          goto LABEL_146;
        }
        v139 = bls_flipbook_log();
        BOOL v140 = os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG);
        if ((v138 & 1) == 0)
        {
          if (v140)
          {
            v172 = objc_msgSend(v243, "bls_shortLoggingString");
            v173 = objc_msgSend(v71, "bls_shortLoggingString");
            *(_DWORD *)buf = 134218754;
            v273 = self;
            __int16 v274 = 1024;
            *(_DWORD *)v275 = v237;
            *(_WORD *)&v275[4] = 2114;
            *(void *)&v275[6] = v172;
            *(_WORD *)&v275[14] = 2114;
            *(void *)&v275[16] = v173;
            _os_log_debug_impl(&dword_21FCFC000, v139, OS_LOG_TYPE_DEBUG, "%p updates(%d) (invalid - stopping) valid:(%{public}@->%{public}@)", buf, 0x26u);
          }
          int v88 = 19;
          goto LABEL_146;
        }
        if (!v140)
        {
LABEL_125:
          int v88 = 18;
LABEL_146:

          id v137 = v233;
          goto LABEL_147;
        }
        v141 = objc_msgSend(v243, "bls_shortLoggingString");
        v142 = objc_msgSend(v71, "bls_shortLoggingString");
        *(_DWORD *)buf = 134218754;
        v273 = self;
        __int16 v274 = 1024;
        *(_DWORD *)v275 = v237;
        *(_WORD *)&v275[4] = 2114;
        *(void *)&v275[6] = v141;
        *(_WORD *)&v275[14] = 2114;
        *(void *)&v275[16] = v142;
        v143 = v139;
        v144 = "%p updates(%d) (invalid, exceeded budget - continuing) valid:(%{public}@->%{public}@)";
      }
      _os_log_debug_impl(&dword_21FCFC000, v143, OS_LOG_TYPE_DEBUG, v144, buf, 0x26u);

      goto LABEL_125;
    }
    v57 = v220;
    v58 = v217;
    v68 = v218;
    if (!v221 || (-[NSObject timeIntervalSinceDate:](v87, "timeIntervalSinceDate:"), v135 <= a6))
    {
      if ((v240 & 1) == 0)
      {
        v87 = v87;

        v146 = v215;
        if (!v215)
        {
          v146 = [MEMORY[0x263EFF980] array];
        }
        v147 = NSAllMapTableValues(table);
        v252[0] = MEMORY[0x263EF8330];
        v252[1] = 3221225472;
        v252[2] = __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke_26;
        v252[3] = &unk_264532D10;
        v253 = v209;
        v148 = [v147 sortedArrayUsingComparator:v252];

        v149 = +[BLSHPresentationDateSpecifier specifierWithPresentationDate:v87 specifiers:v148];
        v215 = v146;
        [v146 addObject:v149];
        ++v237;
        uint64_t v150 = [v214 earlierDate:v87];

        v151 = bls_flipbook_log();
        if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
        {
          v163 = objc_msgSend(v243, "bls_shortLoggingString");
          v164 = objc_msgSend(v71, "bls_shortLoggingString");
          v165 = objc_msgSend(v216, "bls_shortLoggingString");
          *(_DWORD *)buf = 134219778;
          v273 = self;
          __int16 v274 = 1024;
          *(_DWORD *)v275 = v237;
          *(_WORD *)&v275[4] = 2114;
          *(void *)&v275[6] = v149;
          *(_WORD *)&v275[14] = 2114;
          *(void *)&v275[16] = v163;
          *(_WORD *)&v275[24] = 2114;
          *(void *)&v275[26] = v164;
          *(_WORD *)&v275[34] = 1024;
          *(_DWORD *)&v275[36] = v219 & 1;
          *(_WORD *)&v275[40] = 2114;
          *(void *)&v275[42] = v165;
          *(_WORD *)&v275[50] = 2048;
          *(double *)&v275[52] = a6;
          _os_log_debug_impl(&dword_21FCFC000, v151, OS_LOG_TYPE_DEBUG, "%p updates(%d) (add) update:%{public}@ valid:(%{public}@->%{public}@) (initial:%{BOOL}u) startingAtDate:%{public}@ gapDuration:%1.3lg", buf, 0x4Au);

          v68 = v218;
          id v71 = v246;
        }
        int v88 = 0;
        v139 = v253;
        v221 = v87;
        id v214 = (id)v150;
        goto LABEL_146;
      }
      v145 = v216;

      v139 = bls_flipbook_log();
      if (os_log_type_enabled(v139, OS_LOG_TYPE_DEBUG))
      {
        v159 = objc_msgSend(v243, "bls_shortLoggingString");
        objc_msgSend(v71, "bls_shortLoggingString");
        v161 = v160 = v87;
        v162 = [v145 bls_shortLoggingString];
        *(_DWORD *)buf = 134219522;
        v273 = self;
        __int16 v274 = 1024;
        *(_DWORD *)v275 = v237;
        *(_WORD *)&v275[4] = 2114;
        *(void *)&v275[6] = v159;
        *(_WORD *)&v275[14] = 2114;
        *(void *)&v275[16] = v161;
        *(_WORD *)&v275[24] = 1024;
        *(_DWORD *)&v275[26] = v219 & 1;
        id v71 = v246;
        *(_WORD *)&v275[30] = 2114;
        *(void *)&v275[32] = v162;
        *(_WORD *)&v275[40] = 2048;
        *(double *)&v275[42] = a6;
        _os_log_debug_impl(&dword_21FCFC000, v139, OS_LOG_TYPE_DEBUG, "%p updates(%d) (skipping) previous=start valid:(%{public}@->%{public}@) (initial:%{BOOL}u) startingAtDate:%{public}@ gapDuration:%1.3lg", buf, 0x40u);

        v87 = v160;
      }
      int v88 = 0;
      goto LABEL_137;
    }
    v136 = bls_flipbook_log();
    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
    {
      v166 = [v221 bls_shortLoggingString];
      objc_msgSend(v233, "bls_shortLoggingString");
      v167 = v235 = v87;
      v168 = [v235 bls_shortLoggingString];
      v169 = objc_msgSend(v243, "bls_shortLoggingString");
      v170 = objc_msgSend(v71, "bls_shortLoggingString");
      v171 = objc_msgSend(v216, "bls_shortLoggingString");
      *(_DWORD *)buf = 134220290;
      v273 = self;
      __int16 v274 = 1024;
      *(_DWORD *)v275 = v237;
      *(_WORD *)&v275[4] = 2114;
      *(void *)&v275[6] = v166;
      *(_WORD *)&v275[14] = 2112;
      *(void *)&v275[16] = v167;
      *(_WORD *)&v275[24] = 2112;
      *(void *)&v275[26] = v168;
      *(_WORD *)&v275[34] = 2114;
      *(void *)&v275[36] = v169;
      *(_WORD *)&v275[44] = 2114;
      *(void *)&v275[46] = v170;
      *(_WORD *)&v275[54] = 1024;
      *(_DWORD *)&v275[56] = v219 & 1;
      *(_WORD *)&v275[60] = 2114;
      *(void *)&v275[62] = v171;
      *(_WORD *)&v275[70] = 2048;
      *(double *)&v275[72] = a6;
      _os_log_debug_impl(&dword_21FCFC000, v136, OS_LOG_TYPE_DEBUG, "%p updates(%d) (gap reached - stopping) previous:%{public}@ earliest:%@ latest:%@ valid:(%{public}@->%{public}@) (initial:%{BOOL}u) startingAtDate:%{public}@ gapDuration:%1.3lg", buf, 0x5Eu);

      v68 = v218;
      id v71 = v246;

      v87 = v235;
    }

    id v137 = v233;
    if (v240)
    {
      v200 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"!isSkipUpdate"];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        v201 = (BLSHDateSpecifierModel *)objc_claimAutoreleasedReturnValue();
        v202 = (objc_class *)objc_opt_class();
        v203 = NSStringFromClass(v202);
        *(_DWORD *)buf = 138544642;
        v273 = v201;
        __int16 v274 = 2114;
        *(void *)v275 = v203;
        *(_WORD *)&v275[8] = 2048;
        *(void *)&v275[10] = self;
        *(_WORD *)&v275[18] = 2114;
        *(void *)&v275[20] = @"BLSHDateSpecifierModel.m";
        *(_WORD *)&v275[28] = 1024;
        *(_DWORD *)&v275[30] = 344;
        *(_WORD *)&v275[34] = 2114;
        *(void *)&v275[36] = v200;
        _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v200 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x21FD20A74);
    }
    int v88 = 19;
    v212 = v137;
LABEL_147:

    int v89 = v225;
LABEL_148:

    int v70 = v89;
  }
  while (v88 != 19);
  v174 = v212;
  if (!v212)
  {
    if (v57)
    {
      id v175 = v57;
    }
    else
    {
      id v175 = [MEMORY[0x263EFF910] distantFuture];
    }
    v174 = v175;
    long long v250 = 0u;
    long long v251 = 0u;
    long long v248 = 0u;
    long long v249 = 0u;
    id v176 = v227;
    uint64_t v177 = [v176 countByEnumeratingWithState:&v248 objects:v280 count:16];
    if (v177)
    {
      uint64_t v178 = v177;
      uint64_t v179 = *(void *)v249;
      id v247 = v176;
      do
      {
        uint64_t v180 = 0;
        v181 = v174;
        do
        {
          if (*(void *)v249 != v179) {
            objc_enumerationMutation(v247);
          }
          v182 = *(void **)(*((void *)&v248 + 1) + 8 * v180);
          v183 = [v182 specifier];
          v184 = [v183 date];
          v185 = [v182 sourceModel];
          v186 = [v185 dateInterval];
          v187 = [v186 endDate];
          v188 = [v184 earlierDate:v187];

          v174 = [v181 earlierDate:v188];

          ++v180;
          v181 = v174;
        }
        while (v178 != v180);
        id v176 = v247;
        uint64_t v178 = [v247 countByEnumeratingWithState:&v248 objects:v280 count:16];
      }
      while (v178);
    }

    v189 = bls_flipbook_log();
    v57 = v220;
    if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
    {
      int v197 = [v176 count];
      v198 = objc_msgSend(v174, "bls_shortLoggingString");
      v199 = objc_msgSend(v216, "bls_shortLoggingString");
      *(_DWORD *)buf = 134219010;
      v273 = self;
      __int16 v274 = 1024;
      *(_DWORD *)v275 = v237;
      *(_WORD *)&v275[4] = 1024;
      *(_DWORD *)&v275[6] = v197;
      *(_WORD *)&v275[10] = 2114;
      *(void *)&v275[12] = v198;
      *(_WORD *)&v275[20] = 2114;
      *(void *)&v275[22] = v199;
      _os_log_debug_impl(&dword_21FCFC000, v189, OS_LOG_TYPE_DEBUG, "%p updates(%d) (no nextStart) - will use earliest of %u environment model end next:%{public}@ startingAtDate:%{public}@", buf, 0x2Cu);
    }
    v58 = v217;
    v68 = v218;
  }
  v190 = v174;
  v191 = [[BLSHPresentationUpdates alloc] initWithStartDate:v214 updates:v215 nextUpdatesStart:v174];
  v192 = bls_flipbook_log();
  if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
  {
    v193 = objc_msgSend(v210, "bls_shortLoggingString");
    v194 = objc_msgSend(v57, "bls_shortLoggingString");
    v195 = objc_msgSend(v216, "bls_shortLoggingString");
    *(_DWORD *)buf = 134220802;
    v273 = self;
    __int16 v274 = 1024;
    *(_DWORD *)v275 = v237;
    *(_WORD *)&v275[4] = 2048;
    *(void *)&v275[6] = v213;
    *(_WORD *)&v275[14] = 2114;
    *(void *)&v275[16] = v193;
    *(_WORD *)&v275[24] = 2048;
    *(double *)&v275[26] = a6;
    *(_WORD *)&v275[34] = 2048;
    *(double *)&v275[36] = a7;
    *(_WORD *)&v275[44] = 2048;
    *(void *)&v275[46] = a8;
    *(_WORD *)&v275[54] = 2114;
    *(void *)&v275[56] = v194;
    *(_WORD *)&v275[64] = 2048;
    *(void *)&v275[66] = v58;
    *(_WORD *)&v275[74] = 1024;
    *(_DWORD *)&v275[76] = v226 != 0;
    __int16 v276 = 2114;
    v277 = v191;
    __int16 v278 = 2114;
    v279 = v195;
    _os_log_impl(&dword_21FCFC000, v192, OS_LOG_TYPE_INFO, "%p updates(%d) (complete) after:%p coalesceTo:%{public}@ gapDuration:%1.3lg epsilon:%.3lf max:%ld upTo:%{public}@ pres:%p filtered:%{BOOL}u result:%{public}@ startingAtDate:%{public}@", buf, 0x72u);
  }

  return v191;
}

uint64_t __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bls_shortLoggingString");
}

uint64_t __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke_20(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 environmentIdentifier];
  v4 = [v2 valueForKey:v3];

  if (v4) {
    uint64_t v5 = [v4 unsignedIntegerValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __202__BLSHDateSpecifierModel_updatesAfterSpecifier_coalesceFirstUpdateToNowDate_plusRenderEarlyEpsilon_untilGapOverDuration_coaelscingEpsilon_maximumUpdates_lastValidDate_forPresentation_environmentFilter___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  unint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7 == v8)
  {
    uint64_t v9 = [v5 environmentIdentifier];
    uint64_t v10 = [v6 environmentIdentifier];
    uint64_t v11 = [v9 compare:v10];
  }
  else if (v7 > v8)
  {
    uint64_t v11 = -1;
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (void)purgeSpecifiersBefore:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(NSMapTable *)self->_environmentModels objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) purgeSpecifiersBefore:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)registerSpecifiers:(id)a3 forDateInterval:(id)a4 environment:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, a5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 registerSpecifiers:v9 forDateInterval:v8];
}

- (void)clearSpecifiersForEnvironment:(id)a3
{
  -[BLSHDateSpecifierModel environmentModelForKey:]((uint64_t)self, a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 clearAllSpecifiers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentModels, 0);

  objc_storeStrong((id *)&self->_inactiveBudgetPolicy, 0);
}

- (void)updatesAfterSpecifier:(const char *)a1 coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatesAfterSpecifier:(const char *)a1 coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)updatesAfterSpecifier:(const char *)a1 coalesceFirstUpdateToNowDate:plusRenderEarlyEpsilon:untilGapOverDuration:coaelscingEpsilon:maximumUpdates:lastValidDate:forPresentation:environmentFilter:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end
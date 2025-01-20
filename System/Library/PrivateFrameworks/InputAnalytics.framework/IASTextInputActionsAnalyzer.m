@interface IASTextInputActionsAnalyzer
+ (IASTextInputActionsAnalyzer)analyzerWithName:(id)a3;
+ (id)getOrInitializeArrayFromArray:(id)a3 forKey:(unint64_t)a4 initCapacity:(unint64_t)a5;
+ (id)getOrInitializeArrayFromDictionary:(id)a3 forKey:(id)a4 initCapacity:(unint64_t)a5;
+ (id)getOrInitializeDictionaryFrom:(id)a3 forKey:(unint64_t)a4 initCapacity:(int64_t)a5;
- (BOOL)shouldBeGarbageCollected;
- (IASTextInputActionsAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4;
- (IASTextInputActionsAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4 eventHandler:(id)a5;
- (IASTextInputActionsAnalyzer)initWithEventHandler:(id)a3;
- (NSDictionary)keyboardTrialParameters;
- (id)computeSessionActionsStringOnSession:(id)a3;
- (id)description;
- (void)consumeAction:(id)a3;
- (void)enumerateAnalytics;
- (void)enumerateTextInputActionsAnalytics:(id)a3;
- (void)increaseCountForAppBundleId:(id)a3 forSource:(int64_t)a4 forActionType:(int64_t)a5 forFlagOptions:(int64_t)a6 forInputModeKey:(id)a7 byAnalyzerEntry:(id)a8;
- (void)reset;
- (void)setKeyboardTrialParameters:(id)a3;
@end

@implementation IASTextInputActionsAnalyzer

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@|%@|%@", v2, self->_name, self->_mostRecentAppBundleId, self->_mostRecentProcessId);
}

- (IASTextInputActionsAnalyzer)initWithEventHandler:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F08C38];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v16.receiver = self;
  v16.super_class = (Class)IASTextInputActionsAnalyzer;
  v7 = [(IASDailyGarbageCollectionAnalyzer *)&v16 initWithAnalyzerSessionId:v6 sessionManagerDelegate:0 eventHandler:v5];

  if (v7)
  {
    name = v7->_name;
    v7->_name = (NSString *)@"TextInputActionsAnalyzer";

    id v9 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v12 = objc_msgSend_initWithCapacity_(v9, v10, 1, v11);
    entries = v7->_entries;
    v7->_entries = (NSMutableDictionary *)v12;

    v14 = sub_252A048AC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_252A10DD0();
    }
  }
  return v7;
}

- (IASTextInputActionsAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)IASTextInputActionsAnalyzer;
  v4 = [(IASDailyGarbageCollectionAnalyzer *)&v16 initWithAnalyzerSessionId:a3 sessionManagerDelegate:a4];
  id v5 = v4;
  if (v4)
  {
    name = v4->_name;
    v4->_name = (NSString *)@"TextInputActionsAnalyzer";

    id v7 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v10 = objc_msgSend_initWithCapacity_(v7, v8, 1, v9);
    entries = v5->_entries;
    v5->_entries = (NSMutableDictionary *)v10;

    objc_msgSend_setEventHandler_(v5, v12, (uint64_t)&unk_2702E38A8, v13);
    v14 = sub_252A048AC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_252A10DD0();
    }
  }
  return v5;
}

- (IASTextInputActionsAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4 eventHandler:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)IASTextInputActionsAnalyzer;
  id v5 = [(IASDailyGarbageCollectionAnalyzer *)&v15 initWithAnalyzerSessionId:a3 sessionManagerDelegate:a4 eventHandler:a5];
  id v6 = v5;
  if (v5)
  {
    name = v5->_name;
    v5->_name = (NSString *)@"TextInputActionsAnalyzer";

    id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v11 = objc_msgSend_initWithCapacity_(v8, v9, 1, v10);
    entries = v6->_entries;
    v6->_entries = (NSMutableDictionary *)v11;

    uint64_t v13 = sub_252A048AC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_252A10DD0();
    }
  }
  return v6;
}

+ (IASTextInputActionsAnalyzer)analyzerWithName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_copy(v3, v5, v6, v7);

  uint64_t v9 = (void *)v4[16];
  v4[16] = v8;

  objc_msgSend_reset(v4, v10, v11, v12);
  return (IASTextInputActionsAnalyzer *)v4;
}

+ (id)getOrInitializeArrayFromDictionary:(id)a3 forKey:(id)a4 initCapacity:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = objc_msgSend_valueForKey_(v7, v9, (uint64_t)v8, v10);
  if (!v11)
  {
    id v12 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v11 = objc_msgSend_initWithCapacity_(v12, v13, a5, v14);
    if (a5)
    {
      unint64_t v18 = a5;
      do
      {
        v19 = objc_msgSend_null(MEMORY[0x263EFF9D0], v15, v16, v17);
        objc_msgSend_addObject_(v11, v20, (uint64_t)v19, v21);

        --v18;
      }
      while (v18);
    }
    objc_msgSend_setObject_forKey_(v7, v15, (uint64_t)v11, (uint64_t)v8);
    v22 = sub_252A048AC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_252A10E04();
    }
  }
  return v11;
}

+ (id)getOrInitializeArrayFromArray:(id)a3 forKey:(unint64_t)a4 initCapacity:(unint64_t)a5
{
  id v9 = a3;
  if (objc_msgSend_count(v9, v10, v11, v12) <= a4)
  {
    objc_super v15 = sub_252A048AC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_252A10ED4(v9, (const char *)a4, (uint64_t)v15, v16);
    }

    if (a4 >= 0x14)
    {
      v20 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v17, v18, v19);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, (uint64_t)a1, @"IASTextInputActionsAnalyzer.m", 261, @"Attempt to access index %lu, which is much larger than expected", a4);
    }
    while (objc_msgSend_count(v9, v17, v18, v19) <= a4)
    {
      v22 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v25, v14);
      objc_msgSend_addObject_(v9, v23, (uint64_t)v22, v24);
    }
  }
  v26 = objc_msgSend_objectAtIndexedSubscript_(v9, v13, a4, v14);
  v30 = objc_msgSend_null(MEMORY[0x263EFF9D0], v27, v28, v29);
  int isEqual = objc_msgSend_isEqual_(v26, v31, (uint64_t)v30, v32);

  if (isEqual)
  {
    id v36 = objc_alloc(MEMORY[0x263EFF980]);
    v42 = objc_msgSend_initWithCapacity_(v36, v37, a5, v38);
    if (a5)
    {
      unint64_t v43 = a5;
      do
      {
        v44 = objc_msgSend_null(MEMORY[0x263EFF9D0], v39, v40, v41);
        objc_msgSend_addObject_(v42, v45, (uint64_t)v44, v46);

        --v43;
      }
      while (v43);
    }
    objc_msgSend_setObject_atIndexedSubscript_(v9, v39, (uint64_t)v42, a4);
    v47 = sub_252A048AC();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      sub_252A10E6C();
    }
  }
  else
  {
    v42 = objc_msgSend_objectAtIndexedSubscript_(v9, v34, a4, v35);
  }

  return v42;
}

+ (id)getOrInitializeDictionaryFrom:(id)a3 forKey:(unint64_t)a4 initCapacity:(int64_t)a5
{
  id v7 = a3;
  uint64_t v10 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, a4, v9);
  uint64_t v14 = objc_msgSend_null(MEMORY[0x263EFF9D0], v11, v12, v13);
  int isEqual = objc_msgSend_isEqual_(v10, v15, (uint64_t)v14, v16);

  if (isEqual)
  {
    id v18 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v21 = objc_msgSend_initWithCapacity_(v18, v19, a5, v20);

    objc_msgSend_setObject_atIndexedSubscript_(v7, v22, v21, a4);
    v23 = sub_252A048AC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_252A10F60();
    }

    uint64_t v10 = (void *)v21;
  }

  return v10;
}

- (void)increaseCountForAppBundleId:(id)a3 forSource:(int64_t)a4 forActionType:(int64_t)a5 forFlagOptions:(int64_t)a6 forInputModeKey:(id)a7 byAnalyzerEntry:(id)a8
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  uint64_t v14 = (__CFString *)a3;
  id v15 = a7;
  id v16 = a8;
  if ((objc_msgSend_isAllZeroes(v16, v17, v18, v19) & 1) == 0)
  {
    if (v15)
    {
      if (!v14) {
        uint64_t v14 = &stru_2702E3F20;
      }
      uint64_t v21 = objc_msgSend_getOrInitializeArrayFromDictionary_forKey_initCapacity_(IASTextInputActionsAnalyzer, v20, (uint64_t)self->_entries, (uint64_t)v14, 15);
      v70 = objc_msgSend_getOrInitializeArrayFromArray_forKey_initCapacity_(IASTextInputActionsAnalyzer, v22, (uint64_t)v21, a4, 17);
      v69 = objc_msgSend_getOrInitializeArrayFromArray_forKey_initCapacity_(IASTextInputActionsAnalyzer, v23, (uint64_t)v70, a5, 8);
      v71 = objc_msgSend_getOrInitializeDictionaryFrom_forKey_initCapacity_(IASTextInputActionsAnalyzer, v24, (uint64_t)v69, a6, 1);
      objc_msgSend_objectForKeyedSubscript_(v71, v25, (uint64_t)v15, v26);
      uint64_t v29 = (IASTextInputActionsAnalyzerEntry *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        uint64_t v29 = objc_alloc_init(IASTextInputActionsAnalyzerEntry);
        objc_msgSend_setObject_forKeyedSubscript_(v71, v30, (uint64_t)v29, (uint64_t)v15);
        v31 = sub_252A048AC();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v68 = objc_msgSend_analyzerSessionId(self, v32, v33, v34);
          v66 = objc_msgSend_description(v68, v59, v60, v61);
          *(_DWORD *)buf = 138478851;
          v73 = v66;
          __int16 v74 = 2048;
          int64_t v75 = a4;
          __int16 v76 = 2048;
          int64_t v77 = a5;
          __int16 v78 = 2048;
          int64_t v79 = a6;
          __int16 v80 = 2113;
          id v81 = v15;
          _os_log_debug_impl(&dword_2529F1000, v31, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] New input mode key found - initializing new entry for source:%lu actionType:%lu flagOptions%lu inputMode:\"%{private}@\"", buf, 0x34u);
        }
      }
      objc_msgSend_increaseWithEntry_(v29, v27, (uint64_t)v16, v28);
      uint64_t v35 = sub_252A048AC();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v67 = objc_msgSend_analyzerSessionId(self, v36, v37, v38);
        v42 = objc_msgSend_description(v67, v39, v40, v41);
        uint64_t v65 = objc_msgSend_netCharacters(v16, v43, v44, v45);
        uint64_t v64 = objc_msgSend_userRemovedCharacters(v16, v46, v47, v48);
        uint64_t v63 = objc_msgSend_netEmojiCharacters(v16, v49, v50, v51);
        uint64_t v62 = objc_msgSend_userRemovedEmojiCharacters(v16, v52, v53, v54);
        uint64_t v58 = objc_msgSend_inputActions(v16, v55, v56, v57);
        *(_DWORD *)buf = 138480131;
        v73 = v42;
        __int16 v74 = 2048;
        int64_t v75 = a4;
        __int16 v76 = 2048;
        int64_t v77 = a5;
        __int16 v78 = 2048;
        int64_t v79 = a6;
        __int16 v80 = 2113;
        id v81 = v15;
        __int16 v82 = 2048;
        uint64_t v83 = v65;
        __int16 v84 = 2048;
        uint64_t v85 = v64;
        __int16 v86 = 2048;
        uint64_t v87 = v63;
        __int16 v88 = 2048;
        uint64_t v89 = v62;
        __int16 v90 = 2048;
        uint64_t v91 = v58;
        _os_log_debug_impl(&dword_2529F1000, v35, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] Updated entry for source:%lu actionType:%lu flagOptions%lu inputMode:\"%{private}@\" by netChars:%ld userRemovedChars:%ld netEmojiChars:%ld userRemovedEmojiChars:%ld actions:%ld", buf, 0x66u);
      }
    }
    else
    {
      uint64_t v21 = sub_252A048AC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_252A10FC8();
      }
    }
  }
}

- (void)consumeAction:(id)a3
{
  uint64_t v299 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!v8)
  {
    v267 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v267, v268, (uint64_t)a2, (uint64_t)self, @"IASTextInputActionsAnalyzer.m", 361, @"nil raw action passed to [IASTextInputActionsAnalyzer consumeAction:]");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  uint64_t v14 = v10;
  if (v10)
  {
    id v15 = objc_msgSend_inputMode(v10, v11, v12, v13);

    if (!v15)
    {
      uint64_t v18 = objc_alloc_init(IATextInputActionsInputMode);
      objc_msgSend_setInputMode_(v14, v19, (uint64_t)v18, v20);

      uint64_t v21 = sub_252A048AC();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_252A11070(self, (char *)v14, (uint64_t)v21, v22);
      }
    }
    v23 = objc_msgSend_generateAnalyzerEntryFromAction_(IASTextInputActionsAnalyzerEntry, v16, (uint64_t)v14, v17);
    v27 = objc_msgSend_inputMode(v14, v24, v25, v26);
    uint64_t v31 = objc_msgSend_inputModeUniqueString(v27, v28, v29, v30);

    uint64_t v32 = sub_252A048AC();
    v277 = (void *)v31;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v276 = objc_msgSend_analyzerSessionId(self, v33, v34, v35);
      v269 = objc_msgSend_description(v276, v217, v218, v219);
      *(_DWORD *)buf = 138480131;
      v280 = v269;
      __int16 v281 = 2113;
      unint64_t v282 = (unint64_t)v14;
      __int16 v283 = 2048;
      uint64_t v284 = objc_msgSend_netCharacters(v23, v220, v221, v222);
      __int16 v285 = 2048;
      uint64_t v286 = objc_msgSend_userRemovedCharacters(v23, v223, v224, v225);
      __int16 v287 = 2048;
      uint64_t v288 = objc_msgSend_netEmojiCharacters(v23, v226, v227, v228);
      __int16 v289 = 2048;
      uint64_t v290 = objc_msgSend_userRemovedEmojiCharacters(v23, v229, v230, v231);
      __int16 v291 = 2048;
      uint64_t v292 = objc_msgSend_inputActions(v23, v232, v233, v234);
      __int16 v293 = 2048;
      uint64_t v294 = objc_msgSend_source(v14, v235, v236, v237);
      __int16 v295 = 2048;
      uint64_t v296 = objc_msgSend_textInputActionsType(v14, v238, v239, v240);
      __int16 v297 = 2113;
      uint64_t v298 = v31;
      _os_log_debug_impl(&dword_2529F1000, v32, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] consumeAction(): %{private}@ netCharactersDelta:%ld userRemovedCharactersDelta:%ld netEmojiCharactersDelta:%ld sysRemovedObjectsDelta:%ld inputActionsDelta:%ld for source:%lu type:%lu inputMode:%{private}@", buf, 0x66u);
    }
    v39 = objc_msgSend_appBundleId(v14, v36, v37, v38);
    uint64_t v43 = objc_msgSend_source(v14, v40, v41, v42);
    uint64_t v47 = objc_msgSend_textInputActionsType(v14, v44, v45, v46);
    uint64_t v51 = objc_msgSend_flagOptions(v14, v48, v49, v50);
    objc_msgSend_increaseCountForAppBundleId_forSource_forActionType_forFlagOptions_forInputModeKey_byAnalyzerEntry_(self, v52, (uint64_t)v39, v43, v47, v51, v31, v23);

    uint64_t v56 = objc_msgSend_inputMode(v14, v53, v54, v55);
    uint64_t v60 = objc_msgSend_language(v56, v57, v58, v59);
    if (v60)
    {
    }
    else
    {
      v67 = objc_msgSend_inputMode(v14, v61, v62, v63);
      v71 = objc_msgSend_region(v67, v68, v69, v70);

      if (!v71) {
        goto LABEL_18;
      }
    }
    if (objc_msgSend_source(v14, v64, v65, v66) == 4)
    {
      v72 = objc_msgSend_sessionErrors(self, v64, v65, v66);
      __int16 v76 = objc_msgSend_inputMode(v14, v73, v74, v75);
      __int16 v80 = objc_msgSend_language(v76, v77, v78, v79);
      uint64_t v83 = objc_msgSend_validateLanguage_(IASTextInputActionsErrorChecking, v81, (uint64_t)v80, v82);
      objc_msgSend_logErrorCodeIfNotNil_(v72, v84, (uint64_t)v83, v85);

      uint64_t v89 = objc_msgSend_sessionErrors(self, v86, v87, v88);
      v93 = objc_msgSend_inputMode(v14, v90, v91, v92);
      v97 = objc_msgSend_region(v93, v94, v95, v96);
      v100 = objc_msgSend_validateRegion_(IASTextInputActionsErrorChecking, v98, (uint64_t)v97, v99);
      objc_msgSend_logErrorCodeIfNotNil_(v89, v101, (uint64_t)v100, v102);
    }
LABEL_18:
    v103 = objc_msgSend_asDictationBegan(v14, v64, v65, v66);
    v107 = v103;
    if (v103 && objc_msgSend_modelessUsedAtLeastOnceCount(v103, v104, v105, v106)) {
      self->_sessionIsModeless = 1;
    }
    unint64_t v108 = objc_msgSend_largestSingleInsertionLength(v14, v104, v105, v106);
    unint64_t v112 = objc_msgSend_largestSingleDeletionLength(v14, v109, v110, v111);
    uint64_t v116 = objc_msgSend_netCharacterCount(v14, v113, v114, v115);
    uint64_t v120 = objc_msgSend_flagOptions(v14, v117, v118, v119);
    if (objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v121, v120, v122))
    {
      unint64_t v108 = objc_msgSend_insertedEmojiCount(v14, v123, v124, v125);
      unint64_t v112 = objc_msgSend_removedEmojiCount(v14, v126, v127, v128);
      uint64_t v132 = objc_msgSend_insertedEmojiCount(v14, v129, v130, v131);
      uint64_t v116 = v132 - objc_msgSend_removedEmojiCount(v14, v133, v134, v135);
      v136 = sub_252A048AC();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
      {
        v241 = objc_msgSend_analyzerSessionId(self, v137, v138, v139);
        v273 = objc_msgSend_description(v241, v242, v243, v244);
        *(_DWORD *)buf = 138478595;
        v280 = v273;
        __int16 v281 = 2048;
        unint64_t v282 = v108;
        __int16 v283 = 2048;
        uint64_t v284 = v112;
        __int16 v285 = 2048;
        uint64_t v286 = v116;
        _os_log_debug_impl(&dword_2529F1000, v136, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] emoji search - override insertion %lu, deletion %lu, net %ld", buf, 0x2Au);
      }
    }
    if (v108 > self->_largestSessionInsertionLength)
    {
      v140 = sub_252A048AC();
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
      {
        v271 = objc_msgSend_analyzerSessionId(self, v141, v142, v143);
        v274 = objc_msgSend_description(v271, v245, v246, v247);
        unint64_t largestSessionInsertionLength = self->_largestSessionInsertionLength;
        uint64_t v251 = objc_msgSend_largestSingleInsertionLength(v14, v248, v249, v250);
        *(_DWORD *)buf = 138478339;
        v280 = v274;
        __int16 v281 = 2048;
        unint64_t v282 = largestSessionInsertionLength;
        __int16 v283 = 2048;
        uint64_t v284 = v251;
        _os_log_debug_impl(&dword_2529F1000, v140, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] largestSessionInsertionLength %lu -> %lu", buf, 0x20u);
      }
      self->_unint64_t largestSessionInsertionLength = v108;
    }
    v144 = v277;
    if (v112 > self->_largestSessionDeletionLength)
    {
      v145 = sub_252A048AC();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
      {
        v275 = objc_msgSend_analyzerSessionId(self, v146, v147, v148);
        v255 = objc_msgSend_description(v275, v252, v253, v254);
        unint64_t largestSessionDeletionLength = self->_largestSessionDeletionLength;
        uint64_t v259 = objc_msgSend_largestSingleDeletionLength(v14, v256, v257, v258);
        *(_DWORD *)buf = 138478339;
        v280 = v255;
        __int16 v281 = 2048;
        unint64_t v282 = largestSessionDeletionLength;
        __int16 v283 = 2048;
        uint64_t v284 = v259;
        _os_log_debug_impl(&dword_2529F1000, v145, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] largestSessionDeletionLength %lu -> %lu", buf, 0x20u);

        v144 = v277;
      }

      self->_unint64_t largestSessionDeletionLength = v112;
    }
    uint64_t v149 = objc_msgSend_flagOptions(v14, v123, v124, v125);
    if ((objc_msgSend_isMarkedTextSetInFlagOptions_(IATextInputActionsUtils, v150, v149, v151) & 1) == 0) {
      self->_sessionNetCharacters += v116;
    }
    if (objc_msgSend_isCapableOfTextInsertion(v14, v152, v153, v154)
      && ((uint64_t v158 = objc_msgSend_flagOptions(v14, v155, v156, v157),
           !objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v159, v158, v160))|| (uint64_t v164 = objc_msgSend_flagOptions(v14, v161, v162, v163), objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v165, v164, v166))&& objc_msgSend_insertedEmojiCount(v14, v155, v156, v157)))
    {
      self->_insertionObservedInSession = 1;
      v167 = sub_252A048AC();
      if (os_log_type_enabled(v167, OS_LOG_TYPE_DEBUG)) {
        sub_252A1103C();
      }
    }
    else
    {
      if (self->_insertionObservedInSession) {
        goto LABEL_46;
      }
      uint64_t v168 = objc_msgSend_flagOptions(v14, v155, v156, v157);
      if (objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v169, v168, v170)) {
        goto LABEL_46;
      }
      uint64_t v171 = objc_msgSend_removedTextLength(v14, v155, v156, v157);
      self->_charsRemovedBeforeFirstInsertionCount += v171 - objc_msgSend_removedEmojiCount(v14, v172, v173, v174);
      self->_emojisRemovedBeforeFirstInsertionCount += objc_msgSend_removedEmojiCount(v14, v175, v176, v177);
      v167 = sub_252A048AC();
      if (os_log_type_enabled(v167, OS_LOG_TYPE_DEBUG))
      {
        v260 = objc_msgSend_analyzerSessionId(self, v178, v179, v180);
        v264 = objc_msgSend_description(v260, v261, v262, v263);
        unint64_t charsRemovedBeforeFirstInsertionCount = self->_charsRemovedBeforeFirstInsertionCount;
        unint64_t emojisRemovedBeforeFirstInsertionCount = self->_emojisRemovedBeforeFirstInsertionCount;
        *(_DWORD *)buf = 138478339;
        v280 = v264;
        __int16 v281 = 2048;
        unint64_t v282 = charsRemovedBeforeFirstInsertionCount;
        __int16 v283 = 2048;
        uint64_t v284 = emojisRemovedBeforeFirstInsertionCount;
        _os_log_debug_impl(&dword_2529F1000, v167, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] Initial deletion %lu, %lu", buf, 0x20u);
      }
    }

LABEL_46:
    uint64_t v181 = objc_msgSend_processBundleId(v14, v155, v156, v157);
    if (v181)
    {
      v185 = (void *)v181;
      v186 = objc_msgSend_processBundleId(v14, v182, v183, v184);
      uint64_t v190 = objc_msgSend_length(v186, v187, v188, v189);

      if (v190)
      {
        objc_msgSend_processBundleId(v14, v182, v183, v184);
        v191 = (NSString *)objc_claimAutoreleasedReturnValue();
        mostRecentProcessId = self->_mostRecentProcessId;
        self->_mostRecentProcessId = v191;
      }
    }
    uint64_t v193 = objc_msgSend_appBundleId(v14, v182, v183, v184);
    if (v193)
    {
      v197 = (void *)v193;
      v198 = objc_msgSend_appBundleId(v14, v194, v195, v196);
      uint64_t v202 = objc_msgSend_length(v198, v199, v200, v201);

      if (v202)
      {
        objc_msgSend_appBundleId(v14, v194, v195, v196);
        v203 = (NSString *)objc_claimAutoreleasedReturnValue();
        mostRecentAppBundleId = self->_mostRecentAppBundleId;
        self->_mostRecentAppBundleId = v203;
      }
    }
    v205 = objc_msgSend_asEnd(v14, v194, v195, v196);
    v209 = objc_msgSend_keyboardTrialParameters(v205, v206, v207, v208);

    if (v209)
    {
      v213 = objc_msgSend_keyboardTrialParameters(v205, v210, v211, v212);
      objc_msgSend_setKeyboardTrialParameters_(self, v214, (uint64_t)v213, v215);

      v216 = sub_252A048AC();
      if (os_log_type_enabled(v216, OS_LOG_TYPE_DEBUG)) {
        sub_252A11008();
      }
    }
    v278.receiver = self;
    v278.super_class = (Class)IASTextInputActionsAnalyzer;
    [(IASDailyGarbageCollectionAnalyzer *)&v278 consumeAction:v8];
  }
}

- (void)reset
{
  objc_msgSend_removeAllObjects(self->_entries, a2, v2, v3);
  id v8 = objc_msgSend_sessionErrors(self, v5, v6, v7);
  objc_msgSend_clear(v8, v9, v10, v11);

  self->_sessionIsModeless = 0;
  self->_unint64_t largestSessionInsertionLength = 0;
  self->_unint64_t largestSessionDeletionLength = 0;
  self->_sessionNetCharacters = 0;
  self->_insertionObservedInSession = 0;
  self->_unint64_t charsRemovedBeforeFirstInsertionCount = 0;
  self->_unint64_t emojisRemovedBeforeFirstInsertionCount = 0;
  uint64_t v12 = sub_252A048AC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_252A11134();
  }
}

- (id)computeSessionActionsStringOnSession:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(IATextInputActionsSessionActionInformation);
  uint64_t v7 = 13;
  uint64_t v12 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v8, 13, v9);
  do
  {
    uint64_t v13 = objc_msgSend_numberWithBool_(NSNumber, v10, 0, v11);
    objc_msgSend_addObject_(v12, v14, (uint64_t)v13, v15);

    --v7;
  }
  while (v7);
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = sub_2529FCF30;
  v74[3] = &unk_265387B60;
  SEL v76 = a2;
  v74[4] = self;
  id v16 = v12;
  id v75 = v16;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v17, (uint64_t)v74, v18);
  objc_msgSend_setSessionActionsString_(v6, v19, (uint64_t)&stru_2702E3F20, v20);
  uint64_t v69 = MEMORY[0x263EF8330];
  uint64_t v70 = 3221225472;
  v71 = sub_2529FD1A8;
  v72 = &unk_265387B88;
  uint64_t v21 = v6;
  v73 = v21;
  objc_msgSend_enumerateObjectsUsingBlock_(v16, v22, (uint64_t)&v69, v23);
  uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(v16, v24, 4, v25, v69, v70, v71, v72);
  if (objc_msgSend_BOOLValue(v26, v27, v28, v29))
  {
    objc_msgSend_setSessionHasOnlyPrimaryInput_(v21, v30, 0, v31);
  }
  else
  {
    uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v16, v30, 5, v31);
    if (objc_msgSend_BOOLValue(v32, v33, v34, v35))
    {
      objc_msgSend_setSessionHasOnlyPrimaryInput_(v21, v36, 0, v37);
    }
    else
    {
      uint64_t v38 = objc_msgSend_objectAtIndexedSubscript_(v16, v36, 8, v37);
      if (objc_msgSend_BOOLValue(v38, v39, v40, v41))
      {
        objc_msgSend_setSessionHasOnlyPrimaryInput_(v21, v42, 0, v43);
      }
      else
      {
        uint64_t v44 = objc_msgSend_objectAtIndexedSubscript_(v16, v42, 9, v43);
        if (objc_msgSend_BOOLValue(v44, v45, v46, v47))
        {
          objc_msgSend_setSessionHasOnlyPrimaryInput_(v21, v48, 0, v50);
        }
        else
        {
          uint64_t v51 = objc_msgSend_sessionActionsString(v21, v48, v49, v50);
          int isEqualToString = objc_msgSend_isEqualToString_(v51, v52, @"U", v53);
          objc_msgSend_setSessionHasOnlyPrimaryInput_(v21, v55, isEqualToString ^ 1u, v56);
        }
      }
    }
  }

  uint64_t v59 = objc_msgSend_objectAtIndexedSubscript_(v16, v57, 3, v58);
  uint64_t v63 = objc_msgSend_BOOLValue(v59, v60, v61, v62);
  objc_msgSend_setSessionHasDictation_(v21, v64, v63, v65);

  uint64_t v66 = v73;
  v67 = v21;

  return v67;
}

- (void)enumerateAnalytics
{
  objc_msgSend_eventHandler(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateTextInputActionsAnalytics_(self, v5, (uint64_t)v7, v6);
}

- (void)enumerateTextInputActionsAnalytics:(id)a3
{
  id v4 = a3;
  id v5 = sub_252A048AC();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_252A111A8();
    }

    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = sub_2529FD4D4;
    mostRecentProcessId = (__CFString *)self->_mostRecentProcessId;
    v24[4] = sub_2529FD4E4;
    if (!mostRecentProcessId) {
      mostRecentProcessId = @"nil";
    }
    uint64_t v25 = mostRecentProcessId;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = sub_2529FD4D4;
    v22[4] = sub_2529FD4E4;
    uint64_t v11 = objc_msgSend_sessionErrors(self, v8, v9, v10);
    objc_msgSend_errorString(v11, v12, v13, v14);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    entries = self->_entries;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_2529FD4EC;
    v18[3] = &unk_265387C50;
    v18[4] = self;
    uint64_t v20 = v24;
    uint64_t v21 = v22;
    id v19 = v4;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(entries, v16, (uint64_t)v18, v17);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_252A11168();
    }
  }
}

- (BOOL)shouldBeGarbageCollected
{
  v14.receiver = self;
  v14.super_class = (Class)IASTextInputActionsAnalyzer;
  BOOL v6 = [(IASDailyGarbageCollectionAnalyzer *)&v14 shouldBeGarbageCollected];
  if (v6)
  {
    id v7 = objc_msgSend_sessionErrors(self, v3, v4, v5);
    objc_msgSend_logErrorCodeIfNotNil_(v7, v8, 0x2702E60E0, v9);

    objc_msgSend_enumerateAnalytics(self, v10, v11, v12);
  }
  return v6;
}

- (NSDictionary)keyboardTrialParameters
{
  return self->_keyboardTrialParameters;
}

- (void)setKeyboardTrialParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardTrialParameters, 0);
  objc_storeStrong((id *)&self->_mostRecentProcessId, 0);
  objc_storeStrong((id *)&self->_mostRecentAppBundleId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
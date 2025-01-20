@interface _DKApplicationMonitor
+ (id)entitlements;
- (BMSource)displayElementSource;
- (BMStream)displayElementStream;
- (BOOL)ignoreAppExtension:(id)a3;
- (NSMutableDictionary)currentFrontBoardElements;
- (_DKApplicationMonitor)init;
- (id)_elementFromDisplayLayoutElement:(id)a3 displayLayout:(id)a4 context:(id)a5 changeType:(int)a6;
- (id)_newElementFromExistingDisplayElement:(id)a3 newTimestamp:(id)a4 newChangeType:(int)a5;
- (id)displayLayoutTransitionHandler;
- (id)focalApplicationFromDisplayLayout:(id)a3;
- (id)processUpdateHandler;
- (void)_updateCurrentElementsWithDisplayElement:(id)a3;
- (void)donateElementsFromDisplayLayout:(id)a3 withContext:(id)a4;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)obtainCurrentValue;
- (void)platformSpecificStart;
- (void)platformSpecificStop;
- (void)processMonitor:(id)a3 didUpdateState:(id)a4 forProcess:(id)a5;
- (void)setCurrentFrontBoardElements:(id)a3;
- (void)setDisplayElementSource:(id)a3;
- (void)setDisplayElementStream:(id)a3;
@end

@implementation _DKApplicationMonitor

- (id)_newElementFromExistingDisplayElement:(id)a3 newTimestamp:(id)a4 newChangeType:(int)a5
{
  v6 = (objc_class *)MEMORY[0x263F2A0F8];
  id v37 = a4;
  id v7 = a3;
  id v35 = [v6 alloc];
  v34 = [v7 display];
  unsigned int v30 = [v34 type];
  v33 = [v7 display];
  v8 = [v33 name];
  v32 = [v7 display];
  v9 = [v32 deviceName];
  v31 = [v7 display];
  v10 = [v31 hardwareIdentifier];
  v11 = [v7 display];
  uint64_t v12 = [v11 interfaceOrientation];
  v13 = [v7 display];
  uint64_t v14 = [v13 backlightStatus];
  v15 = [v7 display];
  v16 = [v15 transitionReasons];
  v36 = (void *)[v35 initWithType:v30 name:v8 deviceName:v9 hardwareIdentifier:v10 interfaceOrientation:v12 backlightStatus:v14 transitionReasons:v16];

  id v17 = objc_alloc(MEMORY[0x263F2A0F0]);
  v18 = [v7 identifier];
  v19 = [v7 bundleIdentifier];
  uint64_t v20 = [v7 elementType];
  v21 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "layoutRole"));
  v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "level"));
  v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "hasKeyboardFocus"));
  v24 = NSNumber;
  uint64_t v25 = [v7 isUIApplicationElement];

  v26 = [v24 numberWithBool:v25];
  LODWORD(v29) = a5;
  v27 = (void *)[v17 initWithAbsoluteTimestamp:v37 identifier:v18 bundleIdentifier:v19 elementType:v20 layoutRole:v21 level:v22 hasKeyboardFocus:v23 isUIApplicationElement:v26 display:v36 changeType:v29];

  return v27;
}

- (id)_elementFromDisplayLayoutElement:(id)a3 displayLayout:(id)a4 context:(id)a5 changeType:(int)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 interfaceOrientation];
  if ((unint64_t)(v11 - 1) < 4) {
    unsigned int v12 = v11;
  }
  else {
    unsigned int v12 = 0;
  }
  unsigned int v41 = v12;
  if ([v9 displayBacklightLevel])
  {
    if ([v9 displayBacklightLevel] < 1 || objc_msgSend(v9, "displayBacklightLevel") >= 101)
    {
      unsigned int v39 = 0;
      goto LABEL_11;
    }
    int v13 = 2;
  }
  else
  {
    int v13 = 1;
  }
  unsigned int v39 = v13;
LABEL_11:
  uint64_t v14 = objc_opt_new();
  v15 = (void *)MEMORY[0x263EFFA08];
  v16 = [v10 transitionReason];
  id v17 = objc_msgSend(v15, "setWithObjects:", v16, 0);
  [v14 unionSet:v17];

  v18 = [v10 transitionReasons];

  if (v18)
  {
    [v14 unionSet:v18];
  }
  else
  {
    v19 = [MEMORY[0x263EFFA08] set];
    [v14 unionSet:v19];
  }
  id v20 = objc_alloc(MEMORY[0x263F2A0F8]);
  v21 = [v9 displayConfiguration];
  v22 = [v21 name];
  v23 = [v9 displayConfiguration];
  v24 = [v23 deviceName];
  uint64_t v25 = [v9 displayConfiguration];
  v26 = [v25 hardwareIdentifier];
  v43 = v14;
  v27 = [v14 array];
  v42 = (void *)[v20 initWithType:1 name:v22 deviceName:v24 hardwareIdentifier:v26 interfaceOrientation:v41 backlightStatus:v39 transitionReasons:v27];

  if (objc_opt_respondsToSelector() & 1) != 0 && ([v8 isSpringBoardElement]) {
    unsigned int v40 = 2;
  }
  else {
    unsigned int v40 = [v8 isMemberOfClass:objc_opt_class()];
  }
  if (objc_opt_respondsToSelector())
  {
    v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "layoutRole"));
  }
  else
  {
    v38 = 0;
  }
  id v28 = objc_alloc(MEMORY[0x263F2A0F0]);
  uint64_t v29 = [v9 timestamp];
  unsigned int v30 = [v8 identifier];
  v31 = [v8 bundleIdentifier];
  v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "level"));
  v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "hasKeyboardFocus"));
  v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isUIApplicationElement"));
  LODWORD(v37) = a6;
  id v35 = (void *)[v28 initWithAbsoluteTimestamp:v29 identifier:v30 bundleIdentifier:v31 elementType:v40 layoutRole:v38 level:v32 hasKeyboardFocus:v33 isUIApplicationElement:v34 display:v42 changeType:v37];

  return v35;
}

- (id)focalApplicationFromDisplayLayout:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 elements];
  v6 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_13);

  id v7 = [(_DKMonitor *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_DKApplicationMonitor focalApplicationFromDisplayLayout:]();
  }

  if ([v4 displayBacklightLevel])
  {
    id v28 = self;
    id v30 = v4;
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v29 = v6;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v14 = [v13 bundleIdentifier];
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            v16 = [v13 identifier];
          }
          id v17 = v16;

          if ([&unk_26D86D848 containsObject:v17])
          {

            id v17 = &stru_26D866630;
          }
          v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "level"));
          v36[0] = v18;
          v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "hasKeyboardFocus"));
          v36[1] = v19;
          id v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "layoutRole"));
          v36[2] = v20;
          v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
          [v8 setObject:v17 forKeyedSubscript:v21];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v10);
    }

    v22 = [v8 allKeys];
    v23 = [v22 sortedArrayUsingComparator:&__block_literal_global_69];

    v24 = [v8 objectsForKeys:v23 notFoundMarker:&stru_26D866630];
    uint64_t v25 = [(_DKMonitor *)v28 log];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[_DKApplicationMonitor focalApplicationFromDisplayLayout:]();
    }

    v26 = [v24 firstObject];

    v6 = v29;
    id v4 = v30;
  }
  else
  {
    id v8 = [(_DKMonitor *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_DKApplicationMonitor focalApplicationFromDisplayLayout:](v8);
    }
    v26 = &stru_26D866630;
  }

  return v26;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(_DKApplicationMonitor *)self donateElementsFromDisplayLayout:v8 withContext:v7];
  uint64_t v9 = [v8 timestamp];
  uint64_t v10 = [(_DKApplicationMonitor *)self focalApplicationFromDisplayLayout:v8];

  uint64_t v11 = [(_DKMonitor *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:].cold.5();
  }

  unsigned int v12 = [v7 transitionReason];
  int v13 = [(_DKMonitor *)self log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:].cold.4();
  }

  uint64_t v14 = [(_DKMonitor *)self log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:](v7, v14);
  }

  [(_DKApplicationMonitorBase *)self updateContextStoreWithFocalApplication:v10 launchReason:v12];
  id v41 = 0;
  id v42 = 0;
  [(_DKApplicationMonitorBase *)self lookupApplication:v10 shortVersionString:&v42 exactBundleVersion:&v41];
  id v15 = v42;
  id v16 = v41;
  id v17 = [(_DKApplicationMonitorBase *)self _eventWithTimestamp:v9 bundleIdentifier:v10 launchReason:v12 shortVersionString:v15 exactBundleVersion:v16];
  if (v10)
  {
    uint64_t v18 = [(_DKMonitor *)self currentEvent];
    if (!v18) {
      goto LABEL_10;
    }
    v19 = (void *)v18;
    [(_DKMonitor *)self eventComparator];
    uint64_t v38 = v12;
    unsigned int v39 = v10;
    id v20 = v16;
    id v21 = v15;
    v22 = v9;
    id v23 = v7;
    v24 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    [(_DKMonitor *)self currentEvent];
    v26 = uint64_t v25 = v17;
    uint64_t v27 = ((uint64_t (**)(void, void *, void *))v24)[2](v24, v26, v25);

    id v17 = v25;
    id v7 = v23;
    uint64_t v9 = v22;
    id v15 = v21;
    id v16 = v20;
    unsigned int v12 = v38;
    uint64_t v10 = v39;

    if (v27)
    {
LABEL_10:
      id v40 = v7;
      id v28 = [(_DKMonitor *)self currentEvent];
      [v28 value];
      v30 = uint64_t v29 = v17;
      v31 = [v30 stringValue];

      id v17 = v29;
      int v32 = [&unk_26D86D860 containsObject:v31];
      if (([MEMORY[0x263F61E30] isClassCLocked] & 1) == 0)
      {
        [(_DKMonitor *)self setCurrentEvent:v17 inferHistoricalState:v32 ^ 1u];
        if (([v31 isEqual:v10] & 1) == 0
          && ([&unk_26D86D878 containsObject:v10] & 1) == 0)
        {
          if ([v31 length])
          {
            [(_DKApplicationMonitorBase *)self updateBiomeAppInFocusWithStopEventAtTimestamp:v9 reason:0];
            long long v33 = [(_DKMonitor *)self log];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:]();
            }
          }
          if ([v10 length])
          {
            if (([v10 hasPrefix:@"com.apple.springboard"] & 1) != 0
              || [&unk_26D86D890 containsObject:v10])
            {
              uint64_t v34 = 3;
            }
            else
            {
              uint64_t v34 = 1;
            }
            id v35 = objc_alloc(MEMORY[0x263F29FA8]);
            v36 = (void *)[v35 initWithLaunchReason:v12 launchType:v34 starting:MEMORY[0x263EFFA88] absoluteTimestamp:v9 duration:0 bundleID:v10 parentBundleID:0 extensionHostID:0 shortVersionString:v15 exactVersionString:v16];
            [(_DKApplicationMonitorBase *)self updateBiomeWithAppInFocusStartEvent:v36];
            uint64_t v37 = [(_DKMonitor *)self log];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:]();
            }
          }
        }
      }

      id v7 = v40;
    }
  }
}

- (void)donateElementsFromDisplayLayout:(id)a3 withContext:(id)a4
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v66 = a3;
  id v65 = a4;
  v6 = [(_DKApplicationMonitor *)self displayElementStream];

  if (v6)
  {
    id v7 = [(_DKApplicationMonitor *)self currentFrontBoardElements];

    if (!v7)
    {
      id v8 = objc_opt_new();
      [(_DKApplicationMonitor *)self setCurrentFrontBoardElements:v8];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      v99 = 0;
      uint64_t v9 = [(_DKApplicationMonitor *)self displayElementStream];
      uint64_t v10 = [v9 publisher];
      v93[0] = MEMORY[0x263EF8330];
      v93[1] = 3221225472;
      v93[2] = __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke;
      v93[3] = &unk_264714E48;
      v93[4] = self;
      v93[5] = buf;
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      v92[2] = __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_2;
      v92[3] = &unk_264714E70;
      v92[4] = self;
      v92[5] = buf;
      id v11 = (id)[v10 sinkWithCompletion:v93 receiveInput:v92];

      _Block_object_dispose(buf, 8);
    }
    unsigned int v12 = [v66 elements];
    v61 = objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_10);

    int v13 = [v61 sortedArrayUsingComparator:&__block_literal_global_7];
    uint64_t v14 = objc_opt_new();
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v88 objects:v97 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v89 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = [*(id *)(*((void *)&v88 + 1) + 8 * i) identifier];
          [v14 addObject:v19];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v88 objects:v97 count:16];
      }
      while (v16);
    }

    id v63 = (id)objc_opt_new();
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v15;
    uint64_t v20 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v85 != v21) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v84 + 1) + 8 * j);
          v24 = [(_DKApplicationMonitor *)self currentFrontBoardElements];
          uint64_t v25 = [v23 identifier];
          v26 = [v24 objectForKeyedSubscript:v25];

          if (v26) {
            uint64_t v27 = 2;
          }
          else {
            uint64_t v27 = 1;
          }
          id v28 = [(_DKApplicationMonitor *)self _elementFromDisplayLayoutElement:v23 displayLayout:v66 context:v65 changeType:v27];
          if (v26 && objc_msgSend(v26, "dk_isDuplicateOf:", v28))
          {
            uint64_t v29 = [(_DKMonitor *)self log];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              -[_DKApplicationMonitor(BMFrontBoardDisplayElement) donateElementsFromDisplayLayout:withContext:](&v82, v83, v29);
            }
          }
          else
          {
            [v63 addObject:v28];
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
      }
      while (v20);
    }

    id v30 = objc_opt_new();
    v31 = [(_DKApplicationMonitor *)self currentFrontBoardElements];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_11;
    v77[3] = &unk_264714ED8;
    id v59 = v14;
    id v78 = v59;
    v79 = self;
    id v32 = v66;
    id v80 = v32;
    id v60 = v30;
    id v81 = v60;
    [v31 enumerateKeysAndObjectsUsingBlock:v77];

    long long v33 = [(_DKApplicationMonitor *)self displayElementSource];
    uint64_t v34 = v33;
    if (v33)
    {
      id v67 = v33;
    }
    else
    {
      v36 = [(_DKApplicationMonitor *)self displayElementStream];
      id v67 = [v36 source];
      [(_DKApplicationMonitor *)self setDisplayElementSource:v67];
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v64 = v63;
    uint64_t v37 = [v64 countByEnumeratingWithState:&v73 objects:v95 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v74;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v74 != v38) {
            objc_enumerationMutation(v64);
          }
          id v40 = *(void **)(*((void *)&v73 + 1) + 8 * k);
          id v41 = [v32 timestamp];
          [v41 timeIntervalSinceReferenceDate];
          objc_msgSend(v67, "sendEvent:timestamp:", v40);

          [(_DKApplicationMonitor *)self _updateCurrentElementsWithDisplayElement:v40];
          id v42 = [(_DKMonitor *)self log];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            [v40 changeType];
            v43 = BMFrontBoardDisplayElementChangeTypeAsString();
            v44 = [v40 identifier];
            v45 = [v40 bundleIdentifier];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v43;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v44;
            *(_WORD *)&buf[22] = 2112;
            v99 = v45;
            _os_log_debug_impl(&dword_225002000, v42, OS_LOG_TYPE_DEBUG, "BMFrontBoardDisplayElement - Writing %@ event for identifier: %@ bundleIdentifier: %@", buf, 0x20u);
          }
        }
        uint64_t v37 = [v64 countByEnumeratingWithState:&v73 objects:v95 count:16];
      }
      while (v37);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v46 = v60;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v69 objects:v94 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v70;
      do
      {
        for (uint64_t m = 0; m != v47; ++m)
        {
          if (*(void *)v70 != v48) {
            objc_enumerationMutation(v46);
          }
          v50 = *(void **)(*((void *)&v69 + 1) + 8 * m);
          v51 = [v32 timestamp];
          [v51 timeIntervalSinceReferenceDate];
          objc_msgSend(v67, "sendEvent:timestamp:", v50);

          [(_DKApplicationMonitor *)self _updateCurrentElementsWithDisplayElement:v50];
          v52 = [(_DKMonitor *)self log];
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            [v50 changeType];
            v53 = BMFrontBoardDisplayElementChangeTypeAsString();
            v54 = [v50 identifier];
            v55 = [v50 bundleIdentifier];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v53;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v54;
            *(_WORD *)&buf[22] = 2112;
            v99 = v55;
            _os_log_debug_impl(&dword_225002000, v52, OS_LOG_TYPE_DEBUG, "BMFrontBoardDisplayElement - Writing %@ event for identifier: %@ bundleIdentifier: %@", buf, 0x20u);
          }
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v69 objects:v94 count:16];
      }
      while (v47);
    }

    v56 = [(_DKMonitor *)self log];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
      -[_DKApplicationMonitor(BMFrontBoardDisplayElement) donateElementsFromDisplayLayout:withContext:](v56);
    }

    v57 = [(_DKApplicationMonitor *)self currentFrontBoardElements];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_13;
    v68[3] = &unk_264714F00;
    v68[4] = self;
    [v57 enumerateKeysAndObjectsUsingBlock:v68];

    v58 = [(_DKMonitor *)self log];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
      -[_DKApplicationMonitor(BMFrontBoardDisplayElement) donateElementsFromDisplayLayout:withContext:](v58);
    }

    id v35 = v61;
  }
  else
  {
    id v35 = [(_DKMonitor *)self log];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225002000, v35, OS_LOG_TYPE_INFO, "BMFrontBoardDisplayElement - Waiting for first unlock before donating event", buf, 2u);
    }
  }
}

- (NSMutableDictionary)currentFrontBoardElements
{
  return self->_currentFrontBoardElements;
}

- (void)_updateCurrentElementsWithDisplayElement:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];

  if (!v5)
  {
    id v7 = [(_DKMonitor *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_DKApplicationMonitor(BMFrontBoardDisplayElement) _updateCurrentElementsWithDisplayElement:]((uint64_t)v4, v7);
    }
    goto LABEL_9;
  }
  int v6 = [v4 changeType];
  if ((v6 - 1) < 2)
  {
    id v7 = [(_DKApplicationMonitor *)self currentFrontBoardElements];
    id v8 = [v4 identifier];
    [v7 setObject:v4 forKeyedSubscript:v8];
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  if (v6 == 3)
  {
    id v7 = [(_DKApplicationMonitor *)self currentFrontBoardElements];
    id v8 = [v4 identifier];
    [v7 removeObjectForKey:v8];
    goto LABEL_8;
  }
LABEL_10:
}

- (BMStream)displayElementStream
{
  return self->_displayElementStream;
}

- (BMSource)displayElementSource
{
  return self->_displayElementSource;
}

- (_DKApplicationMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DKApplicationMonitor;
  v2 = [(_DKApplicationMonitorBase *)&v8 init];
  v3 = v2;
  if (v2)
  {
    id v4 = (void *)MEMORY[0x263F61E30];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __29___DKApplicationMonitor_init__block_invoke;
    v6[3] = &unk_264714788;
    id v7 = v2;
    [v4 runBlockWhenDeviceIsClassCUnlocked:v6];
  }
  return v3;
}

+ (id)entitlements
{
  return &unk_26D86D800;
}

- (void)platformSpecificStart
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  activeExtensions = self->_activeExtensions;
  self->_activeExtensions = v3;

  lastFocalApplication = self->_lastFocalApplication;
  self->_lastFocalApplication = (NSString *)&stru_26D866630;

  int v6 = (void *)MEMORY[0x263F3F728];
  id v7 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  objc_super v8 = [(_DKApplicationMonitor *)self displayLayoutTransitionHandler];
  [v7 setTransitionHandler:v8];

  uint64_t v9 = [v6 monitorWithConfiguration:v7];
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v9;

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46___DKApplicationMonitor_platformSpecificStart__block_invoke;
  v13[3] = &unk_264714DA8;
  v13[4] = self;
  id v11 = [MEMORY[0x263F645C0] monitorWithConfiguration:v13];
  processMonitor = self->_processMonitor;
  self->_processMonitor = v11;
}

- (void)platformSpecificStop
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = 0;

  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  processMonitor = self->_processMonitor;
  self->_processMonitor = 0;

  activeExtensions = self->_activeExtensions;
  self->_activeExtensions = 0;

  lastFocalApplication = self->_lastFocalApplication;
  self->_lastFocalApplication = 0;
}

- (void)obtainCurrentValue
{
  v3 = [(FBSDisplayLayoutMonitor *)self->_layoutMonitor currentLayout];
  id v4 = [(_DKApplicationMonitor *)self focalApplicationFromDisplayLayout:v3];

  [(_DKApplicationMonitorBase *)self updateContextStoreWithFocalApplication:v4 launchReason:&stru_26D866630];
}

- (id)displayLayoutTransitionHandler
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55___DKApplicationMonitor_displayLayoutTransitionHandler__block_invoke;
  v4[3] = &unk_264714F90;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x22A629CE0](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (BOOL)ignoreAppExtension:(id)a3
{
  uint64_t v3 = ignoreAppExtension__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&ignoreAppExtension__onceToken, &__block_literal_global_86);
  }
  char v5 = [(id)ignoreAppExtension__ignoreList containsObject:v4];

  return v5;
}

- (void)processMonitor:(id)a3 didUpdateState:(id)a4 forProcess:(id)a5
{
  v68[2] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 identity];
  uint64_t v10 = [v9 embeddedApplicationIdentifier];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    int v13 = [v8 xpcServiceIdentifier];
    uint64_t v14 = v13;
    if (v13)
    {
      id v12 = v13;
    }
    else
    {
      id v15 = [v8 bundle];
      id v12 = [v15 identifier];
    }
  }

  if ([v8 isXPCService]
    && ![(_DKApplicationMonitor *)self ignoreAppExtension:v12])
  {
    id v58 = 0;
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v12 error:&v58];
    id v17 = v58;
    if (v17)
    {
      uint64_t v18 = [(_DKMonitor *)self log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_DKApplicationMonitor processMonitor:didUpdateState:forProcess:]();
      }
      v19 = 0;
    }
    else
    {
      uint64_t v20 = [v16 containingBundleRecord];
      v19 = [v20 bundleIdentifier];

      uint64_t v21 = [v8 hostProcess];
      v22 = [v21 bundle];
      uint64_t v18 = [v22 identifier];

      if (([(__CFString *)v19 isEqual:@"com.apple.PosterBoard"] & 1) == 0
        && ([(__CFString *)v19 isEqual:@"com.apple.PaperBoard"] & 1) == 0
        && ([v18 isEqual:@"com.apple.PosterBoard"] & 1) == 0
        && ([v18 isEqual:@"com.apple.PaperBoard"] & 1) == 0)
      {
        if (![v18 isEqual:@"com.apple.springboard"]
          || ([v12 lowercaseString],
              id v23 = objc_claimAutoreleasedReturnValue(),
              char v24 = [v23 containsString:@"poster"],
              v23,
              (v24 & 1) == 0))
        {
          uint64_t v25 = [v7 state];
          int v55 = [v25 isRunning];

          v26 = [v7 state];
          uint64_t v27 = [v26 endowmentNamespaces];
          unsigned int v53 = [v27 containsObject:@"com.apple.frontboard.visibility"];

          uint64_t v28 = v55 & v53;
          int v50 = v55 & v53;
          uint64_t v29 = [MEMORY[0x263EFF910] date];
          id v56 = objc_alloc(MEMORY[0x263F29FA8]);
          id v30 = [NSNumber numberWithBool:v28];
          v31 = v56;
          v57 = (void *)v29;
          v54 = (void *)[v31 initWithLaunchReason:0 launchType:2 starting:v30 absoluteTimestamp:v29 duration:0 bundleID:v12 parentBundleID:v19 extensionHostID:v18 shortVersionString:0 exactVersionString:0];

          id v32 = [(NSMutableDictionary *)self->_activeExtensions objectForKeyedSubscript:v12];
          long long v33 = v32;
          if (v50 == 1)
          {

            if (!v33)
            {
              appInFocusSource = self->_appInFocusSource;
              [v57 timeIntervalSinceReferenceDate];
              -[BMSource sendEvent:timestamp:](appInFocusSource, "sendEvent:timestamp:", v54);
              [(NSMutableDictionary *)self->_activeExtensions setObject:v57 forKeyedSubscript:v12];
            }
          }
          else
          {

            if (v33)
            {
              v51 = self->_appInFocusSource;
              [v57 timeIntervalSinceReferenceDate];
              -[BMSource sendEvent:timestamp:](v51, "sendEvent:timestamp:", v54);
              v52 = [(NSMutableDictionary *)self->_activeExtensions objectForKeyedSubscript:v12];
              id v49 = v57;
              uint64_t v47 = (void *)MEMORY[0x263F35088];
              uint64_t v48 = [MEMORY[0x263F35148] appInFocusStream];
              uint64_t v35 = [MEMORY[0x263F35058] withBundle:v12];
              v44 = (void *)v35;
              id v46 = [MEMORY[0x263F35028] extensionHostIdentifier];
              v67[0] = v46;
              v36 = &stru_26D866630;
              if (v18) {
                v36 = (__CFString *)v18;
              }
              v68[0] = v36;
              v45 = [MEMORY[0x263F35028] extensionContainingBundleIdentifier];
              v67[1] = v45;
              uint64_t v37 = &stru_26D866630;
              if (v19) {
                uint64_t v37 = v19;
              }
              v68[1] = v37;
              uint64_t v38 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
              uint64_t v39 = [v47 eventWithStream:v48 startDate:v52 endDate:v49 value:v35 metadata:v38];

              id v40 = (void *)v39;
              if (v39)
              {
                [(_DKMonitor *)self setCurrentEvent:v39 inferHistoricalState:1];
                [(NSMutableDictionary *)self->_activeExtensions removeObjectForKey:v12];
              }
              else
              {
                id v41 = [(_DKMonitor *)self log];
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  id v42 = [MEMORY[0x263F35148] appInFocusStream];
                  v43 = [MEMORY[0x263F35058] withBundle:v12];
                  *(_DWORD *)buf = 138413058;
                  id v60 = v42;
                  __int16 v61 = 2112;
                  v62 = v52;
                  __int16 v63 = 2112;
                  id v64 = v49;
                  __int16 v65 = 2112;
                  id v66 = v43;
                  _os_log_error_impl(&dword_225002000, v41, OS_LOG_TYPE_ERROR, "Failed to create _DKEvent: {%@, %@, %@, %@}", buf, 0x2Au);

                  id v40 = 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

- (id)processUpdateHandler
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45___DKApplicationMonitor_processUpdateHandler__block_invoke;
  v4[3] = &unk_264714DF8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x22A629CE0](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)setDisplayElementStream:(id)a3
{
}

- (void)setDisplayElementSource:(id)a3
{
}

- (void)setCurrentFrontBoardElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFrontBoardElements, 0);
  objc_storeStrong((id *)&self->_displayElementSource, 0);
  objc_storeStrong((id *)&self->_displayElementStream, 0);
  objc_storeStrong((id *)&self->_activeExtensions, 0);
  objc_storeStrong((id *)&self->_lastFocalApplication, 0);
  objc_storeStrong((id *)&self->_appInFocusSource, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

- (void)focalApplicationFromDisplayLayout:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "Screen is off", v1, 2u);
}

- (void)focalApplicationFromDisplayLayout:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_225002000, v0, OS_LOG_TYPE_DEBUG, "Applications: %@ Ordered applications: %@", v1, 0x16u);
}

- (void)focalApplicationFromDisplayLayout:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_225002000, v0, v1, "Layout monitor filtered elements: %@", v2, v3, v4, v5, v6);
}

- (void)layoutMonitor:didUpdateDisplayLayout:withContext:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_225002000, v0, v1, "BMAppInFocus started %@", v2, v3, v4, v5, v6);
}

- (void)layoutMonitor:didUpdateDisplayLayout:withContext:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_225002000, v0, v1, "BMAppInFocus stopped %@", v2, v3, v4, v5, v6);
}

- (void)layoutMonitor:(void *)a1 didUpdateDisplayLayout:(NSObject *)a2 withContext:.cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 transitionReasons];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_225002000, a2, OS_LOG_TYPE_DEBUG, "Transition reasons: %@", v4, 0xCu);
}

- (void)layoutMonitor:didUpdateDisplayLayout:withContext:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_225002000, v0, v1, "Transition reason: %@", v2, v3, v4, v5, v6);
}

- (void)layoutMonitor:didUpdateDisplayLayout:withContext:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_225002000, v0, v1, "Frontmost application: %@", v2, v3, v4, v5, v6);
}

- (void)processMonitor:didUpdateState:forProcess:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_225002000, v0, OS_LOG_TYPE_ERROR, "Failed to look up extension record for identifier %@, error, %@", v1, 0x16u);
}

@end
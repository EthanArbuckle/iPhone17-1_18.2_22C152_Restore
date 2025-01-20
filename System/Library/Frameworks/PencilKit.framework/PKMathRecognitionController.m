@interface PKMathRecognitionController
- (BOOL)processDelayedItemsIfNecessary;
- (PKMathRecognitionController)init;
- (PKMathRecognitionController)initWithDelegate:(id)a3;
- (PKMathRecognitionControllerDelegate)delegate;
- (void)_drawingDidUpdate:(uint64_t)a1;
- (void)_foundStrokeGroups:(int)a3 canDelay:;
- (void)_updateExpressionForItem:(void *)a3 expression:;
- (void)actuallySendDelayedItems:(uint64_t)a1;
- (void)didEraseStrokes:(id)a3;
- (void)reset;
- (void)sendDelayedItems;
- (void)setDelegate:(id)a3;
@end

@implementation PKMathRecognitionController

- (PKMathRecognitionController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKMathRecognitionController;
  v2 = [(PKMathRecognitionController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PKMathRecognitionController *)v2 reset];
  }
  return v3;
}

- (PKMathRecognitionController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMathRecognitionController;
  objc_super v5 = [(PKMathRecognitionController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(PKMathRecognitionController *)v5 reset];
    [(PKMathRecognitionController *)v6 setDelegate:v4];
  }

  return v6;
}

- (void)reset
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 doubleForKey:@"internalSettings.mathUpdateDelay"];
  self->_double updateItemsDelay = v4;

  if (self->_updateItemsDelay == 0.0) {
    self->_double updateItemsDelay = 0.9;
  }
  objc_super v5 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double updateItemsDelay = self->_updateItemsDelay;
    int v17 = 134217984;
    double v18 = updateItemsDelay;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Setting up PKMathRecognitionController with update delay: %g", (uint8_t *)&v17, 0xCu);
  }

  v7 = [MEMORY[0x1E4F1CAD0] set];
  currentItems = self->_currentItems;
  self->_currentItems = v7;

  changeMap = self->_changeMap;
  v10 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  self->_changeMap = (NSDictionary *)MEMORY[0x1E4F1CC08];

  stableIdentifierMap = self->_stableIdentifierMap;
  self->_stableIdentifierMap = v10;

  sortIndexMap = self->_sortIndexMap;
  self->_sortIndexMap = v10;

  expressionMap = self->_expressionMap;
  self->_expressionMap = v10;

  shouldSolveMap = self->_shouldSolveMap;
  self->_shouldSolveMap = v10;

  currentMathRecognitionItems = self->_currentMathRecognitionItems;
  self->_currentMathRecognitionItems = (NSArray *)MEMORY[0x1E4F1CBF0];

  delayedItems = self->_delayedItems;
  self->_delayedItems = 0;
}

- (void)_foundStrokeGroups:(int)a3 canDelay:
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v107 = a2;
  uint64_t v112 = a1;
  if (!a1) {
    goto LABEL_74;
  }
  int v105 = a3;
  objc_super v5 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v142 = [v107 count];
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Found stroke groups: %lu", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E4FBA8A8], "cancelPreviousPerformRequestsWithTarget:selector:object:", v112);
  v6 = *(void **)(v112 + 64);
  *(void *)(v112 + 64) = 0;

  uint64_t v106 = [(id)v112 delegate];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v107, "count"));
  v122 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v107, "count"));
  v123 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v107, "count"));
  v121 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v107, "count"));
  v120 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v107, "count"));
  v119 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v107, "count"));
  v114 = [MEMORY[0x1E4F1CA80] set];
  v108 = [MEMORY[0x1E4F1CA80] set];
  v110 = [MEMORY[0x1E4F1CA48] array];
  v113 = [MEMORY[0x1E4F1CA48] array];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  objc_super v8 = (void *)v7;
  id v9 = v107;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v136 objects:v148 count:16];
  v116 = (void *)v7;
  v109 = v9;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v137;
    do
    {
      uint64_t v14 = 0;
      uint64_t v117 = v11;
      do
      {
        if (*(void *)v137 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v136 + 1) + 8 * v14);
        if (v15) {
          v16 = (void *)v15[1];
        }
        else {
          v16 = 0;
        }
        id v17 = v16;
        double v18 = [v17 mathResult];

        if (v18)
        {
          uint64_t v19 = [v18 preferredTranscription];
          if (qword_1EB3C6178 != -1) {
            dispatch_once(&qword_1EB3C6178, &__block_literal_global_73);
          }
          if (![v19 length]
            || [v19 rangeOfCharacterFromSet:_MergedGlobals_153] == 0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = os_log_create("com.apple.pencilkit", "Math");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138477827;
              uint64_t v142 = (uint64_t)v19;
              _os_log_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring expression: %{private}@", buf, 0xCu);
            }

            goto LABEL_29;
          }

          uint64_t v19 = (double *)-[PKMathRecognitionItem initWithStrokeGroupItem:uuid:]((id *)[PKMathRecognitionItem alloc], v15, 0);
          v21 = -[PKMathRecognitionItem strokesForIdentifier](v19);
          if ([v21 count])
          {
            v22 = [v19 uuid];
            char v23 = [v116 containsObject:v22];

            objc_super v8 = v116;
            if ((v23 & 1) == 0)
            {
              v24 = [v19 uuid];
              [v116 addObject:v24];

              if (v19) {
                v19[12] = (double)v12;
              }
              [v110 addObject:v19];
LABEL_28:
              ++v12;
LABEL_29:

              goto LABEL_30;
            }
          }
          else
          {
          }
          v25 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v124 = -[PKMathRecognitionItem strokesForIdentifier](v19);
            uint64_t v26 = [v124 count];
            v27 = [v19 uuid];
            uint64_t v28 = v12;
            int v29 = [v116 containsObject:v27];
            [v18 preferredTranscription];
            v31 = uint64_t v30 = v13;
            *(_DWORD *)buf = 134218499;
            uint64_t v142 = v26;
            objc_super v8 = v116;
            __int16 v143 = 1024;
            *(_DWORD *)v144 = v29;
            uint64_t v12 = v28;
            *(_WORD *)&v144[4] = 2113;
            *(void *)&v144[6] = v31;
            _os_log_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEFAULT, "Unable to add a math item. Identifier strokes: %ld, existing: %{BOOL}d, expression: %{private}@", buf, 0x1Cu);

            uint64_t v13 = v30;
            uint64_t v11 = v117;

            id v9 = v109;
          }

          goto LABEL_28;
        }
LABEL_30:

        ++v14;
      }
      while (v11 != v14);
      uint64_t v32 = [v9 countByEnumeratingWithState:&v136 objects:v148 count:16];
      uint64_t v11 = v32;
    }
    while (v32);
  }

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v33 = v110;
  v34 = (id *)v112;
  uint64_t v125 = [v33 countByEnumeratingWithState:&v132 objects:v147 count:16];
  if (!v125) {
    goto LABEL_58;
  }
  uint64_t v118 = *(void *)v133;
  obj = v33;
  do
  {
    uint64_t v35 = 0;
    do
    {
      if (*(void *)v133 != v118) {
        objc_enumerationMutation(obj);
      }
      v36 = *(void **)(*((void *)&v132 + 1) + 8 * v35);
      v37 = [v36 uuid];
      v38 = -[PKMathRecognitionItem changeIdentifier]((uint64_t)v36);
      v39 = -[PKMathRecognitionItem stableIdentifier]((uint64_t)v36);
      v40 = NSNumber;
      [v36 sortIndex];
      v126 = objc_msgSend(v40, "numberWithDouble:");
      v41 = [v36 expression];
      v42 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v36, "shouldSolveMathFlagIsSet"));
      if ([v34[1] containsObject:v37])
      {
        v43 = [v34[2] objectForKeyedSubscript:v37];
        if (![v43 isEqual:v38]) {
          goto LABEL_47;
        }
        v44 = [v34[3] objectForKeyedSubscript:v37];
        if (([v44 isEqual:v39] & 1) == 0)
        {

LABEL_47:
LABEL_48:
          v50 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v51 = [v36 expression];
            *(_DWORD *)buf = 138477827;
            uint64_t v142 = (uint64_t)v51;
            _os_log_impl(&dword_1C44F8000, v50, OS_LOG_TYPE_DEFAULT, "Expression change detected: %{private}@", buf, 0xCu);

            v34 = (id *)v112;
          }

          [v114 addObject:v37];
          [v113 addObject:v36];
          -[PKMathRecognitionItem _tagAsRecentlyUpdated]((uint64_t)v36);
LABEL_51:
          objc_super v8 = v116;
          goto LABEL_52;
        }
        v45 = [v34[5] objectForKeyedSubscript:v37];
        char v111 = [v45 isEqual:v41];

        v34 = (id *)v112;
        if ((v111 & 1) == 0) {
          goto LABEL_48;
        }
        v46 = [*(id *)(v112 + 32) objectForKeyedSubscript:v37];
        char v47 = [v46 isEqual:v126];

        if ((v47 & 1) == 0)
        {
          v52 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = [v36 expression];
            *(_DWORD *)buf = 138477827;
            uint64_t v142 = (uint64_t)v53;
            _os_log_impl(&dword_1C44F8000, v52, OS_LOG_TYPE_DEFAULT, "Sort index changed for: %{private}@", buf, 0xCu);
          }
          [v114 addObject:v37];
          v34 = (id *)v112;
          goto LABEL_51;
        }
        v48 = [*(id *)(v112 + 48) objectForKeyedSubscript:v37];
        char v49 = [v48 isEqual:v42];

        v34 = (id *)v112;
        objc_super v8 = v116;
        if ((v49 & 1) == 0) {
          [v108 addObject:v37];
        }
      }
LABEL_52:
      [v8 addObject:v37];
      [v122 setObject:v38 forKeyedSubscript:v37];
      [v123 setObject:v39 forKeyedSubscript:v37];
      [v121 setObject:v126 forKeyedSubscript:v37];
      [v120 setObject:v41 forKeyedSubscript:v37];
      [v119 setObject:v42 forKeyedSubscript:v37];

      ++v35;
    }
    while (v125 != v35);
    id v33 = obj;
    uint64_t v54 = [obj countByEnumeratingWithState:&v132 objects:v147 count:16];
    uint64_t v125 = v54;
  }
  while (v54);
LABEL_58:

  v55 = (void *)[v34[1] mutableCopy];
  [v55 minusSet:v8];
  v56 = (void *)[v8 mutableCopy];
  [v56 minusSet:v34[1]];
  v127 = v56;
  if (v105
    && ![v56 count]
    && ![v108 count]
    && ([v55 count] || objc_msgSend(v114, "count")))
  {
    v85 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v86 = [v55 count];
      uint64_t v87 = [v114 count];
      uint64_t v88 = [v108 count];
      *(_DWORD *)buf = 134218752;
      uint64_t v142 = v86;
      __int16 v143 = 2048;
      *(void *)v144 = v87;
      *(_WORD *)&v144[8] = 2048;
      *(void *)&v144[10] = v88;
      __int16 v145 = 2048;
      uint64_t v146 = v106;
      _os_log_impl(&dword_1C44F8000, v85, OS_LOG_TYPE_DEFAULT, "Delaying items. Removed: %lu, changedItems: %lu, solvingChanged: %lu, delegate: %p", buf, 0x2Au);
    }

    double v89 = *(double *)(v112 + 72);
    if ([v113 count] && !objc_msgSend(v55, "count"))
    {
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v90 = v113;
      uint64_t v91 = [v90 countByEnumeratingWithState:&v128 objects:v140 count:16];
      if (v91)
      {
        uint64_t v92 = v91;
        uint64_t v93 = *(void *)v129;
        double v94 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v92; ++i)
          {
            if (*(void *)v129 != v93) {
              objc_enumerationMutation(v90);
            }
            double v96 = -[PKMathRecognitionItem _remainingDelayForTargetDelay:](*(void **)(*((void *)&v128 + 1) + 8 * i), *(double *)(v112 + 72));
            if (v94 < v96) {
              double v94 = v96;
            }
          }
          uint64_t v92 = [v90 countByEnumeratingWithState:&v128 objects:v140 count:16];
        }
        while (v92);
      }
      else
      {
        double v94 = 0.0;
      }

      v98 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v142 = *(void *)&v94;
        _os_log_impl(&dword_1C44F8000, v98, OS_LOG_TYPE_DEFAULT, "Calculated delay: %g", buf, 0xCu);
      }

      double v99 = *(double *)(v112 + 72);
      if (v94 < v99) {
        double v99 = v94;
      }
      double v89 = fmax(v99, 0.1);
      objc_super v8 = v116;
    }
    id v84 = v109;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:v112 selector:sel_sendDelayedItems object:0];
    v100 = *(void **)(v112 + 64);
    *(void *)(v112 + 64) = 0;

    uint64_t v101 = [v84 copy];
    v102 = *(void **)(v112 + 64);
    *(void *)(v112 + 64) = v101;

    v103 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v104 = [v84 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v142 = v104;
      __int16 v143 = 2048;
      *(double *)v144 = v89;
      _os_log_impl(&dword_1C44F8000, v103, OS_LOG_TYPE_DEFAULT, "Schedule delayed items: %lu, %g", buf, 0x16u);
    }

    [(id)v112 performSelector:sel_sendDelayedItems withObject:0 afterDelay:v89];
    v57 = (void *)v106;
    v59 = v122;
    v58 = v123;
    v76 = v120;
    v73 = v121;
    v79 = v119;
  }
  else
  {
    v57 = (void *)v106;
    v59 = v122;
    v58 = v123;
    if ([v55 count] || objc_msgSend(v56, "count") || objc_msgSend(v114, "count"))
    {
      v60 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v61 = [v55 count];
        uint64_t v62 = [v56 count];
        uint64_t v63 = [v114 count];
        *(_DWORD *)buf = 134218752;
        uint64_t v142 = v61;
        v57 = (void *)v106;
        __int16 v143 = 2048;
        *(void *)v144 = v62;
        v58 = v123;
        *(_WORD *)&v144[8] = 2048;
        *(void *)&v144[10] = v63;
        __int16 v145 = 2048;
        uint64_t v146 = v106;
        _os_log_impl(&dword_1C44F8000, v60, OS_LOG_TYPE_DEFAULT, "Removed: %lu, newItems: %lu, changedItems: %lu, delegate: %p", buf, 0x2Au);
      }

      uint64_t v64 = v112;
      [v57 mathRecognitionController:v112 didUpdateExpressions:v114 newItems:v56 removedItems:v55 mathItems:v33];
    }
    else
    {
      v97 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C44F8000, v97, OS_LOG_TYPE_DEFAULT, "No change detected", buf, 2u);
      }

      uint64_t v64 = v112;
    }
    if ([v108 count] && (*(unsigned char *)(v64 + 80) & 2) != 0)
    {
      v65 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v66 = [v108 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v142 = v66;
        _os_log_impl(&dword_1C44F8000, v65, OS_LOG_TYPE_DEFAULT, "Solving style changed: %lu", buf, 0xCu);
      }

      uint64_t v64 = v112;
      [v57 mathRecognitionController:v112 solveStateChangedForExpressions:v108 mathItems:v33];
    }
    uint64_t v67 = [v8 copy];
    v68 = *(void **)(v64 + 8);
    *(void *)(v64 + 8) = v67;

    uint64_t v69 = [v122 copy];
    v70 = *(void **)(v64 + 16);
    *(void *)(v64 + 16) = v69;

    uint64_t v71 = [v58 copy];
    v72 = *(void **)(v64 + 24);
    *(void *)(v64 + 24) = v71;

    v73 = v121;
    uint64_t v74 = [v121 copy];
    v75 = *(void **)(v64 + 32);
    *(void *)(v64 + 32) = v74;

    v76 = v120;
    uint64_t v77 = [v120 copy];
    v78 = *(void **)(v64 + 40);
    *(void *)(v64 + 40) = v77;

    v79 = v119;
    uint64_t v80 = [v119 copy];
    v81 = *(void **)(v64 + 48);
    *(void *)(v64 + 48) = v80;

    uint64_t v82 = [v33 copy];
    uint64_t v83 = v64;
    id v84 = *(id *)(v64 + 56);
    *(void *)(v83 + 56) = v82;
  }

LABEL_74:
}

void __55__PKMathRecognitionController__shouldIgnoreMathResult___block_invoke()
{
  [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"=- "];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)_MergedGlobals_153;
  _MergedGlobals_153 = v0;
}

- (void)_updateExpressionForItem:(void *)a3 expression:
{
  if (a1)
  {
    id v5 = a3;
    id v9 = [a2 uuid];
    v6 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v6 setObject:v5 forKeyedSubscript:v9];

    uint64_t v7 = [v6 copy];
    objc_super v8 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v7;
  }
}

- (void)_drawingDidUpdate:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  if (a1 && [*(id *)(a1 + 56) count] && (*(unsigned char *)(a1 + 80) & 2) != 0)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    double v4 = [v34 strokes];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (([v9 _flags] & 0x20000000000) != 0)
          {
            uint64_t v10 = [v9 _strokeUUID];
            [v3 addObject:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v6);
    }

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v33 = uint64_t v32 = (void *)a1;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * j);
          double v18 = -[PKMathRecognitionItem heroStroke]((void *)v17);
          uint64_t v19 = v18;
          if (v18)
          {
            v20 = [v18 _strokeUUID];
            uint64_t v21 = [v3 containsObject:v20];

            if (v21 != [(id)v17 shouldSolveMathFlagIsSet])
            {
              if (v17)
              {
                *(unsigned char *)(v17 + 74) = v21;
                -[PKStrokeGroupItem refreshStrokesInDrawing:](*(id **)(v17 + 8), v34);
              }
              v22 = [(id)v17 uuid];
              [v33 addObject:v22];
            }
          }
          else
          {
            uint64_t v21 = 0;
          }
          char v23 = [(id)v17 uuid];

          if (v23)
          {
            v24 = [NSNumber numberWithBool:v21];
            v25 = [(id)v17 uuid];
            [v11 setObject:v24 forKeyedSubscript:v25];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v14);
    }

    if ([v33 count])
    {
      uint64_t v26 = [v11 copy];
      v27 = (void *)v32[6];
      v32[6] = v26;

      uint64_t v28 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [v33 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v44 = v29;
        _os_log_impl(&dword_1C44F8000, v28, OS_LOG_TYPE_DEFAULT, "Found %lu groups with updated solve state", buf, 0xCu);
      }

      uint64_t v30 = [v32 delegate];
      v31 = (void *)[v33 copy];
      [v30 mathRecognitionController:v32 solveStateChangedForExpressions:v31 mathItems:v32[7]];
    }
  }
}

- (void)setDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__sessionManager);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->__sessionManager, v4);
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    char v6 = (objc_opt_respondsToSelector() & 1) != 0 ? 2 : 0;
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v6;
    char v7 = (objc_opt_respondsToSelector() & 1) != 0 ? 4 : 0;
    *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v7;
    if ([(NSSet *)self->_currentItems count])
    {
      NSUInteger v8 = [(NSArray *)self->_currentMathRecognitionItems count];
      if (v4)
      {
        if (v8)
        {
          id v9 = os_log_create("com.apple.pencilkit", "Math");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            NSUInteger v10 = [(NSSet *)self->_currentItems count];
            int v14 = 134217984;
            NSUInteger v15 = v10;
            _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Updating new delegate with items: %lu", (uint8_t *)&v14, 0xCu);
          }

          uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
          currentItems = self->_currentItems;
          uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
          [v4 mathRecognitionController:self didUpdateExpressions:v11 newItems:currentItems removedItems:v13 mathItems:self->_currentMathRecognitionItems];
        }
      }
    }
  }
}

- (void)sendDelayedItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_delayedItems) {
    goto LABEL_7;
  }
  if ((*(unsigned char *)&self->_delegateFlags & 1) == 0) {
    goto LABEL_7;
  }
  v3 = [(PKMathRecognitionController *)self delegate];
  [v3 mathRecognitionControllerTimestampForLatestUserInteraction:self];
  double v5 = v4;

  if (v5 <= 0.0) {
    goto LABEL_7;
  }
  double v6 = CACurrentMediaTime() - v5;
  char v7 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    double v14 = v6;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "Interactive timestamp delta: %g", (uint8_t *)&v13, 0xCu);
  }

  if (v6 < self->_updateItemsDelay)
  {
    NSUInteger v10 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v11 = [(NSArray *)self->_delayedItems count];
      double v12 = self->_updateItemsDelay - v6;
      int v13 = 134218240;
      double v14 = *(double *)&v11;
      __int16 v15 = 2048;
      double v16 = v12;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Interactive delayed items: %lu, %g", (uint8_t *)&v13, 0x16u);
    }

    [(PKMathRecognitionController *)self performSelector:sel_sendDelayedItems withObject:0 afterDelay:self->_updateItemsDelay - v6];
  }
  else
  {
LABEL_7:
    delayedItems = self->_delayedItems;
    self->_delayedItems = 0;
    id v9 = delayedItems;

    -[PKMathRecognitionController actuallySendDelayedItems:]((uint64_t)self, v9);
  }
}

- (void)actuallySendDelayedItems:(uint64_t)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    double v4 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uint64_t v6 = [v3 count];
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Send delayed items: %lu", (uint8_t *)&v5, 0xCu);
    }

    if ([v3 count]) {
      -[PKMathRecognitionController _foundStrokeGroups:canDelay:](a1, v3, 0);
    }
  }
}

- (BOOL)processDelayedItemsIfNecessary
{
  delayedItems = self->_delayedItems;
  if (delayedItems)
  {
    double v4 = delayedItems;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_sendDelayedItems object:0];
    int v5 = self->_delayedItems;
    self->_delayedItems = 0;

    -[PKMathRecognitionController actuallySendDelayedItems:]((uint64_t)self, v4);
  }
  return delayedItems != 0;
}

- (void)didEraseStrokes:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_delegateFlags & 4) != 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v19 = self;
    obuint64_t j = self->_currentMathRecognitionItems;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(obj);
          }
          NSUInteger v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v9 = objc_msgSend(v8, "strokes", v19);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v24;
            while (2)
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v24 != v12) {
                  objc_enumerationMutation(v9);
                }
                double v14 = [*(id *)(*((void *)&v23 + 1) + 8 * j) _strokeUUID];
                int v15 = [v4 containsObject:v14];

                if (v15)
                {
                  double v16 = [v8 uuid];
                  [v21 addObject:v16];

                  goto LABEL_17;
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v6);
    }

    uint64_t v17 = [(PKMathRecognitionController *)v19 delegate];
    double v18 = (void *)[v21 copy];
    [v17 mathRecognitionController:v19 didEraseStrokesInExpressions:v18];
  }
}

- (PKMathRecognitionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__sessionManager);

  return (PKMathRecognitionControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self[1].super.isa);
  objc_destroyWeak((id *)&self->__sessionManager);
  objc_storeStrong((id *)&self->_delayedItems, 0);
  objc_storeStrong((id *)&self->_currentMathRecognitionItems, 0);
  objc_storeStrong((id *)&self->_shouldSolveMap, 0);
  objc_storeStrong((id *)&self->_expressionMap, 0);
  objc_storeStrong((id *)&self->_sortIndexMap, 0);
  objc_storeStrong((id *)&self->_stableIdentifierMap, 0);
  objc_storeStrong((id *)&self->_changeMap, 0);

  objc_storeStrong((id *)&self->_currentItems, 0);
}

@end
@interface _LTDisambiguableSentence
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasOverlapInRangeArray:(id)a3;
- (BOOL)_restoreChanges:(id)a3;
- (BOOL)hasDisambiguations;
- (BOOL)hasDisambiguationsOfType:(unint64_t)a3;
- (NSArray)history;
- (NSArray)targetPhrases;
- (NSString)romanization;
- (NSString)sourceText;
- (NSString)targetText;
- (NSUUID)UUID;
- (_LTDisambiguableSentence)initWithCoder:(id)a3;
- (_LTDisambiguableSentence)initWithSourceText:(id)a3 targetPhrases:(id)a4 selectedPhraseIndex:(unint64_t)a5;
- (_LTDisambiguableSentenceDelegate)delegate;
- (_LTDisambiguableSentenceHistoryProviding)historyProvider;
- (_LTDisambiguationNode)selectedTargetPhrase;
- (id)_directedEdgeFromUnvalidatedEdge:(id)a3;
- (id)_genderForLinkIndex:(unint64_t)a3 inPhraseIndex:(unint64_t)a4;
- (id)_generateAttributedStringForLocation:(unint64_t)a3 result:(id)a4 excludedTypes:(id)a5 globalAttributes:(id)a6 attributeProvider:(id)a7;
- (id)_historyForEncoding;
- (id)_includedTypesFromDelegate;
- (id)_includedTypesFromExcludedTypes:(id)a3;
- (id)_preferredEdgeFromEdgesWithDuplicateMeaning:(id)a3 forLinkIndex:(unint64_t)a4 inPhrase:(unint64_t)a5;
- (id)_userSelectionFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)meaningDescriptionForLinkIndex:(unint64_t)a3 inTargetPhrase:(unint64_t)a4;
- (id)menuConfigurationsForLinkIndex:(unint64_t)a3;
- (id)sourceTextSnippetForLinkIndex:(unint64_t)a3;
- (unint64_t)_preferredGenderFromEdgesWithDuplicateMeaning:(id)a3 forLinkIndex:(unint64_t)a4 inPhrase:(unint64_t)a5;
- (unint64_t)selectedPhraseIndex;
- (void)_commonInit;
- (void)_insertPrefix:(id)a3;
- (void)_removeRomanization;
- (void)_removeUnvalidatedAdjacencyLists;
- (void)_validateAndPopulateEdges;
- (void)addNodeIndexToHistory:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHistoryProvider:(id)a3;
- (void)setSelectedPhraseIndex:(unint64_t)a3;
@end

@implementation _LTDisambiguableSentence

- (_LTDisambiguableSentence)initWithSourceText:(id)a3 targetPhrases:(id)a4 selectedPhraseIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_LTDisambiguableSentence;
  v10 = [(_LTDisambiguableSentence *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    sourceText = v10->_sourceText;
    v10->_sourceText = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    targetPhrases = v10->_targetPhrases;
    v10->_targetPhrases = (NSArray *)v13;

    v10->_selectedPhraseIndex = a5;
    uint64_t v15 = [MEMORY[0x263F08C38] UUID];
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v15;

    [(_LTDisambiguableSentence *)v10 _commonInit];
    [(_LTDisambiguableSentence *)v10 _validateAndPopulateEdges];
    v17 = v10;
  }

  return v10;
}

- (void)_commonInit
{
  objc_storeWeak((id *)&self->_historyProvider, self);
  v3 = (void *)MEMORY[0x263EFF980];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_selectedPhraseIndex];
  v4 = [v3 arrayWithObject:v6];
  history = self->_history;
  self->_history = v4;
}

- (_LTDisambiguationNode)selectedTargetPhrase
{
  unint64_t selectedPhraseIndex = self->_selectedPhraseIndex;
  if (selectedPhraseIndex >= [(NSArray *)self->_targetPhrases count])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->_targetPhrases objectAtIndexedSubscript:self->_selectedPhraseIndex];
  }

  return (_LTDisambiguationNode *)v4;
}

- (BOOL)hasDisambiguations
{
  return [(NSArray *)self->_targetPhrases lt_hasObjectPassingTest:&__block_literal_global_1];
}

- (BOOL)hasDisambiguationsOfType:(unint64_t)a3
{
  targetPhrases = self->_targetPhrases;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53___LTDisambiguableSentence_hasDisambiguationsOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e31_B16__0___LTDisambiguationNode_8l;
  v5[4] = a3;
  return [(NSArray *)targetPhrases lt_hasObjectPassingTest:v5];
}

- (NSString)targetText
{
  v2 = [(_LTDisambiguableSentence *)self selectedTargetPhrase];
  v3 = [v2 text];
  v4 = v3;
  if (!v3) {
    v3 = &stru_26FAADE68;
  }
  v5 = v3;

  return v5;
}

- (NSString)romanization
{
  v2 = [(_LTDisambiguableSentence *)self selectedTargetPhrase];
  v3 = [v2 romanization];

  return (NSString *)v3;
}

- (id)menuConfigurationsForLinkIndex:(unint64_t)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v3 = [(_LTDisambiguableSentence *)self selectedTargetPhrase];
  v40 = v3;
  if (!v3)
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_31;
  }
  v37 = [v3 links];
  v4 = v37;
  unint64_t v5 = [v37 count];
  id v6 = (void *)MEMORY[0x263EFFA68];
  if (v5 <= a3) {
    goto LABEL_29;
  }
  v36 = objc_msgSend(v37, "objectAtIndexedSubscript:");
  v7 = [MEMORY[0x263EFF980] array];
  v41 = [MEMORY[0x263EFF980] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v8 = [v36 adjacencyList];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = *(void *)v53;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v53 != v10) {
        objc_enumerationMutation(v8);
      }
      v12 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      uint64_t v13 = [v12 type];
      v14 = v7;
      if (v13)
      {
        if (v13 != 1) {
          continue;
        }
        v14 = v41;
      }
      [v14 addObject:v12];
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
  }
  while (v9);
LABEL_14:

  uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v16);
        }
        v20 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v21 = [v20 menuDescription];
        uint64_t v22 = [v15 objectForKeyedSubscript:v21];
        v23 = (void *)v22;
        if (v22) {
          v24 = (void *)v22;
        }
        else {
          v24 = v6;
        }
        id v25 = v24;

        v26 = [v25 arrayByAddingObject:v20];

        [v15 setObject:v26 forKeyedSubscript:v21];
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v17);
  }

  v27 = [MEMORY[0x263EFF9A0] dictionary];
  objc_initWeak(&location, self);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __59___LTDisambiguableSentence_menuConfigurationsForLinkIndex___block_invoke;
  v44[3] = &unk_2651DB7B0;
  objc_copyWeak(v46, &location);
  id v28 = v27;
  id v45 = v28;
  v46[1] = (id)a3;
  [v15 enumerateKeysAndObjectsUsingBlock:v44];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __59___LTDisambiguableSentence_menuConfigurationsForLinkIndex___block_invoke_2;
  v42[3] = &unk_2651DB7D8;
  id v29 = v28;
  id v43 = v29;
  v30 = [v16 _ltCompactMap:v42];
  v31 = [v30 sortedArrayUsingSelector:sel_compare_];
  v32 = [v41 sortedArrayUsingSelector:sel_compare_];
  v33 = [(_LTDisambiguableSentence *)self _includedTypesFromDelegate];
  v34 = [MEMORY[0x263EFF980] array];
  if ([v33 containsObject:&unk_26FABA8E8]) {
    [v34 addObjectsFromArray:v31];
  }
  if ([v33 containsObject:&unk_26FABA900]) {
    [v34 addObjectsFromArray:v32];
  }
  id v6 = (void *)[v34 copy];

  objc_destroyWeak(v46);
  objc_destroyWeak(&location);

  v4 = v37;
LABEL_29:

LABEL_31:

  return v6;
}

- (id)sourceTextSnippetForLinkIndex:(unint64_t)a3
{
  unint64_t v5 = [(_LTDisambiguableSentence *)self selectedTargetPhrase];
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 links];
    unint64_t v8 = [v7 count];

    if (v8 > a3)
    {
      uint64_t v9 = [v6 links];
      uint64_t v10 = [v9 objectAtIndexedSubscript:a3];

      uint64_t v11 = [(_LTDisambiguableSentence *)self sourceText];
      uint64_t v12 = [v10 sourceRange];
      v14 = objc_msgSend(v11, "substringWithRange:", v12, v13);

      goto LABEL_7;
    }
    uint64_t v15 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_LTDisambiguableSentence sourceTextSnippetForLinkIndex:]();
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (id)meaningDescriptionForLinkIndex:(unint64_t)a3 inTargetPhrase:(unint64_t)a4
{
  v7 = [(_LTDisambiguableSentence *)self targetPhrases];
  unint64_t v8 = [v7 count];

  if (v8 <= a4)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v9 = [(_LTDisambiguableSentence *)self targetPhrases];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a4];

    uint64_t v11 = [v10 links];
    unint64_t v12 = [v11 count];

    if (v12 <= a3)
    {
      uint64_t v18 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_LTDisambiguableSentence meaningDescriptionForLinkIndex:inTargetPhrase:]();
      }
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v13 = [v10 links];
      v14 = [v13 objectAtIndexedSubscript:a3];

      uint64_t v15 = [v14 adjacencyList];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __74___LTDisambiguableSentence_meaningDescriptionForLinkIndex_inTargetPhrase___block_invoke;
      v21[3] = &__block_descriptor_40_e25_B16__0___LTDirectedEdge_8l;
      v21[4] = a4;
      id v16 = objc_msgSend(v15, "lt_firstObjectPassingTest:", v21);

      if (v16)
      {
        uint64_t v17 = [v16 menuDescription];
      }
      else
      {
        objc_super v19 = _LTOSLogDisambiguation();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[_LTDisambiguableSentence meaningDescriptionForLinkIndex:inTargetPhrase:]();
        }
        uint64_t v17 = 0;
      }
    }
  }

  return v17;
}

- (void)_insertPrefix:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    unint64_t v5 = [NSString stringWithFormat:@"%@%@", v4, self->_sourceText];
    sourceText = self->_sourceText;
    self->_sourceText = v5;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = [(_LTDisambiguableSentence *)self targetPhrases];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) _insertPrefix:v4];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (NSArray)history
{
  v2 = (void *)[(NSMutableArray *)self->_history copy];

  return (NSArray *)v2;
}

- (void)addNodeIndexToHistory:(unint64_t)a3
{
  history = self->_history;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)history addObject:v4];
}

- (void)setHistoryProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_historyProvider);

  if (WeakRetained != v4)
  {
    id v6 = (_LTDisambiguableSentence *)objc_loadWeakRetained((id *)&self->_historyProvider);
    objc_storeWeak((id *)&self->_historyProvider, v4);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = [(_LTDisambiguableSentence *)v6 history];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v4, "addNodeIndexToHistory:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "unsignedIntegerValue"));
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    if (v6 == self) {
      [(NSMutableArray *)self->_history removeAllObjects];
    }
  }
}

- (void)setSelectedPhraseIndex:(unint64_t)a3
{
  if (self->_selectedPhraseIndex != a3 && [(NSArray *)self->_targetPhrases count] > a3)
  {
    id v9 = [(_LTDisambiguableSentence *)self _userSelectionFromIndex:self->_selectedPhraseIndex toIndex:a3];
    self->_unint64_t selectedPhraseIndex = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_historyProvider);
    [WeakRetained addNodeIndexToHistory:a3];

    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v8 = [(NSArray *)self->_targetPhrases objectAtIndexedSubscript:a3];
      [v7 disambiguableSentence:self didSelectNode:v8 atIndex:a3 withSelection:v9];
    }
  }
}

- (BOOL)_restoreChanges:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 changeMapping];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___LTDisambiguableSentence__restoreChanges___block_invoke;
  aBlock[3] = &unk_2651DB820;
  aBlock[4] = self;
  id v6 = v5;
  id v34 = v6;
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = [(_LTDisambiguableSentence *)self targetPhrases];
  if ([v8 count])
  {
    id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    uint64_t v10 = [(_LTDisambiguableSentence *)self targetPhrases];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __44___LTDisambiguableSentence__restoreChanges___block_invoke_2;
    v30[3] = &unk_2651DB870;
    id v32 = v7;
    id v11 = v9;
    id v31 = v11;
    [v10 enumerateObjectsUsingBlock:v30];

    uint64_t v27 = 0;
    v28[0] = &v27;
    v28[1] = 0x2020000000;
    uint64_t v29 = 0;
    long long v12 = [v11 firstObject];
    [v12 doubleValue];
    uint64_t v14 = v13;

    uint64_t v29 = v14;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __44___LTDisambiguableSentence__restoreChanges___block_invoke_4;
    v22[3] = &unk_2651DB898;
    v22[4] = &v27;
    v22[5] = &v23;
    [v11 enumerateObjectsUsingBlock:v22];
    uint64_t v15 = v24[3];
    BOOL v16 = v15 != 0;
    if (v15)
    {
      uint64_t v17 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = v24[3];
        uint64_t v19 = *(void *)(v28[0] + 24);
        *(_DWORD *)buf = 134218240;
        uint64_t v36 = v18;
        __int16 v37 = 2048;
        uint64_t v38 = v19;
        _os_log_impl(&dword_24639B000, v17, OS_LOG_TYPE_INFO, "Highest scoring node was %zu with score %f; making this the selected node in the sentence to restore user selections",
          buf,
          0x16u);
      }
      self->_unint64_t selectedPhraseIndex = v24[3];
    }
    else
    {
      v20 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[_LTDisambiguableSentence _restoreChanges:]((uint64_t)v28, v20);
      }
    }
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)_userSelectionFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = [(_LTDisambiguableSentence *)self targetPhrases];
  unint64_t v8 = [v7 count];

  id v9 = 0;
  if (a3 != a4 && v8 > a3 && v8 > a4)
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy_;
    uint64_t v27 = __Block_byref_object_dispose_;
    id v28 = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = [(_LTDisambiguableSentence *)self targetPhrases];
    id v11 = [v10 objectAtIndexedSubscript:a3];

    long long v12 = [v11 links];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __60___LTDisambiguableSentence__userSelectionFromIndex_toIndex___block_invoke;
    v18[3] = &unk_2651DB8C0;
    v18[4] = &v23;
    v18[5] = &v19;
    v18[6] = a4;
    [v12 enumerateObjectsUsingBlock:v18];

    uint64_t v13 = [(_LTDisambiguableSentence *)self sourceTextSnippetForLinkIndex:v20[3]];
    uint64_t v14 = (void *)v13;
    if (v24[5] && v20[3] != 0x7FFFFFFFFFFFFFFFLL && v13)
    {
      uint64_t v15 = [_LTDisambiguationUserSelection alloc];
      id v9 = [(_LTDisambiguationUserSelection *)v15 initWithEdge:v24[5] sourceSnippet:v14 linkIndex:v20[3]];
    }
    else
    {
      BOOL v16 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v30 = a3;
        __int16 v31 = 2048;
        unint64_t v32 = a4;
        _os_log_impl(&dword_24639B000, v16, OS_LOG_TYPE_INFO, "Failed to find source edge when moving from node %zu to %zu; not providing user selection info",
          buf,
          0x16u);
      }
      id v9 = 0;
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }

  return v9;
}

- (id)_genderForLinkIndex:(unint64_t)a3 inPhraseIndex:(unint64_t)a4
{
  if ([(NSArray *)self->_targetPhrases count] <= a4)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v7 = [(NSArray *)self->_targetPhrases objectAtIndexedSubscript:a4];
    unint64_t v8 = [v7 links];
    if ([v8 count] <= a3)
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v9 = [v8 objectAtIndexedSubscript:a3];
      uint64_t v10 = [v9 gender];
    }
  }

  return v10;
}

- (unint64_t)_preferredGenderFromEdgesWithDuplicateMeaning:(id)a3 forLinkIndex:(unint64_t)a4 inPhrase:(unint64_t)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(_LTDisambiguableSentence *)self _genderForLinkIndex:a4 inPhraseIndex:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    unint64_t v11 = [v9 unsignedIntegerValue];
  }
  else
  {
    unint64_t v37 = a4;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_historyProvider);
    uint64_t v13 = [WeakRetained history];
    uint64_t v14 = [v13 reverseObjectEnumerator];

    obuint64_t j = v14;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      uint64_t v18 = v39;
LABEL_5:
      uint64_t v19 = 0;
      uint64_t v35 = v16;
      while (1)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(obj);
        }
        unint64_t v20 = [*(id *)(*((void *)&v40 + 1) + 8 * v19) unsignedIntegerValue];
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v39[0] = __96___LTDisambiguableSentence__preferredGenderFromEdgesWithDuplicateMeaning_forLinkIndex_inPhrase___block_invoke;
        v39[1] = &__block_descriptor_40_e25_B16__0___LTDirectedEdge_8l;
        v39[2] = v20;
        uint64_t v21 = objc_msgSend(v8, "lt_firstObjectPassingTest:", v38);
        uint64_t v22 = [v21 targetGender];
        uint64_t v23 = v22;
        if (v22) {
          break;
        }
        if (v20 < [(NSArray *)self->_targetPhrases count])
        {
          v24 = v18;
          uint64_t v25 = v17;
          id v26 = v8;
          uint64_t v27 = [(NSArray *)self->_targetPhrases objectAtIndexedSubscript:v20];
          id v28 = [v27 links];
          unint64_t v29 = [v28 count];

          if (v29 > v37)
          {
            unint64_t v30 = [v27 links];
            __int16 v31 = [v30 objectAtIndexedSubscript:v37];

            unint64_t v32 = [v31 gender];
            if (v32)
            {
              id v34 = v32;
              unint64_t v11 = [v32 unsignedIntegerValue];

              id v8 = v26;
              goto LABEL_18;
            }
          }
          id v8 = v26;
          uint64_t v17 = v25;
          uint64_t v18 = v24;
          uint64_t v16 = v35;
        }

        if (v16 == ++v19)
        {
          uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v16) {
            goto LABEL_5;
          }
          goto LABEL_16;
        }
      }
      unint64_t v11 = [v22 unsignedIntegerValue];
LABEL_18:

      goto LABEL_19;
    }
LABEL_16:

    unint64_t v11 = 0;
LABEL_19:
    uint64_t v10 = 0;
  }

  return v11;
}

- (id)_preferredEdgeFromEdgesWithDuplicateMeaning:(id)a3 forLinkIndex:(unint64_t)a4 inPhrase:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v9 = [(_LTDisambiguableSentence *)self _preferredGenderFromEdgesWithDuplicateMeaning:v8 forLinkIndex:a4 inPhrase:a5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __94___LTDisambiguableSentence__preferredEdgeFromEdgesWithDuplicateMeaning_forLinkIndex_inPhrase___block_invoke;
  v15[3] = &__block_descriptor_40_e25_B16__0___LTDirectedEdge_8l;
  v15[4] = v9;
  uint64_t v10 = objc_msgSend(v8, "lt_firstObjectPassingTest:", v15);
  unint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v8 firstObject];
  }
  uint64_t v13 = v12;

  return v13;
}

- (id)_generateAttributedStringForLocation:(unint64_t)a3 result:(id)a4 excludedTypes:(id)a5 globalAttributes:(id)a6 attributeProvider:(id)a7
{
  id v26 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a3) {
    [(_LTDisambiguableSentence *)self targetText];
  }
  else {
  uint64_t v15 = [(_LTDisambiguableSentence *)self sourceText];
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v15];
  uint64_t v17 = v16;
  if (v13) {
    objc_msgSend(v16, "addAttributes:range:", v13, 0, objc_msgSend(v16, "length"));
  }
  uint64_t v18 = [(_LTDisambiguableSentence *)self selectedTargetPhrase];
  if (v18)
  {
    uint64_t v19 = [(_LTDisambiguableSentence *)self _includedTypesFromExcludedTypes:v12];
    unint64_t v20 = [v18 links];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    void v28[2] = __121___LTDisambiguableSentence__generateAttributedStringForLocation_result_excludedTypes_globalAttributes_attributeProvider___block_invoke;
    v28[3] = &unk_2651DB8E8;
    id v29 = v19;
    unint64_t v35 = a3;
    id v34 = v14;
    uint64_t v21 = v27;
    id v30 = v27;
    __int16 v31 = self;
    id v32 = v18;
    id v22 = v17;
    id v33 = v22;
    id v23 = v19;
    [v20 enumerateObjectsUsingBlock:v28];

    v24 = (void *)[v22 copy];
  }
  else
  {
    v24 = (void *)[v17 copy];
    uint64_t v21 = v27;
  }

  return v24;
}

- (id)_includedTypesFromExcludedTypes:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9C0] setWithArray:&unk_26FABA8A0];
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFFA08] set];
  }
  [v4 minusSet:v3];
  unint64_t v5 = (void *)[v4 copy];

  return v5;
}

- (id)_includedTypesFromDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = [WeakRetained excludedTypesForDisambiguableSentence:self];
  }
  else
  {
    id v4 = 0;
  }
  unint64_t v5 = [(_LTDisambiguableSentence *)self _includedTypesFromExcludedTypes:v4];

  return v5;
}

- (void)_validateAndPopulateEdges
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Failed to validate all links and edges; using a sentence with no disambiguations",
    v1,
    2u);
}

- (void)_removeUnvalidatedAdjacencyLists
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(_LTDisambiguableSentence *)self targetPhrases];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v17 + 1) + 8 * v6);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = objc_msgSend(v7, "links", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v14;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v14 != v11) {
                objc_enumerationMutation(v8);
              }
              [*(id *)(*((void *)&v13 + 1) + 8 * v12++) _finishValidating];
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)_removeRomanization
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(_LTDisambiguableSentence *)self targetPhrases];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _removeRomanization];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_directedEdgeFromUnvalidatedEdge:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_LTDisambiguableSentence *)self targetPhrases];
  unint64_t v6 = [v4 targetPhraseIndex];
  if (v6 >= [v5 count])
  {
    id v28 = _LTOSLogDisambiguation();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[_LTDisambiguableSentence _directedEdgeFromUnvalidatedEdge:].cold.4(v6, v28, v29, v30, v31, v32, v33, v34);
    }
    unint64_t v35 = 0;
  }
  else
  {
    long long v7 = [v5 objectAtIndexedSubscript:v6];
    unint64_t v8 = [v4 targetLinkIndex];
    long long v9 = [v7 links];
    unint64_t v10 = [v9 count];

    if (v8 >= v10)
    {
      uint64_t v36 = _LTOSLogDisambiguation();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[_LTDisambiguableSentence _directedEdgeFromUnvalidatedEdge:](v8, v36, v37, v38, v39, v40, v41, v42);
      }
      unint64_t v35 = 0;
    }
    else
    {
      uint64_t v11 = [v7 links];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v8];

      NSUInteger v13 = [v12 sourceRange];
      NSUInteger v15 = v14;
      long long v16 = [(_LTDisambiguableSentence *)self sourceText];
      if (objc_msgSend(v16, "lt_validSubrange:", v13, v15))
      {
        NSUInteger v17 = [v12 targetRange];
        NSUInteger v19 = v18;
        long long v20 = [v7 text];
        if (objc_msgSend(v20, "lt_validSubrange:", v17, v19))
        {
          v47 = v20;
          uint64_t v21 = objc_msgSend(v20, "substringWithRange:", v17, v19);
          id v22 = [v12 _unvalidatedEdgeFromAdjacencyListMatchingTargetNodeIndex:v6];
          uint64_t v23 = [v22 targetGender];
          v24 = [v22 defaultGender];
          uint64_t v25 = [v4 type];
          long long v48 = v22;
          if (v25 == 1)
          {
            id v26 = [v4 targetGender];
            uint64_t v27 = +[_LTDirectedEdge genderEdgeWithTargetPhraseIndex:targetPreview:gender:defaultGender:](_LTDirectedEdge, "genderEdgeWithTargetPhraseIndex:targetPreview:gender:defaultGender:", v6, v21, [v26 unsignedIntegerValue], objc_msgSend(v24, "unsignedIntegerValue"));
          }
          else
          {
            if (v25)
            {
              unexpectedDisambiguationTypeException([v4 type]);
              id v46 = (id)objc_claimAutoreleasedReturnValue();
              objc_exception_throw(v46);
            }
            id v26 = [v4 meaningDescription];
            uint64_t v27 = +[_LTDirectedEdge meaningEdgeWithTargetPhraseIndex:v6 targetPreview:v21 meaningDescription:v26 targetGender:v23 defaultGender:v24];
          }
          unint64_t v35 = (void *)v27;

          long long v20 = v47;
        }
        else
        {
          v44 = _LTOSLogDisambiguation();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            -[_LTDisambiguableSentence _directedEdgeFromUnvalidatedEdge:](v44, v17, v19, v20);
          }
          unint64_t v35 = 0;
        }
      }
      else
      {
        long long v43 = _LTOSLogDisambiguation();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[_LTDisambiguableSentence _directedEdgeFromUnvalidatedEdge:](v43, v13, v15, v16);
        }
        unint64_t v35 = 0;
      }
    }
  }

  return v35;
}

- (BOOL)_hasOverlapInRangeArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [a3 sortedArrayUsingComparator:&__block_literal_global_41];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "rangeValue", (void)v11);
        if (v8 < v5)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
        unint64_t v5 = v8 + v9;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_historyForEncoding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_historyProvider);
  id v3 = [WeakRetained history];

  uint64_t v4 = objc_msgSend(v3, "lt_suffixWithMaxLength:", 10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  sourceText = self->_sourceText;
  id v5 = a3;
  [v5 encodeObject:sourceText forKey:@"sourceText"];
  [v5 encodeObject:self->_targetPhrases forKey:@"targetPhrases"];
  [v5 encodeInteger:self->_selectedPhraseIndex forKey:@"selectedPhraseIndex"];
  [v5 encodeObject:self->_UUID forKey:@"UUID"];
  id v6 = [(_LTDisambiguableSentence *)self _historyForEncoding];
  [v5 encodeObject:v6 forKey:@"history"];
}

- (_LTDisambiguableSentence)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_LTDisambiguableSentence;
  id v5 = [(_LTDisambiguableSentence *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceText"];
    sourceText = v5->_sourceText;
    v5->_sourceText = (NSString *)v6;

    unint64_t v8 = (void *)MEMORY[0x263EFFA08];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    unint64_t v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"targetPhrases"];
    targetPhrases = v5->_targetPhrases;
    v5->_targetPhrases = (NSArray *)v11;

    v5->_unint64_t selectedPhraseIndex = [v4 decodeIntegerForKey:@"selectedPhraseIndex"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v13;

    [(_LTDisambiguableSentence *)v5 _commonInit];
    NSUInteger v15 = (void *)MEMORY[0x263EFFA08];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    NSUInteger v17 = [v15 setWithArray:v16];
    NSUInteger v18 = [v4 decodeObjectOfClasses:v17 forKey:@"history"];

    if ([v18 count])
    {
      uint64_t v19 = [MEMORY[0x263EFF980] arrayWithArray:v18];
      history = v5->_history;
      v5->_history = (NSMutableArray *)v19;
    }
    uint64_t v21 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "allocWithZone:"), "initWithArray:copyItems:", self->_targetPhrases, 1);
  uint64_t v6 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  long long v7 = (void *)[(NSString *)self->_sourceText copy];
  unint64_t v8 = (void *)[v6 initWithSourceText:v7 targetPhrases:v5 selectedPhraseIndex:self->_selectedPhraseIndex];

  return v8;
}

- (NSString)sourceText
{
  return self->_sourceText;
}

- (NSArray)targetPhrases
{
  return self->_targetPhrases;
}

- (unint64_t)selectedPhraseIndex
{
  return self->_selectedPhraseIndex;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (_LTDisambiguableSentenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_LTDisambiguableSentenceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_LTDisambiguableSentenceHistoryProviding)historyProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_historyProvider);

  return (_LTDisambiguableSentenceHistoryProviding *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_historyProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_targetPhrases, 0);
  objc_storeStrong((id *)&self->_sourceText, 0);

  objc_storeStrong((id *)&self->_history, 0);
}

- (void)sourceTextSnippetForLinkIndex:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_24639B000, v0, (uint64_t)v0, "Requested source snippet for out of bounds link index %zu of %zu, not providing a source snippet", v1);
}

- (void)meaningDescriptionForLinkIndex:inTargetPhrase:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_24639B000, v0, OS_LOG_TYPE_DEBUG, "There are no meaning edges in phase %zu at link %zu; can't return a meaning description",
    v1,
    0x16u);
}

- (void)meaningDescriptionForLinkIndex:inTargetPhrase:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_24639B000, v0, (uint64_t)v0, "Requested meaning description for out of bounds link index %zu of %zu, not providing a meaning description", v1);
}

- (void)_restoreChanges:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_24639B000, a2, OS_LOG_TYPE_DEBUG, "Highest scoring node was initial node with score %f; no need to change selected node to restore previous user selections",
    (uint8_t *)&v3,
    0xCu);
}

- (void)_directedEdgeFromUnvalidatedEdge:(NSUInteger)a3 .cold.1(void *a1, NSUInteger a2, NSUInteger a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v7 = a1;
  v12.id location = a2;
  v12.length = a3;
  unint64_t v8 = NSStringFromRange(v12);
  [a4 length];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_24639B000, v7, v9, "Failed to create directed edge; range %{public}@ invalid in target string of length %zu",
    v10);
}

- (void)_directedEdgeFromUnvalidatedEdge:(NSUInteger)a3 .cold.2(void *a1, NSUInteger a2, NSUInteger a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v7 = a1;
  v12.id location = a2;
  v12.length = a3;
  unint64_t v8 = NSStringFromRange(v12);
  [a4 length];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_24639B000, v7, v9, "Failed to create directed edge; range %{public}@ invalid in source string of length %zu",
    v10);
}

- (void)_directedEdgeFromUnvalidatedEdge:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)_directedEdgeFromUnvalidatedEdge:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

@end
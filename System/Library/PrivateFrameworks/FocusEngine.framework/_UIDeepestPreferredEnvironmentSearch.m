@interface _UIDeepestPreferredEnvironmentSearch
- (BOOL)allowsOverridingPreferedFocusEnvironments;
- (_FEDebugLogNode)debugLog;
- (id)_overridingPreferredFocusEnvironmentForPreferredEnvironment:(id)a3 visitedFocusEnvironments:(id)a4;
- (id)deepestPreferredFocusEnvironmentForEnvironment:(id)a3;
- (id)deepestPreferredFocusableItemForEnvironment:(id)a3 withRequest:(id)a4;
- (void)_reportDidFindLockedFocusEnvironment:(id)a3;
- (void)_reportDidFindOverridingPreferredFocusEnvironment:(id)a3 source:(id)a4;
- (void)_reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:(id)a3;
- (void)_reportFinishedEvaluatingAllPreferencesForEnvironmentInContext:(id)a3 result:(int64_t)a4;
- (void)_reportFoundFocusableItem:(id)a3 inContext:(id)a4;
- (void)_reportStartingSearch;
- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3;
- (void)setDebugLog:(id)a3;
@end

@implementation _UIDeepestPreferredEnvironmentSearch

- (id)deepestPreferredFocusableItemForEnvironment:(id)a3 withRequest:(id)a4
{
  id v7 = a3;
  id v25 = a4;
  if (!v7)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_FEFocusEnvironmentPreferenceEnumerator.m", 574, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  [(_UIDeepestPreferredEnvironmentSearch *)self _reportStartingSearch];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__0;
  v56 = __Block_byref_object_dispose__0;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__0;
  v50 = __Block_byref_object_dispose__0;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__0;
  v44 = __Block_byref_object_dispose__0;
  id v45 = 0;
  v24 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
  v8 = [v25 focusSystem];
  v9 = [v8 _deepestPreferredFocusableItemCacheForCurrentUpdate];

  v10 = -[_FEFocusEnvironmentPreferenceEnumerator initWithEnumerationMode:]([_FEFocusEnvironmentPreferenceEnumerator alloc], "initWithEnumerationMode:", [v25 isMovementRequest] ^ 1);
  [(_FEFocusEnvironmentPreferenceEnumerator *)v10 setDebugLog:self->_debugLog];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke;
  v35[3] = &unk_265328398;
  v38 = &v46;
  v39 = &v52;
  id v11 = v9;
  id v36 = v11;
  v37 = self;
  [(_FEFocusEnvironmentPreferenceEnumerator *)v10 setDidVisitAllPreferencesForEnvironmentHandler:v35];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_2;
  v34[3] = &unk_2653283C0;
  v34[4] = &v52;
  [(_FEFocusEnvironmentPreferenceEnumerator *)v10 setShouldInferPreferenceForEnvironmentHandler:v34];
  BOOL v12 = [(_UIDeepestPreferredEnvironmentSearch *)self allowsOverridingPreferedFocusEnvironments];
  id v23 = v7;
  if (v7)
  {
    v13 = v23;
    do
    {
      v14 = (void *)v53[5];
      v53[5] = 0;

      v15 = (void *)v47[5];
      v47[5] = 0;

      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __96___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusableItemForEnvironment_withRequest___block_invoke_3;
      v26[3] = &unk_2653283E8;
      id v27 = v11;
      v31 = &v46;
      id v16 = v13;
      id v28 = v16;
      v32 = &v52;
      id v17 = v25;
      v33 = &v40;
      id v29 = v17;
      v30 = self;
      [(_FEFocusEnvironmentPreferenceEnumerator *)v10 enumeratePreferencesForEnvironment:v16 usingBlock:v26];
      if (v41[5]) {
        -[_UIDeepestPreferredEnvironmentSearch _reportDidFindLockedFocusEnvironment:](self, "_reportDidFindLockedFocusEnvironment:");
      }
      [(_UIDeepestPreferredEnvironmentSearch *)self _reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:v53[5]];
      if (v41[5]) {
        BOOL v18 = 0;
      }
      else {
        BOOL v18 = v12;
      }
      if (v18 && (uint64_t v19 = v47[5]) != 0)
      {
        v13 = [(_UIDeepestPreferredEnvironmentSearch *)self _overridingPreferredFocusEnvironmentForPreferredEnvironment:v19 visitedFocusEnvironments:v24];
      }
      else
      {
        v13 = 0;
      }
    }
    while (v13);
  }
  id v20 = (id)v53[5];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  return v20;
}

- (id)deepestPreferredFocusEnvironmentForEnvironment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_FEFocusEnvironmentPreferenceEnumerator.m", 701, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];
  }
  v6 = +[_FEFocusSystem focusSystemForEnvironment:v5];
  id v7 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
  id v16 = v5;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  v8 = [[_FEFocusEnvironmentPreferenceEnumerator alloc] initWithEnumerationMode:1];
  [(_FEFocusEnvironmentPreferenceEnumerator *)v8 setAllowsInferringPreferences:0];
  if (v5)
  {
    v9 = v16;
    while (1)
    {
      v10 = (void *)v28[5];
      v28[5] = 0;

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __87___UIDeepestPreferredEnvironmentSearch_deepestPreferredFocusEnvironmentForEnvironment___block_invoke;
      v17[3] = &unk_265328410;
      uint64_t v19 = &v21;
      id v18 = v6;
      id v20 = &v27;
      [(_FEFocusEnvironmentPreferenceEnumerator *)v8 enumeratePreferencesForEnvironment:v9 usingBlock:v17];
      if (v22[5])
      {
        -[_UIDeepestPreferredEnvironmentSearch _reportDidFindLockedFocusEnvironment:](self, "_reportDidFindLockedFocusEnvironment:");
        if (v22[5]) {
          break;
        }
      }
      uint64_t v11 = v28[5];
      if (!v11) {
        break;
      }
      uint64_t v12 = [(_UIDeepestPreferredEnvironmentSearch *)self _overridingPreferredFocusEnvironmentForPreferredEnvironment:v11 visitedFocusEnvironments:v7];

      v9 = (void *)v12;
      if (!v12) {
        goto LABEL_11;
      }
    }
  }
LABEL_11:
  id v13 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)_overridingPreferredFocusEnvironmentForPreferredEnvironment:(id)a3 visitedFocusEnvironments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_FEFocusEnvironmentPreferenceEnumerator.m", 747, @"Invalid parameter not satisfying: %@", @"preferredDestinationEnvironment" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"_FEFocusEnvironmentPreferenceEnumerator.m", 748, @"Invalid parameter not satisfying: %@", @"visitedFocusEnvironments" object file lineNumber description];

LABEL_3:
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  id v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __125___UIDeepestPreferredEnvironmentSearch__overridingPreferredFocusEnvironmentForPreferredEnvironment_visitedFocusEnvironments___block_invoke;
  v17[3] = &unk_265328438;
  id v10 = v9;
  id v18 = v10;
  uint64_t v19 = &v27;
  id v20 = &v21;
  _FEFocusEnvironmentEnumerateAncestorEnvironments(v7, v17);
  uint64_t v11 = v28[5];
  if (v11)
  {
    [(_UIDeepestPreferredEnvironmentSearch *)self _reportDidFindOverridingPreferredFocusEnvironment:v11 source:v22[5]];
    uint64_t v12 = (void *)v28[5];
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (void)_reportStartingSearch
{
  id v3 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];
  v2 = +[_FEDebugLogMessage messageWithString:@"Starting preferred focus search."];
  [v3 addMessage:v2];
}

- (void)_reportFoundFocusableItem:(id)a3 inContext:(id)a4
{
  objc_msgSend(a4, "debugStack", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = +[_FEDebugLogMessage messageWithStyle:2 string:@"It's focusable!"];
  [v5 addMessage:v4];
}

- (void)_reportFinishedEvaluatingAllPreferencesForEnvironmentInContext:(id)a3 result:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 debugStack];
  if (v6)
  {
    id v7 = (void *)v6;
    char v8 = [v5 isPreferredByItself];

    if (a4 != 3 && (v8 & 1) == 0)
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      v9 = [v5 preferredEnvironments];
      id v10 = [v5 environment];
      uint64_t v11 = [v9 indexOfObject:v10];

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [v5 preferredEnvironments];
        uint64_t v13 = [v12 count];

        v14 = [v5 preferredEnvironments];
        v15 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v11 + 1, v13 - (v11 + 1));
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __110___UIDeepestPreferredEnvironmentSearch__reportFinishedEvaluatingAllPreferencesForEnvironmentInContext_result___block_invoke;
        v18[3] = &unk_265328460;
        id v19 = v5;
        id v20 = &v21;
        [v14 enumerateObjectsAtIndexes:v15 options:0 usingBlock:v18];
      }
      if (*((unsigned char *)v22 + 24))
      {
        id v16 = [v5 debugStack];
        id v17 = +[_FEDebugLogMessage messageWithStyle:3 string:@"Found nothing."];
        [v16 addMessage:v17];
      }
      _Block_object_dispose(&v21, 8);
    }
  }
}

- (void)_reportDidFinishEnumeratingPreferencesWithDeepestPreferredFocusableItem:(id)a3
{
  id v14 = a3;
  v4 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];

  if (v4)
  {
    id v5 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];
    uint64_t v6 = NSString;
    id v7 = v14;
    if (v7)
    {
      char v8 = NSString;
      v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      uint64_t v11 = [v8 stringWithFormat:@"<%@: %p>", v10, v7];
    }
    else
    {
      uint64_t v11 = @"(nil)";
    }

    uint64_t v12 = [v6 stringWithFormat:@"Finished enumerating preferred environments. Preferring %@", v11];
    uint64_t v13 = +[_FEDebugLogMessage messageWithStyle:2 string:v12];
    [v5 addMessage:v13];
  }
}

- (void)_reportDidFindOverridingPreferredFocusEnvironment:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];
  v9 = NSString;
  id v10 = v6;
  id v22 = v10;
  if (v10)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    id v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v22];

    id v10 = v22;
  }
  else
  {
    id v14 = @"(nil)";
  }

  id v15 = v7;
  if (v15)
  {
    id v16 = NSString;
    id v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    id v19 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
  }
  else
  {
    id v19 = @"(nil)";
  }

  id v20 = [v9 stringWithFormat:@"Found overide to environment %@. (source: %@)", v14, v19];
  uint64_t v21 = +[_FEDebugLogMessage messageWithStyle:2 string:v20];
  [v8 addMessage:v21];
}

- (void)_reportDidFindLockedFocusEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDeepestPreferredEnvironmentSearch *)self debugLog];
  id v6 = NSString;
  id v13 = v4;
  if (v13)
  {
    id v7 = NSString;
    char v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = [v7 stringWithFormat:@"<%@: %p>", v9, v13];
  }
  else
  {
    id v10 = @"(nil)";
  }

  uint64_t v11 = [v6 stringWithFormat:@"Found locked focus environment %@.", v10];
  uint64_t v12 = +[_FEDebugLogMessage messageWithStyle:3 string:v11];
  [v5 addMessage:v12];
}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return self->_allowsOverridingPreferedFocusEnvironments;
}

- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3
{
  self->_allowsOverridingPreferedFocusEnvironments = a3;
}

- (_FEDebugLogNode)debugLog
{
  return self->_debugLog;
}

- (void)setDebugLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
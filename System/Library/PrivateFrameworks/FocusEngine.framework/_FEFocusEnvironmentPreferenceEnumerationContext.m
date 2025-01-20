@interface _FEFocusEnvironmentPreferenceEnumerationContext
- (BOOL)_isAllowedToPreferEnvironment:(id)a3;
- (BOOL)isInPreferredSubtree;
- (BOOL)isLeafPreference;
- (BOOL)isPreferredByItself;
- (BOOL)isPrimaryPreference;
- (BOOL)prefersNothingFocused;
- (NSArray)preferredEnvironments;
- (_FEDebugLogStack)debugStack;
- (_FEFocusEnvironment)environment;
- (_FEFocusEnvironment)preferringEnvironment;
- (_FEFocusEnvironmentPreferenceEnumerationContext)init;
- (_FEFocusEnvironmentPreferenceEnumerationContext)initWithFocusEnvironment:(id)a3 enumerationMode:(int64_t)a4;
- (_FEFocusEnvironmentPreferenceEnumerationContextDelegate)delegate;
- (id)_inferPreferencesForEnvironment:(id)a3;
- (id)_startLogging;
- (void)_invalidatePreferredEnvironments;
- (void)_reportInferredPreferredFocusEnvironment:(id)a3;
- (void)_resolvePreferredFocusEnvironments;
- (void)_stopLogging;
- (void)popEnvironment;
- (void)pushEnvironment:(id)a3;
- (void)setDebugStack:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation _FEFocusEnvironmentPreferenceEnumerationContext

- (_FEFocusEnvironmentPreferenceEnumerationContext)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_FEFocusEnvironmentPreferenceEnumerator.m" lineNumber:74 description:@"-init is not a valid initializer for this class. Use -initWithFocusEnvironment:enumerationMode: instead."];

  return 0;
}

- (_FEFocusEnvironmentPreferenceEnumerationContext)initWithFocusEnvironment:(id)a3 enumerationMode:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_FEFocusEnvironmentPreferenceEnumerator.m", 80, @"Invalid parameter not satisfying: %@", @"focusEnvironment" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)_FEFocusEnvironmentPreferenceEnumerationContext;
  v8 = [(_FEFocusEnvironmentPreferenceEnumerationContext *)&v31 init];
  if (v8)
  {
    if (a4)
    {
      v9 = objc_opt_new();
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__0;
      v29 = __Block_byref_object_dispose__0;
      id v30 = 0;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __92___FEFocusEnvironmentPreferenceEnumerationContext_initWithFocusEnvironment_enumerationMode___block_invoke;
      v22[3] = &unk_265328298;
      id v10 = v9;
      id v23 = v10;
      v24 = &v25;
      _FEFocusEnvironmentEnumerateAncestorEnvironments(v7, v22);
      objc_storeStrong((id *)&v8->_preferredEnvironmentsMap, v9);
      id v11 = (id)v26[5];
      if (v11 && v11 != v7)
      {
        preferredSubtree = v8->_preferredSubtree;
        v8->_preferredSubtree = (_FEFocusEnvironment *)v7;
        id v13 = v7;

        id v7 = (id)v26[5];
      }

      _Block_object_dispose(&v25, 8);
    }
    objc_storeStrong((id *)&v8->_environment, v7);
    uint64_t v14 = +[_FEFocusSystem focusSystemForEnvironment:v7];
    focusSystem = v8->_focusSystem;
    v8->_focusSystem = (_FEFocusSystem *)v14;

    objc_storeStrong((id *)&v8->_lastPrimaryPreferredEnvironment, v7);
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v7, 0);
    visitedEnvironmentStack = v8->_visitedEnvironmentStack;
    v8->_visitedEnvironmentStack = (NSMutableArray *)v16;

    v8->_hasNeverPoppedInPreferredSubtree = 1;
    uint64_t v18 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    allVisitedEnvironments = v8->_allVisitedEnvironments;
    v8->_allVisitedEnvironments = (NSHashTable *)v18;

    [(NSHashTable *)v8->_allVisitedEnvironments addObject:v7];
  }

  return v8;
}

- (BOOL)isPrimaryPreference
{
  return self->_environment == self->_lastPrimaryPreferredEnvironment;
}

- (BOOL)isLeafPreference
{
  v2 = [(_FEFocusEnvironmentPreferenceEnumerationContext *)self preferredEnvironments];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isPreferredByItself
{
  environment = self->_environment;
  BOOL v3 = [(_FEFocusEnvironmentPreferenceEnumerationContext *)self preferringEnvironment];
  LOBYTE(environment) = environment == v3;

  return (char)environment;
}

- (_FEFocusEnvironment)preferringEnvironment
{
  v2 = self->_visitedEnvironmentStack;
  unint64_t v3 = [(NSMutableArray *)v2 count];
  if (v3 < 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSMutableArray *)v2 objectAtIndex:v3 - 2];
  }

  return (_FEFocusEnvironment *)v4;
}

- (BOOL)isInPreferredSubtree
{
  return !self->_preferredSubtree || self->_preferredSubtreeEntryPoint != 0;
}

- (NSArray)preferredEnvironments
{
  if (!self->_hasResolvedPreferredFocusEnvironments) {
    [(_FEFocusEnvironmentPreferenceEnumerationContext *)self _resolvePreferredFocusEnvironments];
  }
  cachedPreferredEnvironments = self->_cachedPreferredEnvironments;
  return cachedPreferredEnvironments;
}

- (BOOL)prefersNothingFocused
{
  return 0;
}

- (void)_invalidatePreferredEnvironments
{
  cachedPreferredEnvironments = self->_cachedPreferredEnvironments;
  self->_cachedPreferredEnvironments = 0;

  self->_cachedPrefersNothingFocused = 0;
  self->_hasResolvedPreferredFocusEnvironments = 0;
}

- (void)_resolvePreferredFocusEnvironments
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(_FEFocusEnvironmentPreferenceEnumerationContext *)self isPreferredByItself])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = WeakRetained;
    if (WeakRetained
      && ![WeakRetained _shouldInferDefaultPreferenceForEnvironmentInContext:self])
    {
      v5 = 0;
    }
    else
    {
      v5 = [(_FEFocusEnvironmentPreferenceEnumerationContext *)self _inferPreferencesForEnvironment:self->_environment];
    }
    if (v5) {
      v15 = v5;
    }
    else {
      v15 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&self->_cachedPreferredEnvironments, v15);
    self->_cachedPrefersNothingFocused = 0;
  }
  else
  {
    BOOL v29 = 0;
    v6 = [(NSMapTable *)self->_preferredEnvironmentsMap objectForKey:self->_environment];
    id v7 = (void *)[v6 mutableCopy];

    if (!v7)
    {
      v8 = _FEFocusEnvironmentEffectivePreferredFocusEnvironments(self->_environment, &v29);
      id v7 = (void *)[v8 mutableCopy];
    }
    if ([(NSMutableArray *)self->_visitedEnvironmentStack count] == 1)
    {
      v9 = self->_environment;
      id v10 = +[_FEFocusSystem focusSystemForEnvironment:v9];
      id v11 = [v10 _topEnvironment];
      v12 = v11;
      id v13 = 0;
      if (v11 && v11 != v10)
      {
        if (!_FEFocusEnvironmentIsAncestorOfEnvironment(v9, v11)
          || ([v10 focusedItem],
              uint64_t v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              v14 == v12))
        {
          id v13 = 0;
        }
        else
        {
          id v13 = v12;
        }
      }

      if (v13
        && v13 != self->_environment
        && [(_FEFocusEnvironmentPreferenceEnumerationContext *)self _isAllowedToPreferEnvironment:v13])
      {
        [v7 insertObject:v13 atIndex:0];
      }
    }
    if (self->_preferredSubtree && [(NSMutableArray *)self->_visitedEnvironmentStack count] == 1) {
      [v7 addObject:self->_preferredSubtree];
    }
    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if (-[_FEFocusEnvironmentPreferenceEnumerationContext _isAllowedToPreferEnvironment:](self, "_isAllowedToPreferEnvironment:", v22, (void)v25))
          {
            [v16 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v19);
    }

    id v23 = (NSArray *)[v16 copy];
    cachedPreferredEnvironments = self->_cachedPreferredEnvironments;
    self->_cachedPreferredEnvironments = v23;

    self->_cachedPrefersNothingFocused = v29;
  }
  self->_hasResolvedPreferredFocusEnvironments = 1;
}

- (id)_inferPreferencesForEnvironment:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self->_focusSystem;
  if (!v5)
  {
    id v10 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_13;
  }
  v6 = _FEFocusEnvironmentPreferredFocusMapContainer(v4);
  if (v6)
  {
    id v7 = [[_FEFocusMap alloc] initWithFocusSystem:v5 rootContainer:v6 coordinateSpace:0 searchInfo:0 ignoresRootContainerClippingRect:0];
    uint64_t v8 = [(_FEFocusMap *)v7 _inferredDefaultFocusItemInEnvironment:v4];
    v9 = (void *)v8;
    if (v8)
    {
      if ((id)v8 != v4
        && [(_FEFocusEnvironmentPreferenceEnumerationContext *)self _isAllowedToPreferEnvironment:v8])
      {
        [(_FEFocusEnvironmentPreferenceEnumerationContext *)self _reportInferredPreferredFocusEnvironment:v9];
        v12[0] = v9;
        id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      [(_FEFocusEnvironmentPreferenceEnumerationContext *)self _reportInferredPreferredFocusEnvironment:0];
    }
    id v10 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_11;
  }
  id v10 = (void *)MEMORY[0x263EFFA68];
LABEL_12:

LABEL_13:
  return v10;
}

- (BOOL)_isAllowedToPreferEnvironment:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (_FEFocusEnvironment *)a3;
  if (self->_environment == v4)
  {
    LODWORD(v5) = ![(_FEFocusEnvironmentPreferenceEnumerationContext *)self isPreferredByItself];
  }
  else if ([(NSMutableArray *)self->_visitedEnvironmentStack containsObject:v4])
  {
    v5 = logger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      environment = self->_environment;
      if (environment)
      {
        v9 = NSString;
        id v10 = environment;
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        uint64_t v8 = [v9 stringWithFormat:@"<%@: %p>", v12, v10];
      }
      else
      {
        uint64_t v8 = @"(nil)";
      }
      id v13 = v8;
      uint64_t v14 = v4;
      if (v14)
      {
        id v16 = NSString;
        id v17 = (objc_class *)objc_opt_class();
        uint64_t v18 = NSStringFromClass(v17);
        v15 = [v16 stringWithFormat:@"<%@: %p>", v18, v14];
      }
      else
      {
        v15 = @"(nil)";
      }

      visitedEnvironmentStack = self->_visitedEnvironmentStack;
      *(_DWORD *)buf = 138412802;
      v21 = v13;
      __int16 v22 = 2112;
      id v23 = v15;
      __int16 v24 = 2112;
      long long v25 = visitedEnvironmentStack;
      _os_log_error_impl(&dword_24F3F0000, v5, OS_LOG_TYPE_ERROR, "Loop in preferred focus environment chain. %@ prefers %@, which is already on the stack: %@", buf, 0x20u);
    }
    LOBYTE(v5) = 0;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return (char)v5;
}

- (void)pushEnvironment:(id)a3
{
  v6 = (_FEFocusEnvironment *)a3;
  uint64_t v18 = v6;
  if (!v6)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_FEFocusEnvironmentPreferenceEnumerator.m", 352, @"Invalid parameter not satisfying: %@", @"environment" object file lineNumber description];

    v6 = 0;
  }
  if (self->_environment != v6)
  {
    objc_storeStrong((id *)&self->_environment, a3);
    if (self->_hasNeverPoppedInPreferredSubtree) {
      objc_storeStrong((id *)&self->_lastPrimaryPreferredEnvironment, a3);
    }
    preferredSubtree = self->_preferredSubtree;
    v6 = v18;
    if (preferredSubtree)
    {
      if (!self->_preferredSubtreeEntryPoint)
      {
        _FEFocusEnvironmentFirstCommonAncestor(preferredSubtree, v18);
        uint64_t v8 = (_FEFocusEnvironment *)objc_claimAutoreleasedReturnValue();
        v9 = self->_preferredSubtree;

        v6 = v18;
        if (v8 == v9)
        {
          objc_storeStrong((id *)&self->_preferredSubtreeEntryPoint, a3);
          v6 = v18;
        }
      }
    }
  }
  if (self->_debugStack)
  {
    id v10 = [(NSMutableArray *)self->_visitedEnvironmentStack lastObject];

    v6 = v18;
    if (v10 != v18)
    {
      id v11 = v18;
      if (v18)
      {
        v12 = NSString;
        id v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];
      }
      else
      {
        v15 = @"(nil)";
      }

      id v16 = +[_FEDebugLogMessage messageWithString:v15];

      [(_FEDebugLogStack *)self->_debugStack pushNode:v16];
      v6 = v18;
    }
  }
  [(NSMutableArray *)self->_visitedEnvironmentStack addObject:v6];
  [(NSHashTable *)self->_allVisitedEnvironments addObject:v18];
  [(_FEFocusEnvironmentPreferenceEnumerationContext *)self _invalidatePreferredEnvironments];
}

- (void)popEnvironment
{
  if ([(NSMutableArray *)self->_visitedEnvironmentStack count] != 1)
  {
    uint64_t v8 = [(NSMutableArray *)self->_visitedEnvironmentStack lastObject];
    [(NSMutableArray *)self->_visitedEnvironmentStack removeLastObject];
    unint64_t v3 = [(NSMutableArray *)self->_visitedEnvironmentStack lastObject];

    if (v3 != v8) {
      id v4 = [(_FEDebugLogStack *)self->_debugStack popNode];
    }
    v5 = [(NSMutableArray *)self->_visitedEnvironmentStack lastObject];
    environment = self->_environment;
    self->_environment = v5;

    [(_FEFocusEnvironmentPreferenceEnumerationContext *)self _invalidatePreferredEnvironments];
    if ([(_FEFocusEnvironmentPreferenceEnumerationContext *)self isInPreferredSubtree]) {
      self->_hasNeverPoppedInPreferredSubtree = 0;
    }
    id v7 = v8;
    if (self->_preferredSubtree && self->_preferredSubtreeEntryPoint == v8)
    {
      self->_preferredSubtreeEntryPoint = 0;

      id v7 = v8;
    }
  }
}

- (id)_startLogging
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_debugStack)
  {
    uint64_t v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"_FEFocusEnvironmentPreferenceEnumerator.m" lineNumber:419 description:@"Logging already in progress. Starting to log again would cause an undefined state."];
  }
  unint64_t v3 = (_FEDebugLogStack *)objc_opt_new();
  debugStack = self->_debugStack;
  self->_debugStack = v3;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_visitedEnvironmentStack;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        if (v10)
        {
          id v11 = NSString;
          id v12 = v10;
          id v13 = (objc_class *)objc_opt_class();
          uint64_t v14 = NSStringFromClass(v13);
          v15 = [v11 stringWithFormat:@"<%@: %p>", v14, v12, (void)v21];
        }
        else
        {
          v15 = @"(nil)";
        }
        id v16 = +[_FEDebugLogMessage messageWithString:v15];

        [(_FEDebugLogStack *)self->_debugStack pushNode:v16];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  id v17 = [(_FEDebugLogStack *)self->_debugStack rootNode];
  return v17;
}

- (void)_stopLogging
{
  self->_debugStack = 0;
  MEMORY[0x270F9A758]();
}

- (void)_reportInferredPreferredFocusEnvironment:(id)a3
{
  id v4 = a3;
  debugStack = self->_debugStack;
  if (debugStack)
  {
    id v14 = v4;
    uint64_t v6 = +[_FEDebugLogMessage messageWithString:@"No more preferred environments. Trying to infer environment from visual layout..."];
    [(_FEDebugLogStack *)debugStack addMessage:v6];

    uint64_t v7 = self->_debugStack;
    if (v14)
    {
      uint64_t v8 = NSString;
      id v9 = v14;
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = [v8 stringWithFormat:@"<%@: %p>", v11, v9];

      id v13 = +[_FEDebugLogMessage messageWithFormat:@"Found environment: %@", v12];
      [(_FEDebugLogStack *)v7 addMessage:v13];
    }
    else
    {
      id v12 = +[_FEDebugLogMessage messageWithStyle:3 string:@"No focusable items found."];
      [(_FEDebugLogStack *)v7 addMessage:v12];
    }

    id v4 = v14;
  }
}

- (_FEFocusEnvironment)environment
{
  return self->_environment;
}

- (_FEFocusEnvironmentPreferenceEnumerationContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_FEFocusEnvironmentPreferenceEnumerationContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_FEDebugLogStack)debugStack
{
  return self->_debugStack;
}

- (void)setDebugStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugStack, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_preferredEnvironmentsMap, 0);
  objc_storeStrong((id *)&self->_preferredSubtreeEntryPoint, 0);
  objc_storeStrong((id *)&self->_allVisitedEnvironments, 0);
  objc_storeStrong((id *)&self->_cachedPreferredEnvironments, 0);
  objc_storeStrong((id *)&self->_lastPrimaryPreferredEnvironment, 0);
  objc_storeStrong((id *)&self->_visitedEnvironmentStack, 0);
  objc_storeStrong((id *)&self->_preferredSubtree, 0);
  objc_storeStrong((id *)&self->_focusSystem, 0);
}

@end